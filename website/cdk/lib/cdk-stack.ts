import * as cdk from 'aws-cdk-lib/core';
import { Construct } from 'constructs';
import * as s3 from 'aws-cdk-lib/aws-s3';
import * as s3deploy from 'aws-cdk-lib/aws-s3-deployment';
import * as cloudfront from 'aws-cdk-lib/aws-cloudfront';
import * as origins from 'aws-cdk-lib/aws-cloudfront-origins';
import * as acm from 'aws-cdk-lib/aws-certificatemanager';
import * as route53 from 'aws-cdk-lib/aws-route53';
import * as targets from 'aws-cdk-lib/aws-route53-targets';

const DOMAIN_NAME = 'pong-me.anystupididea.com';
const HOSTED_ZONE_ID = 'Z6ED78QGBFL6M';
const WILDCARD_CERT_ARN = 'arn:aws:acm:us-east-1:862066558306:certificate/9c56f9e7-4adc-4d6b-8f6c-577022335242';

export class CdkStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    // S3 bucket for static site content
    const siteBucket = new s3.Bucket(this, 'SiteBucket', {
      bucketName: DOMAIN_NAME,
      removalPolicy: cdk.RemovalPolicy.DESTROY,
      autoDeleteObjects: true,
      blockPublicAccess: s3.BlockPublicAccess.BLOCK_ALL,
    });

    // Reference the existing wildcard certificate
    const certificate = acm.Certificate.fromCertificateArn(
      this, 'WildcardCert', WILDCARD_CERT_ARN,
    );

    // CloudFront distribution
    const distribution = new cloudfront.Distribution(this, 'SiteDistribution', {
      defaultBehavior: {
        origin: origins.S3BucketOrigin.withOriginAccessControl(siteBucket),
        viewerProtocolPolicy: cloudfront.ViewerProtocolPolicy.REDIRECT_TO_HTTPS,
      },
      domainNames: [DOMAIN_NAME],
      certificate,
      defaultRootObject: 'index.html',
      errorResponses: [
        {
          httpStatus: 404,
          responsePagePath: '/index.html',
          responseHttpStatus: 200,
        },
      ],
    });

    // Reference the existing hosted zone
    const hostedZone = route53.HostedZone.fromHostedZoneAttributes(this, 'Zone', {
      hostedZoneId: HOSTED_ZONE_ID,
      zoneName: 'anystupididea.com',
    });

    // DNS record pointing to CloudFront
    new route53.ARecord(this, 'SiteAliasRecord', {
      zone: hostedZone,
      recordName: DOMAIN_NAME,
      target: route53.RecordTarget.fromAlias(
        new targets.CloudFrontTarget(distribution),
      ),
    });

    // Deploy site content to S3 (prune: false so DMG uploads are preserved)
    new s3deploy.BucketDeployment(this, 'DeploySite', {
      sources: [s3deploy.Source.asset('../', { exclude: ['cdk', 'cdk/**'] })],
      destinationBucket: siteBucket,
      distribution,
      distributionPaths: ['/*'],
      prune: false,
    });

    // Outputs
    new cdk.CfnOutput(this, 'SiteUrl', { value: `https://${DOMAIN_NAME}` });
    new cdk.CfnOutput(this, 'DistributionId', { value: distribution.distributionId });
  }
}

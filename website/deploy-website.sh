#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CDK_DIR="$SCRIPT_DIR/cdk"

echo "=== Deploying Pong Me website ==="

cd "$CDK_DIR"

echo "Installing CDK dependencies..."
npm ci --silent

echo "Synthesizing stack..."
npx cdk synth --quiet

echo "Deploying stack..."
npx cdk deploy --require-approval never

# Get the CloudFront distribution ID from stack outputs
DIST_ID=$(aws cloudformation describe-stacks \
  --stack-name PongMeWebsiteStack \
  --query "Stacks[0].Outputs[?OutputKey=='DistributionId'].OutputValue" \
  --output text)

echo "Invalidating CloudFront cache (distribution: $DIST_ID)..."
aws cloudfront create-invalidation \
  --distribution-id "$DIST_ID" \
  --paths "/*" \
  --query "Invalidation.Id" \
  --output text

echo "=== Done! Site live at https://pong-me.anystupididea.com ==="

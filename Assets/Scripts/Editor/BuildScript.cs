using UnityEditor;
using UnityEngine;

public class BuildScript
{
    [MenuItem("Build/Build Mac")]
    public static void BuildMac()
    {
        Build("Build/Mac/PongMe.app", BuildTarget.StandaloneOSX);
    }

    [MenuItem("Build/Build Windows")]
    public static void BuildWindows()
    {
        Build("Build/Windows/PongMe.exe", BuildTarget.StandaloneWindows64);
    }

    [MenuItem("Build/Build Web")]
    public static void BuildWeb()
    {
        // Force compression off so the deploy workflow doesn't have to set
        // Content-Encoding headers per file. Slightly larger over the wire,
        // but vastly simpler to host on plain S3 + CloudFront.
        PlayerSettings.WebGL.compressionFormat = WebGLCompressionFormat.Disabled;

        // Use our custom WebGL template at Assets/WebGLTemplates/PongMe.
        // The default template centers the canvas with translate(-50%, -50%),
        // which clips the top of the canvas when the drawing buffer is taller
        // than the available viewport. Our template uses max-width/max-height
        // letterboxing instead.
        PlayerSettings.WebGL.template = "PROJECT:PongMe";

        Build("Build/Web", BuildTarget.WebGL);
    }

    [MenuItem("Build/Build iOS")]
    public static void BuildIOS()
    {
        Build("Build/iOS", BuildTarget.iOS);
    }

    /// <summary>
    /// Builds Mac, Windows, Web, and iOS in sequence so a single click produces
    /// every release artifact in one shot. Stops if any individual build fails.
    ///
    /// IMPORTANT — what "Build All" actually does (and doesn't do):
    /// - Mac: produces a ready-to-ship .app at Build/Mac/PongMe.app. The
    ///   release-macos.yml workflow handles signing/notarization/DMG on tag.
    /// - Windows: produces a ready-to-ship folder at Build/Windows/. The
    ///   release-windows.yml workflow zips and uploads on tag.
    /// - Web: produces a ready-to-deploy folder at Build/Web/. The
    ///   release-web.yml workflow syncs to s3://.../play/ on tag.
    /// - iOS: produces an *Xcode project* at Build/iOS/, NOT a final .ipa.
    ///   Shipping iOS still requires manual Xcode steps (open project, set
    ///   signing team, archive, validate, upload to App Store Connect /
    ///   TestFlight). There is no GitHub Action for iOS — it's a manual flow.
    ///   See README.md "Build for iOS" for the full checklist.
    ///
    /// Each platform switch can take a few minutes the first time as Unity
    /// reimports assets for the new target. Realistic total runtime: 15–30
    /// minutes for a cold full build. Go grab a meal.
    /// </summary>
    [MenuItem("Build/Build All (Mac + Windows + Web + iOS)")]
    public static void BuildAll()
    {
        Debug.Log("[BuildAll] Starting Mac build...");
        BuildMac();
        Debug.Log("[BuildAll] Mac build complete.");

        Debug.Log("[BuildAll] Starting Windows build...");
        BuildWindows();
        Debug.Log("[BuildAll] Windows build complete.");

        Debug.Log("[BuildAll] Starting Web build...");
        BuildWeb();
        Debug.Log("[BuildAll] Web build complete.");

        Debug.Log("[BuildAll] Starting iOS build (Xcode project — manual Xcode steps still required to ship)...");
        BuildIOS();
        Debug.Log("[BuildAll] iOS Xcode project generated at Build/iOS/.");

        Debug.Log("[BuildAll] All four targets built. Mac/Windows/Web are ready to commit and tag. iOS still needs Xcode follow-up — see README.md 'Build for iOS' section.");
    }

    static void Build(string path, BuildTarget target)
    {
        string[] scenes = GetBuildScenes();
        if (scenes.Length == 0)
        {
            Debug.LogError("No scenes found in build settings or Assets/Scenes/");
            return;
        }

        BuildPlayerOptions options = new BuildPlayerOptions
        {
            scenes = scenes,
            locationPathName = path,
            target = target,
            options = BuildOptions.None
        };

        var report = BuildPipeline.BuildPlayer(options);
        if (report.summary.result == UnityEditor.Build.Reporting.BuildResult.Succeeded)
            Debug.Log("Build succeeded: " + path);
        else
            Debug.LogError("Build failed");
    }

    static string[] GetBuildScenes()
    {
        // Use scenes from build settings if configured
        var buildSettingsScenes = EditorBuildSettings.scenes;
        if (buildSettingsScenes.Length > 0)
        {
            var paths = new System.Collections.Generic.List<string>();
            foreach (var s in buildSettingsScenes)
            {
                if (s.enabled)
                    paths.Add(s.path);
            }
            if (paths.Count > 0) return paths.ToArray();
        }

        // Fall back to finding scene files
        string[] guids = AssetDatabase.FindAssets("t:Scene", new[] { "Assets/Scenes" });
        string[] scenePaths = new string[guids.Length];
        for (int i = 0; i < guids.Length; i++)
            scenePaths[i] = AssetDatabase.GUIDToAssetPath(guids[i]);
        return scenePaths;
    }
}

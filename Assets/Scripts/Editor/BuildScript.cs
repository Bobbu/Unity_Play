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

    [MenuItem("Build/Build iOS")]
    public static void BuildIOS()
    {
        Build("Build/iOS", BuildTarget.iOS);
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

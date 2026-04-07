using UnityEngine;

/// <summary>
/// Attach to a RectTransform (e.g. a panel inside the Canvas) to constrain
/// its edges to the device's safe area, avoiding notches and rounded corners.
/// </summary>
public class SafeAreaHandler : MonoBehaviour
{
    private RectTransform rt;
    private Rect lastSafeArea;

    void Awake()
    {
        rt = GetComponent<RectTransform>();
        ApplySafeArea();
    }

    void Update()
    {
#if !UNITY_WEBGL
        if (Screen.safeArea != lastSafeArea)
            ApplySafeArea();
#endif
    }

    void ApplySafeArea()
    {
#if UNITY_WEBGL
        // Browsers have no notion of safe area (no notch, no Dynamic Island,
        // no rounded corners), and Unity's Screen.safeArea can return values
        // that don't agree with Screen.width/height in WebGL — likely a
        // device-pixel vs CSS-pixel mismatch — pushing top-anchored UI above
        // the visible canvas. Just use the full canvas on web.
        rt.anchorMin = Vector2.zero;
        rt.anchorMax = Vector2.one;
        return;
#else
        Rect safeArea = Screen.safeArea;
        lastSafeArea = safeArea;

        Vector2 anchorMin = safeArea.position;
        Vector2 anchorMax = safeArea.position + safeArea.size;

        anchorMin.x /= Screen.width;
        anchorMin.y /= Screen.height;
        anchorMax.x /= Screen.width;
        anchorMax.y /= Screen.height;

        rt.anchorMin = anchorMin;
        rt.anchorMax = anchorMax;
#endif
    }
}

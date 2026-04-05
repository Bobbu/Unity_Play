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
        if (Screen.safeArea != lastSafeArea)
            ApplySafeArea();
    }

    void ApplySafeArea()
    {
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
    }
}

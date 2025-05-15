using UnityEngine;

public class FlashLightController : MonoBehaviour
{
    [Header("Flashlight References")]
    [Tooltip("Reference to the Light component")]
    [SerializeField] private Light flashlightLight;

    [Header("Audio Settings")]
    [Tooltip("Sound played when turning the flashlight on")]
    [SerializeField] private AudioClip turnOnSound;

    [Tooltip("Sound played when turning the flashlight off")]
    [SerializeField] private AudioClip turnOffSound;

    [Tooltip("Volume for the flashlight sounds")]
    [Range(0f, 1f)]
    [SerializeField] private float volume = 0.5f;

    [Header("Control Settings")]
    [Tooltip("Key used to toggle the flashlight")]
    [SerializeField] private KeyCode toggleKey = KeyCode.F;
    private AudioSource audioSource;
    private bool isOn = false;

    private void Awake()
    {
        audioSource = GetComponent<AudioSource>();
        if (audioSource == null)
        {
            audioSource = gameObject.AddComponent<AudioSource>();
            audioSource.playOnAwake = false;
            audioSource.spatialBlend = 1.0f;
        }
        if (flashlightLight == null)
        {
            flashlightLight = GetComponentInChildren<Light>();

            if (flashlightLight == null)
            {
                Debug.LogError("No Light component found! Please assign a Light in the inspector.");
            }
        }
        isOn = flashlightLight.enabled;
    }

    private void Start()
    {
        if (flashlightLight != null)
        {
            flashlightLight.enabled = isOn;
        }
    }

    private void Update()
    {
        if (Input.GetKeyDown(toggleKey))
        {
            ToggleFlashlight();
        }
    }
    public void ToggleFlashlight()
    {
        if (flashlightLight == null) return;
        isOn = !isOn;
        flashlightLight.enabled = isOn;
        if (audioSource != null)
        {
            AudioClip clipToPlay = isOn ? turnOnSound : turnOffSound;
            if (clipToPlay != null)
            {
                audioSource.volume = volume;
                audioSource.PlayOneShot(clipToPlay);
            }
        }
    }
    public void SetFlashlightState(bool state)
    {
        if (isOn != state)
        {
            ToggleFlashlight();
        }
    }
}
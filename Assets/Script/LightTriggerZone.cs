using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class LightTriggerZone : MonoBehaviour
{
    [Header("References")]
    [Tooltip("Assign this if you want specific lights to be affected. Leave empty to affect all lights in the scene.")]
    [SerializeField] private List<Light> lightsToAffect;

    [Header("Audio")]
    [Tooltip("Audio source to play when lights turn off")]
    [SerializeField] private AudioSource audioSource;

    [Tooltip("Audio clip to play when lights turn off")]
    [SerializeField] private AudioClip lightsOffSound;
    [SerializeField] private AudioClip ambientMusic;

    [Header("Settings")]
    [Tooltip("Time in seconds to fade the lights")]
    [SerializeField] private float fadeTime = 1.0f;

    [Tooltip("Tag of the object that will trigger the lights")]
    [SerializeField] private string playerTag = "Player";

    [Tooltip("Only trigger once?")]
    [SerializeField] private bool triggerOnce = true;


    private Dictionary<Light, float> originalIntensities = new Dictionary<Light, float>();

    private bool hasBeenTriggered = false;

    // Track active coroutines to stop them if needed
    private List<Coroutine> activeCoroutines = new List<Coroutine>();
    [SerializeField] private GameObject redLight;
    [SerializeField] private GameObject radio;
    [SerializeField] private GameObject kidCrySource;
    [SerializeField] private GameObject kidCryStopTrigger;
    private void Start()
    {
        // If no specific lights are assigned, find all lights in the scene
        if (lightsToAffect == null || lightsToAffect.Count == 0)
        {
            lightsToAffect = new List<Light>(FindObjectsOfType<Light>());
        }

        // Store the original intensities
        foreach (Light light in lightsToAffect)
        {
            if (light != null)
            {
                originalIntensities[light] = light.intensity;
            }
        }

        // If no AudioSource is assigned but there's a sound clip, add an AudioSource component
        if (audioSource == null && lightsOffSound != null)
        {
            audioSource = gameObject.AddComponent<AudioSource>();
            audioSource.playOnAwake = false;
            audioSource.clip = lightsOffSound;
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag(playerTag))
        {
            if (!hasBeenTriggered || !triggerOnce)
            {
                TurnOffLights();
                audioSource.PlayOneShot(ambientMusic);
                radio.gameObject.SetActive(true);
                kidCrySource.gameObject.SetActive(true);
                kidCryStopTrigger.gameObject.SetActive(true);
                redLight.SetActive(true);
                hasBeenTriggered = true;
            }
        }
    }
    private void TurnOffLights()
    {
        StopAllFadeCoroutines();

        foreach (Light light in lightsToAffect)
        {
            if (light != null)
            {
                float startIntensity = light.intensity;
                Coroutine fadeCoroutine = StartCoroutine(FadeLightIntensity(light, startIntensity, 0f));
                activeCoroutines.Add(fadeCoroutine);
            }
        }
        if (audioSource != null && lightsOffSound != null)
        {
            audioSource.PlayOneShot(lightsOffSound);
        }
    }

    private IEnumerator FadeLightIntensity(Light light, float startIntensity, float targetIntensity)
    {
        float elapsedTime = 0f;

        while (elapsedTime < fadeTime)
        {
            if (light != null)
            {
                light.intensity = Mathf.Lerp(startIntensity, targetIntensity, elapsedTime / fadeTime);
            }

            elapsedTime += Time.deltaTime;
            yield return null;
        }

        // Ensure final value is set
        if (light != null)
        {
            light.intensity = targetIntensity;
        }
    }

    private void StopAllFadeCoroutines()
    {
        foreach (Coroutine coroutine in activeCoroutines)
        {
            if (coroutine != null)
            {
                StopCoroutine(coroutine);
            }
        }

        activeCoroutines.Clear();
    }

    // Public method to manually trigger lights off effect
    public void TriggerLightsOff()
    {
        if (!hasBeenTriggered || !triggerOnce)
        {
            TurnOffLights();
            hasBeenTriggered = true;
        }
    }
}
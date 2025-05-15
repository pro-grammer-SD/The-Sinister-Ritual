using UnityEngine;
using System.Collections;

public class DoorController : MonoBehaviour
{
    private Animator doorAnim;
    private bool doorOpen = false;

    [Header("Sound Effects")]
    [SerializeField] private AudioClip openSound;
    [SerializeField] private AudioClip closeSound;
    [SerializeField] private float closeDelayTime = 0.75f;
    private AudioSource audioSource;

    private void Awake()
    {
        doorAnim = GetComponent<Animator>();
        audioSource = GetComponent<AudioSource>();
        if (audioSource == null)
        {
            audioSource = gameObject.AddComponent<AudioSource>();
        }
        audioSource.playOnAwake = false;
        audioSource.spatialBlend = 1.0f; 
        audioSource.rolloffMode = AudioRolloffMode.Linear;
        audioSource.maxDistance = 20f;
    }

    public void PlayAnimation()
    {
        if (!doorOpen)
        {
            doorAnim.Play("DoorOpen", 0, 0f);
            PlaySound(openSound);
            doorOpen = true;
        }
        else
        {
            doorAnim.Play("DoorClose", 0, 0f);
            StartCoroutine(PlaySoundWithDelay(closeSound, closeDelayTime));
            doorOpen = false;
        }
    }

    private void PlaySound(AudioClip clip)
    {
        if (audioSource != null && clip != null)
        {
            audioSource.clip = clip;
            audioSource.Play();
        }
    }

    private IEnumerator PlaySoundWithDelay(AudioClip clip, float delay)
    {
        yield return new WaitForSeconds(delay);
        PlaySound(clip);
    }
}
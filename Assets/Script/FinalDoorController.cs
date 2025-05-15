using UnityEngine;

public class FinalDoorController : MonoBehaviour
{
    [SerializeField] private float openAngle = 90f;
    [SerializeField] private float openSpeed = 2f;
    [SerializeField] private AudioClip openSound;

    private AudioSource audioSource;
    private bool isOpening = false;
    private Quaternion startRotation;
    private Quaternion targetRotation;

    private void Awake()
    {
        startRotation = transform.rotation;
        targetRotation = startRotation;

        audioSource = GetComponent<AudioSource>();
        if (audioSource == null && openSound != null)
        {
            audioSource = gameObject.AddComponent<AudioSource>();
        }
    }

    public void Open()
    {
        if (!isOpening)
        {
            targetRotation = startRotation * Quaternion.Euler(0, openAngle, 0);
            isOpening = true;

            if (audioSource != null && openSound != null)
            {
                audioSource.clip = openSound;
                audioSource.Play();
            }
        }
    }

    private void Update()
    {
        if (isOpening)
        {
            transform.rotation = Quaternion.Slerp(transform.rotation, targetRotation, Time.deltaTime * openSpeed);

            // Check if door is almost fully open
            if (Quaternion.Angle(transform.rotation, targetRotation) < 0.1f)
            {
                transform.rotation = targetRotation;
                isOpening = false;
            }
        }
    }
}
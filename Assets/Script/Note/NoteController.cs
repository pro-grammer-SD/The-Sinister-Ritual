using UnityEngine;
using TMPro;
using UnityEngine.Events;
using StarterAssets;
public class NoteController : MonoBehaviour
{
    [SerializeField] private KeyCode closeKey = KeyCode.E;
    [SerializeField] private GameObject playerObject;
    private FirstPersonController firstPersonController;
    private StarterAssetsInputs starterAssetsInputs;
    [SerializeField] private GameObject noteCanvas;
    [SerializeField] private TMP_Text noteTextUI;
    [SerializeField][TextArea] private string noteText;
    [Header("Events")]
    [SerializeField] private UnityEvent onNoteOpen;
     public bool isOpen = false; // Made public so NoteRayCast can check it

    private void Start()
    {
        if (playerObject == null)
        {
            playerObject = GameObject.FindGameObjectWithTag("Player");
        }
        if (playerObject != null)
        {
            firstPersonController = playerObject.GetComponent<FirstPersonController>();
            starterAssetsInputs = playerObject.GetComponent<StarterAssetsInputs>();
        }
        if (noteCanvas != null)
        {
            noteCanvas.SetActive(false);
        }
        if (onNoteOpen == null)
        {
            onNoteOpen = new UnityEvent();
        }
    }

    public void ShowNote()
    {
        // Only show the note if it's not already open
        if (!isOpen)
        {
            noteTextUI.text = noteText;
            noteCanvas.SetActive(true);
            onNoteOpen.Invoke();
            DisablePlayerMovement();
            isOpen = true;
            Cursor.lockState = CursorLockMode.None;
            Cursor.visible = true;
        }
    }

    private void DisableNote()
    {
        if (noteCanvas != null)
        {
            noteCanvas.SetActive(false);
        }
        EnablePlayerMovement();
        isOpen = false;
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
    }

    private void DisablePlayerMovement()
    {
        if (firstPersonController != null)
        {
            if (starterAssetsInputs != null)
            {
                starterAssetsInputs.move = Vector2.zero;
                starterAssetsInputs.look = Vector2.zero;
                starterAssetsInputs.jump = false;
                starterAssetsInputs.sprint = false;
            }
        }
    }

    private void EnablePlayerMovement()
    {
        // You might want to implement this to restore player control
        // For now, we'll leave it empty as in your original code
    }

    private void Update()
    {
        if (isOpen)
        {
            // Keep player movement disabled while note is open
            if (starterAssetsInputs != null)
            {
                starterAssetsInputs.move = Vector2.zero;
                starterAssetsInputs.look = Vector2.zero;
                starterAssetsInputs.jump = false;
                starterAssetsInputs.sprint = false;
            }

            // Check for close input
            if (Input.GetKeyDown(closeKey))
            {
                DisableNote();
            }
        }
    }

    public void SetNoteText(string text)
    {
        noteText = text;
    }
}
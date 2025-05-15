using UnityEngine;
using UnityEngine.UI;
public class NoteRayCast : MonoBehaviour
{
    [SerializeField] private float rayLength = 2f;
    private Camera _camera;
    [SerializeField] private Image crossHair;
    [SerializeField] private KeyCode interactKey = KeyCode.E;
    private NoteController noteController;
    [SerializeField] private GameObject interactionText;

    private void Start()
    {
        _camera = GetComponent<Camera>();
    }

    private void Update()
    {
        Vector3 forward = transform.TransformDirection(Vector3.forward);

        // If a note is already open, don't cast rays to find new notes
        if (noteController != null && noteController.isOpen)
        {
            return;
        }

        if (Physics.Raycast(transform.position, forward, out RaycastHit hitInfo, rayLength))
        {
            var readableItem = hitInfo.collider.GetComponent<NoteController>();
            if (readableItem != null)
            {
                noteController = readableItem;
                HighlightColor(true);
                interactionText.SetActive(true);

                // Only try to show the note if it's not already open
                if (Input.GetKeyDown(interactKey) && !noteController.isOpen)
                {
                    noteController.ShowNote();
                }
            }
            else
            {
                interactionText.SetActive(false);
                ClearNote();
            }
        }
        else
        {
            interactionText.SetActive(false);
            ClearNote();
        }
    }

    private void ClearNote()
    {
        // Only clear the note controller reference if it's not currently open
        if (noteController != null && !noteController.isOpen)
        {
            HighlightColor(false);
            noteController = null;
        }
    }

    private void HighlightColor(bool on)
    {
        if (on)
        {
            crossHair.color = Color.red;
        }
        else
        {
            crossHair.color = Color.white;
        }
    }
}
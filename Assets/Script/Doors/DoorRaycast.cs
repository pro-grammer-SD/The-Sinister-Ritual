using UnityEngine;
using UnityEngine.UI;

public class DoorRaycast : MonoBehaviour
{
    [SerializeField] private int rayLength = 5;
    [SerializeField] private LayerMask layerMaskInteract;
    [SerializeField] private string excludeLayerName = null;

    private DoorController raycastedObject;
    [SerializeField] private KeyCode openDoorKey = KeyCode.E;
    [SerializeField] private Image crossHair = null;
    private bool isCrosshairActive;
    private bool doOnce;
    private const string interactableTag = "Interactable";
    [SerializeField]private GameObject interactionText;
    private void Update()
    {
        RaycastHit hit;
        Vector3 forward = transform.TransformDirection(Vector3.forward);
        int mask = 1 << LayerMask.NameToLayer(excludeLayerName) | layerMaskInteract.value;
        if(Physics.Raycast(transform.position,forward, out hit, rayLength, mask))
        {
            if(hit.collider.CompareTag(interactableTag))
            {
                if(!doOnce)
                {
                    raycastedObject = hit.collider.gameObject.GetComponent<DoorController>();
                    CrossHairChange(true);
                }
                isCrosshairActive = true;
                interactionText.SetActive(true);
                doOnce = true;
                if (Input.GetKeyDown(openDoorKey))
                {
                    raycastedObject.PlayAnimation();
                }
            }
        }
        else
        {
            interactionText.SetActive(false);
            if (isCrosshairActive)
            {
                CrossHairChange(false);
                doOnce = false;
            }
        }
    }
    void CrossHairChange(bool on)
    {
        if(on && !doOnce)
        {
            crossHair.color = Color.red;
        }
        else
        {
            crossHair.color = Color.white;
            isCrosshairActive = false;
        }
    }
}

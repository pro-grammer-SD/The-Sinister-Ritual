using UnityEngine;
using StarterAssets;

public class PlayerPickupDrop : MonoBehaviour
{
    [SerializeField] private Transform playerCamera;
    [SerializeField] private Transform objectGrabPoint;
    [SerializeField] private LayerMask pickupLayerMask;
    [SerializeField] private float rotationSpeed = 5f;

    private ObjectGrabable objectGrabable;
    private Vector2 lastMousePosition;

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.Mouse0))
        {
            if (objectGrabable == null)
            {
                float pickupDistance = 2f;
                if (Physics.Raycast(playerCamera.position, playerCamera.forward, out RaycastHit hitInfo, pickupDistance, pickupLayerMask))
                {
                    if (hitInfo.transform.TryGetComponent(out objectGrabable))
                    {
                        objectGrabable.Grab(objectGrabPoint);
                    }
                }
            }
            else
            {
                objectGrabable.Drop();
                objectGrabable = null;
            }
        }
        if (objectGrabable != null && Input.GetMouseButton(1))
        {
            Vector2 mouseDelta = new Vector2(
                Input.GetAxis("Mouse X"),
                Input.GetAxis("Mouse Y")
            );
            if (mouseDelta.magnitude > 0.01f)
            {
                Quaternion yRotation = Quaternion.Euler(0f, mouseDelta.x * rotationSpeed, 0f);
                Quaternion xRotation = Quaternion.Euler(-mouseDelta.y * rotationSpeed, 0f, 0f);
                Quaternion deltaRotation = yRotation * xRotation;
                objectGrabable.Rotate(deltaRotation);
            }
            if (GetComponent<FirstPersonController>() != null)
            {
                GetComponent<FirstPersonController>().enabled = false;
            }
        }
        else if (GetComponent<FirstPersonController>() != null && !GetComponent<FirstPersonController>().enabled)
        {
            GetComponent<FirstPersonController>().enabled = true;
        }
    }
}
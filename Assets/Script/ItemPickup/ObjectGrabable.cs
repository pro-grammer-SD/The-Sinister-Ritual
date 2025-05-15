using UnityEngine;

public class ObjectGrabable : MonoBehaviour
{
    private Rigidbody rb;
    private Transform objectGrabPoint;
    private Quaternion targetRotation;
    private bool isRotating = false;
    private Vector3 centerOffset;

    // Added property to check if object is currently grabbed
    public bool IsGrabbed => objectGrabPoint != null;

    private void Awake()
    {
        rb = GetComponent<Rigidbody>();
        targetRotation = transform.rotation;
        if (GetComponent<Renderer>())
        {
            centerOffset = GetComponent<Renderer>().bounds.center - transform.position;
        }
        else if (GetComponentInChildren<Renderer>())
        {
            Renderer[] renderers = GetComponentsInChildren<Renderer>();
            Bounds bounds = new Bounds(transform.position, Vector3.zero);
            foreach (Renderer renderer in renderers)
            {
                bounds.Encapsulate(renderer.bounds);
            }
            centerOffset = bounds.center - transform.position;
        }
        else
        {
            centerOffset = Vector3.zero;
        }
    }

    public void Grab(Transform objectGrabPoint)
    {
        this.objectGrabPoint = objectGrabPoint;
        rb.useGravity = false;
        rb.isKinematic = true;
        targetRotation = transform.rotation;

        // Notify the UI about the grabbed doll
        DollIdentifier doll = GetComponent<DollIdentifier>();
        if (doll != null)
        {
            UIManager.Instance?.ShowDollNumber(doll.DollNumber);
        }
    }

    public void Drop()
    {
        this.objectGrabPoint = null;
        rb.useGravity = true;
        rb.isKinematic = false;
        isRotating = false;

        // Clear the UI when dropping
        UIManager.Instance?.HideDollNumber();
    }

    public void Rotate(Quaternion deltaRotation)
    {
        targetRotation = deltaRotation * targetRotation;
        isRotating = true;
    }

    private void FixedUpdate()
    {
        if (objectGrabPoint != null)
        {
            float lerpSpeed = 10f;
            if (isRotating)
            {
                float rotationLerpSpeed = 8f;
                Quaternion newRotation = Quaternion.Slerp(rb.rotation, targetRotation, Time.deltaTime * rotationLerpSpeed);
                Vector3 oldOffsetWorld = rb.rotation * centerOffset;
                Vector3 newOffsetWorld = newRotation * centerOffset;
                Vector3 offsetDifference = newOffsetWorld - oldOffsetWorld;
                Vector3 targetPos = objectGrabPoint.position - newOffsetWorld;
                Vector3 newPosition = Vector3.Lerp(rb.position, targetPos, Time.deltaTime * lerpSpeed);
                rb.MoveRotation(newRotation);
                rb.MovePosition(newPosition);
            }
            else
            {
                Vector3 targetPos = objectGrabPoint.position - (rb.rotation * centerOffset);
                Vector3 newPosition = Vector3.Lerp(rb.position, targetPos, Time.deltaTime * lerpSpeed);
                rb.MovePosition(newPosition);
            }
        }
    }
}
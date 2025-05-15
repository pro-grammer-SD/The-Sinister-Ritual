using UnityEngine;
using UnityEngine.UI;

public class LightSwitchRaycast : MonoBehaviour
{
    [SerializeField] private int rayLength = 5;
    private LightSwitchController interactiveobj;
    [SerializeField] private Image crossHair;
    private void Update()
    {
        Vector3 forward = transform.TransformDirection(Vector3.forward);
        if(Physics.Raycast(transform.position,forward,out RaycastHit hitInfo, rayLength))
        {
            var raycastobj = hitInfo.collider.gameObject.GetComponent<LightSwitchController>();
            if(raycastobj != null)
            {
                interactiveobj = raycastobj;
                CrossHairChange(true);
            }
            else
            {
                ClearInteraction();
            }
        }
        else
        {
            ClearInteraction();
        }
        if( interactiveobj != null )
        {
            if (Input.GetKeyDown(KeyCode.Mouse0))
            {
                interactiveobj.InteractSwitch();
            }
        }
    }

    public void ClearInteraction()
    {
        if( interactiveobj != null )
        {
            CrossHairChange(false);
            interactiveobj = null;
        }
    }
    private void CrossHairChange(bool on)
    {
        if ((on))
        {
            crossHair.color = Color.red;
        }
        else
        {
            crossHair.color = Color.white;
        }
    }
}

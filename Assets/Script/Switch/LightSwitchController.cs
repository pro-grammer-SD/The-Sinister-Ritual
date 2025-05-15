using UnityEngine;
using UnityEngine.Events;
public class LightSwitchController : MonoBehaviour
{
    [SerializeField] private bool isLightOn;
    [SerializeField] private UnityEvent lightOnEvent;
    [SerializeField] private UnityEvent lightOffevent;
    public void InteractSwitch()
    {
        if (!isLightOn)
        {
            isLightOn = true;
            lightOnEvent.Invoke();
        }
        else
        {
            isLightOn = false;
            lightOffevent.Invoke();
        }
    }
}

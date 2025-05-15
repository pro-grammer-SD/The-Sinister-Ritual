using System;
using System.Collections;
using UnityEngine;

public class FireZone : MonoBehaviour
{
    public event Action<DollIdentifier> OnDollBurned;
    [SerializeField] private ParticleSystem fireEffect;
    [SerializeField] private AudioSource burnSound;
    [SerializeField] private float burnDelay = 1.5f;

    private void Start()
    {
        if (burnSound != null)
        {
            burnSound.playOnAwake = false;
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        DollIdentifier doll = other.GetComponent<DollIdentifier>();
        ObjectGrabable grabbable = other.GetComponent<ObjectGrabable>();
        if (doll != null && grabbable != null)
        {
            if (!grabbable.IsGrabbed)
            {
                StartCoroutine(BurnDoll(other.gameObject, doll));
            }
        }
    }

    private IEnumerator BurnDoll(GameObject dollObject, DollIdentifier doll)
    {
        if (fireEffect != null)
        {
            ParticleSystem newFire = Instantiate(fireEffect, dollObject.transform.position, Quaternion.identity);
            newFire.Play();
        }
        if (burnSound != null)
        {
            burnSound.Play(); 
        }
        yield return new WaitForSeconds(burnDelay);
        OnDollBurned?.Invoke(doll);
        Destroy(dollObject);
    }
}
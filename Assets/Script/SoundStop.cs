using UnityEngine;

public class SoundStop : MonoBehaviour
{
    [SerializeField] private GameObject kidCrySource;
    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("Player"))
        {
            kidCrySource.SetActive(false);
            Destroy(this.gameObject);
        }
    }
}

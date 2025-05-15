using UnityEngine;

public class DollIdentifier : MonoBehaviour
{
    [SerializeField] private int dollNumber;

    public int DollNumber => dollNumber;
}
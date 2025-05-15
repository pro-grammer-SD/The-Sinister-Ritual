using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class PuzzleManager : MonoBehaviour
{
    [Header("Puzzle Configuration")]
    [SerializeField] private int[] correctCombination = new int[5];
    [SerializeField] private GameObject doorToOpen;
    [SerializeField] private GameObject gameOverScreen;
    [SerializeField] private TextMeshProUGUI statusText;

    [Header("Fire Zone")]
    [SerializeField] private FireZone fireZone;

    private List<int> currentCombination = new List<int>();
    private bool puzzleSolved = false;
    private bool gameOver = false;

    private void Start()
    {
        if (fireZone == null)
        {
            Debug.LogError("FireZone reference not assigned in PuzzleManager!");
        }

        if (statusText != null)
        {
            statusText.text = "";
        }
        if (gameOverScreen != null)
        {
            gameOverScreen.SetActive(false);
        }

        // Register to listen for doll burning events
        fireZone.OnDollBurned += HandleDollBurned;
    }

    public void HandleDollBurned(DollIdentifier doll)
    {
        if (puzzleSolved || gameOver) return;
        currentCombination.Add(doll.DollNumber);
        UpdateStatusText();
        bool isValid = IsCombinationValid();

        if (!isValid)
        {
            StartCoroutine(GameOver());
            return;
        }
        if (currentCombination.Count == correctCombination.Length)
        {
            StartCoroutine(SolvePuzzle());
        }
    }

    private bool IsCombinationValid()
    {
        for (int i = 0; i < currentCombination.Count; i++)
        {
            if (currentCombination[i] != correctCombination[i])
            {
                return false;
            }
        }
        return true;
    }

    private void UpdateStatusText()
    {
        if (statusText != null)
        {
            string status = "Dolls burned: ";
            foreach (int dollNum in currentCombination)
            {
                status += dollNum + " ";
            }
            statusText.text = status;
        }
    }

    private IEnumerator SolvePuzzle()
    {
        puzzleSolved = true;
        if (statusText != null)
        {
            statusText.text = "Correct combination! Door opening...";
        }

        yield return new WaitForSeconds(2f);
        if (doorToOpen != null)
        {
            Animator doorAnimator = doorToOpen.GetComponent<Animator>();
            if (doorAnimator != null)
            {
                doorAnimator.SetTrigger("Open");
            }
            else
            {
                doorToOpen.transform.Rotate(0, 90, 0);
            }
        }
    }

    private IEnumerator GameOver()
    {
        gameOver = true;
        if (statusText != null)
        {
            statusText.text = "Wrong combination!";
        }

        yield return new WaitForSeconds(2f);
        if (gameOverScreen != null)
        {
            gameOverScreen.SetActive(true);
            Time.timeScale = 0;
            Cursor.visible = true;
            Cursor.lockState = CursorLockMode.None;
        }
    }
    public void ResetPuzzle()
    {
        currentCombination.Clear();
        puzzleSolved = false;
        gameOver = false;
        Time.timeScale = 1;

        if (gameOverScreen != null)
        {
            gameOverScreen.SetActive(false);
        }

        if (statusText != null)
        {
            statusText.text = "";
        }
    }
}
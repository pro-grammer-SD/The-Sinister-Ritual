using UnityEngine;
using TMPro;

public class UIManager : MonoBehaviour
{
    public static UIManager Instance { get; private set; }

    [SerializeField] private TextMeshProUGUI dollNumberText;
    [SerializeField] private GameObject gameOverPanel;
    [SerializeField] private TextMeshProUGUI gameOverText;

    private void Awake()
    {
        // Singleton pattern
        if (Instance == null)
        {
            Instance = this;
        }
        else
        {
            Destroy(gameObject);
            return;
        }

        // Initialize UI
        HideDollNumber();

        if (gameOverPanel != null)
        {
            gameOverPanel.SetActive(false);
        }
    }

    public void ShowDollNumber(int dollNumber)
    {
        if (dollNumberText != null)
        {
            dollNumberText.text = $"Doll {dollNumber}";
            dollNumberText.gameObject.SetActive(true);
        }
    }

    public void HideDollNumber()
    {
        if (dollNumberText != null)
        {
            dollNumberText.gameObject.SetActive(false);
        }
    }

    public void ShowGameOver(string message = "Game Over")
    {
        if (gameOverPanel != null)
        {
            gameOverPanel.SetActive(true);

            if (gameOverText != null)
            {
                gameOverText.text = message;
            }
        }
    }

    public void RestartGame()
    {
        // Find and reset the puzzle manager
        PuzzleManager puzzleManager = FindAnyObjectByType<PuzzleManager>();
        if (puzzleManager != null)
        {
            puzzleManager.ResetPuzzle();
        }

        // Hide game over panel
        if (gameOverPanel != null)
        {
            gameOverPanel.SetActive(false);
        }
    }
}
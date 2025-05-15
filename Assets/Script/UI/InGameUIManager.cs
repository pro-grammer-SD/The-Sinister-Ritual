using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class InGameUIManager : MonoBehaviour
{
    [Header("References")]
    [SerializeField] private Canvas pauseMenuCanvas;
    [SerializeField] private GameObject gameOver;
    private bool isPaused = false;

    private void Start()
    {
        // Ensure the pause menu is hidden at start
        if (pauseMenuCanvas != null)
        {
            pauseMenuCanvas.gameObject.SetActive(false);
        }

        // Set initial cursor state for gameplay
        Cursor.visible = false;
        Cursor.lockState = CursorLockMode.Locked;
    }

    private void Update()
    {
        // Check for ESC key press
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            TogglePauseMenu();
        }
    }

    public void TogglePauseMenu()
    {
        isPaused = !isPaused;

        if (isPaused)
        {
            PauseGame();
        }
        else
        {
            ResumeGame();
        }
    }

    private void PauseGame()
    {
        // Set time scale to 0 to pause the game
        Time.timeScale = 0f;

        // Show the pause menu
        if (pauseMenuCanvas != null)
        {
            pauseMenuCanvas.gameObject.SetActive(true);
        }

        // Show and unlock the cursor so player can click UI elements
        Cursor.visible = true;
        Cursor.lockState = CursorLockMode.None;
    }

    public void ResumeGame()
    {
        // Reset time scale to 1 to resume the game
        Time.timeScale = 1f;

        // Hide the pause menu
        if (pauseMenuCanvas != null)
        {
            pauseMenuCanvas.gameObject.SetActive(false);
        }

        // Hide and lock cursor for gameplay
        Cursor.visible = false;
        Cursor.lockState = CursorLockMode.Locked;

        // Update the pause state
        isPaused = false;
    }

    public void MainMenu()
    {
        Time.timeScale = 1f;

        SceneManager.LoadScene(0);
    }
    public void Restart()
    {
        Time.timeScale = 1f;
        SceneManager.LoadScene(1);
        Cursor.visible = false;
        Cursor.lockState = CursorLockMode.Locked;

    }
}
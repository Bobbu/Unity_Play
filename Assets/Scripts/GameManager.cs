using UnityEngine;
using TMPro;

public class GameManager : MonoBehaviour
{
    public static GameManager Instance;

    public TextMeshProUGUI leftScoreText;
    public TextMeshProUGUI rightScoreText;
    public TextMeshProUGUI winText;
    public BallController ball;
    public int winningScore = 3;

    private int leftScore;
    private int rightScore;
    private bool gameOver;

    void Awake()
    {
        Instance = this;
    }

    void Start()
    {
        UpdateScoreUI();
    }

    public void ScorePoint(bool leftSideGoal)
    {
        if (gameOver) return;

        if (leftSideGoal)
            rightScore++;
        else
            leftScore++;

        UpdateScoreUI();

        if (leftScore >= winningScore)
        {
            EndGame("PLAYER WINS!");
        }
        else if (rightScore >= winningScore)
        {
            EndGame("AI WINS!");
        }
        else
        {
            if (SoundManager.Instance != null) SoundManager.Instance.PlayScore();
            ball.ResetBall();
        }
    }

    void EndGame(string message)
    {
        gameOver = true;
        if (SoundManager.Instance != null) SoundManager.Instance.PlayWin();
        if (winText != null)
        {
            winText.text = message + "\nPRESS R TO PLAY AGAIN";
            winText.gameObject.SetActive(true);
        }
        ball.ResetBall();
        ball.CancelInvoke();
        ball.GetComponent<Rigidbody2D>().linearVelocity = Vector2.zero;
    }

    void UpdateScoreUI()
    {
        if (leftScoreText != null)
            leftScoreText.text = leftScore.ToString();
        if (rightScoreText != null)
            rightScoreText.text = rightScore.ToString();
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.R))
        {
            leftScore = 0;
            rightScore = 0;
            gameOver = false;
            UpdateScoreUI();
            if (winText != null)
                winText.gameObject.SetActive(false);
            ball.ResetBall();
        }

        // Keyboard speed shortcuts (also available via Settings panel)
        if (Input.GetKeyDown(KeyCode.Alpha1)) SetSpeed(5f, 0.3f, 12f);
        if (Input.GetKeyDown(KeyCode.Alpha2)) SetSpeed(8f, 0.5f, 20f);
        if (Input.GetKeyDown(KeyCode.Alpha3)) SetSpeed(12f, 0.8f, 28f);

        // Sound toggle
        if (Input.GetKeyDown(KeyCode.M)) ToggleSound();
    }

    public void SetSpeed(float initial, float increase, float max)
    {
        ball.initialSpeed = initial;
        ball.speedIncrease = increase;
        ball.maxSpeed = max;
        ball.ApplySpeedChange();
    }

    public void ToggleSound()
    {
        if (SoundManager.Instance != null)
            SoundManager.Instance.SetMuted(!SoundManager.Instance.IsMuted());
    }
}

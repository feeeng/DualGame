using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DataCenter : MonoBehaviour
{
    public enum GameStage
    {
        GameStage0 = 0,
        GameStage1 = 1,
        GameStage2 = 2,
        GameStage3 = 3,
        GameStage4 = 4
    }
    public enum PlayerEnum
    {
        Player1 = 1,
        Player2 = 2,
        None = 0
    }
    public static DataCenter instance { get; private set; }
    public PlayerEnum whichMove = PlayerEnum.None;
    public GameObject[] players;
    public GameObject boss;
    public GameStage currentGameStage = GameStage.GameStage0;
    public int playerDamageToBoss = 5;
    public int playerHealToBoss = 1;
    public int BossInitHealth = 100;
    public int PlayerInitHealth = 100;

    public StagePanel stagePanel;

    #region Pause
    private bool _PauseGame = false;
    public bool pauseGame
    {
        get => _PauseGame;
        set
        {
            _PauseGame = value;
            if(_PauseGame || _StagePause)
            {
                Time.timeScale = 0;
            }
            else
            {
                Time.timeScale = 1.0f;
            }
        }
    }

    private bool _StagePause = false;
    public bool stagePause
    {
        get => _StagePause;
        set
        {
            _StagePause = value;
            if (_PauseGame || _StagePause)
            {
                Time.timeScale = 0;
            }
            else
            {
                Time.timeScale = 1.0f;
            }
        }
    }
    #endregion

    #region Start Game
    public GameObject startGameRoot;
    public WordWindows subline;
    #endregion

    #region StageChange  
    public float ChaseDist = 10;
    public float[] BossHealthPer;
    #endregion
    #region Monsters
    public float monsterMoveSpeed = 5.0f;
    public float monsterAttackRange = 5.0f;
    public float monsterAttackInterval = 0.5f;
    public int playerDamageToMonster = 5;
    #endregion

    #region Game Stage 2
    public float stage2SwapTime = 5.0f;
    public int[] rageTowardPlayers = new int[] { 0, 0 };
    public int monsterRage = 2;
    public int bossRage = 1;
    float stage2StateCountDown = 0.0f;
    public void AddRage(PlayerEnum player, int Val)
    {
        if(currentGameStage == GameStage.GameStage2)
        {
            rageTowardPlayers[(int)player - 1] += Val;
        }
    }
    #endregion

    private void OnEnable()
    {
        instance = this;
    }

    public void InitGameStatus()
    {
        currentGameStage = GameStage.GameStage0;
        stage2StateCountDown = 0.0f;
        rageTowardPlayers = new int[] { 0, 0 };
        whichMove = PlayerEnum.None;
        boss.GetComponent<BossControl>().ResetData();
        players[0].GetComponent<CharacterControl>().ResetData();
        players[1].GetComponent<CharacterControl>().ResetData();
    }

    public void InitMainMenu()
    {
        stagePause = true;
        startGameRoot.SetActive(true);
    }

    public void StartGame()
    {
        startGameRoot.SetActive(false);
        InitGameStatus();
        subline.StartShow(() =>
        {
            stagePause = false;
        });
    }

    private void Start()
    {
        whichMove = 0;
        InitMainMenu();
    }

    public PlayerEnum GetWitchMove()
    {
        return whichMove;
    }
    public void TrySetWitchMove(PlayerEnum which)
    {
        if(whichMove == PlayerEnum.None && currentGameStage != GameStage.GameStage1)
        {
            whichMove = which;
        }
    }

    public void TryResetWhichMove(PlayerEnum which)
    {
        if(whichMove == which && currentGameStage != GameStage.GameStage1)
        {
            whichMove = PlayerEnum.None;
        }
    }

    void StageChange()
    {
        switch (currentGameStage)
        {
            case DataCenter.GameStage.GameStage0:
                {
                    var p1 = players[0].GetComponent<CharacterControl>();
                    var p2 = players[1].GetComponent<CharacterControl>();
                    if(p1.isStage0 && p2.isStage0)
                    {
                        stagePause = true;
                        stagePanel.ShowPanel(currentGameStage, () =>
                        { stagePause = false; });
                        currentGameStage = DataCenter.GameStage.GameStage1;
                        print("Change to GameStage1");
                    } 
                };
                break;
            case DataCenter.GameStage.GameStage1:
                {
                    if (boss.GetComponent<Health>()?.health<=BossInitHealth*BossHealthPer[1])
                    {
                        stagePause = true;
                        stagePanel.ShowPanel(currentGameStage, () =>
                        { stagePause = false; });
                        currentGameStage = DataCenter.GameStage.GameStage2;
                        print("Change to GameStage2");
                    }
                };
                break;
            case DataCenter.GameStage.GameStage2:
                {
                    if (boss.GetComponent<Health>()?.health <= BossInitHealth * BossHealthPer[2])
                    {
                        stagePause = true;
                        stagePanel.ShowPanel(currentGameStage, () =>
                        { stagePause = false; });
                        currentGameStage = DataCenter.GameStage.GameStage3;
                        print("Change to GameStage3");
                    }
                }
                break;
            case DataCenter.GameStage.GameStage3:
                {
                    if (boss.GetComponent<Health>()?.health <= BossInitHealth * BossHealthPer[3])
                    {
                        currentGameStage = DataCenter.GameStage.GameStage4;
                        print("Change to GameStage4");
                    }
                }
                break;
        }
    }

    private void Update()
    {
        StageChange();
        if(currentGameStage == GameStage.GameStage1)
        {
            stage2StateCountDown -= Time.deltaTime;
            if(stage2StateCountDown <= 0.0f)
            {
                stage2StateCountDown = stage2SwapTime;
                whichMove = (whichMove == PlayerEnum.Player1) ? PlayerEnum.Player2 : PlayerEnum.Player1;
            }
        }
    }
}

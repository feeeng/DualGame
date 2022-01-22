using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DataCenter : MonoBehaviour
{
    public enum MoveEnum
    {
        Player1Move = 1,
        Player2Move = 2,
        NoMove = 0
    }
    public static DataCenter instance { get; private set; }
    public MoveEnum whichMove = MoveEnum.NoMove;
    public GameObject[] players;

    private void OnEnable()
    {
        instance = this;
    }
    private void Start()
    {
        whichMove = 0;
    }

    public MoveEnum GetWitchMove()
    {
        return whichMove;
    }
    public void TrySetWitchMove(MoveEnum which)
    {
        if(whichMove == MoveEnum.NoMove)
        {
            whichMove = which;
        }
    }

    public void TryResetWhichMove(MoveEnum which)
    {
        if(whichMove == which)
        {
            whichMove = MoveEnum.NoMove;
        }
    }
}

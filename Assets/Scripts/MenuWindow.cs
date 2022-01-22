using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class MenuWindow : MonoBehaviour
{
    public GameObject menuRoot;
    

    public void OnShowMenu()
    {
        menuRoot.SetActive(true);
        DataCenter.instance.pauseGame = true;
    }

    public void OnResumeGame()
    {
        menuRoot.SetActive(false);
        DataCenter.instance.pauseGame = false;
    }

    public void OnExit()
    {
        menuRoot.SetActive(false);
        DataCenter.instance.pauseGame = false;
        DataCenter.instance.InitMainMenu();
    }

    public void OnRestart()
    {

    }
}

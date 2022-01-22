using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WordWindows : MonoBehaviour
{
    public GameObject root;
    // Start is called before the first frame update
    public GameObject[] WordPanel;
    public float waitingTime = 5.0f;
    IEnumerator PlayPanelCoroutine(Action callback)
    {
        root.SetActive(true);
        for (int i = 0; i < WordPanel.Length; ++i)
        {
            WordPanel[i].SetActive(false);
        }
        for (int i = 0; i < WordPanel.Length; ++i)
        {
            WordPanel[i].SetActive(true);
            yield return new WaitForSecondsRealtime(waitingTime);
            //WordPanel[i].SetActive(false);
        }
        root.SetActive(false);
        if(callback != null)
        {
            callback.Invoke();
        }
    }

    public void StartShow(Action callback)
    {
        StopAllCoroutines();
        StartCoroutine(PlayPanelCoroutine(callback));
    }
}

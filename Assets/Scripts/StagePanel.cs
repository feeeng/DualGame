using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class StagePanel : MonoBehaviour
{
    public GameObject[] StageImages;
    public GameObject ButtonObj;
    public float scaleTime = 1.0f;
    public float defaultWaitTime = 5.0f;
    private bool continued = false;
    IEnumerator ShowStageImage(DataCenter.GameStage stage, Action callback)
    {
        int stageId = (int)stage;
        if(stageId >= StageImages.Length || StageImages[stageId] == null)
        {
            yield break;
        }
        GameObject img = StageImages[stageId];
        img.SetActive(true);
        float currentTime = 0.0f;
        while(currentTime < scaleTime)
        {
            currentTime += Time.unscaledDeltaTime;
            float alpha = Mathf.Clamp01(currentTime / scaleTime);
            img.transform.localScale = Vector3.one * alpha;
            yield return null;
        }
        continued = false;
        ButtonObj.gameObject.SetActive(true);
        float countDown = defaultWaitTime;
        while (countDown > 0.0f && !continued)
        {
            countDown -= Time.unscaledDeltaTime;
            yield return null;
        }
        ButtonObj.gameObject.SetActive(false);
        currentTime = 0.0f;
        while (currentTime < scaleTime)
        {
            currentTime += Time.unscaledDeltaTime;
            float alpha = Mathf.Clamp01(currentTime / scaleTime);
            img.transform.localScale = Vector3.one * (1.0f - alpha);
            yield return null;
        }
        img.SetActive(false);
        if (callback != null)
        {
            callback.Invoke();
        }
    }

    public void ShowPanel(DataCenter.GameStage stage, Action callback)
    {
        StopAllCoroutines();
        StartCoroutine(ShowStageImage(stage, callback));
    }

    public void Continue()
    {
        continued = true;
    }
}

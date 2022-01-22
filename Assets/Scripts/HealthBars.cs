using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class HealthBars : MonoBehaviour
{

    public Slider BossHealthSlider;
    public Slider Player1HealthSlider;
    public Slider Player2HealthSlider;


    // Update is called once per frame
    void Update()
    {
        BossHealthSlider.value = DataCenter.instance.boss.GetComponent<Health>().health / (float)DataCenter.instance.BossInitHealth;
        Player1HealthSlider.value = DataCenter.instance.players[0].GetComponent<Health>().health / (float)DataCenter.instance.PlayerInitHealth;
        Player2HealthSlider.value = DataCenter.instance.players[1].GetComponent<Health>().health / (float)DataCenter.instance.PlayerInitHealth;
    }
}

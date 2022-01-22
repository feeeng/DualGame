using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Bullet : MonoBehaviour
{
    // Start is called before the first frame update
    public float speed = 10;
    Rigidbody bulletRig;
    public DataCenter.PlayerEnum which = DataCenter.PlayerEnum.None; 
    

    public float remainTime = 5.0f;

    void Start()
    {
        bulletRig = GetComponent<Rigidbody>();    
    }

    // Update is called once per frame
    void Update()
    {
        bulletRig.velocity = transform.forward * speed;
        remainTime -= Time.deltaTime;
        if(remainTime <= 0.0f)
        {
            GameObject.Destroy(gameObject);
        }
    }

    int GetBossHealthChange()
    {
        switch (DataCenter.instance.currentGameStage)
        {
            case DataCenter.GameStage.GameStage0:
                return 0;
                break;
            case DataCenter.GameStage.GameStage1:
                return -DataCenter.instance.playerDamageToBoss;
                break;
            case DataCenter.GameStage.GameStage2:
                {
                    if(which == DataCenter.instance.GetWitchMove())
                    {
                        return DataCenter.instance.playerHealToBoss;
                    }
                    else
                    {
                        return -DataCenter.instance.playerDamageToBoss;
                    }
                }
                break;
            default:
                return -DataCenter.instance.playerDamageToBoss;
        }
    }

    bool DoReducingSpeed()
    {
        return which != DataCenter.instance.GetWitchMove();
    }

    private void OnTriggerEnter(Collider other)
    {
        var boss = other.gameObject.GetComponent<BossControl>();
        if (boss != null)
        {
            if (DoReducingSpeed())
            {
                boss.speedReducingTime = 0.5f;
            }
            var health = other.gameObject.GetComponent<Health>();
            if (health != null)
            {
                health.HealthChange(GetBossHealthChange());
            }
            DataCenter.instance.AddRage(which, DataCenter.instance.bossRage);
        }
        var monster = other.gameObject.GetComponent<Monster>();
        if(monster != null)
        {
            var health = other.gameObject.GetComponent<Health>();
            if (health != null)
            {
                health.HealthChange(-DataCenter.instance.playerDamageToMonster);
            }
            DataCenter.instance.AddRage(which, DataCenter.instance.monsterRage);
        }

        GameObject.Destroy(gameObject);
    }
}

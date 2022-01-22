using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BossControl : MonoBehaviour
{

    public float moveSpeed = 1.0f;
    public float attackRange = 5.0f;
    public float attackInterval = 0.5f;
    private float attackRemainTime = 0.0f;
    private int lastTargetPlayer = -1;
    Rigidbody bossrig;

    // Start is called before the first frame update
    void Start()
    {
        bossrig = GetComponent<Rigidbody>();
    }

    // Update is called once per frame
    void Update()
    {
        var moveEnum = DataCenter.instance.GetWitchMove();
        int targetPlayer = 0;
        float dist0 = (DataCenter.instance.players[0].transform.position - transform.position).magnitude;
        float dist1 = (DataCenter.instance.players[1].transform.position - transform.position).magnitude;
        if (moveEnum == DataCenter.MoveEnum.Player1Move || moveEnum == DataCenter.MoveEnum.Player2Move)
        {
            targetPlayer = (int)moveEnum - 1;
            lastTargetPlayer = targetPlayer;
        }
        else
        {
            if(lastTargetPlayer == -1)
            {
                lastTargetPlayer = dist0 < dist1 ? 0 : 1;
            }
            targetPlayer = lastTargetPlayer;
        }
        {
            var target = DataCenter.instance.players[targetPlayer];
            float targetDist = targetPlayer == 0 ? dist0 : dist1;
            transform.LookAt(target.transform, Vector3.up);
            if(targetDist < attackRange)
            {
                attackRemainTime -= Time.deltaTime;
                if(attackRemainTime <= 0.0f)
                {
                    attackRemainTime = attackInterval;
                    target.GetComponent<Health>()?.HealthChange(-2);
                }
            }
            else
            {
                bossrig.velocity = transform.forward * moveSpeed;
            }
        }
    }
}

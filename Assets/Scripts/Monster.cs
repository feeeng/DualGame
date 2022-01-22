using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Monster : MonoBehaviour
{
    private float attackRemainTime = 0.0f;
    Rigidbody monsterrig;

    #region Monster
    public Animator monsterAnimator;
    #endregion

    void Start()
    {
        monsterrig = GetComponent<Rigidbody>();
    }

    // Update is called once per frame
    void Update()
    {
        float dist0 = (DataCenter.instance.players[0].transform.position - transform.position).magnitude;
        float dist1 = (DataCenter.instance.players[1].transform.position - transform.position).magnitude;

        var targetPlayer = dist0 < dist1 ? DataCenter.PlayerEnum.Player1 : DataCenter.PlayerEnum.Player2;
        float targetDist = targetPlayer == 0 ? dist0 : dist1;
        var target = DataCenter.instance.players[(int)targetPlayer - 1];

        transform.LookAt(target.transform, Vector3.up);

        if (targetDist < DataCenter.instance.monsterAttackRange)
        {
            attackRemainTime -= Time.deltaTime;
            if (attackRemainTime <= 0.0f)
            {
                monsterAnimator.SetTrigger("Attack");
                attackRemainTime = DataCenter.instance.monsterAttackInterval;
                target.GetComponent<Health>()?.HealthChange(-2);
            }
            monsterrig.velocity = Vector3.zero;
        }
        else
        {
            monsterrig.velocity = transform.forward * DataCenter.instance.monsterMoveSpeed;
        }
    }
}

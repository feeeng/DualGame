using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CharacterControl : MonoBehaviour
{
    public float moveSpeed = 10;
    public float rotationSpeed = 10.0f;
    Rigidbody myrig;
    public float bulletInterval = 0.2f;
    public int playerId;
    public DataCenter.MoveEnum moveEnum;
    public GameObject BulletObj;

    private float bulletRemainTimes = 0.0f;

    public string horizontalKey;
    public string verticalKey;
    public string rotationKey;
    public string fireKey;

    float rotation = 0.0f;
    // Start is called before the first frame update
    void Start()
    {
        myrig = GetComponent<Rigidbody>();
    }

    void UpdateRotation()
    {
        var rot = Input.GetAxisRaw(rotationKey);
        rotation += rot * rotationSpeed * Time.deltaTime;
        rotation = Mathf.Repeat(rotation, 360.0f);
    }

    // Update is called once per frame
    void Update()
    {
        //myrig.velocity = new Vector3(Input.GetAxisRaw("Horizontal"), 0, Input.GetAxisRaw("Vertical")).normalized * moveSpeed;
        UpdateRotation();
        transform.localRotation = Quaternion.Euler(0.0f, rotation, 0.0f);
        float input_h = Input.GetAxisRaw(horizontalKey);
        float input_v = Input.GetAxisRaw(verticalKey);
        bool isTriggered = Input.GetAxisRaw(fireKey) > 0.0f;
        if(Mathf.Abs(input_h) > 0.0f || Mathf.Abs(input_v) > 0.0f)
        {
            DataCenter.instance.TrySetWitchMove(moveEnum);
        }
        else
        {
            DataCenter.instance.TryResetWhichMove(moveEnum);
        }
        Vector3 vec = new Vector3(input_h, 0, input_v);
        if (DataCenter.instance.GetWitchMove() == moveEnum)
        {
            vec = vec.normalized;
            vec = vec * moveSpeed;
            myrig.velocity = vec;
        }
        else
        {
            myrig.velocity = Vector3.zero;
        }

        if(isTriggered)
        {
            bulletRemainTimes -= Time.deltaTime;
            if (bulletRemainTimes <= 0.0f)
            {
                bulletRemainTimes = bulletInterval;
                var forward = vec.normalized;
                var bulletInstance = GameObject.Instantiate(BulletObj);
                bulletInstance.layer = gameObject.layer;
                bulletInstance.transform.position = transform.position;
                bulletInstance.transform.forward = transform.forward;
            }
        }
    }
}

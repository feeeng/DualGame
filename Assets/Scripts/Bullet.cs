using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Bullet : MonoBehaviour
{
    // Start is called before the first frame update
    public float speed = 10;
    Rigidbody bulletRig;

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

    private void OnTriggerEnter(Collider other)
    {
        var health = other.gameObject.GetComponent<Health>();
        if(health != null)
        {
            health.HealthChange(-10);
        }
        GameObject.Destroy(gameObject);
    }
}

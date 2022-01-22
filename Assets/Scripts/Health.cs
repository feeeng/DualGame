using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Health : MonoBehaviour
{
    public enum DestroyType
    {
        Destroy = 0,
        Hide = 1,
    }
    public int health = 100;
    public DestroyType destroyType;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void HealthChange(int change)
    {
        health += change;
        if(health <= 0)
        {
            if(destroyType == DestroyType.Destroy)
            {
                GameObject.Destroy(gameObject);
            }
            else
            {
                gameObject.SetActive(false);
            }
        }
    }
    public int GetHealth()
    {
        return health;
    }
}

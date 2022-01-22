using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraControl : MonoBehaviour
{
    public Transform rootPosition;
    public Camera cam;

    public float padding = 5.0f;

    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        Bounds playerBounds = DataCenter.instance.players[0].GetComponentInChildren<Renderer>().bounds;
        playerBounds.Encapsulate(DataCenter.instance.players[1].GetComponentInChildren<Renderer>().bounds);
        rootPosition.transform.position = playerBounds.center;
        var vsMin = cam.transform.InverseTransformPoint(playerBounds.min);
        var vsMax = cam.transform.InverseTransformPoint(playerBounds.max);

        float vsH = Mathf.Abs(vsMax.y - vsMin.y);
        float vsW = Mathf.Abs(vsMax.x - vsMin.x);
        float invTanFov = 1.0f / Mathf.Tan(cam.fieldOfView * 0.5f * Mathf.Deg2Rad);
        float zByH = (vsH + padding * 2.0f) * 0.5f * invTanFov;
        float zByW = (vsW + padding * 2.0f)/ cam.aspect * 0.5f * invTanFov;
        float scale = Mathf.Abs(Vector3.Dot(cam.transform.forward, vsMax - vsMin));
        cam.transform.localPosition = new Vector3(0.0f, 0.0f, Mathf.Max(zByH, zByW) + scale * 0.5f);

    }
}

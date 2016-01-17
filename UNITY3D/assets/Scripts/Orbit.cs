using UnityEngine;
using System.Collections;

public class Orbit : MonoBehaviour {
	float timeCounter=0;

	float speed;
	float l1;
	float l2;

	// Use this for initialization
	void Start () {
		speed = 1;
		l1 = 1;
		l2 = 1;
	}

	// Update is called once per frame
	void Update () {
		timeCounter += Time.deltaTime*speed;

		float x = Mathf.Cos (timeCounter)*l1;
		float y = 0;
		float z = Mathf.Sin (timeCounter)*l2;

		transform.position = new Vector3 (x, y, z);
	}
}

using UnityEngine;
using System.Collections;

[ExecuteInEditMode]
public class Orbit : MonoBehaviour {

	float timeCounter=0f;

	public float speed = 1f;
	public float l1 = 1f;
	public float l2 = 1f;
	public GameObject cObject;


	//var playerPos:Vector3 = cObject.transform.position;

	// Use this for initialization
	void Start () {
		//speed = 1;
		//l1 = 1;
		//l2 = 1;
	}

	// Update is called once per frame
	void Update () {
		timeCounter += Time.deltaTime*speed;

		float x = Mathf.Cos (timeCounter)*l1;
		float y = 0;
		float z = Mathf.Sin (timeCounter)*l2;

		transform.position = new Vector3 (x, y, z);
		transform.position = transform.position;
			//* cObject.transform.positoin;
	}
}

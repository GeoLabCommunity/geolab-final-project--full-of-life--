using UnityEngine;
using System.Collections;

public class CameraScript : MonoBehaviour {

	public float rotationSpeed;
	float delta = 0;
	float pos;
	
	// Use this for initialization
	void Start () {
	}
	
	// Update is called once per frame
	void Update () {
		if(Input.GetMouseButtonDown(2)){
			pos = Input.mousePosition.x;
			delta = Input.mousePosition.x;
		}
		
		if(Input.GetMouseButton(2)){
			delta = Input.mousePosition.x - delta;
			transform.RotateAround(Vector3.zero, Vector3.up, delta/300);
			delta = pos;
		}

		if (Input.GetAxis("Mouse ScrollWheel") != 0) // back
		{
			//Camera.main.orthographicSize = Mathf.Max(Camera.main.fieldOfView-1, 1);
			transform.Translate(Vector3.forward * 5* Input.GetAxis("Mouse ScrollWheel"));
			
		}
	}
}



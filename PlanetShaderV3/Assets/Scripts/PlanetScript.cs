using UnityEngine;
using System.Collections;

public class PlanetScript : MonoBehaviour {
	
	public float rotationSpeed;
	float deltaX = 0;
	float posX;

	// Use this for initialization
	void Start () {
	}
	
	// Update is called once per frame
	void Update () {
		if(Input.GetMouseButtonDown(1)){
			posX = Input.mousePosition.x;
			deltaX = Input.mousePosition.x;

		}
		
		if(Input.GetMouseButton(1)){
			deltaX = Input.mousePosition.x - deltaX;
			transform.Rotate(Vector3.up *(deltaX/300));
			deltaX = posX;
		}
	}
}

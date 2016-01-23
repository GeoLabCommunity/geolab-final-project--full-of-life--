using UnityEngine;
using System.Collections;

public class SunScript : MonoBehaviour {

	public float rotationSpeed;
	float deltaX = 0;
	float deltaY = 0;
	float posX;
	float posY;
	
	// Use this for initialization
	void Start () {
	}
	
	// Update is called once per frame
	void Update () {
		if(Input.GetMouseButtonDown(0)){
			posX = Input.mousePosition.x;
			posY = Input.mousePosition.y;
			deltaX = Input.mousePosition.x;
			deltaY = Input.mousePosition.y;
			
		}
		
		if(Input.GetMouseButton(0)){
			deltaX = Input.mousePosition.x - deltaX;
			deltaY = Input.mousePosition.y - deltaY;
			transform.Rotate(Vector3.up *(deltaX/300));
			transform.Rotate(Vector3.right *(deltaY/300));
			deltaX = posX;
			deltaY = posY;
		}
	}
}

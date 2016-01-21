using UnityEngine;
using System.Collections;

[ExecuteInEditMode]
public class CopyPosition : MonoBehaviour {

	public GameObject mobject;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	


		transform.position = mobject.transform.position;
	}
}
 
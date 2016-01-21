using UnityEngine;
using System.Collections;


[ExecuteInEditMode]
public class OrbitEditor : MonoBehaviour {

	public float radius = 1f;
	// Use this for initialization
	void Start () {
	
	}
	#if UNITY_EDITOR
	// Update is called once per frame
	void Update () {
		transform.localScale = Vector3.one * radius;
	}
	#endif
}

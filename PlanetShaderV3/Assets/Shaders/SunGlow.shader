// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:2,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:1,fgcg:0,fgcb:0,fgca:1,fgde:0.97,fgrn:0,fgrf:100,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32603,y:32697|emission-6-OUT;n:type:ShaderForge.SFN_Fresnel,id:2,x:33477,y:32854;n:type:ShaderForge.SFN_OneMinus,id:3,x:33288,y:32854|IN-2-OUT;n:type:ShaderForge.SFN_Power,id:4,x:33089,y:32913|VAL-3-OUT,EXP-5-OUT;n:type:ShaderForge.SFN_Vector1,id:5,x:33301,y:33009,v1:12;n:type:ShaderForge.SFN_Multiply,id:6,x:32881,y:32798|A-8-RGB,B-4-OUT,C-7-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7,x:33114,y:33127,ptlb:SunGlowIntensity,ptin:_SunGlowIntensity,glob:False,v1:2;n:type:ShaderForge.SFN_Color,id:8,x:33103,y:32708,ptlb:node_8,ptin:_node_8,glob:False,c1:1,c2:0.9411765,c3:0.7867647,c4:1;proporder:7-8;pass:END;sub:END;*/

Shader "Planet Shaders/SunGlow" {
    Properties {
        _SunGlowIntensity ("SunGlowIntensity", Float ) = 2
        _node_8 ("node_8", Color) = (1,0.9411765,0.7867647,1)
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One One
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float _SunGlowIntensity;
            uniform float4 _node_8;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float3 normalDirection =  i.normalDir;
////// Lighting:
////// Emissive:
                float3 emissive = (_node_8.rgb*pow((1.0 - (1.0-max(0,dot(normalDirection, viewDirection)))),12.0)*_SunGlowIntensity);
                float3 finalColor = emissive;
/// Final Color:
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

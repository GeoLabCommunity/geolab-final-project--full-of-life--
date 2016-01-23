// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:0,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:2,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:False,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:31581,y:33010|emission-75-OUT;n:type:ShaderForge.SFN_NormalVector,id:39,x:33717,y:32642,pt:False;n:type:ShaderForge.SFN_Color,id:43,x:33002,y:33268,ptlb:AtmosphereColor,ptin:_AtmosphereColor,glob:False,c1:0,c2:0.3793104,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:44,x:32856,y:32722|A-46-OUT,B-109-OUT,C-64-OUT,D-43-RGB,E-43-RGB;n:type:ShaderForge.SFN_Power,id:46,x:33119,y:32634|VAL-55-OUT,EXP-47-OUT;n:type:ShaderForge.SFN_Vector1,id:47,x:33285,y:32688,v1:8;n:type:ShaderForge.SFN_Dot,id:48,x:33467,y:32753,dt:0|A-39-OUT,B-74-OUT;n:type:ShaderForge.SFN_LightVector,id:49,x:33656,y:33423;n:type:ShaderForge.SFN_Fresnel,id:54,x:33467,y:32546;n:type:ShaderForge.SFN_OneMinus,id:55,x:33285,y:32546|IN-54-OUT;n:type:ShaderForge.SFN_Fresnel,id:56,x:33266,y:33052|EXP-57-OUT;n:type:ShaderForge.SFN_Vector1,id:57,x:33479,y:33067,v1:2;n:type:ShaderForge.SFN_ValueProperty,id:64,x:33055,y:33020,ptlb:RingIntensity,ptin:_RingIntensity,glob:False,v1:1500;n:type:ShaderForge.SFN_Blend,id:69,x:32610,y:32895,blmd:1,clmp:True|SRC-44-OUT,DST-71-OUT;n:type:ShaderForge.SFN_Posterize,id:71,x:33099,y:33112|IN-56-OUT,STPS-72-OUT;n:type:ShaderForge.SFN_Vector1,id:72,x:33339,y:33214,v1:2;n:type:ShaderForge.SFN_HalfVector,id:74,x:33633,y:32837;n:type:ShaderForge.SFN_Add,id:75,x:32261,y:33101|A-69-OUT,B-79-OUT,C-121-OUT;n:type:ShaderForge.SFN_Dot,id:76,x:33326,y:33353,dt:0|A-77-OUT,B-49-OUT;n:type:ShaderForge.SFN_NormalVector,id:77,x:33656,y:33226,pt:False;n:type:ShaderForge.SFN_Fresnel,id:78,x:33168,y:33395;n:type:ShaderForge.SFN_Multiply,id:79,x:32612,y:33361|A-43-RGB,B-76-OUT,C-78-OUT,D-106-OUT,E-101-OUT;n:type:ShaderForge.SFN_OneMinus,id:99,x:33453,y:33585|IN-100-OUT;n:type:ShaderForge.SFN_Fresnel,id:100,x:33654,y:33585;n:type:ShaderForge.SFN_Posterize,id:101,x:33035,y:33712|IN-105-OUT,STPS-102-OUT;n:type:ShaderForge.SFN_Vector1,id:102,x:33219,y:33777,v1:2;n:type:ShaderForge.SFN_Vector1,id:104,x:33453,y:33728,v1:0.3;n:type:ShaderForge.SFN_Blend,id:105,x:33242,y:33602,blmd:6,clmp:True|SRC-99-OUT,DST-104-OUT;n:type:ShaderForge.SFN_ValueProperty,id:106,x:32917,y:33470,ptlb:FresnelIntensity,ptin:_FresnelIntensity,glob:False,v1:1.5;n:type:ShaderForge.SFN_Blend,id:107,x:33308,y:32791,blmd:3,clmp:True|SRC-48-OUT,DST-108-OUT;n:type:ShaderForge.SFN_Vector1,id:108,x:33479,y:32935,v1:0.8;n:type:ShaderForge.SFN_Blend,id:109,x:33138,y:32835,blmd:8,clmp:True|SRC-107-OUT,DST-110-OUT;n:type:ShaderForge.SFN_Vector1,id:110,x:33308,y:32963,v1:0.01;n:type:ShaderForge.SFN_LightVector,id:111,x:33422,y:31958;n:type:ShaderForge.SFN_ViewVector,id:112,x:33422,y:32102;n:type:ShaderForge.SFN_Dot,id:113,x:33237,y:32018,dt:0|A-111-OUT,B-112-OUT;n:type:ShaderForge.SFN_Negate,id:114,x:32992,y:32018|IN-126-OUT;n:type:ShaderForge.SFN_Fresnel,id:115,x:33124,y:31847|EXP-117-OUT;n:type:ShaderForge.SFN_Multiply,id:116,x:32774,y:32138|A-123-OUT,B-114-OUT;n:type:ShaderForge.SFN_Vector1,id:117,x:33292,y:31858,v1:4;n:type:ShaderForge.SFN_Color,id:118,x:32684,y:32274,ptlb:SunsetColor,ptin:_SunsetColor,glob:False,c1:0.9926471,c2:0.6865977,c3:0.408737,c4:1;n:type:ShaderForge.SFN_Power,id:119,x:32440,y:32138|VAL-116-OUT,EXP-120-OUT;n:type:ShaderForge.SFN_Vector1,id:120,x:32640,y:32189,v1:3;n:type:ShaderForge.SFN_Multiply,id:121,x:32169,y:32193|A-119-OUT,B-128-OUT,C-118-RGB,D-71-OUT,E-131-OUT;n:type:ShaderForge.SFN_OneMinus,id:123,x:32943,y:31847|IN-115-OUT;n:type:ShaderForge.SFN_Blend,id:124,x:32733,y:31830,blmd:19,clmp:True|SRC-125-OUT,DST-123-OUT;n:type:ShaderForge.SFN_Vector1,id:125,x:32943,y:31775,v1:0.5;n:type:ShaderForge.SFN_Power,id:126,x:33163,y:32182|VAL-113-OUT,EXP-127-OUT;n:type:ShaderForge.SFN_Vector1,id:127,x:33385,y:32283,v1:5;n:type:ShaderForge.SFN_ValueProperty,id:128,x:32400,y:32421,ptlb:SunsetIntensity,ptin:_SunsetIntensity,glob:False,v1:6;n:type:ShaderForge.SFN_Vector1,id:129,x:32677,y:32007,v1:6;n:type:ShaderForge.SFN_Power,id:131,x:32440,y:32007|VAL-116-OUT,EXP-129-OUT;proporder:43-64-106-118-128;pass:END;sub:END;*/

Shader "Planet Shaders/MarsAtmosphere" {
    Properties {
        _AtmosphereColor ("AtmosphereColor", Color) = (0,0.3793104,1,1)
        _RingIntensity ("RingIntensity", Float ) = 1500
        _FresnelIntensity ("FresnelIntensity", Float ) = 1.5
        _SunsetColor ("SunsetColor", Color) = (0.9926471,0.6865977,0.408737,1)
        _SunsetIntensity ("SunsetIntensity", Float ) = 6
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
            
            Fog {Mode Off}
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _AtmosphereColor;
            uniform float _RingIntensity;
            uniform float _FresnelIntensity;
            uniform float4 _SunsetColor;
            uniform float _SunsetIntensity;
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
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
////// Emissive:
                float node_72 = 2.0;
                float node_71 = floor(pow(1.0-max(0,dot(normalDirection, viewDirection)),2.0) * node_72) / (node_72 - 1);
                float node_102 = 2.0;
                float node_123 = (1.0 - pow(1.0-max(0,dot(normalDirection, viewDirection)),4.0));
                float node_116 = (node_123*(-1*pow(dot(lightDirection,viewDirection),5.0)));
                float3 emissive = (saturate(((pow((1.0 - (1.0-max(0,dot(normalDirection, viewDirection)))),8.0)*saturate((saturate((dot(i.normalDir,halfDirection)+0.8-1.0))+0.01))*_RingIntensity*_AtmosphereColor.rgb*_AtmosphereColor.rgb)*node_71))+(_AtmosphereColor.rgb*dot(i.normalDir,lightDirection)*(1.0-max(0,dot(normalDirection, viewDirection)))*_FresnelIntensity*floor(saturate((1.0-(1.0-(1.0 - (1.0-max(0,dot(normalDirection, viewDirection)))))*(1.0-0.3))) * node_102) / (node_102 - 1))+(pow(node_116,3.0)*_SunsetIntensity*_SunsetColor.rgb*node_71*pow(node_116,6.0)));
                float3 finalColor = emissive;
/// Final Color:
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ForwardAdd"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            ZWrite Off
            
            Fog { Color (0,0,0,0) }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _AtmosphereColor;
            uniform float _RingIntensity;
            uniform float _FresnelIntensity;
            uniform float4 _SunsetColor;
            uniform float _SunsetIntensity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float3 normalDirection =  i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float3 finalColor = 0;
/// Final Color:
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

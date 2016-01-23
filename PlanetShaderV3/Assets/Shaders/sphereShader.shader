// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:2,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:True,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32441,y:32697|emission-3-OUT;n:type:ShaderForge.SFN_Fresnel,id:2,x:33163,y:32564|EXP-21-OUT;n:type:ShaderForge.SFN_Multiply,id:3,x:32751,y:32804|A-2-OUT,B-7-OUT,C-37-OUT;n:type:ShaderForge.SFN_Dot,id:7,x:33163,y:32729,dt:0|A-19-OUT,B-16-OUT;n:type:ShaderForge.SFN_NormalVector,id:16,x:33443,y:32863,pt:False;n:type:ShaderForge.SFN_LightVector,id:19,x:33432,y:32547;n:type:ShaderForge.SFN_Vector1,id:21,x:33432,y:32468,v1:3;n:type:ShaderForge.SFN_Color,id:22,x:33198,y:32976,ptlb:node_22,ptin:_node_22,glob:False,c1:0,c2:0.213793,c3:1,c4:1;n:type:ShaderForge.SFN_Color,id:23,x:33030,y:33254,ptlb:node_23,ptin:_node_23,glob:False,c1:1,c2:0.6413793,c3:0,c4:1;n:type:ShaderForge.SFN_ViewVector,id:25,x:33901,y:33073;n:type:ShaderForge.SFN_NormalVector,id:26,x:33901,y:33203,pt:False;n:type:ShaderForge.SFN_Dot,id:27,x:33684,y:33135,dt:0|A-25-OUT,B-26-OUT;n:type:ShaderForge.SFN_Multiply,id:28,x:32847,y:33075|A-22-RGB,B-39-OUT;n:type:ShaderForge.SFN_OneMinus,id:34,x:33030,y:33420|IN-39-OUT;n:type:ShaderForge.SFN_Multiply,id:35,x:32845,y:33345|A-23-RGB,B-34-OUT;n:type:ShaderForge.SFN_Add,id:37,x:32667,y:33196|A-28-OUT,B-35-OUT;n:type:ShaderForge.SFN_Power,id:39,x:33296,y:33194|VAL-41-OUT,EXP-40-OUT;n:type:ShaderForge.SFN_Vector1,id:40,x:33699,y:33456,v1:1.7;n:type:ShaderForge.SFN_Multiply,id:41,x:33453,y:33061|A-27-OUT,B-40-OUT;proporder:22-23;pass:END;sub:END;*/

Shader "Shader Forge/sphereShader" {
    Properties {
        _node_22 ("node_22", Color) = (0,0.213793,1,1)
        _node_23 ("node_23", Color) = (1,0.6413793,0,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _node_22;
            uniform float4 _node_23;
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
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float node_40 = 1.7;
                float node_39 = pow((dot(viewDirection,i.normalDir)*node_40),node_40);
                float3 node_28 = (_node_22.rgb*node_39);
                float3 node_35 = (_node_23.rgb*(1.0 - node_39));
                float3 emissive = (pow(1.0-max(0,dot(normalDirection, viewDirection)),3.0)*dot(lightDirection,i.normalDir)*(node_28+node_35));
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
            
            
            Fog { Color (0,0,0,0) }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _node_22;
            uniform float4 _node_23;
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

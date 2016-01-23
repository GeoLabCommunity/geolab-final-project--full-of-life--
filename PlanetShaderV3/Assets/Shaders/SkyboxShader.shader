// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:2,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:1,fgcg:0,fgcb:0,fgca:1,fgde:0.97,fgrn:0,fgrf:100,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32713,y:32790|diff-167-OUT,emission-167-OUT;n:type:ShaderForge.SFN_Tex2d,id:8,x:33395,y:32890,ptlb:Stars,ptin:_Stars,tex:0331db4b7513da848805850b7b5755c4,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Panner,id:25,x:33618,y:32873,spu:0.003,spv:0;n:type:ShaderForge.SFN_Multiply,id:51,x:33158,y:32890|A-8-RGB,B-8-A,C-62-R,D-98-G,E-80-OUT;n:type:ShaderForge.SFN_Tex2d,id:62,x:33395,y:33091,ptlb:Noise1,ptin:_Noise1,tex:16a309ec40c18f24aaf81f5e14b9c7d7,ntxv:0,isnm:False|UVIN-25-UVOUT;n:type:ShaderForge.SFN_Vector1,id:80,x:33216,y:33091,v1:10;n:type:ShaderForge.SFN_Tex2d,id:98,x:33395,y:33294,ptlb:Noise2,ptin:_Noise2,tex:16a309ec40c18f24aaf81f5e14b9c7d7,ntxv:0,isnm:False|UVIN-99-UVOUT;n:type:ShaderForge.SFN_Panner,id:99,x:33660,y:33296,spu:-0.003,spv:0;n:type:ShaderForge.SFN_TexCoord,id:156,x:33839,y:33444,uv:0;n:type:ShaderForge.SFN_Tex2d,id:166,x:33208,y:32698,ptlb:Background,ptin:_Background,tex:084c93ee8f76d1a4b994b572744562cb,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:167,x:32977,y:32859|A-166-RGB,B-51-OUT;proporder:8-62-98-166;pass:END;sub:END;*/

Shader "Shader Forge/SkyboxShader" {
    Properties {
        _Stars ("Stars", 2D) = "white" {}
        _Noise1 ("Noise1", 2D) = "white" {}
        _Noise2 ("Noise2", 2D) = "white" {}
        _Background ("Background", 2D) = "white" {}
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
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _Stars; uniform float4 _Stars_ST;
            uniform sampler2D _Noise1; uniform float4 _Noise1_ST;
            uniform sampler2D _Noise2; uniform float4 _Noise2_ST;
            uniform sampler2D _Background; uniform float4 _Background_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Normals:
                float3 normalDirection =  i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 diffuse = max( 0.0, NdotL) * attenColor + UNITY_LIGHTMODEL_AMBIENT.rgb;
////// Emissive:
                float2 node_183 = i.uv0;
                float4 node_8 = tex2D(_Stars,TRANSFORM_TEX(node_183.rg, _Stars));
                float4 node_184 = _Time + _TimeEditor;
                float2 node_25 = (node_183.rg+node_184.g*float2(0.003,0));
                float2 node_99 = (node_183.rg+node_184.g*float2(-0.003,0));
                float3 node_167 = (tex2D(_Background,TRANSFORM_TEX(node_183.rg, _Background)).rgb+(node_8.rgb*node_8.a*tex2D(_Noise1,TRANSFORM_TEX(node_25, _Noise1)).r*tex2D(_Noise2,TRANSFORM_TEX(node_99, _Noise2)).g*10.0));
                float3 emissive = node_167;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                finalColor += diffuseLight * node_167;
                finalColor += emissive;
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
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _Stars; uniform float4 _Stars_ST;
            uniform sampler2D _Noise1; uniform float4 _Noise1_ST;
            uniform sampler2D _Noise2; uniform float4 _Noise2_ST;
            uniform sampler2D _Background; uniform float4 _Background_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Normals:
                float3 normalDirection =  i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 diffuse = max( 0.0, NdotL) * attenColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                float2 node_185 = i.uv0;
                float4 node_8 = tex2D(_Stars,TRANSFORM_TEX(node_185.rg, _Stars));
                float4 node_186 = _Time + _TimeEditor;
                float2 node_25 = (node_185.rg+node_186.g*float2(0.003,0));
                float2 node_99 = (node_185.rg+node_186.g*float2(-0.003,0));
                float3 node_167 = (tex2D(_Background,TRANSFORM_TEX(node_185.rg, _Background)).rgb+(node_8.rgb*node_8.a*tex2D(_Noise1,TRANSFORM_TEX(node_25, _Noise1)).r*tex2D(_Noise2,TRANSFORM_TEX(node_99, _Noise2)).g*10.0));
                finalColor += diffuseLight * node_167;
/// Final Color:
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:0,lgpr:1,nrmq:1,limd:2,uamb:False,mssp:False,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:True,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32582,y:32671|diff-2-RGB,spec-1400-OUT,gloss-826-OUT,normal-1010-OUT,emission-2310-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:33150,y:32083,ptlb:MarsTexture,ptin:_MarsTexture,tex:c106e6185b810d44e8800885b2e25b95,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8,x:33956,y:33288,ptlb:NightMask,ptin:_NightMask,tex:e003df777ca52834f80746656e3ab8e9,ntxv:3,isnm:False;n:type:ShaderForge.SFN_Multiply,id:14,x:33781,y:33194|A-16-RGB,B-8-R;n:type:ShaderForge.SFN_Color,id:16,x:33956,y:33113,ptlb:NightLightColor,ptin:_NightLightColor,glob:False,c1:1,c2:0.8320487,c3:0.4705882,c4:1;n:type:ShaderForge.SFN_Color,id:221,x:33475,y:32328,ptlb:SpecularColor,ptin:_SpecularColor,glob:False,c1:0.9044118,c2:0.8787287,c3:0.77141,c4:1;n:type:ShaderForge.SFN_LightVector,id:426,x:34040,y:32901;n:type:ShaderForge.SFN_NormalVector,id:473,x:34040,y:32727,pt:False;n:type:ShaderForge.SFN_Dot,id:474,x:33870,y:32802,dt:0|A-473-OUT,B-426-OUT;n:type:ShaderForge.SFN_Multiply,id:499,x:33435,y:33156|A-2300-OUT,B-14-OUT;n:type:ShaderForge.SFN_Tex2d,id:758,x:33372,y:32774,ptlb:NormalMap,ptin:_NormalMap,tex:5d1d1935bb539e847a0e9d0ce9bac572,ntxv:3,isnm:True;n:type:ShaderForge.SFN_ValueProperty,id:826,x:32913,y:32728,ptlb:Gloss,ptin:_Gloss,glob:False,v1:0.4;n:type:ShaderForge.SFN_Multiply,id:1010,x:33164,y:32853|A-758-RGB,B-1013-OUT;n:type:ShaderForge.SFN_Vector3,id:1013,x:33336,y:32980,v1:1,v2:1,v3:3;n:type:ShaderForge.SFN_Multiply,id:1034,x:33151,y:32396|A-2-R,B-221-RGB,C-2205-OUT;n:type:ShaderForge.SFN_Multiply,id:1400,x:32986,y:32544|A-1034-OUT,B-2262-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2205,x:33475,y:32489,ptlb:SpecularIntensity,ptin:_SpecularIntensity,glob:False,v1:3;n:type:ShaderForge.SFN_OneMinus,id:2262,x:33372,y:32583|IN-474-OUT;n:type:ShaderForge.SFN_OneMinus,id:2300,x:33701,y:32925|IN-474-OUT;n:type:ShaderForge.SFN_Add,id:2310,x:33123,y:33270|A-499-OUT,B-2311-OUT;n:type:ShaderForge.SFN_Multiply,id:2311,x:33470,y:33367|A-2-RGB,B-2312-OUT,C-2313-OUT;n:type:ShaderForge.SFN_Vector1,id:2312,x:33689,y:33401,v1:0.03;n:type:ShaderForge.SFN_Fresnel,id:2313,x:33689,y:33467;proporder:2-8-758-826-16-221-2205;pass:END;sub:END;*/

Shader "Planet Shaders/MarsShader" {
    Properties {
        _MarsTexture ("MarsTexture", 2D) = "white" {}
        _NightMask ("NightMask", 2D) = "bump" {}
        _NormalMap ("NormalMap", 2D) = "bump" {}
        _Gloss ("Gloss", Float ) = 0.4
        _NightLightColor ("NightLightColor", Color) = (1,0.8320487,0.4705882,1)
        _SpecularColor ("SpecularColor", Color) = (0.9044118,0.8787287,0.77141,1)
        _SpecularIntensity ("SpecularIntensity", Float ) = 3
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
            uniform float4 _LightColor0;
            uniform sampler2D _MarsTexture; uniform float4 _MarsTexture_ST;
            uniform sampler2D _NightMask; uniform float4 _NightMask_ST;
            uniform float4 _NightLightColor;
            uniform float4 _SpecularColor;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform float _Gloss;
            uniform float _SpecularIntensity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 binormalDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                o.tangentDir = normalize( mul( _Object2World, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.binormalDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.binormalDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float2 node_2322 = i.uv0;
                float3 normalLocal = (UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(node_2322.rg, _NormalMap))).rgb*float3(1,1,3));
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 diffuse = max( 0.0, NdotL) * attenColor;
////// Emissive:
                float node_474 = dot(i.normalDir,lightDirection);
                float4 node_2 = tex2D(_MarsTexture,TRANSFORM_TEX(node_2322.rg, _MarsTexture));
                float3 emissive = (((1.0 - node_474)*(_NightLightColor.rgb*tex2D(_NightMask,TRANSFORM_TEX(node_2322.rg, _NightMask)).r))+(node_2.rgb*0.03*(1.0-max(0,dot(normalDirection, viewDirection)))));
///////// Gloss:
                float gloss = _Gloss;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float3 specularColor = ((node_2.r*_SpecularColor.rgb*_SpecularIntensity)*(1.0 - node_474));
                float3 specular = attenColor * pow(max(0,dot(reflect(-lightDirection, normalDirection),viewDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                finalColor += diffuseLight * node_2.rgb;
                finalColor += specular;
                finalColor += emissive;
/// Final Color:
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

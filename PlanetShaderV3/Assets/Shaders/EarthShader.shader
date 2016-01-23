// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:0,lgpr:1,nrmq:1,limd:2,uamb:False,mssp:False,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:True,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32432,y:32677|diff-1473-OUT,spec-1400-OUT,gloss-826-OUT,normal-1010-OUT,emission-2457-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:33173,y:32254,ptlb:MainTexture,ptin:_MainTexture,tex:59f8be448ea1d9846b54e37bbbccc742,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8,x:34170,y:32734,ptlb:NightMask,ptin:_NightMask,tex:e003df777ca52834f80746656e3ab8e9,ntxv:3,isnm:False;n:type:ShaderForge.SFN_Multiply,id:14,x:33995,y:32640|A-16-RGB,B-8-R;n:type:ShaderForge.SFN_Color,id:16,x:34170,y:32559,ptlb:NightLightColor,ptin:_NightLightColor,glob:False,c1:1,c2:0.8320487,c3:0.4705882,c4:1;n:type:ShaderForge.SFN_Color,id:221,x:33347,y:32326,ptlb:SpecularColor,ptin:_SpecularColor,glob:False,c1:0.9558824,c2:0.8977152,c3:0.745026,c4:1;n:type:ShaderForge.SFN_Color,id:239,x:33615,y:33015,ptlb:DarkCloud,ptin:_DarkCloud,glob:False,c1:0.05493079,c2:0.05656843,c3:0.05882353,c4:1;n:type:ShaderForge.SFN_Multiply,id:244,x:33357,y:33035|A-267-R,B-239-RGB;n:type:ShaderForge.SFN_Tex2d,id:267,x:33911,y:31880,ptlb:Clouds,ptin:_Clouds,tex:cbb82c3e2f06fe74982c86f884f8b947,ntxv:0,isnm:False|UVIN-1259-UVOUT;n:type:ShaderForge.SFN_Panner,id:283,x:34465,y:32058,spu:0.001,spv:0;n:type:ShaderForge.SFN_LightVector,id:426,x:34254,y:32347;n:type:ShaderForge.SFN_NormalVector,id:473,x:34254,y:32173,pt:False;n:type:ShaderForge.SFN_Dot,id:474,x:34084,y:32248,dt:0|A-473-OUT,B-426-OUT;n:type:ShaderForge.SFN_Multiply,id:499,x:33633,y:33216|A-522-OUT,B-1080-OUT;n:type:ShaderForge.SFN_Negate,id:522,x:33819,y:32373|IN-474-OUT;n:type:ShaderForge.SFN_Max,id:644,x:33112,y:33122|A-244-OUT,B-499-OUT;n:type:ShaderForge.SFN_Tex2d,id:758,x:33099,y:32789,ptlb:NormalMap,ptin:_NormalMap,tex:fe4b26e5283ca5142b422d6c5515392d,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Multiply,id:777,x:33001,y:32012|A-267-R,B-782-OUT;n:type:ShaderForge.SFN_Vector1,id:782,x:33188,y:32064,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:826,x:32913,y:32728,ptlb:Gloss,ptin:_Gloss,glob:False,v1:0.4;n:type:ShaderForge.SFN_Multiply,id:1010,x:32898,y:32946|A-758-RGB,B-1013-OUT;n:type:ShaderForge.SFN_Vector3,id:1013,x:33085,y:32964,v1:1,v2:1,v3:7;n:type:ShaderForge.SFN_Tex2d,id:1033,x:33323,y:32739,ptlb:SpecularMap,ptin:_SpecularMap,tex:00f97f091758963408b24a975b54f78c,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:1034,x:33173,y:32436|A-221-RGB,B-1033-RGB,C-2205-OUT;n:type:ShaderForge.SFN_Multiply,id:1080,x:33857,y:32563|A-1095-OUT,B-14-OUT;n:type:ShaderForge.SFN_Vector1,id:1095,x:33995,y:32485,v1:1.2;n:type:ShaderForge.SFN_Parallax,id:1259,x:34294,y:31876|UVIN-283-UVOUT,HEI-1268-OUT;n:type:ShaderForge.SFN_Vector1,id:1268,x:34482,y:31896,v1:0.8;n:type:ShaderForge.SFN_Tex2d,id:1311,x:33503,y:32135,ptlb:CloudShadows,ptin:_CloudShadows,tex:cbb82c3e2f06fe74982c86f884f8b947,ntxv:0,isnm:False|UVIN-283-UVOUT;n:type:ShaderForge.SFN_Multiply,id:1379,x:33001,y:32162|A-2185-OUT,B-2-RGB;n:type:ShaderForge.SFN_Multiply,id:1400,x:32986,y:32544|A-1034-OUT,B-2262-OUT;n:type:ShaderForge.SFN_Add,id:1473,x:32752,y:32183|A-777-OUT,B-1379-OUT;n:type:ShaderForge.SFN_OneMinus,id:2185,x:33329,y:32135|IN-1311-RGB;n:type:ShaderForge.SFN_ValueProperty,id:2205,x:33439,y:32475,ptlb:SpecularIntensity,ptin:_SpecularIntensity,glob:False,v1:1;n:type:ShaderForge.SFN_OneMinus,id:2262,x:33372,y:32583|IN-474-OUT;n:type:ShaderForge.SFN_Add,id:2457,x:32934,y:33249|A-644-OUT,B-2460-OUT;n:type:ShaderForge.SFN_Multiply,id:2460,x:33130,y:33338|A-1379-OUT,B-2467-OUT,C-2540-OUT;n:type:ShaderForge.SFN_Vector1,id:2467,x:33334,y:33370,v1:0.03;n:type:ShaderForge.SFN_Fresnel,id:2540,x:33344,y:33481;proporder:2-8-267-1033-1311-758-826-16-239-221-2205;pass:END;sub:END;*/

Shader "Planet Shaders/EarthShader" {
    Properties {
        _MainTexture ("MainTexture", 2D) = "white" {}
        _NightMask ("NightMask", 2D) = "bump" {}
        _Clouds ("Clouds", 2D) = "white" {}
        _SpecularMap ("SpecularMap", 2D) = "white" {}
        _CloudShadows ("CloudShadows", 2D) = "white" {}
        _NormalMap ("NormalMap", 2D) = "bump" {}
        _Gloss ("Gloss", Float ) = 0.4
        _NightLightColor ("NightLightColor", Color) = (1,0.8320487,0.4705882,1)
        _DarkCloud ("DarkCloud", Color) = (0.05493079,0.05656843,0.05882353,1)
        _SpecularColor ("SpecularColor", Color) = (0.9558824,0.8977152,0.745026,1)
        _SpecularIntensity ("SpecularIntensity", Float ) = 1
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
            uniform float4 _TimeEditor;
            uniform sampler2D _MainTexture; uniform float4 _MainTexture_ST;
            uniform sampler2D _NightMask; uniform float4 _NightMask_ST;
            uniform float4 _NightLightColor;
            uniform float4 _SpecularColor;
            uniform float4 _DarkCloud;
            uniform sampler2D _Clouds; uniform float4 _Clouds_ST;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform float _Gloss;
            uniform sampler2D _SpecularMap; uniform float4 _SpecularMap_ST;
            uniform sampler2D _CloudShadows; uniform float4 _CloudShadows_ST;
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
                float2 node_2560 = i.uv0;
                float3 normalLocal = (UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(node_2560.rg, _NormalMap))).rgb*float3(1,1,7));
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 diffuse = max( 0.0, NdotL) * attenColor;
////// Emissive:
                float4 node_2561 = _Time + _TimeEditor;
                float2 node_283 = (node_2560.rg+node_2561.g*float2(0.001,0));
                float2 node_1259 = (0.05*(0.8 - 0.5)*mul(tangentTransform, viewDirection).xy + node_283);
                float4 node_267 = tex2D(_Clouds,TRANSFORM_TEX(node_1259.rg, _Clouds));
                float node_474 = dot(i.normalDir,lightDirection);
                float3 node_1379 = ((1.0 - tex2D(_CloudShadows,TRANSFORM_TEX(node_283, _CloudShadows)).rgb)*tex2D(_MainTexture,TRANSFORM_TEX(node_2560.rg, _MainTexture)).rgb);
                float3 emissive = (max((node_267.r*_DarkCloud.rgb),((-1*node_474)*(1.2*(_NightLightColor.rgb*tex2D(_NightMask,TRANSFORM_TEX(node_2560.rg, _NightMask)).r))))+(node_1379*0.03*(1.0-max(0,dot(normalDirection, viewDirection)))));
///////// Gloss:
                float gloss = _Gloss;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float3 specularColor = ((_SpecularColor.rgb*tex2D(_SpecularMap,TRANSFORM_TEX(node_2560.rg, _SpecularMap)).rgb*_SpecularIntensity)*(1.0 - node_474));
                float3 specular = attenColor * pow(max(0,dot(reflect(-lightDirection, normalDirection),viewDirection)),specPow) * specularColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                finalColor += diffuseLight * ((node_267.r*1.0)+node_1379);
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

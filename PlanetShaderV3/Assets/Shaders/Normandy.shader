// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:0,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:True,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:1,fgcg:0,fgcb:0,fgca:1,fgde:0.97,fgrn:0,fgrf:100,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32457,y:32693|diff-2-RGB,spec-30-G,emission-51-OUT,transm-84-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:33750,y:32540,ptlb:node_2,ptin:_node_2,tex:c0b20cc681df43d4a9d79482e118115c,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:30,x:33328,y:32884,ptlb:node_30,ptin:_node_30,tex:4d23ce04798f7e2428f00ab165c0133d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:35,x:33078,y:32998|A-30-R,B-36-RGB,C-75-OUT;n:type:ShaderForge.SFN_Color,id:36,x:33328,y:33091,ptlb:node_36,ptin:_node_36,glob:False,c1:1,c2:0.4344828,c3:0,c4:1;n:type:ShaderForge.SFN_Fresnel,id:50,x:33766,y:33332;n:type:ShaderForge.SFN_Add,id:51,x:32916,y:33084|A-35-OUT,B-56-OUT;n:type:ShaderForge.SFN_Power,id:56,x:33077,y:33365|VAL-66-OUT,EXP-57-OUT;n:type:ShaderForge.SFN_Vector1,id:57,x:33310,y:33525,v1:6;n:type:ShaderForge.SFN_Multiply,id:66,x:33502,y:33290|A-2-RGB,B-50-OUT;n:type:ShaderForge.SFN_Vector1,id:75,x:33139,y:33149,v1:4;n:type:ShaderForge.SFN_Vector1,id:84,x:32871,y:32876,v1:0.1;proporder:2-30-36;pass:END;sub:END;*/

Shader "Shader Forge/Normandy" {
    Properties {
        _node_2 ("node_2", 2D) = "white" {}
        _node_30 ("node_30", 2D) = "white" {}
        _node_36 ("node_36", Color) = (1,0.4344828,0,1)
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
            uniform sampler2D _node_2; uniform float4 _node_2_ST;
            uniform sampler2D _node_30; uniform float4 _node_30_ST;
            uniform float4 _node_36;
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
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float3 normalDirection =  i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 forwardLight = max(0.0, NdotL );
                float node_84 = 0.1;
                float3 backLight = max(0.0, -NdotL ) * float3(node_84,node_84,node_84);
                float3 diffuse = (forwardLight+backLight) * attenColor + UNITY_LIGHTMODEL_AMBIENT.rgb;
////// Emissive:
                float2 node_92 = i.uv0;
                float4 node_30 = tex2D(_node_30,TRANSFORM_TEX(node_92.rg, _node_30));
                float4 node_2 = tex2D(_node_2,TRANSFORM_TEX(node_92.rg, _node_2));
                float3 emissive = ((node_30.r*_node_36.rgb*4.0)+pow((node_2.rgb*(1.0-max(0,dot(normalDirection, viewDirection)))),6.0));
///////// Gloss:
                float gloss = 0.5;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float3 specularColor = float3(node_30.g,node_30.g,node_30.g);
                float3 specular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow) * specularColor;
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

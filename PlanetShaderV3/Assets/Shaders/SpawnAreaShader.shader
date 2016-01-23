// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:2,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:1,fgcg:0,fgcb:0,fgca:1,fgde:0.97,fgrn:0,fgrf:100,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32544,y:32712|emission-26-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:33857,y:32773,ptlb:Texture,ptin:_Texture,tex:207a2eb32912a294d90a750e403cd202,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:3,x:33088,y:32786|A-2-R,B-5-RGB,C-6-OUT;n:type:ShaderForge.SFN_Color,id:5,x:33321,y:32836,ptlb:Color1,ptin:_Color1,glob:False,c1:0.1838235,c2:0.6284989,c3:1,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:6,x:33321,y:33056,ptlb:Intensity1,ptin:_Intensity1,glob:False,v1:0.1;n:type:ShaderForge.SFN_Color,id:16,x:33343,y:32324,ptlb:Color2,ptin:_Color2,glob:False,c1:0.6680737,c2:0.9264706,c3:0.07493514,c4:1;n:type:ShaderForge.SFN_Add,id:26,x:32908,y:32648|A-27-OUT,B-3-OUT,C-71-OUT;n:type:ShaderForge.SFN_Multiply,id:27,x:33088,y:32530|A-16-RGB,B-34-OUT,C-2-G;n:type:ShaderForge.SFN_ValueProperty,id:34,x:33343,y:32530,ptlb:Intensity2,ptin:_Intensity2,glob:False,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:71,x:33085,y:33168|A-2-B,B-73-RGB,C-79-OUT;n:type:ShaderForge.SFN_Color,id:73,x:33321,y:33184,ptlb:Color3,ptin:_Color3,glob:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:79,x:33309,y:33378,ptlb:Intensity3,ptin:_Intensity3,glob:False,v1:1;proporder:2-5-6-16-34-73-79;pass:END;sub:END;*/

Shader "Shader Forge/SpawnAreaShader" {
    Properties {
        _Texture ("Texture", 2D) = "white" {}
        _Color1 ("Color1", Color) = (0.1838235,0.6284989,1,1)
        _Intensity1 ("Intensity1", Float ) = 0.1
        _Color2 ("Color2", Color) = (0.6680737,0.9264706,0.07493514,1)
        _Intensity2 ("Intensity2", Float ) = 0.5
        _Color3 ("Color3", Color) = (1,0,0,1)
        _Intensity3 ("Intensity3", Float ) = 1
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
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform float4 _Color1;
            uniform float _Intensity1;
            uniform float4 _Color2;
            uniform float _Intensity2;
            uniform float4 _Color3;
            uniform float _Intensity3;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float2 node_89 = i.uv0;
                float4 node_2 = tex2D(_Texture,TRANSFORM_TEX(node_89.rg, _Texture));
                float3 emissive = ((_Color2.rgb*_Intensity2*node_2.g)+(node_2.r*_Color1.rgb*_Intensity1)+(node_2.b*_Color3.rgb*_Intensity3));
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

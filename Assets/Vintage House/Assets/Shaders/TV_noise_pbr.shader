// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:3,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,rpth:1,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:2865,x:33309,y:32718,varname:node_2865,prsc:2|diff-8044-OUT,spec-9219-OUT,gloss-7199-A,normal-5964-RGB,emission-9080-OUT,difocc-5058-OUT,spcocc-5058-OUT;n:type:ShaderForge.SFN_Tex2d,id:5964,x:32740,y:32939,ptovrint:True,ptlb:Normal Map,ptin:_BumpMap,varname:_BumpMap,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Time,id:491,x:31419,y:33310,varname:node_491,prsc:2;n:type:ShaderForge.SFN_Sin,id:336,x:32053,y:33190,varname:node_336,prsc:2|IN-5832-OUT;n:type:ShaderForge.SFN_Vector1,id:6847,x:31632,y:33406,varname:node_6847,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:5832,x:31909,y:33278,varname:node_5832,prsc:2|A-491-T,B-6847-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:1676,x:30361,y:32664,ptovrint:False,ptlb:Noise,ptin:_Noise,varname:node_1676,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:12ed8b16dc2779f40aa90756c69ba2ca,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:7896,x:30348,y:32500,varname:node_7896,prsc:2,uv:0;n:type:ShaderForge.SFN_Panner,id:1901,x:30857,y:32714,varname:node_1901,prsc:2,spu:3,spv:4|UVIN-7896-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:5307,x:31205,y:32715,varname:node_5307,prsc:2,tex:12ed8b16dc2779f40aa90756c69ba2ca,ntxv:0,isnm:False|UVIN-1901-UVOUT,TEX-1676-TEX;n:type:ShaderForge.SFN_Panner,id:9946,x:30846,y:32502,varname:node_9946,prsc:2,spu:0,spv:0.3|UVIN-7896-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:4903,x:31217,y:32529,varname:node_4903,prsc:2,tex:12ed8b16dc2779f40aa90756c69ba2ca,ntxv:0,isnm:False|UVIN-9946-UVOUT,TEX-1676-TEX;n:type:ShaderForge.SFN_Multiply,id:8454,x:31937,y:32650,varname:node_8454,prsc:2|A-8625-OUT,B-3619-OUT;n:type:ShaderForge.SFN_Tex2d,id:6304,x:31232,y:32350,varname:node_6304,prsc:2,tex:12ed8b16dc2779f40aa90756c69ba2ca,ntxv:0,isnm:False|UVIN-1051-UVOUT,TEX-1676-TEX;n:type:ShaderForge.SFN_Panner,id:1051,x:30846,y:32353,varname:node_1051,prsc:2,spu:1,spv:3|UVIN-7896-UVOUT;n:type:ShaderForge.SFN_Add,id:662,x:32108,y:32507,varname:node_662,prsc:2|A-9584-OUT,B-8454-OUT;n:type:ShaderForge.SFN_Add,id:7305,x:31631,y:32578,varname:node_7305,prsc:2|A-9501-RGB,B-4903-G;n:type:ShaderForge.SFN_Multiply,id:4030,x:31631,y:32356,varname:node_4030,prsc:2|A-764-RGB,B-6304-A;n:type:ShaderForge.SFN_Color,id:9924,x:31304,y:32856,ptovrint:False,ptlb:Noise1,ptin:_Noise1,varname:node_9924,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1363538,c2:0.1911765,c3:0.1363538,c4:1;n:type:ShaderForge.SFN_Color,id:9501,x:31471,y:32621,ptovrint:False,ptlb:Noise2,ptin:_Noise2,varname:node_9501,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1872539,c2:0.1985294,c3:0.1693339,c4:1;n:type:ShaderForge.SFN_Color,id:764,x:31471,y:32434,ptovrint:False,ptlb:Noise3,ptin:_Noise3,varname:node_764,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4117647,c2:0.4117647,c3:0.4117647,c4:1;n:type:ShaderForge.SFN_Add,id:249,x:31569,y:32814,varname:node_249,prsc:2|A-9924-RGB,B-5307-R;n:type:ShaderForge.SFN_Add,id:6651,x:32612,y:32834,varname:node_6651,prsc:2|A-5314-OUT,B-8726-OUT;n:type:ShaderForge.SFN_Multiply,id:9268,x:31902,y:33479,varname:node_9268,prsc:2|A-491-T,B-7756-OUT;n:type:ShaderForge.SFN_Vector1,id:7756,x:31632,y:33552,varname:node_7756,prsc:2,v1:7;n:type:ShaderForge.SFN_Sin,id:908,x:32053,y:33415,varname:node_908,prsc:2|IN-9268-OUT;n:type:ShaderForge.SFN_Multiply,id:316,x:32293,y:33121,varname:node_316,prsc:2|A-336-OUT,B-908-OUT,C-4895-OUT;n:type:ShaderForge.SFN_Multiply,id:394,x:31914,y:33642,varname:node_394,prsc:2|A-491-T,B-9613-OUT;n:type:ShaderForge.SFN_Sin,id:4895,x:32066,y:33560,varname:node_4895,prsc:2|IN-394-OUT;n:type:ShaderForge.SFN_Vector1,id:9613,x:31650,y:33730,varname:node_9613,prsc:2,v1:5;n:type:ShaderForge.SFN_RemapRange,id:5314,x:32446,y:33080,varname:node_5314,prsc:2,frmn:0,frmx:1,tomn:0,tomx:0.2|IN-316-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:8625,x:31768,y:32546,varname:node_8625,prsc:2,min:0,max:1|IN-7305-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:3619,x:31768,y:32741,varname:node_3619,prsc:2,min:0,max:1|IN-4972-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:9584,x:31778,y:32346,varname:node_9584,prsc:2,min:0,max:1|IN-4030-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:8726,x:32397,y:32515,varname:node_8726,prsc:2,min:0,max:1|IN-2805-OUT;n:type:ShaderForge.SFN_Tex2d,id:5745,x:31220,y:32197,varname:node_5745,prsc:2,tex:12ed8b16dc2779f40aa90756c69ba2ca,ntxv:0,isnm:False|UVIN-766-UVOUT,TEX-1676-TEX;n:type:ShaderForge.SFN_Panner,id:766,x:30859,y:32203,varname:node_766,prsc:2,spu:-0.1,spv:1|UVIN-7896-UVOUT;n:type:ShaderForge.SFN_Multiply,id:6909,x:31670,y:32114,varname:node_6909,prsc:2|A-8645-RGB,B-5745-B;n:type:ShaderForge.SFN_Color,id:8645,x:31478,y:32214,ptovrint:False,ptlb:Noise4,ptin:_Noise4,varname:node_8645,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1854995,c2:0.3455882,c3:0.3257152,c4:1;n:type:ShaderForge.SFN_ConstantClamp,id:1618,x:31887,y:32140,varname:node_1618,prsc:2,min:0,max:1|IN-6909-OUT;n:type:ShaderForge.SFN_Add,id:2805,x:32229,y:32365,varname:node_2805,prsc:2|A-6909-OUT,B-662-OUT;n:type:ShaderForge.SFN_Tex2d,id:6053,x:32740,y:32492,ptovrint:False,ptlb:Base Texture Mask(A),ptin:_BaseTextureMaskA,varname:node_6053,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:7199,x:32740,y:32710,ptovrint:False,ptlb:Metallic,ptin:_Metallic,varname:node_7199,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Desaturate,id:9219,x:32923,y:32710,varname:node_9219,prsc:2|COL-7199-RGB;n:type:ShaderForge.SFN_Tex2d,id:7654,x:32731,y:33231,ptovrint:False,ptlb:AO,ptin:_AO,varname:node_7654,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Desaturate,id:5058,x:32923,y:33174,varname:node_5058,prsc:2|COL-7654-R;n:type:ShaderForge.SFN_Multiply,id:9080,x:33013,y:32920,varname:node_9080,prsc:2|A-6053-A,B-6651-OUT;n:type:ShaderForge.SFN_Lerp,id:8044,x:33039,y:32465,varname:node_8044,prsc:2|A-6053-RGB,B-8726-OUT,T-6053-A;n:type:ShaderForge.SFN_Tex2d,id:5083,x:31478,y:33120,ptovrint:False,ptlb:TV Shots,ptin:_TVShots,varname:node_5083,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c29e7d0d1fff8c248b89f594df62fc43,ntxv:0,isnm:False|UVIN-9306-UVOUT;n:type:ShaderForge.SFN_Multiply,id:4972,x:31684,y:33032,varname:node_4972,prsc:2|A-5083-RGB,B-249-OUT;n:type:ShaderForge.SFN_Multiply,id:1110,x:30804,y:33114,varname:node_1110,prsc:2|A-7896-UVOUT,B-5506-OUT;n:type:ShaderForge.SFN_Panner,id:9306,x:31091,y:33071,varname:node_9306,prsc:2,spu:0.6,spv:1|UVIN-1110-OUT;n:type:ShaderForge.SFN_Vector1,id:5506,x:30644,y:33271,varname:node_5506,prsc:2,v1:0.18;proporder:6053-5964-7199-7654-1676-9924-9501-764-8645-5083;pass:END;sub:END;*/

Shader "MK4/TV_noise_pbr" {
    Properties {
        _BaseTextureMaskA ("Base Texture Mask(A)", 2D) = "white" {}
        _BumpMap ("Normal Map", 2D) = "bump" {}
        _Metallic ("Metallic", 2D) = "black" {}
        _AO ("AO", 2D) = "white" {}
        _Noise ("Noise", 2D) = "white" {}
        _Noise1 ("Noise1", Color) = (0.1363538,0.1911765,0.1363538,1)
        _Noise2 ("Noise2", Color) = (0.1872539,0.1985294,0.1693339,1)
        _Noise3 ("Noise3", Color) = (0.4117647,0.4117647,0.4117647,1)
        _Noise4 ("Noise4", Color) = (0.1854995,0.3455882,0.3257152,1)
        _TVShots ("TV Shots", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "DEFERRED"
            Tags {
                "LightMode"="Deferred"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_DEFERRED
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile ___ UNITY_HDR_ON
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x xboxone ps4 n3ds 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _BumpMap; uniform float4 _BumpMap_ST;
            uniform sampler2D _Noise; uniform float4 _Noise_ST;
            uniform float4 _Noise1;
            uniform float4 _Noise2;
            uniform float4 _Noise3;
            uniform float4 _Noise4;
            uniform sampler2D _BaseTextureMaskA; uniform float4 _BaseTextureMaskA_ST;
            uniform sampler2D _Metallic; uniform float4 _Metallic_ST;
            uniform sampler2D _AO; uniform float4 _AO_ST;
            uniform sampler2D _TVShots; uniform float4 _TVShots_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                #if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
                    float4 ambientOrLightmapUV : TEXCOORD7;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                #ifdef LIGHTMAP_ON
                    o.ambientOrLightmapUV.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    o.ambientOrLightmapUV.zw = 0;
                #elif UNITY_SHOULD_SAMPLE_SH
                #endif
                #ifdef DYNAMICLIGHTMAP_ON
                    o.ambientOrLightmapUV.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
                #endif
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex );
                return o;
            }
            void frag(
                VertexOutput i,
                out half4 outDiffuse : SV_Target0,
                out half4 outSpecSmoothness : SV_Target1,
                out half4 outNormal : SV_Target2,
                out half4 outEmission : SV_Target3 )
            {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _BumpMap_var = UnpackNormal(tex2D(_BumpMap,TRANSFORM_TEX(i.uv0, _BumpMap)));
                float3 normalLocal = _BumpMap_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
////// Lighting:
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float4 _Metallic_var = tex2D(_Metallic,TRANSFORM_TEX(i.uv0, _Metallic));
                float gloss = _Metallic_var.a;
/////// GI Data:
                UnityLight light; // Dummy light
                light.color = 0;
                light.dir = half3(0,1,0);
                light.ndotl = max(0,dot(normalDirection,light.dir));
                UnityGIInput d;
                d.light = light;
                d.worldPos = i.posWorld.xyz;
                d.worldViewDir = viewDirection;
                d.atten = 1;
                #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
                    d.ambient = 0;
                    d.lightmapUV = i.ambientOrLightmapUV;
                #else
                    d.ambient = i.ambientOrLightmapUV;
                #endif
                #if UNITY_SPECCUBE_BLENDING || UNITY_SPECCUBE_BOX_PROJECTION
                    d.boxMin[0] = unity_SpecCube0_BoxMin;
                    d.boxMin[1] = unity_SpecCube1_BoxMin;
                #endif
                #if UNITY_SPECCUBE_BOX_PROJECTION
                    d.boxMax[0] = unity_SpecCube0_BoxMax;
                    d.boxMax[1] = unity_SpecCube1_BoxMax;
                    d.probePosition[0] = unity_SpecCube0_ProbePosition;
                    d.probePosition[1] = unity_SpecCube1_ProbePosition;
                #endif
                d.probeHDR[0] = unity_SpecCube0_HDR;
                d.probeHDR[1] = unity_SpecCube1_HDR;
                Unity_GlossyEnvironmentData ugls_en_data;
                ugls_en_data.roughness = 1.0 - gloss;
                ugls_en_data.reflUVW = viewReflectDirection;
                UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
////// Specular:
                float3 specularColor = dot(_Metallic_var.rgb,float3(0.3,0.59,0.11));
                float specularMonochrome;
                float4 _BaseTextureMaskA_var = tex2D(_BaseTextureMaskA,TRANSFORM_TEX(i.uv0, _BaseTextureMaskA));
                float4 node_5940 = _Time + _TimeEditor;
                float2 node_766 = (i.uv0+node_5940.g*float2(-0.1,1));
                float4 node_5745 = tex2D(_Noise,TRANSFORM_TEX(node_766, _Noise));
                float3 node_6909 = (_Noise4.rgb*node_5745.b);
                float2 node_1051 = (i.uv0+node_5940.g*float2(1,3));
                float4 node_6304 = tex2D(_Noise,TRANSFORM_TEX(node_1051, _Noise));
                float2 node_9946 = (i.uv0+node_5940.g*float2(0,0.3));
                float4 node_4903 = tex2D(_Noise,TRANSFORM_TEX(node_9946, _Noise));
                float2 node_9306 = ((i.uv0*0.18)+node_5940.g*float2(0.6,1));
                float4 _TVShots_var = tex2D(_TVShots,TRANSFORM_TEX(node_9306, _TVShots));
                float2 node_1901 = (i.uv0+node_5940.g*float2(3,4));
                float4 node_5307 = tex2D(_Noise,TRANSFORM_TEX(node_1901, _Noise));
                float3 node_8726 = clamp((node_6909+(clamp((_Noise3.rgb*node_6304.a),0,1)+(clamp((_Noise2.rgb+node_4903.g),0,1)*clamp((_TVShots_var.rgb*(_Noise1.rgb+node_5307.r)),0,1)))),0,1);
                float3 diffuseColor = lerp(_BaseTextureMaskA_var.rgb,node_8726,_BaseTextureMaskA_var.a); // Need this for specular when using metallic
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, specularColor, specularColor, specularMonochrome );
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = max(0.0,dot( normalDirection, viewDirection ));
                half grazingTerm = saturate( gloss + specularMonochrome );
                float3 indirectSpecular = (gi.indirect.specular);
                indirectSpecular *= FresnelLerp (specularColor, grazingTerm, NdotV);
/////// Diffuse:
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += gi.indirect.diffuse;
                float4 _AO_var = tex2D(_AO,TRANSFORM_TEX(i.uv0, _AO));
                float node_5058 = dot(_AO_var.r,float3(0.3,0.59,0.11));
                indirectDiffuse *= node_5058; // Diffuse AO
////// Emissive:
                float4 node_491 = _Time + _TimeEditor;
                float3 emissive = (_BaseTextureMaskA_var.a*(((sin((node_491.g*2.0))*sin((node_491.g*7.0))*sin((node_491.g*5.0)))*0.2+0.0)+node_8726));
/// Final Color:
                outDiffuse = half4( diffuseColor, node_5058 );
                outSpecSmoothness = half4( specularColor, gloss );
                outNormal = half4( normalDirection * 0.5 + 0.5, 1 );
                outEmission = half4( (_BaseTextureMaskA_var.a*(((sin((node_491.g*2.0))*sin((node_491.g*7.0))*sin((node_491.g*5.0)))*0.2+0.0)+node_8726)), 1 );
                outEmission.rgb += indirectSpecular * node_5058;
                outEmission.rgb += indirectDiffuse * diffuseColor;
                #ifndef UNITY_HDR_ON
                    outEmission.rgb = exp2(-outEmission.rgb);
                #endif
            }
            ENDCG
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x xboxone ps4 n3ds 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _BumpMap; uniform float4 _BumpMap_ST;
            uniform sampler2D _Noise; uniform float4 _Noise_ST;
            uniform float4 _Noise1;
            uniform float4 _Noise2;
            uniform float4 _Noise3;
            uniform float4 _Noise4;
            uniform sampler2D _BaseTextureMaskA; uniform float4 _BaseTextureMaskA_ST;
            uniform sampler2D _Metallic; uniform float4 _Metallic_ST;
            uniform sampler2D _AO; uniform float4 _AO_ST;
            uniform sampler2D _TVShots; uniform float4 _TVShots_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                LIGHTING_COORDS(7,8)
                UNITY_FOG_COORDS(9)
                #if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
                    float4 ambientOrLightmapUV : TEXCOORD10;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                #ifdef LIGHTMAP_ON
                    o.ambientOrLightmapUV.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    o.ambientOrLightmapUV.zw = 0;
                #elif UNITY_SHOULD_SAMPLE_SH
                #endif
                #ifdef DYNAMICLIGHTMAP_ON
                    o.ambientOrLightmapUV.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
                #endif
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _BumpMap_var = UnpackNormal(tex2D(_BumpMap,TRANSFORM_TEX(i.uv0, _BumpMap)));
                float3 normalLocal = _BumpMap_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float4 _Metallic_var = tex2D(_Metallic,TRANSFORM_TEX(i.uv0, _Metallic));
                float gloss = _Metallic_var.a;
                float specPow = exp2( gloss * 10.0+1.0);
/////// GI Data:
                UnityLight light;
                #ifdef LIGHTMAP_OFF
                    light.color = lightColor;
                    light.dir = lightDirection;
                    light.ndotl = LambertTerm (normalDirection, light.dir);
                #else
                    light.color = half3(0.f, 0.f, 0.f);
                    light.ndotl = 0.0f;
                    light.dir = half3(0.f, 0.f, 0.f);
                #endif
                UnityGIInput d;
                d.light = light;
                d.worldPos = i.posWorld.xyz;
                d.worldViewDir = viewDirection;
                d.atten = attenuation;
                #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
                    d.ambient = 0;
                    d.lightmapUV = i.ambientOrLightmapUV;
                #else
                    d.ambient = i.ambientOrLightmapUV;
                #endif
                #if UNITY_SPECCUBE_BLENDING || UNITY_SPECCUBE_BOX_PROJECTION
                    d.boxMin[0] = unity_SpecCube0_BoxMin;
                    d.boxMin[1] = unity_SpecCube1_BoxMin;
                #endif
                #if UNITY_SPECCUBE_BOX_PROJECTION
                    d.boxMax[0] = unity_SpecCube0_BoxMax;
                    d.boxMax[1] = unity_SpecCube1_BoxMax;
                    d.probePosition[0] = unity_SpecCube0_ProbePosition;
                    d.probePosition[1] = unity_SpecCube1_ProbePosition;
                #endif
                d.probeHDR[0] = unity_SpecCube0_HDR;
                d.probeHDR[1] = unity_SpecCube1_HDR;
                Unity_GlossyEnvironmentData ugls_en_data;
                ugls_en_data.roughness = 1.0 - gloss;
                ugls_en_data.reflUVW = viewReflectDirection;
                UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
                lightDirection = gi.light.dir;
                lightColor = gi.light.color;
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float4 _AO_var = tex2D(_AO,TRANSFORM_TEX(i.uv0, _AO));
                float node_5058 = dot(_AO_var.r,float3(0.3,0.59,0.11));
                float3 specularAO = node_5058;
                float LdotH = max(0.0,dot(lightDirection, halfDirection));
                float3 specularColor = dot(_Metallic_var.rgb,float3(0.3,0.59,0.11));
                float specularMonochrome;
                float4 _BaseTextureMaskA_var = tex2D(_BaseTextureMaskA,TRANSFORM_TEX(i.uv0, _BaseTextureMaskA));
                float4 node_7729 = _Time + _TimeEditor;
                float2 node_766 = (i.uv0+node_7729.g*float2(-0.1,1));
                float4 node_5745 = tex2D(_Noise,TRANSFORM_TEX(node_766, _Noise));
                float3 node_6909 = (_Noise4.rgb*node_5745.b);
                float2 node_1051 = (i.uv0+node_7729.g*float2(1,3));
                float4 node_6304 = tex2D(_Noise,TRANSFORM_TEX(node_1051, _Noise));
                float2 node_9946 = (i.uv0+node_7729.g*float2(0,0.3));
                float4 node_4903 = tex2D(_Noise,TRANSFORM_TEX(node_9946, _Noise));
                float2 node_9306 = ((i.uv0*0.18)+node_7729.g*float2(0.6,1));
                float4 _TVShots_var = tex2D(_TVShots,TRANSFORM_TEX(node_9306, _TVShots));
                float2 node_1901 = (i.uv0+node_7729.g*float2(3,4));
                float4 node_5307 = tex2D(_Noise,TRANSFORM_TEX(node_1901, _Noise));
                float3 node_8726 = clamp((node_6909+(clamp((_Noise3.rgb*node_6304.a),0,1)+(clamp((_Noise2.rgb+node_4903.g),0,1)*clamp((_TVShots_var.rgb*(_Noise1.rgb+node_5307.r)),0,1)))),0,1);
                float3 diffuseColor = lerp(_BaseTextureMaskA_var.rgb,node_8726,_BaseTextureMaskA_var.a); // Need this for specular when using metallic
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, specularColor, specularColor, specularMonochrome );
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = max(0.0,dot( normalDirection, viewDirection ));
                float NdotH = max(0.0,dot( normalDirection, halfDirection ));
                float VdotH = max(0.0,dot( viewDirection, halfDirection ));
                float visTerm = SmithJointGGXVisibilityTerm( NdotL, NdotV, 1.0-gloss );
                float normTerm = max(0.0, GGXTerm(NdotH, 1.0-gloss));
                float specularPBL = (NdotL*visTerm*normTerm) * (UNITY_PI / 4);
                if (IsGammaSpace())
                    specularPBL = sqrt(max(1e-4h, specularPBL));
                specularPBL = max(0, specularPBL * NdotL);
                float3 directSpecular = (floor(attenuation) * _LightColor0.xyz)*specularPBL*FresnelTerm(specularColor, LdotH);
                half grazingTerm = saturate( gloss + specularMonochrome );
                float3 indirectSpecular = (gi.indirect.specular) * specularAO;
                indirectSpecular *= FresnelLerp (specularColor, grazingTerm, NdotV);
                float3 specular = (directSpecular + indirectSpecular);
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float nlPow5 = Pow5(1-NdotL);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += gi.indirect.diffuse;
                indirectDiffuse *= node_5058; // Diffuse AO
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float4 node_491 = _Time + _TimeEditor;
                float3 emissive = (_BaseTextureMaskA_var.a*(((sin((node_491.g*2.0))*sin((node_491.g*7.0))*sin((node_491.g*5.0)))*0.2+0.0)+node_8726));
/// Final Color:
                float3 finalColor = diffuse + specular + emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x xboxone ps4 n3ds 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _BumpMap; uniform float4 _BumpMap_ST;
            uniform sampler2D _Noise; uniform float4 _Noise_ST;
            uniform float4 _Noise1;
            uniform float4 _Noise2;
            uniform float4 _Noise3;
            uniform float4 _Noise4;
            uniform sampler2D _BaseTextureMaskA; uniform float4 _BaseTextureMaskA_ST;
            uniform sampler2D _Metallic; uniform float4 _Metallic_ST;
            uniform sampler2D _TVShots; uniform float4 _TVShots_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                LIGHTING_COORDS(7,8)
                UNITY_FOG_COORDS(9)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _BumpMap_var = UnpackNormal(tex2D(_BumpMap,TRANSFORM_TEX(i.uv0, _BumpMap)));
                float3 normalLocal = _BumpMap_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float4 _Metallic_var = tex2D(_Metallic,TRANSFORM_TEX(i.uv0, _Metallic));
                float gloss = _Metallic_var.a;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float LdotH = max(0.0,dot(lightDirection, halfDirection));
                float3 specularColor = dot(_Metallic_var.rgb,float3(0.3,0.59,0.11));
                float specularMonochrome;
                float4 _BaseTextureMaskA_var = tex2D(_BaseTextureMaskA,TRANSFORM_TEX(i.uv0, _BaseTextureMaskA));
                float4 node_2610 = _Time + _TimeEditor;
                float2 node_766 = (i.uv0+node_2610.g*float2(-0.1,1));
                float4 node_5745 = tex2D(_Noise,TRANSFORM_TEX(node_766, _Noise));
                float3 node_6909 = (_Noise4.rgb*node_5745.b);
                float2 node_1051 = (i.uv0+node_2610.g*float2(1,3));
                float4 node_6304 = tex2D(_Noise,TRANSFORM_TEX(node_1051, _Noise));
                float2 node_9946 = (i.uv0+node_2610.g*float2(0,0.3));
                float4 node_4903 = tex2D(_Noise,TRANSFORM_TEX(node_9946, _Noise));
                float2 node_9306 = ((i.uv0*0.18)+node_2610.g*float2(0.6,1));
                float4 _TVShots_var = tex2D(_TVShots,TRANSFORM_TEX(node_9306, _TVShots));
                float2 node_1901 = (i.uv0+node_2610.g*float2(3,4));
                float4 node_5307 = tex2D(_Noise,TRANSFORM_TEX(node_1901, _Noise));
                float3 node_8726 = clamp((node_6909+(clamp((_Noise3.rgb*node_6304.a),0,1)+(clamp((_Noise2.rgb+node_4903.g),0,1)*clamp((_TVShots_var.rgb*(_Noise1.rgb+node_5307.r)),0,1)))),0,1);
                float3 diffuseColor = lerp(_BaseTextureMaskA_var.rgb,node_8726,_BaseTextureMaskA_var.a); // Need this for specular when using metallic
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, specularColor, specularColor, specularMonochrome );
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = max(0.0,dot( normalDirection, viewDirection ));
                float NdotH = max(0.0,dot( normalDirection, halfDirection ));
                float VdotH = max(0.0,dot( viewDirection, halfDirection ));
                float visTerm = SmithJointGGXVisibilityTerm( NdotL, NdotV, 1.0-gloss );
                float normTerm = max(0.0, GGXTerm(NdotH, 1.0-gloss));
                float specularPBL = (NdotL*visTerm*normTerm) * (UNITY_PI / 4);
                if (IsGammaSpace())
                    specularPBL = sqrt(max(1e-4h, specularPBL));
                specularPBL = max(0, specularPBL * NdotL);
                float3 directSpecular = attenColor*specularPBL*FresnelTerm(specularColor, LdotH);
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float nlPow5 = Pow5(1-NdotL);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "Meta"
            Tags {
                "LightMode"="Meta"
            }
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_META 1
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #include "UnityMetaPass.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal d3d11_9x xboxone ps4 n3ds 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _Noise; uniform float4 _Noise_ST;
            uniform float4 _Noise1;
            uniform float4 _Noise2;
            uniform float4 _Noise3;
            uniform float4 _Noise4;
            uniform sampler2D _BaseTextureMaskA; uniform float4 _BaseTextureMaskA_ST;
            uniform sampler2D _Metallic; uniform float4 _Metallic_ST;
            uniform sampler2D _TVShots; uniform float4 _TVShots_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
                return o;
            }
            float4 frag(VertexOutput i) : SV_Target {
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                float4 _BaseTextureMaskA_var = tex2D(_BaseTextureMaskA,TRANSFORM_TEX(i.uv0, _BaseTextureMaskA));
                float4 node_491 = _Time + _TimeEditor;
                float4 node_5061 = _Time + _TimeEditor;
                float2 node_766 = (i.uv0+node_5061.g*float2(-0.1,1));
                float4 node_5745 = tex2D(_Noise,TRANSFORM_TEX(node_766, _Noise));
                float3 node_6909 = (_Noise4.rgb*node_5745.b);
                float2 node_1051 = (i.uv0+node_5061.g*float2(1,3));
                float4 node_6304 = tex2D(_Noise,TRANSFORM_TEX(node_1051, _Noise));
                float2 node_9946 = (i.uv0+node_5061.g*float2(0,0.3));
                float4 node_4903 = tex2D(_Noise,TRANSFORM_TEX(node_9946, _Noise));
                float2 node_9306 = ((i.uv0*0.18)+node_5061.g*float2(0.6,1));
                float4 _TVShots_var = tex2D(_TVShots,TRANSFORM_TEX(node_9306, _TVShots));
                float2 node_1901 = (i.uv0+node_5061.g*float2(3,4));
                float4 node_5307 = tex2D(_Noise,TRANSFORM_TEX(node_1901, _Noise));
                float3 node_8726 = clamp((node_6909+(clamp((_Noise3.rgb*node_6304.a),0,1)+(clamp((_Noise2.rgb+node_4903.g),0,1)*clamp((_TVShots_var.rgb*(_Noise1.rgb+node_5307.r)),0,1)))),0,1);
                o.Emission = (_BaseTextureMaskA_var.a*(((sin((node_491.g*2.0))*sin((node_491.g*7.0))*sin((node_491.g*5.0)))*0.2+0.0)+node_8726));
                
                float3 diffColor = lerp(_BaseTextureMaskA_var.rgb,node_8726,_BaseTextureMaskA_var.a);
                float specularMonochrome;
                float3 specColor;
                float4 _Metallic_var = tex2D(_Metallic,TRANSFORM_TEX(i.uv0, _Metallic));
                diffColor = DiffuseAndSpecularFromMetallic( diffColor, dot(_Metallic_var.rgb,float3(0.3,0.59,0.11)), specColor, specularMonochrome );
                float roughness = 1.0 - _Metallic_var.a;
                o.Albedo = diffColor + specColor * roughness * roughness * 0.5;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

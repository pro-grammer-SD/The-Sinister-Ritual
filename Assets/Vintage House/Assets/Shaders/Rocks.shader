// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "MK4/Rocks"
{
	Properties
	{
		[HideInInspector] __dirty( "", Int ) = 1
		_RockAlbedo("Rock Albedo", 2D) = "white" {}
		_RockNormal("Rock Normal", 2D) = "bump" {}
		_NormalPower("Normal Power", Range( 0 , 1)) = 0.5
		_RockMetallicGloss("Rock Metallic Gloss", 2D) = "black" {}
		_Ambient("Ambient", 2D) = "white" {}
		_AOPower("AO Power", Range( 0 , 1)) = 0.5
		_Microdetail("Microdetail", 2D) = "white" {}
		_MicrodetailNormal("Microdetail Normal", 2D) = "bump" {}
		_MicrodetailAlbedo("Microdetail Albedo", Range( 0 , 1)) = 0.5
		_MicrodetailTiling("Microdetail Tiling", Range( 0 , 1)) = 0.5
		_MicrodetailNormalPower("Microdetail Normal Power", Range( 0 , 1)) = 0.5
		_CoverAlbedo("Cover Albedo", 2D) = "white" {}
		_CoverNormal("Cover Normal", 2D) = "bump" {}
		_CoverAmount("Cover Amount", Range( 0 , 1)) = 0.5
		_CoverTiling("Cover Tiling", Range( 0 , 1)) = 0.5
		_CoverNormalPower("Cover Normal Power", Range( 0 , 1)) = 0.5
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		ZTest LEqual
		CGINCLUDE
		#include "UnityStandardUtils.cginc"
		#include "UnityPBSLighting.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		#ifdef UNITY_PASS_SHADOWCASTER
			#undef INTERNAL_DATA
			#undef WorldReflectionVector
			#undef WorldNormalVector
			#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
			#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
			#define WorldNormalVector(data,normal) fixed3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))
		#endif
		struct Input
		{
			float2 uv_texcoord;
			float2 texcoord_0;
			float3 worldNormal;
			INTERNAL_DATA
			float2 texcoord_1;
		};

		uniform float _NormalPower;
		uniform sampler2D _RockNormal;
		uniform float4 _RockNormal_ST;
		uniform float _CoverNormalPower;
		uniform sampler2D _CoverNormal;
		uniform float _CoverTiling;
		uniform float _MicrodetailNormalPower;
		uniform sampler2D _MicrodetailNormal;
		uniform float _MicrodetailTiling;
		uniform sampler2D _Microdetail;
		uniform float _MicrodetailAlbedo;
		uniform sampler2D _RockAlbedo;
		uniform float4 _RockAlbedo_ST;
		uniform sampler2D _CoverAlbedo;
		uniform float _CoverAmount;
		uniform sampler2D _RockMetallicGloss;
		uniform float4 _RockMetallicGloss_ST;
		uniform sampler2D _Ambient;
		uniform float4 _Ambient_ST;
		uniform float _AOPower;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float2 temp_cast_0 = ((0.1 + (_CoverTiling - 0.0) * (6.0 - 0.1) / (1.0 - 0.0))).xx;
			o.texcoord_0.xy = v.texcoord.xy * temp_cast_0 + float2( 0,0 );
			float2 temp_cast_1 = ((1.0 + (_MicrodetailTiling - 0.0) * (20.0 - 1.0) / (1.0 - 0.0))).xx;
			o.texcoord_1.xy = v.texcoord.xy * temp_cast_1 + float2( 0,0 );
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_RockNormal = i.uv_texcoord * _RockNormal_ST.xy + _RockNormal_ST.zw;
			float3 tex2DNode4 = UnpackScaleNormal( tex2D( _RockNormal, uv_RockNormal ) ,(0.0 + (_NormalPower - 0.0) * (2.0 - 0.0) / (1.0 - 0.0)) );
			float3 lerpResult15 = lerp( float3(0,0,1) , UnpackScaleNormal( tex2D( _CoverNormal, i.texcoord_0 ) ,(0.0 + (_CoverNormalPower - 0.0) * (2.0 - 0.0) / (1.0 - 0.0)) ) , saturate( WorldNormalVector( i , tex2DNode4 ).y ));
			float3 normalizeResult37 = normalize( BlendNormals( BlendNormals( UnpackScaleNormal( tex2D( _RockNormal, uv_RockNormal ) ,(0.0 + (_NormalPower - 0.0) * (2.0 - 0.0) / (1.0 - 0.0)) ) , lerpResult15 ) , UnpackScaleNormal( tex2D( _MicrodetailNormal, i.texcoord_1 ) ,(0.0 + (_MicrodetailNormalPower - 0.0) * (2.0 - 0.0) / (1.0 - 0.0)) ) ) );
			o.Normal = normalizeResult37;
			float4 tex2DNode38 = tex2D( _Microdetail, i.texcoord_1 );
			float4 lerpResult57 = lerp( float4(1,1,1,1) , tex2DNode38 , _MicrodetailAlbedo);
			float4 lerpResult47 = lerp( float4(0.5,0.5,0.5,0.5) , tex2DNode38 , _MicrodetailAlbedo);
			float4 clampResult40 = clamp( (float4( -1,-1,-1,-1 ) + (lerpResult47 - float4( 0,0,0,0 )) * (float4( 0.9,0.9,0.9,0.9 ) - float4( -1,-1,-1,-1 )) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 ))) , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float2 uv_RockAlbedo = i.uv_texcoord * _RockAlbedo_ST.xy + _RockAlbedo_ST.zw;
			float4 clampResult43 = clamp( ( (float4( 0.3,0.3,0.3,0.3 ) + (lerpResult57 - float4( 0,0,0,0 )) * (float4( 1.3,1.3,1.3,1.3 ) - float4( 0.3,0.3,0.3,0.3 )) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 ))) * ( clampResult40 + tex2D( _RockAlbedo, uv_RockAlbedo ) ) ) , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float4 tex2DNode9 = tex2D( _CoverAlbedo, i.texcoord_0 );
			float clampResult71 = clamp( ( tex2DNode9.a * ((-3.0 + (_CoverAmount - 0.0) * (-0.2 - -3.0) / (1.0 - 0.0)) + (WorldNormalVector( i , BlendNormals( BlendNormals( tex2DNode4 , lerpResult15 ) , UnpackScaleNormal( tex2D( _MicrodetailNormal, i.texcoord_1 ) ,(0.0 + (_MicrodetailNormalPower - 0.0) * (2.0 - 0.0) / (1.0 - 0.0)) ) ) ).y - 0.0) * ((0.0 + (_CoverAmount - 0.0) * (10.0 - 0.0) / (1.0 - 0.0)) - (-3.0 + (_CoverAmount - 0.0) * (-0.2 - -3.0) / (1.0 - 0.0))) / (1.0 - 0.0)) ) , 0.0 , 1.0 );
			float4 lerpResult10 = lerp( clampResult43 , tex2DNode9 , clampResult71);
			o.Albedo = lerpResult10.xyz;
			float2 uv_RockMetallicGloss = i.uv_texcoord * _RockMetallicGloss_ST.xy + _RockMetallicGloss_ST.zw;
			float4 tex2DNode2 = tex2D( _RockMetallicGloss, uv_RockMetallicGloss );
			float3 desaturateVar82 = lerp( tex2DNode2.xyz,dot(tex2DNode2.xyz,float3(0.299,0.587,0.114)),0.0);
			o.Metallic = desaturateVar82.x;
			o.Smoothness = tex2DNode2.a;
			float2 uv_Ambient = i.uv_texcoord * _Ambient_ST.xy + _Ambient_ST.zw;
			float3 desaturateVar83 = lerp( tex2D( _Ambient, uv_Ambient ).xyz,dot(tex2D( _Ambient, uv_Ambient ).xyz,float3(0.299,0.587,0.114)),0.0);
			float3 temp_cast_4 = ((1.2 + (_AOPower - 0.0) * (-1.2 - 1.2) / (1.0 - 0.0))).xxx;
			float3 clampResult81 = clamp( (temp_cast_4 + (desaturateVar83 - float3( 0.0,0,0 )) * (float3( 1.0,0,0 ) - temp_cast_4) / (float3( 1.0,0,0 ) - float3( 0.0,0,0 ))) , float3( 0.0,0,0 ) , float3( 1.0,0,0 ) );
			o.Occlusion = clampResult81.x;
			o.Alpha = 1;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf Standard keepalpha fullforwardshadows vertex:vertexDataFunc 

		ENDCG
		Pass
		{
			Name "ShadowCaster"
			Tags{ "LightMode" = "ShadowCaster" }
			ZWrite On
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			#pragma multi_compile_shadowcaster
			#pragma multi_compile UNITY_PASS_SHADOWCASTER
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			# include "HLSLSupport.cginc"
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			sampler3D _DitherMaskLOD;
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float3 worldPos : TEXCOORD6;
				float4 tSpace0 : TEXCOORD1;
				float4 tSpace1 : TEXCOORD2;
				float4 tSpace2 : TEXCOORD3;
				float4 texcoords01 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			v2f vert( appdata_full v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				Input customInputData;
				vertexDataFunc( v, customInputData );
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				fixed3 worldTangent = UnityObjectToWorldDir( v.tangent.xyz );
				fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				fixed3 worldBinormal = cross( worldNormal, worldTangent ) * tangentSign;
				o.tSpace0 = float4( worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x );
				o.tSpace1 = float4( worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y );
				o.tSpace2 = float4( worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z );
				o.texcoords01 = float4( v.texcoord.xy, v.texcoord1.xy );
				o.worldPos = worldPos;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				return o;
			}
			fixed4 frag( v2f IN
			#if !defined( CAN_SKIP_VPOS )
			, UNITY_VPOS_TYPE vpos : VPOS
			#endif
			) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				Input surfIN;
				UNITY_INITIALIZE_OUTPUT( Input, surfIN );
				surfIN.uv_texcoord.xy = IN.texcoords01.xy;
				float3 worldPos = float3( IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w );
				fixed3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.worldNormal = float3( IN.tSpace0.z, IN.tSpace1.z, IN.tSpace2.z );
				surfIN.internalSurfaceTtoW0 = IN.tSpace0.xyz;
				surfIN.internalSurfaceTtoW1 = IN.tSpace1.xyz;
				surfIN.internalSurfaceTtoW2 = IN.tSpace2.xyz;
				SurfaceOutputStandard o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputStandard, o )
				surf( surfIN, o );
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=12001
-14;176;1202;838;3652.429;431.5431;2.600855;True;True
Node;AmplifyShaderEditor.RangedFloatNode;74;-2294.094,166.7289;Float;False;Property;_NormalPower;Normal Power;2;0;0.5;0;1;0;1;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;25;-2117.989,-531.4485;Float;False;Property;_CoverTiling;Cover Tiling;14;0;0.5;0;1;0;1;FLOAT
Node;AmplifyShaderEditor.TFHCRemap;73;-1975.979,151.6249;Float;False;5;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;1.0;False;3;FLOAT;0.0;False;4;FLOAT;2.0;False;1;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;76;-2287.595,349.7366;Float;False;Property;_CoverNormalPower;Cover Normal Power;15;0;0.5;0;1;0;1;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;34;-2353.071,602.7385;Float;False;Property;_MicrodetailTiling;Microdetail Tiling;9;0;0.5;0;1;0;1;FLOAT
Node;AmplifyShaderEditor.TFHCRemap;26;-1785.139,-496.185;Float;False;5;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;1.0;False;3;FLOAT;0.1;False;4;FLOAT;6.0;False;1;FLOAT
Node;AmplifyShaderEditor.SamplerNode;4;-1576.366,197.6078;Float;True;Property;_RockNormal;Rock Normal;1;0;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;FLOAT3;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.WorldNormalVector;20;-1685.906,-319.7951;Float;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.TFHCRemap;75;-1969.481,336.2326;Float;False;5;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;1.0;False;3;FLOAT;0.0;False;4;FLOAT;2.0;False;1;FLOAT
Node;AmplifyShaderEditor.TFHCRemap;35;-2073.765,560.0388;Float;False;5;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;1.0;False;3;FLOAT;1.0;False;4;FLOAT;20.0;False;1;FLOAT
Node;AmplifyShaderEditor.TextureCoordinatesNode;27;-1665.259,-636.3683;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;62;-2279.635,833.6049;Float;False;Property;_MicrodetailNormalPower;Microdetail Normal Power;10;0;0.5;0;1;0;1;FLOAT
Node;AmplifyShaderEditor.SaturateNode;22;-1374.055,-167.7137;Float;False;1;0;FLOAT;0.0;False;1;FLOAT
Node;AmplifyShaderEditor.SamplerNode;14;-1596.566,394.9421;Float;True;Property;_CoverNormal;Cover Normal;12;0;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;FLOAT3;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.Vector3Node;30;-1539.112,50.64676;Float;False;Constant;_Vector0;Vector 0;8;0;0,0,1;0;4;FLOAT3;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.TextureCoordinatesNode;36;-1900.261,538.6942;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;48;-396.2135,-598.4387;Float;False;Property;_MicrodetailAlbedo;Microdetail Albedo;8;0;0.5;0;1;0;1;FLOAT
Node;AmplifyShaderEditor.Vector4Node;52;-346.6617,-1118.489;Float;False;Constant;_Vector2;Vector 2;12;0;0.5,0.5,0.5,0.5;0;5;FLOAT4;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.SamplerNode;38;-407.492,-956.4921;Float;True;Property;_Microdetail;Microdetail;6;0;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;FLOAT4;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.TFHCRemap;63;-1978.529,792.887;Float;False;5;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;1.0;False;3;FLOAT;0.0;False;4;FLOAT;2.0;False;1;FLOAT
Node;AmplifyShaderEditor.LerpOp;15;-1240.4,347.5999;Float;False;3;0;FLOAT3;0.0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0.0;False;1;FLOAT3
Node;AmplifyShaderEditor.LerpOp;47;15.5863,-918.9379;Float;False;3;0;FLOAT4;0.5,0.5,0.5,0.5;False;1;FLOAT4;0,0,0,0;False;2;FLOAT;0.0;False;1;FLOAT4
Node;AmplifyShaderEditor.BlendNormalsNode;29;-1111.52,238.9917;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3
Node;AmplifyShaderEditor.SamplerNode;32;-1622.238,613.9823;Float;True;Property;_MicrodetailNormal;Microdetail Normal;7;0;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;FLOAT3;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;12;-2236.619,-134.225;Float;False;Property;_CoverAmount;Cover Amount;13;0;0.5;0;1;0;1;FLOAT
Node;AmplifyShaderEditor.Vector4Node;58;-343.3133,-771.5894;Float;False;Constant;_Vector2;Vector 2;12;0;1,1,1,1;0;5;FLOAT4;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.BlendNormalsNode;31;-985.4053,139.4476;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3
Node;AmplifyShaderEditor.TFHCRemap;61;231.8875,-1035.489;Float;False;5;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;1,1,1,1;False;3;FLOAT4;-1,-1,-1,-1;False;4;FLOAT4;0.9,0.9,0.9,0.9;False;1;FLOAT4
Node;AmplifyShaderEditor.SamplerNode;1;-811.4,-722.1001;Float;True;Property;_RockAlbedo;Rock Albedo;0;0;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;FLOAT4;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.TFHCRemap;69;-1890.372,-53.50449;Float;False;5;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;1.0;False;3;FLOAT;0.0;False;4;FLOAT;10.0;False;1;FLOAT
Node;AmplifyShaderEditor.ClampOpNode;40;439.1173,-991.4132;Float;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;1,1,1,1;False;1;FLOAT4
Node;AmplifyShaderEditor.TFHCRemap;68;-1898.665,-271.7251;Float;False;5;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;1.0;False;3;FLOAT;-3.0;False;4;FLOAT;-0.2;False;1;FLOAT
Node;AmplifyShaderEditor.LerpOp;57;11.48681,-723.9894;Float;False;3;0;FLOAT4;0.5,0.5,0.5,0.5;False;1;FLOAT4;0,0,0,0;False;2;FLOAT;0.0;False;1;FLOAT4
Node;AmplifyShaderEditor.WorldNormalVector;19;-1001.78,-203.7838;Float;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.SamplerNode;77;-544.0107,436.2235;Float;True;Property;_Ambient;Ambient;4;0;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;FLOAT4;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.TFHCRemap;70;-749.4117,-165.8754;Float;False;5;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;1.0;False;3;FLOAT;0.0;False;4;FLOAT;1.0;False;1;FLOAT
Node;AmplifyShaderEditor.SamplerNode;9;-892.2139,-517.8035;Float;True;Property;_CoverAlbedo;Cover Albedo;11;0;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;FLOAT4;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;78;-479.6361,811.6871;Float;False;Property;_AOPower;AO Power;5;0;0.5;0;1;0;1;FLOAT
Node;AmplifyShaderEditor.TFHCRemap;45;247.2928,-718.9731;Float;False;5;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;1,1,1,1;False;3;FLOAT4;0.3,0.3,0.3,0.3;False;4;FLOAT4;1.3,1.3,1.3,1.3;False;1;FLOAT4
Node;AmplifyShaderEditor.SimpleAddOpNode;42;586.1473,-818.9531;Float;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0.0;False;1;FLOAT4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;44;656.3862,-696.9377;Float;False;2;2;0;FLOAT4;0.0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4
Node;AmplifyShaderEditor.DesaturateOpNode;83;-174.0919,458.6245;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.0;False;1;FLOAT3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;72;-531.5165,-152.2744;Float;False;2;2;0;FLOAT;0.0;False;1;FLOAT;0.0;False;1;FLOAT
Node;AmplifyShaderEditor.TFHCRemap;79;-106.8795,708.3772;Float;False;5;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;1.0;False;3;FLOAT;1.2;False;4;FLOAT;-1.2;False;1;FLOAT
Node;AmplifyShaderEditor.TFHCRemap;80;102.1315,538.711;Float;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0.0,0,0;False;2;FLOAT3;1.0,0,0;False;3;FLOAT3;0.0;False;4;FLOAT3;1.0,0,0;False;1;FLOAT3
Node;AmplifyShaderEditor.ClampOpNode;71;-363.4438,-150.2735;Float;False;3;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;1.0;False;1;FLOAT
Node;AmplifyShaderEditor.ClampOpNode;43;697.3422,-480.2326;Float;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;1,1,1,1;False;1;FLOAT4
Node;AmplifyShaderEditor.SamplerNode;2;-507.042,209.6545;Float;True;Property;_RockMetallicGloss;Rock Metallic Gloss;3;0;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;FLOAT4;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.ClampOpNode;81;325.454,539.7421;Float;False;3;0;FLOAT3;0.0;False;1;FLOAT3;0.0,0,0;False;2;FLOAT3;1.0,0,0;False;1;FLOAT3
Node;AmplifyShaderEditor.LerpOp;10;316.3565,-192.8941;Float;False;3;0;FLOAT4;0.0,0,0,0;False;1;FLOAT4;0.0,0,0,0;False;2;FLOAT;0.0;False;1;FLOAT4
Node;AmplifyShaderEditor.DesaturateOpNode;82;-145.4679,213.7228;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.0;False;1;FLOAT3
Node;AmplifyShaderEditor.NormalizeNode;37;-214.2241,114.9775;Float;False;1;0;FLOAT3;0,0,0,0;False;1;FLOAT3
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;621.3304,72.07998;Float;False;True;2;Float;ASEMaterialInspector;0;Standard;MK4/Rocks;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;3;False;0;0;Opaque;0.5;True;True;0;False;Opaque;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;False;0;4;10;25;False;0.5;True;0;Zero;Zero;0;Zero;Zero;Add;Add;0;False;0;0,0,0,0;VertexOffset;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;OBJECT;0.0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;73;0;74;0
WireConnection;26;0;25;0
WireConnection;4;5;73;0
WireConnection;20;0;4;0
WireConnection;75;0;76;0
WireConnection;35;0;34;0
WireConnection;27;0;26;0
WireConnection;22;0;20;2
WireConnection;14;1;27;0
WireConnection;14;5;75;0
WireConnection;36;0;35;0
WireConnection;38;1;36;0
WireConnection;63;0;62;0
WireConnection;15;0;30;0
WireConnection;15;1;14;0
WireConnection;15;2;22;0
WireConnection;47;0;52;0
WireConnection;47;1;38;0
WireConnection;47;2;48;0
WireConnection;29;0;4;0
WireConnection;29;1;15;0
WireConnection;32;1;36;0
WireConnection;32;5;63;0
WireConnection;31;0;29;0
WireConnection;31;1;32;0
WireConnection;61;0;47;0
WireConnection;69;0;12;0
WireConnection;40;0;61;0
WireConnection;68;0;12;0
WireConnection;57;0;58;0
WireConnection;57;1;38;0
WireConnection;57;2;48;0
WireConnection;19;0;31;0
WireConnection;70;0;19;2
WireConnection;70;3;68;0
WireConnection;70;4;69;0
WireConnection;9;1;27;0
WireConnection;45;0;57;0
WireConnection;42;0;40;0
WireConnection;42;1;1;0
WireConnection;44;0;45;0
WireConnection;44;1;42;0
WireConnection;83;0;77;0
WireConnection;72;0;9;4
WireConnection;72;1;70;0
WireConnection;79;0;78;0
WireConnection;80;0;83;0
WireConnection;80;3;79;0
WireConnection;71;0;72;0
WireConnection;43;0;44;0
WireConnection;81;0;80;0
WireConnection;10;0;43;0
WireConnection;10;1;9;0
WireConnection;10;2;71;0
WireConnection;82;0;2;0
WireConnection;37;0;31;0
WireConnection;0;0;10;0
WireConnection;0;1;37;0
WireConnection;0;3;82;0
WireConnection;0;4;2;4
WireConnection;0;5;81;0
ASEEND*/
//CHKSM=33F0B6B9866CE3C810335B403ED9B7F8C54049DC
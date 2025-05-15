// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "MK4/PBR_second_UV"
{
	Properties
	{
		[HideInInspector] __dirty( "", Int ) = 1
		_Albedo("Albedo", 2D) = "white" {}
		_MetallicGloss("Metallic Gloss", 2D) = "black" {}
		_Normalmap("Normalmap", 2D) = "bump" {}
		_Normalstr("Normal str", Range( 0 , 1)) = 0.5
		_AO("AO", 2D) = "white" {}
		_AOsecondUV("AO second UV", 2D) = "white" {}
		_AOstr("AO str", Range( 0 , 1)) = 0.5
		_Detail("Detail", 2D) = "gray" {}
		_Detailpower("Detail power", Range( 0 , 1)) = 0.5
		_DetailNormalmap("Detail Normalmap", 2D) = "bump" {}
		_DetailNormalstr("Detail Normal str", Range( 0 , 1)) = 0.5
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] _texcoord2( "", 2D ) = "white" {}
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityStandardUtils.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
			float2 uv2_texcoord2;
		};

		uniform float _Normalstr;
		uniform sampler2D _Normalmap;
		uniform float4 _Normalmap_ST;
		uniform float _DetailNormalstr;
		uniform sampler2D _DetailNormalmap;
		uniform float4 _DetailNormalmap_ST;
		uniform sampler2D _Detail;
		uniform float4 _Detail_ST;
		uniform float _Detailpower;
		uniform sampler2D _Albedo;
		uniform float4 _Albedo_ST;
		uniform sampler2D _MetallicGloss;
		uniform float4 _MetallicGloss_ST;
		uniform sampler2D _AO;
		uniform float4 _AO_ST;
		uniform sampler2D _AOsecondUV;
		uniform float4 _AOsecondUV_ST;
		uniform float _AOstr;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Normalmap = i.uv_texcoord * _Normalmap_ST.xy + _Normalmap_ST.zw;
			float2 uv_DetailNormalmap = i.uv_texcoord * _DetailNormalmap_ST.xy + _DetailNormalmap_ST.zw;
			float3 normalizeResult7 = normalize( BlendNormals( UnpackScaleNormal( tex2D( _Normalmap, uv_Normalmap ) ,(0.0 + (_Normalstr - 0.0) * (2.0 - 0.0) / (1.0 - 0.0)) ) , UnpackScaleNormal( tex2D( _DetailNormalmap, uv_DetailNormalmap ) ,(0.0 + (_DetailNormalstr - 0.0) * (2.0 - 0.0) / (1.0 - 0.0)) ) ) );
			o.Normal = normalizeResult7;
			float2 uv_Detail = i.uv_texcoord * _Detail_ST.xy + _Detail_ST.zw;
			float4 tex2DNode16 = tex2D( _Detail, uv_Detail );
			float4 lerpResult21 = lerp( float4(1,1,1,1) , tex2DNode16 , _Detailpower);
			float4 lerpResult17 = lerp( float4(0.5,0.5,0.5,0.5) , tex2DNode16 , _Detailpower);
			float4 clampResult20 = clamp( (float4( -1,-1,-1,-1 ) + (lerpResult17 - float4( 0,0,0,0 )) * (float4( 1.2,1.2,1.2,1.2 ) - float4( -1,-1,-1,-1 )) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 ))) , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float2 uv_Albedo = i.uv_texcoord * _Albedo_ST.xy + _Albedo_ST.zw;
			float4 clampResult25 = clamp( ( (float4( 0.3,0.3,0.3,0.3 ) + (lerpResult21 - float4( 0,0,0,0 )) * (float4( 1.3,1.3,1.3,1.3 ) - float4( 0.3,0.3,0.3,0.3 )) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 ))) * ( clampResult20 + tex2D( _Albedo, uv_Albedo ) ) ) , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			o.Albedo = clampResult25.xyz;
			float2 uv_MetallicGloss = i.uv_texcoord * _MetallicGloss_ST.xy + _MetallicGloss_ST.zw;
			float4 tex2DNode2 = tex2D( _MetallicGloss, uv_MetallicGloss );
			float3 desaturateVar4 = lerp( tex2DNode2.rgb,dot(tex2DNode2.rgb,float3(0.299,0.587,0.114)),0.0);
			o.Metallic = desaturateVar4.x;
			o.Smoothness = tex2DNode2.a;
			float2 uv_AO = i.uv_texcoord * _AO_ST.xy + _AO_ST.zw;
			float2 uv2_AOsecondUV = i.uv2_texcoord2 * _AOsecondUV_ST.xy + _AOsecondUV_ST.zw;
			float3 desaturateVar12 = lerp( ( tex2D( _AO, uv_AO ) * tex2D( _AOsecondUV, uv2_AOsecondUV ) ).rgb,dot(( tex2D( _AO, uv_AO ) * tex2D( _AOsecondUV, uv2_AOsecondUV ) ).rgb,float3(0.299,0.587,0.114)),0.0);
			float3 temp_cast_5 = ((1.2 + (_AOstr - 0.0) * (-1.2 - 1.2) / (1.0 - 0.0))).xxx;
			float3 clampResult32 = clamp( (temp_cast_5 + (desaturateVar12 - float3( 0,0,0 )) * (float3( 1,0,0 ) - temp_cast_5) / (float3( 1,0,0 ) - float3( 0,0,0 ))) , float3( 0.0,0,0 ) , float3( 1.0,0,0 ) );
			o.Occlusion = clampResult32.x;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=12001
685;195;1202;838;1977.496;-683.5554;1.3;True;True
Node;AmplifyShaderEditor.Vector4Node;15;-1858.227,1098.91;Float;False;Constant;_Vector1;Vector 1;12;0;0.5,0.5,0.5,0.5;0;5;FLOAT4;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;14;-1907.778,1618.961;Float;False;Property;_Detailpower;Detail power;8;0;0.5;0;1;0;1;FLOAT
Node;AmplifyShaderEditor.SamplerNode;16;-1919.057,1260.908;Float;True;Property;_Detail;Detail;7;0;None;True;0;False;gray;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;FLOAT4;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.LerpOp;17;-1404.683,1224.836;Float;False;3;0;FLOAT4;0.5,0.5,0.5,0.5;False;1;FLOAT4;0,0,0,0;False;2;FLOAT;0.0;False;1;FLOAT4
Node;AmplifyShaderEditor.SamplerNode;8;-1504.593,415.6096;Float;True;Property;_AO;AO;4;0;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.Vector4Node;18;-1854.878,1445.811;Float;False;Constant;_Vector3;Vector 3;12;0;1,1,1,1;0;5;FLOAT4;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;26;-2055.16,81.08476;Float;False;Property;_Normalstr;Normal str;3;0;0.5;0;1;0;1;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;27;-2091.08,222.0744;Float;False;Property;_DetailNormalstr;Detail Normal str;10;0;0.5;0;1;0;1;FLOAT
Node;AmplifyShaderEditor.SamplerNode;9;-1498.759,643.1743;Float;True;Property;_AOsecondUV;AO second UV;5;0;None;True;1;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.TFHCRemap;19;-1179.547,1217.25;Float;False;5;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;1,1,1,1;False;3;FLOAT4;-1,-1,-1,-1;False;4;FLOAT4;1.2,1.2,1.2,1.2;False;1;FLOAT4
Node;AmplifyShaderEditor.TFHCRemap;29;-1741.32,236.9896;Float;False;5;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;1.0;False;3;FLOAT;0.0;False;4;FLOAT;2.0;False;1;FLOAT
Node;AmplifyShaderEditor.TFHCRemap;28;-1715.41,11.06965;Float;False;5;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;1.0;False;3;FLOAT;0.0;False;4;FLOAT;2.0;False;1;FLOAT
Node;AmplifyShaderEditor.SamplerNode;1;-1489.084,-449.2898;Float;True;Property;_Albedo;Albedo;0;0;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.ClampOpNode;20;-969.3412,1130.426;Float;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;1,1,1,1;False;1;FLOAT4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;-1101.094,525.5649;Float;False;2;2;0;COLOR;0.0;False;1;COLOR;0.0,0,0,0;False;1;COLOR
Node;AmplifyShaderEditor.LerpOp;21;-1408.783,1419.785;Float;False;3;0;FLOAT4;0.5,0.5,0.5,0.5;False;1;FLOAT4;0,0,0,0;False;2;FLOAT;0.0;False;1;FLOAT4
Node;AmplifyShaderEditor.RangedFloatNode;33;-1265.995,815.6873;Float;False;Property;_AOstr;AO str;6;0;0.5;0;1;0;1;FLOAT
Node;AmplifyShaderEditor.TFHCRemap;22;-1164.141,1533.766;Float;False;5;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;1,1,1,1;False;3;FLOAT4;0.3,0.3,0.3,0.3;False;4;FLOAT4;1.3,1.3,1.3,1.3;False;1;FLOAT4
Node;AmplifyShaderEditor.TFHCRemap;30;-893.238,712.3774;Float;False;5;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;1.0;False;3;FLOAT;1.2;False;4;FLOAT;-1.2;False;1;FLOAT
Node;AmplifyShaderEditor.SimpleAddOpNode;23;-766.0266,1117.927;Float;False;2;2;0;FLOAT4;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;FLOAT4
Node;AmplifyShaderEditor.DesaturateOpNode;12;-860.2242,508.1695;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.0;False;1;FLOAT3
Node;AmplifyShaderEditor.SamplerNode;3;-1498.783,-30.50014;Float;True;Property;_Normalmap;Normalmap;2;0;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;FLOAT3;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.SamplerNode;5;-1502.563,179.5596;Float;True;Property;_DetailNormalmap;Detail Normalmap;9;0;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;FLOAT3;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;24;-594.0128,1119.712;Float;False;2;2;0;FLOAT4;0.0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4
Node;AmplifyShaderEditor.SamplerNode;2;-1492.893,-238.7449;Float;True;Property;_MetallicGloss;Metallic Gloss;1;0;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.BlendNormalsNode;6;-1119.124,97.87016;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3
Node;AmplifyShaderEditor.TFHCRemap;31;-680.7371,542.7112;Float;False;5;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;1,0,0;False;3;FLOAT3;0.0;False;4;FLOAT3;1,0,0;False;1;FLOAT3
Node;AmplifyShaderEditor.NormalizeNode;7;-871.9987,92.03506;Float;False;1;0;FLOAT3;0,0,0,0;False;1;FLOAT3
Node;AmplifyShaderEditor.DesaturateOpNode;4;-1029.929,-145.255;Float;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0.0;False;1;FLOAT3
Node;AmplifyShaderEditor.ClampOpNode;32;-460.9046,543.7423;Float;False;3;0;FLOAT3;0.0;False;1;FLOAT3;0.0,0,0;False;2;FLOAT3;1.0,0,0;False;1;FLOAT3
Node;AmplifyShaderEditor.ClampOpNode;25;-435.9021,1107.412;Float;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT4;1,1,1,1;False;1;FLOAT4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;62.47495,-2.974997;Float;False;True;2;Float;ASEMaterialInspector;0;Standard;MK4/PBR_second_UV;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;0;False;0;0;Opaque;0.5;True;True;0;False;Opaque;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;False;0;4;10;25;False;0.5;True;0;Zero;Zero;0;Zero;Zero;Add;Add;0;False;0;0,0,0,0;VertexOffset;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;OBJECT;0.0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;17;0;15;0
WireConnection;17;1;16;0
WireConnection;17;2;14;0
WireConnection;19;0;17;0
WireConnection;29;0;27;0
WireConnection;28;0;26;0
WireConnection;20;0;19;0
WireConnection;10;0;8;0
WireConnection;10;1;9;0
WireConnection;21;0;18;0
WireConnection;21;1;16;0
WireConnection;21;2;14;0
WireConnection;22;0;21;0
WireConnection;30;0;33;0
WireConnection;23;0;20;0
WireConnection;23;1;1;0
WireConnection;12;0;10;0
WireConnection;3;5;28;0
WireConnection;5;5;29;0
WireConnection;24;0;22;0
WireConnection;24;1;23;0
WireConnection;6;0;3;0
WireConnection;6;1;5;0
WireConnection;31;0;12;0
WireConnection;31;3;30;0
WireConnection;7;0;6;0
WireConnection;4;0;2;0
WireConnection;32;0;31;0
WireConnection;25;0;24;0
WireConnection;0;0;25;0
WireConnection;0;1;7;0
WireConnection;0;3;4;0
WireConnection;0;4;2;4
WireConnection;0;5;32;0
ASEEND*/
//CHKSM=B16827343DBE2BFE60591EB0C6F4915741ACD9E8
// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "VFX/Pandavfx"
{
	Properties
	{
		[Enum(UnityEngine.Rendering.CullMode)]_Cullmode("Cullmode", Float) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)]_Ztest("Ztest", Float) = 4
		[Enum(UnityEngine.Rendering.BlendMode)]_Scr("Scr", Float) = 5
		[Enum(UnityEngine.Rendering.BlendMode)]_Dst("Dst", Float) = 10
		_MainTex("MainTex", 2D) = "white" {}
		_MainAlpha("MainAlpha", Range( 0 , 20)) = 1
		[HDR]_MainColor("MainColor", Color) = (1,1,1,1)
		_MainTex_Uspeed("MainTex_Uspeed", Float) = 0
		_MainTex_Vspeed("MainTex_Vspeed", Float) = 0
		_MaskTex("MaskTex", 2D) = "white" {}
		_DistortTex("DistortTex", 2D) = "white" {}
		[Enum(off,0,on,1)]_DistortMainTex("DistortMainTex", Float) = 1
		[Enum(off,0,on,1)]_DistortDisTex("DistortDisTex", Float) = 0
		_DistortFactor("DistortFactor", Range( 0 , 1)) = 0
		_DistortTex_Uspeed("DistortTex_Uspeed", Float) = 0
		_DistortTex_Vspeed("DistortTex_Vspeed", Float) = 0
		_DissloveTex("DissloveTex", 2D) = "white" {}
		_DIssloveFactor("DIssloveFactor", Range( 0 , 2)) = 0.5077091
		_DIssloveWide("DIssloveWide", Range( 0 , 1)) = 0.02352943
		_DIssloveSoft("DIssloveSoft", Range( 0 , 1)) = 0.8235294
		[HDR]_DIssloveColor("DIssloveColor", Color) = (1,1,1,1)
		_DisTex_Uspeed("DisTex_Uspeed", Float) = 0
		_DisTex_Vspeed("DisTex_Vspeed", Float) = 0
		_VTOTex("VTOTex", 2D) = "white" {}
		_VTOFactor("VTOFactor", Float) = 0
		_VTOTex_Uspeed("VTOTex_Uspeed", Float) = 0
		_VTOTex_Vspeed("VTOTex_Vspeed", Float) = 0
		_VTOMaskTex("VTOMaskTex", 2D) = "white" {}
		_fnl_power("fnl_power", Range( 1 , 10)) = 1
		_fnl_sacle("fnl_sacle", Range( 0 , 1)) = 0
		[HDR]_fnl_color("fnl_color", Color) = (1,1,1,0)
		_softFacotr("softFacotr", Range( 1 , 20)) = 1
		_DepthfadeFactor("DepthfadeFactor", Float) = 1
		[Toggle]_MainTex_ar("MainTex_a/r", Float) = 0
		[Toggle]_CustomdataMainTexUV("CustomdataMainTexUV", Float) = 0
		_MainAlphaPower("MainAlphaPower", Range( 1 , 10)) = 1
		[Toggle]_MaskAlphaRA("MaskAlphaRA", Float) = 0
		[Toggle]_CustomdataMaskUV("CustomdataMaskUV", Float) = 0
		_Mask_scale("Mask_scale", Float) = 1
		[Toggle]_AlphaAdd("AlphaAdd", Float) = 0
		_Mask_rotat("Mask_rotat", Range( 0 , 360)) = 0
		_MainTex_rotat("MainTex_rotat", Range( 0 , 360)) = 0
		_DIssolve_rotat("DIssolve_rotat", Range( 0 , 360)) = 0
		[Toggle]_CustomdataDis("CustomdataDis", Float) = 0
		[Toggle]_FNLfanxiangkaiguan("FNLfanxiangkaiguan", Float) = 0
		[Toggle]_FNLkaiguan("FNLkaiguan", Float) = 0
		[Toggle]_ToggleSwitch0("Toggle Switch0", Float) = 0
		[Toggle]_Depthfadeon("Depthfadeon", Float) = 0
		_ScreenDistortMask("ScreenDistortMask", 2D) = "white" {}
		_ScreenDistortTex("ScreenDistortTex", 2D) = "white" {}
		_ScreenDistortTexScale("ScreenDistortTexScale", Range( 0 , 1)) = 0
		[Toggle]_CustomdataScreenUV("CustomdataScreenUV", Float) = 0
		[Toggle]_screenalphaon("screenalphaon", Float) = 0
		[Toggle]_Screencoloron("Screencoloron", Float) = 0
		[Toggle]_screenVTOon("screenVTOon", Float) = 0
		_ScreenU("ScreenU", Float) = 0
		_ScreenV("ScreenV", Float) = 0
		_Mask_Uspeed("Mask_Uspeed", Float) = 0
		_Mask_Vspeed("Mask_Vspeed", Float) = 0
		[Toggle]_soft_sting("soft_sting", Float) = 0
		[Toggle]_sot_sting_A("sot_sting_A", Float) = 0
		[HideInInspector] _tex4coord2( "", 2D ) = "white" {}
		[HideInInspector] _texcoord3( "", 2D ) = "white" {}
		[HideInInspector] _texcoord2( "", 2D ) = "white" {}
		[HideInInspector] _tex4coord3( "", 2D ) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IsEmissive" = "true"  }
		Cull [_Cullmode]
		ZWrite Off
		ZTest [_Ztest]
		Blend [_Scr] [_Dst]
		
		GrabPass{ }
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		#pragma target 5.0
		#if defined(UNITY_STEREO_INSTANCING_ENABLED) || defined(UNITY_STEREO_MULTIVIEW_ENABLED)
		#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex);
		#else
		#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex)
		#endif
		#pragma surface surf Unlit keepalpha noshadow vertex:vertexDataFunc 
		#undef TRANSFORM_TEX
		#define TRANSFORM_TEX(tex,name) float4(tex.xy * name##_ST.xy + name##_ST.zw, tex.z, tex.w)
		struct Input
		{
			float3 worldPos;
			float3 worldNormal;
			float2 uv_texcoord;
			float2 uv3_texcoord3;
			float4 vertexColor : COLOR;
			float2 uv2_texcoord2;
			float4 uv2_tex4coord2;
			float3 viewDir;
			float4 screenPosition88;
			float4 uv3_tex4coord3;
			float4 screenPos;
		};

		uniform float _Scr;
		uniform float _Ztest;
		uniform float _Cullmode;
		uniform float _Dst;
		uniform float _screenVTOon;
		uniform sampler2D _VTOTex;
		uniform float _VTOTex_Uspeed;
		uniform float _VTOTex_Vspeed;
		uniform float4 _VTOTex_ST;
		uniform float _VTOFactor;
		uniform sampler2D _VTOMaskTex;
		uniform float4 _VTOMaskTex_ST;
		uniform float _ToggleSwitch0;
		uniform float _Screencoloron;
		uniform float _FNLkaiguan;
		uniform float _fnl_sacle;
		uniform float _fnl_power;
		uniform float4 _fnl_color;
		uniform float _AlphaAdd;
		uniform float _Mask_scale;
		uniform float _MaskAlphaRA;
		uniform sampler2D _MaskTex;
		uniform float _Mask_Uspeed;
		uniform float _Mask_Vspeed;
		uniform float4 _MaskTex_ST;
		uniform float _CustomdataMaskUV;
		uniform float _Mask_rotat;
		uniform float _MainTex_ar;
		uniform sampler2D _MainTex;
		uniform float _MainTex_Uspeed;
		uniform float _MainTex_Vspeed;
		uniform float _CustomdataMainTexUV;
		uniform float4 _MainTex_ST;
		uniform float _DistortFactor;
		uniform sampler2D _DistortTex;
		uniform float _DistortTex_Uspeed;
		uniform float _DistortTex_Vspeed;
		uniform float4 _DistortTex_ST;
		uniform float _DistortMainTex;
		uniform float _MainTex_rotat;
		uniform float4 _MainColor;
		uniform float _MainAlpha;
		uniform float _sot_sting_A;
		uniform float _CustomdataDis;
		uniform float _DIssloveFactor;
		uniform float _DIssloveSoft;
		uniform sampler2D _DissloveTex;
		uniform float _DisTex_Uspeed;
		uniform float _DisTex_Vspeed;
		uniform float4 _DissloveTex_ST;
		uniform float _DistortDisTex;
		uniform float _DIssolve_rotat;
		uniform float _DIssloveWide;
		uniform float _FNLfanxiangkaiguan;
		uniform float _softFacotr;
		uniform float _Depthfadeon;
		UNITY_DECLARE_DEPTH_TEXTURE( _CameraDepthTexture );
		uniform float4 _CameraDepthTexture_TexelSize;
		uniform float _DepthfadeFactor;
		uniform float _MainAlphaPower;
		uniform float _soft_sting;
		uniform float4 _DIssloveColor;
		ASE_DECLARE_SCREENSPACE_TEXTURE( _GrabTexture )
		uniform float _CustomdataScreenUV;
		uniform float _ScreenDistortTexScale;
		uniform sampler2D _ScreenDistortTex;
		uniform float _ScreenU;
		uniform float _ScreenV;
		uniform float4 _ScreenDistortTex_ST;
		uniform sampler2D _ScreenDistortMask;
		uniform float4 _ScreenDistortMask_ST;
		uniform float _screenalphaon;


		inline float4 ASE_ComputeGrabScreenPos( float4 pos )
		{
			#if UNITY_UV_STARTS_AT_TOP
			float scale = -1.0;
			#else
			float scale = 1.0;
			#endif
			float4 o = pos;
			o.y = pos.w * 0.5f;
			o.y = ( pos.y - o.y ) * _ProjectionParams.x * scale + o.y;
			return o;
		}


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float2 appendResult76 = (float2(_VTOTex_Uspeed , _VTOTex_Vspeed));
			float2 uv_VTOTex = v.texcoord.xy * _VTOTex_ST.xy + _VTOTex_ST.zw;
			float2 panner77 = ( 1.0 * _Time.y * appendResult76 + uv_VTOTex);
			float3 ase_vertexNormal = v.normal.xyz;
			float2 uv_VTOMaskTex = v.texcoord * _VTOMaskTex_ST.xy + _VTOMaskTex_ST.zw;
			float3 VTO82 = ( tex2Dlod( _VTOTex, float4( panner77, 0, 0.0) ).r * ase_vertexNormal * _VTOFactor * tex2Dlod( _VTOMaskTex, float4( uv_VTOMaskTex, 0, 0.0) ).r * (( _ToggleSwitch0 )?( v.texcoord1.w ):( 1.0 )) );
			float3 temp_cast_0 = (0.0).xxx;
			v.vertex.xyz += (( _screenVTOon )?( temp_cast_0 ):( VTO82 ));
			v.vertex.w = 1;
			float3 ase_vertex3Pos = v.vertex.xyz;
			float3 vertexPos88 = ase_vertex3Pos;
			float4 ase_screenPos88 = ComputeScreenPos( UnityObjectToClipPos( vertexPos88 ) );
			o.screenPosition88 = ase_screenPos88;
		}

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 ase_worldNormal = i.worldNormal;
			float fresnelNdotV91 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode91 = ( 0.0 + _fnl_sacle * pow( 1.0 - fresnelNdotV91, _fnl_power ) );
			float4 fnlColor97 = ( saturate( fresnelNode91 ) * _fnl_color );
			float4 temp_cast_0 = (0.0).xxxx;
			float2 appendResult222 = (float2(_Mask_Uspeed , _Mask_Vspeed));
			float2 uv_MaskTex = i.uv_texcoord * _MaskTex_ST.xy + _MaskTex_ST.zw;
			float2 panner219 = ( 1.0 * _Time.y * appendResult222 + uv_MaskTex);
			float2 temp_cast_1 = (0.0).xx;
			float cos149 = cos( ( ( ( _Mask_rotat / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float sin149 = sin( ( ( ( _Mask_rotat / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float2 rotator149 = mul( ( panner219 + (( _CustomdataMaskUV )?( i.uv3_texcoord3 ):( temp_cast_1 )) ) - float2( 0.5,0.5 ) , float2x2( cos149 , -sin149 , sin149 , cos149 )) + float2( 0.5,0.5 );
			float4 tex2DNode52 = tex2D( _MaskTex, rotator149 );
			float MaskAlpha136 = ( _Mask_scale * (( _MaskAlphaRA )?( tex2DNode52.r ):( tex2DNode52.a )) );
			float2 appendResult14 = (float2(_MainTex_Uspeed , _MainTex_Vspeed));
			float2 temp_cast_2 = (0.0).xx;
			float2 uv_MainTex = i.uv_texcoord * _MainTex_ST.xy + _MainTex_ST.zw;
			float2 temp_cast_3 = (0.0).xx;
			float2 appendResult58 = (float2(_DistortTex_Uspeed , _DistortTex_Vspeed));
			float2 uv_DistortTex = i.uv_texcoord * _DistortTex_ST.xy + _DistortTex_ST.zw;
			float2 panner59 = ( 1.0 * _Time.y * appendResult58 + uv_DistortTex);
			float4 tex2DNode54 = tex2D( _DistortTex, panner59 );
			float2 appendResult61 = (float2(tex2DNode54.r , tex2DNode54.g));
			float2 DistortUV60 = ( _DistortFactor * appendResult61 );
			float2 lerpResult118 = lerp( temp_cast_3 , DistortUV60 , _DistortMainTex);
			float2 panner11 = ( 1.0 * _Time.y * appendResult14 + ( (( _CustomdataMainTexUV )?( i.uv2_texcoord2 ):( temp_cast_2 )) + uv_MainTex + lerpResult118 ));
			float cos158 = cos( ( ( ( _MainTex_rotat / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float sin158 = sin( ( ( ( _MainTex_rotat / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float2 rotator158 = mul( panner11 - float2( 0.5,0.5 ) , float2x2( cos158 , -sin158 , sin158 , cos158 )) + float2( 0.5,0.5 );
			float4 tex2DNode1 = tex2D( _MainTex, rotator158 );
			float MainTexAlpha37 = ( i.vertexColor.a * (( _MainTex_ar )?( tex2DNode1.r ):( tex2DNode1.a )) * _MainColor.a * _MainAlpha );
			float2 appendResult48 = (float2(_DisTex_Uspeed , _DisTex_Vspeed));
			float2 uv_DissloveTex = i.uv_texcoord * _DissloveTex_ST.xy + _DissloveTex_ST.zw;
			float2 temp_cast_4 = (0.0).xx;
			float2 lerpResult122 = lerp( temp_cast_4 , DistortUV60 , _DistortDisTex);
			float2 panner49 = ( 1.0 * _Time.y * appendResult48 + ( uv_DissloveTex + lerpResult122 ));
			float cos162 = cos( ( ( ( _DIssolve_rotat / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float sin162 = sin( ( ( ( _DIssolve_rotat / 360.0 ) * UNITY_PI ) * 2.0 ) );
			float2 rotator162 = mul( panner49 - float2( 0.5,0.5 ) , float2x2( cos162 , -sin162 , sin162 , cos162 )) + float2( 0.5,0.5 );
			float4 tex2DNode25 = tex2D( _DissloveTex, rotator162 );
			float smoothstepResult27 = smoothstep( ( (( _CustomdataDis )?( i.uv2_tex4coord2.z ):( _DIssloveFactor )) - _DIssloveSoft ) , (( _CustomdataDis )?( i.uv2_tex4coord2.z ):( _DIssloveFactor )) , tex2DNode25.r);
			float temp_output_233_0 = step( ( (( _CustomdataDis )?( i.uv2_tex4coord2.z ):( _DIssloveFactor )) - _DIssloveWide ) , tex2DNode25.r );
			float DisAplha42 = (( _sot_sting_A )?( temp_output_233_0 ):( smoothstepResult27 ));
			float dotResult106 = dot( i.viewDir , ase_worldNormal );
			float softedge111 = pow( saturate( dotResult106 ) , _softFacotr );
			float4 ase_screenPos88 = i.screenPosition88;
			float4 ase_screenPosNorm88 = ase_screenPos88 / ase_screenPos88.w;
			ase_screenPosNorm88.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm88.z : ase_screenPosNorm88.z * 0.5 + 0.5;
			float screenDepth88 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm88.xy ));
			float distanceDepth88 = saturate( ( screenDepth88 - LinearEyeDepth( ase_screenPosNorm88.z ) ) / ( _DepthfadeFactor ) );
			float MainAlpha142 = pow( saturate( ( MaskAlpha136 * MainTexAlpha37 * DisAplha42 * (( _FNLfanxiangkaiguan )?( softedge111 ):( 1.0 )) * (( _Depthfadeon )?( distanceDepth88 ):( 1.0 )) ) ) , _MainAlphaPower );
			float4 MainColornoparticle224 = ( _MainColor * tex2DNode1 );
			float4 lerpResult230 = lerp( MainColornoparticle224 , _DIssloveColor , _DIssloveColor.a);
			float4 lerpResult33 = lerp( lerpResult230 , MainColornoparticle224 , smoothstepResult27);
			float temp_output_234_0 = ( temp_output_233_0 - step( (( _CustomdataDis )?( i.uv2_tex4coord2.z ):( _DIssloveFactor )) , tex2DNode25.r ) );
			float4 temp_output_237_0 = ( lerpResult230 * temp_output_234_0 );
			float4 lerpResult244 = lerp( MainColornoparticle224 , temp_output_237_0 , temp_output_234_0);
			float4 DisColor40 = ( i.vertexColor * (( _soft_sting )?( lerpResult244 ):( lerpResult33 )) );
			float2 appendResult214 = (float2(_ScreenU , _ScreenV));
			float2 uv_ScreenDistortTex = i.uv_texcoord * _ScreenDistortTex_ST.xy + _ScreenDistortTex_ST.zw;
			float2 panner210 = ( 1.0 * _Time.y * appendResult214 + uv_ScreenDistortTex);
			float2 uv_ScreenDistortMask = i.uv_texcoord * _ScreenDistortMask_ST.xy + _ScreenDistortMask_ST.zw;
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( ase_screenPos );
			float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
			float4 screenColor182 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_GrabTexture,( ( (( _CustomdataScreenUV )?( i.uv3_tex4coord3.z ):( _ScreenDistortTexScale )) * tex2D( _ScreenDistortTex, panner210 ).r * tex2D( _ScreenDistortMask, uv_ScreenDistortMask ).r ) + ase_grabScreenPosNorm ).xy);
			float4 GrabScreen192 = screenColor182;
			o.Emission = (( _Screencoloron )?( ( GrabScreen192 + fnlColor97 ) ):( ( (( _FNLkaiguan )?( temp_cast_0 ):( fnlColor97 )) + ( (( _AlphaAdd )?( MainAlpha142 ):( 1.0 )) * DisColor40 ) ) )).rgb;
			float depthfade201 = (( _Depthfadeon )?( distanceDepth88 ):( 1.0 ));
			o.Alpha = (( _screenalphaon )?( ( 1.0 * depthfade201 * i.vertexColor.a * softedge111 ) ):( MainAlpha142 ));
		}

		ENDCG
	}
	CustomEditor "CommonGUI"
}
/*ASEBEGIN
Version=18912
-1925;101;1920;1121;2828.653;-798.3278;1;True;False
Node;AmplifyShaderEditor.CommentaryNode;62;-2897.431,2915.616;Inherit;False;1773.547;441.7441;Distort;10;63;60;61;57;55;56;54;58;59;64;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;55;-2837.168,3108.52;Inherit;False;Property;_DistortTex_Uspeed;DistortTex_Uspeed;15;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;56;-2835.168,3200.222;Inherit;False;Property;_DistortTex_Vspeed;DistortTex_Vspeed;16;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;58;-2602.469,3183.821;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;57;-2847.431,2965.616;Inherit;False;0;54;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;59;-2442.469,3159.82;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;54;-2233.714,3132.134;Inherit;True;Property;_DistortTex;DistortTex;11;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;64;-2044.297,2956.09;Inherit;False;Property;_DistortFactor;DistortFactor;14;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;61;-1900.701,3159.739;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;144;-834.46,2799.522;Inherit;False;2122.18;664.3225;Mask;20;136;140;141;135;52;152;149;133;154;132;138;153;139;134;179;151;219;220;221;222;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;63;-1746.515,3054.015;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;44;-4261.663,771.2585;Inherit;False;3194.44;1209.388;Disslove;42;42;242;241;239;225;237;233;40;234;235;236;29;28;231;226;227;33;230;229;35;27;25;30;163;162;161;49;51;48;160;71;47;45;122;46;177;121;159;70;120;243;244;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;151;-324.6159,3348.071;Inherit;False;Property;_Mask_rotat;Mask_rotat;41;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;220;-720.1443,2977.939;Inherit;False;Property;_Mask_Uspeed;Mask_Uspeed;59;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;21;-3604.987,-238.151;Inherit;False;2422.041;867.2671;Main;29;36;6;224;223;37;7;9;5;125;8;1;158;157;11;156;14;17;118;12;15;127;13;178;67;155;119;65;20;16;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;60;-1535.535,3049.638;Inherit;False;DistortUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;221;-720.1443,3078.939;Inherit;False;Property;_Mask_Vspeed;Mask_Vspeed;60;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;132;-712.5253,2838.1;Inherit;False;0;52;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;121;-3995.703,1225.121;Inherit;False;Property;_DistortDisTex;DistortDisTex;13;1;[Enum];Create;True;0;2;off;0;on;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-3437.713,-177.6959;Inherit;False;Constant;_Float0;Float 0;8;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;134;-806.46,3335.844;Inherit;False;2;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;65;-3428.507,174.29;Inherit;False;60;DistortUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;155;-2921.573,486.9138;Inherit;False;Property;_MainTex_rotat;MainTex_rotat;42;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;222;-517.1445,2996.939;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;139;-765.1921,3210.022;Inherit;False;Constant;_Float6;Float 6;42;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;179;-9.111071,3340.832;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;360;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;16;-3507.26,-57.07033;Inherit;False;1;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;67;-3411,92;Inherit;False;Constant;_Float1;Float 1;25;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;120;-3979.703,1049.122;Inherit;False;Constant;_Float2;Float 2;25;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;70;-3990.457,1133.199;Inherit;False;60;DistortUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;159;-3574.336,1301.898;Inherit;False;Property;_DIssolve_rotat;DIssolve_rotat;43;0;Create;True;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;119;-3427,268;Inherit;False;Property;_DistortMainTex;DistortMainTex;12;1;[Enum];Create;True;0;2;off;0;on;1;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;178;-2634.505,460.187;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;360;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;138;-564.9862,3208.971;Inherit;False;Property;_CustomdataMaskUV;CustomdataMaskUV;38;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-3292.262,538.4047;Inherit;False;Property;_MainTex_Vspeed;MainTex_Vspeed;9;0;Create;True;0;0;0;False;0;False;0;0.09;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;127;-3229.521,-161.772;Inherit;False;Property;_CustomdataMainTexUV;CustomdataMainTexUV;35;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;118;-3123,108;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;15;-3184.865,-24.55683;Inherit;False;0;1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;12;-3294.262,458.4048;Inherit;False;Property;_MainTex_Uspeed;MainTex_Uspeed;8;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;219;-375.1446,2843.939;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;177;-3301.325,1375.254;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;360;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;46;-3866.717,1340.78;Inherit;False;Property;_DisTex_Uspeed;DisTex_Uspeed;22;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PiNode;153;65.38462,3215.071;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;122;-3691.703,1065.122;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;47;-3864.717,1420.782;Inherit;False;Property;_DisTex_Vspeed;DisTex_Vspeed;23;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;45;-3775.212,916.3879;Inherit;False;0;25;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;154;207.3846,3314.071;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.PiNode;160;-3182.336,1273.898;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;48;-3643.717,1427.782;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;71;-3489.95,992.9172;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;83;-2686.099,3446.788;Inherit;False;1558.463;887.9036;VTO;24;76;77;75;73;74;72;78;79;80;81;82;85;87;171;228;96;93;111;109;110;108;106;107;105;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;17;-2901.351,-43.08985;Inherit;False;3;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;133;-142.8179,2946.393;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;14;-3085.262,489.4047;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PiNode;156;-2583.573,336.9138;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;149;89.38418,2945.071;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;28;-2788.746,1295.616;Inherit;False;Property;_DIssloveFactor;DIssloveFactor;18;0;Create;True;0;0;0;False;0;False;0.5077091;0.797;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;105;-2582.171,3928.032;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;157;-2441.573,435.9138;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;11;-2781.201,193.0904;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;51;-2780.95,1377.267;Inherit;False;1;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;49;-3371.549,1135.291;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;161;-3040.336,1372.898;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;107;-2606.002,4134.717;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;29;-2514.746,1477.616;Inherit;False;Property;_DIssloveSoft;DIssloveSoft;20;0;Create;True;0;0;0;False;0;False;0.8235294;0.542;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;163;-2474.48,1344.895;Inherit;False;Property;_CustomdataDis;CustomdataDis;44;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;106;-2367.282,4000.779;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;152;276.4155,3037.558;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;158;-2363.573,190.9138;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;162;-2961.251,1135.491;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;235;-2516.168,1638.414;Inherit;False;Property;_DIssloveWide;DIssloveWide;19;0;Create;True;0;0;0;False;0;False;0.02352943;0.542;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;108;-2074.003,4001.716;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;30;-2191.429,1197.317;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;52;308.6259,3116.708;Inherit;True;Property;_MaskTex;MaskTex;10;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;110;-2167.003,4230.717;Inherit;False;Property;_softFacotr;softFacotr;32;0;Create;True;0;0;0;False;0;False;1;0;1;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;8;-2081.951,-18.12685;Inherit;False;Property;_MainColor;MainColor;7;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,0.6179246,0.6179246,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;25;-2687.239,1106.791;Inherit;True;Property;_DissloveTex;DissloveTex;17;0;Create;True;0;0;0;False;0;False;-1;86ad23c623f950a4997067186e283be5;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;236;-2169.168,1575.414;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1;-2171.418,168.4658;Inherit;True;Property;_MainTex;MainTex;5;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StepOpNode;233;-1995.168,1662.414;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;27;-1968.43,1131.912;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;223;-1774.595,55.16895;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;141;548.1967,3024.275;Inherit;False;Property;_Mask_scale;Mask_scale;39;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;109;-1867.003,3973.716;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;172;-996.4691,-218.3116;Inherit;False;1472.581;1156.105;alpha;17;116;142;128;129;126;130;43;168;137;39;115;169;88;89;174;175;201;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ToggleSwitchNode;125;-1842.34,215.7968;Inherit;False;Property;_MainTex_ar;MainTex_a/r;34;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;5;-2042.036,-188.151;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;9;-1895.634,420.8288;Inherit;False;Property;_MainAlpha;MainAlpha;6;0;Create;True;0;0;0;False;0;False;1;1;0;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;135;592.7247,3175.048;Inherit;False;Property;_MaskAlphaRA;MaskAlphaRA;37;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;140;804.1966,3159.274;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;116;-936.7766,510.924;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;89;-952.7766,670.9241;Float;False;Property;_DepthfadeFactor;DepthfadeFactor;33;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;111;-1603.911,3969.877;Inherit;False;softedge;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;209;-1304.82,-1757.95;Inherit;False;1961.509;930.4128;Comment;15;214;213;212;211;210;183;192;182;184;186;194;185;187;193;215;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;224;-1606.453,26.34498;Inherit;False;MainColornoparticle;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;242;-1726.253,1420.629;Inherit;False;Property;_sot_sting_A;sot_sting_A;62;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;7;-1594.177,118.102;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;115;-946.4691,331.7197;Inherit;False;111;softedge;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;213;-1269.991,-1264.794;Inherit;False;Property;_ScreenV;ScreenV;57;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;231;-2009.168,1407.414;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;212;-1274.511,-1351.83;Inherit;False;Property;_ScreenU;ScreenU;56;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;175;-532.2936,470.2303;Inherit;False;Constant;_Float8;Float 8;48;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DepthFade;88;-712.7766,590.9241;Inherit;False;True;True;False;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;169;-922.2514,239.7957;Inherit;False;Constant;_Float5;Float 5;47;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;37;-1390.115,113.1548;Inherit;False;MainTexAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;35;-2325.143,825.1823;Inherit;False;Property;_DIssloveColor;DIssloveColor;21;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,0.4987022,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;42;-1648.066,1273.837;Inherit;False;DisAplha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;136;986.1863,3173.323;Inherit;False;MaskAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;229;-2340.078,1023.661;Inherit;False;224;MainColornoparticle;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;39;-831.644,61.17602;Inherit;False;37;MainTexAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;174;-389.6426,560.2723;Inherit;False;Property;_Depthfadeon;Depthfadeon;48;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;43;-830.3347,155.2178;Inherit;False;42;DisAplha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;211;-1121.917,-1485.209;Inherit;False;0;185;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;168;-739.0899,301.8241;Inherit;False;Property;_FNLfanxiangkaiguan;FNLfanxiangkaiguan;45;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;230;-2019.152,856.0782;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;214;-1090.269,-1316.79;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;137;-596.9862,-168.3116;Inherit;False;136;MaskAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;99;-2592.674,3234.404;Inherit;False;1729;481;fnl;5;94;91;92;97;95;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;234;-1740.168,1601.414;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;237;-1497.964,1411.179;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;93;-2565.674,3474.404;Inherit;False;Property;_fnl_power;fnl_power;29;0;Create;True;0;0;0;False;0;False;1;0;1;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;187;-750.6973,-1707.95;Float;False;Property;_ScreenDistortTexScale;ScreenDistortTexScale;51;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;193;-705.647,-1582.636;Inherit;False;2;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;210;-858.5526,-1346.178;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;130;-440.9518,48.2608;Inherit;False;5;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;225;-2036.934,1054.991;Inherit;False;224;MainColornoparticle;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;92;-2569.438,3318.685;Inherit;False;Property;_fnl_sacle;fnl_sacle;30;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;194;-457.0467,-1587.537;Inherit;False;Property;_CustomdataScreenUV;CustomdataScreenUV;52;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;244;-1276.653,1377.328;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;33;-1659.524,1083.159;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;74;-2623.836,3731.394;Inherit;False;Property;_VTOTex_Vspeed;VTOTex_Vspeed;27;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;126;-302.5528,46.32581;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;185;-666.2136,-1375.086;Inherit;True;Property;_ScreenDistortTex;ScreenDistortTex;50;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;73;-2625.836,3639.693;Inherit;False;Property;_VTOTex_Uspeed;VTOTex_Uspeed;26;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;91;-2286.286,3291.2;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;129;-400.4755,272.0751;Inherit;False;Property;_MainAlphaPower;MainAlphaPower;36;0;Create;True;0;0;0;False;0;False;1;1;1;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;215;-667.1361,-1159.377;Inherit;True;Property;_ScreenDistortMask;ScreenDistortMask;49;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VertexColorNode;227;-1710.963,816.2093;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GrabScreenPosition;183;-287.0403,-1079.102;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;94;-1724.951,3293.264;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;186;-222.4025,-1371.391;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;76;-2391.136,3714.993;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PowerNode;128;-145.513,15.546;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;241;-1274.5,1188.83;Inherit;False;Property;_soft_sting;soft_sting;61;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;75;-2636.099,3496.788;Inherit;False;0;72;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;96;-1476,3461;Inherit;False;Property;_fnl_color;fnl_color;31;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;77;-2231.136,3690.992;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;85;-2461.7,4055.287;Inherit;False;1;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;142;29.79517,9.943512;Inherit;False;MainAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;95;-1243,3292;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;226;-1522.725,966.0503;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;87;-2371.411,3952.245;Inherit;False;Constant;_Float3;Float 3;32;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;184;-24.86218,-1213.492;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.NormalVertexDataNode;79;-1851.761,3856.695;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScreenColorNode;182;138.1378,-1071.492;Inherit;False;Global;_GrabScreen0;Grab Screen 0;49;0;Create;True;0;0;0;False;0;False;Object;-1;False;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;40;-1359.119,1063.326;Inherit;False;DisColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;80;-1828.338,4008.248;Inherit;False;Property;_VTOFactor;VTOFactor;25;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;72;-1973.41,3661.283;Inherit;True;Property;_VTOTex;VTOTex;24;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;147;598.7297,-266.0988;Inherit;False;Constant;_Float7;Float 7;44;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;148;593.7297,-128.0988;Inherit;False;142;MainAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;81;-1963.359,4104.691;Inherit;True;Property;_VTOMaskTex;VTOMaskTex;28;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;97;-1086,3287;Inherit;False;fnlColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;171;-2194.93,4014.321;Inherit;False;Property;_ToggleSwitch0;Toggle Switch0;47;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;131;777.3591,-25.29684;Inherit;False;40;DisColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;167;834.8112,-356.2628;Inherit;False;Constant;_Float4;Float 4;46;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;101;805.3436,-532.8822;Inherit;False;97;fnlColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;192;432.6888,-1070.801;Inherit;False;GrabScreen;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;201;-144.1597,559.3422;Inherit;False;depthfade;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;78;-1525.235,3688.609;Inherit;False;5;5;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ToggleSwitchNode;146;782.7297,-199.0988;Inherit;False;Property;_AlphaAdd;AlphaAdd;40;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;170;1032.233,-435.8027;Inherit;False;Property;_FNLkaiguan;FNLkaiguan;46;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;145;1062.73,-43.09875;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;206;1247,30;Inherit;False;97;fnlColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;196;1247,-98;Inherit;False;192;GrabScreen;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;217;1015.826,522.6242;Inherit;False;111;softedge;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;82;-1351.636,3683.098;Inherit;False;VTO;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.VertexColorNode;216;1012,317.0424;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;202;1021.826,239.0773;Inherit;False;201;depthfade;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;200;1311.272,608.3492;Inherit;False;Constant;_Float10;Float 10;54;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;165;1293.806,-254.1787;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CommentaryNode;10;-3130.546,-636.0404;Inherit;False;1063.897;312.1366;Comment;4;2;3;4;123;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;205;1455,-66;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;84;1286.127,426.232;Inherit;False;82;VTO;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;203;1239.309,253.8633;Inherit;False;4;4;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;143;1049.292,92.62549;Inherit;False;142;MainAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;243;-1454.653,1574.328;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;239;-1418.39,1240.316;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;123;-2794.601,-583.2109;Float;False;Property;_Ztest;Ztest;2;1;[Enum];Create;True;0;1;Option1;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;195;1592.032,-259.2392;Inherit;False;Property;_Screencoloron;Screencoloron;54;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;-1772.205,-65.88351;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;3;-3080.546,-586.0395;Float;False;Property;_Scr;Scr;3;1;[Enum];Create;True;0;1;Option1;0;1;UnityEngine.Rendering.BlendMode;True;0;False;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;228;-2235.631,3999.593;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;199;1487.272,513.3491;Inherit;False;Property;_screenVTOon;screenVTOon;55;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;2;-2938.145,-585.0394;Float;False;Property;_Cullmode;Cullmode;1;1;[Enum];Create;True;0;1;Option1;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4;-3080.546,-492.0387;Float;False;Property;_Dst;Dst;4;1;[Enum];Create;True;0;1;Option1;0;1;UnityEngine.Rendering.BlendMode;True;0;False;10;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;36;-1439.788,-71.3447;Inherit;False;MainColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;218;1621.024,708.7419;Inherit;False;Property;_Tessellation;Tessellation;58;0;Create;True;0;0;0;False;0;False;50;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;197;1485.755,94.21727;Inherit;False;Property;_screenalphaon;screenalphaon;53;0;Create;True;0;0;0;False;0;False;0;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1842.831,-95.75894;Float;False;True;-1;7;ASEMaterialInspector;0;0;Unlit;VFX/Pandavfx;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;2;False;-1;7;True;123;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;False;0;True;Transparent;;Transparent;All;18;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;0;32;10;25;False;1;False;2;5;True;3;10;True;4;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;False;0;0;True;2;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.CommentaryNode;114;-2656.002,3878.032;Inherit;False;1527;468.6843;softedge;0;;1,1,1,1;0;0
WireConnection;58;0;55;0
WireConnection;58;1;56;0
WireConnection;59;0;57;0
WireConnection;59;2;58;0
WireConnection;54;1;59;0
WireConnection;61;0;54;1
WireConnection;61;1;54;2
WireConnection;63;0;64;0
WireConnection;63;1;61;0
WireConnection;60;0;63;0
WireConnection;222;0;220;0
WireConnection;222;1;221;0
WireConnection;179;0;151;0
WireConnection;178;0;155;0
WireConnection;138;0;139;0
WireConnection;138;1;134;0
WireConnection;127;0;20;0
WireConnection;127;1;16;0
WireConnection;118;0;67;0
WireConnection;118;1;65;0
WireConnection;118;2;119;0
WireConnection;219;0;132;0
WireConnection;219;2;222;0
WireConnection;177;0;159;0
WireConnection;153;0;179;0
WireConnection;122;0;120;0
WireConnection;122;1;70;0
WireConnection;122;2;121;0
WireConnection;154;0;153;0
WireConnection;160;0;177;0
WireConnection;48;0;46;0
WireConnection;48;1;47;0
WireConnection;71;0;45;0
WireConnection;71;1;122;0
WireConnection;17;0;127;0
WireConnection;17;1;15;0
WireConnection;17;2;118;0
WireConnection;133;0;219;0
WireConnection;133;1;138;0
WireConnection;14;0;12;0
WireConnection;14;1;13;0
WireConnection;156;0;178;0
WireConnection;149;0;133;0
WireConnection;149;2;154;0
WireConnection;157;0;156;0
WireConnection;11;0;17;0
WireConnection;11;2;14;0
WireConnection;49;0;71;0
WireConnection;49;2;48;0
WireConnection;161;0;160;0
WireConnection;163;0;28;0
WireConnection;163;1;51;3
WireConnection;106;0;105;0
WireConnection;106;1;107;0
WireConnection;152;0;149;0
WireConnection;158;0;11;0
WireConnection;158;2;157;0
WireConnection;162;0;49;0
WireConnection;162;2;161;0
WireConnection;108;0;106;0
WireConnection;30;0;163;0
WireConnection;30;1;29;0
WireConnection;52;1;152;0
WireConnection;25;1;162;0
WireConnection;236;0;163;0
WireConnection;236;1;235;0
WireConnection;1;1;158;0
WireConnection;233;0;236;0
WireConnection;233;1;25;1
WireConnection;27;0;25;1
WireConnection;27;1;30;0
WireConnection;27;2;163;0
WireConnection;223;0;8;0
WireConnection;223;1;1;0
WireConnection;109;0;108;0
WireConnection;109;1;110;0
WireConnection;125;0;1;4
WireConnection;125;1;1;1
WireConnection;135;0;52;4
WireConnection;135;1;52;1
WireConnection;140;0;141;0
WireConnection;140;1;135;0
WireConnection;111;0;109;0
WireConnection;224;0;223;0
WireConnection;242;0;27;0
WireConnection;242;1;233;0
WireConnection;7;0;5;4
WireConnection;7;1;125;0
WireConnection;7;2;8;4
WireConnection;7;3;9;0
WireConnection;231;0;163;0
WireConnection;231;1;25;1
WireConnection;88;1;116;0
WireConnection;88;0;89;0
WireConnection;37;0;7;0
WireConnection;42;0;242;0
WireConnection;136;0;140;0
WireConnection;174;0;175;0
WireConnection;174;1;88;0
WireConnection;168;0;169;0
WireConnection;168;1;115;0
WireConnection;230;0;229;0
WireConnection;230;1;35;0
WireConnection;230;2;35;4
WireConnection;214;0;212;0
WireConnection;214;1;213;0
WireConnection;234;0;233;0
WireConnection;234;1;231;0
WireConnection;237;0;230;0
WireConnection;237;1;234;0
WireConnection;210;0;211;0
WireConnection;210;2;214;0
WireConnection;130;0;137;0
WireConnection;130;1;39;0
WireConnection;130;2;43;0
WireConnection;130;3;168;0
WireConnection;130;4;174;0
WireConnection;194;0;187;0
WireConnection;194;1;193;3
WireConnection;244;0;225;0
WireConnection;244;1;237;0
WireConnection;244;2;234;0
WireConnection;33;0;230;0
WireConnection;33;1;225;0
WireConnection;33;2;27;0
WireConnection;126;0;130;0
WireConnection;185;1;210;0
WireConnection;91;2;92;0
WireConnection;91;3;93;0
WireConnection;94;0;91;0
WireConnection;186;0;194;0
WireConnection;186;1;185;1
WireConnection;186;2;215;1
WireConnection;76;0;73;0
WireConnection;76;1;74;0
WireConnection;128;0;126;0
WireConnection;128;1;129;0
WireConnection;241;0;33;0
WireConnection;241;1;244;0
WireConnection;77;0;75;0
WireConnection;77;2;76;0
WireConnection;142;0;128;0
WireConnection;95;0;94;0
WireConnection;95;1;96;0
WireConnection;226;0;227;0
WireConnection;226;1;241;0
WireConnection;184;0;186;0
WireConnection;184;1;183;0
WireConnection;182;0;184;0
WireConnection;40;0;226;0
WireConnection;72;1;77;0
WireConnection;97;0;95;0
WireConnection;171;0;87;0
WireConnection;171;1;85;4
WireConnection;192;0;182;0
WireConnection;201;0;174;0
WireConnection;78;0;72;1
WireConnection;78;1;79;0
WireConnection;78;2;80;0
WireConnection;78;3;81;1
WireConnection;78;4;171;0
WireConnection;146;0;147;0
WireConnection;146;1;148;0
WireConnection;170;0;101;0
WireConnection;170;1;167;0
WireConnection;145;0;146;0
WireConnection;145;1;131;0
WireConnection;82;0;78;0
WireConnection;165;0;170;0
WireConnection;165;1;145;0
WireConnection;205;0;196;0
WireConnection;205;1;206;0
WireConnection;203;1;202;0
WireConnection;203;2;216;4
WireConnection;203;3;217;0
WireConnection;239;0;225;0
WireConnection;239;1;237;0
WireConnection;195;0;165;0
WireConnection;195;1;205;0
WireConnection;6;0;5;0
WireConnection;6;1;1;0
WireConnection;6;2;8;0
WireConnection;228;0;106;0
WireConnection;199;0;84;0
WireConnection;199;1;200;0
WireConnection;36;0;6;0
WireConnection;197;0;143;0
WireConnection;197;1;203;0
WireConnection;0;2;195;0
WireConnection;0;9;197;0
WireConnection;0;11;199;0
ASEEND*/
//CHKSM=999508A15B51F9DE15DD3575822E8C0ACA40E4A1
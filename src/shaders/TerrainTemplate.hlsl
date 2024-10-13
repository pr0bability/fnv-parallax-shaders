//  Template for terrain shaders for blending up to 7 textures and using up to 8 pointlights.

#define TERRAIN

#include "includes/Helpers.hlsli"
#include "includes/Parallax.hlsli"
#include "includes/Terrain.hlsli"

struct VS_INPUT {
    float4 position : POSITION;
    float3 tangent : TANGENT;
    float3 binormal : BINORMAL;
    float3 normal : NORMAL;
    float4 uv : TEXCOORD0;
    float4 vertex_color : COLOR0;
    float4 blend_0 : TEXCOORD1;
    float4 blend_1 : TEXCOORD2;
};

struct VS_OUTPUT {
    float4 blend_0 : COLOR0;
    float4 blend_1 : COLOR1;
    float4 sPosition : POSITION;
    float2 uv : TEXCOORD0;
    float3 vertex_color : TEXCOORD1;
    float3 lPosition : TEXCOORD2;
    float3 tangent : TEXCOORD3;
    float3 binormal : TEXCOORD4;
    float3 normal : TEXCOORD5;
    float4 viewWS : TEXCOORD6;
    float4 fogColor : TEXCOORD7;
};

#ifdef VS

float3 FogColor : register(c15);
float4 FogParam : register(c14);
row_major float4x4 ModelViewProj : register(c0);

VS_OUTPUT main(VS_INPUT IN) {
    VS_OUTPUT OUT;

    float3 mdl0;
    float4 r0;

    mdl0.xyz = mul(float3x4(ModelViewProj[0].xyzw, ModelViewProj[1].xyzw, ModelViewProj[2].xyzw), IN.position.xyzw);

    OUT.blend_0 = IN.blend_0;
    OUT.blend_1 = IN.blend_1;

    OUT.sPosition.w = dot(ModelViewProj[3].xyzw, IN.position.xyzw);
    OUT.sPosition.xyz = mdl0.xyz;
    OUT.uv.xy = IN.uv.xy;
    OUT.vertex_color.xyz = IN.vertex_color.rgb;
    OUT.lPosition.xyz = IN.position.xyz;
    OUT.tangent.xyz = IN.tangent.xyz;
    OUT.binormal.xyz = IN.binormal.xyz;
    OUT.normal.xyz = IN.normal.xyz;
    r0.zw = FogParam.z;
    r0.xy = 1 - saturate((FogParam.x - length(mdl0.xyz)) / FogParam.y);
    r0 = asm_lit(r0);
    OUT.fogColor.a = r0.z;
    OUT.fogColor.xyz = FogColor.rgb;
    
    float3 eye = mdl0.xyz - IN.position.xyz;
    OUT.viewWS.xyz = eye.xyz;
    OUT.viewWS.w = length(eye);

    return OUT;
};

#endif  // Vertex shader.

struct PS_INPUT {
    float4 blend_0 : COLOR0;
    float4 blend_1 : COLOR1;
    float2 uv : TEXCOORD0;
    float3 vertex_color : TEXCOORD1_centroid;
    float3 lPosition : TEXCOORD2_centroid;
    float3 tangent : TEXCOORD3_centroid;
    float3 binormal : TEXCOORD4_centroid;
    float3 normal : TEXCOORD5_centroid;
    float4 viewWS : TEXCOORD6_centroid;
    float4 fogColor : TEXCOORD7_centroid;
};

struct PS_OUTPUT {
    float4 color_0 : COLOR0;
};

#ifdef PS

sampler2D BaseMap[7]:register(s0);
sampler2D NormalMap[7]:register(s7);

float4 AmbientColor : register(c1);
float4 PSLightColor[10] : register(c3);
float4 PSLightDir : register(c18);
float4 PSLightPosition[8] : register(c19);

PS_OUTPUT main(PS_INPUT IN) {
    PS_OUTPUT OUT;
    
    int texCount = TEX_COUNT;  // Macro.
    float3 tangent = normalize(IN.tangent.xyz);
    float3 binormal = normalize(IN.binormal.xyz);
    float3 normal = normalize(IN.normal.xyz);
    float3x3 tbn = float3x3(tangent, binormal, normal);
    float3 eyeDir = -mul(tbn, normalize(IN.viewWS.xyz));

    float dist = length(IN.viewWS.xyz);

    float2 dx, dy;
    dx = ddx(IN.uv.xy);
    dy = ddy(IN.uv.xy);
    
    float weights[7] = { 0, 0, 0, 0, 0, 0, 0 };
    float blends[7] = { IN.blend_0.x, IN.blend_0.y, IN.blend_0.z, IN.blend_0.w, IN.blend_1.x, IN.blend_1.y, IN.blend_1.z };
    float2 offsetUV = getParallaxCoords(dist, IN.uv.xy, dx, dy, eyeDir, texCount, BaseMap, blends, weights);

    float3 baseColor = blendDiffuseMaps(IN.vertex_color, offsetUV, texCount, BaseMap, weights);
    float3 combinedNormal = blendNormalMaps(offsetUV, texCount, NormalMap, weights);

    float3 lightTS = mul(tbn, PSLightDir.xyz);
    float parallaxShadowMultiplier = getParallaxShadowMultipler(dist, offsetUV, dx, dy, lightTS, texCount, blends, BaseMap);
    
    float3 lighting = shades(combinedNormal, lightTS) * PSLightColor[0].rgb * parallaxShadowMultiplier;

#if defined(POINTLIGHT)
    int lightCount = 8;
    float3 pointlightDir;
    float3 pointlightAtt;
    [unroll] for (int i = 0; i < lightCount; i++) {
        pointlightDir = PSLightPosition[i].xyz - IN.lPosition.xyz;
        pointlightAtt = pointlightDir.xyz / PSLightPosition[i].w;
        pointlightDir = normalize(mul(tbn, pointlightDir));
        lighting += shades(combinedNormal, pointlightDir) * (1 - shades(pointlightAtt, pointlightAtt)) * PSLightColor[i + 1].rgb;
    }
#endif
    
    float3 finalColor = (lighting + AmbientColor.rgb) * baseColor;

    OUT.color_0.a = 1;
    OUT.color_0.rgb = finalColor;

    return OUT;
};

#endif  // Pixel shader.

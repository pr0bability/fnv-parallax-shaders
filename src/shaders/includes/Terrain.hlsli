float3 blendDiffuseMaps(float3 vertexColor, float2 uv, int texCount, sampler2D tex[7], float blends[7]) {
    float3 color = tex2D(tex[0], uv).xyz * blends[0];
    
    [unroll] for (int i = 1; i < texCount; i++) {
        color += (tex2D(tex[i], uv).xyz) * blends[i];
    }

    return color * vertexColor;
}

float3 blendNormalMaps(float2 uv, int texCount, sampler2D tex[7], float blends[7]) {
    float4 normal = tex2D(tex[0], uv);
    float3 combinedNormal = expand(normal.xyz) * blends[0];
    
    [unroll] for (int i = 1; i < texCount; i++) {
        normal = tex2D(tex[i], uv);
        combinedNormal += expand(normal.xyz) * blends[i];
    }
    
    return normalize(combinedNormal);
}

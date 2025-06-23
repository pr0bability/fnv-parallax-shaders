#if defined(TERRAIN) && !defined(MAX_STEPS)
    #define MAX_STEPS 16
    #define MAX_DISTANCE 2048
#endif


#ifdef TERRAIN
// Complex Parallax Materials for Community Shaders
// https://bartwronski.com/wp-content/uploads/2014/03/ac4_gdc.pdf
// https://www.artstation.com/blogs/andreariccardi/3VPo/a-new-approach-for-parallax-mapping-presenting-the-contact-refinement-parallax-mapping-technique
float getTerrainHeight(float2 coords, float2 dx, float2 dy, float blendFactor, int texCount, sampler2D tex[7], float blends[7], float status[7], out float weights[7]) {
    weights = blends;

    float blendPower = blendFactor * 4;
    float total = 0;
    [unroll] for (int i = 0; i < texCount; i++){
        weights[i] = pow(abs(blends[i]), 1 + 1 * blendFactor);
        if (weights[i] > 0.0) {
            weights[i] *= 0.001 + pow(abs(status[i] ? tex2Dgrad(tex[i], coords, dx, dy).a : 0.5f), blendPower);
        }
        total += weights[i];
    }
    
    float invtotal = rcp(total);
	
    [unroll] for (i = 0; i < texCount; i++)
    {
        weights[i] *= invtotal;
    }
    
    return pow(total, rcp(blendPower));
}
#endif

#ifdef TERRAIN
float2 getParallaxCoords(
    float distance, 
    float2 coords, 
    float2 dx, 
    float2 dy, 
    float3 viewDirTS, 
    int texCount, 
    sampler2D tex[7], 
    float blends[7], 
    float status[7], 
    out float weights[7]
) {
#else
float2 getParallaxCoords(float distance, float2 coords, float2 dx, float2 dy, float3 viewDirTS, sampler2D heightMap) {
#endif
    #ifdef TERRAIN
        static const float maxSteps = MAX_STEPS;
        float maxDistance = MAX_DISTANCE;
        float height = 0.1;
    #else
        static const float maxSteps = 16.0f;
        float maxDistance = 2048;
        float height = 0.04;
    #endif
    
    float distanceBlend = saturate(distance / maxDistance);
    float quality = saturate(1.0 - distanceBlend);
    
    #ifdef TERRAIN
        float blendFactor = quality;
    #endif

    viewDirTS = normalize(viewDirTS);

    #ifdef TERRAIN
        // Fix for angles.
        viewDirTS.z = ((viewDirTS.z * 0.7) + 0.3);
        viewDirTS.xy /= viewDirTS.z;
    #endif

    float maxHeight = height;
    float minHeight = maxHeight * 0.5;

    float2 output;
    if (distanceBlend < 1.0) {
        int numSteps = int((maxSteps * (1.0 - distanceBlend)) + 0.5);
        numSteps = ((numSteps + 3) / 4) * 4;
        numSteps = clamp(numSteps, 4, maxSteps);

        float stepSize = rcp((float) numSteps);

        float2 offsetPerStep = viewDirTS.xy * float2(maxHeight, maxHeight) * stepSize.xx;
        float2 prevOffset = viewDirTS.xy * float2(minHeight, minHeight) + coords.xy;

        float prevBound = 1.0;
        float prevHeight = 1.0;

        float2 pt1 = 0;
        float2 pt2 = 0;
        
        int numStepOrig = numSteps;
        bool done = false;
        bool contactRefinement = false;

        // Need fastopt otherwise compile times are crazy.
        [loop]
        while (numSteps > 0 && !done) {
            float4 currentOffset[2];
            currentOffset[0] = prevOffset.xyxy - float4(1, 1, 2, 2) * offsetPerStep.xyxy;
            currentOffset[1] = prevOffset.xyxy - float4(3, 3, 4, 4) * offsetPerStep.xyxy;
            float4 currentBound = prevBound.xxxx - float4(1, 2, 3, 4) * stepSize;

            float4 currHeight;
            
            #ifdef TERRAIN
                currHeight.x = getTerrainHeight(currentOffset[0].xy, dx, dy, blendFactor, texCount, tex, blends, status, weights);
                currHeight.y = getTerrainHeight(currentOffset[0].zw, dx, dy, blendFactor, texCount, tex, blends, status, weights);
                currHeight.z = getTerrainHeight(currentOffset[1].xy, dx, dy, blendFactor, texCount, tex, blends, status, weights);
                currHeight.w = getTerrainHeight(currentOffset[1].zw, dx, dy, blendFactor, texCount, tex, blends, status, weights);
            #else
            currHeight.x = tex2Dgrad(heightMap, currentOffset[0].xy, dx, dy).r;
            currHeight.y = tex2Dgrad(heightMap, currentOffset[0].zw, dx, dy).r;
            currHeight.z = tex2Dgrad(heightMap, currentOffset[1].xy, dx, dy).r;
            currHeight.w = tex2Dgrad(heightMap, currentOffset[1].zw, dx, dy).r;
            #endif

            bool4 testResult = currHeight >= currentBound;

            [branch]
            if (any(testResult)) {
                float2 lastOffset = 0;
                [flatten]
                if (testResult.w) {
                    lastOffset = currentOffset[1].xy;
                    pt1 = float2(currentBound.w, currHeight.w);
                    pt2 = float2(currentBound.z, currHeight.z);
                }
                [flatten]
                if (testResult.z) {
                    lastOffset = currentOffset[0].zw;
                    pt1 = float2(currentBound.z, currHeight.z);
                    pt2 = float2(currentBound.y, currHeight.y);
                }
                [flatten]
                if (testResult.y) {
                    lastOffset = currentOffset[0].xy;
                    pt1 = float2(currentBound.y, currHeight.y);
                    pt2 = float2(currentBound.x, currHeight.x);
                }
                [flatten]
                if (testResult.x) {
                    lastOffset = prevOffset;
                    pt1 = float2(currentBound.x, currHeight.x);
                    pt2 = float2(prevBound, prevHeight);
                }
                
                if (contactRefinement) {
                    done = true;
                }
                else {
                    contactRefinement = true;
                    prevOffset = lastOffset;
                    prevBound = pt2.x;
                    numSteps = numStepOrig;
                    stepSize /= (float) numSteps;
                    offsetPerStep /= (float) numSteps;
                }
            }
            else {
                prevOffset = currentOffset[1].zw;
                prevBound = currentBound.w;
                prevHeight = currHeight.w;
                numSteps -= 4;
            }
        }
        
        float delta2 = pt2.x - pt2.y;
        float delta1 = pt1.x - pt1.y;

        float denominator = delta2 - delta1;

        float parallaxAmount = 0.0;
        if (denominator == 0.0) {
            parallaxAmount = 0.0;
        }
        else {
            parallaxAmount = (pt1.x * delta2 - pt2.x * delta1) / denominator;
        }
        
        distanceBlend *= distanceBlend;
        
        float offset = (1.0 - parallaxAmount) * -maxHeight + minHeight;
        return lerp(viewDirTS.xy * offset + coords.xy, coords, distanceBlend);
    }
    
    #ifdef TERRAIN
        weights = blends;
    #endif
    return coords;
}

#ifdef TERRAIN
float getParallaxShadowMultipler(float distance, float2 coords, float2 dx, float2 dy, float3 lightTS, int texCount, float blends[7], float status[7], sampler2D tex[7]) {
    float maxDistance = 2048;
    float shadowsIntensity = 2.0;
    
    float quality = 1.0 - distance / maxDistance;
    
    if (quality > 0.0)
    {
        float weights[7] = { 0, 0, 0, 0, 0, 0, 0 };
        float sh0 = getTerrainHeight(coords, dx, dy, quality, texCount, tex, blends, status, weights);

        const float2 rayDir = lightTS.xy * 0.1;
        float4 multipliers = rcp((float4(1, 2, 3, 4)));

        float4 sh = getTerrainHeight(coords + rayDir * multipliers.x, dx, dy, quality, texCount, tex, blends, status, weights);
        if (quality > 0.25)
            sh.y = getTerrainHeight(coords + rayDir * multipliers.y, dx, dy, quality, texCount, tex, blends, status, weights);
        if (quality > 0.5)
            sh.z = getTerrainHeight(coords + rayDir * multipliers.z, dx, dy, quality, texCount, tex, blends, status, weights);
        if (quality > 0.75)
            sh.w = getTerrainHeight(coords + rayDir * multipliers.w, dx, dy, quality, texCount, tex, blends, status, weights);
        
        return 1.0 - saturate(dot(max(0, sh - sh0), 1.0) * shadowsIntensity) * quality;
    }
    
    return 1.0;
}
#else
float getParallaxShadowMultipler(float distance, float2 coords, float2 dx, float2 dy, float3 lightTS, sampler2D heightMap) {
    float maxDistance = 2048;
    float shadowsIntensity = 2.0;
    
    float quality = 1.0 - distance / maxDistance;
    
    if (quality > 0.0) {
        float sh0 = tex2Dgrad(heightMap, coords, dx, dy).r;

        const float2 rayDir = lightTS.xy * 0.04;
        float4 multipliers = rcp((float4(1, 2, 3, 4)));

        float4 sh = tex2Dgrad(heightMap, coords + rayDir * multipliers.x, dx, dy).r;
        if (quality > 0.25)
            sh.y = tex2Dgrad(heightMap, coords + rayDir * multipliers.y, dx, dy).r;
        if (quality > 0.5)
            sh.z = tex2Dgrad(heightMap, coords + rayDir * multipliers.z, dx, dy).r;
        if (quality > 0.75)
            sh.w = tex2Dgrad(heightMap, coords + rayDir * multipliers.w, dx, dy).r;
        
        return 1.0 - saturate(dot(max(0, sh - sh0), 1.0) * shadowsIntensity) * quality;
    }
    
    return 1.0;
}
#endif

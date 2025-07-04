set FXC="C:\Program Files (x86)\Windows Kits\10\bin\10.0.22621.0\x64\fxc.exe"

if not exist "package\Parallax Shaders - Objects\Shaders\Loose" mkdir "package\Parallax Shaders - Objects\Shaders\Loose"
if not exist "package\Parallax Shaders - Terrain\Shaders\Loose" mkdir "package\Parallax Shaders - Terrain\Shaders\Loose"
if not exist "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose" mkdir "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose"

set SHADER_FILE=shaders\ParallaxTemplate.hlsl
%FXC% /T vs_3_0 /E main /DVS /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2000.vso" "%SHADER_FILE%"
%FXC% /T vs_3_0 /E main /DVS /DPROJ_SHADOW /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2001.vso" "%SHADER_FILE%"
%FXC% /T vs_3_0 /E main /DVS /DLIGHTS=2 /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2002.vso" "%SHADER_FILE%"
%FXC% /T vs_3_0 /E main /DVS /DLIGHTS=2 /DPROJ_SHADOW /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2003.vso" "%SHADER_FILE%"
%FXC% /T vs_3_0 /E main /DVS /DSPECULAR /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2004.vso" "%SHADER_FILE%"
%FXC% /T vs_3_0 /E main /DVS /DSPECULAR /DPROJ_SHADOW /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2005.vso" "%SHADER_FILE%"
%FXC% /T vs_3_0 /E main /DVS /DSPECULAR /DLIGHTS=2 /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2006.vso" "%SHADER_FILE%"
%FXC% /T vs_3_0 /E main /DVS /DSPECULAR /DLIGHTS=2 /DPROJ_SHADOW /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2007.vso" "%SHADER_FILE%"
%FXC% /T vs_3_0 /E main /DVS /DAD /DLIGHTS=2 /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2008.vso" "%SHADER_FILE%"
%FXC% /T vs_3_0 /E main /DVS /DAD /DPROJ_SHADOW /DLIGHTS=2 /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2009.vso" "%SHADER_FILE%"
%FXC% /T vs_3_0 /E main /DVS /DAD /DLIGHTS=3 /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2010.vso" "%SHADER_FILE%"
%FXC% /T vs_3_0 /E main /DVS /DAD /DPROJ_SHADOW /DLIGHTS=3 /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2011.vso" "%SHADER_FILE%"
%FXC% /T vs_3_0 /E main /DVS /DDIFFUSE /DLIGHTS=2 /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2012.vso" "%SHADER_FILE%"
%FXC% /T vs_3_0 /E main /DVS /DDIFFUSE /DLIGHTS=3 /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2013.vso" "%SHADER_FILE%"
%FXC% /T vs_3_0 /E main /DVS /DNO_FOG /DNO_LIGHT /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2014.vso" "%SHADER_FILE%"
%FXC% /T vs_3_0 /E main /DVS /DONLY_SPECULAR /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2015.vso" "%SHADER_FILE%"
%FXC% /T vs_3_0 /E main /DVS /DONLY_SPECULAR /DPROJ_SHADOW /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2016.vso" "%SHADER_FILE%"
%FXC% /T vs_3_0 /E main /DVS /DONLY_SPECULAR /DPOINT /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2017.vso" "%SHADER_FILE%"
%FXC% /T vs_3_0 /E main /DVS /DONLY_SPECULAR /DPOINT /DNUM_PT_LIGHTS=2 /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2018.vso" "%SHADER_FILE%"
%FXC% /T vs_3_0 /E main /DVS /DONLY_SPECULAR /DPOINT /DNUM_PT_LIGHTS=3 /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2019.vso" "%SHADER_FILE%"

%FXC% /T ps_3_0 /E main /DPS /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2000.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DOPT /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2001.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DSI /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2002.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DPROJ_SHADOW /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2003.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DSI /DPROJ_SHADOW /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2004.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DLIGHTS=2 /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2005.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DLIGHTS=2 /DSI /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2006.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DLIGHTS=2 /DPROJ_SHADOW /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2007.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DLIGHTS=2 /DSI /DPROJ_SHADOW /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2008.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DSPECULAR /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2009.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DSPECULAR /DSI /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2010.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DSPECULAR /DPROJ_SHADOW /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2011.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DSPECULAR /DSI /DPROJ_SHADOW /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2012.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DAD /DLIGHTS=2 /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2013.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DAD /DLIGHTS=2 /DSI /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2014.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DAD /DLIGHTS=2 /DPROJ_SHADOW /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2015.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DAD /DLIGHTS=2 /DSI /DPROJ_SHADOW /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2016.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DAD /DLIGHTS=3 /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2017.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DAD /DLIGHTS=3 /DSI /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2018.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DAD /DLIGHTS=3 /DPROJ_SHADOW /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2019.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DAD /DLIGHTS=3 /DSI /DPROJ_SHADOW /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2020.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DDIFFUSE /DLIGHTS=2 /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2021.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DDIFFUSE /DLIGHTS=3 /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2022.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DNO_LIGHT /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2023.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DONLY_SPECULAR /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2024.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DONLY_SPECULAR /DPROJ_SHADOW /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2025.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DONLY_SPECULAR /DPOINT /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2026.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DONLY_SPECULAR /DPOINT /DNUM_PT_LIGHTS=2 /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2027.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DONLY_SPECULAR /DPOINT /DNUM_PT_LIGHTS=3 /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2028.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DSPECULAR /DLIGHTS=2 /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2029.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DSPECULAR /DLIGHTS=2 /DSI /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2030.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DSPECULAR /DLIGHTS=2 /DPROJ_SHADOW /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2031.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DSPECULAR /DLIGHTS=2 /DSI /DPROJ_SHADOW /Fo "package\Parallax Shaders - Objects\Shaders\Loose\PAR2032.pso" "%SHADER_FILE%"

set SHADER_FILE=shaders\TerrainTemplate.hlsl
%FXC% /T vs_3_0 /E main /DVS /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2100.vso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DTEX_COUNT=1 /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2092.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DTEX_COUNT=1 /DNUM_PT_LIGHTS=6 /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2094.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DTEX_COUNT=1 /DNUM_PT_LIGHTS=12 /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2096.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DTEX_COUNT=1 /DNUM_PT_LIGHTS=24 /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2098.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DTEX_COUNT=2 /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2100.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DTEX_COUNT=2 /DNUM_PT_LIGHTS=6 /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2102.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DTEX_COUNT=2 /DNUM_PT_LIGHTS=12 /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2104.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DTEX_COUNT=2 /DNUM_PT_LIGHTS=24 /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2106.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DTEX_COUNT=3 /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2108.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DTEX_COUNT=3 /DNUM_PT_LIGHTS=6 /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2110.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DTEX_COUNT=3 /DNUM_PT_LIGHTS=12 /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2112.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DTEX_COUNT=3 /DNUM_PT_LIGHTS=24 /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2114.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DTEX_COUNT=4 /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2116.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DTEX_COUNT=4 /DNUM_PT_LIGHTS=6 /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2118.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DTEX_COUNT=4 /DNUM_PT_LIGHTS=12 /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2120.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DTEX_COUNT=4 /DNUM_PT_LIGHTS=24 /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2122.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DTEX_COUNT=5 /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2124.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DTEX_COUNT=5 /DNUM_PT_LIGHTS=6 /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2126.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DTEX_COUNT=5 /DNUM_PT_LIGHTS=12 /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2128.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DTEX_COUNT=5 /DNUM_PT_LIGHTS=24 /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2130.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DTEX_COUNT=6 /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2132.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DTEX_COUNT=6 /DNUM_PT_LIGHTS=6 /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2134.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DTEX_COUNT=6 /DNUM_PT_LIGHTS=12 /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2136.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DTEX_COUNT=6 /DNUM_PT_LIGHTS=24 /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2138.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DTEX_COUNT=7 /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2140.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DTEX_COUNT=7 /DNUM_PT_LIGHTS=6 /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2142.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DTEX_COUNT=7 /DNUM_PT_LIGHTS=12 /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2144.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DTEX_COUNT=7 /DNUM_PT_LIGHTS=24 /Fo "package\Parallax Shaders - Terrain\Shaders\Loose\SLS2146.pso" "%SHADER_FILE%"

%FXC% /T vs_3_0 /E main /DVS /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2100.vso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DMAX_STEPS=8 /DMAX_DISTANCE=1024 /DTEX_COUNT=1 /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2092.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DMAX_STEPS=8 /DMAX_DISTANCE=1024 /DTEX_COUNT=1 /DNUM_PT_LIGHTS=6 /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2094.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DMAX_STEPS=8 /DMAX_DISTANCE=1024 /DTEX_COUNT=1 /DNUM_PT_LIGHTS=12 /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2096.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DMAX_STEPS=8 /DMAX_DISTANCE=1024 /DTEX_COUNT=1 /DNUM_PT_LIGHTS=24 /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2098.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DMAX_STEPS=8 /DMAX_DISTANCE=1024 /DTEX_COUNT=2 /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2100.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DMAX_STEPS=8 /DMAX_DISTANCE=1024 /DTEX_COUNT=2 /DNUM_PT_LIGHTS=6 /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2102.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DMAX_STEPS=8 /DMAX_DISTANCE=1024 /DTEX_COUNT=2 /DNUM_PT_LIGHTS=12 /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2104.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DMAX_STEPS=8 /DMAX_DISTANCE=1024 /DTEX_COUNT=2 /DNUM_PT_LIGHTS=24 /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2106.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DMAX_STEPS=8 /DMAX_DISTANCE=1024 /DTEX_COUNT=3 /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2108.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DMAX_STEPS=8 /DMAX_DISTANCE=1024 /DTEX_COUNT=3 /DNUM_PT_LIGHTS=6 /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2110.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DMAX_STEPS=8 /DMAX_DISTANCE=1024 /DTEX_COUNT=3 /DNUM_PT_LIGHTS=12 /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2112.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DMAX_STEPS=8 /DMAX_DISTANCE=1024 /DTEX_COUNT=3 /DNUM_PT_LIGHTS=24 /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2114.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DMAX_STEPS=8 /DMAX_DISTANCE=1024 /DTEX_COUNT=4 /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2116.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DMAX_STEPS=8 /DMAX_DISTANCE=1024 /DTEX_COUNT=4 /DNUM_PT_LIGHTS=6 /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2118.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DMAX_STEPS=8 /DMAX_DISTANCE=1024 /DTEX_COUNT=4 /DNUM_PT_LIGHTS=12 /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2120.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DMAX_STEPS=8 /DMAX_DISTANCE=1024 /DTEX_COUNT=4 /DNUM_PT_LIGHTS=24 /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2122.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DMAX_STEPS=8 /DMAX_DISTANCE=1024 /DTEX_COUNT=5 /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2124.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DMAX_STEPS=8 /DMAX_DISTANCE=1024 /DTEX_COUNT=5 /DNUM_PT_LIGHTS=6 /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2126.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DMAX_STEPS=8 /DMAX_DISTANCE=1024 /DTEX_COUNT=5 /DNUM_PT_LIGHTS=12 /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2128.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DMAX_STEPS=8 /DMAX_DISTANCE=1024 /DTEX_COUNT=5 /DNUM_PT_LIGHTS=24 /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2130.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DMAX_STEPS=8 /DMAX_DISTANCE=1024 /DTEX_COUNT=6 /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2132.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DMAX_STEPS=8 /DMAX_DISTANCE=1024 /DTEX_COUNT=6 /DNUM_PT_LIGHTS=6 /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2134.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DMAX_STEPS=8 /DMAX_DISTANCE=1024 /DTEX_COUNT=6 /DNUM_PT_LIGHTS=12 /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2136.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DMAX_STEPS=8 /DMAX_DISTANCE=1024 /DTEX_COUNT=6 /DNUM_PT_LIGHTS=24 /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2138.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DMAX_STEPS=8 /DMAX_DISTANCE=1024 /DTEX_COUNT=7 /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2140.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DMAX_STEPS=8 /DMAX_DISTANCE=1024 /DTEX_COUNT=7 /DNUM_PT_LIGHTS=6 /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2142.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DMAX_STEPS=8 /DMAX_DISTANCE=1024 /DTEX_COUNT=7 /DNUM_PT_LIGHTS=12 /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2144.pso" "%SHADER_FILE%"
%FXC% /T ps_3_0 /E main /DPS /DMAX_STEPS=8 /DMAX_DISTANCE=1024 /DTEX_COUNT=7 /DNUM_PT_LIGHTS=24 /Fo "package\Parallax Shaders - Terrain (Optimized)\Shaders\Loose\SLS2146.pso" "%SHADER_FILE%"

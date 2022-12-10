function onCreatePost()
    -- Shader Credits What Suppoed To Look Like, tbh this is better https://www.shadertoy.com/view/lsfGD2#
    luaDebugMode = true
    initLuaShader("glitch")
    
    makeLuaSprite("temporaryShader")
    makeGraphic("temporaryShader", screenWidth, screenHeight)
    
    setSpriteShader("temporaryShader", "glitch")
    setShaderFloat("temporaryShader", "uTime", 2)
    setShaderFloat("temporaryShader", "iMouseX", 500)
    setShaderInt("temporaryShader", "NUM_SAMPLES", 8)
    setShaderFloat("temporaryShader", "glitchMultiply", 0)
    
    addHaxeLibrary("ShaderFilter", "openfl.filters")
    runHaxeCode([[
        trace(ShaderFilter);
        game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
        game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
    ]])
	
	setProperty("dad.alpha", 0.7);
end

function onUpdatePost()
    setShaderFloat("temporaryShader", "uTime", os.clock())

	if (curBeat == 0) then
		setShaderFloat("temporaryShader", "glitchMultiply", 0)
		setProperty("dad.x", -700);
		setProperty("dad.flipX", false);
	end
	if (curBeat == 56) or (curBeat == 120) or (curBeat == 312) or (curBeat == 440) then
		setShaderFloat("temporaryShader", "glitchMultiply", 0.8)
	end
	if (curBeat == 61) or (curBeat == 63) or (curBeat == 124) or (curBeat == 126) or (curBeat == 317) or (curBeat == 319) or (curBeat == 444) or (curBeat == 446) then
		setShaderFloat("temporaryShader", "glitchMultiply", 0.8)
		setProperty("dad.x", -700);
		setProperty("dad.flipX", false);
	end
	if (curBeat == 60) or (curBeat == 62) or (curBeat == 125) or (curBeat == 127) or (curBeat == 316) or (curBeat == 318) or (curBeat == 445) or (curBeat == 447) then
		setShaderFloat("temporaryShader", "glitchMultiply", 0.8)
		setProperty("dad.x", 300);
		setProperty("dad.flipX", true);
	end
	if (curBeat == 64) then
		setShaderFloat("temporaryShader", "glitchMultiply", 0.2)
		setProperty("dad.x", 300);
		setProperty("dad.flipX", true);
	end
	if (curBeat == 128) or (curBeat == 448) then
		setShaderFloat("temporaryShader", "glitchMultiply", 0.2)
		setProperty("dad.x", -700);
		setProperty("dad.flipX", false);
	end
	if (curBeat == 320) then
		setShaderFloat("temporaryShader", "glitchMultiply", 0.4)
		setProperty("dad.x", 300);
		setProperty("dad.flipX", true);
	end
end
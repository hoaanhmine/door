-- SHADER SHIT
Chromashit = 0;

function onCreatePost() 
	--NOTESKIN
	value1 = 'Seek_notes'
	value2 = ''
	name = 'noteskinchangeOPPT'

	if name == 'noteskinchangeOPPT' then
	if value1 == '' then
	-- do nothing lol
	else
		for i = 0, getProperty('opponentStrums.length')-1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', value1);
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == false then
			setPropertyFromGroup('unspawnNotes', i, 'texture', value1);
			end
		end
	end 
	
	if value2 == '' then
	-- do nothing lol
	else
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == false then
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', value2);
			end
		end
	end
	
	--SHADER
	setProperty('health', 2);

    luaDebugMode = true
    initLuaShader("vcr")
    
    makeLuaSprite("temporaryShader2")
    makeGraphic("temporaryShader2", screenWidth, screenHeight)
    
    setSpriteShader("temporaryShader2", "vcr")
    
	if shadersEnabled then
		addHaxeLibrary("ShaderFilter2", "openfl.filters")
		runHaxeCode([[
			trace(ShaderFilter);
			game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader2").shader)]);
		]])
	end
	
end
end

-- HEALTH SHIT

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.05 then
        setProperty('health', health- 0.004);
    end
	Chromashit = Chromashit + 0.005
end


function boundTo(value, min, max)
    return math.max(min, math.min(max, value))
end
function math.lerp(from,to,i)return from+(to-from)*i end

function setChrome(chromeOffset)
    setShaderFloat("temporaryShader2", "rOffset", chromeOffset * 2);
    setShaderFloat("temporaryShader2", "gOffset", 0);
    setShaderFloat("temporaryShader2", "bOffset", chromeOffset * -2);
end

function onUpdate(elapsed)
    Chromashit = math.lerp(Chromashit, (2 - getProperty('health')) / 300, boundTo(elapsed * 10, 0, 1));
    setChrome(Chromashit)
end
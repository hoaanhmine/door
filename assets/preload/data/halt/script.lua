function onCreate()
	haltState = false --false is left, true is right
	dying = false
	precacheImage('halt1L')
	precacheImage('halt1R')
	precacheImage('halt2L')
	precacheImage('halt2R')
	precacheImage('turnaroundbitch')
	precacheImage('blue_vignette')
	
	setProperty('iconP2.visible', false);
	
	if (downscroll) then
		makeLuaSprite('halt1R', 'halt1R', 200, -60);
		setObjectCamera('halt1R', 'camHUD');
		addLuaSprite('halt1R', true);
		
		makeLuaSprite('halt1L', 'halt1L', 800, -60);
		setObjectCamera('halt1L', 'camHUD');
		addLuaSprite('halt1L', true);
		
		makeLuaSprite('halt2R', 'halt2R', 200, -60);
		setObjectCamera('halt2R', 'camHUD');
		addLuaSprite('halt2R', true);
		
		makeLuaSprite('halt2L', 'halt2L', 800, -60);
		setObjectCamera('halt2L', 'camHUD');
		addLuaSprite('halt2L', true);
	else
		makeLuaSprite('halt1R', 'halt1R', 200, 480);
		setObjectCamera('halt1R', 'camHUD');
		addLuaSprite('halt1R', true);
		
		makeLuaSprite('halt1L', 'halt1L', 800, 480);
		setObjectCamera('halt1L', 'camHUD');
		addLuaSprite('halt1L', true);
		
		makeLuaSprite('halt2R', 'halt2R', 200, 480);
		setObjectCamera('halt2R', 'camHUD');
		addLuaSprite('halt2R', true);
		
		makeLuaSprite('halt2L', 'halt2L', 800, 480);
		setObjectCamera('halt2L', 'camHUD');
		addLuaSprite('halt2L', true);

	end
	
	
	makeLuaSprite('turn', 'turnaroundbitch', 0, 0);
	scaleObject('turn',1280/1920,720/1080)
	setObjectCamera('turn', 'camHUD');
	setProperty('turn.alpha',0.7)
	addLuaSprite('turn', true);
	
	setProperty('halt1L.visible', false);
	setProperty('halt1R.visible', true);
	setProperty('halt2R.visible', false);
	setProperty('halt2L.visible', false);
	setProperty('turn.visible', false);
	
	makeLuaSprite('blue', 'blue_vignette', 0, 0);
	scaleObject('blue',1280/1920,720/1080)
	setObjectCamera('blue','camHUD')
	setProperty('blue.alpha',0)
	addLuaSprite('blue', true)
end


function onBeatHit()
	if (curBeat == 0) then
		goLeft()
	end
	if (curBeat == 56) or (curBeat == 120) or (curBeat == 312) or (curBeat == 440) then
		WarnPlayer()
	end
	if (curBeat == 61) or (curBeat == 63) or (curBeat == 124) or (curBeat == 126) or (curBeat == 317) or (curBeat == 319) or (curBeat == 444) or (curBeat == 446) then
		goLeft()
		WarnPlayer()
	end
	if (curBeat == 60) or (curBeat == 62) or (curBeat == 125) or (curBeat == 127) or (curBeat == 316) or (curBeat == 318) or (curBeat == 445) or (curBeat == 447) then
		goRight()
		WarnPlayer()
	end
	if (curBeat == 64) or (curBeat == 320) then
		goRight()
	end
	if (curBeat == 128) or (curBeat == 448) then
		goLeft()
	end
end

function goLeft()
	haltState = false
	setProperty('halt1R.visible', true);
	setProperty('halt2L.visible', false);
	setProperty('halt1L.visible', false);
	setProperty('turn.visible', false);
	doTweenZoom('zoomoutswitch1', 'camGame', 1.2, 0.1, 'cubicInOut')
end

function goRight()
	haltState = true
	setProperty('halt1L.visible', true);
	setProperty('halt2R.visible', false);
	setProperty('halt1R.visible', false);
	setProperty('turn.visible', false);
	doTweenZoom('zoomoutswitch2', 'camGame', 1.2, 0.1, 'cubicInOut')
end

function WarnPlayer()
	setProperty('turn.visible', true);
	doTweenZoom('zoominswitch1', 'camGame', 1.5, 0.2, 'cubicInOut')
end


function onUpdate(elapsed)

	if (getProperty('blue.alpha') >= 0.9) then
		setProperty('health', -1)
	end

	health = getProperty('health');
	if keyPressed('space') then
		setProperty('health', health - 0.004);
	end
	if (health <= 0.02) and (keyPressed('space')) then
		setProperty('health', health + 0.004);
	end
	
	if (health < 0.5) and (haltState) and (not dying) then
		setProperty('halt1L.visible', false);
		setProperty('halt2L.visible', true);
	end
	if (health > 1.6) and (not haltState) and (not dying) then
		setProperty('halt1R.visible', false);
		setProperty('halt2R.visible', true);
	end
	
	--debugPrint(health, haltState, dying)
	if (health < 0.4) and (haltState == true) and (not dying) then
		--debugPrint("die right")
		doTweenAlpha('death_fade_in', 'blue', 1, 2.5, 'cubicInOut')
		doTweenColor('death_fade_in2', 'boyfriend', 0xFF0000FF, 2.5, 'cubicInOut')
		cancelTween('death_fade_out')
		cancelTween('death_fade_out2')
		dying = true
	end
	if (health > 1.7) and (haltState == false) and (not dying) then
		--debugPrint("die left")
		doTweenAlpha('death_fade_in', 'blue', 1, 2.5, 'cubicInOut')
		doTweenColor('death_fade_in2', 'boyfriend', 0xFF0000FF, 2.5, 'cubicInOut')
		cancelTween('death_fade_out')
		cancelTween('death_fade_out2')
		dying = true
	end
	if (dying) and ((health < 1.7) and (health > 0.4)) then
		--debugPrint("dien't")
		dying = false
		cancelTween('death_fade_in')
		cancelTween('death_fade_in2')
		doTweenAlpha('death_fade_out', 'blue', 0, 2.5, 'cubicInOut')
		doTweenColor('death_fade_out2', 'boyfriend', 0xFF000000, 2.5, 'cubicInOut')
	end
	
	if (health > 0.5) and (haltState) and (not dying) then
		setProperty('halt1L.visible', true);
		setProperty('halt2L.visible', false);
	end
	if (health < 1.6) and (not haltState) and (not dying) then
		setProperty('halt1R.visible', true);
		setProperty('halt2R.visible', false);
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	health = getProperty('health')
	if isSustainNote then
		setProperty('health', health+0.005);
	end
end
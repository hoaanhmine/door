
intensity2 = 2

function onCreate()

	widthRatio = screenWidth/1280
	heightRatio = screenHeight/720
	
	makeAnimatedLuaSprite('outside', 'mansion/rain', -100, -140);
	addAnimationByPrefix('outside', 'rain', 'rain idle', 24, true);
	scaleObject('outside', 2, 2);
	setScrollFactor('outside', 1, 1);

	makeLuaSprite('wall', 'mansion/Wall', -750, -140);
	setScrollFactor('wall', 1, 1);

	makeLuaSprite('floor', 'mansion/FloorBoards', -750, 700);
	setScrollFactor('floor', 1, 1);

	addLuaSprite('outside', false);
	addLuaSprite('wall', false);
	addLuaSprite('floor', false);
	
	setProperty('gfGroup.visible', false);
	
	makeAnimatedLuaSprite('outside2', 'mansion/rain', 1170, -140);
	addAnimationByPrefix('outside2', 'rain', 'rain idle', 24, true);
	scaleObject('outside2', 2, 2);
	setScrollFactor('outside2', 1, 1);

	makeLuaSprite('wall2', 'mansion/Wall', 1170, -140);
	setScrollFactor('wall2', 1, 1);

	makeLuaSprite('floor2', 'mansion/FloorBoards', 1170, 700);
	setScrollFactor('floor2', 1, 1);
	
	addLuaSprite('outside2', false);
	addLuaSprite('wall2', false);
	addLuaSprite('floor2', false);
		
	-- PRECACHING SHIT
	addCharacterToList(bf_running, 'boyfriend');
	addCharacterToList(seek_run_body, 'dad');
	
	precacheImage('darken');
	precacheImage('seek_fog');
	precacheImage('seek_fog2');
	precacheImage('characters/seek_run/seek_legs')
	precacheImage('characters/bf_run/legs')
	
	makeAnimatedLuaSprite('bf_legs', 'characters/bf_run/legs', 380, 590);
	addAnimationByPrefix('bf_legs', 'LEGGOS', 'LEGGOS', 24, true);
	scaleObject('bf_legs', 1, 1);
	setScrollFactor('bf_legs', 1, 1);
	setProperty('bf_legs.antialiasing', true)
	setProperty('bf_legs.visible', false)
	setObjectOrder('bf_legs', 5)
	
	makeAnimatedLuaSprite('mic', 'characters/bf_run/mic_arm', 400, 560);
	addAnimationByPrefix('mic', 'Back Arm', 'Back Arm', 24, true);
	scaleObject('mic', 1, 1);
	setScrollFactor('mic', 1, 1);
	setProperty('mic.antialiasing', true)
	setProperty('mic.visible', false)
	setObjectOrder('mic', 4)
	
	makeAnimatedLuaSprite('seek_legs', 'characters/seek_run/seek_legs', -783, 410);
	addAnimationByPrefix('seek_legs', 'legs', 'legs anim', 24, true);
	scaleObject('seek_legs', 1, 1);
	setScrollFactor('seek_legs', 1, 1);
	setProperty('seek_legs.antialiasing', true)
	setObjectOrder('seek_legs', 5)
	setObjectOrder('dadGroup', 4)
	setProperty('seek_legs.visible', false)
	
end





function onStepHit()
	if (curStep >= 385) then
		if (curStep % 4 == 2) then
			doTweenY('hard gaming boyfriend bounce man', 'boyfriend', bf_default - (6*intensity2), stepCrochet*0.002, 'circOut')
		end
		if (curStep % 4 == 0) then
			doTweenY('hard gaming boyfriend bounce man 2', 'boyfriend', bf_default, stepCrochet*0.002, 'sineIn')
		end
	end

	if (curStep == 383) then
		cameraFlash('camGame', '0x000000', 12, true)
	end

	if (curStep == 383) then
		
		makeLuaSprite('darken', 'vignette', 0, 0);
		setScrollFactor('darken', 1, 1);
		setObjectCamera('darken', 'other');
		setBlendMode('darken', 'multiply');
		scaleObject('darken', widthRatio, heightRatio);
		setProperty('darken.alpha', 0.6);
		addLuaSprite('darken', true);
		
		setProperty('seek_legs.visible', true)

		setProperty('bf_legs.visible', true)
		setProperty('mic.visible', true)
		
		playAnim('front_arm', 'front arm', true, false, 0)
		playAnim('arm', 'Back Arm', true, false, 0)
		makeLuaSprite('fog2', 'seek_fog2', 1170, -140);
		setScrollFactor('fog2', 1, 1);
		scaleObject('fog2', 3.5 * widthRatio, 3 * heightRatio);
		setObjectCamera('fog2', 'hud');
		setProperty('fog2.alpha', 0.4); 
		
		addLuaSprite('fog2', false)
		
		doTweenX('moveleft1', 'outside', -2670, 0.65, 'linear');
		doTweenX('moveleft2', 'wall', -2670, 0.65, 'linear');
		doTweenX('moveleft3', 'floor', -2670, 0.65, 'linear');
		
		doTweenX('moveleft18', 'outside2', -750, 0.65, 'linear');
		doTweenX('moveleft19', 'wall2', -750, 0.65, 'linear');
		doTweenX('moveleft20', 'floor2', -750, 0.65, 'linear');
		doTweenX('moveleft21', 'fog2', -750, 0.65, 'linear');
		
		
	end
	if (curStep == 384) then
		setProperty('boyfriend.x', getProperty('boyfriend.x') - 73)
		setProperty('boyfriend.y', getProperty('boyfriend.y') + 85)
		bf_default = getProperty('boyfriend.y')
		defaultseekx = getProperty('dad.x')
		defaultseeklegsx = getProperty('seek_legs.x')
		randommovement = math.random(3,6)
		doTweenX('seekmovement1', 'seek_legs', defaultseeklegsx + (200 * math.abs(getProperty('health') - 2)), randommovement, 'linear')
		doTweenX('seekmovement3', 'dad', defaultseekx + (200 * math.abs(getProperty('health') - 2)), randommovement, 'linear')
		bf_default = getProperty('boyfriend.y')
	end
end


function onTweenCompleted(tag)
	if (tag == 'moveleft1') then
		makeAnimatedLuaSprite('outside', 'mansion/rain', 1170, -140);
		addAnimationByPrefix('outside', 'rain', 'rain idle', 24, true);
		scaleObject('outside', 2, 2);
		setScrollFactor('outside', 1, 1);

		makeLuaSprite('wall', 'mansion/Wall', 1170, -140);
		setScrollFactor('wall', 1, 1);

		makeLuaSprite('floor', 'mansion/FloorBoards', 1170, 700);
		setScrollFactor('floor', 1, 1);

		makeLuaSprite('fog1', 'seek_fog', 1170, -140);
		setScrollFactor('fog1', 0.3, 0.3);
		scaleObject('fog1', 3.5 * widthRatio, 3 * heightRatio);
		setObjectCamera('fog1', 'hud');
		setProperty('fog1.alpha', 0.4); 
		
		addLuaSprite('outside', false);
		addLuaSprite('wall', false);
		addLuaSprite('floor', false);
		addLuaSprite('fog1', true)
		
		doTweenX('moveleft5', 'outside2', -2670, 0.65)
		doTweenX('moveleft7', 'wall2', -2670, 0.65)
		doTweenX('moveleft8', 'floor2', -2670, 0.65)
		doTweenX('moveleft9', 'fog2', -2670, 0.65, 'linear');
		
		doTweenX('moveleft10', 'outside', -750, 0.65)
		doTweenX('moveleft11', 'wall', -750, 0.65)
		doTweenX('moveleft12', 'floor', -750, 0.65)
		doTweenX('moveleft13', 'fog1', -750, 0.65, 'linear');
	elseif (tag == 'moveleft5') then
		makeAnimatedLuaSprite('outside2', 'mansion/rain', 1170, -140);
		addAnimationByPrefix('outside2', 'rain', 'rain idle', 24, true);
		scaleObject('outside2', 2, 2);
		setScrollFactor('outside2', 1, 1);

		makeLuaSprite('wall2', 'mansion/Wall', 1170, -140);
		setScrollFactor('wall2', 1, 1);

		makeLuaSprite('floor2', 'mansion/FloorBoards', 1170, 700);
		setScrollFactor('floor2', 1, 1);

		makeLuaSprite('fog2', 'seek_fog2', 1170, -140);
		setScrollFactor('fog2', 0.3, 0.3);
		scaleObject('fog2', 3.5 * widthRatio, 3 * heightRatio);
		setObjectCamera('fog2', 'hud');
		setProperty('fog2.alpha', 0.4); 
		
		addLuaSprite('outside2', false);
		addLuaSprite('wall2', false);
		addLuaSprite('floor2', false);
		addLuaSprite('fog2', true)

		doTweenX('moveleft1', 'outside', -2670, 0.65)
		doTweenX('moveleft2', 'wall', -2670, 0.65)
		doTweenX('moveleft3', 'floor', -2670, 0.65)
		doTweenX('moveleft4', 'fog1', -2670, 0.65, 'linear');
		
		doTweenX('moveleft14', 'outside2', -750, 0.65)
		doTweenX('moveleft15', 'wall2', -750, 0.65)
		doTweenX('moveleft16', 'floor2', -750, 0.65)
		doTweenX('moveleft17', 'fog2', -750, 0.65, 'linear');
	
	elseif (tag == 'seekmovement1') then
		if (curStep <= 1160) then
			randommovement = math.random(3,6)
			doTweenX('seekmovement2', 'seek_legs', defaultseeklegsx, randommovement, 'linear')
			doTweenX('seekmovement4', 'dad', defaultseekx, randommovement, 'linear')
		else 
			doTweenX('seekmovement6', 'seek_legs', defaultseeklegsx - 1000, 7, 'linear')
			doTweenX('seekmovement7', 'dad', defaultseekx - 1000, 7, 'linear')
		end
	elseif (tag == 'seekmovement2') then
		if (curStep <= 1160) then
			randommovement = math.random(3,6)
			doTweenX('seekmovement1', 'seek_legs', defaultseeklegsx + (200 * math.abs(getProperty('health') - 2)), randommovement, 'linear')
			doTweenX('seekmovement3', 'dad', defaultseekx + (200 * math.abs(getProperty('health') - 2)), randommovement, 'linear')
		else
			doTweenX('seekmovement6', 'seek_legs', defaultseeklegsx - 1000, 7, 'linear')
			doTweenX('seekmovement7', 'dad', defaultseekx - 1000, 7, 'linear')
		end
	end
end

function onUpdate(elapsed)
	if (curStep >= 385) then
		if (getProperty('boyfriend.animation.curAnim.name') == 'idle') then
			playAnim('boyfriend', 'idle', true, false, getProperty('bf_legs.animation.curAnim.curFrame'))
		end
	end
end


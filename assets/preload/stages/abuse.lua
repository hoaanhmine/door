function onCreate()
	makeLuaSprite('abuse', 'abuse_bg', 0, 0);
	setScrollFactor('abuse', 1, 1);

	scaleObject('abuse', 1920/903, 1080/475)
	screenCenter('abuse', 'xy')
	
	
	
	
	addLuaSprite('abuse', false);
	setProperty('gfGroup.visible', false);
end
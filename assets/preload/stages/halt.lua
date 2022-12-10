function onCreate()
	makeLuaSprite('outside', 'halt/outside', -100, -140);
	scaleObject('outside', 2, 2);
	setScrollFactor('outside', 1, 1);

	makeLuaSprite('wall', 'halt/Wall', -750, -140);
	setScrollFactor('wall', 1, 1);

	makeLuaSprite('floor', 'halt/FloorBoards', -750, 700);
	setScrollFactor('floor', 1, 1);

	addLuaSprite('outside', false);
	addLuaSprite('wall', false);
	addLuaSprite('floor', false);
	
	setProperty('gfGroup.visible', false);
end
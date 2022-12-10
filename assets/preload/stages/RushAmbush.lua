function onCreatePost()

	widthRatio = screenWidth/1920
	heightRatio = screenHeight/1080
	
	makeLuaSprite('stage', 'randomstages/StageNormalWithClosets', -750, -140);
	setScrollFactor('stage', 1, 1);

	addLuaSprite('stage', false);
	
	setProperty('gfGroup.visible', false);
	setProperty('boyfriendGroup.visible', false);
	
	
	makeAnimatedLuaSprite('fog', 'rush_fog', -700, -50);
	addAnimationByPrefix('fog', 'fog', 'Occurrence Symbole 1 1', 24, true)
	setScrollFactor('fog', 1, 1);
	setProperty('fog.alpha', 1);
	scaleObject('fog', 1.4, 1.2);
	addLuaSprite('fog', false);
	
end
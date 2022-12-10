function onCreate()
	makeLuaSprite('stageback', 'Timothy_bg', -900, -100);
	setLuaSpriteScrollFactor('stageback', 1.0, 1.0);

	addLuaSprite('stageback', false);
	
	makeLuaSprite('stagefront', 'Timothy_circle', -500, 0);
	scaleObject('stagefront', 0.7, 0.7)
	setLuaSpriteScrollFactor('stagefront', 1, 1);
	
	addLuaSprite('stagefront', true);
	
	setProperty('gfGroup.visible', false);
end

function onCreatePost()
	for i = 0,3 do
		setPropertyFromGroup('strumLineNotes',i,'x',-330)
    end
end
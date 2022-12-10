function onCreate()
	makeLuaSprite('non-liit-hb', 'healthBar', 0, 0)
	setObjectCamera('non-liit-hb', 'hud')
	setScrollFactor('non-liit-hb', 0.9, 0.9)
	
	makeLuaSprite('dark_zones', 'Dark_areas_health', 0, 0)
	setObjectCamera('dark_zones', 'hud')
	setScrollFactor('dark_zones', 0.9, 0.9)
	
	makeLuaSprite('liit-hb', 'healthbar_tick', 0, 0)
	setObjectCamera('liit-hb', 'hud')
	setScrollFactor('liit-hb', 0.9, 0.9)
	
	addLuaSprite('dark_zones', true)
	addLuaSprite('liit-hb', true)
	addLuaSprite('non-liit-hb', true)
end

function onCreatePost()
	--Fucker's Healthbar
    setProperty('non-liit-hb.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'))
    setProperty('non-liit-hb.x', getProperty('healthBar.x') - 15)
	setProperty('non-liit-hb.antialiasing', true)
    setProperty('non-liit-hb.angle', getProperty('healthBar.angle'))
    setProperty('non-liit-hb.y', getProperty('healthBar.y') - 65)
    setProperty('non-liit-hb.scale.x', getProperty('healthBar.scale.x'))
    setProperty('non-liit-hb.scale.y', getProperty('healthBar.scale.y'))
	
	setProperty('liit-hb.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'))
    setProperty('liit-hb.x', getProperty('healthBar.x') - 15)
	setProperty('liit-hb.antialiasing', true)
    setProperty('liit-hb.angle', getProperty('healthBar.angle'))
    setProperty('liit-hb.y', getProperty('healthBar.y') - 65)
    setProperty('liit-hb.scale.x', getProperty('healthBar.scale.x'))
    setProperty('liit-hb.scale.y', getProperty('healthBar.scale.y'))
	
	setProperty('dark_zones.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'))
    setProperty('dark_zones.x', getProperty('healthBar.x') - 15)
	setProperty('dark_zones.antialiasing', true)
    setProperty('dark_zones.angle', getProperty('healthBar.angle'))
    setProperty('dark_zones.y', getProperty('healthBar.y') - 65)
    setProperty('dark_zones.scale.x', getProperty('healthBar.scale.x'))
    setProperty('dark_zones.scale.y', getProperty('healthBar.scale.y'))
	setBlendMode('dark_zones', 'multiply')
	
	setObjectOrder('dark_zones', 9)
	setObjectOrder('non-liit-hb', 5)
	setObjectOrder('liit-hb', 5)
	setObjectOrder('healthBar', 4)
	setObjectOrder('healthBarBG', 3)
	setProperty('healthBarBG.alpha', 0)
end

----Never Gonna Give You Up

function onUpdate()
	if getProperty('health') > 1.6 then
		setObjectOrder('liit-hb', 6)
		setObjectOrder('healthBar', 4)
		setObjectOrder('non-liit-hb', 0)
	else
		setObjectOrder('non-liit-hb', 6)
		setObjectOrder('healthBar', 4)
		setObjectOrder('liit-hb', 0)
	end
    for i = 0, 7 do
        setPropertyFromGroup('playerStrums', i, 'alpha', 0.9)
        setPropertyFromGroup('opponentStrums', i, 'alpha', 0.9)
    end
end
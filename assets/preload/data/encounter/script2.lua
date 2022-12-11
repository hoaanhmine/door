enabled = false
local angleshit = 1;
local anglevar = 1;
local intensity = 0
local intensity2 = 3

function onUpdate()
	for i = 0,3 do
		setPropertyFromGroup('opponentStrums',i,'x',-1000)
	end
end

function onBeatHit()
	if (curStep >= 384) then
		enabled = true
	end
	
	if enabled then 
		if curBeat % 2 == 0 then
			angleshit = anglevar;
		else
			angleshit = -anglevar;
		end
		--setProperty('camHUD.angle',angleshit*intensity2)
		--setProperty('camGame.angle',angleshit*intensity2)
		doTweenAngle('turn', 'camHUD', angleshit*intensity, stepCrochet*0.002, 'circOut')
		doTweenX('tuin', 'camHUD', -angleshit*intensity, crochet*0.001, 'linear')
		doTweenAngle('tt', 'camGame', angleshit*intensity, stepCrochet*0.002, 'circOut')
		doTweenX('ttrn', 'camGame', -angleshit*intensity, crochet*0.001, 'linear')
		end
end

function onStepHit()
if enabled then
		if curStep % 4 == 0 then
			doTweenY('rrr', 'camHUD', -6*intensity2, stepCrochet*0.002, 'circOut')
			doTweenY('rtr', 'camGame.scroll', 12, stepCrochet*0.002, 'sineIn')
		end
		if curStep % 4 == 2 then
			doTweenY('rir', 'camHUD', 0, stepCrochet*0.002, 'sineIn')
			doTweenY('ryr', 'camGame.scroll', 0, stepCrochet*0.002, 'sineIn')
		end
		end
end
                -- Script made by Washo789, please, if you use it or modify it, I would like you to give me credits.
				
local xx = 700 -- Code to change the position of the camera to the left or right for your opponent, Less = Left (They can be negative numbers), More = Right
local yy = 300 -- Code to change the position of the camera up or down for the enemy Less = Down (They can be negative numbers), More = Up
local xx2 = 200; -- Same code as above, but for boyfriend left, right
local yy2 = 400; -- Same code as above, but for boyfriend up, down
local xx3 = 520; -- Same code as above, but for girlfriend left, right
local yy3 = 450; -- Same code as above, but for girlfriend, up, down
local ofs = 50;
local intensity = ofs; -- Code to adjust the intensity with which the camera moves, the more numbers, the more intense, and the fewer numbers, less intense
local followchars = true; -- This code is necessary for the script to work, don't even think about deleting it!
local del = 0;
local del2 = 0;
local speed = 0.4;

function onUpdate() -- The Main Code
		if del > 0 then
			del = del - 1
		end
		if del2 > 0 then
			del2 = del2 - 1
		end
		if followchars == true then
			if mustHitSection == false then -- Code for the camera to follow the poses of your opponent
				if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
					doTweenX('camMoveX', 'camGame.target', xx-intensity, speed, 'cubeOut')
					doTweenY('camMoveY', 'camGame.target', yy, speed, 'cubeOut')
				end
				if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
					doTweenX('camMoveX', 'camGame.target', xx+intensity, speed, 'cubeOut')
					doTweenY('camMoveY', 'camGame.target', yy, speed, 'cubeOut')
				end
				if getProperty('dad.animation.curAnim.name') == 'singUP' then
					doTweenX('camMoveX', 'camGame.target', xx, speed, 'cubeOut')
					doTweenY('camMoveY', 'camGame.target', yy-intensity, speed, 'cubeOut')
				end
				if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
					doTweenX('camMoveX', 'camGame.target', xx, speed, 'cubeOut')
					doTweenY('camMoveY', 'camGame.target', yy+intensity, speed, 'cubeOut')
				end
				if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
					triggerEvent('Camera Follow Pos',xx-ofs,yy)
				end
				if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
					triggerEvent('Camera Follow Pos',xx+ofs,yy)
				end
				if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
					triggerEvent('Camera Follow Pos',xx,yy-ofs)
				end
				if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
					triggerEvent('Camera Follow Pos',xx,yy+ofs)
				end
				if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
					triggerEvent('Camera Follow Pos',xx,yy)
				end
				if getProperty('dad.animation.curAnim.name') == 'idle' then
					triggerEvent('Camera Follow Pos',xx,yy)
				end
			end
			if mustHitSection == true then
					 -- Code for the camera to follow the poses of boyfriend
				if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
					doTweenX('camMoveX', 'camGame.target', xx-intensity, speed, 'cubeOut')
					doTweenY('camMoveY', 'camGame.target', yy, speed, 'cubeOut')
				end
				if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
					doTweenX('camMoveX', 'camGame.target', xx+intensity, speed, 'cubeOut')
					doTweenY('camMoveY', 'camGame.target', yy, speed, 'cubeOut')
				end
				if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
					doTweenX('camMoveX', 'camGame.target', xx, speed, 'cubeOut')
					doTweenY('camMoveY', 'camGame.target', yy-intensity, speed, 'cubeOut')
				end
				if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
					doTweenX('camMoveX', 'camGame.target', xx, speed, 'cubeOut')
					doTweenY('camMoveY', 'camGame.target', yy+intensity, speed, 'cubeOut')
				end
				if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT-alt' then
					doTweenX('camMoveX', 'camGame.target', xx-intensity, speed, 'cubeOut')
					doTweenY('camMoveY', 'camGame.target', yy, speed, 'cubeOut')
				end
				if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
					doTweenX('camMoveX', 'camGame.target', xx+intensity, speed, 'cubeOut')
					doTweenY('camMoveY', 'camGame.target', yy, speed, 'cubeOut')
				end
				if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
					doTweenX('camMoveX', 'camGame.target', xx, speed, 'cubeOut')
					doTweenY('camMoveY', 'camGame.target', yy-intensity, speed, 'cubeOut')
				end
				if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
					doTweenX('camMoveX', 'camGame.target', xx, speed, 'cubeOut')
					doTweenY('camMoveY', 'camGame.target', yy+intensity, speed, 'cubeOut')
				end
			end
		else
			doTweenX('camMoveX', 'camGame.target', xx, speed*2, 'cubeOut')
			doTweenY('camMoveY', 'camGame.target', yy, speed*2, 'cubeOut')
		end
end
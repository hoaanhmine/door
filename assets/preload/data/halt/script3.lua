                -- Script made by Washo789, please, if you use it or modify it, I would like you to give me credits.
				
local xx = 300 -- Code to change the position of the camera to the left or right for your opponent, Less = Left (They can be negative numbers), More = Right
local yy = 500 -- Code to change the position of the camera up or down for the enemy Less = Down (They can be negative numbers), More = Up
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
			doTweenX('camMoveX', 'camGame.target', xx, speed*2, 'cubeOut')
			doTweenY('camMoveY', 'camGame.target', yy, speed*2, 'cubeOut')
		end
end
--This was made by Tiny Games.
local creditstable = {'CREDITS'}
local codetable = {'unfinished', '', '', '', ''}
local artisttable = {'', '', '', '', ''}
local chartertable = {'', '', '', '', ''}
local musictable = {'', '', '', '', ''}
local configtable = {2.5, 27}
local songignorelist = {}
local startedcreditstimer
local path

function makecreditsbox()
	local cameras = 'other'
	local font = ''
	local size = configtable[2]
	local tagtableindex = 1
	local tagsindex = 0
	local tagstable = {'Coder', 'Artist', 'Charter', 'Music'}
	local taggedtable = {codetable, artisttable, chartertable, musictable}

	--making
	makeLuaSprite('box', 'box', -65, -800) -- box (you can edit the box x pos to change where all the text goes too!)
	makeLuaText('Position', 'PLACEHOLDER DONT REMOVE', 500, getProperty('box.x') + 50, getProperty('box.y'))
	
	makeLuaText('creditstext', creditstable[1], 500, getProperty('Position.x'), getProperty('Position.y') + 100)
	setTextSize('creditstext', size + 23)
	setObjectCamera('creditstext', cameras)
	setTextAlignment('creditstext', 'center')

	scaleObject('box', 1.5, 1)
	setTextSize('Position', 50)

	setObjectCamera('box', cameras)
	setObjectCamera('Position', cameras)

	setTextAlignment('Position', 'center')

	setTextAlignment('creditstext', 'center')

	if font ~= '' then
		setTextFont('Position', font)
		setTextFont('creditstext', font)
	end

	addLuaSprite('box', true)
	addLuaText('Position')
	addLuaText('creditstext')

	for i=1, (#tagstable * 6) do
		local selectedtag = tagstable[tagtableindex]
		if tagsindex == 0 then
			makeLuaText(selectedtag..'s', taggedtable[tagtableindex][tagsindex], 500, getProperty('Position.x'), getProperty('Position.y') + 100)
			setTextSize(selectedtag..'s', size + 8)
			setObjectCamera(selectedtag..'s', cameras)
			setTextAlignment(selectedtag..'s', 'center')
			if font ~= '' then
				setTextFont(selectedtag..'s', font)
			end
			addLuaText(selectedtag..'s')
		else
			makeLuaText(selectedtag..tagsindex, taggedtable[tagtableindex][tagsindex], 500, getProperty('Position.x'), getProperty('Position.y') + 50)
			setTextSize(selectedtag..tagsindex, size)
			setObjectCamera(selectedtag..tagsindex, cameras)
			setTextAlignment(selectedtag..tagsindex, 'center')
			if font ~= '' then
				setTextFont(selectedtag..tagsindex, font)
			end
			addLuaText(selectedtag..tagsindex)
		end
		tagsindex = tagsindex + 1
		if tagsindex > 5 then
			tagsindex = 0
			tagtableindex = tagtableindex + 1
		end
	end
end

function string.split(self, sep)
	if sep == "" then return {str:match((str:gsub(".", "(.)")))} end
		if sep == nil then
			sep = "%s"
		end
	local t={}
	for str in string.gmatch(self, "([^"..sep.."]+)") do
			table.insert(t, str)
	end
	return t
end

function table.find(table,v)
	for i,die in next,table do
		if die == v then
			return i
		end
	end
end

function split(inputstr, sep)
	if sep == nil then
			sep = "%s"
	end
	local t={}
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		table.insert(t, str)
	end
	return t
end

function setUpList(file)
	local data = split(getTextFromFile(file), '\n')
	for i = 1, #data do
		if not (i == table.getn(data)) then
			data[i] = data[i]:sub(1, -2)
		end
	end
	return data
end

function onGameOver()
	removeLuaSprite('box')
	removeLuaText('Position')
	removeLuaText('creditstext')
	for i=1, (#tagstable * 6) do
		if tagsindex == 0 then
			removeLuaText(selectedtag..'s')
		else
			removeLuaText(selectedtag..tagsindex)
		end
		tagsindex = tagsindex + 1
		if tagsindex > 5 then
			tagsindex = 0
			tagtableindex = tagtableindex + 1
		end
	end
end

function onCreatePost()
	startedcreditstimer = false
	path = getPropertyFromClass('Paths', 'currentModDirectory')
	local pathend = '/credits.json'
	local song = songName:lower()
	song = song:gsub(" ","-")
	path = path.. "/data/" ..song.. "" ..pathend
	for _, child in pairs(songignorelist) do
		if song == child then
			return
		end
	end
	makecreditsbox() --called it up here cause if it doesn't find the credits file it'll still load
	local creditsinfo = {} --sorts it into a nice little table
	for i=1, #setUpList(path) do
		table.insert(creditsinfo, setUpList(path)[i])
	end
	if #creditsinfo > 0 then
		creditstable = {}
		codetable = {}
		artisttable = {}
		chartertable = {}
		musictable = {}
	end
	for i=1, #creditsinfo do
		--debugPrint(creditsinfo[i])
		if creditsinfo[i] == '' then
			break
		end
		table.insert(creditstable, creditsinfo[i])
	end
	if creditstable[1] == nil then
		table.insert(creditstable, 'CREDITS')
	end
	table.insert(creditstable, '')
	for i=1, #creditsinfo - #creditstable do --code
		i = i + #creditstable
		--debugPrint(creditsinfo[i])
		if creditsinfo[i] == '' or creditsinfo[i]:lower() == 'time' then
			break
		end
		table.insert(codetable, creditsinfo[i])
	end
	for i=1, #creditsinfo do --artist
		i = i + (#codetable + #creditstable + 1)
		--debugPrint(creditsinfo[i])
		--debugPrint(creditsinfo[i])
		if creditsinfo[i] == '' or creditsinfo[i]:lower() == 'time' then
			break
		end
		table.insert(artisttable, creditsinfo[i])
	end
	for i=1, #creditsinfo do --charting
		i = i + (#codetable + #artisttable + #creditstable + 2)
		--debugPrint(creditsinfo[i])
		if creditsinfo[i] == '' or creditsinfo[i]:lower() == 'time' then
			break
		end
		table.insert(chartertable, creditsinfo[i])
	end
	for i=1, #creditsinfo do --music
		i = i + (#codetable + #artisttable + #chartertable + #creditstable + 3)
		--debugPrint(creditsinfo[i])
		--debugPrint(creditsinfo[i])
		if creditsinfo[i] == '' or creditsinfo[i]:lower() == 'time' then
			break
		end
		table.insert(musictable, creditsinfo[i])
	end
	local temptable = {}
	for i=1, #creditsinfo do --temptable
		i = i + (#codetable + #artisttable + #chartertable + #musictable + #creditstable + 4)
		--debugPrint(creditsinfo[i])
		if creditsinfo[i] == '' then
			break
		end
		table.insert(temptable, creditsinfo[i])
	end
	for i=1, 5 - #codetable do
		table.insert(codetable, '')
	end
	for i=1, 5 - #artisttable do
		table.insert(artisttable, '')
	end
	for i=1, 5 - #musictable do
		table.insert(musictable, '')
	end
	for i=1, 5 - #chartertable do
		table.insert(chartertable, '')
	end
	for i=1, #creditsinfo do --configtable
		if creditsinfo[i]:lower() == 'time' then
			configtable[1] = "" ..creditsinfo[i + 1].. ""
		end
		if creditsinfo[i]:lower() == 'size' then
			configtable[2] = "" ..creditsinfo[i + 1].. ""
		end
	end
	makecreditsbox()
end


function onCountdownTick(counter)
	if counter == 4 then
		runTimer('Enter Box, Stage Left', configtable[1], 1)
	end
end

function onSongStart()
	if startedcreditstimer == false then
		runTimer('Enter Box, Stage Left', configtable[1], 0.5)
	end
end

function onTimerCompleted(tag, Loops, LoopsLeft)
	if tag == 'Enter Box, Stage Left' and not startedcreditstimer == true then
		doTweenY('box', 'box', 0, 1.1, 'quintOut')
		startedcreditstimer = true
	end
	if tag == 'Credits Dissapear' then
		doTweenY('box-leave', 'box', -800, 1.1, 'quintIn') --creditstext
		doTweenY('creditstext-leave', 'creditstext', -800, 1.1, 'quintIn')

		local tagtableindex = 1
		local tagsindex = 0
		local tagstable = {'Coder', 'Artist', 'Charter', 'Music'}
		local taggedtable = {codetable, artisttable, chartertable, musictable}

		for i=1, (#tagstable * 6) do
			local selectedtag = tagstable[tagtableindex]
			if tagsindex == 0 then
				doTweenY(selectedtag..'s-leave', selectedtag..'s', -800, 1.1, 'quintIn')
			else
				doTweenY(selectedtag..tagsindex..'-leave', selectedtag..tagsindex, -800, 1.1, 'quintIn')
			end
			tagsindex = tagsindex + 1
			if tagsindex > 5 then
				tagsindex = 0
				tagtableindex = tagtableindex + 1
			end
		end
	end
end

function onTweenCompleted(tag)
	if tag == 'box' then
		local addvariable = 130
		doTweenY('creditstext', 'creditstext', getProperty('box.y') + 15, 0.35, 'quintOut') --creditstext

		local tagtableindex = 1
		local tagsindex = 0
		local tagstable = {'Coder', 'Artist', 'Charter', 'Music'}
		local taggedtable = {codetable, artisttable, chartertable, musictable}

		for i=1, (#tagstable * 6) do
			local selectedtag = tagstable[tagtableindex]
			if tagsindex == 0 then
				doTweenY(selectedtag..'s', selectedtag..'s', (getProperty('box.y') + (addvariable - 45)) + (25 *tagsindex) + (155 * (tagtableindex - 1)), 0.35, 'quintinOut')
			else
				doTweenY(selectedtag..tagsindex, selectedtag..tagsindex, (getProperty('box.y') + (addvariable - 45)) + (25 *tagsindex) + (155 * (tagtableindex - 1)), 0.35, 'quintinOut')
			end
			tagsindex = tagsindex + 1
			if tagsindex > 5 then
				tagsindex = 0
				tagtableindex = tagtableindex + 1
			end
		end
	end
	if tag == 'Charter4' then
		runTimer('Credits Dissapear', 2.4, 1)
	end
end
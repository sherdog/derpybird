local mydata = require("mydata")

local storyboard = require("storyboard")
local scene = storyboard.newScene()

function start_game(event)
	if event.phase == 'ended' then
		gotoScene("game")
	end
end


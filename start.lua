local physics = require "physics"
physics.start()
local widget = require("widget")

local mydata = require( "mydata" )

local storyboard = require("storyboard")
local scene = storyboard.newScene()


function startGame(event)
	if event.phase == 'ended' then
		gotoScene("game")
	end
end

function scene:createScene(event)

	local screenGroup = self.view
	local sheetInfo = require("spritesheet")
	local myImageSheet = graphics.newImageSheet( "spritesheet.png", sheetInfo:getSheet() )

	local background = display.newImage( myImageSheet , sheetInfo:getFrameIndex("background"))
	background.x = 0
	background.y = 0
	screenGroup:insert(background)

	local logo = display.newImage(myImageSheet, sheetInfo:getFrameIndex("derpy_bird_logo"))
	logo.x = display.contentWidth/2
	logo.y = display.contentHeight/2 + 60

	screenGroup:insert(logo)

	local buttonPlay = widget.newButton
	{
		top = 0,
		left = 0,
		sheet = myImageSheet,
		defaultFrame = 4,
		overFrame = 3
	}

	buttonPlay.x = display.contentWidth/2
	buttonPlay.y = display.contentHeight/2 + 160
	buttonPlay.anchorX = 0.5
	buttonPlay.anchorY = 0

	screenGroup:insert(buttonPlay)

	local derpBird = display.newImage(myImageSheet, sheetInfo:getFrameIndex("bird_large_front"))
	derpBird.x = display.contentWidth/2
	derpBird.y = 20
	derpBird.anchorX = 0.5
	derpBird.anchorY = 0
	derpBird.xScale = .1
	derpBird.yScale = .1

	screenGroup:insert(derpBird)

	--Animate bird in to hit screen :)

end

function enterFrame(event)
	if derpBird.xScale < 1.0 then
		derpBird.xScale = derpBird.xScale + .1
		derpBird.yScale = derpBird.yScale + .1
	end
	print "frame"
end

function scene:enterScene(event)
	local screenGroup = self.view

end

function scene:destroyScene(event)



end

function scene:exitScene(event)

	
end
scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)
scene:addEventListener( "enterFrame", scene )
return scene


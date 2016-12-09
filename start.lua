local physics = require "physics"
physics.start()
local widget = require("widget")

local mydata = require( "mydata" )

local composer = require("composer")
local scene = composer.newScene()


function startGame(event)
	if event.phase == 'ended' then
		gotoScene("gameover")
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
	logo.anchorY = 0
	logo.x = display.contentWidth/2
	logo.y = 20

	screenGroup:insert(logo)

	local buttonPlay = widget.newButton
	{
		top = 0,
		left = 0,
		sheet = myImageSheet,
		defaultFrame = 5,
		overFrame = 4
	}

	buttonPlay.x = display.contentWidth/2
	buttonPlay.y = display.contentHeight/2 + 160
	buttonPlay.anchorX = 0.5
	buttonPlay.anchorY = 0

	screenGroup:insert(buttonPlay)

	local derpBird = display.newImage(myImageSheet, sheetInfo:getFrameIndex("bird_large_front-2"))
	derpBird.x = display.contentWidth/2
	derpBird.y = display.contentHeight  - 70
	derpBird.anchorX = 0.5
	derpBird.anchorY = 1

	screenGroup:insert(derpBird)



	--Animate bird in to hit screen :)

end

function onScaleComplete(event)

	derpBird.visible = false


end



function enterFrame(event)

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


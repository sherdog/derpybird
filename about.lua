
-----------------------------------------------------------------------------------------
--
-- about.lua
--
-----------------------------------------------------------------------------------------
local physics = require "physics"
physics.start()
local widget = require("widget")

local mydata = require( "mydata" )

local composer = require("composer")
local scene = composer.newScene()

local sheetInfo = require("assets.sprites")
local myImageSheet = graphics.newImageSheet( "assets/sprites.png", sheetInfo:getSheet() )


local fontOptions, authorText, background, buttonBack, logo

if "Win" == system.getInfo( "platformName" ) then
    EIGHTBIT = "8-Bit Madness"
elseif "Android" == system.getInfo( "platformName" ) then
    EIGHTBIT = "eight_bit_maddness"
else
    -- Mac and iOS
    EIGHTBIT = "8-Bit-Madness"
end

function scene:createScene( event )
	local group = self.view
	

	--Font name for 8bit font
	--8-Bit-Madness
	fontOptions = {
		text = "Designed by: Danica Sheridan\n\nCoded by: Mike Sheridan\n\nCopyright 2014",
		fontSize = 18,
		x = 0,
		y = 0,
		width = 300,
		height = 300,
		font = EIGHTBIT
	}

	authorText = display.newText(fontOptions)
	authorText.x = 50
	authorText.y = display.contentHeight
	authorText.anchorX = 0
	authorText.anchorY = 0
	authorText:setFillColor(1,1,1)

	background = display.newImageRect( "background.png", 360, 570)
	background.x = 0
	background.y = 0
	background.anchorX = 0
	background.anchorY = 0
	group:insert(background)

	dynomike = display.newImage(myImageSheet, sheetInfo:getFrameIndex("dynimike_games"))
	dynomike.anchorX = 0
	dynomike.anchorY = 0
	dynomike.x = display.contentCenterX  - (dynomike.width/2)
	dynomike.y = display.contentCenterY

	group:insert(dynomike)

	logo = display.newImage(myImageSheet, sheetInfo:getFrameIndex("derpy_bird_logo"))
	logo.anchorY = 	0
	logo.x = display.contentWidth/2
	logo.y = 20

	group:insert(logo)

	buttonBack = widget.newButton
	{
		top = 0,
		left = 0,
		sheet = myImageSheet,
		defaultFrame = 13,
		overFrame = 12,
		onEvent = btnBack_Click
	}

	buttonBack.x = display.contentWidth/2
	buttonBack.y = display.contentHeight/2 + 100
	buttonBack.anchorX = 0.5
	buttonBack.anchorY = 0

	group:insert(buttonBack)
	
end

function btnBack_Click(event)
	storyboard.gotoScene("menu")
end

function animateText(event)
	local speed = .9

	if authorText then
		if(authorText.y > 150) then
			authorText.y= authorText.y - 2
		end
	end
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	storyboard.purgeScene( "about" )
	
	
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroyScene( event )
	local group = self.view
	
	if background then
		background:removeSelf( )
		background = nil
	end

	if authorText then
		authorText:removeSelf( )
		authorText = nil
	end

	if logo then
		logo:removeSelf( )
		logo = nil
	end

	if buttonBack then
		buttonBack:removeSelf()
		buttonBack = nil
	end
end

-----------------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
-----------------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched whenever before next scene's transition begins
scene:addEventListener( "exitScene", scene )

Runtime:addEventListener( "enterFrame", animateText )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

-----------------------------------------------------------------------------------------

return scene
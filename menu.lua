-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------
local physics = require "physics"
physics.start()
local widget = require("widget")

local mydata = require( "mydata" )
local storyboard = require("storyboard")
local scene = storyboard.newScene()

local sheetInfo = require("assets.sprites")
local myImageSheet = graphics.newImageSheet( "assets/sprites.png", sheetInfo:getSheet() )

local flyingBird, smallCloud, background, buttonAbout, buttonPlay, logo, flyingBirdSequence

local provider = "admob"
local appID = "ca-app-pub-5768613602851956/4347327680"

local ads = require "ads"

local showAd

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view

	storyboard.removeScene("stage")
end
function scene:createScene( event )

	local group = self.view

	-- initial variables
	local sysModel = system.getInfo("model")
	local sysEnv = system.getInfo("environment")


	-- Shows a specific type of ad
	showAd = function( adType, isTest )
		local adX, adY = display.screenOriginX, (display.contentHeight - 50)
		ads.show( adType, { x=adX, y=adY, testMode=isTest } )
	end

	-- if on simulator, let user know they must build for device
	if sysEnv == "simulator" then
		showAd( "interstitial", true )
	else
	
	-- start with banner ad
		showAd( "interstitial", false )
	
	end
  
	background = display.newImageRect( "background.png", 360, 570)
	background.x = 0
	background.y = 0
	background.anchorX = 0
	background.anchorY = 0
	group:insert(background)

	smallCloud = display.newImage( myImageSheet , sheetInfo:getFrameIndex("cloud_small"))
	smallCloud.x = 0
	smallCloud.y = 100
	smallCloud.anchorX = 1
	smallCloud.anchorY = 0
	group:insert(smallCloud)

	logo = display.newImage(myImageSheet, sheetInfo:getFrameIndex("derpy_bird_logo"))
	logo.anchorY = 	0
	logo.x = display.contentWidth/2
	logo.y = 20

	group:insert(logo)

	flyingBirdSequence = {
		{ name = "slow", frames={5,10}, time=200 }
	}

	flyingBird = display.newSprite( myImageSheet, flyingBirdSequence )
	flyingBird.x = display.contentWidth/2
	flyingBird.y =  logo.x + 100	
	flyingBird.anchorX = 0.5
	flyingBird.anchorY = 1

	flyingBird:play( )

	buttonPlay = widget.newButton
	{
		top = 0,
		left = 0,
		sheet = myImageSheet,
		defaultFrame = 18,
		overFrame = 17,
		onEvent = playButtonClick
	}

	buttonPlay.x = display.contentWidth/2
	buttonPlay.y = display.contentHeight/2 + 100
	buttonPlay.anchorX = 0.5
	buttonPlay.anchorY = 0

	group:insert(buttonPlay)

	buttonAbout = widget.newButton
	{
		top = 0,
		left = 0,
		sheet = myImageSheet,
		defaultFrame = 11,
		overFrame = 12,
		onEvent = aboutButtonClick
	}

	buttonAbout.x = display.contentWidth/2
	buttonAbout.y = buttonPlay.y + 40
	buttonAbout.anchorX = 0.5
	buttonAbout.anchorY = 0

	group:insert(buttonAbout)
end

function aboutButtonClick(event)
	storyboard.gotoScene("about")
	storyboard.purgeScene("menu")

end

function playButtonClick(event)
	storyboard.gotoScene("stage")
	storyboard.purgeScene("menu")
end

function animateClouds(event)
	local speed = .4
	if smallCloud then
		if(smallCloud.x > display.contentWidth + smallCloud.width) then
			smallCloud.x = -smallCloud.width
		end

	smallCloud.x = smallCloud.x + (1 * speed)
	end
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	-- INSERT code here (e.g. stop timers, remove listenets, unload sounds, etc.)
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroyScene( event )
	local group = self.view
	
	if flyingBird then
		flyingBird:removeSelf()
		flyingBird = nil
	end

	if smallCloud then
		smallCloud:removeSelf()
		smallCloud = nil
	end

	if background then
		background:removeSelf()
		background = nil
	end

	if buttonAbout then
		buttonAbout:removeSelf()
		buttonAbout = nil
	end
	if buttonPlay then
		buttonPlay:removeSelf()
		buttonPlay = nil
	end
end


-- Set up ad listener.
local function adListener( event )
	-- event table includes:
	-- event.provider
	-- event.isError (e.g. true/false )

	local msg = event.response

	-- just a quick debug message to check what response we got from the library
	print("Message received from the ads library: ", msg)

	if event.isError then
		showAd( "banner" )
	end
end

if appID then
	ads.init( provider, appID, adListener )
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


-- Animate clouds in background
Runtime:addEventListener( "enterFrame", animateClouds )
-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

-----------------------------------------------------------------------------------------

return scene
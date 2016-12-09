local physics = require "physics"
physics.start()
local widget = require("widget")
local adcolony = require( "plugin.adcolony" )
local mydata = require( "mydata" )
local composer = require( "composer" )
local scene = composer.newScene()
 local coronaAds = require( "plugin.coronaAds" )
     -- Substitute your own placement IDs when generated
local bannerPlacement = "bottom-banner-320x50"
local interstitialPlacement = "interstitial-1"

local sheetInfo = require("assets.sprites")
local myImageSheet = graphics.newImageSheet( "assets/sprites.png", sheetInfo:getSheet() )

local flyingBird, smallCloud, background, buttonAbout, buttonPlay, logo, flyingBirdSequence


-- Called immediately after scene has moved onscreen:
function scene:show( event )

	local group = self.view
	if(event.phase == 'did') then
		composer.removeScene("stage")
	end
end

local function adListener( event )
	-- Successful initialization of Corona Ads
	if ( event.phase == "init" ) then
		coronaAds.show( bannerPlacement, false )
	end
end

 -- Initialize the AdColony plugin with your Corona Ads API key
function scene:create( event )
	local group = self.view

	background = display.newImageRect( "background.png", 360, 570)
	background.x = 0
	background.y = 0
	background.anchorX = 0
	background.anchorY = 0
	group:insert(background)

	if ( adcolony.isLoaded( "interstitial" ) ) then
		adcolony.load( "interstitial" )
	else
		print('banner was not fucking loaded')	
	end
	

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

	 -- Sometime later, show an ad
	
end

function aboutButtonClick(event)
	if(event.phase == 'ended') then
		composer.gotoScene("about")
		composer.purgeScene("menu")
	end

end

function playButtonClick(event)
	if(event.phase == 'ended') then
		composer.gotoScene("stage")
		composer.removeScene("menu")
	end
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

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroy( event )
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

coronaAds.init( "cdee5737-4331-4fb0-9569-b042cbde5ebb", adListener )
-----------------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
-----------------------------------------------------------------------------------------

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
Runtime:addEventListener( "enterFrame", animateClouds )
scene:addEventListener( "destroy", scene )
-----------------------------------------------------------------------------------------

return scene
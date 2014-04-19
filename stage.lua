
local physics = require "physics"
physics.start()
physics.setGravity( 0, 50 )

local mydata = require( "mydata" )
local storyboard = require ("storyboard")
local scene = storyboard.newScene()

mydata.coins = 0
mydata.score = 0

local sheetInfo = require("assets.sprites")
local myImageSheet = graphics.newImageSheet( "assets/sprites.png", sheetInfo:getSheet() )

local layerOneSpeed = 2
local layerTwoSpeed = .6
local layerThreeSpeed = .3

local ground2, background, ground, rect, trees, trees2, mtn, mtn2, cloud1, cloud2

local g = graphics.newGradient(
	  { 211, 255, 192 },
	  { 0, 111, 225 },
	  "down" )
local elements
gameStarted = false

function scene:enterScene( event )
	local group = self.view
	storyboard.removeScene("menu")
	Runtime:addEventListener("touch", flyUp)
    Runtime:addEventListener("collision", onCollision)
    memTimer = timer.performWithDelay( 1000, checkMemory, 0 )
end

local function checkMemory()
   collectgarbage( "collect" )
   local memUsage_str = string.format( "MEMORY = %.3f KB", collectgarbage( "count" ) )
   print( memUsage_str, "TEXTURE = "..(system.getInfo("textureMemoryUsed") / (1024 * 1024) ) )
end

function scene:createScene( event )
	local group = self.view

	background = display.newImage( myImageSheet , sheetInfo:getFrameIndex("background_blue_green"))
	background.x = 0
	background.y = 0
	background.anchorX = 0
	background.anchorY = 0
	group:insert(background)

	mtn = display.newImage(myImageSheet, sheetInfo:getFrameIndex("mountains"))
	mtn.x = 0
	mtn.y = display.contentHeight
	mtn.anchorX = 0
	mtn.anchorY = 1
	mtn.alpha = 0.3
	group:insert(mtn)

	mtn2 = display.newImage(myImageSheet, sheetInfo:getFrameIndex("mountains"))
	mtn2.x = (mtn.x + mtn.width) - 2
	mtn2.y = display.contentHeight
	mtn2.anchorX = 0
	mtn2.anchorY = 1
	mtn2.alpha = 0.3
	group:insert(mtn2)


	cloud1 = display.newImage(myImageSheet, sheetInfo:getFrameIndex("cloud_large"))
	cloud1.x = display.contentWidth + 50
	cloud1.y = math.random(50, 150)
	cloud1.anchorX = 0
	cloud1.anchorY = 0
	group:insert(cloud1)

	cloud2 = display.newImage(myImageSheet, sheetInfo:getFrameIndex("cloud_small"))
	cloud2.x = (display.contentWidth * 2) + 50
	cloud2.y = math.random(50,150)
	cloud2.anchorX = 0
	cloud2.anchorY = 0
	group:insert(cloud2)


	trees = display.newImage( myImageSheet, sheetInfo:getFrameIndex('trees'))
	trees.x = 0
	trees.y = display.contentHeight - 70
	trees.anchorX = 0
	trees.anchorY = 1
	group:insert(trees)

	trees2 = display.newImage( myImageSheet, sheetInfo:getFrameIndex('trees'))
	trees2.x = (trees.x + trees.width) + 50
	trees2.y = display.contentHeight - 70
	trees2.anchorX = 0
	trees2.anchorY = 1
	group:insert(trees2)

	ground = display.newImage( myImageSheet , sheetInfo:getFrameIndex("ground"))
	ground:translate(0, display.contentHeight)
	ground.y = display.contentHeight
	ground.anchorX = 0
	ground.anchorY = 1
	group:insert(ground)

	ground2 = display.newImage( myImageSheet , sheetInfo:getFrameIndex("ground"))
	ground2:translate(ground.width, display.contentHeight)
	ground2.y = display.contentHeight
	ground2.anchorX = 0
	ground2.anchorY = 1
	group:insert(ground2)

	flyingBirdSequence = {
		{ name = "slow", frames={5, 10}, time=200 }
	}

	flyingBird = display.newSprite( myImageSheet, flyingBirdSequence )
	flyingBird.x = display.contentWidth/2
	flyingBird.y = display.contentHeight/2	
	flyingBird.anchorX = 0.5
	flyingBird.anchorY = 1

	physics.addBody(flyingBird, "static", {density=.1, bounce=0.1, friction=1})
	flyingBird:applyForce(0, -300, flyingBird.x, flyingBird.y)
	flyingBird:play( )
	group:insert(flyingBird)


	elements = display.newGroup()
	elements.anchorChildren = true
	elements.anchorX = 0
	elements.anchorY = 1
	elements.x = 0
	elements.y = 0
	group:insert(elements)

	scoreText = display.newText(mydata.score, display.contentCenterX, 90, "8-Bit Madness", 70)
	scoreText:setFillColor( 0,0,0 )
	scoreText.alpha = 1
	group:insert(scoreText)

	--Create HUD
	-- Lives & Coins

	hud = display.newGroup()
	hud.x = 0
	hud.y = 0
	hud.anchorX = 0
	hud.anchorY = 0

	group:insert(hud)
	
	xText = display.newText( "X",30, 20, native.systemFontBold,  10 )
	xText:setFillColor( 0,0,0 )
	xText.alpha = 1
	group:insert(xText)

	coinText = display.newText( mydata.coins, 43, 21, "8-Bit Madness", 30)
	coinText:setFillColor( 0,0,0 )
	coinText.alpha = 1
	hud:insert(coinText)

	coinIcon = display.newImage(myImageSheet, sheetInfo:getFrameIndex("coin32"))
	coinIcon.x = 15
	coinIcon.y = 20

	hud:insert(coinIcon)


end

function flyUp(event)
	 if event.phase == "began" then
       
		if gameStarted == false then
			 flyingBird.bodyType = "dynamic"
			 --instructions.alpha = 0
			 --tb.alpha = 1
			 addHoopTimer = timer.performWithDelay(math.random(2000, math.random(4000, 5000)), addHoops, -1)
			 moveHoopTimer = timer.performWithDelay(90, moveHoops, -1)
			 gameStarted = true
			 flyingBird:applyForce(0, -190, flyingBird.x, flyingBird.y)
		else 
       
	    flyingBird:applyForce(0, -250, flyingBird.x, flyingBird.y)

      end
	end
end

function onCollision( event )
	if ( event.phase == "began" ) then
		storyboard.gotoScene("restart")	
	end
end

function addHoops()

	hoop = display.newImage( myImageSheet, sheetInfo:getFrameIndex("ring"))
	hoop.x = display.contentWidth + 100
	hoop.y = math.random(display.contentCenterY - 50, display.contentCenterY + 50)
	hoop.anchorX = 0.5
	hoop.anchorY = 0.5
	hoop.scoreAdded = false
	physics.addBody(hoop, "static", {density=1, bounce=0.1, friction=.2})
	elements:insert(hoop)
end

function moveHoops()

	for a = elements.numChildren,1,-1  do
		if(elements[a].x < display.contentCenterX - 170) then
			if elements[a].scoreAdded == false then
				mydata.score = mydata.score + 1
				scoreText.text = mydata.score
				elements[a].scoreAdded = true
			end
		end
		if(elements[a].x > -100) then
			elements[a].x = elements[a].x - 12
		else 
			elements:remove(elements[a])
		end	
	end

end

function showCoin()

end


function scrollBackground()
	
	ground.x = ground.x - layerOneSpeed
	ground2.x = ground2.x - layerOneSpeed

	trees.x = trees.x - layerTwoSpeed
	trees2.x = trees2.x - layerTwoSpeed

	mtn.x = mtn.x - layerThreeSpeed
	mtn2.x = mtn2.x - layerThreeSpeed

	cloud1.x = cloud1.x - layerTwoSpeed
	cloud2.x = cloud2.x - layerTwoSpeed  * 1.1

	if( (cloud1.x + cloud1.width) < 0 ) then
		cloud1.x = (display.contentWidth + 50)
	end 

	if(  (cloud2.x + cloud2.width) < 0 ) then
		cloud2.x = (display.contentWidth * 2) + 50
	end


	if((ground.x + ground.width) < 0) then
		ground.x = (ground2.x+ground2.width)
	end

	if((ground2.x + ground2.width) < 0 ) then
		ground2.x = ground.x+ground.width
	end

	if((trees.x + trees.width) < 0) then
		trees.x = trees2.x + trees2.width
	end

	if((trees2.x + trees2.width)  < 0 ) then
		trees2.x =  (trees.x + trees.width) + 50
	end

	if((mtn.x + mtn.width) < 0 ) then
		mtn.x = (mtn2.x + mtn2.width)
	end

	if((mtn2.x + mtn2.width) < 0 ) then
		mtn2.x = (mtn.x + mtn.width) -2
	end

end

function scene:exitScene(event)

	Runtime:removeEventListener("touch", flyUp)
	Runtime:removeEventListener("enterFrame", scrollBackground)
	Runtime:removeEventListener("collision", onCollision)
	timer.cancel(addHoopTimer)
	timer.cancel(moveHoopTimer)

end

function scene:destroyScene(event)

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

Runtime:addEventListener( "enterFrame", scrollBackground)
-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

-----------------------------------------------------------------------------------------

return scene

local physics = require "physics"
physics.start()
physics.setGravity( 0, 50 )

local mydata = require( "mydata" )
local storyboard = require ("storyboard")
local scene = storyboard.newScene()

mydata.coins = 0
mydata.score = 0
mydata.lives = 3

local sheetInfo = require("assets.sprites")
local myImageSheet = graphics.newImageSheet( "assets/sprites.png", sheetInfo:getSheet() )

local layerOneSpeed = 2
local layerTwoSpeed = .6
local layerThreeSpeed = .3

local ground2, background, ground, rect, trees, trees2, mtn, mtn2, cloud1, cloud2, instructions, flyingBird,birdGroup, hoop

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
	ground.name = "ground"
	group:insert(ground)

	physics.addBody(ground, "static", {density=.1, bounce=0.1, friction=1})

	ground2 = display.newImage( myImageSheet , sheetInfo:getFrameIndex("ground"))
	ground2:translate(ground.width, display.contentHeight)
	ground2.y = display.contentHeight
	ground2.anchorX = 0
	ground2.anchorY = 1
	ground2.name ="ground2"
	group:insert(ground2)

	instructions = display.newImage(myImageSheet, sheetInfo:getFrameIndex("instructions"))
	instructions.x = display.contentCenterX - (instructions.width/2)
	instructions.y = (display.contentCenterY - (instructions.height/2));
	instructions.anchorX = 0
	instructions.anchorY = 0

	group:insert(instructions)

	physics.addBody(ground2, "static", {density=.1, bounce=0.1, friction=1})

	--Bird stuff
	elements_back = display.newGroup()
	elements_back.anchorChildren = true
	elements_back.anchorX = 0
	elements_back.anchorY = 1
	elements_back.x = 0
	elements_back.y = 0
	group:insert(elements_back)

	birdGroup = display.newGroup()
	birdGroup.x=0
	birdGroup.y=0
	birdGroup.anchorX = 0
	birdGroup.anchorY = 0
	birdGroup.name ="birdGroup"

	group:insert(birdGroup)


	flyingBirdSequence = {
		{ name = "slow", frames={5, 10}, time=200 }
	}

	flyingBird = display.newSprite( myImageSheet, flyingBirdSequence )
	flyingBird.x = (display.contentWidth/2) - 80
	flyingBird.y = display.contentHeight/2	
	flyingBird.anchorX = 0.5
	flyingBird.anchorY = 1
	flyingBird.name = "bird"
	
	flyingBird:play( )
	birdGroup:insert(flyingBird)

	physics.addBody(birdGroup, "static", {density=.1, bounce=0.1, friction=1})

	birdGroup:applyForce(0, -300, birdGroup.x, birdGroup.y)


	elements_front = display.newGroup()
	elements_front.anchorChildren = true
	elements_front.anchorX = 0
	elements_front.anchorY = 1
	elements_front.x = 0
	elements_front.y = 0
	group:insert(elements_front)

	scoreText = display.newText(mydata.score, display.contentCenterX, 90, "8-Bit Madness", 70)
	scoreText:setFillColor( 0,0,0 )
	scoreText.alpha = 0
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
	hud:insert(xText)

	coinText = display.newText( mydata.coins, 43, 21, "8-Bit Madness", 30)
	coinText:setFillColor( 0,0,0 )
	coinText.alpha = 1
	hud:insert(coinText)

	coinIcon = display.newImage(myImageSheet, sheetInfo:getFrameIndex("coin32"))
	coinIcon.x = 15
	coinIcon.y = 20

	heartCount = 3
	heart = { }
	local initHeartX = display.contentWidth - 20
	for i=0, 2, 1 do
		if(mydata.lives >= i) then
			heart[i] = display.newImage(myImageSheet, sheetInfo:getFrameIndex("heart_full"))
		else
			heart[i] = display.newImage(myImageSheet, sheetInfo:getFrameIndex("heart_empty"))
		end
		
		heart[i].x = (display.contentWidth - ((heart[i].width + 3) * (heartCount - i)))
		heart[i].y = 20
		hud:insert(heart[i])
	end

	hud:insert(coinIcon)

end

function flyUp(event)
	 if event.phase == "began" then
       
		if gameStarted == false then
			 birdGroup.bodyType = "dynamic"
			 instructions.alpha = 0
			 --tb.alpha = 1
			 scoreText.alpha = 1
			 hud.alpha = 1
			 addHoopTimer = timer.performWithDelay(math.random(2000, math.random(4000, 5000)), addHoops, -1)
			 moveHoopTimer = timer.performWithDelay(90, moveHoops, -1)
			 gameStarted = true
			 birdGroup:applyForce(0, -190, birdGroup.x, birdGroup.y)
		else 
       
	    birdGroup:applyForce(0, -250, birdGroup.x, birdGroup.y)

      end
	end
end

function gameOver()
	storyboard.gotoScene("restart")	
end

function onCollision( event )

	if(event.object1.name ~= nil)then
		--print('event object 1: ' .. event.object1.name)
	end
	if ( event.phase == "began" ) then
		--gameOver()
	end
end

function onHoopCollision(self, event)
	
	if(event.phase == 'began') then
		print(self.name .. 'collision has begun with: ' .. event.other.name)
	end

	if(event.phase == 'ended') then
		print('collision has ended')
	end
end

hoopCount = 0

function addHoops()

	hoop = display.newImage( myImageSheet, sheetInfo:getFrameIndex("ring_back"))
	hoop.x = display.contentWidth + 100
	hoop.y = math.random(display.contentCenterY - 50, display.contentCenterY + 50)
	hoop.anchorX = 0.5
	hoop.anchorY = 0.5
	physics.addBody( hoop, "static", { density=0.3, friction=0.5, bounce=0.3 } )

	hoop.collision = onHoopCollision
	hoop:addEventListener( "collision", hoop )
	hoop.name ="hoop_back"..hoopCount
	hoop.scoreAdded = false
	elements_back:insert(hoop)


	hoop_front = display.newImage( myImageSheet, sheetInfo:getFrameIndex("ring_front"))
	hoop_front.x = (hoop.x + hoop.width)
	hoop_front.y = hoop.y
	hoop_front.anchorX = 0.5
	hoop_front.anchorY = 0.5
	elements_front:insert(hoop_front)
	
	hoopCount = hoopCount + 1

end

function moveHoops()
	for a = elements_back.numChildren,1,-1  do
		if(elements_back[a].x < display.contentCenterX - 170) then
			if elements_back[a].scoreAdded == true then
				mydata.score = mydata.score + 1
				scoreText.text = mydata.score
				elements_back[a].scoreAdded = false
			end
		end
		if(elements_back[a].x > -34) then
			elements_back[a].x = elements_back[a].x - 12
			elements_front[a].x = elements_back[a].x + elements_back[a].width
			elements_front[a].y = elements_back[a].y
		else 
			elements_back:remove(elements_back[a])
			elements_front:remove(elements_front[a])
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


local prevY = 0

function enterFrame(event)
	--if bird y is less than -200.. let's cap it at 200
	if hoop ~= nil then
		
	end

	if(birdGroup.y < -700) then
		gameOver()
	end
		if(birdGroup.y > prevY) then
			diffY = math.ceil( birdGroup.y - prevY )
			 flyingBird.rotation = (diffY * 1.1)
		else
			diffY = math.ceil( prevY  - birdGroup.y)
			flyingBird.rotation = (-diffY * 1.1)
		end
		prevY = birdGroup.y
end

function scene:exitScene(event)

	Runtime:removeEventListener("touch", flyUp)
	Runtime:removeEventListener("enterFrame", scrollBackground)
	Runtime:removeEventListener("enterFrame", enterFrame)
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

Runtime:addEventListener( "enterFrame", enterFrame)

Runtime:addEventListener( "enterFrame", scrollBackground)
-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

-----------------------------------------------------------------------------------------

return scene
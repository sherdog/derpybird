
local physics = require "physics"
physics.start()
physics.setGravity( 0, 40 )

local mydata = require( "mydata" )
local composer = require ("composer")
local scene = composer.newScene()
local score = require('score')
local audio = require("audio")


local prevScene = composer.getSceneName("previous")

mydata.coins = 0
mydata.score = 0
mydata.lives = 2

local sheetInfo = require("assets.sprites")
local myImageSheet = graphics.newImageSheet( "assets/sprites.png", sheetInfo:getSheet() )

local layerOneSpeed = 2
local layerTwoSpeed = .6
local layerThreeSpeed = .3

local spawnTmr
local spawnTime = 3500
local difficultyLevels = 350

local ground2, background, ground, rect, trees, trees2, mtn, mtn2, cloud1, cloud2, instructions, flyingBird, hoop, wallTop, wallBottom, sign
local difficultyTimer

local woosh = audio.loadStream("assets/sound/woosh.wav")
local gameover = audio.loadStream("assets/sound/gameover.wav")
local blip = audio.loadStream("assets/sound/blip.wav")
audio.setVolume( 0.5, { channel = 1 } )  -- set the master volume

local EIGHTBIT

if "Win" == system.getInfo( "platformName" ) then
    EIGHTBIT = "eight_bit_madness.ttf"
elseif "Android" == system.getInfo( "platformName" ) then
    EIGHTBIT = "eight_bit_madness.ttf"
else
    -- Mac and iOS
    EIGHTBIT = "eight_bit_madness.ttf"
end

local g = graphics.newGradient(
	  { 211, 255, 192 },
	  { 0, 111, 225 },
	  "down" )

local coinGroup
local gameStarted = false

function checkMemory()
   collectgarbage( "collect" )
   local memUsage_str = string.format( "MEMORY = %.3f KB", collectgarbage( "count" ) )
   --print( memUsage_str, "TEXTURE = "..(system.getInfo("textureMemoryUsed") / (1024 * 1024) ) )
end

function onCollision(event)
	
	if(event.phase == 'began') then
		
	end

	print(event.object2.id)
	print(event.object2.touched)
	print(event.object1.id)

	if(event.phase == 'ended') then

		if(event.object1.id == 'ground' or event.object1.id == 'ground2' or
			event.object2.id == 'ground' or event.object2.id == 'ground2') then
			print("we hit the ground! wtf.")
			event.object2.touched = false
			event.object1.touched = false
			gameOver()
		end
		--print('object was ' .. event.object2.id)
		if((event.object2.id == 'hoop' and event.object1.id == 'dummy' and event.object2.touched == false ) or
			(event.object1.id == 'hoop' and event.object2.id == 'dummy' and event.object1.touched == false)) then
			event.object2.touched = true
			event.object1.touched = true
			mydata.score = mydata.score + 1
			scoreText.text = mydata.score
		end

		if(( (event.object2.id == 'walltop' and event.object2.touched == false)  or (event.object2.id == 'wallbottom' and event.object2.touched == false)) and event.object1.id == 'dummy' and event.object2.touched == false) then
			removeHeart()
			event.object2.touched = true
		end
	end
	return true
end

function scene:show( event )
	local group = self.view
	if(event.phase == 'will') then

	end
	if(event.phase == 'did') then
		composer.removeScene(prevScene)
	end
   memTimer = timer.performWithDelay( 1000, checkMemory, 0 )
end

function scene:create( event )
	local group = self.view
	
	mydata.score = 0

	background = display.newImageRect( "background.png", 360, 570)
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

	physics.addBody(ground, "static", {density=.1, bounce=0.1, friction=1})
	ground.id = "ground"
	ground.touch = false
	group:insert(ground)

	ground2 = display.newImage( myImageSheet , sheetInfo:getFrameIndex("ground"))
	ground2:translate(ground.width, display.contentHeight)
	ground2.y = display.contentHeight
	ground2.anchorX = 0
	ground2.anchorY = 1
	ground2.touch = false
	ground2.id ="ground2"

	physics.addBody(ground2, "static", {density=.1, bounce=0.1, friction=1})
	group:insert(ground2)

	instructions = display.newImage(myImageSheet, sheetInfo:getFrameIndex("instructions"))
	instructions.x = display.contentCenterX - (instructions.width/2)
	instructions.y = (display.contentCenterY - (instructions.height/2));
	instructions.anchorX = 0
	instructions.anchorY = 0

	group:insert(instructions)

	elements = display.newGroup()
	elements.anchorX = 0
	elements.anchorY = 1
	elements.x = 0
	elements.y = 0
	group:insert(elements)
	
	dummyBird = display.newRect( (display.contentWidth/2) - 80 , display.contentHeight/2, 50, 30 )
	dummyBird:setFillColor( 0.5 )

	dummyBird.anchorX = 0.5
	dummyBird.anchorY = 0
	dummyBird.id = 'dummy'
	dummyBird.alpha = 0

	group:insert(dummyBird)

	physics.addBody(dummyBird, "static", {density=.2, bounce=0.0, friction=1})
	dummyBird:applyForce(0, -300, dummyBird.x, dummyBird.y)

	--Bird stuff
	flyingBirdSequence = {
		{ name = "slow", frames={5, 10}, time=200 }
	}

	flyingBird = display.newSprite( myImageSheet, flyingBirdSequence )
	flyingBird.x = (display.contentWidth/2) - 80
	flyingBird.y = display.contentHeight/2	
	flyingBird.anchorX = 0.5
	flyingBird.anchorY = 0
	flyingBird.id = "bird"
	flyingBird:play( )
	flyingBird.alpha = 1

	group:insert(flyingBird)

	--Coin group
	coinGroup = display.newGroup()
	coinGroup.anchorX = 0
	coinGroup.anchorY = 0
	coinGroup.x = 0
	coinGroup.y = 0
	group:insert(coinGroup)
	
	elementsTop = display.newGroup()
	elementsTop.anchorX = 0
	elementsTop.anchorY = 1
	elementsTop.x = 0
	elementsTop.y = 0
	group:insert(elementsTop)

	wallsTop = display.newGroup()
	wallsTop.anchorX = 0
	wallsTop.anchorY = 1
	wallsTop.x = 0
	wallsTop.y = 0

	group:insert(wallsTop)

	wallsBottom = display.newGroup()
	wallsBottom.anchorX = 0
	wallsBottom.anchorY = 1
	wallsBottom.x = 0
	wallsBottom.y = 0

	group:insert(wallsBottom)

	--Hitbox top inner ring, so bernie ricocchets 
	hitBoxTop = display.newGroup()
	hitBoxTop.anchorX = 0
	hitBoxTop.anchorY = 1
	hitBoxTop.x = 0
	hitBoxTop.y = 0

	group:insert(hitBoxTop)

	scoreText = score.init({
		fontSize = 70,
		font = EIGHTBIT,
		x = display.contentCenterX,
		y = 90,
		maxDigits = 4,
		leadingZeros = false,
		filename = "scorefile.txt",
	})

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

	renderHearts()

end

function renderHearts()
	heartCount = 3
	heart = { }

	local initHeartX = display.contentWidth - 20

	for i=0, 2, 1 do
		if(mydata.lives >= i) then
			heart[i] = display.newImage(myImageSheet, sheetInfo:getFrameIndex("heart_full"))
		else
			heart[i] = display.newImage(myImageSheet, sheetInfo:getFrameIndex("heart_empty"))
		end
		heart[i].x = ((display.contentWidth) - ((heart[i].width + 3) * (heartCount - i)))
		heart[i].y = 20
		hud:insert(heart[i])
	end
end

function increaseDifficulty()
	--print('made it to increaseDifficulty')
	if addHoopTimer ~= nil then
        timer.cancel(addHoopTimer)
   		spawnTmr = nil
    end
      spawnTime = spawnTime - 500

       -- just to be safe, set this to whatever spawn rate would be the
       -- fastest, so game never spawns to fast
      	print("spawn time: " .. spawnTime)
       if spawnTime < 500 then
       	spawnTime = 250
       end
       -- spawn at this rate until this timer is canceled
       addHoopTimer = timer.performWithDelay(spawnTime, addHoops, 0)
end

function flyUp(event)
	 if event.phase == "began" then
		if gameStarted == false then
			 dummyBird.bodyType="dynamic"
			 instructions.alpha = 0
			 --tb.alpha = 1
			 scoreText.alpha = 1
			 hud.alpha = 1
			 gameStarted = true

			 dummyBird:applyForce( 0, -190, dummyBird.x, dummyBird.y)

			 difficultyTimer = timer.performWithDelay(15000, increaseDifficulty, difficultyLevels)
			 addHoopTimer = timer.performWithDelay(3500, addHoops, 10)
			 moveHoopTimer = timer.performWithDelay(90, moveHoops, -1)	
		else 
			 audio.stop()
			 audio.play(woosh, { channel = 1})
			-- dummyBird:applyLinearImpulse(0, -10, dummyBird.x, dummyBird.y)
       	    dummyBird:applyForce(0, -550, dummyBird.x, dummyBird.y)
      end
	end
end

function gameOver()

	Runtime:removeEventListener("touch", flyUp)
	Runtime:removeEventListener("collision", onCollision)
	Runtime:removeEventListener("enterFrame", enterFrame)

	if(moveHoopTimer ~= nil) then
			timer.cancel(moveHoopTimer)
		end

		if(addHoopTimer ~= nil) then
			timer.cancel(addHoopTimer)
		end
		
		if(difficultyTimer ~= nil) then
			timer.cancel(difficultyTimer)
		end

	local gameoverSound = audio.play(gameover)
	composer.gotoScene("restart")	
end

hoopCount = 0

function addHoops()

	--add walls above and below
	--this will be used to detect if the bird misses the hoop.
	--kind of a hack but i can't reliably figure out how to do it otherwise.

	hoop = display.newImage( myImageSheet, sheetInfo:getFrameIndex("ring_back"))
	hoop.x = display.contentWidth + 100
	hoop.y = math.random(display.contentCenterY - 50, display.contentCenterY + 50)
	hoop.anchorX = 0.5
	hoop.anchorY = 0.5
	hoop.id ="hoop"
	hoop.touched = false
	hoop.test = "NO!"

	physics.addBody(hoop, "static", { density=0, bounce=0.1, friction=0, isSensor = true})
	elements:insert(hoop)

	wallTop = display.newRect( hoop.x , 0, 1, (hoop.y - (hoop.height/2) - 5) )
	wallTop:setFillColor( 0.5 )
	wallTop.anchorX = 0
	wallTop.anchorY = 1
	wallTop.id = 'walltop'
	wallTop.touched = false
	wallTop.alpha = 0

	physics.addBody(wallTop, "static", { density=0, bounce=0.1, friction=0, isSensor=true})
	wallsTop:insert(wallTop)

	wallBottom = display.newRect( hoop.x , ( hoop.y + (hoop.height / 2) + 5), 1, 1000)
	wallBottom:setFillColor( 0.5 )
	wallBottom.anchorX = 0
	wallBottom.anchorY = 0
	wallBottom.id = 'wallbottom'
	wallBottom.touched = false
	wallBottom.alpha = 0

	physics.addBody(wallBottom, "static", { density=0, bounce=0.1, friction=0, isSensor=true})
	wallsBottom:insert(wallBottom)


	hoopFront = display.newImage( myImageSheet, sheetInfo:getFrameIndex("ring_front"))
	hoopFront.x = (hoop.x + hoop.width)
	hoopFront.y = hoop.y
	hoopFront.anchorX = 0.5
	hoopFront.anchorY = 0.5
	elementsTop:insert(hoopFront)

	hoopCount = hoopCount + 1
end

function removeHeart()
	mydata.lives = mydata.lives - 1
	renderHearts()

	local blipSound = audio.play(blip)
	if(mydata.lives  < 0) then
		--doh last life.. it's game over!

		gameOver()
	end
end

function moveHoops()

	for b = elements.numChildren,1,-1 do
		
		if(elements[b].x < display.contentCenterX - 170) then
			if elements[b].scoreAdded == true then
				mydata.score = mydata.score + 1
				scoreText.text = mydata.score
				elements[b].scoreAdded = false
			end
		end

		if( elements[b].x > -34 ) then

			elements[b].x = elements[b].x - 12
			
			elementsTop[b].x = elements[b].x + elements[b].width
			elementsTop[b].y = elements[b].y

			

			if wallsBottom[b] ~= nil and wallsTop[b] ~= nil then
				wallsTop[b].x, wallsTop[b].y = elements[b].x + (elements[b].width/2), elements[b].y - (elements[b].height / 2) - 25
				wallsBottom[b].x = elements[b].x + (elements[b].width / 2) 
				wallsBottom[b].y = elements[b].y + (elements[b].height / 2) + 25
			end
		--	hitBoxTop[b].x, hitBoxTop[b].y = (elements[b].x + (hitBoxTop[b].width / 2) -5 ), elements[b].y - (elements[b].height / 2) + 22

		else
			elements:remove(elements[b])
			elementsTop:remove(elementsTop[b])
			wallsTop:remove(wallsTop[b])
			wallsBottom:remove(wallsBottom[b])
			hitBoxTop:remove(hitBoxTop[b])

			elements[b] = nil
			elementsTop[b] = nil
			wallsTop[b] = nil
			wallBottom[b] = nil
			hitBoxTop[b] = nil

		end	
	end


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
	scrollBackground()

	flyingBird.x = dummyBird.x
	flyingBird.y = dummyBird.y
	--print('db y: ' .. dummyBird.y)
	if(dummyBird.y < -20) then
		dummyBird.y = -20
	end
	
	if(flyingBird.y > prevY) then
		diffY = math.ceil( dummyBird.y - prevY )
		flyingBird.rotation = (diffY * 1.5)
	else
		diffY = math.ceil( prevY  - dummyBird.y)
		flyingBird.rotation = (-diffY * 1.5)
	end

	prevY = dummyBird.y
end

function scene:destroy(event)
	local group = self.view
	
	Runtime:removeEventListener("touch", flyUp)
	Runtime:removeEventListener("enterFrame", enterFrame)
	
	if(moveHoopTimer ~= nil) then
		timer.cancel(moveHoopTimer)
	end

	if(addHoopTimer ~= nil) then
		timer.cancel(addHoopTimer)
	end
	
	if(difficultyTimer ~= nil) then
		timer.cancel(difficultyTimer)
	end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
Runtime:addEventListener("touch", flyUp)
Runtime:addEventListener("collision", onCollision)
Runtime:addEventListener( "enterFrame", enterFrame)
scene:addEventListener( "destroy", scene )

return scene
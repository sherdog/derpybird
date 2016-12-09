io.output():setvbuf('no')

local composer = require ("composer")
local scene = composer.newScene()
local mydata = require( "mydata" )
local score = require( "score" )
local sheetInfo = require("assets.sprites")
local myImageSheet = graphics.newImageSheet( "assets/sprites.png", sheetInfo:getSheet() )
local widget = require("widget")
local json = require("json")
local fb = require('fbsocial')
local screenshotFilename = ""
local prevScene = composer.getSceneName("previous")

local access_token = nil

local screenCap, sign, fbButton
local layerOneSpeed = 2
local layerTwoSpeed = .6
local layerThreeSpeed = .3
local EIGHTBIT

if "Win" == system.getInfo( "platformName" ) then
    EIGHTBIT = "eight_bit_madness.ttf"
elseif "Android" == system.getInfo( "platformName" ) then
    EIGHTBIT = "eight_bit_madness.ttf"
else
    EIGHTBIT = "eight_bit_madness.ttf"
end

function doFacebook( event )
    --native.setActivityIndicator( true )
    if(event.phase == 'ended') then
        score = tostring(mydata.score)
        screenshot()
        timer.performWithDelay( 200, publishToFb, 1)
    end
end

function publishToFb()
    print('filename is motherfucking ' .. screenshotFilename)
     local attachment = {
        message = "I just set a new high score in Derpy Bird!",
        source = { baseDir=system.DocumentsDirectory, filename=screenshotFilename, type="image" }
    }
    FacePublishPhoto(attachment)
end


function showStart()
	startTransition = transition.to(restart,{time=200, alpha=1})
end

function loadScore()
	local prevScore = score.load()

	if prevScore ~= nil then
		if prevScore <= mydata.score then
			score.set(mydata.score)
		else 
			score.set(prevScore)	
		end
	else 
		score.set(mydata.score)	
		score.save()
	end
end

function saveScore()
	score.save()
end

function restartGame(event)
     if event.phase == "ended" then
		saveScore()
		composer.gotoScene("stage")
     end
end

function scene:show(event)
    local group = self.view
	
    if(event.phase == 'will') then
        composer.removeScene(prevScene)
    end

    if(event.phase == 'did') then
        composer.removeScene("stage")
        physics.addBody(ground, "static", {density=.1, bounce=0.1, friction=1})
        physics.addBody(ground2, "static", {density=.1, bounce=0.1, friction=1})
        loadScore()
    end
end

function scene:create(event)
	local group = self.view

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
    
    ground.id = "ground"
    group:insert(ground)

    ground2 = display.newImage( myImageSheet , sheetInfo:getFrameIndex("ground"))
    ground2:translate(ground.width, display.contentHeight)
    ground2.y = display.contentHeight
    ground2.anchorX = 0
    ground2.anchorY = 1
    ground2.id ="ground2"
    
    group:insert(ground2)

	--Game Over Stuffs
    sign = display.newImage(myImageSheet, sheetInfo:getFrameIndex("game_over_slide"))
    sign.x = display.contentCenterX  - (sign.width / 2)
    sign.y = -sign.height
    sign.anchorX = 0
    sign.anchorY = 0
    
    group:insert(sign)

    currentScoreTitle = display.newText("Score", 120, 150, EIGHTBIT, 30)
    currentScoreTitle:setFillColor( 0.49, 0.506, 0.384 )
    currentScoreTitle.alpha = 0
    
    group:insert(currentScoreTitle)

    currentScore = display.newText("0", currentScoreTitle.x, currentScoreTitle.y+40, EIGHTBIT, 50)
    currentScore:setFillColor( 0.49, 0.506, 0.384 )
    currentScore.alpha = 0

    group:insert(currentScore)

    bestScoreTitle = display.newText("Best", currentScoreTitle.x + 125, currentScoreTitle.y, EIGHTBIT, 30)
    bestScoreTitle:setFillColor( 0.49, 0.506, 0.384 )
    bestScoreTitle.alpha = 0
    
    group:insert(bestScoreTitle)

    bestScore = display.newText("0", bestScoreTitle.x, bestScoreTitle.y + 40, EIGHTBIT, 50)
    bestScore:setFillColor( 0.49, 0.506, 0.384 )
    bestScore.alpha = 0

    group:insert(bestScore)

    transition.to(sign, {time=400, y=0, onComplete=function(sign)
        timer.performWithDelay( 200, onScoreBoardCompleteListener )
    end })

    buttonRestart = widget.newButton
    {
        top = 0,
        left = 0,
        sheet = myImageSheet,
        defaultFrame = 35,
        onEvent = restartGame
    }

    buttonRestart.anchorX = 0.5
    buttonRestart.anchorY = 0
    buttonRestart.alpha = 0

    group:insert(buttonRestart)

   fbButton = widget.newButton({
        sheet = myImageSheet,
        defaultFrame = 41,
        onEvent = doFacebook
    })

    fbButton.anchorX = 1
    fbButton.anchorY = 0
    fbButton.x = 0
    fbButton.y = 0
    fbButton.alpha = 0
    fbButton.isActive = true

    group:insert(fbButton)
end

function onScoreBoardCompleteListener(obj)

        currentScoreTitle.alpha = 1

        currentScore.text = mydata.score
        currentScore.alpha = 1

        bestScoreTitle.alpha = 1

        bestScore.text = score.load()
        bestScore.alpha = 1

        buttonRestart.x = sign.x + 50
        buttonRestart.y = sign.height +  20

        buttonRestart.alpha = 1

        fbButton.x = sign.x +  sign.width 
        fbButton.y = sign.height + 20

        fbButton.alpha = 1
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

function enterFrame(event)
    scrollBackground()
end

function scene:destroy(event)
    local group = self.view
    if(event.phase == 'did') then
        Runtime:removeEventListener("enterFrame", enterFrame)
    end
end

function screenshot() 

    --I set the filename to be "widthxheight_time.png"
    --e.g. "1920x1080_20140923151732.png"
    local date = os.date( "*t" )
    local timeStamp = table.concat({date.year .. date.month .. date.day .. date.hour .. date.min .. date.sec})
    screenshotFilename = display.pixelWidth.."x"..display.pixelHeight.."_"..timeStamp..".png"
    
    --capture screen
    local capture = display.captureScreen(false)

    --make sure image is right in the center of the screen
    capture.x, capture.y = display.contentWidth * 0.5, display.contentHeight * 0.5

    --save the image and then remove
    display.save( capture, { filename=screenshotFilename, baseDir=system.DocumentsDirectory, isFullResolution=true } )    
    capture:removeSelf()
    capture = nil
    return true               
end


scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("destroy", scene)
Runtime:addEventListener( "enterFrame", enterFrame )

return scene
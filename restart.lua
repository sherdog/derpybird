io.output():setvbuf('no')

local storyboard = require ("storyboard")
local scene = storyboard.newScene()
local mydata = require( "mydata" )
local score = require( "score" )
local sheetInfo = require("assets.sprites")
local myImageSheet = graphics.newImageSheet( "assets/sprites.png", sheetInfo:getSheet() )
local widget = require("widget")
local facebook = require( "facebook" )
local json = require("json")

local screenCap, sign, fbButton

local facebookAppID = "1482803695265952"
local FB_Command = nil

local layerOneSpeed = 2
local layerTwoSpeed = .6
local layerThreeSpeed = .3

function print_r ( t )
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        print(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        print(indent..string.rep(" ",string.len(pos)+6).."}")
                    elseif (type(val)=="string") then
                        print(indent.."["..pos..'] => "'..val..'"')
                    else
                        print(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                print(indent..tostring(t))
            end
        end
    end
    if (type(t)=="table") then
        print(tostring(t).." {")
        sub_print_r(t,"  ")
        print("}")
    else
        sub_print_r(t,"  ")
    end
    print()
end

function facebookListener( event )
  --  print_r( event )
    if ( "session" == event.type ) then
        --options are: "login", "loginFailed", "loginCancelled", or "logout"
        if ( "login" == event.phase ) then
            local access_token = event.token

            --code for tasks following a successful login
            print( 'Token: ' .. access_token )
            if FB_Command then
            	 
            	 local highscore = mydata.score
            	 local baseDir = system.DocumentsDirectory
            	 
                 local screenBounds = {
            	 	xMin = 0,
            	 	xMax = display.contentWidth,
            	 	yMin = 0,
            	 	yMax = display.contentHeight,
            	}

            	local screenShotName = "derpyBirdscore_" .. highscore .. '.png'
    			
            	if(highscore == 1) then
            		scoreString = 'point'
            	else
            		scoreString = 'points'
            	end

    			--screenCap = display.captureBounds(true)
    			screenCap = display.captureScreen(false )
    			screenCap.x = 0
    			screenCap.y = 0
    			screenCap.anchorX = 0
    			screenCap.anchorY = 0
    			screenCap:scale(0.5, 0.5)
    			display.save( screenCap, screenShotName, baseDir )
    			
    			screenCap:removeSelf()

            	attachment = {
			       	message = "I scored " .. mydata.score .. ' ' .. scoreString .. " playing Derpy Bird! Think you can beat me?",
			        source = 
			        { 
				        baseDir = system.DocumentsDirectory, 
				        filename = screenShotName, 
				        type = "image" 
				    }
			    }
                facebook.request( FB_Command, "POST", attachment )

            end
        end
    elseif ( "request" == event.type ) then
        print("facebook request")
        if ( not event.isError ) then
            local data = json.decode( event.response )
            native.showAlert( "Success", "Your score has been posted!", {"OK"})
        else
            native.showAlert( "Error", "There was an error in your request", { "OK" })
        end
    end
end

function doFacebook( event )
    if event.phase == "ended" then
        FB_Command = "me/photos"
        facebook.login( facebookAppID, facebookListener, {"publish_actions", "email" })
    end
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
		storyboard.gotoScene("stage")
     end
end

function scene:enterScene(event)
	storyboard.removeScene("stage")
	--showGameOver()
	loadScore()
end

function scene:createScene(event)
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

    physics.addBody(ground, "static", {density=.1, bounce=0.1, friction=1})
    ground.id = "ground"
    group:insert(ground)

    ground2 = display.newImage( myImageSheet , sheetInfo:getFrameIndex("ground"))
    ground2:translate(ground.width, display.contentHeight)
    ground2.y = display.contentHeight
    ground2.anchorX = 0
    ground2.anchorY = 1
    ground2.id ="ground2"

    physics.addBody(ground2, "static", {density=.1, bounce=0.1, friction=1})
    group:insert(ground2)

	--Game Over Stuffs
    sign = display.newImage(myImageSheet, sheetInfo:getFrameIndex("game_over_slide"))
    sign.x = display.contentCenterX  - (sign.width / 2)
    sign.y = -sign.height
    sign.anchorX = 0
    sign.anchorY = 0
    
    group:insert(sign)

    currentScoreTitle = display.newText("Score", 80, 150, "8-Bit Madness", 30)
    currentScoreTitle:setFillColor( 0,0,0 )
    currentScoreTitle.alpha = 0
    
    group:insert(currentScoreTitle)

    currentScore = display.newText("0", currentScoreTitle.x, currentScoreTitle.y+40, "8-Bit Madness", 50)
    currentScore:setFillColor(0,0,0 )
    currentScore.alpha = 0

    group:insert(currentScore)

    bestScoreTitle = display.newText("Best", currentScoreTitle.x + 165, currentScoreTitle.y, "8-Bit Madness", 30)
    bestScoreTitle:setFillColor( 0,0,0 )
    bestScoreTitle.alpha = 0
    
    group:insert(bestScoreTitle)

    bestScore = display.newText("0", bestScoreTitle.x, bestScoreTitle.y + 40, "8-Bit Madness", 50)
    bestScore:setFillColor( 0,0,0 )
    bestScore.alpha = 0

    group:insert(bestScore)

    transition.to(sign, {time=400, y=0, onComplete=function(sign)
        timer.performWithDelay( 200, onScoreBoardCompleteListener )
    end })


    --Create HUD
    -- Lives & Coins

    buttonRestart = widget.newButton
    {
        top = 0,
        left = 0,
        sheet = myImageSheet,
        defaultFrame = 34,
        onEvent = restartGame
    }

   
    buttonRestart.anchorX = 0.5
    buttonRestart.anchorY = 0
    buttonRestart.alpha = 0

    group:insert(buttonRestart)

   fbButton = widget.newButton({
        sheet = myImageSheet,
        defaultFrame = 40,
        onEvent = doFacebook
    })

    fbButton.anchorX = 0.5
    fbButton.anchorY = 0
    fbButton.x = 0
    fbButton.y = 0
    fbButton.alpha = 0

    group:insert(fbButton)

    facebook.login( facebookAppID, facebookListener )

end

function onScoreBoardCompleteListener(obj)

        currentScoreTitle.alpha = 1

        currentScore.text = mydata.score
        currentScore.alpha = 1

        bestScoreTitle.alpha = 1

        bestScore.text = score.load()
        bestScore.alpha = 1

        buttonRestart.x = sign.x + 65
        buttonRestart.y = sign.height +  20

        buttonRestart.alpha = 1

        fbButton.x = sign.width - 30
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
    --if bird y is less than -200.. let's cap it at 200
    scrollBackground()

end

function scene:exitScene(event)
	--transition.cancel(fadeTransition)
	
end

function scene:destroyScene(event)

end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)

Runtime:addEventListener( "enterFrame", enterFrame )
scene:addEventListener("destroyScene", scene)

return scene
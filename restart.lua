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

local screenCap

local facebookAppID = "1482803695265952"
local FB_Command = nil

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
    print_r( event )
    print( "event.name", event.name )  --"fbconnect"
    print( "event.type:", event.type ) --type is either "session", "request", or "dialog"
    print( "isError: " .. tostring( event.isError ) )
    print( "didComplete: " .. tostring( event.didComplete ) )
    if ( "session" == event.type ) then
        --options are: "login", "loginFailed", "loginCancelled", or "logout"
        if ( "login" == event.phase ) then
            local access_token = event.token
            --code for tasks following a successful login
            print( 'Token: ' .. access_token )
            if FB_Command then
            	 
            	 local highscore = score.load()
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
            		

			       	message = "I scored " .. scoreString .. " points playing Derpy Bird! Think you can beat me?",
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
            print( "data: ", data )
            print( "event.response: ", event.response )
        else
            print( "event.isError: " .. event.isError )
        end
    end
end

function doFacebook( event )
    if event.phase == "ended" then
    -- Fill the screen with a green rectangle
	
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

	mydata.score = 0
end

function saveScore()
	score.save()
end

function restartGame(event)
     if event.phase == "ended" then
    	 mydata.score = 0
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

	scoreBox = display.newImage(myImageSheet, sheetInfo:getFrameIndex("game_over_box"))
	scoreBox.x = (display.contentWidth / 2) - (scoreBox.width / 2)
	scoreBox.y = (display.contentHeight / 2) - (scoreBox.height / 2)
	scoreBox.anchorX = 0
	scoreBox.anchorY = 0
	group:insert(scoreBox)

	--Create HUD
	-- Lives & Coins

	buttonRestart = widget.newButton
	{
		top = 0,
		left = 0,
		sheet = myImageSheet,
		defaultFrame = 15,
		overFrame = 16,
		onEvent = restartGame
	}

	buttonRestart.x = display.contentWidth/2
	buttonRestart.y = display.contentHeight/2 + 50
	buttonRestart.anchorX = 0.5
	buttonRestart.anchorY = 0

	group:insert(buttonRestart)

	local fbButton = widget.newButton({
	    sheet = myImageSheet,
	    defaultFrame = 25,
	    onEvent = doFacebook
	})

	fbButton.x = display.contentCenterX
	fbButton.y = buttonRestart.y + 70

	group:insert(fbButton)

	facebook.login( facebookAppID, facebookListener )
	

	coinIcon = display.newImage(myImageSheet, sheetInfo:getFrameIndex("ring_small"))
	coinIcon.x = scoreBox.x + 90
	coinIcon.y = scoreBox.y + 180
	group:insert(coinIcon)

	xText = display.newText( "X",(coinIcon.x + coinIcon.width) + 15, coinIcon.y, native.systemFontBold,  30 )
	xText:setFillColor( 0,0,0 )
	xText.alpha = 1
	group:insert(xText)

	coinText = display.newText( mydata.score, (coinIcon.x + coinIcon.width) + 50, coinIcon.y, "8-Bit Madness", 60)
	coinText:setFillColor( 0,0,0 )
	coinText.alpha = 1
	group:insert(coinText)

	

	--now we group everyhing inside the box based on box x,y



end



function scene:exitScene(event)
	--transition.cancel(fadeTransition)
	
end

function scene:destroyScene(event)

end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene
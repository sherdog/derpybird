local composer = require( "composer" )
local scene = composer.newScene()

local mydata = require( "mydata" )
local score = require( "score" )
local sheetInfo = require("assets.sprites")
local myImageSheet = graphics.newImageSheet( "assets/sprites.png", sheetInfo:getSheet() )
local widget = require("widget")
local facebook = require( "plugin.facebook.v4" )
local json = require("json")

function showStart()
	startTransition = transition.to(restart,{time=200, alpha=1})
end

function loadScore()
	local prevScore = score.load()
	print('prev score: ', prevScore)
	print('mydata score: ',  mydata.score)
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
		print('saving score')
		composer.gotoScene("stage")
     end
end

function scene:show(event)
	if(event.phase == 'will') then
		composer.removeScene("stage")
		loadScore()
	end
end

function scene:create(event)
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

	gameOverTitle = display.newImage(myImageSheet, sheetInfo:getFrameIndex("game_over_title"))
	gameOverTitle.x = scoreBox.x + ((scoreBox.width / 2) - (gameOverTitle.width / 2))
	gameOverTitle.y = scoreBox.y + 20
	gameOverTitle.anchorX = 0
	gameOverTitle.anchorY = 0
	group:insert(gameOverTitle)

	--Create HUD
	-- Lives & Coins
	--restartGame

	buttonRestart = widget.newButton
	{
		top = 0,
		left = 0,
		sheet = myImageSheet,
		defaultFrame = 15,
		overFrame = 16,
		onEvent = onShareBtnRelease
	}

	buttonRestart.x = display.contentWidth/2
	buttonRestart.y = display.contentHeight/2
	buttonRestart.anchorX = 0.5
	buttonRestart.anchorY = 0

	group:insert(buttonRestart)

	coinIcon = display.newImage(myImageSheet, sheetInfo:getFrameIndex("ring_small"))
	coinIcon.x = scoreBox.x + 90
	coinIcon.y = scoreBox.y + 120
	group:insert(coinIcon)

	xText = display.newText( "X",(coinIcon.x + coinIcon.width) + 15, coinIcon.y, native.systemFontBold,  30 )
	xText:setFillColor( 0,0,0 )
	xText.alpha = 1
	group:insert(xText)

	coinText = display.newText( mydata.score, (coinIcon.x + coinIcon.width) + 50, coinIcon.y, "8-Bit Madness", 60)
	coinText:setFillColor( 0,0,0 )
	coinText.alpha = 1
	group:insert(coinText)
end

function facebookListener( event )
 	print('event.phase', event.phase)
    print( "event.name", event.name )  --"fbconnect"
    print( "event.type:", event.type ) --type is either "session", "request", or "dialog"
    print( "isError: " .. tostring( event.isError ) )
    print( "didComplete: " .. tostring( event.didComplete ) )
 
    if ( "session" == event.type ) then
        if ( "login" == event.phase ) then
            facebook.showDialog( "feed", {
			     title = "Derpy Bird",
			     description = "I just hit a high score of " .. mydata.score .. " in Derpy Bird!.",
			     link = "https://www.facebook.com/games/derpybird/",
			     picture = "https://objects-us-west-1.dream.io/derpybird/FacebookShareImage.png"
			})
        end
 
    elseif ( "request" == event.type ) then
        print("facebook request")
        if ( not event.isError ) then
            local response = json.decode( event.response )
            print("response was " .. response)
            --process response data here
        end
 
    elseif ( "dialog" == event.type ) then
        print( "dialog", event.response )
        --handle dialog results here
    end
end
 
function onShareBtnRelease(event)
 	if(event.phase == 'ended') then
 		facebook.login( facebookListener, { "publish_actions" } )
 	end
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)

return scene
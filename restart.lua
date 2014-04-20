local storyboard = require ("storyboard")
local scene = storyboard.newScene()
local mydata = require( "mydata" )
local score = require( "score" )
local sheetInfo = require("assets.sprites")
local myImageSheet = graphics.newImageSheet( "assets/sprites.png", sheetInfo:getSheet() )
local widget = require("widget")
local facebook = require( "facebook" )
local json = require("json")

function listener(event)
	if ( "session" == event.type ) then
      -- Upon successful login, request list of friends
      if ( "login" == event.phase ) then
         -- Show the friends picker
         facebook.showDialog( "friends", onComplete )
      end
   elseif ( "dialog" == event.type ) then
      print( event.response )
   end
end

function showStart()
	startTransition = transition.to(restart,{time=200, alpha=1})

end

function showShare()
	facebook.login( "1482803695265952", listener, { "publish_actions" } )
	local attachment = {
    message = "Corona Icon file",
    source = {
        baseDir=system.DocumentsDirectory, 
        filename="coronaIcon.png",
        type="image"
    }
}

facebook.request( "me/photos", "POST", attachment )
end

function showScore()
	
end

function showGameOver()

end

function restartGame(event)
     if event.phase == "ended" then
		--saveScore()
		storyboard.gotoScene("stage")
     end
end

function saveScore()
	score.save()
end

function scene:enterScene(event)
	storyboard.removeScene("stage")
	--showGameOver()
	--loadScore()
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

	gameOverTitle = display.newImage(myImageSheet, sheetInfo:getFrameIndex("game_over_title"))
	gameOverTitle.x = scoreBox.x + ((scoreBox.width / 2) - (gameOverTitle.width / 2))
	gameOverTitle.y = scoreBox.y + 20
	gameOverTitle.anchorX = 0
	gameOverTitle.anchorY = 0
	group:insert(gameOverTitle)

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
	buttonRestart.y = display.contentHeight/2
	buttonRestart.anchorX = 0.5
	buttonRestart.anchorY = 0

	group:insert(buttonRestart)

	buttonShare = widget.newButton
	{
		top = 0,
		left = 0,
		sheet = myImageSheet,
		defaultFrame = 15,
		overFrame = 16,
		onEvent = showShare()
	}

	buttonShare.x = display.contentWidth/2
	buttonShare.y = display.contentHeight/2 + 100
	buttonShare.anchorX = 0.5
	buttonShare.anchorY = 0

	group:insert(buttonShare)
	

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
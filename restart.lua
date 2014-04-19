local storyboard = require ("storyboard")
local scene = storyboard.newScene()
local mydata = require( "mydata" )
local score = require( "score" )


function restartGame(event)
     if event.phase == "ended" then
		saveScore()
		storyboard.gotoScene("menu")
     end
end


function scene:enterScene(event)
	storyboard.removeScene("stage")
	restart:addEventListener("touch", restartGame)
	--showGameOver()
	--loadScore()
end

function scene:createScene(event)

	local screenGroup = self.view
end



function scene:exitScene(event)
	restart:removeEventListener("touch", restartGame)
	--transition.cancel(fadeTransition)
	
end

function scene:destroyScene(event)

end


scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene
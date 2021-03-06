local facebook = require("plugin.facebook.v4")
local appId  = "1482803695265952"
local fbListener
local fbCommand
local fbData
local fbCallback
local fbId

local LOGOUT = 0
local POST_MSG = 1
local POST_PHOTO = 2
local GET_FRIENDS = 3
local INVITE_REQUEST = 4
local SINGLE_SIGNON = 5
local FEED_GAME = 6

access_token = nil

function printTable( t, label, level )
	if label then print( label ) end
	level = level or 1
	if type(t) ~= "table" then
		t = json.decode(t)
	end
	if t then
		for k,v in pairs( t ) do
			local prefix = ""
			for i=1,level do
				prefix = prefix .. "\t"
			end

			print( prefix .. "[" .. tostring(k) .. "] = " .. tostring(v) )
			if type( v ) == "table" then
				print( prefix .. "{" )
				printTable( v, nil, level + 1 )
				print( prefix .. "}" )
			end
		end
	end
end

fbListener = function(event)

	

    if ("session" == event.type) then
		if event.phase == "logout" then
			return false
		end
		-- Save Access Token
		if (facebook.getCurrentAccessToken()) then
			local accessToken = facebook.getCurrentAccessToken()
			print('setting access token to ' .. accessToken.token)
			access_token = accessToken.token
			if(access_token ~= nil) then
				network.request("https://graph.facebook.com/me?access_token=" .. access_token, "GET", function(event)
					if not event.isError then
						local data = event.response or "{}"
						data = json.decode(data)
						
						if data and data.error and data.error.type == "OAuthException" then
							print("OAuthException")
							access_token = nil
							facebook.logout()
							return false
						end
					else
						-- Something unexpected happened, go ahead with a regular login
						print("Face, unexpected error")
					end
				end) --end network request
			end
		end
		
		if fbCommand == FEED_GAME then
			facebook.showDialog("feed", fbData)
		end
		
		if fbCommand == POST_MSG then
			facebook.showDialog("feed", fbData)
		end
		
		if fbCommand == POST_PHOTO then
			facebook.request("me/photos", "POST", fbData)
		end

		if fbCommand == POST_SCORE then
			local aToken = facebook.getCurrentAccessToken()
			params = {
				score = tostring(fbData),
	         	access_token = aToken.token,
			}
			facebook.request('me/scores', "POST", params)
		end
				
		if fbCommand == GET_FRIENDS then
			facebook.request("me/friends", "GET", {fields = "id, name, installed"})
		end
		
		if fbCommand == INVITE_REQUEST then
			facebook.showDialog("apprequests", fbData)
		end
		
		if fbCommand == SINGLE_SIGNON then
			facebook.request("me", "GET", {fields="id,username,name"})
		end
-----------------------------------------------------------------------------------------
    elseif "request" == event.type then
		native.setActivityIndicator(false)
		if not event.isError then
			
			local response = json.decode(event.response)
			if response then					
				if fbCommand == POST_MSG then
					ui.newNotification(t("notification.facebook_message_posted"))
			
				elseif fbCommand == POST_PHOTO then
					ui.newNotification(t("notification.facebook_message_posted"))
				
		        elseif fbCommand == GET_FRIENDS then
					fbCallback(response)
				
				elseif fbCommand == SINGLE_SIGNON then
					fbCallback(response)

				elseif fbCommand == POST_SCORE then
					native.showAlert("Message", response, {"OK"})
				end
			else
				native.showAlert( "Error", "Facebook error: " .. response, {"OK"})
			end
        else
        	-- Error
			facebook.logout()
			native.showAlert( "Error", "Facebook error: " .. response, {"OK"})
			fbCallback = nil
			fbData = nil
			fbCommand = nil
		end
	elseif "dialog" == event.type then
		native.setActivityIndicator(false)
		
		if event.didComplete == true then
			if fbCommand == FEED_GAME or fbCommand ==  POST_MSG then
				if string.find(event.response or "", "fbconnect://success?post_id=", 1, true) then
					ui.newNotification(t("notification.facebook_message_posted"))
				end
				
			elseif fbCommand == INVITE_REQUEST then
				local status = "success"
				if ios and not string.find(event.response or "", "request=", 1, true) then
					status = "error"
				end
				fbCallback(status)
			end
		end

		fbCallback = nil
		fbData = nil
		fbCommand = nil
		
    end
end

-- Publish a feed
function FacePublishFeedGame(data)
	fbCommand = FEED_GAME
	fbData = data
	facebook.login(fbListener, {"publish_actions"})
end

function FacePublishFeed(data)
	fbCommand = POST_MSG
	fbData = data
	facebook.login(fbListener, {"publish_actions"})
end

function FacePublishPhoto(data)
	fbCommand = POST_PHOTO
	fbData = data
	facebook.login(fbListener, {"publish_actions"})
end

function FaceInviteFriends(data, cb)
	fbCommand = INVITE_REQUEST
	fbData = data
	fbCallback = cb
	facebook.login(fbListener, {"publish_actions"})
end

function FaceGetFriends(cb)
	fbCommand = GET_FRIENDS
	fbCallback = cb
	facebook.login(fbListener, {"publish_actions"})
end

function FacePostScore(score)
	fbCommand = POST_SCORE
	fbData = data
	facebook.login(fbListener, {"publish_actions"})
end

function FaceSingleSignon(cb)
	fbCommand = SINGLE_SIGNON
	fbCallback = cb
	facebook.login(fbListener, {"publish_actions"})
end

function FaceLogout()
	access_token = nil
	facebook.logout()
end
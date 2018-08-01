-- Credits to @Havoc , @Flatracer , @Briglair , and @WolfKnight	on forum.fivem.net for helping me create this
-- Thanks to Ethan Rubinacci and Mark Curry
-- Lots of thanks to @Wolfknight for help with the admin feature
-- Special thanks to @Flatracer

-- Created by Murtaza. If you need help, msg me. The comments are there for people to learn.

-- SERVERSIDED

------ CONFIG ------

local everyoneAllowed = false -- If true, everyone is allowed and you do not need to add steam/ip identifiers. If false, you need to add steam/ip identifiers so they can use the command.

local allowed =  
{
	"steam:000000000000000", -- Enter your steam ids and ips as such. DO NOT forget the commas and do not add a comma at the end.
	"steam:000000000000001",
	"ip:192.168.1.1",
	"ip:192.168.1.2",
	"steam:000000000000003"
}	

------ Code. DO NOT TOUCH ------

AddEventHandler('chatMessage', function(source, n, msg) -- Checks messages
	local Message = string.lower(msg) -- Lowers entire msg to lower case (in case user has Caps Lock or something)
	if Message == "/delobjgun on" then -- Checks if the message says this
		CancelEvent() -- Stops message from going thru
		local identifier = GetPlayerIdentifiers(source)[1] -- Gets identifier (steam id or ip of player)
		if everyoneAllowed == true then -- Checks if the variable in the config is true
			TriggerClientEvent('ObjectDeleteGunOn', source) -- Triggers ObjectDeleteGunOn client event
		else -- if not
			if checkAllowed(identifier) then -- Refers to function checkAllowed() (look below) with the variable identifier
				TriggerClientEvent('ObjectDeleteGunOn', source) -- Triggers ObjectDeleteGunOn client event
			else -- if not
				TriggerClientEvent('noPermissions', source) -- Triggers noPermissions client event
			end
		end
	elseif Message == "/delobjgun off" then -- Checks if message says /delobjgun off
		CancelEvent()  -- Stops message from going thru
		TriggerClientEvent('ObjectDeleteGunOff', source) -- Triggers ObjectDeleteGunOff client event
	end
end)

function checkAllowed(id) -- function checkAllowed(). id is just a returned value (forgot what the actual word is xD)
	for k, v in pairs(allowed) do -- for repeat to go thru the allowed table. k = key and v = value
		if id == v then -- checks if id is equal to v
			print('Returns true')
			return true -- returns true if id is equal to v
		end
	end
	
	return false -- in case nothing is in the array, just a fail safe so it returns false basically
end
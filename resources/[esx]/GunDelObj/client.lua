-- Credits to @Havoc , @Flatracer , @Briglair , and @WolfKnight	on forum.fivem.net for helping me create this
-- Thanks to Ethan Rubinacci and Mark Curry
-- Lots of thanks to @Wolfknight for help with the admin feature
-- Special thanks to @Flatracer

-- Created by Murtaza. If you need help, msg me. The comments are there for people to learn.

-- CLIENTSIDED
-- Register a network event
RegisterNetEvent('ObjectDeleteGunOn') -- Registers the event on the net so that it can be called on a server_script
RegisterNetEvent('ObjectDeleteGunOff') -- Registers the event on the net so that it can be called on a server_script
RegisterNetEvent('noPermissions') -- Registers the event on the net so that it can be called on a server_script
local toggle = false

AddEventHandler('ObjectDeleteGunOn', function() -- adds an event handler so it can be registered
	if toggle == false then -- checks if toggle is false
		drawNotification("~g~Object Delete Gun Enabled!") -- activates function drawNotification() with message in parentheses
		toggle = true -- sets toggle to true
	else -- if not
		drawNotification('~y~Object Delete Gun is already enabled!') -- activates function drawNotification() with message in parentheses
	end
end)

AddEventHandler('ObjectDeleteGunOff', function() -- adds an event handler so it can be registered
	if toggle == true then -- checks if toggle is true
		drawNotification('~b~Object Delete Gun Disabled!') -- activates function drawNotification() with message in parentheses
		toggle = false -- sets toggle to false
	else -- if not
		drawNotification('~y~Object Delete Gun is already disabled!') -- activates function drawNotification() with message in parentheses
	end
end)

AddEventHandler('noPermissions', function() -- adds an event handler so it can be registered
	drawNotification("~r~You have insufficient permissions to activate the Object Delete Gun.") -- activates function drawNotification() with message in parentheses
end)

Citizen.CreateThread(function() -- Creates thread
	while true do -- infinite loop
		Citizen.Wait(0) -- wait so it doesnt crash
		if toggle then -- checks toggle if its true (infinitely
			if IsPlayerFreeAiming(PlayerId()) then -- checks if player is aiming around
				local entity = getEntity(PlayerId()) -- gets the entity
				if IsPedShooting(GetPlayerPed(-1)) then -- checks if ped is shooting
					SetEntityAsMissionEntity(entity, true, true) -- sets the entity as mission entity so it can be despawned
					DeleteEntity(entity) -- deletes the entity
				end
			end
		end
	end
end)

function getEntity(player) --Function To Get Entity Player Is Aiming At
	local result, entity = GetEntityPlayerIsFreeAimingAt(player)
	return entity
end

function drawNotification(text) --Just Don't Edit!
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end
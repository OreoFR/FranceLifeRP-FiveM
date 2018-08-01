----------------------
-- Author : Deediezi
-- Version 3.0
--
-- Contributors : No contributors at the moment.
--
-- Github link : https://github.com/Deediezi/FiveM_LockSystem
-- You can contribute to the project. All the information is on Github.

--  Main algorithm with all functions and events - Client side

----
-- @var vehicles[plate_number] = newVehicle Object
local vehicles = {}

---- Retrieve the keys of a player when he reconnects.
-- The keys are synchronized with the server. If you restart the server, all keys disappear.
AddEventHandler("playerSpawned", function()
    TriggerServerEvent("ls:retrieveVehiclesOnconnect")
end)

---- Main thread
-- The logic of the script is here
Citizen.CreateThread(function()
    while true do
        Wait(0)

        -- If the defined key is pressed
        if(IsControlJustPressed(1, globalConf["CLIENT"].key))then

            -- Init player infos
            local ply = GetPlayerPed(-1)
            local pCoords = GetEntityCoords(ply, true)
            local px, py, pz = table.unpack(GetEntityCoords(ply, true))
            isInside = false

            -- Retrieve the local ID of the targeted vehicle
            if(IsPedInAnyVehicle(ply, true))then
                -- by sitting inside him
                localVehId = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                isInside = true
            else
                -- by targeting the vehicle
                localVehId = GetTargetedVehicle(pCoords, ply)
            end

            -- Get targeted vehicle infos
            if(localVehId and localVehId ~= 0)then
                local localVehPlate = string.lower(GetVehicleNumberPlateText(localVehId))
                local localVehLockStatus = GetVehicleDoorLockStatus(localVehId)
                local hasKey = false

                -- If the vehicle appear in the table (if this is the player's vehicle or a locked vehicle)
                for plate, vehicle in pairs(vehicles) do
                    if(string.lower(plate) == localVehPlate)then
                        -- If the vehicle is not locked (this is the player's vehicle)
                        if(vehicle ~= "locked")then
                            hasKey = true
                            if(time > timer)then
                                -- update the vehicle infos (Useful for hydrating instances created by the /givekey command)
                                vehicle.update(localVehId, localVehLockStatus)
                                -- Lock or unlock the vehicle
                                vehicle.lock()
                                time = 0
                            else
                                TriggerEvent("ls:notify", "Vous devez attendre " .. (timer / 1000) .." secondes")
                            end
                        else
                            TriggerEvent("ls:notify", "Les clés ne sont pas à l'intérieur")
                        end
                    end
                end

                -- If the player doesn't have the keys
                if(not hasKey)then
                    -- If the player is inside the vehicle
                    if(isInside)then
                        -- If the player find the keys
                        if(canSteal())then
                            -- Check if the vehicle is already owned.
                            -- And send the parameters to create the vehicle object if this is not the case.
                            TriggerServerEvent('ls:checkOwner', localVehId, localVehPlate, localVehLockStatus)
                        else
                            -- If the player doesn't find the keys
                            -- Lock the vehicle (players can't try to find the keys again)
                            vehicles[localVehPlate] = "locked"
                            TriggerServerEvent("ls:lockTheVehicle", localVehPlate)
                            TriggerEvent("ls:notify", "Les clés ne sont pas à l'intérieur")
                        end
                    end
                end
            end
        end
    end
end)

---- Timer
Citizen.CreateThread(function()
    timer = globalConf['CLIENT'].lockTimer * 1000
    time = 0
	while true do
		Wait(1000)
		time = time + 1000
	end
end)

---- Prevents the player from breaking the window if the vehicle is locked
-- (fixing a bug in the previous version)
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local ped = GetPlayerPed(-1)
        if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId(ped))) then
        	local veh = GetVehiclePedIsTryingToEnter(PlayerPedId(ped))
	        local lock = GetVehicleDoorLockStatus(veh)
	        if lock == 4 then
	        	ClearPedTasks(ped)
	        end
        end
	end
end)

---- Locks vehicles if non-playable characters are in them
-- Can be disabled in "config/shared.lua"
if(globalConf['CLIENT'].disableCar_NPC)then
    Citizen.CreateThread(function()
        while true do
            Wait(0)
            local ped = GetPlayerPed(-1)
            if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId(ped))) then
                local veh = GetVehiclePedIsTryingToEnter(PlayerPedId(ped))
                local lock = GetVehicleDoorLockStatus(veh)
                if lock == 7 then
                    SetVehicleDoorsLocked(veh, 2)
                end
                local pedd = GetPedInVehicleSeat(veh, -1)
                if pedd then
                    SetPedCanBeDraggedOut(pedd, false)
                end
            end
        end
    end)
end

------------------------    EVENTS      ------------------------
------------------------     :)         ------------------------

---- Update a vehicle plate (for developers)
-- @param string oldPlate
-- @param string newPlate
RegisterNetEvent("ls:updateVehiclePlate")
AddEventHandler("ls:updateVehiclePlate", function(oldPlate, newPlate)
    local oldPlate = string.lower(oldPlate)
    local newPlate = string.lower(newPlate)

    if(vehicles[oldPlate])then
        vehicles[newPlate] = vehicles[oldPlate]
        vehicles[oldPlate] = nil

        TriggerServerEvent("ls:updateServerVehiclePlate", oldPlate, newPlate)
    end
end)

---- Event called from the server
-- Get the keys and create the vehicle Object if the vehicle has no owner
-- @param boolean hasOwner
-- @param int localVehId
-- @param string localVehPlate
-- @param int localVehLockStatus
RegisterNetEvent("ls:getHasOwner")
AddEventHandler("ls:getHasOwner", function(hasOwner, localVehId, localVehPlate, localVehLockStatus)
    if(not hasOwner)then
        TriggerEvent("ls:newVehicle", localVehId, localVehPlate, localVehLockStatus)
        TriggerServerEvent("ls:addOwner", localVehPlate)

        TriggerEvent("ls:notify", getRandomMsg())
    else
        TriggerEvent("ls:notify", "Ce véhicule ne vous appartient pas")
    end
end)

---- Create a new vehicle object
-- @param int id [opt]
-- @param string plate
-- @param string lockStatus [opt]
RegisterNetEvent("ls:newVehicle")
AddEventHandler("ls:newVehicle", function(id, plate, lockStatus)
    if(plate)then
        local plate = string.lower(plate)
        if(not id)then id = nil end
        if(not lockStatus)then lockStatus = nil end
        vehicles[plate] = newVehicle()
        vehicles[plate].__construct(id, plate, lockStatus)
    else
        print("Impossible de créer l'instance de véhicule. Argument manquant PLATE")
    end
end)

---- Event called from server when a player execute the /givekey command
-- Create a new vehicle object with its plate
-- @param string plate
RegisterNetEvent("ls:giveKeys")
AddEventHandler("ls:giveKeys", function(plate)
    local plate = string.lower(plate)
    TriggerEvent("ls:newVehicle", nil, plate, nil)
end)

---- Piece of code from Scott's InteractSound script : https://forum.fivem.net/t/release-play-custom-sounds-for-interactions/8282
-- I've decided to use only one part of its script so that administrators don't have to download more scripts. I hope you won't forget to thank him!
RegisterNetEvent('InteractSound_CL:PlayWithinDistance')
AddEventHandler('InteractSound_CL:PlayWithinDistance', function(playerNetId, maxDistance, soundFile, soundVolume)
    local lCoords = GetEntityCoords(GetPlayerPed(-1))
    local eCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerNetId)))
    local distIs  = Vdist(lCoords.x, lCoords.y, lCoords.z, eCoords.x, eCoords.y, eCoords.z)
    if(distIs <= maxDistance) then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = soundVolume
        })
    end
end)

RegisterNetEvent('ls:notify')
AddEventHandler('ls:notify', function(text, duration)
	Notify(text, duration)
end)

------------------------    FUNCTIONS      ------------------------
------------------------        :O         ------------------------

---- A simple algorithm that checks if the player finds the keys or not.
-- @return boolean
function canSteal()
    nb = math.random(1, 100)
    percentage = globalConf["CLIENT"].percentage
    if(nb < percentage)then
        return true
    else
        return false
    end
end

---- Return a random message
-- @return string
function getRandomMsg()
    msgNb = math.random(1, #randomMsg)
    return randomMsg[msgNb]
end

---- Get a vehicle in direction
-- @param array coordFrom
-- @param array coordTo
-- @return int
function GetVehicleInDirection(coordFrom, coordTo)
	local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed(-1), 0)
	local a, b, c, d, vehicle = GetRaycastResult(rayHandle)
	return vehicle
end

---- Get the vehicle in front of the player
-- @param array pCoords
-- @param int ply
-- @return int
function GetTargetedVehicle(pCoords, ply)
    for i = 1, 200 do
        coordB = GetOffsetFromEntityInWorldCoords(ply, 0.0, (6.281)/i, 0.0)
        targetedVehicle = GetVehicleInDirection(pCoords, coordB)
        if(targetedVehicle ~= nil and targetedVehicle ~= 0)then
            return targetedVehicle
        end
    end
    return
end

---- Notify the player
-- Can be configured in "config/shared.lua"
-- @param string text
-- @param float duration [opt]
function Notify(text, duration)
	if(globalConf['CLIENT'].notification)then
		if(globalConf['CLIENT'].notification == 1)then
			if(not duration)then
				duration = 0.080
			end
			SetNotificationTextEntry("STRING")
			AddTextComponentString(text)
			Citizen.InvokeNative(0x1E6611149DB3DB6B, "CHAR_LIFEINVADER", "CHAR_LIFEINVADER", true, 1, "Centralisation", "", duration)
			DrawNotification_4(false, true)
		elseif(globalConf['CLIENT'].notification == 2)then
			TriggerEvent('chatMessage', '^1LockSystem V' .. _VERSION, {255, 255, 255}, text)
		else
			return
		end
	else
		return
	end
end

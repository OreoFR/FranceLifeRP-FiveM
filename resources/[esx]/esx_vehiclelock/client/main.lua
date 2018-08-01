ESX               = nil
local playerCars = {}
local disableCar_NPC = false
local notificationParam = 1

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

-- 
function OpenCloseVehicle()
	local playerPed = GetPlayerPed(-1)
	local coords    = GetEntityCoords(playerPed)

	local vehicle = nil

	if IsPedInAnyVehicle(playerPed,  false) then
		vehicle = GetVehiclePedIsIn(playerPed, false)
	else
		vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 7.0, 0, 70)
	end

	ESX.TriggerServerCallback('esx_vehiclelock:requestPlayerCars', function(isOwnedVehicle)

		if isOwnedVehicle then
			local locked = GetVehicleDoorLockStatus(vehicle)
			if locked == 1 then -- if unlocked
				SetVehicleDoorsLocked(vehicle, 2)
				PlayVehicleDoorCloseSound(vehicle, 1)
				TriggerEvent('InteractSound_CL:PlayOnOne', 'lock', 0.6)-----CECI ET UN SON------
				TriggerEvent("ls:sendNotification", notificationParam, "Véhicule ~r~fermé.", 0.300)
			elseif locked == 2 then -- if locked
				SetVehicleDoorsLocked(vehicle, 1)
				PlayVehicleDoorOpenSound(vehicle, 0)
				TriggerEvent('InteractSound_CL:PlayOnOne', 'unlock', 0.6)-----CECI ET UN SON-----
				TriggerEvent("ls:sendNotification", notificationParam, "Véhicule ~g~ouvert.", 0.300)
			end
		else
			ESX.ShowNotification("Vous n'avez pas les clés de ce ~r~véhicule !")
		end
	end, GetVehicleNumberPlateText(vehicle))
end

if not enableCar_NPC then
	Citizen.CreateThread(function()
  	while true do
			Wait(0)

			local player = GetPlayerPed(-1)

	        if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId(player))) then

	            local veh = GetVehiclePedIsTryingToEnter(PlayerPedId(player))
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
end--]]

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsControlJustReleased(0, 303) then
			OpenCloseVehicle()
		end
	end
end)

RegisterNetEvent("ls:notify")
AddEventHandler("ls:notify", function(text, time)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	Citizen.InvokeNative(0x1E6611149DB3DB6B, "CHAR_LIFEINVADER", "CHAR_LIFEINVADER", true, 1, "Centralisation", "", time)
	DrawNotification_4(false, true)
end)

RegisterNetEvent("ls:sendNotification")
AddEventHandler("ls:sendNotification", function(param, message, duration)
	if param == 1 then
		TriggerEvent("ls:notify", message, duration)
	elseif param == 2 then
		TriggerEvent('chatMessage', 'LockSystem', { 255, 128, 0 }, message)
	end
end)
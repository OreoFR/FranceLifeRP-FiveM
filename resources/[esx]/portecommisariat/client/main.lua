local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX					= nil
local PlayerData	= {}
local IsCop			= false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
	if PlayerData.job.name == 'police' then
		IsCop = true
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job

	IsCop = (job.name == 'police') or false
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		for i=1, #Config.DoorList do
			local playerCoords = GetEntityCoords(GetPlayerPed(-1))
			local closeDoor    = GetClosestObjectOfType(Config.DoorList[i].objCoords.x, Config.DoorList[i].objCoords.y, Config.DoorList[i].objCoords.z, 1.0, GetHashKey(Config.DoorList[i].objName), false, false, false)
			local distance     = GetDistanceBetweenCoords(playerCoords, Config.DoorList[i].objCoords.x, Config.DoorList[i].objCoords.y, Config.DoorList[i].objCoords.z, true)
			
			local maxDistance = 1.25
			if Config.DoorList[i].distance then
				maxDistance = Config.DoorList[i].distance
			end
			
			if distance < maxDistance then
				local size = 1
				if Config.DoorList[i].size then
					size = Config.DoorList[i].size
				end

				local displayText = _U('unlocked')
				if Config.DoorList[i].locked then
					displayText = _U('locked')
				end

				if IsCop then
					displayText = _U('press_button') .. displayText
				end

				ESX.Game.Utils.DrawText3D(Config.DoorList[i].textCoords, displayText, size)
				
				if IsControlJustReleased(0, Keys['E']) then
					if IsCop then
						if Config.DoorList[i].locked then
							FreezeEntityPosition(closeDoor, false)
							Config.DoorList[i].locked = false
						else
							FreezeEntityPosition(closeDoor, true)
							Config.DoorList[i].locked = true
						end
						TriggerServerEvent('esx_celldoors:update', i, Config.DoorList[i].locked) -- Broadcast new state of the door to everyone
					else
						ESX.ShowNotification(_U('not_cop'))
					end
				end
			else
				FreezeEntityPosition(closeDoor, Config.DoorList[i].locked)
			end
		end
	end
end)


RegisterNetEvent('esx_celldoors:state')
AddEventHandler('esx_celldoors:state', function(id, isLocked)
	if id ~= nil and type(Config.DoorList[id]) ~= nil ~= nil then -- Check if door exists
		Config.DoorList[id].locked = isLocked -- Change state of door
	end
end)

ESX					= nil
local PlayerData	= {}
local IsCop			= false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
	if PlayerData.job.name == 'sheriff' then
		IsCop = true
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job

	IsCop = (job.name == 'sheriff') or false
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		for i=1, #Config.DoorList do
			local playerCoords = GetEntityCoords(GetPlayerPed(-1))
			local closeDoor    = GetClosestObjectOfType(Config.DoorList[i].objCoords.x, Config.DoorList[i].objCoords.y, Config.DoorList[i].objCoords.z, 1.0, GetHashKey(Config.DoorList[i].objName), false, false, false)
			local distance     = GetDistanceBetweenCoords(playerCoords, Config.DoorList[i].objCoords.x, Config.DoorList[i].objCoords.y, Config.DoorList[i].objCoords.z, true)
			
			local maxDistance = 1.25
			if Config.DoorList[i].distance then
				maxDistance = Config.DoorList[i].distance
			end
			
			if distance < maxDistance then
				local size = 1
				if Config.DoorList[i].size then
					size = Config.DoorList[i].size
				end

				local displayText = _U('unlocked')
				if Config.DoorList[i].locked then
					displayText = _U('locked')
				end

				if IsCop then
					displayText = _U('press_button') .. displayText
				end

				ESX.Game.Utils.DrawText3D(Config.DoorList[i].textCoords, displayText, size)
				
				if IsControlJustReleased(0, Keys['E']) then
					if IsCop then
						if Config.DoorList[i].locked then
							FreezeEntityPosition(closeDoor, false)
							Config.DoorList[i].locked = false
						else
							FreezeEntityPosition(closeDoor, true)
							Config.DoorList[i].locked = true
						end
						TriggerServerEvent('esx_celldoors:update', i, Config.DoorList[i].locked) -- Broadcast new state of the door to everyone
					else
						ESX.ShowNotification(_U('not_cop'))
					end
				end
			else
				FreezeEntityPosition(closeDoor, Config.DoorList[i].locked)
			end
		end
	end
end)


RegisterNetEvent('esx_celldoors:state')
AddEventHandler('esx_celldoors:state', function(id, isLocked)
	if id ~= nil and type(Config.DoorList[id]) ~= nil ~= nil then -- Check if door exists
		Config.DoorList[id].locked = isLocked -- Change state of door
	end
end)
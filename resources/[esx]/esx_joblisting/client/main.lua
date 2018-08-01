local Keys = {
	["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}

local menuIsShowed 				 = false
local hasAlreadyEnteredMarker 	 = false
local lastZone 					 = nil
local isInJoblistingMarker 		 = false

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function ShowJobListingMenu(data)
	ESX.TriggerServerCallback('esx_joblisting:getJobsList', function(data)
		local elements = {}
		for i = 1, #data, 1 do
			table.insert(
				elements,
				{label = data[i].label, value = data[i].value}
			)
		end

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'joblisting',
		{
			title    = _U('job_center'),
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			TriggerServerEvent('esx_joblisting:setJob', data.current.value)
			ESX.ShowNotification(_U('new_job'))
			menu.close()
		end, function(data, menu)
			menu.close()
		end)

	end)
end

function ShowSecondJobListingMenu(data)
	ESX.TriggerServerCallback('esx_joblisting:getSecondJobsList', function(data)
		local elements = {}
		for i = 1, #data, 1 do
			table.insert(
				elements,
				{label = data[i].label, value = data[i].value}
			)
		end

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'joblisting',
			{
				title    = _U('job_center'),
				elements = elements
			},
			function(data, menu)
				TriggerServerEvent('esx_joblisting:setSecondJob', data.current.value)
				ESX.ShowNotification(_U('new_second_job'))
				menu.close()
			end,
			function(data, menu)
				menu.close()
			end
		)

	end)
end

AddEventHandler('esx_joblisting:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		for i=1, #Config.Zones, 1 do
			if(GetDistanceBetweenCoords(coords, Config.Zones[i].x, Config.Zones[i].y, Config.Zones[i].z, true) < Config.DrawDistance) then
				DrawMarker(Config.MarkerType, Config.Zones[i].x, Config.Zones[i].y, Config.Zones[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
			end
		end
	end
end)

-- Activate menu when player is inside marker
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords      = GetEntityCoords(GetPlayerPed(-1))
		isInJoblistingMarker  = false
		isInSecondJoblistingMarker  = false
		local currentZone = nil
		for i=1, #Config.Zones, 1 do
			if(GetDistanceBetweenCoords(coords, Config.Zones[i].x, Config.Zones[i].y, Config.Zones[i].z, true) < Config.ZoneSize.x / 2 and Config.Zones[i].job == 1) then
				isInJoblistingMarker = true
				SetTextComponentFormat('STRING')
            	AddTextComponentString(_U('access_job_center'))
            	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
        	elseif(GetDistanceBetweenCoords(coords, Config.Zones[i].x, Config.Zones[i].y, Config.Zones[i].z, true) < Config.ZoneSize.x / 2 and Config.Zones[i].job == 2) then
				isInSecondJoblistingMarker = true
				SetTextComponentFormat('STRING')
            	AddTextComponentString(_U('access_second_job_center'))
            	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			end
		end
		if (isInJoblistingMarker or isInSecondJoblistingMarker) and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
		end
		if not (isInJoblistingMarker or isInSecondJoblistingMarker) and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('esx_joblisting:hasExitedMarker')
		end
	end
end)

-- Create blips
Citizen.CreateThread(function()
	for i=1, #Config.Zones, 1 do
		if Config.Zones[i].job == 1 then
			local blip = AddBlipForCoord(Config.Zones[i].x, Config.Zones[i].y, Config.Zones[i].z)
			SetBlipSprite (blip, 407)
			SetBlipDisplay(blip, 4)
			SetBlipScale  (blip, 1.2)
			SetBlipColour (blip, 27)
			SetBlipAsShortRange(blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(_U('job_center'))
			EndTextCommandSetBlipName(blip)
		end
	end
end)

-- Menu Controls
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsControlJustReleased(0, Keys['E']) and isInJoblistingMarker and not menuIsShowed then
			ShowJobListingMenu()
		end
		if IsControlJustReleased(0, Keys['E']) and isInSecondJoblistingMarker and not menuIsShowed then
			ShowSecondJobListingMenu()
		end
	end
end)

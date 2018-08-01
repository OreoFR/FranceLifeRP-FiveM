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

local PID          = 0
local GUI          = {}
GUI.ControlsShowed = false
GUI.Time           = 0
local percent	   = nil

local hasAlreadyEnteredMarker = false;
local lastZone                = nil;

function Notification(message)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(message)
	DrawNotification(0,1)
end

RegisterNetEvent('esx_moneywash:showNotification')
AddEventHandler('esx_moneywash:showNotification', function(notify)
	Notification(notify)
end)

AddEventHandler('playerSpawned', function(spawn)
	PID = GetPlayerServerId(PlayerId())
end)

AddEventHandler('esx_moneywash:hasEnteredMarker', function(zone)

	GUI.ControlsShowed = true

	SendNUIMessage({
		showControls = true,
		message      = 'Blanchir argent'
	})

end)

AddEventHandler('esx_moneywash:hasExitedMarker', function(zone)

	GUI.ControlsShowed = false

	SendNUIMessage({
		showControls = false
	})

	TriggerServerEvent('esx_moneywash:stopWash')

end)


Citizen.CreateThread(function()
	while true do

			Wait(0)
			
			local coords      = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker  = false
			local currentZone = nil

			for k,v in pairs(Config.Zones) do
				if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.MarkerSize.x / 2) then
					isInMarker  = true
					currentZone = k
					percent     = v.percent
				end
			end

			if isInMarker and not hasAlreadyEnteredMarker then
				hasAlreadyEnteredMarker = true
				lastZone                = currentZone
				

				TriggerEvent('esx_moneywash:hasEnteredMarker', currentZone)
				
			end

			if not isInMarker and hasAlreadyEnteredMarker then
				hasAlreadyEnteredMarker = false
				TriggerEvent('esx_moneywash:hasExitedMarker', lastZone)
			end
		end
	
end)

-- Menu interactions
Citizen.CreateThread(function()
	while true do

  	Wait(0)

  	if GUI.ControlsShowed and IsControlPressed(0, Keys['ENTER']) and (GetGameTimer() - GUI.Time) > 1000 then

  		heure=tonumber(GetClockHours())
		
		
		
				SendNUIMessage({
					showControls = false
				})

	  		GUI.ControlsShowed = false
		  	GUI.Time           = GetGameTimer()
		if heure > Config.openHours and heure < Config.closeHours then	
			TriggerServerEvent('esx_moneywash:startWash', percent)
		else
			TriggerServerEvent('esx_moneywash:pasLa')
		end
    end

  end
end)

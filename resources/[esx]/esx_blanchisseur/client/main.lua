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

ESX                           = nil
local GUI					  = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil
GUI.Time           			  = 0
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent("esx_blanchisseur:notify")
AddEventHandler("esx_blanchisseur:notify", function(icon, type, sender, title, text)
    Citizen.CreateThread(function()
		Wait(1)
		SetNotificationTextEntry("STRING");
		AddTextComponentString(text);
		SetNotificationMessage(icon, icon, true, type, sender, title, text);
		DrawNotification(false, true);
    end)
end)

function OpenBlanchisseurMenu()

  local elements = { }
	  table.insert(elements, {label = _U('wash'),    value = 'wash_money'})

	ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'whitening',
      {
        title    = _U('Notification'),
        align    = 'top-left',
        elements = elements,
        },

        function(data, menu)
		
		if data.current.value == 'wash_money' then

			ESX.UI.Menu.Open(
				'dialog', GetCurrentResourceName(), 'wash_money_amount_',
				{
					title = _U('wash_money_amount')
				},
				function(data, menu)

					local amount = tonumber(data.value)

					if amount == nil then
						TriggerEvent("esx_blanchisseur:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('invalid_amount'))
						ESX.UI.Menu.CloseAll()
					else
						menu.close()
						TriggerServerEvent('esx_blanchisseur:washMoney', amount)
						ESX.UI.Menu.CloseAll()
					end

				end,
				function(data, menu)
					menu.close()
				end
			)

			end
    end,
    function(data, menu)

      menu.close()

      CurrentAction     = 'whitening'
      CurrentActionData = { }
    end
    )

end

AddEventHandler('esx_blanchisseur:hasEnteredMarker', function(zone)
	CurrentAction     = 'whitening'
	CurrentActionMsg  = _U('press_menu')
	CurrentActionData = {zone = zone}
end)

AddEventHandler('esx_blanchisseur:hasExitedMarker', function(zone)
	CurrentAction = nil
	TriggerServerEvent('esx_blanchisseur:stopWhitening')
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
		
		if isInMarker and not HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = true
			TriggerEvent('esx_blanchisseur:hasEnteredMarker', currentZone)
		end
		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_blanchisseur:hasExitedMarker', LastZone)
		end
	end
end)

-- Create Blips
if Config.Blip then
	Citizen.CreateThread(function ()
		for k,v in ipairs(Config.Zones)do
			local blip = AddBlipForCoord(v.x, v.y, v.z)
			SetBlipSprite (blip, 134)
			SetBlipDisplay(blip, 4)
			SetBlipScale  (blip, 1.0)
			SetBlipColour (blip, 5)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName('STRING')
			AddTextComponentString(_U('blanchisseurblip'))
			EndTextCommandSetBlipName(blip)
		end
	end)
end

-- Key Controls
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if CurrentAction ~= nil then

      SetTextComponentFormat('STRING')
      AddTextComponentString(CurrentActionMsg)
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)

      if IsControlJustReleased(0, 38) and (GetGameTimer() - GUI.Time) > 1000 then
		heure		= tonumber(GetClockHours())
		GUI.Time 	= GetGameTimer()
		
        if CurrentAction == 'whitening' then
			if Config.Hours then
				if heure > Config.openHours and heure < Config.closeHours then
					if Config.Menu then	
						OpenBlanchisseurMenu()
					else
						TriggerServerEvent('esx_blanchisseur:startWhitening', percent)
					end					
				else
					TriggerServerEvent('esx_blanchisseur:Nothere')
				end
			else
				if Config.Menu then	
					OpenBlanchisseurMenu()
				else
					TriggerServerEvent('esx_blanchisseur:startWhitening', percent)
				end					
			end
        end

        CurrentAction = nil
      end

    end
  end
end)
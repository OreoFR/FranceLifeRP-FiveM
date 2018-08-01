ESX                           = nil
local GUI					  = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil
GUI.Time           			  = 0
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local times 				  = 0
local blipillegal 			  = {}
local randomnumber 			  = 0
local count					  = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent("esx_infoillegal:notify")
AddEventHandler("esx_infoillegal:notify", function(icon, type, sender, title, text)
    Citizen.CreateThread(function()
		Wait(1)
		SetNotificationTextEntry("STRING");
		AddTextComponentString(text);
		SetNotificationMessage(icon, icon, true, type, sender, title, text);
		DrawNotification(false, true);
    end)
end)


function OpenInfoIllegalMenu()

  local elements = { }
	  table.insert(elements, {label = _U('weed') .. Config.PriceWeedF .. _U('weed1'),    value = 'weed'})
	  table.insert(elements, {label = _U('tweed') .. Config.PriceWeedT .. _U('tweed1'),    value = 'tweed'})
	  table.insert(elements, {label = _U('rweed') .. Config.PriceWeedR .. _U('rweed1'),    value = 'rweed'})
	  table.insert(elements, {label = _U('opium') .. Config.PriceOpiumF .. _U('opium1'),    value = 'opium'})
	  table.insert(elements, {label = _U('topium') .. Config.PriceOpiumT .. _U('topium1'),    value = 'topium'})
	  table.insert(elements, {label = _U('ropium') .. Config.PriceOpiumR .. _U('ropium1'),    value = 'ropium'})
	  table.insert(elements, {label = _U('coke') .. Config.PriceCokeF .. _U('coke1'),    value = 'coke'})
	  table.insert(elements, {label = _U('tcoke') .. Config.PriceCokeT .. _U('tcoke1'),    value = 'tcoke'})
	  table.insert(elements, {label = _U('rcoke') .. Config.PriceCokeR .. _U('rcoke1'),    value = 'rcoke'})
	  table.insert(elements, {label = _U('meth') .. Config.PriceMethF .. _U('meth1'),    value = 'meth'})
	  table.insert(elements, {label = _U('tmeth') .. Config.PriceMethT .. _U('tmeth1'),    value = 'tmeth'})
	  table.insert(elements, {label = _U('rmeth') .. Config.PriceMethR .. _U('rmeth1'),    value = 'rmeth'})

  ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'info',
      {
        title    = _U('info'),
        align    = 'top-left',
        elements = elements,
        },

        function(data, menu)

        if data.current.value == 'weed' then
           TriggerServerEvent("esx_infoillegal:Weed")
		   ESX.UI.Menu.CloseAll()
        end
		
		if data.current.value == 'tweed' then
           TriggerServerEvent("esx_infoillegal:TWeed")
		   ESX.UI.Menu.CloseAll()
        end
		if data.current.value == 'rweed' then
           TriggerServerEvent("esx_infoillegal:RWeed")
		   ESX.UI.Menu.CloseAll()
        end
		
		if data.current.value == 'opium' then
           TriggerServerEvent("esx_infoillegal:Opium")
		   ESX.UI.Menu.CloseAll()
        end
		
		if data.current.value == 'topium' then
           TriggerServerEvent("esx_infoillegal:TOpium")
		   ESX.UI.Menu.CloseAll()
        end
		if data.current.value == 'ropium' then
           TriggerServerEvent("esx_infoillegal:ROpium")
		   ESX.UI.Menu.CloseAll()
        end
		
		if data.current.value == 'coke' then
           TriggerServerEvent("esx_infoillegal:Coke")
		   ESX.UI.Menu.CloseAll()
        end
		
		if data.current.value == 'tcoke' then
           TriggerServerEvent("esx_infoillegal:TCoke")
		   ESX.UI.Menu.CloseAll()
        end
		if data.current.value == 'rcoke' then
           TriggerServerEvent("esx_infoillegal:RCoke")
		   ESX.UI.Menu.CloseAll()
        end
		
		if data.current.value == 'meth' then
           TriggerServerEvent("esx_infoillegal:Meth")
		   ESX.UI.Menu.CloseAll()
        end
		
		if data.current.value == 'tmeth' then
           TriggerServerEvent("esx_infoillegal:TMeth")
		   ESX.UI.Menu.CloseAll()
        end
		if data.current.value == 'rmeth' then
           TriggerServerEvent("esx_infoillegal:RMeth")
		   ESX.UI.Menu.CloseAll()
        end

      CurrentAction     = 'menu_info_illegal'
      CurrentActionData = {}

    end,
    function(data, menu)

      menu.close()

      CurrentAction     = 'menu_info_illegal'
      CurrentActionData = {}
    end
    )

end

RegisterNetEvent("esx_infoillegal:WeedFarm")
AddEventHandler("esx_infoillegal:WeedFarm", function()
	if Config.GPS then
		x, y, z = Config.WeedFarm.x, Config.WeedFarm.y, Config.WeedFarm.z
		SetNewWaypoint(x, y, z)
		local source = GetPlayerServerId();
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('GPS'))
	else
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('RecWeed'))
	end
end)

RegisterNetEvent("esx_infoillegal:WeedTreatment")
AddEventHandler("esx_infoillegal:WeedTreatment", function()
	if Config.GPS then
		x, y, z = Config.WeedTreatment.x, Config.WeedTreatment.y, Config.WeedTreatment.z
		SetNewWaypoint(x, y, z)
		local source = GetPlayerServerId();
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('GPS'))
	else
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('TraiWeed1'))
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('TraiWeed'))
	end
end)

RegisterNetEvent("esx_infoillegal:WeedResell")
AddEventHandler("esx_infoillegal:WeedResell", function()
	if Config.GPS then
		x, y, z = Config.WeedResell.x, Config.WeedResell.y, Config.WeedResell.z
		SetNewWaypoint(x, y, z)
		local source = GetPlayerServerId();
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('GPS'))
	else
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('RevWeed1'))
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('RevWeed'))
	end
end)

RegisterNetEvent("esx_infoillegal:OpiumFarm")
AddEventHandler("esx_infoillegal:OpiumFarm", function()
	if Config.GPS then
		x, y, z = Config.OpiumFarm.x, Config.OpiumFarm.y, Config.OpiumFarm.z
		SetNewWaypoint(x, y, z)
		local source = GetPlayerServerId();
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('GPS'))
	else
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('RecOpium'))
	end
end)

RegisterNetEvent("esx_infoillegal:OpiumTreatment")
AddEventHandler("esx_infoillegal:OpiumTreatment", function()
	if Config.GPS then
		x, y, z = Config.OpiumTreatment.x, Config.OpiumTreatment.y, Config.OpiumTreatment.z
		SetNewWaypoint(x, y, z)
		local source = GetPlayerServerId();
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('GPS'))
	else
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('TraiOpium1'))
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('TraiOpium'))
	end
end)

RegisterNetEvent("esx_infoillegal:OpiumResell")
AddEventHandler("esx_infoillegal:OpiumResell", function()
	if Config.GPS then
		x, y, z = Config.OpiumResell.x, Config.OpiumResell.y, Config.OpiumResell.z
		SetNewWaypoint(x, y, z)
		local source = GetPlayerServerId();
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('GPS'))
	else
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('RevOpium1'))
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('RevOpium'))
	end
end)

RegisterNetEvent("esx_infoillegal:CokeFarm")
AddEventHandler("esx_infoillegal:CokeFarm", function()
	if Config.GPS then
		x, y, z = Config.CokeFarm.x, Config.CokeFarm.y, Config.CokeFarm.z
		SetNewWaypoint(x, y, z)
		local source = GetPlayerServerId();
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('GPS'))
	else
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('RecCoke'))
	end
end)

RegisterNetEvent("esx_infoillegal:CokeTreatment")
AddEventHandler("esx_infoillegal:CokeTreatment", function()
	if Config.GPS then
		x, y, z = Config.CokeTreatment.x, Config.CokeTreatment.y, Config.CokeTreatment.z
		SetNewWaypoint(x, y, z)
		local source = GetPlayerServerId();
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('GPS'))
	else
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('TraiCoke1'))
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('TraiCoke'))
	end
end)

RegisterNetEvent("esx_infoillegal:CokeResell")
AddEventHandler("esx_infoillegal:CokeResell", function()
	if Config.GPS then
		x, y, z = Config.CokeResell.x, Config.CokeResell.y, Config.CokeResell.z
		SetNewWaypoint(x, y, z)
		local source = GetPlayerServerId();
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('GPS'))
	else
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('RevCoke1'))
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('RevCoke'))
	end
end)

RegisterNetEvent("esx_infoillegal:MethFarm")
AddEventHandler("esx_infoillegal:MethFarm", function()
	if Config.GPS then
		x, y, z = Config.MethFarm.x, Config.MethFarm.y, Config.MethFarm.z
		SetNewWaypoint(x, y, z)
		local source = GetPlayerServerId();
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('GPS'))
	else
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('RecMeth'))
	end
end)

RegisterNetEvent("esx_infoillegal:MethTreatment")
AddEventHandler("esx_infoillegal:MethTreatment", function()
	if Config.GPS then
		x, y, z = Config.MethTreatment.x, Config.MethTreatment.y, Config.MethTreatment.z
		SetNewWaypoint(x, y, z)
		local source = GetPlayerServerId();
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('GPS'))
	else
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('TraiMeth1'))
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('TraiMeth'))
	end
end)

RegisterNetEvent("esx_infoillegal:MethResell")
AddEventHandler("esx_infoillegal:MethResell", function()
	if Config.GPS then
		x, y, z = Config.MethResell.x, Config.MethResell.y, Config.MethResell.z
		SetNewWaypoint(x, y, z)
		local source = GetPlayerServerId();
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('GPS'))
	else
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('RevMeth1'))
		TriggerEvent("esx_infoillegal:notify", "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('RevMeth'))
	end
end)

AddEventHandler('esx_infoillegal:hasEnteredMarker', function(zone)
	CurrentAction     = 'menu_info_illegal'
	CurrentActionMsg  = _U('press_menu')
	CurrentActionData = {zone = zone}
end)

AddEventHandler('esx_infoillegal:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)


-- Create Blips

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		heure = tonumber(GetClockHours())
		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		local currentZone = nil

		
		if Config.Hours then
			
			if heure > Config.openHours and heure < Config.closeHours then	
				if Config.Blip then
					if times == 0 then
					count = 0
						for k,v in pairs(Config.Zones) do
							count = count + 1
						end
					randomnumber = math.random(1,count)
						for k,v in pairs(Config.Zones)do
							if k == randomnumber then
								blipillegal[k] = AddBlipForCoord(v.x, v.y, v.z)
								SetBlipSprite (blipillegal[k], 133)
								SetBlipDisplay(blipillegal[k], 4)
								SetBlipScale  (blipillegal[k], 1.0)
								SetBlipColour (blipillegal[k], 5)
								SetBlipAsShortRange(blipillegal[k], true)

								BeginTextCommandSetBlipName('STRING')
								AddTextComponentString(_U('illegalblip'))
								EndTextCommandSetBlipName(blipillegal[k])
							end
						end
						times = 1
					end
				end
			else
				if times == 1 then
					for k, v in pairs(Config.Zones) do
						RemoveBlip(blipillegal[k])
					
					end
					times = 0
				end
			end
		else
			if times == 0 then
				for k,v in pairs(Config.Zones)do
					blipillegal[k] = AddBlipForCoord(v.x, v.y, v.z)
					SetBlipSprite (blipillegal[k], 133)
					SetBlipDisplay(blipillegal[k], 4)
					SetBlipScale  (blipillegal[k], 1.0)
					SetBlipColour (blipillegal[k], 5)
					SetBlipAsShortRange(blipillegal[k], true)

					BeginTextCommandSetBlipName('STRING')
					AddTextComponentString(_U('illegalblip'))
					EndTextCommandSetBlipName(blipillegal[k])
				end
				times = 1
			end
		end
		
		-- Enter / Exit marker events
			for k,v in pairs(Config.Zones) do
				if k == randomnumber then
					if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.MarkerSize.x / 2) then
						isInMarker  = true
						currentZone = k
					end
				end
			end
		
		if isInMarker and not HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = true
			TriggerEvent('esx_infoillegal:hasEnteredMarker', currentZone)
		end
		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_infoillegal:hasExitedMarker', LastZone)
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if CurrentAction ~= nil then
		heure	= tonumber(GetClockHours())
		if heure > Config.openHours and heure < Config.closeHours then
		  SetTextComponentFormat('STRING')
		  AddTextComponentString(CurrentActionMsg)
		  DisplayHelpTextFromStringLabel(0, 0, 1, -1)

			if IsControlJustReleased(0, 38) and (GetGameTimer() - GUI.Time) > 1000 then
				heure		= tonumber(GetClockHours())
				GUI.Time 	= GetGameTimer()
				
				if CurrentAction == 'menu_info_illegal' then
					if Config.Hours then
						if heure > Config.openHours and heure < Config.closeHours then	
							OpenInfoIllegalMenu()
						else
							TriggerServerEvent('esx_infoillegal:Nothere')
						end
					else
						OpenInfoIllegalMenu()
					end
				end
				CurrentAction = nil
			end
		end
    end
  end
end)

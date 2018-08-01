local Keys = {
	["F6"] = 167, 
	["E"] = 38
}

ESX                           = nil
local PlayerData              = {}
local GUI                     = {}
GUI.Time                      = 0
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

--{label = 'Caméra TV', 			value = 'prop_tv_cam_02'},
--{label = 'Caméra épaule',       value = 'prop_v_cam_01'},
function OpenGearsMenu()
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'reporter_gears',
		{
			title    = 'Matériel',
			elements = {
			    {label = 'Caméra TV', 			value = 'prop_tv_cam_02'},
                {label = 'Caméra épaule',       value = 'prop_v_cam_01'},
		  		{label = 'Fond Vert', 			value = 'prop_ld_greenscreen_01'},
		  		{label = 'Lumières', 			value = 'prop_worklight_03b'},
		  		{label = 'Micro pied', 			value = 'v_ilev_fos_mic'},
		  		{label = 'Pupitre', 			value = 'prop_parkingpay'},
		  		{label = 'Ranger matériel',     value = 'clean'}
			}
		},
		function(data, menu)
			if data.current.value ~= 'clean' then
				TriggerEvent('esx:spawnObject', data.current.value)
				menu.close()
			else
				local obj, dist = ESX.Game.GetClosestObject({'prop_ld_greenscreen_01', 'prop_worklight_03b', 'v_ilev_fos_mic', 'prop_parkingpay', 'prop_tv_cam_02', 'prop_v_cam_01'})
				if dist < 3.0 then
					DeleteEntity(obj)
				else
					ESX.ShowNotification('Vous êtes trop éloigné de votre matériel pour le ranger.')
				end
			end

		end,
		function(data, menu)
			ESX.UI.Menu.CloseAll()
			OpenMobileReporterActionsMenu()
		end
	)
end

function OpenMobileReporterActionsMenu()

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'reporter_actions',
		{
			title    = 'Journaliste',
			elements = {
		  		{label = 'Diffuser une news', 	value = 'broadcast_news'},
		  		{label = 'Matériel', 			value = 'gears'},
		  		{label = 'Facturation',       	value = 'billing'},
		  		{label = 'Vendre Abonnement', 	value = 'sell'},
		  		{label = 'Annuler Abonnement',  value = 'cancel'}
			}
		},
		function(data, menu)

			if data.current.value == 'gears' then
				OpenGearsMenu()
			end

			if data.current.value == 'broadcast_news' then

				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'broadcast_new_text',
					{
						title = 'Texte de la news',
					},
					function(data, menu)
						TriggerServerEvent('esx_reporter:broadcastNews', data.value)
						menu.close()
					end,
					function(data, menu)
						menu.close()
					end
				)

			end

			if data.current.value == 'billing' then

				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'billing',
					{
						title = 'Montant de la facture'
					},
					function(data, menu)

						local amount = tonumber(data.value)

						if amount == nil then
							ESX.ShowNotification('Montant invalide')
						else
							
							menu.close()
							
							local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

							if closestPlayer == -1 or closestDistance > 3.0 then
								ESX.ShowNotification('Aucun joueur à proximité')
							else
								TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_reporter', 'Journaliste', amount)
							end

						end

					end,
					function(data, menu)
						menu.close()
					end
				)

			end

			if data.current.value == 'sell' then				

				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'sub',
					{
						title    = 'Abonnements',
						elements = {
					  		{label = 'Abonnement Lecteur', 			value = 1},
					  		{label = 'Abonnement Lecteur +',    	value = 2},
					  		{label = 'Abonnement Lecteur Premium', 	value = 3}
						}
					},
					function(data, menu)
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

						if closestPlayer == -1 or closestDistance > 3.0 then
							ESX.ShowNotification('Vous êtes trop éloigné du client.')
						else
							TriggerServerEvent('esx_reporter:sell', GetPlayerServerId(closestPlayer), data.current.value)
							menu.close()
						end

					end,
					function(data, menu)
						menu.close()
					end
				)
				
			end

			if data.current.value == 'cancel' then
				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

				if closestPlayer == -1 or closestDistance > 3.0 then
					ESX.ShowNotification('Vous êtes trop éloigné du client.')
				else
					TriggerServerEvent('esx_reporter:cancel', GetPlayerServerId(closestPlayer))
				end
			end

		end,
		function(data, menu)
			menu.close()
		end
	)

end

function OpenReporterActionsMenu()

	local elements = {
		{label = 'Diffuser une news', value = 'broadcast_news'}
	}
	if PlayerData.job ~= nil and PlayerData.job.grade_name == 'boss' then
  		table.insert(elements, {label = 'Retirer argent société', value = 'withdraw_society_money'})
  		table.insert(elements, {label = 'Déposer argent ',        value = 'deposit_money'})
  		table.insert(elements, {label = 'Blanchir argent',        value = 'wash_money'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'reporter_actions',
		{
			title    = 'Journaliste',
			elements = elements
		},
		function(data, menu)

			if data.current.value == 'broadcast_news' then

				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'broadcast_new_text',
					{
						title = 'Texte de la news',
					},
					function(data2, menu2)
						TriggerServerEvent('esx_reporter:broadcastNews', data2.value)
						menu2.close()
					end,
					function(data2, menu2)
						menu2.close()
					end
				)

			end

			if data.current.value == 'withdraw_society_money' then
				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'withdraw_society_money_amount',
					{
						title = 'Montant du retrait'
					},
					function(data, menu)
						local amount = tonumber(data.value)
						if amount == nil then
							ESX.ShowNotification('Montant invalide')
						else
							menu.close()
							TriggerServerEvent('esx_society:withdrawMoney', 'society_reporter', amount)
						end
					end,
					function(data, menu)
						menu.close()
					end
				)
			end

			if data.current.value == 'deposit_money' then
				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'deposit_money_amount',
					{
						title = 'Montant du dépôt'
					},
					function(data, menu)
						local amount = tonumber(data.value)
						if amount == nil then
							ESX.ShowNotification('Montant invalide')
						else
							menu.close()
							TriggerServerEvent('esx_society:depositMoney', 'society_reporter', amount)
						end
					end,
					function(data, menu)
						menu.close()
					end
				)
			end

			if data.current.value == 'wash_money' then
				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'wash_money_amount',
					{
						title = 'Montant à blanchir'
					},
					function(data, menu)
						local amount = tonumber(data.value)
						if amount == nil then
							ESX.ShowNotification('Montant invalide')
						else
							menu.close()
							TriggerServerEvent('esx_society:washMoney', 'society_reporter', amount)
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
			CurrentAction     = 'reporter_actions_menu'
			CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour accéder au menu.'
			CurrentActionData = {}
		end
	)
end

function OpenReporterReceptionMenu()

	local elements = {
		{label = 'Sortir Camionette Weazel', 	value = 'speedo'},
		{label = 'Sortir Camionette', 			value = 'rumpo'},
		{label = 'Sortir Hélicoptère', 	value = 'buzzard2'}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'reporter_reception',
		{
			title    = 'Garage',
			elements = elements
		},
		function(data, menu)
			local playerPed = GetPlayerPed(-1)
			if data.current.value == 'rumpo' or data.current.value == 'bjxl' or data.current.value == 'tourbus' then
				ESX.Game.SpawnVehicle(data.current.value, Config.Zones.Camionette.Pos, 200.0, function(vehicle)
					TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
				end)
			elseif data.current.value == 'buzzard2' then
				ESX.Game.SpawnVehicle(data.current.value, Config.Zones.Helico.Pos, 180.0, function(vehicle)
					TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
				end)
			end
			ESX.UI.Menu.CloseAll()
		end,
		function(data, menu)
			menu.close()
			CurrentAction     = 'reporter_reception_menu'
			CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour accéder au menu.'
			CurrentActionData = {}
		end
	)
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
    TriggerServerEvent("player:serviceOn", "reporter")
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

RegisterNetEvent('esx_reporter:addNews')
AddEventHandler('esx_reporter:addNews', function(text)
	SendNUIMessage({
		addNews = true,
		text    = text
	})
end)

AddEventHandler('esx_reporter:hasEnteredMarker', function(zone)

	if zone == 'ReporterActions' then
		CurrentAction     = 'reporter_actions_menu'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour accéder au menu.'
		CurrentActionData = {}
	end

	if zone == 'ReporterReception' then
		CurrentAction     = 'reporter_reception_menu'
		CurrentActionMsg  = 'Appuyez sur ~INPUT_CONTEXT~ pour accéder au menu.'
		CurrentActionData = {}
	end

	if zone == 'FromInGoRoof' then
		ESX.Game.Teleport(GetPlayerPed(-1),  Config.Zones.Roof.Pos)
	end

	if zone == 'FromRoofGoIn' then
		ESX.Game.Teleport(GetPlayerPed(-1),  Config.Zones.In.Pos)
	end

end)

AddEventHandler('esx_reporter:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)

	local specialContact = {
		name       = 'TF1',
		number     = 'reporter',
		base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAbgAAAG4CAMAAAAAFAKBAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA99pVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJ1dWlkOjVEMjA4OTI0OTNCRkRCMTE5MTRBODU5MEQzMTUwOEM4IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkQyQzc0QTlBRjFCRDExRTJBREMyQjZFNEY3RDNFRkMyIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkQyQzc0QTk5RjFCRDExRTJBREMyQjZFNEY3RDNFRkMyIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIElsbHVzdHJhdG9yIENTNSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjAwRjY4QkVBRUEyMDY4MTE4QzE0QzBBMUY1NEE0OTAzIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjAwRjY4QkVBRUEyMDY4MTE4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'
	}

	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)

end)

-- Create Blips
Citizen.CreateThread(function()		
	local blip = AddBlipForCoord(Config.Zones.ReporterReception.Pos.x, Config.Zones.ReporterReception.Pos.y, Config.Zones.ReporterReception.Pos.z)
	SetBlipSprite (blip, 184)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 1.0)
	SetBlipColour (blip, 1)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("LifeInvader News")
	EndTextCommandSetBlipName(blip)
end)


-- Display markers
Citizen.CreateThread(function()
	while true do
		
		Wait(0)

		local coords = GetEntityCoords(GetPlayerPed(-1))
		
		for k,v in pairs(Config.Zones) do
			if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
				DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
			end
		end

	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		
		Wait(0)

		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		local currentZone = nil

		for k,v in pairs(Config.Zones) do
			if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
				isInMarker  = true
				currentZone = k
			end
		end

		if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
			HasAlreadyEnteredMarker = true
			LastZone                = currentZone
			TriggerEvent('esx_reporter:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_reporter:hasExitedMarker', LastZone)
		end

	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		if CurrentAction ~= nil then

			SetTextComponentFormat('STRING')
			AddTextComponentString(CurrentActionMsg)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)

			if IsControlPressed(0,  Keys['E']) and PlayerData.job ~= nil and PlayerData.job.name == 'reporter' and (GetGameTimer() - GUI.Time) > 300 then
				
				if CurrentAction == 'reporter_actions_menu' then
					OpenReporterActionsMenu()
				end

				if CurrentAction == 'reporter_reception_menu' then
					OpenReporterReceptionMenu()
				end

				CurrentAction = nil
				GUI.Time      = GetGameTimer()
				
			end

		end

		if IsControlPressed(0,  Keys['F6']) and PlayerData.job ~= nil and PlayerData.job.name == 'reporter' and (GetGameTimer() - GUI.Time) > 150 then
			OpenMobileReporterActionsMenu()
			GUI.Time = GetGameTimer()
		end

	end
end)
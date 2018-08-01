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
ESX                             = nil
local PlayerData                = {}
local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}
local OnJob                     = false
local inService               = false
local onDuty = false
local Blips                   = {}


PLATE = "xxxx"

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end
end)

function OpenpompisteActionsMenu()

	local elements = {
		{label = _U('vehicle_list'), 	value = 'vehicle_list'},
		{label = _U('job_clothes'), 	value = 'cloakroom'},
		{label = _U('civil'), 			value = 'cloakroom2'}
	}

	if PlayerData.job ~= nil and PlayerData.job.grade_name == 'boss' then
  		table.insert(elements, {label = _U('boss_actions'), value = 'boss_actions'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'pompiste_actions',
		{
			title    = _U('blip_pompiste'),
			elements = elements
		},
		function(data, menu)
			if data.current.value == 'vehicle_list' then
				local elements = {
					{label = 'SUV', value = 'contender'},
					{label = 'Camion', value = 'phantom'},
					{label = 'Remorque', value = 'tanker'}
				}

				ESX.UI.Menu.CloseAll()

				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'spawn_vehicle',
					{
						title    = _U('vehicles'),
						elements = elements
					},
					function(data, menu)
						local playerPed = GetPlayerPed(-1)
						local coords    = Config.Zones.VehicleSpawnPoint.Pos
						local coords2    = Config.Zones.VehicleSpawnPoint2.Pos
						if data.current.value == 'tanker' then
							ESX.Game.SpawnVehicle(data.current.value, coords2, 300.0, function(vehicle)
								if data.current.value == 'tanker' then
									ESX.Game.SetVehicleProperties(vehicle, {plate = "POM2" .. PLATE, health = 1000})
										TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
								end
							end)
						else	
							ESX.Game.SpawnVehicle(data.current.value, coords, 80.0, function(vehicle)
								if data.current.value == 'contender' then
									ESX.Game.SetVehicleProperties(vehicle, {plate = "POM1" .. PLATE, health = 1000})
										TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
								end
								if data.current.value == 'phantom' then
									ESX.Game.SetVehicleProperties(vehicle, {plate = "POM2" .. PLATE, health = 1000})
								end
							end)
						end
						menu.close()
						CurrentAction     = 'pompiste_actions_menu'
						CurrentActionMsg  = _U('pompiste_actions_menu')
						CurrentActionData = {}
					end,
					function(data, menu)
						menu.close()
					end
				)
			end

			if data.current.value == 'cloakroom' then
				ESX.TriggerServerCallback('esx_service:enableService', function(toogle, nb)
				  if toogle == true then
					ESX.ShowNotification("Vous êtes maintenant en service avec " .. nb-1 .. " collègue(s)")
					in_service = true
					onDuty = true
					local playerPed = GetPlayerPed(-1)
					setUniform(data.current.value, playerPed)
					ClearPedBloodDamage(playerPed)
					ResetPedVisibleDamage(playerPed)
					ClearPedLastWeaponDamage(playerPed)
					CreateBlip()
					else
						in_service = false
						ESX.ShowNotification("Vous ne travaillez pas ici")
					end
				  end, 'pompiste')
				  menu.close()
				CurrentAction     = 'pompiste_actions_menu'
				CurrentActionMsg  = _U('pompiste_actions_menu')
				CurrentActionData = {}
			end

			if data.current.value == 'cloakroom2' then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
    				TriggerEvent('skinchanger:loadSkin', skin)   
					in_service = true
					onDuty = true
					CreateBlip()
					TriggerServerEvent('esx_service:disableService', 'pompiste')
				end)
				menu.close()
				CurrentAction     = 'pompiste_actions_menu'
				CurrentActionMsg  = _U('pompiste_actions_menu')
				CurrentActionData = {}
			end

			if data.current.value == 'boss_actions' then

                TriggerEvent('esx_society:openBossMenu', 'pompiste', function(data, menu)
                    menu.close()
					CurrentAction     = 'pompiste_actions_menu'
					CurrentActionMsg  = _U('pompiste_actions_menu')
					CurrentActionData = {}
                end)

            end

		end,
		function(data, menu)
			menu.close()
			CurrentAction     = 'pompiste_actions_menu'
			CurrentActionMsg  = _U('pompiste_actions_menu')
			CurrentActionData = {}
		end
	)
end

RegisterNetEvent('esx_pompiste:refreshMarket')
AddEventHandler('esx_pompiste:refreshMarket', function()
	OpenpompisteMarketMenu()
end)

function setUniform(job, playerPed)
  TriggerEvent('skinchanger:getSkin', function(skin)

    if skin.sex == 0 then
      if Config.Uniforms[job].male ~= nil then
        TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].male)
      end
    else
      if Config.Uniforms[job].female ~= nil then
        TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].female)
      end
    end
  end)
end

function OpenpompisteBilling()
	ESX.UI.Menu.Open(
		'dialog', GetCurrentResourceName(), 'billing',
		{
			title = _U('bill_amount')
		},
		function(data, menu)
			local amount = tonumber(data.value)
			if amount == nil then
				ESX.ShowNotification(_U('invalid_amount'))
			else							
				menu.close()							
				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
				if closestPlayer == -1 or closestDistance > 3.0 then
					ESX.ShowNotification(_U('no_player_nearby'))
				else
					TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_pompiste', 'Pompiste', amount)
				end
			end
		end,
	function(data, menu)
		menu.close()
	end
	)
end

function OpenMobilepompisteActionsMenu()

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'mobile_pompiste_actions',
		{
			title    = _U('blip_pompiste'),
			align    = 'top-left',
			elements = {
				{label = _U('billing'), 	value = 'billing'},
				{label = _U('gears'), 	value = 'gears'},
			}
		},
		function(data, menu)
			if data.current.value == 'billing' then
				OpenpompisteBilling()
			elseif data.current.value == 'gears' then
				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'pompiste_gears',
					{
						title    = _U('gears'),
						align    = 'top-left',
						elements = {
							{label = _U('cone'),     value = 'prop_roadcone02a'},
							{label = _U('barrier'), value = 'prop_barrier_work06a'},
		  					{label = _U('clean'),   value = 'clean'}
						},
					},
					function(data, menu)
						if data.current.value ~= 'clean' then
							local playerPed = GetPlayerPed(-1)							
							local x, y, z   = table.unpack(GetEntityCoords(playerPed))
							local xF = GetEntityForwardX(playerPed) * 1.0
							local yF = GetEntityForwardY(playerPed) * 1.0
							if data.current.value == 'prop_roadcone02a' then
							  z = z
							end

							ESX.Game.SpawnObject(data.current.value, {
								x = x + xF,
								y = y + yF,
								z = z
							}, function(obj)
								-- chairs
								if data.current.value == 'prop_table_03_chr' then
									SetEntityHeading(obj, -GetEntityHeading(playerPed))
								else
									SetEntityHeading(obj, GetEntityHeading(playerPed))
								end
								PlaceObjectOnGroundProperly(obj)
							end)

							menu.close()
						else
							local obj, dist = ESX.Game.GetClosestObject({'prop_roadcone02a', 'prop_barrier_work06a'})
							if dist < 3.0 then
								DeleteEntity(obj)
							else
								ESX.ShowNotification(_U('clean_too_far'))
							end
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
		end
	)
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
	CreateBlip()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	CreateBlip()
end)

AddEventHandler('esx_pompiste:hasEnteredMarker', function(zone)
	Citizen.Trace('zone: ' .. zone)
	if zone == 'Actions' then
		CurrentAction     = 'pompiste_actions_menu'
		CurrentActionMsg  = _U('pompiste_menu')
		CurrentActionData = {}
	end
	if zone == 'VehicleDeleter' then
		local playerPed = GetPlayerPed(-1)
		if IsPedInAnyVehicle(playerPed,  false) then
			CurrentAction     = 'delete_vehicle'
			CurrentActionMsg  = _U('store_veh')
			CurrentActionData = {}
		end
	end
	if zone == 'disti' then
		CurrentAction     = 'pompiste_disti'
		CurrentActionMsg  = _U('pompiste_disti')
		CurrentActionData = {}
	end
	if zone == 'recolte' then
		CurrentAction     = 'pompiste_recolte'
		CurrentActionMsg  = _U('pompiste_recolte')
		CurrentActionData = {}
	end
end)

AddEventHandler('esx_pompiste:hasExitedMarker', function(zone)
	if zone == 'disti' then
		TriggerServerEvent('pompiste:stopDisti')
	end
	if zone == 'recolte' then
		TriggerServerEvent('pompiste:stopReco')
	end
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Wait(10)
		if PlayerData.job ~= nil and PlayerData.job.name == 'pompiste' then

			local coords = GetEntityCoords(GetPlayerPed(-1))

			for k,v in pairs(Config.Zones) do
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
				end
			end
		end
	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Wait(10)
		if PlayerData.job ~= nil and PlayerData.job.name == 'pompiste' then
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
				TriggerEvent('esx_pompiste:hasEnteredMarker', currentZone)
			end
			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_pompiste:hasExitedMarker', LastZone)
			end
		end
	end
end)

AddEventHandler('esx_pompiste:hasEnteredEntityZone', function(entity)

	if PlayerData.job ~= nil and PlayerData.job.name == 'pompiste' then

	end

end)

AddEventHandler('esx_pompiste:hasExitedEntityZone', function(entity)
	CurrentAction = nil
end)

-- Enter / Exit entity zone events
Citizen.CreateThread(function()

	local trackedEntities = {
		'prop_roadcone02a',
		'prop_barrier_work06a'
	}

	while true do

		Citizen.Wait(10)

		local playerPed = GetPlayerPed(-1)
		local coords    = GetEntityCoords(playerPed)

		local closestDistance = -1
		local closestEntity   = nil

		for i=1, #trackedEntities, 1 do

			local object = GetClosestObjectOfType(coords.x,  coords.y,  coords.z,  3.0,  GetHashKey(trackedEntities[i]), false, false, false)

			if DoesEntityExist(object) then

				local objCoords = GetEntityCoords(object)
				local distance  = GetDistanceBetweenCoords(coords.x,  coords.y,  coords.z,  objCoords.x,  objCoords.y,  objCoords.z,  true)

				if closestDistance == -1 or closestDistance > distance then
					closestDistance = distance
					closestEntity   = object
				end

			end

		end

		if closestDistance ~= -1 and closestDistance <= 3.0 then

 			if LastEntity ~= closestEntity then
				TriggerEvent('esx_pompiste:hasEnteredEntityZone', closestEntity)
				LastEntity = closestEntity
			end

		else

			if LastEntity ~= nil then
				TriggerEvent('esx_pompiste:hasExitedEntityZone', LastEntity)
				LastEntity = nil
			end

		end

	end
end)

function SelectHouse()
  local index = GetRandomIntInRange(1, #Config.POMPE)
  for k, v in pairs(Config.Zones) do
    if v.Pos.x == Config.POMPE[index].x and v.Pos.y == Config.POMPE[index].y and v.Pos.z == Config.POMPE[index].z then
      return k
    end
  end
end


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(10)

    if NPCTargetHouse ~= nil then

      local coords = GetEntityCoords(GetPlayerPed(-1))
      local zone = Config.Zones[NPCTargetHouse]

      if GetDistanceBetweenCoords(coords, zone.Pos.x, zone.Pos.y, zone.Pos.z, true) < 3 then

        HelpPromt(_U('pickup'))

        if IsControlJustReleased(1, Keys["E"]) and PlayerData.job ~= nil then
          StopNPCJob()
          Wait(300)
          Done = false
        end
      end
    end
  end
end)

Citizen.CreateThread(function()
  local blippompiste = AddBlipForCoord(Config.Zones.Actions.Pos.x, Config.Zones.Actions.Pos.y, Config.Zones.Actions.Pos.z)
  SetBlipSprite (blippompiste, 415)
  SetBlipDisplay(blippompiste, 4)
  SetBlipScale  (blippompiste, 0.9)
  SetBlipAsShortRange(blippompiste, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Pompiste')
  EndTextCommandSetBlipName(blippompiste)

end)

function CreateBlip()
  if PlayerData.job ~= nil and PlayerData.job.name == 'pompiste' and onDuty then

    BlipVehicle = AddBlipForCoord(Config.Zones.disti.Pos.x, Config.Zones.disti.Pos.y, Config.Zones.disti.Pos.z)
    SetBlipSprite(BlipVehicle, 18)
    SetBlipColour(BlipVehicle, 38)
    SetBlipAsShortRange(BlipVehicle, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Pompiste Distillerie')
    EndTextCommandSetBlipName(BlipVehicle)

    BlipVente = AddBlipForCoord(Config.Zones.recolte.Pos.x, Config.Zones.recolte.Pos.y, Config.Zones.recolte.Pos.z)
    SetBlipSprite(BlipVente, 17)
    SetBlipColour(BlipVente, 38)
    SetBlipAsShortRange(BlipVente, true)
    BeginTextCommandSetBlipName("STRING") 
    AddTextComponentString('Pompiste récolte')
    EndTextCommandSetBlipName(BlipVente)
  else

    if BlipVehicle ~= nil then
      RemoveBlip(BlipVehicle)
      BlipVehicle = nil
    end

    if BlipVente ~= nil then
      RemoveBlip(BlipVente)
      BlipVente = nil
    end
  end
end


function HelpPromt(text)
  Citizen.CreateThread(function()
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, state, 0, - 1)
  end)
end
-- Key Controls
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if CurrentAction ~= nil then
            SetTextComponentFormat('STRING')
            AddTextComponentString(CurrentActionMsg)
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            
            if IsControlJustReleased(0, 38) and PlayerData.job ~= nil and PlayerData.job.name == 'pompiste' then

            	--TriggerServerEvent('esx:clientLog', 'PUSHING E')
                if CurrentAction == 'pompiste_actions_menu' then
                    OpenpompisteActionsMenu()
                elseif CurrentAction == 'delete_vehicle' and onDuty then
                    local playerPed = GetPlayerPed(-1)
                    local vehicle   = GetVehiclePedIsIn(playerPed,  false)
                    local hash      = GetEntityModel(vehicle)
                    if hash == GetHashKey('contender') or hash == GetHashKey('phantom') then
                        if Config.MaxInService ~= -1 then
                            TriggerServerEvent('esx_service:disableService', 'pompiste')
                        end
                        DeleteVehicle(vehicle)
                    else
                        ESX.ShowNotification(_U('wrong_veh'))
                    end
				elseif CurrentAction == 'pompiste_disti' and onDuty then
					TriggerServerEvent('pompiste:disti')
				elseif CurrentAction == 'pompiste_recolte' and onDuty then
					TriggerServerEvent('pompiste:recolte')
                end

                CurrentAction = nil

            end
            
        end

        if IsControlJustReleased(0, 166) and PlayerData.job ~= nil and PlayerData.job.name == 'pompiste' and onDuty then
            OpenMobilepompisteActionsMenu()
        end
    end
end)

RegisterNetEvent('plate:setPlate')
AddEventHandler('plate:setPlate', function(a)
    PLATE = a
end)
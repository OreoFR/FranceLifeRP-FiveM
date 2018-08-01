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
local GUI                       = {}
GUI.Time                        = 0
local PlayerData                = {}
local FirstSpawn                = true
local IsDead                    = false
local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}
local RespawnToHospitalMenu     = nil
local OnJob                     = false
local CurrentCustomer           = nil
local CurrentCustomerBlip       = nil
local DestinationBlip           = nil
local IsNearCustomer            = false
local CustomerIsEnteringVehicle = false
local CustomerEnteredVehicle    = false
local TargetCoords              = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function SetVehicleMaxMods(vehicle)

  local props = {
    modEngine       = 3,
    modBrakes       = 3,
    modTransmission = 3,
    modSuspension   = 3,
    modTurbo        = true,
  }

  ESX.Game.SetVehicleProperties(vehicle, props)

end

function DrawSub(msg, time)
  ClearPrints()
  SetTextEntry_2("STRING")
  AddTextComponentString(msg)
  DrawSubtitleTimed(time, 1)
end

function ShowLoadingPromt(msg, time, type)
  Citizen.CreateThread(function()
    Citizen.Wait(0)
    N_0xaba17d7ce615adbf("STRING")
    AddTextComponentString(msg)
    N_0xbd12f8228410d9b4(type)
    Citizen.Wait(time)
    N_0x10d373323e5b9c0d()
  end)
end

function GetRandomWalkingNPC()

  local search = {}
  local peds   = ESX.Game.GetPeds()

  for i=1, #peds, 1 do
    if IsPedHuman(peds[i]) and IsPedWalking(peds[i]) and not IsPedAPlayer(peds[i]) then
      table.insert(search, peds[i])
    end
  end

  if #search > 0 then
    return search[GetRandomIntInRange(1, #search)]
  end

  print('Using fallback code to find walking ped')

  for i=1, 250, 1 do

    local ped = GetRandomPedAtCoord(0.0,  0.0,  0.0,  math.huge + 0.0,  math.huge + 0.0,  math.huge + 0.0,  26)

    if DoesEntityExist(ped) and IsPedHuman(ped) and IsPedWalking(ped) and not IsPedAPlayer(ped) then
      table.insert(search, ped)
    end

  end

  if #search > 0 then
    return search[GetRandomIntInRange(1, #search)]
  end

end

function ClearCurrentMission()

  if DoesBlipExist(CurrentCustomerBlip) then
    RemoveBlip(CurrentCustomerBlip)
  end

  if DoesBlipExist(DestinationBlip) then
    RemoveBlip(DestinationBlip)
  end

  CurrentCustomer           = nil
  CurrentCustomerBlip       = nil
  DestinationBlip           = nil
  IsNearCustomer            = false
  CustomerIsEnteringVehicle = false
  CustomerEnteredVehicle    = false
  TargetCoords              = nil

end

function StartAmbulanceJob()

  ShowLoadingPromt(_U('taking_service') .. 'Ambulance', 5000, 3)
  ClearCurrentMission()

  OnJob = true

end

function StopAmbulanceJob()

  local playerPed = GetPlayerPed(-1)

  if IsPedInAnyVehicle(playerPed, false) and CurrentCustomer ~= nil then
    local vehicle = GetVehiclePedIsIn(playerPed,  false)
    TaskLeaveVehicle(CurrentCustomer,  vehicle,  0)

    if CustomerEnteredVehicle then
      TaskGoStraightToCoord(CurrentCustomer,  TargetCoords.x,  TargetCoords.y,  TargetCoords.z,  1.0,  -1,  0.0,  0.0)
    end

  end

  ClearCurrentMission()

  OnJob = false

  DrawSub(_U('mission_complete'), 5000)

end

function RespawnPed(ped, coords)
  SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
  NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, coords.heading, true, false)
  SetPlayerInvincible(ped, false)
  TriggerEvent('playerSpawned', coords.x, coords.y, coords.z, coords.heading)
  ClearPedBloodDamage(ped)
  if RespawnToHospitalMenu ~= nil then
    RespawnToHospitalMenu.close()
    RespawnToHospitalMenu = nil
  end
  ESX.UI.Menu.CloseAll()
end

RegisterNetEvent('esx_ambulancejob:heal')
AddEventHandler('esx_ambulancejob:heal', function(_type)
    local playerPed = GetPlayerPed(-1)
    local maxHealth = GetEntityMaxHealth(playerPed)
    if _type == 'small' then
        local health = GetEntityHealth(playerPed)
        local newHealth = math.min(maxHealth , math.floor(health + maxHealth/8))
        SetEntityHealth(playerPed, newHealth)
    elseif _type == 'big' then
        SetEntityHealth(playerPed, maxHealth)
    end
    ESX.ShowNotification(_U('healed'))
end)


function StartRespawnToHospitalMenuTimer()
  ESX.SetTimeout(Config.MenuRespawnToHospitalDelay, function()
    if IsDead then
      local elements = {}
      table.insert(elements, {label = _U('yes'), value = 'yes'})
      RespawnToHospitalMenu = ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'menuName',
        {
          title = _U('respawn_at_hospital'),
          align = 'top-left',
          elements = elements
        },
        function(data, menu) --Submit Cb
          menu.close()
          Citizen.CreateThread(function()
                  RemoveItemsAfterRPDeath()
                    end)
        end,
        function(data, menu) --Cancel Cb
          --menu.close()
        end,
        function(data, menu) --Change Cb
          --print(data.current.value)
        end,
        function(data, menu) --Close Cb
          RespawnToHospitalMenu = nil
        end
      )
    end
  end)
end

function StartRespawnTimer()
  ESX.SetTimeout(Config.RespawnDelayAfterRPDeath, function()
    if IsDead then
      RemoveItemsAfterRPDeath()
    end
  end)
end

function ShowTimer()
  local timer = Config.RespawnDelayAfterRPDeath
  Citizen.CreateThread(function()

    while timer > 0 and IsDead do
            Wait(0)

      raw_seconds = timer/1000
      raw_minutes = raw_seconds/60
      minutes = stringsplit(raw_minutes, ".")[1]
      seconds = stringsplit(raw_seconds-(minutes*60), ".")[1]

            SetTextFont(4)
            SetTextProportional(0)
            SetTextScale(0.0, 0.5)
            SetTextColour(255, 255, 255, 255)
            SetTextDropshadow(0, 0, 0, 0, 255)
            SetTextEdge(1, 0, 0, 0, 255)

            SetTextDropShadow()
            SetTextOutline()
            SetTextEntry("STRING")

            local text = _U('please_wait') .. minutes .. _U('minutes') .. seconds .. _U('seconds')

            if Config.EarlyRespawn then
                text = text .. '\n[~b~E~w~]'
            end

            AddTextComponentString(text)
            SetTextCentre(true)
            DrawText(0.5, 0.8)

      if Config.EarlyRespawn then
        if IsControlPressed(0, Keys['E']) then
                    RemoveItemsAfterRPDeath()
                    break
        end
      end
            timer = timer - 15
    end

        if Config.EarlyRespawn then
        while timer <= 0 and IsDead do
          Wait(0)

                SetTextFont(4)
                SetTextProportional(0)
                SetTextScale(0.0, 0.5)
                SetTextColour(255, 255, 255, 255)
                SetTextDropshadow(0, 0, 0, 0, 255)
                SetTextEdge(1, 0, 0, 0, 255)

                SetTextDropShadow()
                SetTextOutline()
                SetTextEntry("STRING")

                AddTextComponentString(_U('press_respawn'))
                SetTextCentre(true)
                DrawText(0.5, 0.8)

          if IsControlPressed(0, Keys['E']) then
            RemoveItemsAfterRPDeath()
                    break
          end
        end
        end

  end)
end

function RemoveItemsAfterRPDeath()
    Citizen.CreateThread(function()
        DoScreenFadeOut(800)
        while not IsScreenFadedOut() do
            Citizen.Wait(0)
        end
        ESX.TriggerServerCallback('esx_ambulancejob:removeItemsAfterRPDeath', function()

            ESX.SetPlayerData('lastPosition', Config.Zones.HospitalInteriorInside1.Pos)
            ESX.SetPlayerData('loadout', {})

            TriggerServerEvent('esx:updateLastPosition', Config.Zones.HospitalInteriorInside1.Pos)

            RespawnPed(GetPlayerPed(-1), Config.Zones.HospitalInteriorInside1.Pos)

            StopScreenEffect('DeathFailOut')
            DoScreenFadeIn(800)
            TriggerEvent('shakeCam', true)
        end)
    end)
end

--------add effect when the player come back after death-----
local time = 0
local shakeEnable = false

RegisterNetEvent('shakeCam')
AddEventHandler('shakeCam', function(status)
	if(status == true)then
		ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", 1.0)
		shakeEnable = true
	elseif(status == false)then
		ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", 0)
		shakeEnable = false
		time = 0
	end
end)

-----Enable/disable the effect by pills
Citizen.CreateThread(function()
	while true do
		Wait(100)
		if(shakeEnable)then
			time = time + 100
			if(time > 5000)then -- 5 seconds
				TriggerEvent('shakeCam', false)
			end
		end
	end
end)


function OnPlayerDeath()
    IsDead = true
    if Config.ShowDeathTimer == true then
        ShowTimer()
    end
    StartRespawnTimer()
    if Config.RespawnToHospitalMenuTimer == true then
        StartRespawnToHospitalMenuTimer()
    end
    StartScreenEffect('DeathFailOut',  0,  false)
end

function TeleportFadeEffect(entity, coords)

  Citizen.CreateThread(function()

    DoScreenFadeOut(800)

    while not IsScreenFadedOut() do
      Citizen.Wait(0)
    end

    ESX.Game.Teleport(entity, coords, function()
      DoScreenFadeIn(800)
    end)

  end)

end

function WarpPedInClosestVehicle(ped)

  local coords = GetEntityCoords(ped)

  local vehicle, distance = ESX.Game.GetClosestVehicle({
    x = coords.x,
    y = coords.y,
    z = coords.z
  })

  if distance ~= -1 and distance <= 5.0 then

    local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
    local freeSeat = nil

    for i=maxSeats - 1, 0, -1 do
      if IsVehicleSeatFree(vehicle, i) then
        freeSeat = i
        break
      end
    end

    if freeSeat ~= nil then
      TaskWarpPedIntoVehicle(ped, vehicle, freeSeat)
    end

  else
  	ESX.ShowNotification(_U('no_vehicles'))
  end

end

function OpenAmbulanceActionsMenu()

  local elements = {
    {label = _U('cloakroom'), value = 'cloakroom'}
  }

  if Config.EnablePlayerManagement and PlayerData.job.grade_name == 'boss' then
    table.insert(elements, {label = _U('boss_actions'), value = 'boss_actions'})
  end

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'ambulance_actions',
    {
      title    = _U('ambulance'),
      elements = elements
    },
    function(data, menu)

      if data.current.value == 'cloakroom' then
        OpenCloakroomMenu()
      end

      if data.current.value == 'boss_actions' then
        TriggerEvent('esx_society:BossMenuOpen1', 'ambulance', function(data, menu)
          menu.close()
        end, {wash = false})
      end

    end,
    function(data, menu)

      menu.close()

      CurrentAction     = 'ambulance_actions_menu'
      CurrentActionMsg  = _U('open_menu')
      CurrentActionData = {}

    end
  )

end

function OpenMobileAmbulanceActionsMenu()

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'mobile_ambulance_actions',
    {
      title    = _U('ambulance'),
      elements = {
        {label = _U('ems_menu'), value = 'citizen_interaction'},
        {label = _U('vehicle_interaction'), value = 'vehicle_interaction'},
        {label = _U('object_spawner'),    value = 'object_spawner'},
      }
    },
    function(data, menu)

      if data.current.value == 'citizen_interaction' then

        ESX.UI.Menu.Open(
          'default', GetCurrentResourceName(), 'citizen_interaction',
          {
            title    = _U('ems_menu_title'),
            elements = {
              {label = _U('id_card'),     value = 'identity_card'},
              {label = _U('ems_menu_revive'),     value = 'revive'},
              {label = _U('ems_menu_small'),      value = 'small'},
              {label = _U('ems_menu_big'),        value = 'big'},
              {label = _U('ems_menu_putincar'),   value = 'put_in_vehicle'},
			        {label = _U('fine'),              value = 'fine'},
            }
          },
          function(data, menu)

            if data.current.value == 'revive' then
              menu.close()
              local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
              if closestPlayer == -1 or closestDistance > 3.0 then
                ESX.ShowNotification(_U('no_players'))
              else
                                ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(qtty)
                                    if qtty > 0 then
                        local closestPlayerPed = GetPlayerPed(closestPlayer)
                        local health = GetEntityHealth(closestPlayerPed)
                        if health == 0 then
                            local playerPed = GetPlayerPed(-1)
                            Citizen.CreateThread(function()
                              ESX.ShowNotification(_U('revive_inprogress'))
                              TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
                              Wait(10000)
                              ClearPedTasks(playerPed)
                              if GetEntityHealth(closestPlayerPed) == 0 then
                                                    TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
                                TriggerServerEvent('esx_ambulancejob:revive', GetPlayerServerId(closestPlayer))
                                ESX.ShowNotification(_U('revive_complete'))
                              else
                                ESX.ShowNotification(_U('isdead'))
                              end
                            end)
                        else
                          ESX.ShowNotification(_U('unconscious'))
                        end
                                    else
                                        ESX.ShowNotification(_U('not_enough_medikit'))
                                    end
                                end, 'medikit')
				end
            end

                        if data.current.value == 'small' then
                            menu.close()
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                            if closestPlayer == -1 or closestDistance > 3.0 then
                                ESX.ShowNotification(_U('no_players'))
                            else
                                ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(qtty)
                                    if qtty > 0 then
                                        local playerPed = GetPlayerPed(-1)
                                        Citizen.CreateThread(function()
                                            ESX.ShowNotification(_U('heal_inprogress'))
                                            TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
                                            Wait(10000)
                                            ClearPedTasks(playerPed)
                                            TriggerServerEvent('esx_ambulancejob:removeItem', 'bandage')
                                            TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'small')
                                            ESX.ShowNotification(_U('heal_complete'))
                                        end)
                                    else
                                        ESX.ShowNotification(_U('not_enough_bandage'))
                                    end
                                end, 'bandage')
                            end
                        end

                        if data.current.value == 'big' then
                            menu.close()
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                            if closestPlayer == -1 or closestDistance > 3.0 then
                                ESX.ShowNotification(_U('no_players'))
                            else
                                ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(qtty)
                                    if qtty > 0 then
                                        local playerPed = GetPlayerPed(-1)
                                        Citizen.CreateThread(function()
                                            ESX.ShowNotification(_U('heal_inprogress'))
                                            TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
                                            Wait(10000)
                                            ClearPedTasks(playerPed)
                                            TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
                                            TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'big')
                                            ESX.ShowNotification(_U('heal_complete'))
                                        end)
                                    else
                                        ESX.ShowNotification(_U('not_enough_medikit'))
                                    end
                                end, 'medikit')
                            end
                        end

            if data.current.value == 'put_in_vehicle' then
              menu.close()
              WarpPedInClosestVehicle(GetPlayerPed(closestPlayer))
            end

			local player, distance = ESX.Game.GetClosestPlayer()

			if distance ~= -1 and distance <= 3.0 then
				if data.current.value == 'put_in_vehicle' then
					menu.close()
					TriggerServerEvent('esx_ambulancejob:putInVehicle', GetPlayerServerId(player))
				end

				if data.current.value == 'fine' then
					OpenFineMenu(player)
				end
			else
				ESX.ShowNotification(_U('no_players_nearby'))
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

function OpenFineMenu(player)

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'fine',
    {
      title    = _U('fine'),
      align    = 'top-left',
      elements = {
        {label = _U('ambulance_consultation'),   value = 0},
		{label = _U('ambulance_care'),   value = 1},
		{label = _U('ambulance_reanimation'),   value = 2},
      },
    },
    function(data, menu)

      OpenFineCategoryMenu(player, data.current.value)

    end,
    function(data, menu)
      menu.close()
    end
  )

end

function OpenFineCategoryMenu(player, category)

  ESX.TriggerServerCallback('esx_ambulancejob:getFineList', function(fines)

    local elements = {}

    for i=1, #fines, 1 do
      table.insert(elements, {
        label     = fines[i].label .. ' $' .. fines[i].amount,
        value     = fines[i].id,
        amount    = fines[i].amount,
        fineLabel = fines[i].label
      })
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'fine_category',
      {
        title    = _U('fine'),
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        local label  = data.current.fineLabel
        local amount = data.current.amount

        menu.close()

        if Config.EnablePlayerManagement then
          TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_ambulance', _U('fine_total') .. label, amount)
        else
          TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), '', _U('fine_total') .. label, amount)
        end

        ESX.SetTimeout(300, function()
          OpenFineCategoryMenu(player, category)
        end)

      end,
      function(data, menu)
        menu.close()
      end
    )

  end, category)

end

function OpenCloakroomMenu()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'cloakroom',
    {
      title    = _U('cloakroom'),
      align    = 'top-left',
      elements = {
        {label = _U('ems_clothes_civil'), value = 'citizen_wear'},
        {label = _U('ems_clothes_ems'), value = 'sapeurun_wear'},
        {label = _U('tenue1_wear'), value = 'tenue1_wear'},
        {label = _U('feu_wear'), value = 'feu_wear'},
        --{label = _U('tenue3_wear'), value = 'tenue3_wear'},
      },
    },
    function(data, menu)

      menu.close()

     if data.current.value == 'citizen_wear' then

            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
            TriggerServerEvent("player:serviceOff", "ambulance")

            if skin.sex == 0 then

                local model = GetHashKey("mp_m_freemode_01")
                    RequestModel(model)
                    while not HasModelLoaded(model) do
                        RequestModel(model)
                        Citizen.Wait(0)
                    end

                    SetPlayerModel(PlayerId(), model)
                    SetModelAsNoLongerNeeded(model)
                    TriggerEvent('skinchanger:loadSkin', skin)
            else
                    local model = GetHashKey("mp_f_freemode_01")

                    RequestModel(model)
                    while not HasModelLoaded(model) do
                        RequestModel(model)
                        Citizen.Wait(0)
                    end

                    SetPlayerModel(PlayerId(), model)
                    SetModelAsNoLongerNeeded(model)
                    TriggerEvent('skinchanger:loadSkin', skin)
                    end

                end)
            end

      if data.current.value == 'tenue1_wear' then --Ajout de tenue par grades

        Citizen.CreateThread(function()
        TriggerServerEvent("player:serviceOn", "ambulance")

    local model = GetHashKey("s_m_y_ranger_01")

    RequestModel(model)
    while not HasModelLoaded(model) do
      RequestModel(model)
      Citizen.Wait(0)
    end

    SetPlayerModel(PlayerId(), model)
    SetModelAsNoLongerNeeded(model)

    RemoveAllPedWeapons(GetPlayerPed(-1), true)
  end)

      end

      if data.current.value == 'feu_wear' then --Ajout de tenue par grades

        Citizen.CreateThread(function()
          TriggerServerEvent("player:serviceOn", "ambulance")

    local model = GetHashKey("s_m_y_fireman_01")

    RequestModel(model)
    while not HasModelLoaded(model) do
      RequestModel(model)
      Citizen.Wait(0)
    end

    SetPlayerModel(PlayerId(), model)
    SetModelAsNoLongerNeeded(model)

    RemoveAllPedWeapons(GetPlayerPed(-1), true)
  end)

      end

      if data.current.value == 'tenue3_wear' then --Ajout de tenue par grades

        Citizen.CreateThread(function()
          TriggerServerEvent("player:serviceOn", "ambulance")

    local model = GetHashKey("s_m_m_paramedic_02")

    RequestModel(model)
    while not HasModelLoaded(model) do
      RequestModel(model)
      Citizen.Wait(0)
    end

    SetPlayerModel(PlayerId(), model)
    SetModelAsNoLongerNeeded(model)

    RemoveAllPedWeapons(GetPlayerPed(-1), true)
  end)

      end

      if data.current.value == 'samu_wear' then --Ajout de tenue par grades

        Citizen.CreateThread(function()
          TriggerServerEvent("player:serviceOn", "ambulance")

    local model = GetHashKey("s_m_m_hairdress_01")

    RequestModel(model)
    while not HasModelLoaded(model) do
      RequestModel(model)
      Citizen.Wait(0)
    end

    SetPlayerModel(PlayerId(), model)
    SetModelAsNoLongerNeeded(model)

    RemoveAllPedWeapons(GetPlayerPed(-1), true)
  end)

      end

      if data.current.value == 'secouriste_wear' then --Ajout de tenue par grades

        Citizen.CreateThread(function()
          TriggerServerEvent("player:serviceOn", "ambulance")

    local model = GetHashKey("s_m_m_highsec_01")

    RequestModel(model)
    while not HasModelLoaded(model) do
      RequestModel(model)
      Citizen.Wait(0)
    end

    SetPlayerModel(PlayerId(), model)
    SetModelAsNoLongerNeeded(model)

    RemoveAllPedWeapons(GetPlayerPed(-1), true)
  end)

      end

      if data.current.value == 'sapeurun_wear' then --Ajout de tenue par grades

        Citizen.CreateThread(function()
          TriggerServerEvent("player:serviceOn", "ambulance")

    local model = GetHashKey("s_m_m_paramedic_01")

    RequestModel(model)
    while not HasModelLoaded(model) do
      RequestModel(model)
      Citizen.Wait(0)
    end

    SetPlayerModel(PlayerId(), model)
    SetModelAsNoLongerNeeded(model)

    RemoveAllPedWeapons(GetPlayerPed(-1), true)
  end)

      end

      if data.current.value == 'ambulance_wear' then

        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
          TriggerServerEvent("player:serviceOn", "ambulance")

          if skin.sex == 0 then
            TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
          else
            TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
          end

        end)

      end

      CurrentAction     = 'ambulance_actions_menu'
      CurrentActionMsg  = _U('open_menu')
      CurrentActionData = {}

    end,
    function(data, menu)
      menu.close()
    end
  )

end

function OpenVehicleSpawnerMenu()

  ESX.UI.Menu.CloseAll()

  if Config.EnableSocietyOwnedVehicles then

    local elements = {}

    ESX.TriggerServerCallback('esx_society:getVehiclesInGarage', function(vehicles)

      for i=1, #vehicles, 1 do
        table.insert(elements, {label = GetDisplayNameFromVehicleModel(vehicles[i].model) .. ' [' .. vehicles[i].plate .. ']', value = vehicles[i]})
      end

      ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'vehicle_spawner',
        {
          title    = _U('veh_menu'),
          align    = 'top-left',
          elements = elements,
        },
        function(data, menu)

          menu.close()

          local vehicleProps = data.current.value

          ESX.Game.SpawnVehicle(vehicleProps.model, Config.Zones.VehicleSpawnPoint.Pos, 270.0, function(vehicle)
            ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
	    SetVehicleNumberPlateText(vehicle, "Ambu112")
            local playerPed = GetPlayerPed(-1)
            TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
          end)

          TriggerServerEvent('esx_society:removeVehicleFromGarage', 'ambulance', vehicleProps)

        end,
        function(data, menu)

          menu.close()

          CurrentAction     = 'vehicle_spawner_menu'
          CurrentActionMsg  = _U('veh_spawn')
          CurrentActionData = {}

        end
      )

    end, 'ambulance')

  else

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'vehicle_spawner',
      {
        title    = _U('veh_menu'),
        align    = 'top-left',
        elements = {
          {label = _U('ambulance'), value = 'ambulance'},
          {label = _U('ambulance2'), value = 'VTU'},
          {label = _U('ambulance3'), value = 'vl3sm'},
          {label = _U('ambulance4'), value = 'VLDDSIS'},
          {label = _U('ambulance5'), value = 'x5om'},
          {label = _U('ambulance6'), value = 'FSR'},
          {label = _U('ambulance7'), value = 'firetruk'},
        },
      },
      function(data, menu)
        menu.close()
        local model = data.current.value
        ESX.Game.SpawnVehicle(model, Config.Zones.VehicleSpawnPoint.Pos, 0.0, function(vehicle)
          local playerPed = GetPlayerPed(-1)
          TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
	  SetVehicleMaxMods(vehicle)
        end)
      end,
      function(data, menu)
        menu.close()
        CurrentAction     = 'vehicle_spawner_menu'
        CurrentActionMsg  = _U('veh_spawn')
        CurrentActionData = {}
      end
    )

  end

end

function OpenPharmacyMenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'pharmacy',
        {
            title    = _U('pharmacy_menu_title'),
            align    = 'top-left',
            elements = {
                {label = _U('pharmacy_take') .. ' ' .. _('medikit'),  value = 'medikit'},
                {label = _U('pharmacy_take') .. ' ' .. _('bandage'),  value = 'bandage'}
            },
        },
        function(data, menu)
            TriggerServerEvent('esx_ambulancejob:giveItem', data.current.value)
        end,
        function(data, menu)
            menu.close()
            CurrentAction     = 'pharmacy'
            CurrentActionMsg  = _U('open_pharmacy')
            CurrentActionData = {}
        end
    )
end

AddEventHandler('playerSpawned', function()

  IsDead = false

  if FirstSpawn then
    exports.spawnmanager:setAutoSpawn(false)
    FirstSpawn = false
  end

end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)

  local specialContact = {
    name       = 'Pompier',
    number     = 'ambulance',
    base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDFGQTJDRkI0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDFGQTJDRkM0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0MUZBMkNGOTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0MUZBMkNGQTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoW66EYAAAjGSURBVHjapJcLcFTV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'
  }

  TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)

end)

AddEventHandler('baseevents:onPlayerDied', function(killerType, coords)
  OnPlayerDeath()
end)

AddEventHandler('baseevents:onPlayerKilled', function(killerId, data)
  OnPlayerDeath()
end)

RegisterNetEvent('esx_ambulancejob:revive')
AddEventHandler('esx_ambulancejob:revive', function()

  local playerPed = GetPlayerPed(-1)
  local coords    = GetEntityCoords(playerPed)

  Citizen.CreateThread(function()

    DoScreenFadeOut(800)

    while not IsScreenFadedOut() do
      Citizen.Wait(0)
    end

    ESX.SetPlayerData('lastPosition', {
      x = coords.x,
      y = coords.y,
      z = coords.z
    })

    TriggerServerEvent('esx:updateLastPosition', {
      x = coords.x,
      y = coords.y,
      z = coords.z
    })

    RespawnPed(playerPed, {
      x = coords.x,
      y = coords.y,
      z = coords.z
    })

    StopScreenEffect('DeathFailOut')

    DoScreenFadeIn(800)

  end)

end)

AddEventHandler('esx_ambulancejob:hasEnteredMarker', function(zone)

  if zone == 'HospitalInteriorEntering1' then
    TeleportFadeEffect(GetPlayerPed(-1), Config.Zones.HospitalInteriorInside1.Pos)
  end

  if zone == 'HospitalInteriorExit1' then
    TeleportFadeEffect(GetPlayerPed(-1), Config.Zones.HospitalInteriorOutside1.Pos)
  end

  if zone == 'HospitalInteriorEntering2' then
        local heli = Config.HelicopterSpawner

        if not IsAnyVehicleNearPoint(heli.SpawnPoint.x, heli.SpawnPoint.y, heli.SpawnPoint.z, 3.0)
            and PlayerData.job ~= nil and PlayerData.job.name == 'ambulance' then
            ESX.Game.SpawnVehicle('polmav', {
                x = heli.SpawnPoint.x,
                y = heli.SpawnPoint.y,
                z = heli.SpawnPoint.z
            }, heli.Heading, function(vehicle)
                SetVehicleModKit(vehicle, 0)
                SetVehicleLivery(vehicle, 1)
            end)

        end
    TeleportFadeEffect(GetPlayerPed(-1), Config.Zones.HospitalInteriorInside2.Pos)
  end

  if zone == 'HospitalInteriorExit2' then
    TeleportFadeEffect(GetPlayerPed(-1), Config.Zones.HospitalInteriorOutside2.Pos)
  end

    if zone == 'ParkingDoorGoOutInside' then
        TeleportFadeEffect(GetPlayerPed(-1), Config.Zones.ParkingDoorGoOutOutside.Pos)
    end

    if zone == 'ParkingDoorGoInOutside' then
        TeleportFadeEffect(GetPlayerPed(-1), Config.Zones.ParkingDoorGoInInside.Pos)
    end

    if zone == 'StairsGoTopBottom' then
        CurrentAction     = 'fast_travel_goto_top'
        CurrentActionMsg  = _U('fast_travel')
        CurrentActionData = {pos = Config.Zones.StairsGoTopTop.Pos}
    end

    if zone == 'StairsGoBottomTop' then
        CurrentAction     = 'fast_travel_goto_bottom'
        CurrentActionMsg  = _U('fast_travel')
        CurrentActionData = {pos = Config.Zones.StairsGoBottomBottom.Pos}
    end

  if zone == 'AmbulanceActions' then
    CurrentAction     = 'ambulance_actions_menu'
    CurrentActionMsg  = _U('open_menu')
    CurrentActionData = {}
  end

  if zone == 'VehicleSpawner' then
    CurrentAction     = 'vehicle_spawner_menu'
    CurrentActionMsg  = _U('veh_spawn')
    CurrentActionData = {}
  end

    if zone == 'Pharmacy' then
        CurrentAction     = 'pharmacy'
        CurrentActionMsg  = _U('open_pharmacy')
        CurrentActionData = {}
    end

  if zone == 'VehicleDeleter' then

    local playerPed = GetPlayerPed(-1)
    local coords    = GetEntityCoords(playerPed)

    if IsPedInAnyVehicle(playerPed,  false) then

      local vehicle, distance = ESX.Game.GetClosestVehicle({
        x = coords.x,
        y = coords.y,
        z = coords.z
      })

      if distance ~= -1 and distance <= 1.0 then

        CurrentAction     = 'delete_vehicle'
        CurrentActionMsg  = _U('store_vehicle')
        CurrentActionData = {vehicle = vehicle}

      end

    end

  end

end)

function FastTravel(pos)
    TeleportFadeEffect(GetPlayerPed(-1), pos)
end

AddEventHandler('esx_ambulancejob:hasExitedMarker', function(zone)
  ESX.UI.Menu.CloseAll()
  CurrentAction = nil
end)

-- Create blips
Citizen.CreateThread(function()

  local blip = AddBlipForCoord(Config.Blip.Pos.x, Config.Blip.Pos.y, Config.Blip.Pos.z)

  SetBlipSprite (blip, Config.Blip.Sprite)
  SetBlipDisplay(blip, Config.Blip.Display)
  SetBlipScale  (blip, Config.Blip.Scale)
  SetBlipColour (blip, Config.Blip.Colour)
  SetBlipAsShortRange(blip, true)

  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(_U('caserne'))
  EndTextCommandSetBlipName(blip)

end)

Citizen.CreateThread(function()

  local blip = AddBlipForCoord(Config.Blip2.Pos.x, Config.Blip2.Pos.y, Config.Blip2.Pos.z)

  SetBlipSprite (blip, Config.Blip2.Sprite)
  SetBlipDisplay(blip, Config.Blip2.Display)
  SetBlipScale  (blip, Config.Blip2.Scale)
  SetBlipColour (blip, Config.Blip2.Colour)
  SetBlipAsShortRange(blip, true)

  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(_U('hopital'))
  EndTextCommandSetBlipName(blip)

end)

-- Display markers
Citizen.CreateThread(function()
  while true do
    Wait(0)

    local coords = GetEntityCoords(GetPlayerPed(-1))
    for k,v in pairs(Config.Zones) do
      if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
                if PlayerData.job ~= nil and PlayerData.job.name == 'ambulance' then
                    DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
                elseif k ~= 'AmbulanceActions' and k ~= 'VehicleSpawner' and k ~= 'VehicleDeleter'
                    and k ~= 'Pharmacy' and k ~= 'StairsGoTopBottom' and k ~= 'StairsGoBottomTop' then
                    DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
                end
      end
    end
  end
end)

-- Activate menu when player is inside marker
Citizen.CreateThread(function()
  while true do
    Wait(0)
    local coords      = GetEntityCoords(GetPlayerPed(-1))
    local isInMarker  = false
    local currentZone = nil
    for k,v in pairs(Config.Zones) do
            if PlayerData.job ~= nil and PlayerData.job.name == 'ambulance' then
                if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
                    isInMarker  = true
                    currentZone = k
                end
            elseif k ~= 'AmbulanceActions' and k ~= 'VehicleSpawner' and k ~= 'VehicleDeleter'
                and k ~= 'Pharmacy' and k ~= 'StairsGoTopBottom' and k ~= 'StairsGoBottomTop' then
                if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
                    isInMarker  = true
                    currentZone = k
                end
            end
    end
    if isInMarker and not hasAlreadyEnteredMarker then
      hasAlreadyEnteredMarker = true
      lastZone                = currentZone
      TriggerEvent('esx_ambulancejob:hasEnteredMarker', currentZone)
    end
    if not isInMarker and hasAlreadyEnteredMarker then
      hasAlreadyEnteredMarker = false
      TriggerEvent('esx_ambulancejob:hasExitedMarker', lastZone)
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

      if IsControlJustReleased(0, Keys['E']) and PlayerData.job ~= nil and PlayerData.job.name == 'ambulance' then

        if CurrentAction == 'ambulance_actions_menu' then
          OpenAmbulanceActionsMenu()
        end

        if CurrentAction == 'vehicle_spawner_menu' then
          OpenVehicleSpawnerMenu()
        end

                if CurrentAction == 'pharmacy' then
                    OpenPharmacyMenu()
                end

                if CurrentAction == 'fast_travel_goto_top' or CurrentAction == 'fast_travel_goto_bottom' then
                    FastTravel(CurrentActionData.pos)
                end

        if CurrentAction == 'delete_vehicle' then
          if Config.EnableSocietyOwnedVehicles then
            local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
            TriggerServerEvent('esx_society:putVehicleInGarage', 'ambulance', vehicleProps)
          end
          ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
        end

        CurrentAction = nil

      end

    end

    if IsControlJustReleased(0, Keys['F6']) and PlayerData.job ~= nil and PlayerData.job.name == 'ambulance' then
      OpenMobileAmbulanceActionsMenu()
    end

    if IsControlPressed(0,  Keys['DELETE']) and (GetGameTimer() - GUI.Time) > 150 then

      if OnJob then
        StopAmbulanceJob()
      else

        if PlayerData.job ~= nil and PlayerData.job.name == 'ambulance' then

          local playerPed = GetPlayerPed(-1)

          if IsPedInAnyVehicle(playerPed,  false) then

            local vehicle = GetVehiclePedIsIn(playerPed,  false)

            if PlayerData.job.grade >= 3 then
              StartAmbulanceJob()
            else
              if GetEntityModel(vehicle) == GetHashKey('ambulance') then
                StartAmbulanceJob()
              else
                ESX.ShowNotification(_U('must_in_ambulance'))
              end
            end

          else

            if PlayerData.job.grade >= 3 then
              ESX.ShowNotification(_U('must_in_vehicle'))
            else
              ESX.ShowNotification(_U('must_in_ambulance'))
            end

          end

        end

      end

      GUI.Time = GetGameTimer()

    end
    end
end)

-- Load unloaded IPLs
Citizen.CreateThread(function()
  LoadMpDlcMaps()
  EnableMpDlcMaps(true)
  RequestIpl('Coroner_Int_on') -- Morgue
end)

-- String string
function stringsplit(inputstr, sep)
  if sep == nil then
      sep = "%s"
  end
  local t={} ; i=1
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
      t[i] = str
      i = i + 1
  end
  return t
end

Citizen.CreateThread(function()

  while true do

    Citizen.Wait(0)

    local playerPed = GetPlayerPed(-1)

    if OnJob then

      if CurrentCustomer == nil then

        DrawSub(_U('drive_search_pass'), 5000)

        if IsPedInAnyVehicle(playerPed,  false) and GetEntitySpeed(playerPed) > 0 then

          local waitUntil = GetGameTimer() + GetRandomIntInRange(30000,  45000)

          while OnJob and waitUntil > GetGameTimer() do
            Citizen.Wait(0)
          end

          if OnJob and IsPedInAnyVehicle(playerPed,  false) and GetEntitySpeed(playerPed) > 0 then

            CurrentCustomer = GetRandomWalkingNPC()

            if CurrentCustomer ~= nil then

              CurrentCustomerBlip = AddBlipForEntity(CurrentCustomer)

              SetBlipAsFriendly(CurrentCustomerBlip, 1)
              SetBlipColour(CurrentCustomerBlip, 2)
              SetBlipCategory(CurrentCustomerBlip, 3)
              SetBlipRoute(CurrentCustomerBlip,  true)

              SetEntityAsMissionEntity(CurrentCustomer,  true, false)
              ClearPedTasksImmediately(CurrentCustomer)
              SetBlockingOfNonTemporaryEvents(CurrentCustomer, 1)

              local standTime = GetRandomIntInRange(60000,  180000)

              TaskStandStill(CurrentCustomer, standTime)

              ESX.ShowNotification(_U('customer_found'))

            end

          end

        end

      else

        if IsPedFatallyInjured(CurrentCustomer) then

          ESX.ShowNotification(_U('client_unconcious'))

          if DoesBlipExist(CurrentCustomerBlip) then
            RemoveBlip(CurrentCustomerBlip)
          end

          if DoesBlipExist(DestinationBlip) then
            RemoveBlip(DestinationBlip)
          end

          SetEntityAsMissionEntity(CurrentCustomer,  false, true)

          CurrentCustomer           = nil
          CurrentCustomerBlip       = nil
          DestinationBlip           = nil
          IsNearCustomer            = false
          CustomerIsEnteringVehicle = false
          CustomerEnteredVehicle    = false
      TargetCoords              = nil

        end

        if IsPedInAnyVehicle(playerPed,  false) then

          local vehicle          = GetVehiclePedIsIn(playerPed,  false)
          local playerCoords     = GetEntityCoords(playerPed)
          local customerCoords   = GetEntityCoords(CurrentCustomer)
          local customerDistance = GetDistanceBetweenCoords(playerCoords.x,  playerCoords.y,  playerCoords.z,  customerCoords.x,  customerCoords.y,  customerCoords.z)

          if IsPedSittingInVehicle(CurrentCustomer,  vehicle) then

            if CustomerEnteredVehicle then

              local targetDistance = GetDistanceBetweenCoords(playerCoords.x,  playerCoords.y,  playerCoords.z,  TargetCoords.x,  TargetCoords.y,  TargetCoords.z)

              if targetDistance <= 5.0 then

                TaskLeaveVehicle(CurrentCustomer,  vehicle,  0)

                ESX.ShowNotification(_U('arrive_dest'))

                TaskGoStraightToCoord(CurrentCustomer,  TargetCoords.x,  TargetCoords.y,  TargetCoords.z,  1.0,  -1,  0.0,  0.0)
                SetEntityAsMissionEntity(CurrentCustomer,  false, true)

                TriggerServerEvent('esx_taxijob:success')

                RemoveBlip(DestinationBlip)

                local scope = function(customer)
                  ESX.SetTimeout(60000, function()
                    DeletePed(customer)
                  end)
                end

                scope(CurrentCustomer)

                CurrentCustomer           = nil
                CurrentCustomerBlip       = nil
                DestinationBlip           = nil
                IsNearCustomer            = false
                CustomerIsEnteringVehicle = false
                CustomerEnteredVehicle    = false
                TargetCoords              = nil

              end

              if TargetCoords ~= nil then
                DrawMarker(1, TargetCoords.x, TargetCoords.y, TargetCoords.z - 1.0, 0, 0, 0, 0, 0, 0, 4.0, 4.0, 2.0, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
              end

            else

              RemoveBlip(CurrentCustomerBlip)

              CurrentCustomerBlip = nil

              --TargetCoords = Config.JobLocations[GetRandomIntInRange(1,  #Config.JobLocations)]
        TargetCoords = {x = 1164.2872314453,y = -1536.1022949219,z = 38.400829315186 }

              local street = table.pack(GetStreetNameAtCoord(TargetCoords.x, TargetCoords.y, TargetCoords.z))
              local msg    = nil

              if street[2] ~= 0 and street[2] ~= nil then
                msg = string.format(_U('take_me_to_near', GetStreetNameFromHashKey(street[1]),GetStreetNameFromHashKey(street[2])))
              else
                msg = string.format(_U('take_me_to', GetStreetNameFromHashKey(street[1])))
              end

              ESX.ShowNotification(msg)

              DestinationBlip = AddBlipForCoord(TargetCoords.x, TargetCoords.y, TargetCoords.z)

              BeginTextCommandSetBlipName("STRING")
              AddTextComponentString("Destination")
              EndTextCommandSetBlipName(blip)

              SetBlipRoute(DestinationBlip,  true)

              CustomerEnteredVehicle = true

            end

          else

            DrawMarker(1, customerCoords.x, customerCoords.y, customerCoords.z - 1.0, 0, 0, 0, 0, 0, 0, 4.0, 4.0, 2.0, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)

            if not CustomerEnteredVehicle then

              if customerDistance <= 30.0 then

                if not IsNearCustomer then
                  ESX.ShowNotification(_U('close_to_client'))
                  IsNearCustomer = true
                end

              end

              if customerDistance <= 100.0 then

                if not CustomerIsEnteringVehicle then

                  ClearPedTasksImmediately(CurrentCustomer)

                  local seat = 2

                  for i=4, 0, 1 do
                    if IsVehicleSeatFree(vehicle,  seat) then
                      seat = i
                      break
                    end
                  end

                  TaskEnterVehicle(CurrentCustomer,  vehicle,  -1,  seat,  2.0,  1)

                  CustomerIsEnteringVehicle = true

                end

              end

            end

          end

        else

          DrawSub(_U('return_to_veh'), 5000)

        end

      end

    end

  end
end)

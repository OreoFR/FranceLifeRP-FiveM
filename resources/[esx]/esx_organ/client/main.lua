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

local PID           			= 0
local GUI           			= {}
local osQTE                     = 0
ESX 			    			= nil
GUI.Time            			= 0
local organ_poochQTE            = 0
local cerveauQTE       			= 0
local coeurQTE					= 0
local moelleQTE					= 0
local intestinQTE				= 0
local myJob 					= nil
local PlayerData 				= {}
local GUI 						= {}
local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

AddEventHandler('esx_organ:hasEnteredMarker', function(zone)

        ESX.UI.Menu.CloseAll()

        --cerveau
        if zone == 'CerveauFarm' then
            if myJob ~= "police" then
                CurrentAction     = 'cerveau_harvest'
                CurrentActionMsg  = _U('press_collect_cerveau')
                CurrentActionData = {}
            end
        end

        --coeur
        if zone == 'CoeurFarm' then
            if myJob ~= "police" then
                CurrentAction     = 'coeur_harvest'
                CurrentActionMsg  = _U('press_collect_coeur')
                CurrentActionData = {}
            end
        end

        --moelle
        if zone == 'MoelleFarm' then
            if myJob ~= "police" then
                CurrentAction     = 'moelle_harvest'
                CurrentActionMsg  = _U('press_collect_moelle')
                CurrentActionData = {}
            end
        end

        --intestin
        if zone == 'IntestinFarm' then
            if myJob ~= "police" then
                CurrentAction     = 'intestin_harvest'
                CurrentActionMsg  = _U('press_collect_intestin')
                CurrentActionData = {}
            end
        end

        -- os
        if zone == 'OsFarm' then
            if myJob ~= "police" then
                CurrentAction     = 'os_harvest'
                CurrentActionMsg  = _U('press_collect_os')
                CurrentActionData = {}
            end
        end

		if zone == 'OrganTreatment' then
            if myJob ~= "police" then
                    CurrentAction     = 'organ_treatment'
                    CurrentActionMsg  = _U('press_process_organ')
                    CurrentActionData = {}
            end
        end

        if zone == 'BodyResell' then
            if myJob ~= "police" then
                if organ_poochQTE >= 1 then
                    CurrentAction     = 'body_resell'
                    CurrentActionMsg  = _U('press_sell_body')
                    CurrentActionData = {}
                end
            end
        end
    end)

AddEventHandler('esx_organ:hasExitedMarker', function(zone)

        CurrentAction = nil
        ESX.UI.Menu.CloseAll()

        TriggerServerEvent('esx_organ:stopHarvestCerveau')
        TriggerServerEvent('esx_organ:stopHarvestCoeur')
        TriggerServerEvent('esx_organ:stopHarvestMoelle')
        TriggerServerEvent('esx_organ:stopHarvestIntestin')
        TriggerServerEvent('esx_organ:stopHarvestOs')
        TriggerServerEvent('esx_organ:stopTransformOrgan')
        TriggerServerEvent('esx_organ:stopSellBody')
end)

-- Render markers
Citizen.CreateThread(function()
    while true do

        Wait(0)

        local coords = GetEntityCoords(GetPlayerPed(-1))

        for k,v in pairs(Config.Zones) do
            if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.DrawDistance) then
                DrawMarker(Config.MarkerType, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
            end
        end

    end
end)

-- RETURN NUMBER OF ITEMS FROM SERVER
RegisterNetEvent('esx_organ:ReturnInventory')
AddEventHandler('esx_organ:ReturnInventory', function(cerveauNbr, coeurNbr, moelleNbr, intestinNbr, osNbr, organpNbr, jobName, currentZone)
	cerveauQTE       = cerveauNbr
	coeurQTE 	  = coeurNbr
	moelleQTE 	  = moelleNbr
	intestinQTE       = intestinbr
	osQTE       = osNbr
	organ_poochQTE = organpNbr
	myJob         = jobName
	TriggerEvent('esx_organ:hasEnteredMarker', currentZone)
end)

-- Activate menu when player is inside marker
Citizen.CreateThread(function()
    while true do

        Wait(0)

        local coords      = GetEntityCoords(GetPlayerPed(-1))
        local isInMarker  = false
        local currentZone = nil

        for k,v in pairs(Config.Zones) do
            if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.ZoneSize.x / 2) then
                isInMarker  = true
                currentZone = k
            end
        end

        if isInMarker and not hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = true
            lastZone                = currentZone
            TriggerServerEvent('esx_organ:GetUserInventory', currentZone)
        end

        if not isInMarker and hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = false
            TriggerEvent('esx_organ:hasExitedMarker', lastZone)
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
            if IsControlJustReleased(0, 38) then
                if CurrentAction == 'cerveau_harvest' then
                    TriggerServerEvent('esx_organ:startHarvestCerveau')
                end
                if CurrentAction == 'coeur_harvest' then
                    TriggerServerEvent('esx_organ:startHarvestCoeur')
                end
                if CurrentAction == 'moelle_harvest' then
                    TriggerServerEvent('esx_organ:startHarvestMoelle')
                end
                if CurrentAction == 'intestin_harvest' then
                    TriggerServerEvent('esx_organ:startHarvestIntestin')
                end
                if CurrentAction == 'os_harvest' then
                    TriggerServerEvent('esx_organ:startHarvestOs')
                end
                if CurrentAction == 'organ_treatment' then
                    TriggerServerEvent('esx_organ:startTransformOrgan')
                end
                if CurrentAction == 'body_resell' then
                    TriggerServerEvent('esx_organ:startSellBody')
                end
                CurrentAction = nil
            end
        end
    end
end)
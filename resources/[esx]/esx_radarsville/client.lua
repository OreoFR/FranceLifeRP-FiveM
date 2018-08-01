--===============================================--===============================================
--= stationary radars based on  https://github.com/DreanorGTA5Mods/StationaryRadar           =
--===============================================--===============================================

ESX              = nil
local PlayerData = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
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

local radares = {
    {x = -141.642, y = -76.485, z = 54.583},
    {x = -883.584, y = -1171.332, z = 4.402},
    {x = 26.725, y = -305.890, z = 46.563},
}

Citizen.CreateThread(function()
    while true do
        Wait(0)
        for k,v in pairs(radares) do
            local player = GetPlayerPed(-1)
            local coords = GetEntityCoords(player, true)
            if Vdist2(radares[k].x, radares[k].y, radares[k].z, coords["x"], coords["y"], coords["z"]) < 10 then
                if PlayerData.job ~= nil and not (PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance') then
                    checkSpeed()
                end
            end
        end
    end
end)

function checkSpeed()
    local pP = GetPlayerPed(-1)
    local speed = GetEntitySpeed(pP)
    local vehicle = GetVehiclePedIsIn(pP, false)
    local driver = GetPedInVehicleSeat(vehicle, -1)
    local plate = GetVehicleNumberPlateText(vehicle)
    local maxspeed = 71
    local mphspeed = math.ceil(speed*3.6)
    if mphspeed > maxspeed and driver == pP then
        Citizen.Wait(250)
        TriggerServerEvent('fineAmount')
        exports.pNotify:SetQueueMax("left", 1)
        exports.pNotify:SendNotification({
            text = "<h2><center>Amende</center></h2>" .. "</br>Vous avez été flashé pour Excès de Vitesse" .. "</br><p>Plaque d'Immatriculation : " .. plate .. "</br><p>Montant de l'Amende :&nbsp;" .. Config.Fine .. "€" .. "</br><p>Route limité à :&nbsp;" .. maxspeed .. "&nbsp;km/h" .. "</br><p>Votre Vitesse :&nbsp;" ..mphspeed .. "&nbsp;km/h" .. "<h2><center>Merci et bonne journée</center></h2>",
            type = "error",
            timeout = 10000,
            layout = "centerLeft",
            queue = "left"
        })
    end
end

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
    {x = 914.273, y = 6493.794, z = 21.263},
    {x = 1161.099, y = 6479.854, z = 21.053},
    {x = 2617.518, y = 3117.587, z = 48.642},
    {x = 2720.997, y = 3221.068, z = 54.492},
    {x = 1448.995, y = 768.655, z = 77.405},
    {x = 1362.499, y = 640.161, z = 80.474},
    {x = 1967.939, y = -698.952, z = 90.687},
    {x = 1866.23, y = -794.961, z = 80.161},
    {x = -1696.235, y = 4817.839, z = 60.366},
    {x = -1731.704, y = 4774.269, z = 57.877},
    {x = -2657.375, y = 2593.712, z = 16.694},
    {x = -2685.873, y = 2486.797, z = 16.692},
    {x = -2832.395, y = 46.639, z = 14.583},
    {x = -2707.777, y = -7.848, z = 15.621},
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
    local maxspeed = 151
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

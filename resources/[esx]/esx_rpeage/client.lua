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
    {x = -1712.819, y = -672.777, z = 10.608},
    {x = -3038.377, y = 1217.721, z = 24.441},
    {x = -2616.471, y = 2285.812, z = 26.239},
    {x = 1497.062, y = 6438.526, z = 22.038},
    {x = 2529.312, y = 5091.513, z = 43.605},
    {x = 2699.882, y = 5126.114, z = 44.351},
    {x = 2718.649, y = 4386.351, z = 47.474},
    {x = 2885.027, y = 4436.957, z = 48.115},
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
    local maxspeed = 1
    local mphspeed = math.ceil(speed*3.6)
    if mphspeed > maxspeed and driver == pP then
        Citizen.Wait(250)
        TriggerServerEvent('fineAmount')
        exports.pNotify:SetQueueMax("left", 1)
        exports.pNotify:SendNotification({
            text = "<h2><center>Peage</center></h2>" .. "</br>Reçu ticket de Peage" .. "</br><p>Plaque d'Immatriculation : " .. plate .. "</br><p>Montant :&nbsp;" .. Config.Fine .. "€" .. "</br><p>N'oubliez pas que la route est limité à :&nbsp;" .. maxspeed .. "&nbsp;km/h" .. "</br>" .. "<h2><center>Merci et bonne journée</center></h2>",
            type = "error",
            timeout = 10000,
            layout = "centerLeft",
            queue = "left"
        })
    end
end

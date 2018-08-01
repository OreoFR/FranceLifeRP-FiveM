local PlayersWorking = {}
local Players = {}
local pointagebleu = 0
local pointagerouge = 0

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('esx:playerLoaded', function(source)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
end)


RegisterServerEvent('esx_paintball:pointage')
AddEventHandler('esx_paintball:pointage', function(modele)

if modele == 3 then
	if pointagerouge ~= 9 then
	pointagerouge = pointagerouge + 1
	TriggerClientEvent('showNotify', -1, "~g~Score ~r~Rouge : " .. pointagerouge .. "~b~ Bleu : " .. pointagebleu)
	else
	TriggerClientEvent('showNotify', -1, "~r~L\'équipe 1 à ~g~gagné~r~ le match de paintball !")
	pointagebleu = 0
    pointagerouge = 0
	end
end

if modele == 2 then
if pointagebleu ~= 9 then
pointagebleu = pointagebleu + 1
TriggerClientEvent('showNotify', -1, "~g~Score ~r~ Rouge : " .. pointagerouge .. " ~b~Bleu : " .. pointagebleu)
else
TriggerClientEvent('showNotify', -1, "~b~L\'équipe 2 à ~g~gagné~w~~b~ le match de paintball !")
pointagebleu = 0
pointagerouge = 0
end
end

end)



RegisterServerEvent('esx_paintball:remmetrezero')
AddEventHandler('esx_paintball:remmetrezero', function()

pointagebleu = 0
pointagerouge = 0

end)


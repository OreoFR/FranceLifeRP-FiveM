ESX = nil
local PlayersVente = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_brinks:GiveItem')
AddEventHandler('esx_brinks:GiveItem', function()
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  local Quantity = xPlayer.getInventoryItem(Config.Zones.Vente.ItemRequires).count

  if Quantity >= 20 then
    TriggerClientEvent('esx:showNotification', _source, _U('stop_npc'))
    return
  else
    local amount = Config.Zones.Vente.ItemAdd
    local item = Config.Zones.Vente.ItemDb_name
    xPlayer.addInventoryItem(item, amount)
    TriggerClientEvent('esx:showNotification', _source, 'Vous avez vidé ~g~x' .. amount .. ' DAB')
  end

end)

local function Vente(source)

  SetTimeout(Config.Zones.Vente.ItemTime, function()

    if PlayersVente[source] == true then

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local Quantity = xPlayer.getInventoryItem(Config.Zones.Vente.ItemRequires).count

    if Quantity < Config.Zones.Vente.ItemRemove then
      TriggerClientEvent('esx:showNotification', _source, '~r~Vous n\'avez plus de '..Config.Zones.Vente.ItemRequires_name..' à déposer.')
      PlayersVente[_source] = false
    else
      local amount = Config.Zones.Vente.ItemRemove
      local item = Config.Zones.Vente.ItemRequires
      xPlayer.removeInventoryItem(item, amount)
      xPlayer.addMoney(Config.Zones.Vente.ItemPrice)
      TriggerClientEvent('esx:showNotification', _source, 'Vous avez reçu ~g~$' .. Config.Zones.Vente.ItemPrice)
      Vente(_source)
    end

  end
end)
end

RegisterServerEvent('esx_brinks:startVente')
AddEventHandler('esx_brinks:startVente', function()

local _source = source

if PlayersVente[_source] == false then
  TriggerClientEvent('esx:showNotification', _source, '~r~Sortez et revenez dans la zone !')
  PlayersVente[_source] = false
else
  PlayersVente[_source] = true
  TriggerClientEvent('esx:showNotification', _source, '~g~Action ~w~en cours...')
  Vente(_source)
end
end)

RegisterServerEvent('esx_brinks:stopVente')
AddEventHandler('esx_brinks:stopVente', function()

local _source = source

if PlayersVente[_source] == true then
  PlayersVente[_source] = false
else
  PlayersVente[_source] = true
end
end)

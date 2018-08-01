ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('elec:vote')
AddEventHandler('elec:vote', function(candidate)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  local candidate = candidate

  MySQL.Async.execute('UPDATE users SET vote = @vote WHERE identifier = @identifier',{['@identifier'] = xPlayer.getIdentifier(),['@vote'] = candidate })
end)
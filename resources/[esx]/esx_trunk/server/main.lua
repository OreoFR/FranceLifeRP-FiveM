ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) 
  ESX = obj
end)

RegisterServerEvent('esx_truck_inventory:getInventory')
AddEventHandler('esx_truck_inventory:getInventory', function(plate)
  local inventory_ = {}
  local _source = source
  local xPlayer  = ESX.GetPlayerFromId(_source)
  MySQL.Async.fetchAll(
    'SELECT * FROM `truck_inventory` WHERE `plate` = @plate',
    {
      ['@plate'] = plate
    },
    function(inventory)
      if inventory ~= nil and #inventory > 0 then
        for i=1, #inventory, 1 do
          table.insert(inventory_, {
            name      = inventory[i].item,
            label      = inventory[i].name,
            count     = inventory[i].count
          })
        end
      end

    TriggerClientEvent('esx_truck_inventory:getItems', xPlayer.source, inventory_)
    end)
end)

RegisterServerEvent('esx_truck_inventory:getWeapon')
AddEventHandler('esx_truck_inventory:getWeapon', function(plate)
  local inventory_ = {}
  local _source = source
  local xPlayer  = ESX.GetPlayerFromId(_source)
  MySQL.Async.fetchAll(
    'SELECT * FROM `truck_inventory` WHERE `plate` = @plate',
    {
      ['@plate'] = plate
    },
    function(inventory)
      if inventory ~= nil and #inventory > 0 then
        for i=1, #inventory, 1 do
          table.insert(inventory_, {
            name      = inventory[i].item,
            label      = inventory[i].name,
            count     = inventory[i].count
          })
        end
      end

    TriggerClientEvent('esx_truck_inventory:getWeapons', xPlayer.source, inventory_)
    end)
end)

RegisterServerEvent('esx_truck_inventory:removeWeapon')
AddEventHandler('esx_truck_inventory:removeWeapon', function(plate, item, count)
  local _source = source
  local xPlayer  = ESX.GetPlayerFromId(_source)
  MySQL.Async.fetchAll(
    'UPDATE `truck_inventory` SET `count`= `count` - @qty WHERE `plate` = @plate AND `item`= @item',
    {
      ['@plate'] = plate,
      ['@qty'] = count,
      ['@item'] = item
    },
    function(result)
      if xPlayer ~= nil then
        xPlayer.addWeapon(item)
      end
    end)
end)

RegisterServerEvent('esx_truck_inventory:removeInventoryItem')
AddEventHandler('esx_truck_inventory:removeInventoryItem', function(plate, item, count)
  local _source = source
  local xPlayer  = ESX.GetPlayerFromId(_source)
  MySQL.Async.fetchAll(
    'UPDATE `truck_inventory` SET `count`= `count` - @qty WHERE `plate` = @plate AND `item`= @item',
    {
      ['@plate'] = plate,
      ['@qty'] = count,
      ['@item'] = item
    },
    function(result)
      if xPlayer ~= nil then
        xPlayer.addInventoryItem(item, count)
      end
    end)
end)

RegisterServerEvent('esx_truck_inventory:addInventoryItem')
AddEventHandler('esx_truck_inventory:addInventoryItem', function(type, model, plate, item, label, count, name)
  local _source = source
  local xPlayer  = ESX.GetPlayerFromId(_source)
  if not IsItemMaxedToVehicle(source, item, count, plate) then
    MySQL.Async.fetchAll(
      'INSERT INTO truck_inventory (item,label,count,plate,name) VALUES (@item,@label,@qty,@plate,@name) ON DUPLICATE KEY UPDATE count=count+ @qty',
      {
        ['@plate'] = plate,
        ['@qty'] = count,
        ['@item'] = item,
        ['@label'] = label,
        ['@name'] = name,
      },
      function(result)
        xPlayer.removeInventoryItem(item, count)
      end)
  else
      TriggerClientEvent('notify', source)
  end
end)

RegisterServerEvent('esx_truck_inventory:addWeapon')
AddEventHandler('esx_truck_inventory:addWeapon', function(type, model, plate, item, label, count, name)
  local _source = source
  local xPlayer  = ESX.GetPlayerFromId(_source)
    MySQL.Async.fetchAll(
      'INSERT INTO truck_inventory (item,label,count,plate,name) VALUES (@item,@label,@qty,@plate,@name) ON DUPLICATE KEY UPDATE count=count+ @qty',
      {
        ['@plate'] = plate,
        ['@qty'] = count,
        ['@item'] = item,
        ['@label'] = label,
        ['@name'] = name,
      },
      function(result)
        xPlayer.removeWeapon(item)
      end)
end)

function IsItemMaxedToVehicle(player, item, count, plate)
local xPlayer = ESX.GetPlayerFromId(player)
local itemMax = xPlayer.getInventoryItem(item).limit
local amountToAdd = countx
local vInvItemCount = GetVehInventoryItemCount(plate, item)
  if vInvItemCount ~= nil then
    if count + vInvItemCount <= itemMax then
      return false
    elseif count + vInvItemCount > itemMax then
      return true
    end
  else
    if count + 0 <= itemMax then
      return false
    elseif count + 0 > itemMax then
      return true
    end
  end
end

function GetVehInventoryItemCount(plate, itemname)

    local result = MySQL.Sync.fetchAll("SELECT * FROM truck_inventory WHERE plate = @plate and item = @item", {
      ['@plate'] = plate,
      ['@item']  = itemname
    })

    local veh     = result[1]

    if veh ~= nil then
      return(veh["count"])
    else
      return 0
    end

end
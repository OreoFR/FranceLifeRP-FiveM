ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
  TriggerEvent('esx_service:activateService', 'driveschool', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'driveschool', _U('unicorn_customer'), true, true)
TriggerEvent('esx_society:registerSociety', 'driveschool', 'Auto-école', 'society_driveschool', 'society_driveschool', 'society_driveschool', {type = 'private'})



RegisterServerEvent('esx_driveschool:getStockItem')
AddEventHandler('esx_driveschool:getStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_driveschool', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

  end)

end)

ESX.RegisterServerCallback('esx_driveschool:getStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_driveschool', function(inventory)
    cb(inventory.items)
  end)

end)

RegisterServerEvent('esx_driveschool:putStockItems')
AddEventHandler('esx_driveschool:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_driveschool', function(inventory)

    local item = inventory.getItem(itemName)
    local playerItemCount = xPlayer.getInventoryItem(itemName).count

    if item.count >= 0 and count <= playerItemCount then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

  end)

end)


RegisterServerEvent('esx_driveschool:getFridgeStockItem')
AddEventHandler('esx_driveschool:getFridgeStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_driveschool_fridge', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

  end)

end)

ESX.RegisterServerCallback('esx_driveschool:getFridgeStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_driveschool_fridge', function(inventory)
    cb(inventory.items)
  end)

end)

RegisterServerEvent('esx_driveschool:putFridgeStockItems')
AddEventHandler('esx_driveschool:putFridgeStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_driveschool_fridge', function(inventory)

    local item = inventory.getItem(itemName)
    local playerItemCount = xPlayer.getInventoryItem(itemName).count

    if item.count >= 0 and count <= playerItemCount then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

  end)

end)


RegisterServerEvent('esx_driveschool:buyItem')
AddEventHandler('esx_driveschool:buyItem', function(itemName, price, itemLabel)

    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local limit = xPlayer.getInventoryItem(itemName).limit
    local qtty = xPlayer.getInventoryItem(itemName).count
    local societyAccount = nil

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_driveschool', function(account)
        societyAccount = account
      end)
    
    if societyAccount ~= nil and societyAccount.money >= price then
        if qtty < limit then
            societyAccount.removeMoney(price)
            xPlayer.addInventoryItem(itemName, 1)
            TriggerClientEvent('esx:showNotification', _source, _U('bought') .. itemLabel)
        else
            TriggerClientEvent('esx:showNotification', _source, _U('max_item'))
        end
    else
        TriggerClientEvent('esx:showNotification', _source, _U('not_enough'))
    end

end)


ESX.RegisterServerCallback('esx_driveschool:getPlayerInventory', function(source, cb)

  local xPlayer    = ESX.GetPlayerFromId(source)
  local items      = xPlayer.inventory

  cb({
    items      = items
  })

end)

RegisterServerEvent('esx_driveschool:crafting')
AddEventHandler('esx_driveschool:crafting', function(itemValue)

    local _source = source
    local _itemValue = itemValue
    TriggerClientEvent('esx:showNotification', _source, _U('assembling'))

    if _itemValue == 'dmv' then
        SetTimeout(1000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('dmv').count

                    TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('dmv') .. ' ~w~!')
                    xPlayer.addInventoryItem('dmv', 1)
        end)
    end

    if _itemValue == 'drive' then
        SetTimeout(1000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('drive').count

                    TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('drive') .. ' ~w~!')
                    xPlayer.addInventoryItem('drive', 1)
        end)
    end
    
    if _itemValue == 'drive_bike' then
        SetTimeout(1000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('drive_bike').count

                    TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('drive_bike') .. ' ~w~!')
                    xPlayer.addInventoryItem('drive_bike', 1)
        end)
    end

    if _itemValue == 'drive_truck' then
        SetTimeout(1000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('drive_truck').count

                    TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('drive_truck') .. ' ~w~!')
                    xPlayer.addInventoryItem('drive_truck', 1)
        end)
    end
end)
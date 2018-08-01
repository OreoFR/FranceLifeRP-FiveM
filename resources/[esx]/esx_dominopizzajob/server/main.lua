ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
  TriggerEvent('esx_service:activateService', 'pizza', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'pizza', _U('unicorn_customer'), true, true)
TriggerEvent('esx_society:registerSociety', 'pizza', 'Domino\'s', 'society_pizza', 'society_pizza', 'society_pizza', {type = 'private'})



RegisterServerEvent('esx_dominopizzajob:getStockItem')
AddEventHandler('esx_dominopizzajob:getStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pizza', function(inventory)

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

ESX.RegisterServerCallback('esx_dominopizzajob:getStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pizza', function(inventory)
    cb(inventory.items)
  end)

end)

RegisterServerEvent('esx_dominopizzajob:putStockItems')
AddEventHandler('esx_dominopizzajob:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pizza', function(inventory)

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


RegisterServerEvent('esx_dominopizzajob:getFridgeStockItem')
AddEventHandler('esx_dominopizzajob:getFridgeStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pizza_fridge', function(inventory)

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

ESX.RegisterServerCallback('esx_dominopizzajob:getFridgeStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pizza_fridge', function(inventory)
    cb(inventory.items)
  end)

end)

RegisterServerEvent('esx_dominopizzajob:putFridgeStockItems')
AddEventHandler('esx_dominopizzajob:putFridgeStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pizza_fridge', function(inventory)

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


RegisterServerEvent('esx_dominopizzajob:buyItem')
AddEventHandler('esx_dominopizzajob:buyItem', function(itemName, price, itemLabel)

    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local limit = xPlayer.getInventoryItem(itemName).limit
    local qtty = xPlayer.getInventoryItem(itemName).count
    local societyAccount = nil

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_pizza', function(account)
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


RegisterServerEvent('esx_dominopizzajob:craftingCoktails')
AddEventHandler('esx_dominopizzajob:craftingCoktails', function(itemValue)

    local _source = source
    local _itemValue = itemValue
    TriggerClientEvent('esx:showNotification', _source, _U('assembling_cocktail'))
    
    if _itemValue == 'pateapizza' then
        SetTimeout(2000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local waterQuantity     = xPlayer.getInventoryItem('water').count
            local flourQuantity      = xPlayer.getInventoryItem('flour').count
            local levureQuantity      = xPlayer.getInventoryItem('levure').count

            if waterQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('water') .. '~w~')
            elseif flourQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('flour') .. '~w~')
            elseif levureQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('levure') .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
                    xPlayer.removeInventoryItem('water', 1)
                    xPlayer.removeInventoryItem('flour', 1)
                    xPlayer.removeInventoryItem('levure', 1)
                else
                    TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('pateapizza') .. ' ~w~!')
                    xPlayer.removeInventoryItem('water', 1)
                    xPlayer.removeInventoryItem('flour', 1)
                    xPlayer.removeInventoryItem('levure', 1)
                    xPlayer.addInventoryItem('pateapizza', 1)
                end
            end

        end)
    end

    if _itemValue == 'pizza1' then -- Chorizo
        SetTimeout(2000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local pateQuantity     = xPlayer.getInventoryItem('pateapizza').count
            local tomateQuantity      = xPlayer.getInventoryItem('saucetomate').count
            local chorizoQuantity      = xPlayer.getInventoryItem('chorizo').count
            local fromageQuantity      = xPlayer.getInventoryItem('fromage').count

            if pateQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('pateapizza') .. '~w~')
            elseif tomateQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('tomate') .. '~w~')
            elseif chorizoQuantity < 3 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('chorizo') .. '~w~')
            elseif fromageQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('fromage') .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
                    xPlayer.removeInventoryItem('pateapizza', 2)
                    xPlayer.removeInventoryItem('saucetomate', 1)
                    xPlayer.removeInventoryItem('chorizo', 3)
                    xPlayer.removeInventoryItem('fromage', 1)
                else
                    TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('pizza1') .. ' ~w~!')
                    xPlayer.removeInventoryItem('pateapizza', 2)
                    xPlayer.removeInventoryItem('saucetomate', 1)
                    xPlayer.removeInventoryItem('chorizo', 3)
                    xPlayer.removeInventoryItem('fromage', 1)
                    xPlayer.addInventoryItem('pizza_chorizo', 1)
                end
            end

        end)
    end

    if _itemValue == 'pizza2' then -- Canibale
        SetTimeout(2000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local pateQuantity     = xPlayer.getInventoryItem('pateapizza').count
            local tomateQuantity      = xPlayer.getInventoryItem('saucetomate').count
            local mozzaQuantity      = xPlayer.getInventoryItem('mozzarella').count
            local lardonQuantity      = xPlayer.getInventoryItem('lardon').count
            local merguezQuantity      = xPlayer.getInventoryItem('merguez').count
            local viandeQuantity      = xPlayer.getInventoryItem('viandehache').count

            if pateQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('pateapizza') .. '~w~')
            elseif tomateQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('saucetomate') .. '~w~')
            elseif mozzaQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('mozzarella') .. '~w~')
            elseif lardonQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('lardon') .. '~w~')
            elseif merguezQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('merguez') .. '~w~')
            elseif viandeQuantity < 3 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('viandehache') .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
                    xPlayer.removeInventoryItem('pateapizza', 2)
                    xPlayer.removeInventoryItem('saucetomate', 2)
                    xPlayer.removeInventoryItem('mozzarella', 2)
                    xPlayer.removeInventoryItem('lardon', 1)
                    xPlayer.removeInventoryItem('merguez', 2)
                    xPlayer.removeInventoryItem('viandehache', 3)
                else
                    TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('pizza2') .. ' ~w~!')
                    xPlayer.removeInventoryItem('pateapizza', 2)
                    xPlayer.removeInventoryItem('saucetomate', 2)
                    xPlayer.removeInventoryItem('mozzarella', 2)
                    xPlayer.removeInventoryItem('lardon', 1)
                    xPlayer.removeInventoryItem('merguez', 2)
                    xPlayer.removeInventoryItem('viandehache', 3)
                    xPlayer.addInventoryItem('pizza_canibale', 1)
                end
            end

        end)
    end

    if _itemValue == 'pizza3' then -- Barbecue
        SetTimeout(2000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local pateQuantity     = xPlayer.getInventoryItem('pateapizza').count
            local tomateQuantity      = xPlayer.getInventoryItem('saucetomate').count
            local barbecueQuantity      = xPlayer.getInventoryItem('saucebarbecue').count
            local merguezQuantity      = xPlayer.getInventoryItem('merguez').count
            local viandeQuantity      = xPlayer.getInventoryItem('viandehache').count

            if pateQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('pateapizza') .. '~w~')
            elseif tomateQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('saucetomate') .. '~w~')
            elseif barbecueQuantity < 4 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('saucebarbecue') .. '~w~')            
            elseif merguezQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('merguez') .. '~w~')
            elseif viandeQuantity < 3 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('viandehache') .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
                    xPlayer.removeInventoryItem('pateapizza', 2)
                    xPlayer.removeInventoryItem('saucetomate', 2)
                    xPlayer.removeInventoryItem('saucebarbecue', 4)
                    xPlayer.removeInventoryItem('merguez', 2)
                    xPlayer.removeInventoryItem('viandehache', 3)
                else
                    TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('pizza3') .. ' ~w~!')
                    xPlayer.removeInventoryItem('pateapizza', 2)
                    xPlayer.removeInventoryItem('saucetomate', 2)
                    xPlayer.removeInventoryItem('saucebarbecue', 4)
                    xPlayer.removeInventoryItem('merguez', 2)
                    xPlayer.removeInventoryItem('viandehache', 3)
                    xPlayer.addInventoryItem('pizza_barbecue', 1)
                end
            end

        end)
    end

    if _itemValue == 'pizza4' then -- Saumon
        SetTimeout(2000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local pateQuantity     = xPlayer.getInventoryItem('pateapizza').count
            local cremeQuantity      = xPlayer.getInventoryItem('cremefraiche').count
            local saumonQuantity      = xPlayer.getInventoryItem('saumon').count
            local ananasQuantity      = xPlayer.getInventoryItem('ananas').count
            local origanQuantity      = xPlayer.getInventoryItem('origan').count

            if pateQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('pateapizza') .. '~w~')
            elseif cremeQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('cremefraiche') .. '~w~')
            elseif saumonQuantity < 3 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('saumon') .. '~w~')            
            elseif ananasQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('ananas') .. '~w~')
            elseif origanQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('origan') .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
                    xPlayer.removeInventoryItem('pateapizza', 2)
                    xPlayer.removeInventoryItem('cremefraiche', 2)
                    xPlayer.removeInventoryItem('saumon', 3)
                    xPlayer.removeInventoryItem('ananas', 1)
                    xPlayer.removeInventoryItem('origan', 1)
                else
                    TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('pizza4') .. ' ~w~!')
                    xPlayer.removeInventoryItem('pateapizza', 2)
                    xPlayer.removeInventoryItem('cremefraiche', 2)
                    xPlayer.removeInventoryItem('saumon', 3)
                    xPlayer.removeInventoryItem('ananas', 1)
                    xPlayer.removeInventoryItem('origan', 1)
                    xPlayer.addInventoryItem('pizza_saumon', 1)
                end
            end

        end)
    end

    if _itemValue == 'pizza5' then -- Thon
        SetTimeout(2000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local pateQuantity     = xPlayer.getInventoryItem('pateapizza').count
            local tomateQuantity      = xPlayer.getInventoryItem('saucetomate').count
            local thonQuantity      = xPlayer.getInventoryItem('thon').count
            local cheeseQuantity      = xPlayer.getInventoryItem('fromage').count
            local oliveQuantity      = xPlayer.getInventoryItem('olive').count
            local mozzaQuantity      = xPlayer.getInventoryItem('mozzarella').count

            if pateQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('pateapizza') .. '~w~')
            elseif tomateQuantity < 3 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('saucetomate') .. '~w~')
            elseif thonQuantity < 4 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('thon') .. '~w~')            
            elseif cheeseQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('fromage') .. '~w~')
            elseif oliveQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('olive') .. '~w~')
            elseif mozzaQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('mozzarella') .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
                    xPlayer.removeInventoryItem('pateapizza', 2)
                    xPlayer.removeInventoryItem('saucetomate', 3)
                    xPlayer.removeInventoryItem('thon', 4)
                    xPlayer.removeInventoryItem('fromage', 2)
                    xPlayer.removeInventoryItem('olive', 1)
                    xPlayer.removeInventoryItem('mozzarella', 1)
                else
                    TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('pizza5') .. ' ~w~!')
                    xPlayer.removeInventoryItem('pateapizza', 2)
                    xPlayer.removeInventoryItem('saucetomate', 3)
                    xPlayer.removeInventoryItem('thon', 4)
                    xPlayer.removeInventoryItem('fromage', 2)
                    xPlayer.removeInventoryItem('olive', 1)
                    xPlayer.removeInventoryItem('mozzarella', 1)
                    xPlayer.addInventoryItem('pizza_thon', 1)
                end
            end

        end)
    end

    if _itemValue == 'pizza6' then -- 4 Fromage
        SetTimeout(2000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local pateQuantity     = xPlayer.getInventoryItem('pateapizza').count
            local tomateQuantity      = xPlayer.getInventoryItem('saucetomate').count
            local cheeseQuantity      = xPlayer.getInventoryItem('mozzarella').count
            local mozzaQuantity      = xPlayer.getInventoryItem('fromage').count

            if pateQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('pateapizza') .. '~w~')
            elseif tomateQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('saucetomate') .. '~w~')        
            elseif cheeseQuantity < 9 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('mozzarella') .. '~w~')
            elseif mozzaQuantity < 3 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('fromage') .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
                    xPlayer.removeInventoryItem('pateapizza', 2)
                    xPlayer.removeInventoryItem('saucetomate', 1)
                    xPlayer.removeInventoryItem('mozzarella', 9)
                    xPlayer.removeInventoryItem('fromage', 3)
                else
                    TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('pizza6') .. ' ~w~!')
                    xPlayer.removeInventoryItem('pateapizza', 2)
                    xPlayer.removeInventoryItem('saucetomate', 1)
                    xPlayer.removeInventoryItem('mozzarella', 9)
                    xPlayer.removeInventoryItem('fromage', 3)
                    xPlayer.addInventoryItem('pizza_4fromage', 1)
                end
            end

        end)
    end

    if _itemValue == 'pizza7' then -- Hawaienne Fromage
        SetTimeout(2000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local pateQuantity     = xPlayer.getInventoryItem('pateapizza').count
            local tomateQuantity      = xPlayer.getInventoryItem('saucetomate').count
            local cheeseQuantity      = xPlayer.getInventoryItem('ananas').count
            local mozzaQuantity      = xPlayer.getInventoryItem('fromage').count
            local jambonQuantity      = xPlayer.getInventoryItem('jambon').count

            if pateQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('pateapizza') .. '~w~')
            elseif tomateQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('saucetomate') .. '~w~')        
            elseif cheeseQuantity < 8 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('ananas') .. '~w~')
            elseif mozzaQuantity < 3 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('fromage') .. '~w~')
            elseif jambonQuantity < 5 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('jambon') .. '~w~')
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
                    xPlayer.removeInventoryItem('pateapizza', 2)
                    xPlayer.removeInventoryItem('saucetomate', 1)
                    xPlayer.removeInventoryItem('ananas', 8)
                    xPlayer.removeInventoryItem('fromage', 3)
                    xPlayer.removeInventoryItem('jambon', 5)
                else
                    TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('pizza7') .. ' ~w~!')
                    xPlayer.removeInventoryItem('pateapizza', 2)
                    xPlayer.removeInventoryItem('saucetomate', 1)
                    xPlayer.removeInventoryItem('ananas', 8)
                    xPlayer.removeInventoryItem('fromage', 3)
                    xPlayer.removeInventoryItem('jambon', 5)
                    xPlayer.addInventoryItem('pizza_hawaienne', 1)
                end
            end

        end)
    end

    if _itemValue == 'salade' then -- Salade Fraiche
        SetTimeout(2000, function()        

            local xPlayer           = ESX.GetPlayerFromId(_source)

            local saladeQuantity     = xPlayer.getInventoryItem('salade').count
            local tomateQuantity      = xPlayer.getInventoryItem('tomate').count
            local vinaigretteQuantity      = xPlayer.getInventoryItem('vinaigrette').count

            if saladeQuantity < 5 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('salade') .. '~w~')
            elseif tomateQuantity < 5 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('tomate') .. '~w~')
            elseif vinaigretteQuantity < 5 then
                TriggerClientEvent('esx:showNotification', _source, _U('not_enough') .. _U('vinaigrette') .. '~w~')            
            else
                local chanceToMiss = math.random(100)
                if chanceToMiss <= Config.MissCraft then
                    TriggerClientEvent('esx:showNotification', _source, _U('craft_miss'))
                    xPlayer.removeInventoryItem('salade', 5)
                    xPlayer.removeInventoryItem('tomate', 5)
                    xPlayer.removeInventoryItem('vinaigrette', 5)
                else
                    TriggerClientEvent('esx:showNotification', _source, _U('craft') .. _U('salade') .. ' ~w~!')
                    xPlayer.removeInventoryItem('salade', 5)
                    xPlayer.removeInventoryItem('tomate', 5)
                    xPlayer.removeInventoryItem('vinaigrette', 5)
                    xPlayer.addInventoryItem('saladef', 1)
                end
            end

        end)
    end
end)


ESX.RegisterServerCallback('esx_dominopizzajob:getVaultWeapons', function(source, cb)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_pizza', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)

ESX.RegisterServerCallback('esx_dominopizzajob:addVaultWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_pizza', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('esx_dominopizzajob:removeVaultWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_pizza', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('esx_dominopizzajob:getPlayerInventory', function(source, cb)

  local xPlayer    = ESX.GetPlayerFromId(source)
  local items      = xPlayer.inventory

  cb({
    items      = items
  })

end)


ESX.RegisterUsableItem('pizza_chorizo', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('pizza_chorizo', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
    TriggerClientEvent('esx_basicneeds:onEat', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_pizza_chorizo'))

end)

ESX.RegisterUsableItem('pizza_canibale', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('pizza_canibale', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 600000)
    TriggerClientEvent('esx_basicneeds:onEat', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_pizza_canibale'))

end)

ESX.RegisterUsableItem('pizza_barbecue', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('pizza_barbecue', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 550000)
    TriggerClientEvent('esx_basicneeds:onEat', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_pizza_barbecue'))

end)

ESX.RegisterUsableItem('pizza_saumon', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('pizza_saumon', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
    TriggerClientEvent('esx_basicneeds:onEat', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_pizza_saumon'))

end)

ESX.RegisterUsableItem('pizza_thon', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('pizza_thon', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
    TriggerClientEvent('esx_basicneeds:onEat', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_pizza_thon'))

end)

ESX.RegisterUsableItem('pizza_4fromage', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('pizza_4fromage', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
    TriggerClientEvent('esx_basicneeds:onEat', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_pizza_4fromage'))

end)

ESX.RegisterUsableItem('pizza_hawaienne', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('pizza_hawaienne', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 450000)
    TriggerClientEvent('esx_basicneeds:onEat', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_pizza_hawaienne'))

end)

ESX.RegisterUsableItem('saladef', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('saladef', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 250000)
    TriggerClientEvent('esx_basicneeds:onEat', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_saladef'))

end)

ESX.RegisterUsableItem('coca', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('coca', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 333333)
    TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_coca'))

end)

ESX.RegisterUsableItem('fanta', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('fanta', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 333333)
    TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_fanta'))

end)

ESX.RegisterUsableItem('sprite', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('sprite', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 333333)
    TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_sprite'))

end)

ESX.RegisterUsableItem('oasis', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('oasis', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 333333)
    TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_oasis'))

end)

ESX.RegisterUsableItem('7up', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('7up', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 333333)
    TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_7up'))

end)

ESX.RegisterUsableItem('orangina', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('orangina', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 333333)
    TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_orangina'))

end)

ESX.RegisterUsableItem('minute_maid', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('minute_maid', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 333333)
    TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_minute_maid'))

end)

ESX.RegisterUsableItem('pepsi', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('pepsi', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 333333)
    TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_pepsi'))

end)

ESX.RegisterUsableItem('tropico', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('tropico', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 333333)
    TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_tropico'))

end)

ESX.RegisterUsableItem('redbull', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('redbull', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 500000)
    TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_redbull'))

end)

ESX.RegisterUsableItem('monster', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('monster', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 500000)
    TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_monster'))

end)

ESX.RegisterUsableItem('glace', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('glace', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
    TriggerClientEvent('esx_basicneeds:onEat', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_glace'))

end)

ESX.RegisterUsableItem('beignet', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('beignet', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('esx_basicneeds:onEat', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_beignet'))

end)

ESX.RegisterUsableItem('tiramisu', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('tiramisu', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('esx_basicneeds:onEat', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_tiramisu'))

end)

ESX.RegisterUsableItem('yaourt', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('yaourt', 1)

    TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
    TriggerClientEvent('esx_basicneeds:onEat', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_yaourt'))

end)

ESX.RegisterUsableItem('chocolatchaud', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('chocolatchaud', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
    TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_chocolatchaud'))

end)

ESX.RegisterUsableItem('cafe', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('cafe', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
    TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_cafe'))

end)

ESX.RegisterUsableItem('the', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('the', 1)

    TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
    TriggerClientEvent('esx_basicneeds:onDrink', source)
    TriggerClientEvent('esx:showNotification', source, _U('used_the'))

end)
ESX = nil
local arrayWeight = Config.localWeight
local VehicleList = { }

TriggerEvent('esx:getSharedObject', function(obj)
  ESX = obj
end)

RegisterServerEvent('esx_truck_inventory:getOwnedVehicule')
AddEventHandler('esx_truck_inventory:getOwnedVehicule', function()
  local vehicules = {}
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  MySQL.Async.fetchAll(
      'SELECT * FROM owned_vehicles WHERE owner = @owner',
   		{
   			['@owner'] = xPlayer.identifier
   		},
    function(result)
      if result ~= nil and #result > 0 then
          for _,v in pairs(result) do
      			local vehicle = json.decode(v.vehicle)
      			table.insert(vehicules, {plate = vehicle.plate})
      		end
      end
    TriggerClientEvent('esx_truck_inventory:setOwnedVehicule', _source, vehicules)
    end)
end)

AddEventHandler('onMySQLReady', function ()
	MySQL.Async.execute( 'DELETE FROM `truck_inventory` WHERE `owned` = 0 OR `count` = 0', {})
end)



function getInventoryWeight(inventory)
  local weight = 0
  local itemWeight = 0

  if inventory ~= nil then
	  for i=1, #inventory, 1 do
	    if inventory[i] ~= nil then
	      itemWeight = Config.DefaultWeight
	      if arrayWeight[inventory[i].name] ~= nil then
	        itemWeight = arrayWeight[inventory[i].name]
	      end
	      weight = weight + (itemWeight * inventory[i].count)
	    end
	  end
  end
  return weight
end



RegisterServerEvent('esx_truck_inventory:getInventory')
AddEventHandler('esx_truck_inventory:getInventory', function(plate)
  local inventory_ = {}
  local _source = source
  MySQL.Async.fetchAll(
    'SELECT * FROM `truck_inventory` WHERE `plate` = @plate',
    {
      ['@plate'] = plate
    },
    function(inventory)
      if inventory ~= nil and #inventory > 0 then
        for i=1, #inventory, 1 do
		  if inventory[i].count > 0 then
			table.insert(inventory_, {
			  label      = inventory[i].name,
			  name      = inventory[i].item,
			  count     = inventory[i].count,
			  type	  = inventory[i].itemt
			})
		   end
        end
      end
    local weight = (getInventoryWeight(inventory_))
    local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_truck_inventory:getInventoryLoaded', xPlayer.source, inventory_,weight)
    end)
end)


RegisterServerEvent('esx_truck_inventory:removeInventoryItem')
AddEventHandler('esx_truck_inventory:removeInventoryItem', function(plate, item, itemType, count)
  local _source = source
  local xPlayer  = ESX.GetPlayerFromId(_source)
  MySQL.Async.execute( 'UPDATE `truck_inventory` SET `count`= `count` - @qty WHERE `plate` = @plate AND `item`= @item AND `itemt`= @itemt',
    {
      ['@plate'] = plate,
      ['@qty'] = count,
      ['@item'] = item,
	  ['@itemt'] = itemType
    })
	if xPlayer ~= nil then
		if itemType == 'item_standard' then
			xPlayer.addInventoryItem(item, count)
		end 

		if itemType == 'item_account' then
			xPlayer.addAccountMoney(item, count)
		end

		if itemType == 'item_weapon' then
			xPlayer.addWeapon(item, count)
		end
	end
end)


RegisterServerEvent('esx_truck_inventory:addInventoryItem')
AddEventHandler('esx_truck_inventory:addInventoryItem', function(type, model, plate, item, qtty, name,itemType, ownedV)
  local _source = source
  local xPlayer  = ESX.GetPlayerFromId(_source)
  
  MySQL.Async.execute( 'INSERT INTO truck_inventory (item,count,plate,name,itemt,owned) VALUES (@item,@qty,@plate,@name,@itemt,@owned) ON DUPLICATE KEY UPDATE count=count+ @qty',
    {
      ['@plate'] = plate,
      ['@qty'] = qtty,
      ['@item'] = item,
      ['@name'] = name,
	  ['@itemt'] = itemType,
      ['@owned'] = ownedV,
    })
	
	if xPlayer ~= nil then
		if itemType == 'item_standard' then
			local playerItemCount = xPlayer.getInventoryItem(item).count
			if playerItemCount >= qtty then
			   xPlayer.removeInventoryItem(item, qtty)
			else
			  TriggerClientEvent('esx:showNotification', _source, 'quantité invalide')
			end
		end

		if itemType == 'item_account' then
			xPlayer.removeAccountMoney(item, qtty)
		end

		if itemType == 'item_weapon' then
			xPlayer.removeWeapon(item, qtty)
		end
	end
end)

ESX.RegisterServerCallback('esx_truck:checkvehicle',function(source,cb, vehicleplate)
	local isFound = false
	local _source = source
	local plate = vehicleplate
	if plate ~= " " or plate ~= nil or plate ~= "" then
		for _,v in pairs(VehicleList) do
			if(plate == v.vehicleplate) then
				isFound = true
				break
				
			end	
		end
	else
		isFound = true
	end
	cb(isFound)
end)


RegisterServerEvent('esx_truck_inventory:AddVehicleList')
AddEventHandler('esx_truck_inventory:AddVehicleList', function(plate)
	local plateisfound = false
	for _,v in pairs(VehicleList) do
		if(plate == v.vehicleplate) then
			plateisfound = true
			break
		end		
	end
	if not plateisfound then
		table.insert(VehicleList, {vehicleplate = plate})
	end
end)

RegisterServerEvent('esx_truck_inventory:RemoveVehicleList')
AddEventHandler('esx_truck_inventory:RemoveVehicleList', function(plate)
	for i=1, #VehicleList, 1 do
		if VehicleList[i].vehicleplate == plate then
			if VehicleList[i].vehicleplate ~= " " or plate ~= " " or VehicleList[i].vehicleplate ~= nil or plate ~= nil or VehicleList[i].vehicleplate ~= "" or plate ~= "" then
				table.remove(VehicleList, i)
				break
			end
		end
	end
end)


function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

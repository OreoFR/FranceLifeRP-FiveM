ESX                = nil
PlayersHarvesting  = {}
MarketPrices		= {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_phone:registerNumber', 'foodtruck', 'Foodtruck', false, false)
TriggerEvent('esx_society:registerSociety', 'foodtruck', 'Foodtruck', 'society_foodtruck', 'society_foodtruck', 'society_foodtruck', {type = 'public'})


if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'foodtruck', Config.MaxInService)
end

AddEventHandler('onMySQLReady', function ()
	MySQL.Async.fetchAll("SELECT * FROM `shopfoodtruck` WHERE `name` = 'Market'",
		{},
		function(result)
			MySQL.Async.fetchAll("SELECT * FROM `items`",
				{},
				function(result2)
					for i=1, #result2, 1 do
						for j=1, #result, 1 do
							if result[j].item == result2[i].name then
								table.insert(MarketPrices, {label = result2[i].label, item = result[j].item, price = result[j].price})
								break
							end
						end
					end
				end
			)			
		end
	)
end)

ESX.RegisterServerCallback('esx_foodtruck:getStock', function(source, cb)
	local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)

	local fridge = {}

	for k,v in pairs(Config.Fridge) do
		for i=1, #xPlayer.inventory, 1 do
			if xPlayer.inventory[i].name == k then
					table.insert(fridge, xPlayer.inventory[i])
				break
			end
		end
	end

	cb(fridge, MarketPrices)
end)

RegisterServerEvent('esx_foodtruck:buyItem')
AddEventHandler('esx_foodtruck:buyItem', function(qtty, item)
	local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)

	for i=1, #MarketPrices, 1 do
		if item == MarketPrices[i].item then
			if qtty == -1 then -- ready for when I add the 'buy max' option
				local delta = max - stock
				local total = MarketPrices[i].price * delta
				if xPlayer.getMoney() > total then
					xPlayer.addInventoryItem(item, delta)
					xPlayer.removeMoney(total)
					TriggerClientEvent('esx:showNotification', _source, _U('purchased'))
				else
					TriggerClientEvent('esx:showNotification', _source, _U('no_money'))
				end
			else
				local total = MarketPrices[i].price * qtty
				if xPlayer.getMoney() > total then
					xPlayer.addInventoryItem(item, qtty)
					xPlayer.removeMoney(total)
					TriggerClientEvent('esx:showNotification', _source, _U('purchased'))
				else
					TriggerClientEvent('esx:showNotification', _source, _U('no_money'))
				end
			end
			break
		end
	end
	
	TriggerClientEvent('esx_foodtruck:refreshMarket', _source)
end)

RegisterServerEvent('esx_foodtruck:removeItem')
AddEventHandler('esx_foodtruck:removeItem', function(item, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeInventoryItem(item, count)
end)

RegisterServerEvent('esx_foodtruck:addItem')
AddEventHandler('esx_foodtruck:addItem', function(item, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addInventoryItem(item, count)
end)

---------------------------- register usable item --------------------------------------------------
ESX.RegisterUsableItem('cola', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('cola', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 300000)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ecola_can')
    TriggerClientEvent('esx:showNotification', source, _U('drank_coke'))
end)

ESX.RegisterUsableItem('burger', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('burger', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
	TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_cs_burger_01')
    TriggerClientEvent('esx:showNotification', source, _U('eat_burger'))
end)

ESX.RegisterUsableItem('tacos', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('tacos', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
	TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_taco_01')
    TriggerClientEvent('esx:showNotification', source, _U('eat_taco'))
end)

ESX.RegisterUsableItem('pizza', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('pizza', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
	TriggerClientEvent('esx_basicneeds:onEat', source, 'v_res_tt_pizzaplate')
    TriggerClientEvent('esx:showNotification', source, _U('eat_pizza'))
end)

ESX.RegisterUsableItem('saladef', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('saladef', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 500000)
	TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_taco_01')
    TriggerClientEvent('esx:showNotification', source, _U('eat_salade'))
end)
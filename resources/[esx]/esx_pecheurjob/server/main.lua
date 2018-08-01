-----------------------------------------
-- Created and modify by L'ile Légale RP
-- SenSi and Kaminosekai
-----------------------------------------

ESX = nil
local PlayersTransforming  = {}
local PlayersSelling       = {}
local PlayersHarvesting = {}
local saumon_fume = 1
local boite_thon = 1
local samoussa_crevette = 1
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'pecheur', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'pecheur', _U('pecheur_client'), true, true)
TriggerEvent('esx_society:registerSociety', 'pecheur', 'Pécheur', 'society_pecheur', 'society_pecheur', 'society_pecheur', {type = 'private'})
local function Harvest1(source, zone)
	if PlayersHarvesting[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "SaumonFarm" then
			local itemQuantity = xPlayer.getInventoryItem('saumon').count
			if itemQuantity >= 50 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_place1'))
				return
			else
				SetTimeout(3000, function()
					xPlayer.addInventoryItem('saumon', 1)
					Harvest1(source, zone)
				end)
			end
		end
	end
end

RegisterServerEvent('esx_pecheurjob:startHarvest1')
AddEventHandler('esx_pecheurjob:startHarvest1', function(zone)

	local _source = source

	PlayersHarvesting[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('saumon_taken'))

	Harvest1(_source,zone)

end)

RegisterServerEvent('esx_pecheurjob:stopHarvest1')
AddEventHandler('esx_pecheurjob:stopHarvest1', function()

	local _source = source

	PlayersHarvesting[_source] = false

end)

local function Harvest2(source, zone)
	if PlayersHarvesting[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "ThonFarm" then
			local itemQuantity = xPlayer.getInventoryItem('thon').count
			if itemQuantity >= 50 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_place2'))
				return
			else
				SetTimeout(3000, function()
					xPlayer.addInventoryItem('thon', 1)
					Harvest2(source, zone)
				end)
			end
		end
	end
end

RegisterServerEvent('esx_pecheurjob:startHarvest2')
AddEventHandler('esx_pecheurjob:startHarvest2', function(zone)

	local _source = source

	PlayersHarvesting[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('thon_taken'))

	Harvest2(_source,zone)

end)

RegisterServerEvent('esx_pecheurjob:stopHarvest2')
AddEventHandler('esx_pecheurjob:stopHarvest2', function()

	local _source = source

	PlayersHarvesting[_source] = false

end)

local function Harvest3(source, zone)
	if PlayersHarvesting[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "CrevetteFarm" then
			local itemQuantity = xPlayer.getInventoryItem('crevette').count
			if itemQuantity >= 50 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_place3'))
				return
			else
				SetTimeout(3000, function()
					xPlayer.addInventoryItem('crevette', 1)
					Harvest3(source, zone)
				end)
			end
		end
	end
end

RegisterServerEvent('esx_pecheurjob:startHarvest3')
AddEventHandler('esx_pecheurjob:startHarvest3', function(zone)

	local _source = source

	PlayersHarvesting[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('crevette_taken'))

	Harvest3(_source,zone)

end)

RegisterServerEvent('esx_pecheurjob:stopHarvest3')
AddEventHandler('esx_pecheurjob:stopHarvest3', function()

	local _source = source

	PlayersHarvesting[_source] = false

end)

local function Transform1(source, zone)

	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "TraitementSaumon" then
			local saumonQuantity = xPlayer.getInventoryItem('saumon').count
			local saumonfumeQuantity = xPlayer.getInventoryItem('saumon_fume').count
			if saumonQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_saumon'))
			elseif saumonfumeQuantity > 49 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_place4'))
			else
				SetTimeout(3000, function()
					xPlayer.removeInventoryItem('saumon', 1)
					xPlayer.addInventoryItem('saumon_fume', 1)
		  
					Transform1(source, zone)	  
				end)
			end
		end
	end	
end

RegisterServerEvent('esx_pecheurjob:startTransform1')
AddEventHandler('esx_pecheurjob:startTransform1', function(zone)
	local _source = source
  	
	if PlayersTransforming[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersTransforming[_source]=false
	else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, _U('transforming_in_progress1')) 
		Transform1(_source,zone)
	end
end)

RegisterServerEvent('esx_pecheurjob:stopTransform1')
AddEventHandler('esx_pecheurjob:stopTransform1', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
		
	else
		TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~y~fumé votre Saumon !~y~')
		PlayersTransforming[_source]=true
		
	end
end)

local function Transform2(source, zone)

	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "TraitementThon" then
			local thonQuantity = xPlayer.getInventoryItem('thon').count
			local boitethonQuantity = xPlayer.getInventoryItem('boite_thon').count
			if thonQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_thon'))
			elseif boitethonQuantity > 49 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_place5'))
			else
				SetTimeout(3000, function()
					xPlayer.removeInventoryItem('thon', 1)
					xPlayer.addInventoryItem('boite_thon', 1)
		  
					Transform2(source, zone)	  
				end)
			end
		end
	end	
end

RegisterServerEvent('esx_pecheurjob:startTransform2')
AddEventHandler('esx_pecheurjob:startTransform2', function(zone)
	local _source = source
  	
	if PlayersTransforming[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersTransforming[_source]=false
	else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, _U('transforming_in_progress2')) 
		Transform2(_source,zone)
	end
end)

RegisterServerEvent('esx_pecheurjob:stopTransform2')
AddEventHandler('esx_pecheurjob:stopTransform2', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
		
	else
		TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~y~mettre en boite votre Thon !~y~')
		PlayersTransforming[_source]=true
		
	end
end)

local function Transform3(source, zone)

	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "TraitementCrevette" then
			local crevetteQuantity = xPlayer.getInventoryItem('crevette').count
			local samoussaQuantity = xPlayer.getInventoryItem('samoussa_crevette').count
			if crevetteQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_crevette'))
			elseif samoussaQuantity > 49 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_place6'))
			else
				SetTimeout(3000, function()
					xPlayer.removeInventoryItem('crevette', 1)
					xPlayer.addInventoryItem('samoussa_crevette', 1)
		  
					Transform3(source, zone)	  
				end)
			end
		end
	end	
end

RegisterServerEvent('esx_pecheurjob:startTransform3')
AddEventHandler('esx_pecheurjob:startTransform3', function(zone)
	local _source = source
  	
	if PlayersTransforming[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersTransforming[_source]=false
	else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, _U('transforming_in_progress3')) 
		Transform3(_source,zone)
	end
end)

RegisterServerEvent('esx_pecheurjob:stopTransform3')
AddEventHandler('esx_pecheurjob:stopTransform3', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
		
	else
		TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez fabriquer vos ~y~Samoussas !~y~')
		PlayersTransforming[_source]=true
		
	end
end)

local function Sell(source, zone)

	if PlayersSelling[source] == true then
		local xPlayer  = ESX.GetPlayerFromId(source)
		
		if zone == 'SellFarm' then
			if xPlayer.getInventoryItem('saumon_fume').count <= 0 then
				saumon_fume = 0
			else
				saumon_fume = 1
			end
			
			if xPlayer.getInventoryItem('boite_thon').count <= 0 then
				boite_thon = 0
			else
				boite_thon = 1
			end

			if xPlayer.getInventoryItem('samoussa_crevette').count <= 0 then
				samoussa_crevette = 0
			else
				samoussa_crevette = 1
			end
		
			if saumon_fume == 0 and boite_thon == 0 and samoussa_crevette == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_product_sale'))
				return
			elseif xPlayer.getInventoryItem('saumon_fume').count <= 0 and boite_thon == 0 and samoussa_crevette == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_saumonfume_sale'))
				saumon_fume = 0
				return
			elseif xPlayer.getInventoryItem('boite_thon').count <= 0 and saumon_fume == 0 and samoussa_crevette == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_boitethon_sale'))
				boite_thon = 0
				return
			elseif xPlayer.getInventoryItem('samoussa_crevette').count <= 0 and saumon_fume == 0 and boite_thon == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_samoussa_sale'))
				samoussa_crevette = 0
				return
			else
				if (saumon_fume == 1) then
					SetTimeout(1000, function()
						local money = math.random(40,40)
						xPlayer.removeInventoryItem('saumon_fume', 1)
						local societyAccount = nil

						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_pecheur', function(account)
							societyAccount = account
						end)
						if societyAccount ~= nil then
							societyAccount.addMoney(money)
							TriggerClientEvent('esx:showNotification', xPlayer.source, _U('comp_earned') .. money)
						end
						Sell(source,zone)
					end)
				elseif (boite_thon == 1) then
					SetTimeout(1000, function()
						local money = math.random(40,40)
						xPlayer.removeInventoryItem('boite_thon', 1)
						local societyAccount = nil

						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_pecheur', function(account)
							societyAccount = account
						end)
						if societyAccount ~= nil then
							societyAccount.addMoney(money)
							TriggerClientEvent('esx:showNotification', xPlayer.source, _U('comp_earned') .. money)
						end
						Sell(source,zone)
					end)
				elseif (samoussa_crevette == 1) then
					SetTimeout(1000, function()
						local money = math.random(40,40)
						xPlayer.removeInventoryItem('samoussa_crevette', 1)
						local societyAccount = nil

						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_pecheur', function(account)
							societyAccount = account
						end)
						if societyAccount ~= nil then
							societyAccount.addMoney(money)
							TriggerClientEvent('esx:showNotification', xPlayer.source, _U('comp_earned') .. money)
						end
						Sell(source,zone)
					end)
				end
				
			end
		end
	end
end

RegisterServerEvent('esx_pecheurjob:startSell')
AddEventHandler('esx_pecheurjob:startSell', function(zone)

	local _source = source
	
	if PlayersSelling[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersSelling[_source]=false
	else
		PlayersSelling[_source]=true
		TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))
		Sell(_source, zone)
	end

end)

RegisterServerEvent('esx_pecheurjob:stopSell')
AddEventHandler('esx_pecheurjob:stopSell', function()

	local _source = source
	
	if PlayersSelling[_source] == true then
		PlayersSelling[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
		
	else
		TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~vendre')
		PlayersSelling[_source]=true
	end

end)

RegisterServerEvent('esx_pecheurjob:getStockItem')
AddEventHandler('esx_pecheurjob:getStockItem', function(itemName, count)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pecheur', function(inventory)

		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn') .. count .. ' ' .. item.label)

	end)

end)

ESX.RegisterServerCallback('esx_pecheurjob:getStockItems', function(source, cb)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pecheur', function(inventory)
		cb(inventory.items)
	end)

end)

RegisterServerEvent('esx_pecheurjob:putStockItems')
AddEventHandler('esx_pecheurjob:putStockItems', function(itemName, count)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pecheur', function(inventory)

		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('added') .. count .. ' ' .. item.label)

	end)
end)

ESX.RegisterServerCallback('esx_pecheurjob:getPlayerInventory', function(source, cb)

	local xPlayer    = ESX.GetPlayerFromId(source)
	local items      = xPlayer.inventory

	cb({
		items      = items
	})

end)


ESX.RegisterUsableItem('saumon_fume', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('saumon_fume', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 333333)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_saumonfume'))

end)

ESX.RegisterUsableItem('boite_thon', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('boite_thon', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 300000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_boitethon'))

end)

ESX.RegisterUsableItem('samoussa_crevette', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('samoussa_crevette', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 250000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_samoussa'))

end)
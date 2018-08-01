
ESX                = nil
PlayersHarvesting  = {}
PlayersCrafting    = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local function Harvest(source)

	SetTimeout(4000, function()

		if PlayersHarvesting[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local ViandeQuantity = xPlayer.getInventoryItem('viande').count

			if ViandeQuantity >= 100 then
				TriggerClientEvent('esx:showNotification', source, '~r~Vous n avez plus de place')		
			else   
                xPlayer.addInventoryItem('viande', 1)
			end
		end
	end)
end

RegisterServerEvent('chasse:startRecup')
AddEventHandler('chasse:startRecup', function()
	local _source = source
	PlayersHarvesting[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Récupération de ~b~viande~s~...')
	Harvest(source)
end)

RegisterServerEvent('chasse:stopRecup')
AddEventHandler('chasse:stopRecup', function()
	local _source = source
	PlayersHarvesting[_source] = false
end)

local function Craft(source)

	SetTimeout(4000, function()

		if PlayersCrafting[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local ViandeQuantity = xPlayer.getInventoryItem('viande').count

			if ViandeQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~pas assez~s~ de viande')			
			else   
                xPlayer.removeInventoryItem('viande', 1)
				xPlayer.addMoney(10)
				
				Craft(source)
			end
		end
	end)
end

RegisterServerEvent('chasse:startVente')
AddEventHandler('chasse:startVente', function()
	local _source = source
	PlayersCrafting[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Vente de ~b~viande~s~...')
	Craft(_source)
end)

RegisterServerEvent('chasse:stopVente')
AddEventHandler('chasse:stopVente', function()
	local _source = source
	PlayersCrafting[_source] = false
end)
ESX 						   = nil
local CopsConnected       	   = 0
local PlayersHarvestingCerveau = {}
local PlayersHarvestingCoeur   = {}
local PlayersHarvestingMoelle  = {}
local PlayersHarvestingIntestin = {}
local PlayersHarvestingOs   	= {}
local PlayersTransformingOrgan 	= {}
local PlayersSellingBody      	= {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function CountCops()

	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			CopsConnected = CopsConnected + 1
		end
	end

	SetTimeout(5000, CountCops)

end

CountCops()

--cerveau
local function HarvestCerveau(source)

	if CopsConnected < Config.RequiredCopsCerveau then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsCerveau)
		return
	end

	SetTimeout(5000, function()

		if PlayersHarvestingCerveau[source] == true then 

			local xPlayer  = ESX.GetPlayerFromId(source)

			local cerveau = xPlayer.getInventoryItem('cerveau')

			if cerveau.limit ~= -1 and cerveau.count >= cerveau.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_cerveau'))
			else
				xPlayer.addInventoryItem('cerveau', 1)
				HarvestCerveau(source)
			end

		end
	end)
end

RegisterServerEvent('esx_organ:startHarvestCerveau')
AddEventHandler('esx_organ:startHarvestCerveau', function()

	local _source = source

	PlayersHarvestingCerveau[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestCerveau(_source)

end)

RegisterServerEvent('esx_organ:stopHarvestCerveau')
AddEventHandler('esx_organ:stopHarvestCerveau', function()

	local _source = source

	PlayersHarvestingCerveau[_source] = false

end)

--coeur
local function HarvestCoeur(source)

	if CopsConnected < Config.RequiredCopsCoeur then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsCoeur)
		return
	end
	
	SetTimeout(5000, function()

		if PlayersHarvestingCoeur[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local coeur = xPlayer.getInventoryItem('coeur')

			if coeur.limit ~= -1 and coeur.count >= coeur.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_coeur'))
			else
				xPlayer.addInventoryItem('coeur', 1)
				HarvestCoeur(source)
			end

		end
	end)
end

RegisterServerEvent('esx_organ:startHarvestCoeur')
AddEventHandler('esx_organ:startHarvestCoeur', function()

	local _source = source

	PlayersHarvestingCoeur[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestCoeur(_source)

end)

RegisterServerEvent('esx_organ:stopHarvestCoeur')
AddEventHandler('esx_organ:stopHarvestCoeur', function()

	local _source = source

	PlayersHarvestingCoeur[_source] = false

end)

--moelle
local function HarvestMoelle(source)

	if CopsConnected < Config.RequiredCopsMoelle then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsMoelle)
		return
	end

	SetTimeout(5000, function()

		if PlayersHarvestingMoelle[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local moelle = xPlayer.getInventoryItem('moelle')

			if moelle.limit ~= -1 and moelle.count >= moelle.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_moelle'))
			else
				xPlayer.addInventoryItem('moelle', 1)
				HarvestMoelle(source)
			end

		end
	end)
end

RegisterServerEvent('esx_organ:startHarvestMoelle')
AddEventHandler('esx_organ:startHarvestMoelle', function()

	local _source = source

	PlayersHarvestingMoelle[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestMoelle(_source)

end)

RegisterServerEvent('esx_organ:stopHarvestMoelle')
AddEventHandler('esx_organ:stopHarvestMoelle', function()

	local _source = source

	PlayersHarvestingMoelle[_source] = false

end)

--intestin
local function HarvestIntestin(source)

	if CopsConnected < Config.RequiredCopsIntestin then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsIntestin)
		return
	end

	SetTimeout(5000, function()

		if PlayersHarvestingIntestin[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local intestin = xPlayer.getInventoryItem('intestin')

			if intestin.limit ~= -1 and intestin.count >= intestin.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_intestin'))
			else
				xPlayer.addInventoryItem('intestin', 1)
				HarvestIntestin(source)
			end

		end
	end)
end

RegisterServerEvent('esx_organ:startHarvestIntestin')
AddEventHandler('esx_organ:startHarvestIntestin', function()

	local _source = source

	PlayersHarvestingIntestin[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestIntestin(_source)

end)

RegisterServerEvent('esx_organ:stopHarvestIntestin')
AddEventHandler('esx_organ:stopHarvestIntestin', function()

	local _source = source

	PlayersHarvestingIntestin[_source] = false

end)

--os
local function HarvestOs(source)

	if CopsConnected < Config.RequiredCopsBody then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsBody)
		return
	end

	SetTimeout(5000, function()

		if PlayersHarvestingOs[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local os = xPlayer.getInventoryItem('os')

			if os.limit ~= -1 and os.count >= os.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_os'))
			else
				xPlayer.addInventoryItem('os', 1)
				HarvestOs(source)
			end

		end
	end)
end

RegisterServerEvent('esx_organ:startHarvestOs')
AddEventHandler('esx_organ:startHarvestOs', function()

	local _source = source

	PlayersHarvestingOs[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestOs(_source)

end)

RegisterServerEvent('esx_organ:stopHarvestOs')
AddEventHandler('esx_organ:stopHarvestOs', function()

	local _source = source

	PlayersHarvestingOs[_source] = false

end)

local function TransformOrgan(source)

    if CopsConnected < Config.RequiredCopsBody then
        TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsBody)
        return
    end

    SetTimeout(10000, function()

        if PlayersTransformingOrgan[source] == true then

            local xPlayer  = ESX.GetPlayerFromId(source)

            local osQuantity = xPlayer.getInventoryItem('os').count
            local poochQuantity = xPlayer.getInventoryItem('organ_pooch').count
            local cerveauQuantity = xPlayer.getInventoryItem('cerveau').count
            local coeurQuantity = xPlayer.getInventoryItem('coeur').count
            local moelleQuantity = xPlayer.getInventoryItem('moelle').count
            local intestinQuantity = xPlayer.getInventoryItem('intestin').count

            if poochQuantity > 35 then
                TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
            elseif osQuantity == 206 and cerveauQuantity == 1 and coeurQuantity == 1 and moelleQuantity == 40 and intestinQuantity == 11 then
                xPlayer.removeInventoryItem('os', 206)
                xPlayer.removeInventoryItem('cerveau', 1)
                xPlayer.removeInventoryItem('coeur', 1)
                xPlayer.removeInventoryItem('moelle', 40)
                xPlayer.removeInventoryItem('intestin', 11)

                xPlayer.addInventoryItem('organ_pooch', 1)
            
                TransformOrgan(source)
            else
                TriggerClientEvent('esx:showNotification', source, _U('not_enough_organ'))
            end
        end
    end)
end

RegisterServerEvent('esx_organ:startTransformOrgan')
AddEventHandler('esx_organ:startTransformOrgan', function()

	local _source = source

	PlayersTransformingOrgan[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformOrgan(_source)

end)

RegisterServerEvent('esx_organ:stopTransformOrgan')
AddEventHandler('esx_organ:stopTransformOrgan', function()

	local _source = source

	PlayersTransformingOrgan[_source] = false

end)

local function SellBody(source)

	if CopsConnected < Config.RequiredCopsBody then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsBody)
		return
	end

	SetTimeout(7500, function()

		if PlayersSellingBody[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local poochQuantity = xPlayer.getInventoryItem('organ_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('organ_pooch', 1)
				if CopsConnected == 0 then
                    xPlayer.addAccountMoney('black_money', 30800)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_body'))
                elseif CopsConnected == 1 then
                    xPlayer.addAccountMoney('black_money', 40000)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_body'))
                elseif CopsConnected == 2 then
                    xPlayer.addAccountMoney('black_money', 52000)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_body'))
                elseif CopsConnected == 3 then
                    xPlayer.addAccountMoney('black_money', 64000)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_body'))
                elseif CopsConnected == 4 then
                    xPlayer.addAccountMoney('black_money', 76000)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_body'))
                elseif CopsConnected >= 5 then
                    xPlayer.addAccountMoney('black_money', 99000)  
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_body'))
                end
				
				SellBody(source)
			end

		end
	end)
end

RegisterServerEvent('esx_organ:startSellBody')
AddEventHandler('esx_organ:startSellBody', function()

	local _source = source

	PlayersSellingBody[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellBody(_source)

end)

RegisterServerEvent('esx_organ:stopSellBody')
AddEventHandler('esx_organ:stopSellBody', function()

	local _source = source

	PlayersSellingBody[_source] = false

end)


-- RETURN INVENTORY TO CLIENT
RegisterServerEvent('esx_organ:GetUserInventory')
AddEventHandler('esx_organ:GetUserInventory', function(currentZone)
	local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_organ:ReturnInventory', 
    	_source, 
    	xPlayer.getInventoryItem('cerveau').count, 
		xPlayer.getInventoryItem('coeur').count,  
		xPlayer.getInventoryItem('moelle').count,  
		xPlayer.getInventoryItem('intestin').count,
		xPlayer.getInventoryItem('os').count, 
		xPlayer.getInventoryItem('organ_pooch').count,
		xPlayer.job.name, 
		currentZone
    )
end)

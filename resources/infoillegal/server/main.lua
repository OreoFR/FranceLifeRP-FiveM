RegisterServerEvent('esx_infoillegal:Weed')
AddEventHandler('esx_infoillegal:Weed', function()
	local source = source
	TriggerEvent('es:getPlayerFromId', source, function(user)
		if (tonumber(user.getMoney()) >= Config.PriceWeedF) then
			user.removeMoney(Config.PriceWeedF)
			TriggerClientEvent("esx_infoillegal:WeedFarm", source)
		else
			TriggerClientEvent("esx_infoillegal:notify", source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('NoCash'))
		end
	end)
end)

RegisterServerEvent('esx_infoillegal:TWeed')
AddEventHandler('esx_infoillegal:TWeed', function()
	local source = source
	TriggerEvent('es:getPlayerFromId', source, function(user)
		if (tonumber(user.getMoney()) >= Config.PriceWeedT) then
			user.removeMoney(Config.PriceWeedT)
			TriggerClientEvent("esx_infoillegal:WeedTreatment", source)			
		else
			TriggerClientEvent("esx_infoillegal:notify", source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('NoCash'))
		end
	end)
end)

RegisterServerEvent('esx_infoillegal:RWeed')
AddEventHandler('esx_infoillegal:RWeed', function()
	local source = source
	TriggerEvent('es:getPlayerFromId', source, function(user)
		if (tonumber(user.getMoney()) >= Config.PriceWeedR) then
			user.removeMoney(Config.PriceWeedR)
			TriggerClientEvent("esx_infoillegal:WeedResell", source)				
		else
			TriggerClientEvent("esx_infoillegal:notify", source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('NoCash'))
		end
	end)
end)

RegisterServerEvent('esx_infoillegal:Opium')
AddEventHandler('esx_infoillegal:Opium', function()
	local source = source
	TriggerEvent('es:getPlayerFromId', source, function(user)
		if (tonumber(user.getMoney()) >= Config.PriceOpiumF) then
			user.removeMoney(Config.PriceOpiumF)
			TriggerClientEvent("esx_infoillegal:OpiumFarm", source)
		else
			TriggerClientEvent("esx_infoillegal:notify", source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('NoCash'))
		end
	end)
end)

RegisterServerEvent('esx_infoillegal:TOpium')
AddEventHandler('esx_infoillegal:TOpium', function()
	local source = source
	TriggerEvent('es:getPlayerFromId', source, function(user)
		if (tonumber(user.getMoney()) >= Config.PriceOpiumT) then
			user.removeMoney(Config.PriceOpiumT)
			TriggerClientEvent("esx_infoillegal:OpiumTreatment", source)			
		else
			TriggerClientEvent("esx_infoillegal:notify", source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('NoCash'))
		end
	end)
end)

RegisterServerEvent('esx_infoillegal:ROpium')
AddEventHandler('esx_infoillegal:ROpium', function()
	local source = source
	TriggerEvent('es:getPlayerFromId', source, function(user)
		if (tonumber(user.getMoney()) >= Config.PriceOpiumR) then
			user.removeMoney(Config.PriceOpiumR)
			TriggerClientEvent("esx_infoillegal:OpiumResell", source)				
		else
			TriggerClientEvent("esx_infoillegal:notify", source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('NoCash'))
		end
	end)
end)

RegisterServerEvent('esx_infoillegal:Coke')
AddEventHandler('esx_infoillegal:Coke', function()
	local source = source
	TriggerEvent('es:getPlayerFromId', source, function(user)
		if (tonumber(user.getMoney()) >= Config.PriceCokeF) then
			user.removeMoney(Config.PriceCokeF)
			TriggerClientEvent("esx_infoillegal:CokeFarm", source)
		else
			TriggerClientEvent("esx_infoillegal:notify", source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('NoCash'))
		end
	end)
end)

RegisterServerEvent('esx_infoillegal:TCoke')
AddEventHandler('esx_infoillegal:TCoke', function()
	local source = source
	TriggerEvent('es:getPlayerFromId', source, function(user)
		if (tonumber(user.getMoney()) >= Config.PriceCokeT) then
			user.removeMoney(Config.PriceCokeT)
			TriggerClientEvent("esx_infoillegal:CokeTreatment", source)			
		else
			TriggerClientEvent("esx_infoillegal:notify", source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('NoCash'))
		end
	end)
end)

RegisterServerEvent('esx_infoillegal:RCoke')
AddEventHandler('esx_infoillegal:RCoke', function()
	local source = source
	TriggerEvent('es:getPlayerFromId', source, function(user)
		if (tonumber(user.getMoney()) >= Config.PriceCokeR) then
			user.removeMoney(Config.PriceCokeR)
			TriggerClientEvent("esx_infoillegal:CokeResell", source)				
		else
			TriggerClientEvent("esx_infoillegal:notify", source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('NoCash'))
		end
	end)
end)

RegisterServerEvent('esx_infoillegal:Meth')
AddEventHandler('esx_infoillegal:Meth', function()
	local source = source
	TriggerEvent('es:getPlayerFromId', source, function(user)
		if (tonumber(user.getMoney()) >= Config.PriceMethF) then
			user.removeMoney(Config.PriceMethF)
			TriggerClientEvent("esx_infoillegal:MethFarm", source)
		else
			TriggerClientEvent("esx_infoillegal:notify", source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('NoCash'))
		end
	end)
end)

RegisterServerEvent('esx_infoillegal:TMeth')
AddEventHandler('esx_infoillegal:TMeth', function()
	local source = source
	TriggerEvent('es:getPlayerFromId', source, function(user)
		if (tonumber(user.getMoney()) >= Config.PriceMethT) then
			user.removeMoney(Config.PriceMethT)
			TriggerClientEvent("esx_infoillegal:MethTreatment", source)			
		else
			TriggerClientEvent("esx_infoillegal:notify", source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('NoCash'))
		end
	end)
end)

RegisterServerEvent('esx_infoillegal:RMeth')
AddEventHandler('esx_infoillegal:RMeth', function()
	local source = source
	TriggerEvent('es:getPlayerFromId', source, function(user)
		if (tonumber(user.getMoney()) >= Config.PriceMethR) then
			user.removeMoney(Config.PriceMethR)
			TriggerClientEvent("esx_infoillegal:MethResell", source)				
		else
			TriggerClientEvent("esx_infoillegal:notify", source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('NoCash'))
		end
	end)
end)

RegisterServerEvent('esx_infoillegal:Nothere')
AddEventHandler('esx_infoillegal:Nothere', function()
	TriggerClientEvent("esx_infoillegal:notify", source, "CHAR_LESTER_DEATHWISH", 1, _U('Notification'), false, _U('Nothere'))
end)
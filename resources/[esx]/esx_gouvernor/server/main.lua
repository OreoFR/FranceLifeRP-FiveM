ESX = nil

local players = {}

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'gouvernor', Config.MaxInService)
end

TriggerEvent('esx_society:registerSociety', 'gouvernor', 'Gouvernement', 'society_gouvernor', 'society_gouvernor', 'society_gouvernor', {type = 'public'})
-----------------------------------------------------

RegisterServerEvent("esx_gouverneur:addPlayer")
AddEventHandler("esx_gouverneur:addPlayer", function(jobName)
	local _source = source
	players[_source] = jobName
end)

RegisterServerEvent("esx_gouverneur:sendSonnette")
AddEventHandler("esx_gouverneur:sendSonnette", function()
	local _source = source
	for i,k in pairs(players) do
		if(k~=nil) then
			if(k == "gouvernor") then
				TriggerClientEvent("esx_gouverneur:sendRequest", i, GetPlayerName(_source), _source)
			end
		end
	end

end)

RegisterServerEvent("esx_gouverneur:sendStatusToPoeple")
AddEventHandler("esx_gouverneur:sendStatusToPoeple", function(id, status)
	TriggerClientEvent("esx_gouverneur:sendStatus", id, status)
end)

-------------------------------------------------------

TriggerEvent('esx_phone:registerNumber', 'gouvernor', _U('client'), true, true)

AddEventHandler('esx_phone:ready', function()

	TriggerEvent('esx_phone:registerCallback', function(source, phoneNumber, message, anon)

		local xPlayer  = ESX.GetPlayerFromId(source)
		local xPlayers = ESX.GetPlayers()
		local job      = 'Citoyen'

		if phoneNumber == "gouvernor" then

			for i=1, #xPlayers, 1 do

				local xPlayer2 = ESX.GetPlayerFromId(xPlayers[i])
				
				if xPlayer2.job.name == 'gouvernor' and xPlayer2.job.grade_name == 'boss' then
					TriggerClientEvent('esx_phone:onMessage', xPlayer2.source, xPlayer.get('phoneNumber'), message, xPlayer.get('coords'), anon, job, false)
				end
			end

		end
		
	end)

end)

RegisterServerEvent('esx_gouverneur:giveWeapon')
AddEventHandler('esx_gouverneur:giveWeapon', function(weapon, ammo)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addWeapon(weapon, ammo)
end)

RegisterServerEvent('esx_gouverneur:removeWeapon')
AddEventHandler('esx_gouverneur:removeWeapon', function(weapon)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeWeapon(weapon)
end)

TriggerEvent('esx_phone:registerCallback', function(source, phoneNumber, message, anon)

	local xPlayer  = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()

	if phoneNumber == 'gouvernor' then
		for i=1, #xPlayers, 1 do

			local xPlayer2 = ESX.GetPlayerFromId(xPlayers[i])
			
			if xPlayer2.job.name == 'gouvernor' and xPlayer2.job.grade_name == 'boss' then
				TriggerClientEvent('esx_phone:onMessage', xPlayer2.source, xPlayer.get('phoneNumber'), message, xPlayer.get('coords'), anon, 'player')
			end
		end
	end
	
end)
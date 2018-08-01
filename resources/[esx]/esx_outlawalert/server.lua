ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



--RegisterServerEvent('thiefInProgress')
--AddEventHandler('thiefInProgress', function(street1, street2, veh, sex)
	--if veh == "NULL" then
		--TriggerClientEvent("outlawNotify", -1, "~r~Vol de vehicule par ~w~"..sex.." ~r~entre ~w~"..street1.."~r~ et ~w~"..street2)
	--else
		--TriggerClientEvent("outlawNotify", -1, "~r~Vol de vehicule ~w~"..veh.." ~r~ par ~w~"..sex.." ~r~entre ~w~"..street1.."~r~ et ~w~"..street2)
	--end
--end)

--RegisterServerEvent('thiefInProgressS1')
--AddEventHandler('thiefInProgressS1', function(street1, veh, sex)
	--if veh == "NULL" then
		--TriggerClientEvent("outlawNotify", -1, "~r~Vol de vehicule par ~w~"..sex.." ~r~à ~w~"..street1)
	--else
		--TriggerClientEvent("outlawNotify", -1, "~r~Vol de vehicule ~w~"..veh.." ~r~par ~w~"..sex.." ~r~à ~w~"..street1)
	--end
--end)

RegisterServerEvent('thiefInProgressPolice')
AddEventHandler('thiefInProgressPolice', function(street1, street2, veh, sex)
	if veh == "NULL" then
		TriggerClientEvent("outlawNotify", -1, "~r~Vol de vehicule de POLICE par ~w~"..sex.." ~r~entre ~w~"..street1.."~r~ et ~w~"..street2)
	else
		TriggerClientEvent("outlawNotify", -1, "~r~Vol de vehicule de POLICE ~w~"..veh.." ~r~ par ~w~"..sex.." ~r~entre ~w~"..street1.."~r~ et ~w~"..street2)
	end
end)

RegisterServerEvent('thiefInProgressS1Police')
AddEventHandler('thiefInProgressS1Police', function(street1, veh, sex)
	if veh == "NULL" then
		TriggerClientEvent("outlawNotify", -1, "~r~Vol de vehicule de POLICE par ~w~"..sex.." ~r~à ~w~"..street1)
	else
		TriggerClientEvent("outlawNotify", -1, "~r~Vol de vehicule de POLICE ~w~"..veh.." ~r~par ~w~"..sex.." ~r~à ~w~"..street1)
	end
end)

--RegisterServerEvent('meleeInProgress')
--AddEventHandler('meleeInProgress', function(street1, street2, sex)
	--TriggerClientEvent("outlawNotify", -1, "~r~Une bagarre a éclaté par ~w~"..sex.." ~r~entre ~w~"..street1.."~r~ et ~w~"..street2)
--end)

--RegisterServerEvent('meleeInProgressS1')
--AddEventHandler('meleeInProgressS1', function(street1, sex)
	--TriggerClientEvent("outlawNotify", -1, "~r~Une bagarre a éclaté par ~w~"..sex.." ~r~à ~w~"..street1)
--end)


RegisterServerEvent('gunshotInProgress')
AddEventHandler('gunshotInProgress', function(street1, street2, sex)
	TriggerClientEvent("outlawNotify", -1, "~r~Coup de feu par ~w~"..sex.." ~r~entre ~w~"..street1.."~r~ et ~w~"..street2)
end)

RegisterServerEvent('gunshotInProgressS1')
AddEventHandler('gunshotInProgressS1', function(street1, sex)
	TriggerClientEvent("outlawNotify", -1, "~r~Coup de feu par ~w~"..sex.." ~r~à ~w~"..street1)
end)

RegisterServerEvent('thiefInProgressPos')
AddEventHandler('thiefInProgressPos', function(tx, ty, tz)
	TriggerClientEvent('thiefPlace', -1, tx, ty, tz)
end)

RegisterServerEvent('gunshotInProgressPos')
AddEventHandler('gunshotInProgressPos', function(gx, gy, gz)
	TriggerClientEvent('gunshotPlace', -1, gx, gy, gz)
end)

--RegisterServerEvent('meleeInProgressPos')
--AddEventHandler('meleeInProgressPos', function(mx, my, mz)
	--TriggerClientEvent('meleePlace', -1, mx, my, mz)
--end)

ESX.RegisterServerCallback('esx_outlawalert:ownvehicle',function(source,cb, vehicleProps)
	local isFound = false
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local vehicules = getPlayerVehicles(xPlayer.getIdentifier())
	local plate = vehicleProps.plate

		for _,v in pairs(vehicules) do
			if(plate == v.plate)then
				isFound = true
				break
			end
		end
		cb(isFound)
end)

function getPlayerVehicles(identifier)

	local vehicles = {}
	local data = MySQL.Sync.fetchAll("SELECT * FROM owned_vehicles WHERE owner=@identifier",{['@identifier'] = identifier})
	for _,v in pairs(data) do
		local vehicle = json.decode(v.vehicle)
		table.insert(vehicles, {id = v.id, plate = vehicle.plate})
	end
	return vehicles
end

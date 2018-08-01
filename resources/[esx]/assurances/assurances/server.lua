local players = {}

RegisterServerEvent("assureur:addPlayer")
AddEventHandler("assureur:addPlayer", function()

	local _source = source
	local name = GetPlayerName(_source)

	players[_source] = name

end)


AddEventHandler("playerDropped", function(reason)

	players[_source] = nil

end)


RegisterServerEvent("assureur:getPlayers")
AddEventHandler("assureur:getPlayers", function()

	local _source = source

	local onlinePlayers = {}

	for i,k in pairs(players) do
		if(k~=nil) then
			table.insert(onlinePlayers, {id=i, name = k})
		end
	end


	TriggerClientEvent("assureur:sendOnlinePlayers", _source, onlinePlayers)
end)


RegisterServerEvent("assureur:getLostedVehicles")
AddEventHandler("assureur:getLostedVehicles", function(id)

	local _source = source
	local _id = id
	local identifier = getPlayerID(id)
	
	MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE owner = @identifier", {['@identifier'] = identifier}, function(result)

		if(result) then
			MySQL.Async.fetchAll("SELECT * FROM user_parkings WHERE identifier = @identifier", {['@identifier'] = identifier}, function(result2)
				if(result2) then
					
					for _,k in pairs(result) do
						local isIn = false
						for _,c in pairs(result2) do
							if(c.vehicle==k.vehicle) then
								isIn = true
								break;
							end
						end

						if(not isIn) then
							local lostedVehicles = {}
							local vehiclesTable = json.decode(k.vehicle)
							table.insert(lostedVehicles,vehiclesTable)
							TriggerClientEvent("assureur:sendLostedvehicles", _source, lostedVehicles)
						end
					end
				else
					for _,k in pairs(result) do
						local lostedVehicles = {}
						local vehiclesTable = json.decode(k.vehicle)
						table.insert(lostedVehicles,vehiclesTable)
						TriggerClientEvent("assureur:sendLostedvehicles", _source, lostedVehicles)
					end
				end
			end)
		end
	end)

end)



-- get's the player id without having to use bugged essentials
function getPlayerID(source)
    local identifiers = GetPlayerIdentifiers(source)
    local player = getIdentifiant(identifiers)
    return player
end

-- gets the actual player id unique to the player,
-- independent of whether the player changes their screen name
function getIdentifiant(id)
    for _, v in ipairs(id) do
        return v
    end
end


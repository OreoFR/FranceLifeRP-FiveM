require "resources/xxxxxxx/lib/MySQL"

RegisterServerEvent("toJailOrNot")
AddEventHandler("toJailOrNot", function(playerid)
    local identifier = GetPlayerIdentifiers(source)[1]

	local executed_query = MySQL:executeQuery("SELECT * FROM users WHERE identifier = '@name'", {['@name'] = identifier})
	local result = MySQL:getResults(executed_query, {'permission_level', 'money', 'identifier','detained'}, "identifier")
	local getModel = result[1]
	
	if (getModel['detained'] == "1")then
	TriggerClientEvent('detainedOrNot', source)
	end
end)
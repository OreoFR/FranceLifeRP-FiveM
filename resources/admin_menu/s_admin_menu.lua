RegisterServerEvent("AdminMenu:giveCash")
AddEventHandler("AdminMenu:giveCash", function(cash)
	total = tonumber(cash)
	TriggerEvent('es:getPlayerFromId', source, function(user)
		user:addMoney(total)
		TriggerClientEvent("es_freeroam:notif", source, "Vous vous êtes give ~g~" .. total .. "$")
	end)
end)

RegisterServerEvent("KickEvent")
AddEventHandler("KickEvent", function(kickid)
    local source = GetPlayerFromServerId(tonumber(kickid))
	
	DropPlayer(source)

end)
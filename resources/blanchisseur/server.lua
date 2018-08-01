--[[
##################
#    Oskarr      #
#    MysticRP    #
#   server.lua   #
#      2017      #
##################
--]]

local taux = 0.80 -- 0.80 : 100000$ dirty = 80000$  // 0.80 : 100 000 d'argent sale = 80 000$ d'argent propre

RegisterServerEvent("blanchisseur:BlanchirCash")
AddEventHandler("blanchisseur:BlanchirCash", function(amount)
	TriggerEvent('es:getPlayerFromId', source, function(user)
		local cash = tonumber(user:getMoney())
		local dcash = tonumber(user:getDirty_Money())
	    local ablanchir = amount
		
		if (dcash <= 0 or ablanchir <= 0) then
			 TriggerClientEvent("es_freeroam:notify", source, "CHAR_LESTER", 1, "Blanchisserie", false, "~y~Tu n'a pas d'argent à blanchir")
		else		
		local washedcash = ablanchir * taux
		local total = cash + washedcash
		local totald = dcash - ablanchir
		user:setMoney(total)
		user:setDirty_Money(totald)
	    TriggerClientEvent("es_freeroam:notify", source, "CHAR_LESTER", 1, "Blanchisserie", false, "Vous avez blanchi ~r~".. tonumber(ablanchir) .."$~s~ d'argent sale.~s~ Vous avez maintenant ~g~".. tonumber(total) .."$")
	    end
	end)
end)
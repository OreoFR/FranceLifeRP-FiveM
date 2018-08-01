
function getIdentifiant(id) -- identification

	for _, v in ipairs(id) do
	    return v
	end

end

local max_number_weapons = 6 -- Nombre maximum d'armes par joueur.
local cost_ratio = 100 

RegisterServerEvent('CheckMoneyForWea')
AddEventHandler('CheckMoneyForWea', function(weapon,price)
	local mySource = source
	TriggerEvent('es:getPlayerFromId', mySource, function(user)

		if (tonumber(user.getMoney()) >= tonumber(price)) then
			local player = user.getIdentifier()
			local nb_weapon = 0
			MySQL.Async.fetchAll("SELECT * FROM user_weapons WHERE identifier = @username",{['@username'] = player}, function (result)
				if result then
					for k,v in ipairs(result) do
						nb_weapon = nb_weapon + 1
					end
				end
				if (tonumber(max_number_weapons) > tonumber(nb_weapon)) then
					-- Pay the shop (price)
					user.removeMoney((price))
					MySQL.Async.execute("INSERT INTO user_weapons (identifier,weapon_model,withdraw_cost) VALUES (@username,@weapon,@cost)",
						{['@username'] = player, ['@weapon'] = weapon, ['@cost'] = (price)/cost_ratio})
					-- Trigger some client stuff
					TriggerClientEvent('FinishMoneyCheckForWea',mySource)
					TriggerClientEvent("es_freeroam:notify", mySource, "CHAR_MP_ROBERTO", 1, "Gangsta", false, "Amuse toi bien avec tes guns!\n")
				else
					TriggerClientEvent('ToManyWeapons',mySource)
					TriggerClientEvent("es_freeroam:notify", mySource, "CHAR_MP_ROBERTO", 1, "Gangsta", false, "Ta poche c'est pas une armurerie ! ( nombre d'armes max: "..max_number_weapons..")\n")
				end
			end)
		else
			-- Inform the player that he needs more money
			TriggerClientEvent("es_freeroam:notify", mySource, "CHAR_MP_ROBERTO", 1, "Gangsta", false, "Vous n'avez pas assez d'argent!\n")
		end
	end)
end)
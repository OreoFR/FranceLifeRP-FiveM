ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local banlist = {}

local notBanListed = "Vous avez été banni"
local steamiderr = "Erreur: nous ne pouvons pas trouver votre SteamID"
local find = false 


AddEventHandler("playerConnecting", function(playerName, setKickReason)

  local steamID = GetPlayerIdentifiers(source)[1] or false
  print("BanList: "..playerName.."["..steamID.."] Essaye de se connecter")


  if not steamID then
  	print("BanList: "..playerName.." kicked, pas de IDSteam")
    setKickReason('Veuillez vous connecter à steam')
    CancelEvent()
  end


  local result = MySQL.Sync.fetchAll('SELECT * FROM banlist')

  for i=1, #result, 1 do
    local id   = result[i].identifier
    table.insert(banlist, tostring(id))
  end

  for i=1, #banlist, 1 do
      if(tostring(banlist[i]) == tostring(steamID))then
          find = true
     end
  end

  if find then 
  	print("BanList: "..playerName.."["..steamID.."] kicked, BanListed ")
    setKickReason('Vous avez été banni de ce serveur')
    CancelEvent()
    find = false
    banlist = {}           
  else
    find = false
    banlist = {}            
  end
end)


TriggerEvent('es:addGroupCommand', 'ban', 'superadmin', function(source, args, user)
	if(GetPlayerName(tonumber(args[1])))then
		local player = tonumber(args[1])
		local xPlayer = ESX.GetPlayerFromId(args[1])

		-- User permission check

		TriggerEvent("es:getPlayerFromId", player, function(target)

			local reason = args
			table.remove(reason, 1)

			if(#reason == 0)then
				reason = "Banned: Vous avez été expulsé du serveur"
			else
				reason = "Banned: " .. table.concat(reason, " ")
			end

			TriggerClientEvent('chatMessage', -1, "SYSTEM", {255, 0, 0}, "Le Joueur ^2" .. GetPlayerName(player) .. "^0 a été expulsé(^2" .. reason .. "^0)")
			DropPlayer(player, reason)

			MySQL.Async.execute('INSERT INTO `banlist` (`identifier`, `reason`) VALUES (@identifier, @reason)',
			{
	  			['@identifier'] = xPlayer.identifier,
	  			['@reason'] = reason,
			}
		)
		end)
			
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "ID de joueur incorrecte!")
	end
end, function(source, args, user)
  TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions.")
end, {help = 'Bannir un joueur', params = {{name = "id", help = 'identification du joueur'}, {name = "reason", help = 'Raison'}}})

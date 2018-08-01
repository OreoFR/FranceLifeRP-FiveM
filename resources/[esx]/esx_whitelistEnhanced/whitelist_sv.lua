ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local WhiteList = {}

local discord = "DISCORD_ADRESS"
local notwhitelisted = "Venez nous rejoindre ici: " .. discord
local bannedPhrase = "Vous êtes bannis de ce serveur."
local steamiderr = "Votre steamID est introuvable."

local WaitingTime = 20
local PlayersOnlineBeforeAntiSpam = 0
local PlayersToStartRocade = 1

local PriorityList = {}
local currentPriorityTime = 0

local playersWaiting = {}


local onlinePlayers = 0
local inConnexion = {}

local isConnexionOpened = false

AddEventHandler('onMySQLReady', function ()
  loadWhiteList()
end)

function loadWhiteList ()
	MySQL.Async.fetchAll(
    'SELECT * FROM whitelist',
    {},
    function (users)
      WhiteList = {}
      for i=1, #users, 1 do
				local isVip = false

				if(users[i].vip == 1) then
					isVip = true
				end

				table.insert(WhiteList, {
					nom_rp 			= users[i].nom_rp,
					identifier 		= string.lower(users[i].identifier),
					last_connexion 	= users[i].last_connexion,
					ban_reason		= users[i].ban_reason,
					ban_until 		= users[i].ban_until,
					vip 			= isVip
				})
      end
    end
  )
end


AddEventHandler('playerDropped', function(reason)
	local _source = source

	if(reason ~= "Disconnected.") then

		local identifier = GetPlayerIdentifiers(_source)[1]
		local playerName = GetPlayerName(_source)
		local isInPriorityList = false


		for i = 1, #PriorityList, 1 do
			if PriorityList[i] == identifier then
				isInPriorityList = true
				print("WHITELIST: "..playerName.."["..identifier.."] est deja dans la file de priorite.")
				break
			end
	    end

	    if not isInPriorityList then
			table.insert(PriorityList, identifier)
			print("WHITELIST: " .. playerName .. " [" .. identifier .. "] a ete ajoute à la file de priorite.")
		end

		local timeToWait = 2
		currentPriorityTime = currentPriorityTime + timeToWait

		for i=0,timeToWait, 1 do
			Wait(1000)
			currentPriorityTime = currentPriorityTime -1

			print(currentPriorityTime)

			print(#PriorityList)

			if(i >= timeToWait) then
				for i = 1, #PriorityList, 1 do
					if PriorityList[i] == identifier then
						table.remove(PriorityList, i)
						print("WHITELIST: " .. playerName .. " [" .. identifier .. "] a ete sorti de la file de priorite.")
					end
			    end
			end
		end

	end

	if(inConnexion[_source] ~= nil) then
		table.remove(inConnexion, _source)
	end

end)



AddEventHandler("playerConnecting", function(playerName, reason, deferrals)
	local _source = source
	local steamID = GetPlayerIdentifiers(_source)[1] or false
	local found = false
	local banned = false
	local isInPriorityList = false

	print("WHITELIST: " .. playerName .. " [" .. steamID .. "] essaye de se connecter")

	-- TEST IF STEAM IS STARTED
	if not steamID then
		reason(steamiderr)
		deferrals.done(steamiderr)
		CancelEvent()
		print("WHITELIST: " .. playerName .. " n'a pas STEAM d'ouvert. KICK")
	end

	-- TEST IF PLAYER IS WHITELISTED AND BANNED
	local timestamp = os.time()

	local Vip = false
	for i=1, #WhiteList, 1 do
		if WhiteList[i].identifier == steamID then
			found = true
			if WhiteList[i].ban_until ~= nil and WhiteList[i].ban_until > timestamp then
				reason(bannedPhrase)
				deferrals.done(bannedPhrase)
				CancelEvent()
				print(playerName.."["..steamID.."] est banni: " .. WhiteList[i].ban_reason)
			end

			Vip = WhiteList[i].vip
			break
		end
	end

	if not found then
		reason(notwhitelisted)
		deferrals.done(notwhitelisted)
		CancelEvent()
		print("WHITELIST: "..playerName.."["..steamID.."] n'est pas dans la whitelist.")
	end

	-- TEST IF PLAYER IS IN PRIORITY LIST

	if((onlinePlayers >= PlayersToStartRocade or #PriorityList > 0)  and Vip == false) then
		deferrals.defer()
		local stopSystem = false
		table.insert(playersWaiting, steamID)


		while stopSystem == false do

			local waitingPlayers = #playersWaiting
			local firstIndex = -100
			for i,k in pairs(playersWaiting) do
				if(firstIndex == -100) then
					firstIndex = i
				end

				if(#PriorityList == 0) then
					
					if(onlinePlayers < PlayersToStartRocade and k == steamID and i == firstIndex) then
						table.remove(playersWaiting, i)
						inConnexion[_source] = true

						isConnexionOpened = false
						stopSystem = true
						deferrals.done() -- connect
					else
						if(k == steamID) then
							local currentPlace = (i - firstIndex) + 1
							deferrals.update("Place actuelle avant d'être déposé sur l'île : "..currentPlace.."/"..waitingPlayers)
							Wait(250)
						end
					end
				else
					local isIn = false

					for _,k in pairs(PriorityList) do
						if(k==steamid) then
							isIn = true
							break;
						end
					end
					if(isIn) then
						table.remove(playersWaiting, i)
						inConnexion[_source] = true

						isConnexionOpened = false
						stopSystem = true
					    deferrals.done() -- connect
					else

						local raw_minutes = currentPriorityTime/60

						local minutes = stringsplit(raw_minutes, ".")[1]
      					local seconds = stringsplit(currentPriorityTime-(minutes*60), ".")[1]
						deferrals.update("En attente de la libération des places prioritaires... ("..#PriorityList.." place(s) prioritaire(s), temps estimé : "..minutes.." minutes et "..seconds.." secondes)")

						Wait(250)
					end
				end
			end

		end
	else

		deferrals.defer()

		if(Vip) then
			print("WHITELIST: "..playerName.."["..steamID.."] s'est connecté en tant que VIP.")
		end

		inConnexion[_source] = true

		print("WHITELIST: ANTI SPAM STARTING FOR " .. playerName)
		for i = 1, WaitingTime, 1 do
		    deferrals.update('ANTI SPAM: Attendez encore ' .. tostring(WaitingTime - i) .. ' secondes. La connexion se fera automatiquement.')
		    Wait(1000)
		end
		print("WHITELIST: ANTI SPAM ENDED " .. playerName)

		deferrals.done() -- connect

	end

end)



RegisterServerEvent("rocade:removePlayerToInConnect")
AddEventHandler("rocade:removePlayerToInConnect", function()
	table.remove(inConnexion, _source)
end)



function checkOnlinePlayers()
	SetTimeout(10000, function()
		local xPlayers = ESX.GetPlayers()

		onlinePlayers = #xPlayers + #inConnexion


		if(onlinePlayers >= PlayersToStartRocade) then
			if(isConnexionOpened) then
				isConnexionOpened = false
			end
		else
			if(not isConnexionOpened) then
				isConnexionOpened = true
			end
		end

		checkOnlinePlayers()
	end)
end
checkOnlinePlayers()


function stringsplit(inputstr, sep)
  if sep == nil then
      sep = "%s"
  end
  local t={} ; i=1
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
      t[i] = str
      i = i + 1
  end
  return t
end

TriggerEvent('es:addGroupCommand', 'loadwl', 'admin', function (source, args, user)
  loadWhiteList()
  TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "WHITELIST LOADED")
end, function (source, args, user)
  TriggerClientEvent('chatMessage', source, 'SYSTEM', { 255, 0, 0 }, 'Insufficienct permissions!')
end, { help = 'Recharger la Whitelist' })
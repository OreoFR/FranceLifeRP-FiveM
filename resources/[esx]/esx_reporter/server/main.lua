ESX = nil

local os_time = os.time
local os_date = os.date

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_phone:registerNumber', 'reporter', "MESSAGE D'UN LECTEUR", false, false)
TriggerEvent('esx_society:registerSociety', 'society_reporter', 'Journaliste', 'society_reporter', 'society_reporter', 'society_reporter', {type = 'private'})


RegisterServerEvent('esx_reporter:broadcastNews')
AddEventHandler('esx_reporter:broadcastNews', function(text)
	TriggerClientEvent('esx_phone:onMessage', -1, 'reporter', text, false, true, 'FLASH NEWS', false)
end)

RegisterServerEvent('esx_reporter:sell')
AddEventHandler('esx_reporter:sell', function(client, type)
	local _source = source
	TriggerClientEvent('esx:showNotification', _source, 'Vous avez vendu un abonnement.')
	TriggerClientEvent('esx:showNotification', client, 'Vous êtes abonné au journal.' .. tostring(type))
	RegisterSub(client, type)	
end)

RegisterServerEvent('esx_reporter:cancel')
AddEventHandler('esx_reporter:cancel', function(client)
	CancelSub(client)
end)

function RegisterSub(client, type)
	local xPlayer = ESX.GetPlayerFromId(client)
	TriggerEvent('esx_datastore:getDataStore', 'subscription_reporter', xPlayer.identifier, function(store)		
		store.set('subscribed', true)		
		store.set('subtype', type)
	end)
end

function CancelSub(client)
	local xPlayer = ESX.GetPlayerFromId(client)
	local _source = source
	TriggerEvent('esx_datastore:getDataStore', 'subscription_reporter', xPlayer.identifier, function(store)		
		store.set('subscribed', false)		
		store.set('subtype', -1)
	end)
	TriggerClientEvent('esx:showNotification', _source, 'Vous avez annulé un abonnement.')
end

function GetSub(client)
	TriggerEvent('esx_datastore:getDataStore', 'subscription_reporter', client, function(store)		
		local subscribed = (store.get('subscribed') or false)
		local subtype = (store.get('subtype') or {})
		return subscribed, subtype
	end)
end

function PaySubscriptions(d, h, m)

	local asyncTasks = {}

	MySQL.Async.fetchAll(
		'SELECT * FROM `datastore_data` WHERE `name` = "subscription_reporter"',
		{},
		function(result)
			MySQL.Async.fetchAll(
				'SELECT * FROM `users`',
				{},
				function(users)
					local clients 		= {}
					local subscriptions = 0
					local xPlayers      = ESX.GetPlayers()

					for i=1, #result, 1 do

						local subs = json.decode(result[i].data)

						local _bank = 0
						local _source = nil
						local _subtype = -1

						for j=1, #xPlayers, 1 do
							local xPlayer2 = ESX.GetPlayerFromId(xPlayers[j])							
							if xPlayer2.identifier == result[i].owner then
								_source = xPlayer2.source
								break
							end
						end

						for j=1, #users, 1 do
							if result[i].owner == users[j].identifier then
								_bank = users[j].bank								
								_subtype = subs.subtype
								break
							end
						end

						if subs.subscribed == true then
							table.insert(clients,
								{
									identifier = result[i].owner,
									source = _source,
									subtype = _subtype,
									bank = _bank
								}
							)
						end

					end

					for i=1, #clients, 1 do

						if clients[i].source ~= nil then

							local player = ESX.GetPlayerFromId(clients[i].source)
							subscriptions = subscriptions + Config.SubTypes[clients[i].subtype]
							player.removeAccountMoney('bank', Config.SubTypes[clients[i].subtype])

						else

							local newMoney = clients[i].bank - Config.SubTypes[clients[i].subtype]
							subscriptions  = subscriptions + Config.SubTypes[clients[i].subtype]

							local scope = function(newMoney, identifier)

								table.insert(asyncTasks, function(cb)

									MySQL.Async.execute(
										'UPDATE users SET bank = @money WHERE identifier = @identifier',
										{
											['@money']        = newMoney,
											['@identifier']   = clients[i].identifier
										},
										function(rowsChanged)
											cb()
										end
									)

								end)

							end

							scope(newMoney, clients[i].identifier)							

						end
						
						-- local local_hour = os_date("%d/%m/%Y %H:%M:%S")
						-- file = io.open("logs/Transactions.txt", "a")
						-- if file then
							-- file:write("["..local_hour.."] Paiement de location pour society_reporter de " .. clients[i].source .. " de $" .. Config.SubTypes[clients[i].subtype .. "\n")
						-- end
						-- file:close()

					end

					TriggerEvent('esx_addonaccount:getSharedAccount', 'society_reporter', function(account)
						account.addMoney(subscriptions)
					end)

					Async.parallelLimit(asyncTasks, 5, function(results)
						print('[REPORTER] Abonnements')
					end)

				end
			)		
		end
	)
end

TriggerEvent('cron:runAt', 10, 0, PaySubscriptions)
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('esx_peage:flashed')
AddEventHandler('esx_peage:flashed', function(plaque,vitesse,modele,station)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)


	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx:showNotification', xPlayer.source,'Un véhicule a été ~b~ flashé~w~ près de la station : ~b~'.. station.."~w~.")
		end
	end










  MySQL.Async.execute('INSERT peage_flash (`plate`,`speed`,`modele`,`station`) VALUE(@plaque,@vitesse,@modele,@station) ', {
    ['@plaque'] = plaque,
    ['@vitesse'] = vitesse,
		['@modele'] = modele,
		['@station'] = station,
  }, function()
  end)


end)

	ESX.RegisterServerCallback('esx_peage:getFlash', function(source, cb,idStation)
		local xPlayer = ESX.GetPlayerFromId(source)
		MySQL.Async.fetchAll(
			'SELECT * FROM peage_flash WHERE station = @idStation',
			{
				['idStation'] = idStation
			},
			function(flash)

				cb(flash)
			end
		)
	end)


	RegisterServerEvent('esx_peage:delete_peage')
	AddEventHandler('esx_peage:delete_peage', function(id)
		MySQL.Async.fetchAll(
			'DELETE FROM peage_flash WHERE id = @id',
			{
				['@id'] = id,
			},
			function()


			end
		)
	end)

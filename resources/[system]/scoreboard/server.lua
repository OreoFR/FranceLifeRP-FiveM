ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)




function CountEMS()

	local xPlayers = ESX.GetPlayers()

	EMSConnected = 0
	PoliceConnected = 0
	PlayerConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		PlayerConnected = PlayerConnected + 1
		if xPlayer.job.name == 'ambulance' then
			EMSConnected = EMSConnected + 1
		end		
		if xPlayer.job.name == 'police' then
			PoliceConnected = PoliceConnected + 1
		end	
	end

		--SetTimeout(2000, CountEMS)
end

ESX.RegisterServerCallback('stadusrp_getJobsOnline', function(source, cb)

  local xPlayer    = ESX.GetPlayerFromId(source)
  CountEMS()
cb(EMSConnected, PoliceConnected, TaxiConnected, MekConnected, BilConnected, PlayerConnected)

end)


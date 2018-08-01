local state_ready = false
AddEventHandler("playerSpawned",function() -- delay state recording
	SetTimeout(60000, function()
		state_ready = true
	end)
end)

Citizen.CreateThread(function()
	while true do
		if state_ready then
			TriggerServerEvent('sendSessionPlayerNumber', GetNumberOfPlayers())
			Wait(60000)
		end
		Wait(0)
	end
end)

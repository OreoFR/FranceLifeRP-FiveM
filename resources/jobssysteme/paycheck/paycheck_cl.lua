Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(600000) -- FR -- Modifier cette valeur pour la fréquence des salaires (600 000 = 10 minutes) -- EN -- Change this value for the frequency of wages (600 000 = 10 minutes)
		TriggerServerEvent('paycheck:salary')
	end
end)

Citizen.CreateThread(function()
    while true do
		Wait(30000)
		TriggerServerEvent("anticheat:timer")
    end
end)

Citizen.CreateThread(function()
    while true do
		Wait(0)
		if GetEntityHealth(GetPlayerPed(-1)) > 200 or Citizen.InvokeNative(0x9483AF821605B1D8, GetPlayerPed(-1)) > 100 then
			TriggerServerEvent("anticheat:kick")
		end
    end
end)
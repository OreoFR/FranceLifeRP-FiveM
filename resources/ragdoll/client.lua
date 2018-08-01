-- Created by Scott

-- Clientside

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = GetPlayerPed(-1)
			if IsShockingEventInSphere(102, 235.497,2894.511,43.339,999999.0) then
			SetPedToRagdoll(GetPlayerPed(-1), 5000, 5000, 0, 0, 0, 0)
		end
	 end
end)

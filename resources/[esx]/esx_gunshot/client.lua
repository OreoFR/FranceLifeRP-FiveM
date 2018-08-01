ESX               = nil
local hasShot 	  = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

----- Command

--RegisterCommand("guntest", function(source)
--    TriggerEvent("esx_guntest:checkGun", source)
--end, false)

----- Code

RegisterNetEvent('esx_guntest:hasShotGun')
AddEventHandler('esx_guntest:hasShotGun', function()
	gunIsShot = true
end)

RegisterNetEvent('esx_guntest:hasNotShotGun')
AddEventHandler('esx_guntest:hasNotShotGun', function()
	gunIsShot = false
end)


RegisterNetEvent('esx_guntest:checkGun')
AddEventHandler('esx_guntest:checkGun', function(source)

	local player, distance = ESX.Game.GetClosestPlayer()
	if distance ~= -1 and distance <= 3.0 then	
		
		TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_KNEEL", 0, true)
		
		Citizen.Wait(10000)
		
		ClearPedTasksImmediately(playerPed)

		if (gunIsShot) then
			ESX.ShowNotification('Des traces de poudre à canon ont été trouvées')
		else
			ESX.ShowNotification('Aucune trace de poudre à canon n\'a été trouvée')
		end

		gunIsShot = false	

	else
		ESX.ShowNotification('Personne à proximité.')
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		if IsPedShooting(GetPlayerPed(-1)) then
			hasShot = true
		end

		if (hasShot) then
			local player, distance = ESX.Game.GetClosestPlayer()
			if distance ~= -1 and distance <= 3.0 then
				TriggerServerEvent('esx_guntest:storeStatusTrue', GetPlayerServerId(player))
			end
		else
			TriggerServerEvent('esx_guntest:storeStatusFalse', GetPlayerServerId(player))
		end
	end
end)

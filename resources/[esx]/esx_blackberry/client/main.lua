ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function ShowDeepWebIcon()
	TriggerEvent('esx_phone:showIcon', 'deepweb', true)
end

function HideDeepWebIcon()
	TriggerEvent('esx_phone:showIcon', 'deepweb', false)
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)

	for i=1, #xPlayer.inventory, 1 do

		local item = xPlayer.inventory[i]

		if item.name == 'blackberry' and item.count > 0 then
			ShowDeepWebIcon()
			break
		end

	end

end)

RegisterNetEvent('esx_blackberry:onHasBlackberry')
AddEventHandler('esx_blackberry:onHasBlackberry', function(hasBlackberry)

	if hasBlackberry then
		ShowDeepWebIcon()
	else
		HideDeepWebIcon()
	end

end)
ESX				= nil
local IsLocked	= nil
local doorList	= {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_celldoors:update')
AddEventHandler('esx_celldoors:update', function(id, IsLocked)
	if id ~= nil and IsLocked ~= nil then -- Make sure values got sent
		TriggerClientEvent('esx_celldoors:state', -1, id, IsLocked)
	end
end)

AddEventHandler('esx:playerLoaded', function(source)
	local IsLocked = true
	local id = doorList[i]
	TriggerClientEvent('esx_celldoors:state', -1, id, IsLocked)
end)
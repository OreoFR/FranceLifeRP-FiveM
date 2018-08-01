ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_guntest:storeStatusTrue')
AddEventHandler('esx_guntest:storeStatusTrue', function(source)
	TriggerClientEvent('esx_guntest:hasShotGun', source)
end)

RegisterServerEvent('esx_guntest:storeStatusFalse')
AddEventHandler('esx_guntest:storeStatusFalse', function(source)
	TriggerClientEvent('esx_guntest:hasNotShotGun', source)
end)

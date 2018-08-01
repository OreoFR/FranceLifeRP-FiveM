-- start INIT ESX
ESX              = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
-- end INIT ESX

--Settings--

price = 10 -- you may edit this to your liking. if "enableprice = false" ignore this one

--DO-NOT-EDIT-BELLOW-THIS-LINE--

ESX.RegisterServerCallback('esx_cinema:checkmoney',function(source,cb)
	local valid = false	
	TriggerEvent('es:getPlayerFromId', source, function (user)
		userMoney = user.getMoney()
		if userMoney >= price then
			user.removeMoney(price)
			valid = true
		end
	end)
		cb(valid)
end)

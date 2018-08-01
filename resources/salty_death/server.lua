ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- You must make the following change to your users table:
-- 		ALTER TABLE `users` ADD `isDead` INT NOT NULL DEFAULT '0' AFTER `name`;

RegisterServerEvent('salty_death:updatePlayer')
AddEventHandler('salty_death:updatePlayer', function(dead)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer ~= nil then
	    local identifier = xPlayer.identifier
		local deathStatus = 0

		if dead then
			deathStatus = 1
		end

		MySQL.Async.execute("UPDATE users SET isDead = @deathStatus WHERE identifier = @identifier", {
			['@deathStatus'] = deathStatus, ['@identifier'] = identifier
		})
    end
end)

ESX.RegisterServerCallback('salty_death:isDead', function (source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer ~= nil then
	    local identifier = xPlayer.identifier
	MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
		  ['@identifier'] = identifier
		},function(result)
			if result[1] ~= nil then
				local user = result[1]
				local deathStatus = user['isDead']
				if deathStatus == 0 then
					cb(false)
				else
					cb(true)
				end
			else
				cb(false)
			end
		end
		)
	end
end)


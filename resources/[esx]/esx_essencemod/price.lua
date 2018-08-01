fuelCost = 5

RegisterServerEvent('frfuel:fuelAdded')
AddEventHandler('frfuel:fuelAdded', function(amount)
TriggerEvent('es:getPlayerFromId', source, function(xPlayer)--ESX
if (xPlayer) then
            local cost = round(amount * fuelCost)
            TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Le prix de l'essence est de " .. fuelCost) --FR
            --TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "The price of gasoline is" .. fuelCost) -- EN

            xPlayer.removeMoney(cost)
            TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "votre plein est de " .. round(amount) .. " litres d'essence") --FR
            --TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Your full is " .. round(amount) .. " Liters of gasoline") --EN


            TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Le plein vous a coûté " .. round(cost)) --FR
            --TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "The full cost has cost you" .. round(cost)) --EN
        else
            TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Vous n'avez pas assez d'argent ") --FR
            --TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "You do not have enough money") --EN
end

end)
end)

function round(num, numDecimalPlaces)
    local mult = 5^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end
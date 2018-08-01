if(globalConf["SERVER"].enableGiveKey)then
    RegisterCommand('givekey', function(source, args, rawCommand)
        local src = source
        local identifier = GetPlayerIdentifiers(src)[1]

        if(args[1])then
            local targetId = args[1]
            local targetIdentifier = GetPlayerIdentifiers(targetId)[1]
            if(targetIdentifier)then
                if(targetIdentifier ~= identifier)then
                    if(args[2])then
                        local plate = string.lower(args[2])
                        if(owners[plate])then
                            if(owners[plate] == identifier)then
                                alreadyHas = false
                                for k, v in pairs(secondOwners) do
                                    if(k == plate)then
                                        for _, val in ipairs(v) do
                                            if(val == targetIdentifier)then
                                                alreadyHas = true
                                            end
                                        end
                                    end
                                end

                                if(not alreadyHas)then
                                    TriggerClientEvent("ls:giveKeys", targetIdentifier, plate)
                                    TriggerEvent("ls:addSecondOwner", targetIdentifier, plate)

                                    TriggerClientEvent("ls:notify", targetId, "You have been received the keys of vehicle " .. plate .. " by " .. GetPlayerName(src))
                                    TriggerClientEvent("ls:notify", src, "You gave the keys of vehicle " .. plate .. " to " .. GetPlayerName(targetId))
                                else
                                    TriggerClientEvent("ls:notify", src, "The target already has the keys of the vehicle")
                                    TriggerClientEvent("ls:notify", targetId, GetPlayerName(src) .. " tried to give you his keys, but you already had them")
                                end
                            else
                                TriggerClientEvent("ls:notify", src, "This is not your vehicle")
                            end
                        else
                            TriggerClientEvent("ls:notify", src, "The vehicle with this plate doesn't exist")
                        end
                    else
                        TriggerClientEvent("ls:notify", src, "Second missing argument : /givekey <id> <plate>")
                    end
                else
                    TriggerClientEvent("ls:notify", src, "You can't target yourself")
                end
            else
                TriggerClientEvent("ls:notify", src, "Player not found")
            end
        else
            TriggerClientEvent("ls:notify", src, 'First missing argument : /givekey <id> <plate>')
        end

        CancelEvent()
    end)
end

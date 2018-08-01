--====================================================================================
-- #Author: Jonathan D @Gannon
-- #Version 2.0
--====================================================================================

--====================================================================================
--  Utils
--====================================================================================
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

ESX.RegisterServerCallback('esx_gcphone:getItemAmount', function(source, cb, item)
    local xPlayer = ESX.GetPlayerFromId(source)
    local qtty = xPlayer.getInventoryItem(item).count
    cb(qtty)
end)


function GenerateUniquePhoneNumber()
    local running = true
    local phone = nil
    while running do
        local rand = '0' .. math.random(600000000,799999999)
        print('Recherche ... : ' .. rand)
        local count = MySQL.Sync.fetchScalar("SELECT COUNT(phone_number) FROM users WHERE phone_number = @phone_number", { ['@phone_number'] = rand })
        if count < 1 then
            phone = rand
            running = false
        end
    end
    print('Numero Choisi  : ' .. phone)
    return phone
end

AddEventHandler('esx:playerLoaded', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.fetchAll(
        'SELECT * FROM users WHERE identifier = @identifier',
        {
            ['@identifier'] = xPlayer.identifier
        },
        function(result)

            local phoneNumber = result[1].phone_number

            if phoneNumber == nil then

                phoneNumber = GenerateUniquePhoneNumber()

                MySQL.Async.execute(
                    'UPDATE users SET phone_number = @phone_number WHERE identifier = @identifier',
                    {
                        ['@identifier']   = xPlayer.identifier,
                        ['@phone_number'] = phoneNumber
                    }
                )
            end


        end )

end)

function getPhoneRandomNumber()
    return '0' .. math.random(600000000,699999999)
end

function getSourceFromIdentifier(identifier, cb)
    TriggerEvent("es:getPlayers", function(users)
        for k , user in pairs(users) do
            if (user.getIdentifier ~= nil and user.getIdentifier() == identifier) or (user.identifier == identifier) then
                cb(k)
                return
            end
        end
    end)
    cb(nil)
end
function getNumberPhone(identifier)
    local result = MySQL.Sync.fetchAll("SELECT users.phone_number FROM users WHERE users.identifier = @identifier", {
        ['@identifier'] = identifier
    })
    if result[1] ~= nil then
        return result[1].phone_number
    end
    return nil
end
function getIdentifierByPhoneNumber(phone_number) 
    local result = MySQL.Sync.fetchAll("SELECT users.identifier FROM users WHERE users.phone_number = @phone_number", {
        ['@phone_number'] = phone_number
    })
    if result[1] ~= nil then
        return result[1].identifier
    end
    return nil
end


function getPlayerID(source)
    local identifiers = GetPlayerIdentifiers(source)
    local player = getIdentifiant(identifiers)
    return player
end
function getIdentifiant(id)
    for _, v in ipairs(id) do
        return v
    end
end

--====================================================================================
--  Contacts
--====================================================================================
function getContacts(identifier)
    --print('je cherche les contacts de '..identifier)
    local result = MySQL.Sync.fetchAll("SELECT phone_users_contacts.id, phone_users_contacts.number, phone_users_contacts.display FROM phone_users_contacts WHERE phone_users_contacts.identifier = @identifier", {
        ['@identifier'] = identifier
    })
   -- print('trouvé')
    return result
end

function addContact(source, identifier, number, display)
  --  print(number .. ' ' ..  display)
    MySQL.Sync.execute("INSERT INTO phone_users_contacts (`identifier`, `number`,`display`) VALUES(@identifier, @number, @display)", {
        ['@identifier'] = identifier,
        ['@number'] = number,
        ['@display'] = display,
    })
    notifyContactChange(source, identifier)
end

function updateContact(source, identifier, id, number, display)
    MySQL.Sync.execute("UPDATE phone_users_contacts SET number = @number, display = @display WHERE id = @id", { 
        ['@number'] = number,
        ['@display'] = display,
        ['@id'] = id,
    })
    notifyContactChange(source, identifier)
end

function deleteContact(source, identifier, id)
    MySQL.Sync.execute("DELETE FROM phone_users_contacts WHERE `identifier` = @identifier AND `id` = @id", {
        ['@identifier'] = identifier,
        ['@id'] = id,
    })
    notifyContactChange(source, identifier)
end

function deleteAllContact(identifier)
    MySQL.Sync.execute("DELETE FROM phone_users_contacts WHERE `identifier` = @identifier", {
        ['@identifier'] = identifier
    })
end

function notifyContactChange(source, identifier)
    if source ~= nil then 
        TriggerClientEvent("gcphone:contactList", source, getContacts(identifier))
    end
end

RegisterServerEvent('gcphone:addContact')
AddEventHandler('gcphone:addContact', function(display, phoneNumber)
    local identifier = GetPlayerIdentifiers(source)[1]
    addContact(source, identifier, phoneNumber, display)
end)

RegisterServerEvent('gcphone:updateContact')
AddEventHandler('gcphone:updateContact', function(id, display, phoneNumber)
    local identifier = GetPlayerIdentifiers(source)[1]
    updateContact(source, identifier, id, phoneNumber, display)
end)

RegisterServerEvent('gcphone:deleteContact')
AddEventHandler('gcphone:deleteContact', function(id)
    local identifier = GetPlayerIdentifiers(source)[1]
    deleteContact(source, identifier, id)
end)

RegisterServerEvent("OpenTel")
AddEventHandler("OpenTel", function()
  TriggerClientEvent('OpenTel', source)
end)
--====================================================================================
--  Messages
--====================================================================================
function getMessages(identifier)
    return MySQL.Sync.fetchAll("SELECT phone_messages.* FROM phone_messages LEFT JOIN users ON users.identifier = @identifier WHERE phone_messages.receiver = users.phone_number", {
        ['@identifier'] = identifier
    })
end

function _internalAddMessage(transmitter, receiver, message, owner)
	local Query = "INSERT INTO phone_messages (`transmitter`, `receiver`,`message`, `isRead`,`owner`) VALUES(@transmitter, @receiver, @message, @isRead, @owner);"
    local Query2 = 'SELECT * from phone_messages WHERE `id` = (SELECT LAST_INSERT_ID());'
	local Parameters = {
        ['@transmitter'] = transmitter,
        ['@receiver'] = receiver,
        ['@message'] = message,
        ['@isRead'] = owner,
        ['@owner'] = owner
    }
	return MySQL.Sync.fetchAll(Query .. Query2, Parameters)[1]
end

function addMessage(source, identifier, phone_number, message)
    local otherIdentifier = getIdentifierByPhoneNumber(phone_number)
    local myPhone = getNumberPhone(identifier)
    if otherIdentifier ~= nil then 
        local tomess = _internalAddMessage(myPhone, phone_number, message, 0)
        getSourceFromIdentifier(otherIdentifier, function (osou)
            if osou ~= nil then 
               TriggerClientEvent("gcphone:receiveMessage", osou, tomess)
            end
        end) 
    end
    local memess = _internalAddMessage(phone_number, myPhone, message, 1)
    TriggerClientEvent("gcphone:receiveMessage", source, memess)
end

function setReadMessageNumber(identifier, num)
    local mePhoneNumber = getNumberPhone(identifier)
    MySQL.Sync.execute("UPDATE phone_messages SET phone_messages.isRead = 1 WHERE phone_messages.receiver = @receiver AND phone_messages.transmitter = @transmitter", { 
        ['@receiver'] = mePhoneNumber,
        ['@transmitter'] = num
    })
end

function deleteMessage(msgId)
    MySQL.Sync.execute("DELETE FROM phone_messages WHERE `id` = @id", {
        ['@id'] = msgId
    })
end

function deleteAllMessageFromPhoneNumber(identifier, phone)
    local mePhoneNumber = getNumberPhone(identifier)
    MySQL.Sync.execute("DELETE FROM phone_messages WHERE `receiver` = @mePhoneNumber and `transmitter` = @phone", {
        ['@mePhoneNumber'] = mePhoneNumber,
        ['@phone'] = phone
    })
end

function deleteAllMessage(identifier)
    local mePhoneNumber = getNumberPhone(identifier)
    MySQL.Sync.execute("DELETE FROM phone_messages WHERE `receiver` = @mePhoneNumber", {
        ['@mePhoneNumber'] = mePhoneNumber
    })
end

RegisterServerEvent('gcphone:sendMessage')
AddEventHandler('gcphone:sendMessage', function(phoneNumber, message)
	local source = source					   
    local identifier = GetPlayerIdentifiers(source)[1]
   -- print(identifier)
    addMessage(source, identifier, phoneNumber, message)
end)

RegisterServerEvent('gcphone:deleteMessage')
AddEventHandler('gcphone:deleteMessage', function(msgId)
    deleteMessage(msgId)
end)

RegisterServerEvent('gcphone:deleteMessageNumber')
AddEventHandler('gcphone:deleteMessageNumber', function(number)
    local identifier = GetPlayerIdentifiers(source)[1]
	local source = source					   
    deleteAllMessageFromPhoneNumber(identifier, number)
    TriggerClientEvent("gcphone:allMessage", source, getMessages(identifier))
end)

RegisterServerEvent('gcphone:deleteAllMessage')
AddEventHandler('gcphone:deleteAllMessage', function()
	local source = source					   
    local identifier = GetPlayerIdentifiers(source)[1]
    deleteAllMessage(identifier)
    TriggerClientEvent("gcphone:allMessage", source, getMessages(identifier))
end)

RegisterServerEvent('gcphone:setReadMessageNumber')
AddEventHandler('gcphone:setReadMessageNumber', function(num)
    local identifier = GetPlayerIdentifiers(source)[1]
    setReadMessageNumber(identifier, num)
end)

RegisterServerEvent('gcphone:deleteALL')
AddEventHandler('gcphone:deleteALL', function()
	local source = source					   
    local identifier = GetPlayerIdentifiers(source)[1]
    deleteAllMessage(identifier)
    deleteAllContact(identifier)
    TriggerClientEvent("gcphone:contactList", source, {})
    TriggerClientEvent("gcphone:allMessage", source, {})
end)

RegisterServerEvent('gcphone:internalSendMessage')
AddEventHandler('gcphone:internalSendMessage', function(identifier, from, message)
    local phone = getNumberPhone(identifier)
    if phone ~= nil then 
        local mess = _internalAddMessage(from, phone, message, 0)
        getSourceFromIdentifier(identifier, function (osou)
            if osou ~= nil then 
                TriggerClientEvent("gcPhone:receiveMessage", osou, mess)
            end
        end) 
    end
end)

--====================================================================================
--  Gestion des appels
--====================================================================================
local AppelsEnCours = {}
local lastIndexCall = 10

function getHistoriqueCall (num)
    local result = MySQL.Sync.fetchAll("SELECT * FROM phone_calls WHERE phone_calls.owner = @num ORDER BY time DESC LIMIT 120", {
        ['@num'] = num
    })
    return result
end

function sendHistoriqueCall (src, num) 
    local histo = getHistoriqueCall(num)
    TriggerClientEvent('gcphone:historiqueCall', src, histo)
end

function saveAppels (appelInfo)
    MySQL.Async.insert("INSERT INTO phone_calls (`owner`, `num`,`incoming`, `accepts`) VALUES(@owner, @num, @incoming, @accepts)", {
        ['@owner'] = appelInfo.transmitter_num,
        ['@num'] = appelInfo.receiver_num,
        ['@incoming'] = 1,
        ['@accepts'] = appelInfo.is_accepts
    }, function()
        notifyNewAppelsHisto(appelInfo.transmitter_src, appelInfo.transmitter_num)
    end)
    if appelInfo.is_valid == true then
        local num = appelInfo.transmitter_num
        if appelInfo.hidden == true then
            num = "###-####"
        end
        MySQL.Async.insert("INSERT INTO phone_calls (`owner`, `num`,`incoming`, `accepts`) VALUES(@owner, @num, @incoming, @accepts)", {
            ['@owner'] = appelInfo.receiver_num,
            ['@num'] = num,
            ['@incoming'] = 0,
            ['@accepts'] = appelInfo.is_accepts
        }, function()
            if appelInfo.receiver_src ~= nil then
                notifyNewAppelsHisto(appelInfo.receiver_src, appelInfo.receiver_num)
            end
        end)
    end
end

function notifyNewAppelsHisto (src, num) 
    sendHistoriqueCall(src, num)
end

RegisterServerEvent('gcphone:getHistoriqueCall')
AddEventHandler('gcphone:getHistoriqueCall', function()
    local sourcePlayer = tonumber(source)
    local srcIdentifier = getPlayerID(source)
    local srcPhone = getNumberPhone(srcIdentifier)
    sendHistoriqueCall(sourcePlayer, num)
end)

RegisterServerEvent('gcphone:startCall')
AddEventHandler('gcphone:startCall', function(phone_number)
    if phone_number == nil then 
        print('BAD CALL NUMBER IS NIL')
        return
    end
    local hidden = '0' .. math.random(600000000,799999999)
    if hidden == true then
        phone_number = '0' .. math.random(600000000,699999999)
    end

    local indexCall = lastIndexCall
    lastIndexCall = lastIndexCall + 1

    local sourcePlayer = tonumber(source)
    local srcIdentifier = getPlayerID(source)
    local srcPhone = getNumberPhone(srcIdentifier)
    local destPlayer = getIdentifierByPhoneNumber(phone_number)
    local is_valid = destPlayer ~= nil and destPlayer ~= srcIdentifier
    AppelsEnCours[indexCall] = {
        id = indexCall,
        transmitter_src = sourcePlayer,
        transmitter_num = srcPhone,
        receiver_src = nil,
        receiver_num = phone_number,
        is_valid = destPlayer ~= nil,
        is_accepts = false,
        hidden = hidden
    }

    if is_valid == true then
        getSourceFromIdentifier(destPlayer, function (srcTo)
            if srcTo ~= nill then
                AppelsEnCours[indexCall].receiver_src = srcTo
                TriggerClientEvent('gcphone:waitingCall', sourcePlayer, AppelsEnCours[indexCall])
                TriggerClientEvent('gcphone:waitingCall', srcTo, AppelsEnCours[indexCall])
            else
                TriggerClientEvent('gcphone:waitingCall', sourcePlayer, AppelsEnCours[indexCall])
            end
        end)
    else
        TriggerClientEvent('gcphone:waitingCall', sourcePlayer, AppelsEnCours[indexCall])
    end

end)

RegisterServerEvent('gcphone:acceptCall')
AddEventHandler('gcphone:acceptCall', function(infoCall)
    local id = infoCall.id
    if AppelsEnCours[id] ~= nil then
        if AppelsEnCours[id].transmitter_src ~= nil and AppelsEnCours[id].receiver_src ~= nil then
            AppelsEnCours[id].is_accepts = true
            TriggerClientEvent('gcphone:acceptCall', AppelsEnCours[id].transmitter_src, AppelsEnCours[id])
            TriggerClientEvent('gcphone:acceptCall', AppelsEnCours[id].receiver_src, AppelsEnCours[id])
            saveAppels(AppelsEnCours[id])
        end
    end
end)


RegisterServerEvent('gcphone:rejectCall')
AddEventHandler('gcphone:rejectCall', function (infoCall)
    local id = infoCall.id
    if AppelsEnCours[id] ~= nil then

        if AppelsEnCours[id].transmitter_src ~= nil then
            TriggerClientEvent('gcphone:rejectCall', AppelsEnCours[id].transmitter_src)
        end
        if AppelsEnCours[id].receiver_src ~= nil then
            TriggerClientEvent('gcphone:rejectCall', AppelsEnCours[id].receiver_src)
        end

        if AppelsEnCours[id].is_accepts == false then 
            saveAppels(AppelsEnCours[id])
        end
        AppelsEnCours[id] = nil
    end
end)

RegisterServerEvent('gcphone:appelsDeleteHistorique')
AddEventHandler('gcphone:appelsDeleteHistorique', function (numero)
    local sourcePlayer = tonumber(source)
    local srcIdentifier = getPlayerID(source)
    local srcPhone = getNumberPhone(srcIdentifier)
    MySQL.Sync.execute("DELETE FROM phone_calls WHERE `owner` = @owner AND `num` = @num", {
        ['@owner'] = srcPhone,
        ['@num'] = numero
    })
end)

function appelsDeleteAllHistorique(srcIdentifier)
    local srcPhone = getNumberPhone(srcIdentifier)
    MySQL.Sync.execute("DELETE FROM phone_calls WHERE `owner` = @owner", {
        ['@owner'] = srcPhone
    })
end

RegisterServerEvent('gcphone:appelsDeleteAllHistorique')
AddEventHandler('gcphone:appelsDeleteAllHistorique', function ()
    local sourcePlayer = tonumber(source)
    local srcIdentifier = getPlayerID(source)
    appelsDeleteAllHistorique(srcIdentifier)
end)








































--====================================================================================
--  OnLoad
--====================================================================================
--[[
AddEventHandler('es:playerLoaded',function(source)
    local identifier = GetPlayerIdentifiers(source)[1]
    local myPhoneNumber = getNumberPhone(identifier)
    while myPhoneNumber == nil or myPhoneNumber == 0 do 
        local randomNumberPhone = getPhoneRandomNumber()
        print('TryPhone: ' .. randomNumberPhone)
        MySQL.Sync.execute("UPDATE users SET phone = @randomNumberPhone WHERE identifier = @identifier", { 
            ['@randomNumberPhone'] = randomNumberPhone,
            ['@identifier'] = identifier
        })
        myPhoneNumber = getNumberPhone(identifier)
    end
    TriggerClientEvent("gcphone:myPhoneNumber", source, myPhoneNumber)
    TriggerClientEvent("gcphone:contactList", source, getContacts(identifier))
    TriggerClientEvent("gcphone:allMessage", source, getMessages(identifier))
end)
]]
-- Just For reload
RegisterServerEvent('gcphone:allUpdate')
AddEventHandler('gcphone:allUpdate', function()
	local source = source
    local identifier = GetPlayerIdentifiers(source)[1]
   -- print('Etape 1')
    TriggerClientEvent("gcphone:myPhoneNumber", source, getNumberPhone(identifier))
    --print('Etape 2')
    TriggerClientEvent("gcphone:contactList", source, getContacts(identifier))
    --print('Etape 3')
    TriggerClientEvent("gcphone:allMessage", source, getMessages(identifier))
    --print('Etapes finish')
end)



-- local Transaction = MySQL.Sync.beginTransaction()
-- MySQL.Sync.execute("INSERT INTO phone_messages (`transmitter`, `receiver`,`message`, `isRead`,`owner`) VALUES(@transmitter, @receiver, @message, @isRead, @owner)", {
--     ['@transmitter'] = 'Inconnu',
--     ['@receiver'] = '06',
--     ['@message'] = 'Je sais qui tu est',
--     ['@isRead'] = 0,
--     ['@owner'] = 0
-- }, Transaction)

-- MySQL.Sync.fetchScalar('SELECT LAST_INSERT_ID()', nil, Transaction)
-- local result = MySQL.Sync.commitTransaction(Transaction)
-- print('result: ' .. json.encode(result))



-- function wrapQueryNoClose(next, Connection, Message, Transformer)
--     Transformer = Transformer or function (Result) return Result end
--     local Stopwatch = clr.System.Diagnostics.Stopwatch()
--     Stopwatch.Start()

--     return function (Result, Error)
--         if Error ~= nil then
--             Logger:Error(Error.ToString())

--             -- if Connection then
--             --     Connection.Close()
--             --     Connection.Dispose()
--             -- end

--             return nil
--         end

--         local ConnectionId = -1;

--         Result = Transformer(Result)

--         -- if Connection then
--         --     ConnectionId = Connection.ServerThread
--         --     Connection.Close()
--         --     Connection.Dispose()
--         -- end

--         Stopwatch.Stop()
        
--         next(Result)

--         return Result
--     end
-- end

-- function MySQLInsertMessage(Parameters) 
--     local Query = "INSERT INTO phone_messages (`transmitter`, `receiver`,`message`, `isRead`,`owner`) VALUES(@transmitter, @receiver, @message, @isRead, @owner)"
--     local Query2 = 'SELECT * from phone_messages WHERE `id` = (SELECT LAST_INSERT_ID())'
--     local Connection = MySQL:createConnection()
--     local Command = Connection.CreateCommand()
--     Command.CommandText = Query
--     if type(Parameters) == "table" then
--         for Param in pairs(Parameters) do
--             Command.Parameters.AddWithValue(Param, Parameters[Param])
--         end
--     end
--     pcall(Command.ExecuteNonQuery)

--     --phase2
--     Command = Connection.CreateCommand()
--     Command.CommandText = Query2
--     local status, result = pcall(Command.ExecuteReader)
--     return MySQL.Async.wrapQuery(
--         function (Result)
--             return Result
--         end,
--         Connection,
--         Command.CommandText
--     )(MyConvertResultToTable(result), nil)
-- end


-- local result = MySQLInsertMessage({
--         ['@transmitter'] = 'Inconnu',
--         ['@receiver'] = '06',
--         ['@message'] = 'Je sais qui tu est',
--         ['@isRead'] = 0,
--         ['@owner'] = 0
--     })
-- print('result: ' .. json.encode(result))
-- local mess = MySQL.Sync.fetchAll('SELECT * from phone_messages WHERE `id` = (SELECT LAST_INSERT_ID())', {})
-- print('result: ' .. json.encode(mess))
-- for _, v in pairs(data) do 
--     for key, vv in pairs(v) do 
--         print(key .. ' -> ' .. vv)
--     end
--     print('----')
-- end

-- local query = "INSERT INTO phone_messages (`transmitter`, `receiver`,`message`, `isRead`,`owner`) VALUES(@transmitter, @receiver, @message, @isRead, @owner)"
-- local params = {
--         ['@transmitter'] = '00',
--         ['@receiver'] = '00',
--         ['@message'] = '00',
--         ['@isRead'] = 1,
--         ['@owner'] = 1
--     }
-- local insert = MySQL.Sync.execute(, )
-- print('TTTTTTTTTTTTTTTT')
-- print(insert)



-- local Command = MySQL.Utils.CreateCommand(query, params)
-- --return MySQL.Sync.wrapQuery(Command.ExecuteReader, connection, Command.CommandText, MySQL.Utils.ConvertResultToTable)
-- local asyncWrapper = MySQL.Async.wrapQuery(
--     function (Result)
--         return Result
--     end,
--     Command.Connection,
--     Command.CommandText
-- )
-- local status, result = pcall(Command.ExecuteReader)
-- local r = asyncWrapper(ConvertObjectTimeStamp(result), nil)
-- local identifier = 'steam:1100001013c8633'
-- local data = nil
-- data = MySQLQueryTimeStamp("SELECT phone_messages.* FROM phone_messages LEFT JOIN users ON users.identifier = @identifier WHERE phone_messages.receiver = users.phone", {
--         ['@identifier'] = identifier
--     })
-- print('DATA')

-- for _, v in pairs(data) do 
--     for key, vv in pairs(v) do 
--         print(key .. ' -> ' .. vv)
--     end
--     print('----')
-- end

-- data = MySQL.Sync.fetchAll("SELECT phone_messages.* FROM phone_messages LEFT JOIN users ON users.identifier = @identifier WHERE phone_messages.receiver = users.phone", {
--         ['@identifier'] = identifier
--     })
-- print('DATA')
-- for _, v in pairs(data) do 
--     for key, vv in pairs(v) do 
--         print(key .. ' -> ' .. vv)
--     end
--     print('----')
-- end
-- Debug
----[[
-- local identifier = 'steam:1100001013c8633'
-- local myPhoneNumber = '0693854121'
-- local otherPhoneNumber = '0645122261'
-- local fakePhoneNumber = '0633308300'


-- print('Check Number')
-- print('myPhoneNumber Exist ? : ' .. getIdentifierByPhoneNumber(myPhoneNumber))
-- print('otherPhoneNumber Exist ? : ' .. getIdentifierByPhoneNumber(otherPhoneNumber))
-- print('fakePhoneNumber Exist ? : ' .. getIdentifierByPhoneNumber(fakePhoneNumber))
-- print('')

-- print('Phone number: ' .. getNumberPhone(identifier))

-- print('')
-- print('Contacts')
-- local listContacts = getContacts(identifier)
-- for _, v in ipairs(listContacts) do 
--     print(v.display .. ' => ' .. v.number)
-- end

-- print('')
-- print('Messages')
-- local mesasges = getMessages(identifier)
-- print(#mesasges)
-- for _, v in pairs(mesasges) do 
--     for key, vv in pairs(v) do 
--         print(key .. ' -> ' .. vv)
--     end
--     print('----')
-- end

-- addMessage(identifier, otherPhoneNumber, 'Test002')
-- addMessage(identifier, fakePhoneNumber, 'Test002')

-- deleteAllMessageFromPhoneNumber(identifier, otherIdentifier)
-- deleteAllMessage(identifier)
--]] -- END DEBUG & Teste


--====================================================================================
--  App bourse
--====================================================================================
function getBourse()
    --  Format
    --  Array 
    --    Object
    --      -- libelle type String    | Nom
    --      -- price type number      | Prix actuelle
    --      -- difference type number | Evolution 
    -- 
    -- local result = MySQL.Sync.fetchAll("SELECT * FROM `recolt` LEFT JOIN `items` ON items.`id` = recolt.`treated_id` WHERE fluctuation = 1 ORDER BY price DESC",{})
    local result = {
        {
            libelle = 'Google',
            price = 125.2,
            difference =  -12.1
        },
        {
            libelle = 'Microsoft',
            price = 132.2,
            difference = 3.1
        },
        {
            libelle = 'Amazon',
            price = 120,
            difference = 0
        }
    }
    return result
end

--====================================================================================
--  ITEM
--====================================================================================

ESX.RegisterServerCallback('gcphone:getItemAmount', function(source, cb, item)
    local xPlayer = ESX.GetPlayerFromId(source)
    local qtty = xPlayer.getInventoryItem(item).count
	print("phone qtty: " .. qtty)
    cb(qtty)
end)
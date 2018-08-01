ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_qalle_brottsregister:add')
AddEventHandler('esx_qalle_brottsregister:add', function(id, reason)
  local identifier = ESX.GetPlayerFromId(id).identifier
  local date = os.date("%Y-%m-%d")
  MySQL.Async.fetchAll(
    'SELECT firstname, lastname FROM users WHERE identifier = @identifier',{['@identifier'] = identifier},
    function(result)
    if result[1] ~= nil then
      MySQL.Async.execute('INSERT INTO qalle_brottsregister (identifier, firstname, lastname, dateofcrime, crime) VALUES (@identifier, @firstname, @lastname, @dateofcrime, @crime)',
        {
          ['@identifier']   = identifier,
          ['@firstname']    = result[1].firstname,
          ['@lastname']     = result[1].lastname,
          ['@dateofcrime']  = date,
          ['@crime']        = reason,
        }
      )
    end
  end)
end)

function getIdentity(source)
  local identifier = GetPlayerIdentifiers(source)[1]
  local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
  if result[1] ~= nil then
    local identity = result[1]

    return {
      identifier = identity['identifier'],
      firstname = identity['firstname'],
      lastname = identity['lastname'],
      dateofbirth = identity['dateofbirth'],
      sex = identity['sex'],
      height = identity['height']
    }
  else
    return nil
  end
end


--gets brottsregister
ESX.RegisterServerCallback('esx_qalle_brottsregister:grab', function(source, cb, target)
  local identifier = ESX.GetPlayerFromId(target).identifier
  local name = getIdentity(target)
  MySQL.Async.fetchAll("SELECT identifier, firstname, lastname, dateofcrime, crime FROM `qalle_brottsregister` WHERE `identifier` = @identifier",
  {
    ['@identifier'] = identifier
  },
  function(result)
    if identifier ~= nil then
        local crime = {}

      for i=1, #result, 1 do
        table.insert(crime, {
          crime = result[i].crime,
          name = result[i].firstname .. ' - ' .. result[i].lastname,
          date = result[i].dateofcrime,
        })
      end
      cb(crime)
    else
    print('Finns inget brott för ' ..identifier)
    end
  end)
end)

RegisterServerEvent('esx_qalle_brottsregister:remove')
AddEventHandler('esx_qalle_brottsregister:remove', function(id, crime)
  local identifier = ESX.GetPlayerFromId(id).identifier
  MySQL.Async.fetchAll(
    'SELECT firstname FROM users WHERE identifier = @identifier',{['@identifier'] = identifier},
    function(result)
    if (result[1] ~= nil) then
      MySQL.Async.execute('DELETE FROM qalle_brottsregister WHERE identifier = @identifier AND crime = @crime',
      {
        ['@identifier']    = identifier,
        ['@crime']     = crime
      }
    )
    end
  end)
end)
--notification
function sendNotification(xSource, message, messageType, messageTimeout)
    TriggerClientEvent("pNotify:SendNotification", xSource, {
        text = message,
        type = messageType,
        queue = "qalle",
        timeout = messageTimeout,
        layout = "bottomCenter"
    })
end
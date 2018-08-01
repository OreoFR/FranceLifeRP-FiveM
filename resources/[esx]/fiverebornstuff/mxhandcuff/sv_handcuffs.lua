-- Server side handcuff script

AddEventHandler('chatMessage', function(source, n, message) -- capture 'chatMessage' events
  local args = stringsplit(message, " ") -- Split the message up into an array of words

  if (args[1] == "/cuff") then -- if the first "word" is /cuff
    CancelEvent() -- dont pass this chat message further, we're handling it

    if (args[2] ~= nil) then -- make sure we have an actual second "word"
      local playerID = tonumber(args[2]) -- Store the playerID that was passed, as a number

      -- If this is not a valid player
      if (playerID < 1 or playerID > 32) then
        -- tell the sender they have an invalid target
        TriggerClientEvent('chatMessage', source, "SYSTEM", {200, 0, 0}, "Invalid PlayerID!")
        return -- dont continue any further
      end

      -- at this point we should have a valid PlayerID to target, so lets send him a handcuffed event
      TriggerClientEvent('mHandCuff', playerID) -- Sends event 'mHandCuff' to playerID
    else -- if args[2] does equal nil (doesnt exist)
      local event = 'chatMessage' -- What event are we sending
      local eventTarget = source -- Who do we send the event too (-1 means all)
      local messageSender = "SYSTEM" -- Message sender
      local messageSenderColor = {200, 0, 0} -- Message sender color
      local message = "Usage: /cuff <PlayerID>" -- show a `how-to-use` message
      -- This could be shortened into just one line, it was exanded to show what each parameter does
      TriggerClientEvent(event, eventTarget, messageSender, messageSenderColor, message) -- send the event
      -- NOTE: the variables after "eventTarget" will be passed to the event handlers function
      -- you will see in cl_handcuffs.lua, that the 'mHandCuff' event does not take any arguements
      -- hence why it is sent above with only the event name and target ID
    end
  end
end)

-- utility function to turn a string into an array of words
function stringsplit(self, delimiter)
  local a = self:Split(delimiter)
  local t = {}

  for i = 0, #a - 1 do
     table.insert(t, a[i])
  end

  return t
end

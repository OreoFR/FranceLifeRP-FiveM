print("Fire Script has loaded! Coded by Rjross2013")

-- RegisterServerEvent("lol:startfire")
-- AddEventHandler("lol:startfire", function( x , y , z , args, p)
	-- TriggerClientEvent("chatMessage", p, "LOL ", {255, 0, 0}, "it got to server.")
	-- maxChilds = args[1]
	-- isGas = args[2]
	-- gasFire = false
	-- if (isGas == 1) then
		-- gasFire = true
	-- end
	-- TriggerClientEvent("chatMessage", p, "INFO", {255, 0, 0}, tostring(y))
	-- TriggerClientEvent("chatMessage", p, "INFO", {255, 0, 0}, tostring(maxChilds))
	-- TriggerClientEvent("chatMessage", p, "INFO", {255, 0, 0}, tostring(gasFire))
	-- StartScriptFire(x, y, z, maxChilds, gasFire)
-- end)
RegisterServerEvent('fire:chatAlert')
AddEventHandler('fire:chatAlert', function( text )  
    TriggerClientEvent('chatMessage', -1, 'FIRE', {255, 0, 0}, 'A fire has been spotted at: ' .. text)
end)
 RegisterServerEvent("lol:firesyncs")
 AddEventHandler("lol:firesyncs", function( firec, lastamnt, deletedfires, original )
	--local test = ping
	TriggerClientEvent("lol:firesyncs2", -1, firec, lastamnt, deletedfires, original)
	--TriggerClientEvent("lol:firesync3", -1)
 end)
  RegisterServerEvent("lol:fireremovesyncs2")
 AddEventHandler("lol:fireremovesyncs2", function( firec, lastamnt, deletedfires, original )
	--local test = ping
	TriggerClientEvent("lol:fireremovesync", -1, firec, lastamnt, deletedfires, original)
 end)
 RegisterServerEvent("lol:firesyncs60")
 AddEventHandler("lol:firesyncs60", function()
	--local test = ping
	--TriggerClientEvent("lol:firesyncs2", -1, firec, lastamnt, deletedfires, original)
	TriggerClientEvent("lol:firesync3", -1)
 end)
  RegisterServerEvent("lol:removefires")
 AddEventHandler("lol:removefires", function( x, y, z, i )
	local test = i
	--local test = ping
	TriggerClientEvent("lol:fireremovess", -1, x, y, z, test)
	--TriggerClientEvent("lol:firesync3", -1)
 end)
AddEventHandler("chatMessage", function(p, color, msg)
    if msg:sub(1, 1) == "/" then
        fullcmd = stringSplit(msg, " ")
        cmd = fullcmd[1]
		
		

        if cmd == "/fire" then
			TriggerClientEvent("chatMessage", p, "FIRE ", {255, 0, 0}, "You started a fire! ")
                local fireamnt = cmd[2]
        	TriggerClientEvent("lol:firethings", p)
        	CancelEvent()
        end
        if cmd == "/firestop" then
			TriggerClientEvent("chatMessage", p, "FIRE ", {255, 0, 0}, "You stopped all fires!")
        	TriggerClientEvent("lol:firestop", p)
			TriggerClientEvent("lol:firesync", -1)
        	CancelEvent()
        end
        if cmd == "/coords" then
        	TriggerClientEvent("lol:coords", p)
        	CancelEvent()
        end
		if cmd == "/firecount" then
        	TriggerClientEvent("lol:firecounter", p)
        	CancelEvent()
        end
        if cmd == "/cbomb" then
        	TriggerClientEvent("lol:carbomb", p)
        	CancelEvent()
        end
		if cmd == "/test" then
        	TriggerClientEvent("lol:test1", p)
        	CancelEvent()
        end
		if cmd == "/sync" then
        	TriggerClientEvent("lol:firesync3", p)
        end
        if cmd == "/firehelp" then
        	TriggerClientEvent("chatMessage", p, "FIRE ", {255, 0, 0}, "You can start a big fire by typing /fire, and you can also start a single fire by pressing the home key! /cbomb blows up the last car you entered and starts a big fire around it!")
        	CancelEvent()
        end
    end
end)
function stringSplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end
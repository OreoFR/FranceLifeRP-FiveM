
AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/pos" then
		CancelEvent()
		TriggerClientEvent("SaveCommand", source)
	end
end)

function stringsplit(inputstr, sep)
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

RegisterServerEvent("SaveCoords")
AddEventHandler("SaveCoords", function( PlayerName , x , y , z )
 file = io.open( PlayerName .. "-Coords.txt", "a")
    if file then
        file:write("{" .. x .. "," .. y .. "," .. z .. "}, \n")
    end
    file:close()
end)
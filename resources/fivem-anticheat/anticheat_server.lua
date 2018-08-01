Users = {}
RegisterServerEvent("anticheat:timer")
AddEventHandler("anticheat:timer", function()
	if Users[source] then
		if (os.time() - Users[source]) < 25 then
			DropPlayer(source, "Speedhack")
		else
			Users[source] = os.time()
		end
	else
		Users[source] = os.time()
	end
end)

AddEventHandler('playerDropped', function()
	if(Users[source])then
		Users[source] = nil
	end
end)

RegisterServerEvent("anticheat:kick")
AddEventHandler("anticheat:kick", function()
	DropPlayer(source, "Hacker")
end)
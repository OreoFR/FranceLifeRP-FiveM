local firstSpawn = false
AddEventHandler("playerSpawned", function()
	if(not firstSpawn) then
		TriggerServerEvent("rocade:removePlayerToInConnect")
		firstSpawn = true
	end

end)
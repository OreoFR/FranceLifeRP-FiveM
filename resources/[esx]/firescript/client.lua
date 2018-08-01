fireremover = {}
fireremoverParticles = {}
streetnames = {}


----------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------- CONFIG AREA -------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------
local chatStreetAlerts = true
local chanceForSpread = 900 -- basically a thousand sided dice is rolled and if it gets above this number then the fire spreads once
local spawnRandomFires = true -- set to true and put x,y,z locations and amount of time before their is a chance of a fire spawning
local spawnRandomFireChance = 400 -- basically a thousand sided dice is rolled and if it gets above this number then a fire spawns at one of the locations specified
local randomSpawnTime = 1200000 -- time to wait before trying ot spawn another random fire in milliseconds 1,200,000 is 20 minutes this is per player.
local randomFireLocations = { --  this is the format you need to put in for your possible locations.
	{ ['x'] = -46.56327, ['y'] = -1097.382, ['z'] = 25.99875 },
	{ ['x'] = 455.40682983398, ['y'] = -1016.9927368164, ['z'] = 28.412754058838 },
	{ ['x'] = 46.4554, ['y'] = 6458.1826, ['z'] = 31.4252 },
    { ['x'] = 644.9803, ['y'] = 2792.7102, ['z'] = 41.9462 },
}

if spawnRandomFires == true then
	Citizen.CreateThread(function() 

		while true do 
			Citizen.Wait(randomSpawnTime)
			local randomNumber = math.random(1,1000)

			if randomNumber > spawnRandomFireChance then
				local possibleLocations = #randomFireLocations
				local LocationID = math.random(1, possibleLocations)
				local location = randomFireLocations[LocationID]
				local x = location.x
				local y = location.y
				local z = location.z
				FSData.originalfiremaker = tostring(GetPlayerPed(-1))
					
				
				
	                                          
	                
				if not HasNamedPtfxAssetLoaded("core") then
					RequestNamedPtfxAsset("core")
					while not HasNamedPtfxAssetLoaded("core") do
						Wait(1)
					end
				end
				SetPtfxAssetNextCall("core")
				
				
			
				table.insert(FSData.lastamnt, 20)
			
	           	local rand = math.random(1, 200)
				if rand > 100 then
					table.insert(FSData.lastamnt, StartParticleFxLoopedAtCoord("ent_ray_heli_aprtmnt_l_fire", x, y, z-0.8, 0.0, 0.0, 0.0, 1.0, false, false, false, false))
				else
					table.insert(FSData.lastamnt, StartParticleFxLoopedAtCoord("ent_ray_heli_aprtmnt_h_fire", x, y, z-0.8, 0.0, 0.0, 0.0, 1.0, false, false, false, false))
				end
				table.insert(FSData.lastamnt, x)
	      		table.insert(FSData.lastamnt, y)
	           	table.insert(FSData.lastamnt, z-0.8)
			
	           	table.insert(fireremover, StartScriptFire (x, y, z-0.8, 25, false))
	           	table.insert(fireremover, x)
	           	table.insert(fireremover, y)
	           	table.insert(fireremover, z-0.8)
				local firec = {}
				local lastamnt = {}
				local deletedfires = {}
				for i=1,#FSData.firecoords do
					firec[i] = FSData.firecoords[i]
				end
				for i=1,#FSData.lastamnt do
					lastamnt[i] = FSData.lastamnt[i]
				end
				for i=1,#FSData.deletedfires do
					deletedfires[i] = FSData.deletedfires[i]
				end
				local original = tostring(FSData.originalfiremaker)
				if chatStreetAlerts == true then
	            	chatAlerts(x, y, z)
	        	end
				TriggerServerEvent("lol:firesyncs", firec, lastamnt, deletedfires, original)
				Citizen.Wait(2000)


			end
		end 

	end)
end
function chatAlerts(x, y, z)
	Citizen.CreateThread(function() 
		local text = "this"
		local streetA, streetB = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, x, y, z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
		
		table.insert( streetnames, GetStreetNameFromHashKey( streetA ) )
		if tostring(streetB) ~= "0" then
			table.insert( streetnames, GetStreetNameFromHashKey( streetB ) )
		end
		if tostring(streetB) ~= "0" then
			text = table.concat( streetnames, " & " )
		else
			text = GetStreetNameFromHashKey( streetA ) 
		end
		TriggerServerEvent("fire:chatAlert", text)
		streetnames = {}
	end)
end


----------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------- Handles the use of /fire -----------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent("lol:firethings")
AddEventHandler("lol:firethings", function()
	local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	FSData.removeallfires = false
    local coordis = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
    local count = math.random(3, 6)
	FSData.originalfiremaker = tostring(GetPlayerPed(-1))
    while (count > 0) do
        x = x + math.random(-5, 5)
        y = y + math.random(-5, 5)
        if not HasNamedPtfxAssetLoaded("core") then
	    	RequestNamedPtfxAsset("core")
	        while not HasNamedPtfxAssetLoaded("core") do
		        Wait(1)
	        end
        end
		SetPtfxAssetNextCall("core")

        table.insert(FSData.lastamnt, 20)
        local rand = math.random(1, 200)
		if rand > 100 then
			table.insert(FSData.lastamnt, StartParticleFxLoopedAtCoord("ent_ray_heli_aprtmnt_l_fire", x+5, y, z-0.7, 0.0, 0.0, 0.0, 1.0, false, false, false, false))
		else
			table.insert(FSData.lastamnt, StartParticleFxLoopedAtCoord("ent_ray_heli_aprtmnt_h_fire", x+5, y, z-0.7, 0.0, 0.0, 0.0, 1.0, false, false, false, false))
		end
		table.insert(FSData.lastamnt, x+5)
        table.insert(FSData.lastamnt, y)
        table.insert(FSData.lastamnt, z-0.7)
        table.insert(fireremover, StartScriptFire (x+5, y, z-0.8, 24, false))
        table.insert(fireremover, x+5)
        table.insert(fireremover, y)
        table.insert(fireremover, z-0.8)
		count = count - 1
    end
    local firec = {}
		local lastamnt = {}
		local deletedfires = {}
		for i=1,#FSData.firecoords do
			firec[i] = FSData.firecoords[i]
		end
		for i=1,#FSData.lastamnt do
			lastamnt[i] = FSData.lastamnt[i]
		end
		for i=1,#FSData.deletedfires do
			deletedfires[i] = FSData.deletedfires[i]
		end
		local original = tostring(FSData.originalfiremaker)
		TriggerServerEvent("lol:firesyncs", firec, lastamnt, deletedfires, original)
                
        
        if chatStreetAlerts == true then
            chatAlerts(x, y, z)
        end
	--firehelper(fireremover)		
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------- Remove all fires currently not working ----------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent("lol:firestop")
AddEventHandler("lol:firestop", function()
		for i=1,#fireremover do
		     RemoveScriptFire(fireremover[i])
		end
        for i=1,#fireremoverParticles do
		   
			RemoveParticleFx(fireremoverParticles[i], true)
		end
		for i=1,#FSData.lastamnt do
		    RemoveParticleFx(FSData.lastamnt[i], true)
			
		end
		fireremoverParticles = {}
		fireremover = {}
end)
RegisterNetEvent("lol:fireremovesync")
AddEventHandler("lol:fireremovesync", function( firec, lastamnt, deletedfires, original )
		
			FSData.originalfiremaker = original
			
			for i=1,#firec do
					FSData.firecoords[i] = firec[i]
			end
			for i=1,#lastamnt do
					FSData.lastamnt[i] = lastamnt[i]
			end
			for i=1,#deletedfires do
					FSData.deletedfires[i] = deletedfires[i]
			end
			
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------- Thread to handle fire syncing --------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent("lol:firesyncs2")
AddEventHandler("lol:firesyncs2", function( firec, lastamnt, deletedfires, original )
		
			FSData.originalfiremaker = original
			
			for i=1,#firec do
					FSData.firecoords[i] = firec[i]
			end
			for i=1,#lastamnt do
					FSData.lastamnt[i] = lastamnt[i]
			end
			for i=1,#deletedfires do
					FSData.deletedfires[i] = deletedfires[i]
			end
				TriggerServerEvent("lol:firesyncs60")
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------- just a debug function ------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent("lol:test2")
AddEventHandler("lol:test2", function( test )
		TriggerEvent("chatMessage", "FIRE", {255, 0, 0},"test string: " .. tostring(test))
end)
function firehelper(fireremover)
for i=1,#fireremover do
		     PlaceObjectOnGroundProperly(fireremover[i])
		end

end

----------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------- Produces players coordinates in chat -----------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent("lol:coords")
AddEventHandler("lol:coords", function()
		local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                TriggerEvent("chatMessage", "Coords", {255, 0, 0},"X: " .. tostring(x) .. " Y: " .. tostring(y) .. " Z: " .. tostring(z))
				
				
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------- Produces a count of all fires spawned sense last script restart --------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent("lol:firecounter")
AddEventHandler("lol:firecounter", function()
		local counter = 0
		for i=1,#FSData.lastamnt do
			if FSData.lastamnt[i-1] == 20 or  FSData.lastamnt[i-1] == 1 then
				counter = counter + 1
			end
		end
		TriggerEvent("chatMessage", "Coords", {255, 0, 0},"There was " .. counter .. " fires today so far.")
				
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------- Spawns all fires synced to client ------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent("lol:firesync3")
AddEventHandler("lol:firesync3", function()
	for i=1,#FSData.lastamnt do
		if FSData.lastamnt[i-1] == 20 then
	
			local x = FSData.lastamnt[i+1]
			local y = FSData.lastamnt[i+2]
			local z = FSData.lastamnt[i+3]
			SetPtfxAssetNextCall("core")
			if FSData.originalfiremaker ~= tostring(GetPlayerPed(-1)) then
				local rand = math.random(1, 200)
				if rand > 100 then
					table.insert(fireremoverParticles, StartParticleFxLoopedAtCoord("ent_ray_heli_aprtmnt_l_fire", x, y, z-0.7, 0.0, 0.0, 0.0, 1.0, false, false, false, false))
				else
					table.insert(fireremoverParticles, StartParticleFxLoopedAtCoord("ent_ray_heli_aprtmnt_h_fire", x, y, z-0.7, 0.0, 0.0, 0.0, 1.0, false, false, false, false))
				end
				table.insert(fireremover, StartScriptFire (x, y, z-0.1, 25, false))
			end
		end
	end
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------- Sets fires under the last vehicle ped was in --------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent("lol:carbomb")
AddEventHandler("lol:carbomb", function()
	FSData.removeallfires = false
		
	local vehicle = GetPlayersLastVehicle()
	if (vehicle == nil) then
	    return
	end
	FSData.originalfiremaker = tostring(GetPlayerPed(-1))
	local x, y, z = table.unpack(GetEntityCoords(vehicle, true))
    TriggerEvent("chatMessage", "FIRE", {255, 0, 0},"You made that car go BOOM!")
		
	local count = math.random(2,10)
    while (count > 0) do
        x = x + math.random(-1, 1)
        y = y + math.random(-1, 1)
		if not HasNamedPtfxAssetLoaded("core") then
			RequestNamedPtfxAsset("core")
			while not HasNamedPtfxAssetLoaded("core") do
				Wait(1)
			end
		end
		SetPtfxAssetNextCall("core")
		table.insert(FSData.lastamnt, 20)
                
				
        local rand = math.random(1, 200)
		if rand > 100 then
			table.insert(FSData.lastamnt, StartParticleFxLoopedAtCoord("ent_ray_heli_aprtmnt_l_fire", x, y, z-0.7, 0.0, 0.0, 0.0, 1.0, false, false, false, false))
		else
			table.insert(FSData.lastamnt, StartParticleFxLoopedAtCoord("ent_ray_heli_aprtmnt_h_fire", x, y, z-0.7, 0.0, 0.0, 0.0, 1.0, false, false, false, false))
		end
		table.insert(FSData.lastamnt, x)
        table.insert(FSData.lastamnt, y)
        table.insert(FSData.lastamnt, z)
    	table.insert(fireremover, StartScriptFire (x, y, z-0.8, 24, false))
  		table.insert(fireremover, x)
        table.insert(fireremover, y)
        table.insert(fireremover, z)
		count = count - 1
    end
    local firec = {}
	local lastamnt = {}
	local deletedfires = {}
	for i=1,#FSData.firecoords do
		firec[i] = FSData.firecoords[i]
	end
	for i=1,#FSData.lastamnt do
		lastamnt[i] = FSData.lastamnt[i]
	end
	for i=1,#FSData.deletedfires do
		deletedfires[i] = FSData.deletedfires[i]
	end
	local original = tostring(FSData.originalfiremaker)
	TriggerServerEvent("lol:firesyncs", firec, lastamnt, deletedfires, original)
    if chatStreetAlerts == true then
        chatAlerts(x, y, z)
    end

end)

----------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------- Responsible for syncing fires to all clients (deprecated) ----------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent("lol:firesync")
AddEventHandler("lol:firesync", function()

		local removedFires = FSData.removeallfires
		local fireCoords = FSData.firecoords

		if removedFires == true then
			for i=1,#fireremover do
				RemoveScriptFire(fireremover[i])
			end
			for i=1,#fireremoverParticles do
				RemoveParticleFx(fireremoverParticles[i], true)
			end
			fireremoverParticles = {}
			fireremover = {}
			removedFires = false
			FSData.originalfiremaker = nil
			local firec = {}
			local lastamnt = {}
			local deletedfires = {}
			for i=1,#FSData.firecoords do
					firec[i] = FSData.firecoords[i]
			end
			for i=1,#FSData.lastamnt do
					lastamnt[i] = FSData.lastamnt[i]
			end
			for i=1,#FSData.deletedfires do
					deletedfires[i] = FSData.deletedfires[i]
			end
			
				local original = tostring(FSData.originalfiremaker)
				TriggerServerEvent("lol:firesyncs", firec, lastamnt, deletedfires, original)
		end
		
		
	
		
		
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------- Mostly unused but still here for debuging ----------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent("lol:fireremovess")
AddEventHandler("lol:fireremovess", function( x, y, z, test )
		
	local l = test
		
	for i=1,#fireremoverParticles do
		if fireremoverParticles[l+1] == fireremoverParticles[i+1] then
			RemoveParticleFxInRange(fireremoverParticles[i+1], fireremoverParticles[i+2], fireremoverParticles[i+3], 1.5)
		end
	end
	for i=1,#FSData.lastamnt do
		if FSData.lastamnt[i+1] == FSData.lastamnt[l+1] then
			RemoveParticleFxInRange(FSData.lastamnt[i+1], FSData.lastamnt[i+2], FSData.lastamnt[i+3], 1.5)
			FSData.lastamnt[i-1] = 1
		end
	end
		
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------- Thread to handle spawning initial fire ---------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function() 
	while true do 
		Citizen.Wait(0)
		if IsControlJustPressed(1, 168) then -- button f7
			FSData.originalfiremaker = tostring(GetPlayerPed(-1))
				
			local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
			local coords = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                                          
                
			if not HasNamedPtfxAssetLoaded("core") then
				RequestNamedPtfxAsset("core")
				while not HasNamedPtfxAssetLoaded("core") do
					Wait(1)
				end
			end
			SetPtfxAssetNextCall("core")
			
			
		
			table.insert(FSData.lastamnt, 20)
		
           	local rand = math.random(1, 200)
			if rand > 100 then
				table.insert(FSData.lastamnt, StartParticleFxLoopedAtCoord("ent_ray_heli_aprtmnt_l_fire", x+5, y, z-0.7, 0.0, 0.0, 0.0, 1.0, false, false, false, false))
			else
				table.insert(FSData.lastamnt, StartParticleFxLoopedAtCoord("ent_ray_heli_aprtmnt_h_fire", x+5, y, z-0.7, 0.0, 0.0, 0.0, 1.0, false, false, false, false))
			end
			table.insert(FSData.lastamnt, x+5)
      		table.insert(FSData.lastamnt, y)
           	table.insert(FSData.lastamnt, z-0.7)
		
           	table.insert(fireremover, StartScriptFire (x+5, y, z-0.8, 25, false))
           	table.insert(fireremover, x+5)
           	table.insert(fireremover, y)
           	table.insert(fireremover, z-0.8)
			local firec = {}
			local lastamnt = {}
			local deletedfires = {}
			for i=1,#FSData.firecoords do
				firec[i] = FSData.firecoords[i]
			end
			for i=1,#FSData.lastamnt do
				lastamnt[i] = FSData.lastamnt[i]
			end
			for i=1,#FSData.deletedfires do
				deletedfires[i] = FSData.deletedfires[i]
			end
			local original = tostring(FSData.originalfiremaker)
			if chatStreetAlerts == true then
            	chatAlerts(x, y, z)
        	end
			TriggerServerEvent("lol:firesyncs", firec, lastamnt, deletedfires, original)
			Citizen.Wait(2000)
		end
	end 
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------- Thread to handle spreading of fires -----------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()

	while true do
				
				Wait(1000)
                for i=1,#FSData.lastamnt do
					Wait(50)
					
					if FSData.lastamnt[i-1] == 20 then
						
					
				    if not HasNamedPtfxAssetLoaded("core") then
						RequestNamedPtfxAsset("core")
						while not HasNamedPtfxAssetLoaded("core") do
							Wait(1)
						end
					end
					
					SetPtfxAssetNextCall("core")
					if DoesEntityExist(FSData.lastamnt[i]) then
						
						PlaceObjectOnGroundProperly(FSData.lastamnt[i])
					end
					
                        local x = FSData.lastamnt[i+1]
                        local y = FSData.lastamnt[i+2]
                        local z = FSData.lastamnt[i+3]
						
					--if FSData.originalfiremaker == tostring(GetPlayerPed(-1)) then					
                    	if GetNumberOfFiresInRange(x, y, z, 1) == 0 then
							if GetNumberOfFiresInRange(x, y, z, 1) == 0 then
								TriggerServerEvent("lol:removefires", x, y, z, i)							
							end
                   		end
					--end
																	
						local chances = math.random(1, 1000)
						if chances > chanceForSpread then
						if FSData.originalfiremaker == tostring(GetPlayerPed(-1)) then
						
							local xrand = FSData.lastamnt[i+1] + math.random(-6, 6)
							local yrand = FSData.lastamnt[i+2] + math.random(-6, 6)
							while xrand > -1 and xrand < 2 do
								xrand = xrand + math.random(2, 6)
							end
							while yrand > -1 and yrand < 2 do
								yrand = yrand + math.random(2, 6)
							end
							
							table.insert(FSData.lastamnt, 20)
							
							
							local rand = math.random(1, 200)
							if rand > 100 then
								table.insert(FSData.lastamnt, StartParticleFxLoopedAtCoord("ent_ray_heli_aprtmnt_l_fire", xrand, yrand, FSData.lastamnt[i+3], 0.0, 0.0, 0.0, 1.0, false, false, false, false))
							else
								table.insert(FSData.lastamnt, StartParticleFxLoopedAtCoord("ent_ray_heli_aprtmnt_h_fire", xrand, yrand, FSData.lastamnt[i+3], 0.0, 0.0, 0.0, 1.0, false, false, false, false))
							end
							table.insert(FSData.lastamnt, xrand)
							table.insert(FSData.lastamnt, yrand)
							table.insert(FSData.lastamnt, FSData.lastamnt[i+3])
							table.insert(fireremover, StartScriptFire (xrand, yrand, FSData.lastamnt[i+3]-0.1, 25, false))
							table.insert(fireremover, xrand)
							table.insert(fireremover, yrand)
							table.insert(fireremover, FSData.lastamnt[i+3]-0.1)
			local firec = {}
			local lastamnt = {}
			local deletedfires = {}
			for i=1,#FSData.firecoords do
					firec[i] = FSData.firecoords[i]
			end
			for i=1,#FSData.lastamnt do
					lastamnt[i] = FSData.lastamnt[i]
			end
			for i=1,#FSData.deletedfires do
					deletedfires[i] = FSData.deletedfires[i]
			end
	
				local original = tostring(FSData.originalfiremaker)
				TriggerServerEvent("lol:firesyncs", firec, lastamnt, deletedfires, original)
				end
						end
                   
		end
				end
				
		Citizen.Wait(50)
		    
	end
end)
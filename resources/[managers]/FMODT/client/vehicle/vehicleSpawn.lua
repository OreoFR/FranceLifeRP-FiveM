despawnable = true; autodelete = true; mapblip = true
local SpawnModel, IsTrailer, AttachedVehicles, AtachVehicle1, AtachVehicle2
local AtachVehicleName, AttachX, AttachY, AttachZ, acufo, damufo, fzufo
local spawnVehicleByName
local Object = 0

Citizen.CreateThread(function() --Spawn Menu							[Multiple Pages]
	while true do
	
		local playerPed = GetPlayerPed(-1)
		local playerVeh = GetVehiclePedIsIn(playerPed, false)
		if (spawnMenu1) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionspawnMenu1
			else
				lastSelectionspawnMenu1 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					spawnMenu1 = false
					spawnMenu2 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					spawnMenu1 = false
					spawnMenu2 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. SpawnVehicleTitle .. "")

			TriggerEvent("FMODT:Bool", DespawnableTitle, despawnable, function(cb)
				despawnable = cb
				if despawnable then
					drawNotification("~g~" .. DespawnableEnableMessage .. "!")
				else
					autodelete = true
					drawNotification("~r~" .. DespawnableDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Bool", ReplaceTitle, autodelete, function(cb)
				autodelete = cb
				if autodelete then
					drawNotification("~g~" .. ReplaceEnableMessage .. "!")
				else
					despawnable = true
					drawNotification("~r~" .. ReplaceDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Bool", MarkOnMapTitle, mapblip, function(cb)
				mapblip = cb
				if mapblip then
					drawNotification("~g~" .. MarkOnMapEnableMessage .. "!")
				else
					drawNotification("~r~" .. MarkOnMapDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Option", SpawnVehicleByNameTitle, function(cb)
				if (cb) then
					spawnVehicleByName = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. FancyVehiclesTitle .. "", function(cb)
				if (cb) then
					spawnMenu1 = false
					fancySpawn = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey("BMX"))), function(cb)
				if (cb) then
					spawnMenu1 = false
					bikeSpawn = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey("DINGHY"))), function(cb)
				if (cb) then
					spawnMenu1 = false
					boatSpawn = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey("BENSON"))), function(cb)
				if (cb) then
					spawnMenu1 = false
					commercialSpawn = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey("BLISTA"))), function(cb)
				if (cb) then
					spawnMenu1 = false
					compactSpawn = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey("COGCABRIO"))), function(cb)
				if (cb) then
					spawnMenu1 = false
					coupeSpawn = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey("AMBULANCE"))), function(cb)
				if (cb) then
					spawnMenu1 = false
					emergencySpawn = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey("ANNIHILATOR"))), function(cb)
				if (cb) then
					spawnMenu1 = false
					helicopterSpawn1 = true
				end
			end)
			
			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey("BULLDOZER"))), function(cb)
				if (cb) then
					spawnMenu1 = false
					industrialSpawn = true
				end
			end)
			
			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey("APC"))), function(cb)
				if (cb) then
					spawnMenu1 = false
					militarySpawn = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey("AKUMA"))), function(cb)
				if (cb) then
					spawnMenu1 = false
					motorcycleSpawn1 = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey("BLADE"))), function(cb)
				if (cb) then
					spawnMenu1 = false
					muscleSpawn1 = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey("BFINJECTION"))), function(cb)
				if (cb) then
					spawnMenu1 = false
					offroadSpawn1 = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey("BLIMP"))), function(cb)
				if (cb) then
					spawnMenu1 = false
					planeSpawn1 = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey("ASEA"))), function(cb)
				if (cb) then
					spawnMenu1 = false
					sedanSpawn1 = true
				end
			end)

			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 1", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 1")
				end
			end)

			TriggerEvent("FMODT:Update")
		
		elseif (spawnMenu2) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionspawnMenu2
			else
				lastSelectionspawnMenu2 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					spawnMenu2 = false
					spawnMenu1 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					spawnMenu2 = false
					spawnMenu1 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~Spawn Menu")

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey("AIRBUS"))), function(cb)
				if (cb) then
					spawnMenu2 = false
					serviceSpawn = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey("ALPHA"))), function(cb)
				if (cb) then
					spawnMenu2 = false
					sportSpawn1 = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey("ARDENT"))), function(cb)
				if (cb) then
					spawnMenu2 = false
					sportClassicSpawn1 = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey("ADDER"))), function(cb)
				if (cb) then
					spawnMenu2 = false
					superSpawn1 = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey("BALLER"))), function(cb)
				if (cb) then
					spawnMenu2 = false
					suvSpawn1 = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~Trailer", function(cb)
				if (cb) then
					spawnMenu2 = false
					trailerSpawn1 = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey("AIRTUG"))), function(cb)
				if (cb) then
					spawnMenu2 = false
					utilitySpawn = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey("BISON"))), function(cb)
				if (cb) then
					spawnMenu2 = false
					vanSpawn1 = true
				end
			end)
			
			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 2", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 2")
				end
			end)

			TriggerEvent("FMODT:Update")
		end


		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Fancy Spawn Menu
	while true do
	
		if fancySpawn then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionfancySpawn
			else
				lastSelectionfancySpawn = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. FancyVehiclesTitle .. "")

			TriggerEvent("FMODT:Option", "Dozurgent", function(cb)
				if (cb) then
					AttachedVehicles = true
					AtachVehicle1 = "BULLDOZER"
					AtachVehicle2 = "INSURGENT2"
					AtachVehicleName = "Dozurgent"
					AttachX = 0.0
					AttachY = 0.0
					AttachZ = -0.5
				end
			end)

			TriggerEvent("FMODT:Option", "Monsterbus", function(cb)
				if (cb) then
					AttachedVehicles = true
					AtachVehicle1 = "BUS"
					AtachVehicle2 = "MARSHALL"
					AtachVehicleName = "Monsterbus"
					AttachX = 0.0
					AttachY = 0.0
					AttachZ = 1.0
				end
			end)

			TriggerEvent("FMODT:Option", "Monsurgent", function(cb)
				if (cb) then
					AttachedVehicles = true
					AtachVehicle1 = "INSURGENT2"
					AtachVehicle2 = "MONSTER"
					AtachVehicleName = "Monsurgent"
					AttachX = 0.0
					AttachY = 0.05
					AttachZ = 0.4
				end
			end)

			TriggerEvent("FMODT:Option", "UFO (Alien Camp)", function(cb)
				if (cb) then
					acufo = true
				end
			end)

			TriggerEvent("FMODT:Option", "UFO (Damaged)", function(cb)
				if (cb) then
					damufo = true
				end
			end)

			TriggerEvent("FMODT:Option", "UFO (Fort Zancudo)", function(cb)
				if (cb) then
					fzufo = true
				end
			end)

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Bike Spawn Menu
	local vehicles = {"BMX", "CRUISER", "TRIBIKE2", "FIXTER", "SCORCHER", "TRIBIKE3", "TRIBIKE"}
	while true do
		if bikeSpawn then

			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionbikeSpawn
			else
				lastSelectionbikeSpawn = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))
			
			for i = 1, tablelength(vehicles) do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Boat Spawn Menu
	local vehicles = {"DINGHY", "DINGHY2", "DINGHY3", "DINGHY4", "JETMAX", "SUBMERSIBLE", "SUBMERSIBLE2", "MARQUIS", "PREDATOR",
					  "SEASHARK", "SEASHARK2", "SEASHARK3", "SPEEDER", "SPEEDER2", "SQUALO", "SUNTRAP", "TORO", "TORO2", "TROPIC",
					  "TROPIC2", "TUG"}
	while true do
		if boatSpawn then

			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionboatSpawn
			else
				lastSelectionboatSpawn = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))
			
			for i = 1, tablelength(vehicles) do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Commercial Vehicle Spawn Menu
	local vehicles = {"BENSON", "BIFF", "HAULER", "HAULER2", "MULE", "MULE2", "MULE3", "PACKER", "PHANTOM", "PHANTOM2",
					  "PHANTOM3", "POUNDER", "STOCKADE", "STOCKADE3"}
	while true do
		if commercialSpawn then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectioncommercialSpawn
			else
				lastSelectioncommercialSpawn = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 1, tablelength(vehicles) do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end
			
			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Compact Vehicles Spawn Menu
	local vehicles = {"BLISTA", "BLISTA2", "BLISTA3", "BRIOSO", "DILETTANTE", "DILETTANTE2", "ISSI2", "PANTO", "PRAIRIE", "RHAPSODY"}
	while true do
		if compactSpawn then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectioncompactSpawn
			else
				lastSelectioncompactSpawn = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 1, tablelength(vehicles) do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end
			
			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Coupes Spawn Menu
	local vehicles = {"COGCABRIO", "EXEMPLAR", "F620", "FELON", "FELON2", "JACKAL", "ORACLE", "ORACLE2", "SENTINEL", "SENTINEL2",
					  "WINDSOR", "WINDSOR2", "ZION", "ZION2"}
	while true do
		if coupeSpawn then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectioncoupeSpawn
			else
				lastSelectioncoupeSpawn = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 1, tablelength(vehicles) do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end
			
			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Emergency Vehicles Spawn Menu
	local vehicles = {"AMBULANCE", "FBI", "FBI2", "FIRETRUK", "LGUARD", "PBUS", "POLICE", "POLICE2", "POLICE3", "POLICE4",
					  "POLICEB", "POLICEOLD1", "POLICEOLD2", "POLICET", "PRANGER", "RIOT", "SHERIFF", "SHERIFF2"}
	while true do
		if emergencySpawn then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionemergencySpawn
			else
				lastSelectionemergencySpawn = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 1, tablelength(vehicles) do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end
			
			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Helicopters Spawn Menu				[Multiple Pages]
	local vehicles = {"ANNIHILATOR", "BUZZARD", "BUZZARD2", "CARGOBOB", "CARGOBOB2", "CARGOBOB3", "CARGOBOB4", "HUNTER", "FROGGER", "FROGGER2",
					  "SWIFT", "SWIFT2", "HAVOK", "MAVERICK", "POLMAV", "SAVAGE", "SKYLIFT", "SUPERVOLITO", "SUPERVOLITO2", "VALKYRIE",
					  "VALKYRIE2", "VOLATUS"}
	while true do
		if helicopterSpawn1 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionhelicopterSpawn1
			else
				lastSelectionhelicopterSpawn1 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174) then
					helicopterSpawn1 = false
					helicopterSpawn2 = true
				elseif IsDisabledControlJustReleased(1, 175) then
					helicopterSpawn1 = false
					helicopterSpawn2 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 1, 20 do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end
			
			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 1", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 1")
				end
			end)

			TriggerEvent("FMODT:Update")
			
		elseif helicopterSpawn2 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionhelicopterSpawn2
			else
				lastSelectionhelicopterSpawn2 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174) then
					helicopterSpawn1 = true
					helicopterSpawn2 = false
				elseif IsDisabledControlJustReleased(1, 175) then
					helicopterSpawn1 = true
					helicopterSpawn2 = false
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 21, tablelength(vehicles) do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end
			
			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 2", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 2")
				end
			end)

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Industrial Vehicles Spawn Menu
	local vehicles = {"BULLDOZER", "CUTTER", "HANDLER", "DUMP", "FLATBED", "FORKLIFT", "MIXER", "MIXER2",
					   "RUBBLE", "TIPTRUCK", "TIPTRUCK2"}
	while true do
		if industrialSpawn then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionindustrialSpawn
			else
				lastSelectionindustrialSpawn = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 1, tablelength(vehicles) do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Military Vehicles Spawn Menu
	local vehicles = {"APC", "BARRACKS", "BARRACKS2", "BARRACKS3", "CRUSADER", "HALFTRACK", "RHINO"}
	while true do
		if militarySpawn then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionmilitarySpawn
			else
				lastSelectionmilitarySpawn = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 1, tablelength(vehicles) do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Motorcycles Spawn Menu				[Multiple Pages]
	local vehicles = {"AKUMA", "AVARUS", "BAGGER", "BATI", "BATI2", "BF400", "CARBONRS", "CHIMERA", "CLIFFHANGER", "DAEMON",
				      "DAEMON2", "DEFILER", "DIABLOUS", "DIABLOUS2", "DOUBLE", "ENDURO", "ESSKEY", "FAGGIO", "FAGGIO2", "FAGGIO3",
					  "FCR", "FCR2", "GARGOYLE", "HAKUCHOU", "HAKUCHOU2", "HEXER", "INNOVATION", "LECTRO", "MANCHEZ", "NEMESIS",
					  "NIGHTBLADE", "OPPRESSOR", "PCJ", "RATBIKE", "RUFFIAN", "SANCHEZ", "SANCHEZ2", "SANCTUS", "SHOTARO", "SOVEREIGN",
					  "THRUST", "VADER", "VINDICATOR", "VORTEX", "WOLFSBANE", "ZOMBIEA", "ZOMBIEB"}
	while true do
		if motorcycleSpawn1 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionmotorcycleSpawn1
			else
				lastSelectionmotorcycleSpawn1 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174) then
					motorcycleSpawn1 = false
					motorcycleSpawn3 = true
				elseif IsDisabledControlJustReleased(1, 175) then
					motorcycleSpawn1 = false
					motorcycleSpawn2 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 1, 20 do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end

			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 1", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 1")
				end
			end)

			TriggerEvent("FMODT:Update")
		
		elseif motorcycleSpawn2 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionmotorcycleSpawn2
			else
				lastSelectionmotorcycleSpawn2 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					motorcycleSpawn2 = false
					motorcycleSpawn1 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					motorcycleSpawn2 = false
					motorcycleSpawn3 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 21, 40 do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end

			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 2", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 2")
				end
			end)

			TriggerEvent("FMODT:Update")
		
		elseif motorcycleSpawn3 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionmotorcycleSpawn3
			else
				lastSelectionmotorcycleSpawn3 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					motorcycleSpawn3 = false
					motorcycleSpawn2 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					motorcycleSpawn3 = false
					motorcycleSpawn1 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 41, tablelength(vehicles) do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end

			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 3", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 3")
				end
			end)

			TriggerEvent("FMODT:Update")
		end
		
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Muscle Vehicles Spawn Menu			[Multiple Pages]
	local vehicles = {"BLADE", "BUCCANEER", "BUCCANEER2", "CHINO", "CHINO2", "COQUETTE3", "DOMINATOR", "DOMINATOR2", "DUKES", "DUKES2",
					  "FACTION", "FACTION3", "GAUNTLET", "GAUNTLET2", "HOTKNIFE", "LURCHER", "NIGHTSHADE", "PHOENIX", "PICADOR", "RATLOADER",
					  "RATLOADER2", "RUINER", "RUINER2", "RUINER3", "SABREGT", "SABREGT2", "SLAMVAN2", "SLAMVAN3", "STALION", "STALION2",
					  "TAMPA", "TAMPA2", "TAMPA3", "VIGERO", "VIRGO", "VIRGO2", "VIRGO3", "VOODOO", "VOODOO2"}
	while true do
		if muscleSpawn1 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionmuscleSpawn1
			else
				lastSelectionmuscleSpawn1 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174) then
					muscleSpawn1 = false
					muscleSpawn2 = true
				elseif IsDisabledControlJustReleased(1, 175) then
					muscleSpawn1 = false
					muscleSpawn2 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 1, 20 do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end

			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 1", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 1")
				end
			end)

			TriggerEvent("FMODT:Update")
		elseif muscleSpawn2 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionmuscleSpawn2
			else
				lastSelectionmuscleSpawn2 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					muscleSpawn2 = false
					muscleSpawn1 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					muscleSpawn2 = false
					muscleSpawn1 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 21, tablelength(vehicles) do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end

			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 2", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 2")
				end
			end)

			TriggerEvent("FMODT:Update")

		end
		
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Off-Road Vehicles Spawn Menu			[Multiple Pages]
	local vehicles = {"BFINJECTION", "BIFTA", "BLAZER", "BLAZER2", "BLAZER3", "BLAZER4", "BLAZER5", "BODHI2", "BRAWLER", "DUBSTA3",
					  "DUNE", "DUNE2", "DUNE3", "DUNE4", "DUNE5", "DLOADER", "GUARDIAN", "INSURGENT", "INSURGENT2", "INSURGENT3",
					  "KALAHARI", "MARSHALL", "MESA3", "MONSTER", "NIGHTSHARK", "RANCHERXL", "RANCHERXL2", "REBEL", "REBEL2", "SANDKING",
					  "SANDKING2", "TECHNICAL", "TECHNICAL2", "TECHNICAL3", "TROPHYTRUCK", "TROPHYTRUCK2", "WASTELANDER"}
	while true do
		if offroadSpawn1 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionoffroadSpawn1
			else
				lastSelectionoffroadSpawn1 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					offroadSpawn1 = false
					offroadSpawn2 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					offroadSpawn1 = false
					offroadSpawn2 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 1, 20 do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end

			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 1", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 1")
				end
			end)

			TriggerEvent("FMODT:Update")
			
		elseif offroadSpawn2 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionoffroadSpawn2
			else
				lastSelectionoffroadSpawn2 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					offroadSpawn2 = false
					offroadSpawn1 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					offroadSpawn2 = false
					offroadSpawn1 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 21, tablelength(vehicles) do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end

			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 2", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 2")
				end
			end)

			TriggerEvent("FMODT:Update")
		end
		
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Planes Spawn Menu						[Multiple Pages]
	local vehicles = {"ALPHAZ1", "BLIMP", "BLIMP2", "BESRA", "BOMBUSHKA", "CARGOPLANE", "CUBAN800", "DODO", "DUSTER", "HOWARD",
					   "HYDRA", "JET", "LAZER", "LUXOR", "LUXOR2", "MAMMATUS", "MILJET", "MICROLIGHT", "MOGUL", "MOLOTOK",
					   "NIMBUS", "NOKOTA","PYRO", "ROGUE", "SEABREEZE", "SHAMAL", "STARLING", "STUNT", "TITAN", "TULA",
					   "VELUM", "VELUM2", "VESTRA"}
	while true do
		if planeSpawn1 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionplaneSpawn1
			else
				lastSelectionplaneSpawn1 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					planeSpawn1 = false
					planeSpawn2 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					planeSpawn1 = false
					planeSpawn2 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 1, 20 do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end

			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 1", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 1")
				end
			end)

			TriggerEvent("FMODT:Update")
			
		elseif planeSpawn2 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionplaneSpawn2
			else
				lastSelectionplaneSpawn2 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					planeSpawn2 = false
					planeSpawn1 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					planeSpawn2 = false
					planeSpawn1 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 21, tablelength(vehicles) do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end

			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 2", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 2")
				end
			end)

			TriggerEvent("FMODT:Update")
		end
		
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Sedans Spawn Menu						[Multiple Pages]
	local vehicles = {"ASEA", "ASEA2", "ASTEROPE", "COG55", "COG552", "COGNOSCENTI", "COGNOSCENTI2", "EMPEROR", "EMPEROR2", "EMPEROR3",
					  "FUGITIVE", "GLENDALE", "INGOT", "INTRUDER", "LIMO2", "PREMIER", "PRIMO", "PRIMO2", "REGINA", "ROMERO",
					  "SCHAFTER2", "SCHAFTER3", "SCHAFTER4", "SCHAFTER5", "SCHAFTER6", "STANIER", "STRATUM", "STRETCH", "SUPERD", "SURGE",
					  "TAILGATER", "WARRENER", "WASHINGTON"}
	while true do
		if sedanSpawn1 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionsedanSpawn1
			else
				lastSelectionsedanSpawn1 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					sedanSpawn1 = false
					sedanSpawn2 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					sedanSpawn1 = false
					sedanSpawn2 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 1, 20 do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end

			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 1", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 1")
				end
			end)

			TriggerEvent("FMODT:Update")
			
		elseif sedanSpawn2 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionsedanSpawn2
			else
				lastSelectionsedanSpawn2 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					sedanSpawn2 = false
					sedanSpawn1 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					sedanSpawn2 = false
					sedanSpawn1 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 21, tablelength(vehicles) do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end

			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 2", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 2")
				end
			end)

			TriggerEvent("FMODT:Update")
		end
		
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Service Vehicles Spawn Menu
	local vehicles = {"AIRBUS", "BRICKADE", "Bus", "COACH", "RALLYTRUCK", "RENTALBUS", "TRASH", "TRASH2",
					  "TAXI", "TOURBUS"}
	while true do
		if serviceSpawn then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionserviceSpawn
			else
				lastSelectionserviceSpawn = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 1, tablelength(vehicles) do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Sport Vehicles Spawn Menu				[Multiple Pages]
	local vehicles = {"ALPHA", "BANSHEE", "BESTIAGTS", "BUFFALO", "BUFFALO2", "BUFFALO3", "CARBONIZZARE", "COMET2", "COMET2", "COQUETTE",
					  "ELEGY", "ELEGY2", "FELTZER2", "FUROREGT", "FUSILADE", "FUTO", "JESTER", "JESTER2", "KHAMELION", "KURUMA",
					  "KURUMA2", "MASSACRO", "MASSACRO2", "NINEF", "NINEF2", "OMNIS", "PENUMBRA", "RAPIDGT", "RAPIDGT2", "RAPTOR",
					  "RUSTON", "Schwarzer", "SEVEN70", "SPECTER", "SPECTER2", "SULTAN", "SURANO", "TROPOS", "VERLIERER2"}
	while true do
		if sportSpawn1 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionsportSpawn1
			else
				lastSelectionsportSpawn1 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					sportSpawn1 = false
					sportSpawn2 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					sportSpawn1 = false
					sportSpawn2 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 1, 20 do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end

			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 1", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 1")
				end
			end)

			TriggerEvent("FMODT:Update")
			
		elseif sportSpawn2 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionsportSpawn2
			else
				lastSelectionsportSpawn2 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					sportSpawn2 = false
					sportSpawn1 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					sportSpawn2 = false
					sportSpawn1 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 21, tablelength(vehicles) do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end

			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 2", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 2")
				end
			end)

			TriggerEvent("FMODT:Update")
			
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Sport Classics Spawn Menu				[Multiple Pages]
	local vehicles = {"ARDENT", "CASCO", "CHEETAH2", "COQUETTE2", "BTYPE", "BTYPE2", "BTYPE3", "FELTZER3", "INFERNUS2", "MAMBA",
					  "MANANA", "MONROE", "PEYOTE", "PIGALLE", "RAPIDGT3", "RETINUE", "STINGER", "STINGERGT", "TORERO", "TORNADO",
					  "TORNADO2", "TORNADO3", "TORNADO4", "TORNADO5", "TORNADO6", "ZTYPE"}
	while true do
		if sportClassicSpawn1 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionsportClassicSpawn1
			else
				lastSelectionsportClassicSpawn1 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					sportClassicSpawn1 = false
					sportClassicSpawn2 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					sportClassicSpawn1 = false
					sportClassicSpawn2 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 1, 20 do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end

			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 1", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 1")
				end
			end)

			TriggerEvent("FMODT:Update")
			
		elseif sportClassicSpawn2 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionsportClassicSpawn2
			else
				lastSelectionsportClassicSpawn2 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					sportClassicSpawn2 = false
					sportClassicSpawn1 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					sportClassicSpawn2 = false
					sportClassicSpawn1 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 21, tablelength(vehicles) do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end

			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 2", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 2")
				end
			end)

			TriggerEvent("FMODT:Update")
		end
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Super Vehicles Spawn Menu				[Multiple Pages]
	local vehicles = {"ADDER", "BANSHEE2", "BULLET", "CHEETAH", "CYCLONE", "ENTITYXF", "FMJ", "GP1", "INFERNUS", "ITALIGTB",
					  "ITALIGTB2", "LE7B", "NERO", "NERO2", "OSIRIS", "PENETRATOR", "PFISTER811", "PROTOTIPO", "REAPER", "SHEAVA",
					  "SULTANRS", "T20", "TEMPESTA", "TURISMOR", "TYRUS", "VACCA", "VAGNER", "VIGILANTE", "VISIONE", "VOLTIC",
					  "VOLTIC2", "XA21", "ZENTORNO"}
	while true do
		if superSpawn1 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionsuperSpawn1
			else
				lastSelectionsuperSpawn1 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					superSpawn1 = false
					superSpawn2 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					superSpawn1 = false
					superSpawn2 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 1, 20 do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end

			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 1", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 1")
				end
			end)

			TriggerEvent("FMODT:Update")
			
		elseif superSpawn2 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionsuperSpawn2
			else
				lastSelectionsuperSpawn2 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					superSpawn2 = false
					superSpawn1 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					superSpawn2 = false
					superSpawn1 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 21, tablelength(vehicles) do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end

			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 2", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 2")
				end
			end)

			TriggerEvent("FMODT:Update")
		end
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --SUVs Spawn Menu						[Multiple Pages]
	local vehicles = {"BALLER", "BALLER2", "BALLER3", "BALLER4", "BALLER5", "BALLER6", "BJXL", "CAVALCADE", "CAVALCADE2", "CONTENDER",
					  "DUBSTA", "DUBSTA2", "FQ2", "GRANGER", "GRESLEY", "HABANERO", "HUNTLEY", "LANDSTALKER", "MESA", "MESA2",
					  "PATRIOT", "RADI", "ROCOTO", "SEMINOLE", "SERRANO", "XLS", "XLS2"}
	while true do
		if suvSpawn1 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionsuvSpawn1
			else
				lastSelectionsuvSpawn1 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					suvSpawn1 = false
					suvSpawn2 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					suvSpawn1 = false
					suvSpawn2 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 1, 20 do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end
			
			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 1", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 1")
				end
			end)

			TriggerEvent("FMODT:Update")
			
		elseif suvSpawn2 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionsuvSpawn2
			else
				lastSelectionsuvSpawn2 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					suvSpawn2 = false
					suvSpawn1 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					suvSpawn2 = false
					suvSpawn1 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 21, tablelength(vehicles) do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end
			
			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 2", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 2")
				end
			end)

			TriggerEvent("FMODT:Update")
		end
		
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Trailer Spawn Menu					[Multiple Pages]
	while true do
		if trailerSpawn1 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectiontrailerSpawn1
			else
				lastSelectiontrailerSpawn1 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					trailerSpawn1 = false
					trailerSpawn2 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					trailerSpawn1 = false
					trailerSpawn2 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~Trailer")

			TriggerEvent("FMODT:Option", "Anti Aircraft Trailer", function(cb)
				if (cb) then
					IsTrailer = true
					SpawnModel = GetHashKey("TRAILERSMALL2")
				end
			end)

			TriggerEvent("FMODT:Option", "Army Gas Tanker", function(cb)
				if (cb) then
					IsTrailer = true
					SpawnModel = GetHashKey("ARMYTANKER")
				end
			end)

			TriggerEvent("FMODT:Option", "Army Trailer Cutter", function(cb)
				if (cb) then
					IsTrailer = true
					SpawnModel = GetHashKey("ARMYTRAILER2")
				end
			end)

			TriggerEvent("FMODT:Option", "Army Trailer Flat", function(cb)
				if (cb) then
					IsTrailer = true
					SpawnModel = GetHashKey("ARMYTRAILER")
				end
			end)

			TriggerEvent("FMODT:Option", "Bale Trailer", function(cb)
				if (cb) then
					IsTrailer = true
					SpawnModel = GetHashKey("BALETRAILER")
				end
			end)

			TriggerEvent("FMODT:Option", "Blue Trailer", function(cb)
				if (cb) then
					IsTrailer = true
					SpawnModel = GetHashKey("TRAILERS")
				end
			end)

			TriggerEvent("FMODT:Option", "Boat Trailer", function(cb)
				if (cb) then
					IsTrailer = true
					SpawnModel = GetHashKey("BOATTRAILER")
				end
			end)

			TriggerEvent("FMODT:Option", "Car Trailer Loaded", function(cb)
				if (cb) then
					IsTrailer = true
					SpawnModel = GetHashKey("TR4")
				end
			end)

			TriggerEvent("FMODT:Option", "Car Trailer Unloaded", function(cb)
				if (cb) then
					IsTrailer = true
					SpawnModel = GetHashKey("TR2")
				end
			end)

			TriggerEvent("FMODT:Option", "Dock Trailer", function(cb)
				if (cb) then
					IsTrailer = true
					SpawnModel = GetHashKey("DOCKTRAILER")
				end
			end)

			TriggerEvent("FMODT:Option", "Flat Trailer", function(cb)
				if (cb) then
					IsTrailer = true
					SpawnModel = GetHashKey("TRFLAT")
				end
			end)

			TriggerEvent("FMODT:Option", "Freight Trailer", function(cb)
				if (cb) then
					IsTrailer = true
					SpawnModel = GetHashKey("FREIGHTTRAILER")
				end
			end)

			TriggerEvent("FMODT:Option", "Gas Tanker", function(cb)
				if (cb) then
					IsTrailer = true
					SpawnModel = GetHashKey("TANKER")
				end
			end)

			TriggerEvent("FMODT:Option", "Gas Tanker (No Livery)", function(cb)
				if (cb) then
					IsTrailer = true
					SpawnModel = GetHashKey("TANKER2")
				end
			end)

			TriggerEvent("FMODT:Option", "Grain Trailer", function(cb)
				if (cb) then
					IsTrailer = true
					SpawnModel = GetHashKey("GRAINTRAILER")
				end
			end)

			TriggerEvent("FMODT:Option", "Logs Trailer", function(cb)
				if (cb) then
					IsTrailer = true
					SpawnModel = GetHashKey("TRAILERLOGS")
				end
			end)

			TriggerEvent("FMODT:Option", "Mobile Operation Center", function(cb)
				if (cb) then
					IsTrailer = true
					SpawnModel = GetHashKey("TRAILERLARGE")
				end
			end)

			TriggerEvent("FMODT:Option", "Prop Trailer", function(cb)
				if (cb) then
					IsTrailer = true
					SpawnModel = GetHashKey("PROPTRAILER")
				end
			end)

			TriggerEvent("FMODT:Option", "Rake Trailer", function(cb)
				if (cb) then
					IsTrailer = true
					SpawnModel = GetHashKey("RAKETRAILER")
				end
			end)

			TriggerEvent("FMODT:Option", "Small Trailer", function(cb)
				if (cb) then
					IsTrailer = true
					SpawnModel = GetHashKey("TRAILERSMALL")
				end
			end)

			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 1", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 1")
				end
			end)

			TriggerEvent("FMODT:Update")
			
		elseif trailerSpawn2 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectiontrailerSpawn2
			else
				lastSelectiontrailerSpawn2 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					trailerSpawn2 = false
					trailerSpawn1 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					trailerSpawn2 = false
					trailerSpawn1 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~Trailer")

			TriggerEvent("FMODT:Option", "Television Trailer", function(cb)
				if (cb) then
					IsTrailer = true
					SpawnModel = GetHashKey("TVTRAILER")
				end
			end)

			TriggerEvent("FMODT:Option", "Trailer Advertisment", function(cb)
				if (cb) then
					IsTrailer = true
					SpawnModel = GetHashKey("TRAILERS2")
				end
			end)

			TriggerEvent("FMODT:Option", "Trailer Big Goods", function(cb)
				if (cb) then
					IsTrailer = true
					SpawnModel = GetHashKey("TRAILERS3")
				end
			end)

			TriggerEvent("FMODT:Option", "Trailer Container", function(cb)
				if (cb) then
					IsTrailer = true
					SpawnModel = GetHashKey("TRAILERS4")
				end
			end)

			TriggerEvent("FMODT:Option", "Yacht Trailer", function(cb)
				if (cb) then
					IsTrailer = true
					SpawnModel = GetHashKey("TR3")
				end
			end)

			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 2", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 2")
				end
			end)

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Utility Vehicles Spawn Menu
	local vehicles = {"AIRTUG", "CADDY", "CADDY2", "CADDY3", "DOCKTUG", "MOWER", "RIPLEY", "SADLER", "SADLER2", "SCRAP",
					  "TOWTRUCK", "TOWTRUCK2", "TRACTOR", "TRACTOR2", "TRACTOR3", "UTILLITRUCK", "UTILLITRUCK2", "UTILLITRUCK3"}
	while true do
		if utilitySpawn then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionutilitySpawn
			else
				lastSelectionutilitySpawn = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 1, tablelength(vehicles) do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end
			
			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Vans Spawn Menu						[Multiple Pages]
	local vehicles = {"BISON", "BISON2", "BISON3", "BOBCATXL", "BOXVILLE", "BOXVILLE2", "BOXVILLE3", "BOXVILLE4", "BOXVILLE5", "BURRITO",
					  "BURRITO2", "BURRITO3", "BURRITO4", "BURRITO5", "CAMPER", "GBURRITO", "GBURRITO2", "JOURNEY", "MINIVAN", "MINIVAN2",
					  "MOONBEAM", "MOONBEAM2", "PARADISE", "PONY", "PONY2", "RUMPO", "RUMPO2", "RUMPO3", "SPEEDO", "SPEEDO2", 
					  "SURFER", "SURFER2", "TACO", "YOUGA", "YOUGA2"}
	while true do
		if vanSpawn1 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionvanSpawn1
			else
				lastSelectionvanSpawn1 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					vanSpawn1 = false
					vanSpawn2 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					vanSpawn1 = false
					vanSpawn2 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 1, 20 do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end

			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 1", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 1")
				end
			end)

			TriggerEvent("FMODT:Update")
			
		elseif vanSpawn2 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionvanSpawn2
			else
				lastSelectionvanSpawn2 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					superSpawn2 = false
					vanSpawn2 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					vanSpawn2 = false
					vanSpawn1 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GetLabelText("VEH_CLASS_" .. GetVehicleClassFromName(GetHashKey(vehicles[1]))))

			for i = 21, tablelength(vehicles) do
				TriggerEvent("FMODT:Option", GetLabelText(GetDisplayNameFromVehicleModel(GetHashKey(vehicles[i]))), function(cb)
					if (cb) then
						SpawnModel = GetHashKey(vehicles[i])
					end
				end)
			end

			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 2", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 2")
				end
			end)

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Spawn Vehicle By Name
	while true do
		Citizen.Wait(0)
		if spawnVehicleByName then
			DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "", "", "", "", 25)
			blockinput = true

			while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
				Citizen.Wait(0)
			end
			if UpdateOnscreenKeyboard() ~= 2 then
				local result = GetOnscreenKeyboardResult()
				SpawnModel = GetHashKey(string.upper(result))
				Citizen.Wait(500)
			else
				drawNotification("~r~" .. SpawningByNameAborted .. "!")
				Citizen.Wait(500)
			end
			blockinput = false
			spawnVehicleByName = false
		end
	end
end)

Citizen.CreateThread(function() --Vehicle Spawning
	while true do
		Citizen.Wait(0)
		local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
		if SpawnModel then
			if IsModelValid(SpawnModel) then
				if autodelete and not IsTrailer then
					if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
						SetEntityAsMissionEntity(Object, 1, 1)
						SetEntityAsMissionEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, 1)
						DeleteEntity(Object)
						DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1), false))
					end
				end
				blockinput = true
				RequestModel(SpawnModel)
				while not HasModelLoaded(SpawnModel) do
					Citizen.Wait(0)
				end
				local veh = CreateVehicle(SpawnModel, x, y, z + 1, GetEntityHeading(GetPlayerPed(-1)), true, true)
				SetPedIntoVehicle(GetPlayerPed(-1), veh, -1)
				if despawnable then
					SetEntityAsNoLongerNeeded(veh)
				else
					SetVehicleHasBeenOwnedByPlayer(veh, true)
				end
				
				if mapblip then
					local vehBlip = AddBlipForEntity(veh)
					SetBlipColour(vehBlip, 3)
				end
				SetVehicleModKit(veh, 0)
				SetModelAsNoLongerNeeded(SpawnModel)
				blockinput = false
			else
				drawNotification("~r~" .. InvalidModel .. "!")
			end
			if IsTrailer then
				IsTrailer = false
			end
			SpawnModel = nil
		end
	end
end)

Citizen.CreateThread(function() --Fancy Vehicle Spawning
	while true do
		Citizen.Wait(0)
		local playerPedPos = GetEntityCoords(GetPlayerPed(-1), true)
		local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))

		if AttachedVehicles then --Attached Vehicles
			local model = GetHashKey(AtachVehicle1)
			RequestModel(model)
			while not HasModelLoaded(model) do
				Citizen.Wait(0)
			end
			local veh = CreateVehicle(model, playerPedPos.x + 5.0, playerPedPos.y + 5.0, playerPedPos.z + 5.0, GetEntityHeading(GetPlayerPed(-1)), true, true)
			SetModelAsNoLongerNeeded(model)
			SetEntityVisible(veh, false, 0)
			DetachVehicleWindscreen(veh)
			SpawnModel = GetHashKey(AtachVehicle2)
			Citizen.Wait(250)
			AttachEntityToEntity(veh, GetVehiclePedIsIn(GetPlayerPed(-1), false), -1, AttachX, AttachY, AttachZ, 0.0, 0.0, 0.0, true, true, true, true, 1, true)
			SetEntityInvincible(veh, true)
			SetVehicleExplodesOnHighExplosionDamage(veh, false)
			SetEntityVisible(veh, true, 0)
			AttachedVehicles = false
		elseif acufo then --UFO (Alien Camp)
			if GetVehiclePedIsIn(GetPlayerPed(-1), false) ~= 0 then
				SetEntityAsMissionEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, 1)
				DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1), false))
			end
			SetEntityAsMissionEntity(Object, 1, 1)
			DeleteEntity(Object)

			local coords = GetEntityCoords(GetPlayerPed(-1), true)
			SetEntityCoords(GetPlayerPed(-1), 2490.4, 3774.8, 2414.0)
			
			RequestModel(GetHashKey("imp_prop_ship_01a"))
			while not HasModelLoaded(GetHashKey("imp_prop_ship_01a")) do
				Citizen.Wait(0)
			end
			SetEntityCoords(GetPlayerPed(-1), coords)
			Object = CreateObject(GetHashKey("imp_prop_ship_01a"), 2490.4, 3774.8, 2414.0, true, true, true)
			SetModelAsNoLongerNeeded(GetHashKey("imp_prop_ship_01a"))
			RequestModel(GetHashKey("SKYLIFT"))
			while not HasModelLoaded(GetHashKey("SKYLIFT")) do
				Citizen.Wait(0)
			end
			local veh = CreateVehicle(GetHashKey("SKYLIFT"), playerPedPos.x, playerPedPos.y, playerPedPos.z + 1, GetEntityHeading(GetPlayerPed(-1)), true, true)
			SetModelAsNoLongerNeeded(GetHashKey("SKYLIFT"))
			SetPedIntoVehicle(GetPlayerPed(-1), veh, -1)
			SetEntityAsNoLongerNeeded(veh)
			AttachEntityToEntity(Object, veh, 0, 0.0, -4.0, 2.5, 0.0, 0.0, 0.0, true, true, true, false, 1, true)
			SetEntityNoCollisionEntity(veh, Object, false)
			SetEntityCollision(Object, true, true)
			acufo = false
		elseif damufo then --UFO (Damaged)
			if GetVehiclePedIsIn(GetPlayerPed(-1), false) ~= 0 then
				local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
				SetEntityAsMissionEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, 1)
				DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1), false))
			end
			SetEntityAsMissionEntity(Object, 1, 1)
			DeleteEntity(Object)

			RequestModel(GetHashKey("gr_prop_damship_01a"))
			while not HasModelLoaded(GetHashKey("gr_prop_damship_01a")) do
				Citizen.Wait(0)
			end
			Object = CreateObject(GetHashKey("gr_prop_damship_01a"), playerPedPos.x, playerPedPos.y, playerPedPos.z, true, true, true)
			SetModelAsNoLongerNeeded(GetHashKey("gr_prop_damship_01a"))
			RequestModel(GetHashKey("SKYLIFT"))
			while not HasModelLoaded(GetHashKey("SKYLIFT")) do
				Citizen.Wait(0)
			end
			local veh = CreateVehicle(GetHashKey("SKYLIFT"), playerPedPos.x, playerPedPos.y, playerPedPos.z + 1, GetEntityHeading(GetPlayerPed(-1)), true, true)
			SetModelAsNoLongerNeeded(GetHashKey("SKYLIFT"))
			SetPedIntoVehicle(GetPlayerPed(-1), veh, -1)
			SetEntityAsNoLongerNeeded(veh)
			AttachEntityToEntity(Object, veh, 0, 0.0, -4.0, 2.5, 0.0, 0.0, 0.0, true, true, true, false, 1, true)
			SetEntityNoCollisionEntity(veh, Object, false)
			SetEntityCollision(Object, true, true)
			damufo = false
		elseif fzufo then --UFO (Fort Zancudo)
			if GetVehiclePedIsIn(GetPlayerPed(-1), false) ~= 0 then
				SetEntityAsMissionEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, 1)
				DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1), false))
			end
			SetEntityAsMissionEntity(Object, 1, 1)
			DeleteEntity(Object)

			local coords = GetEntityCoords(GetPlayerPed(-1), true)
			SetEntityCoords(GetPlayerPed(-1), -2051.9, 3237.0, 1456.9)
			RequestModel(GetHashKey("dt1_tc_dufo_core"))
			while not HasModelLoaded(GetHashKey("dt1_tc_dufo_core")) do
				Citizen.Wait(0)
			end
			SetEntityCoords(GetPlayerPed(-1), coords)
			Object = CreateObject(GetHashKey("dt1_tc_dufo_core"), -2051.9, 3237.0, 1456.9, true, true, true)
			SetModelAsNoLongerNeeded(Object)
			SetModelAsNoLongerNeeded(GetHashKey("dt1_tc_dufo_core"))
			RequestModel(GetHashKey("SKYLIFT"))
			while not HasModelLoaded(GetHashKey("SKYLIFT")) do
				Citizen.Wait(0)
			end
			local veh = CreateVehicle(GetHashKey("SKYLIFT"), playerPedPos.x, playerPedPos.y, playerPedPos.z + 1, GetEntityHeading(GetPlayerPed(-1)), true, true)
			SetModelAsNoLongerNeeded(GetHashKey("SKYLIFT"))
			SetPedIntoVehicle(GetPlayerPed(-1), veh, -1)
			SetEntityAsNoLongerNeeded(veh)
			AttachEntityToEntity(Object, veh, 0, 0.0, -4.0, 4.0, 0.0, 0.0, 0.0, true, true, true, false, 1, true)
			SetEntityNoCollisionEntity(veh, Object, false)
			SetEntityCollision(Object, true, true)
			fzufo = false
		end
	end
end)
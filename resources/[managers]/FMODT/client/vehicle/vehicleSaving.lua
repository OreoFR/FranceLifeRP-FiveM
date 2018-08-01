local SaveVehicle, UnsaveVehicle
local GetNamesAtFirst = true; CurrentLoadedVehicle = nil
VehicleNames = {NoSavedVehiclesName, NoSavedVehiclesName, NoSavedVehiclesName, NoSavedVehiclesName, NoSavedVehiclesName,
			    NoSavedVehiclesName, NoSavedVehiclesName, NoSavedVehiclesName, NoSavedVehiclesName, NoSavedVehiclesName,
			    NoSavedVehiclesName, NoSavedVehiclesName, NoSavedVehiclesName, NoSavedVehiclesName, NoSavedVehiclesName,
			    NoSavedVehiclesName, NoSavedVehiclesName, NoSavedVehiclesName, NoSavedVehiclesName, NoSavedVehiclesName}

CreateThread(function() --Vehicles Menu								[Multiple Pages]
	while true do
		Citizen.Wait(0)
		
		if (vehicleSavedMenu) then
		
			TriggerServerEvent("GetVehicleNames")
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionVehicleSavedMenu
			else
				lastSelectionVehicleSavedMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. SavedVehiclesTitle .. "")

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. SaveVehiclesTitle .. "", function(cb)
				if (cb) then
					vehicleSavedMenu = false
					vehicleSaveMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. LoadVehiclesTitle .. "", function(cb)
				if (cb) then
					vehicleSavedMenu = false
					vehicleLoadMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. UnsaveVehiclesTitle .. "", function(cb)
				if (cb) then
					vehicleSavedMenu = false
					vehicleUnsaveMenu = true
				end
			end)

			TriggerEvent("FMODT:Update")
			
		elseif (vehicleSaveMenu) then
	
			TriggerServerEvent("GetVehicleNames")
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionVehicleSaveMenu
			else
				lastSelectionVehicleSaveMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. SaveVehiclesTitle .. "")

			for i = 1, 20 do
				TriggerEvent("FMODT:Option", i .. ". " .. VehicleNames[i], function(cb)
					if (cb) then
						VehicleID = currentOption
						SaveVehicle = true
					end
				end)
			end

			TriggerEvent("FMODT:Update")
			
		elseif (vehicleLoadMenu) then
	
			TriggerServerEvent("GetVehicleNames")
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionVehicleLoadMenu
			else
				lastSelectionVehicleLoadMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. LoadVehiclesTitle .. "")

			for i = 1, 20 do
				TriggerEvent("FMODT:Option", i .. ". " .. VehicleNames[i], function(cb)
					if (cb) then
						if VehicleNames[currentOption] ~= NoSavedVehiclesName then
							TriggerServerEvent("VehicleLoad", currentOption)
							drawNotification("~g~" .. VehicleMessage .. " ~y~" .. VehicleNames[currentOption] .. " - ~g~" .. VehicleLoadedMessage .. "!")
						else
							drawNotification("~r~" .. VehicleMessage .. " " .. currentOption .. " - " .. NotExisting .. "!")
						end
					end
				end)
			end

			TriggerEvent("FMODT:Update")
			
		elseif (vehicleUnsaveMenu) then
	
			TriggerServerEvent("GetVehicleNames")
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionvehicleUnsaveMenu
			else
				lastSelectionvehicleUnsaveMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. UnsaveVehiclesTitle .. "")
			
			for i = 1, 20 do
				TriggerEvent("FMODT:Option", i .. ". " .. VehicleNames[i], function(cb)
					if (cb) then
						UnsaveVehicle = true
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end
	end
end)

CreateThread(function() --Vehicle Saving
	local Aborted = false
	while true do
		Citizen.Wait(0)
		--Basic Vehicle Infos
			local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
			local VehicleModel = GetEntityModel(playerVeh)
			local VehicleNameLabel = GetDisplayNameFromVehicleModel(VehicleModel)
			local VehicleName = GetLabelText(VehicleNameLabel)
			
		--Vehicle Color
			local primaryType, primaryColor, unusedINT = GetVehicleModColor_1(playerVeh)
			local secondaryType, secondaryColor = GetVehicleModColor_2(playerVeh)
			local pearlescentColor, wheelColor = GetVehicleExtraColours(playerVeh)
			local tyreSmokeR, tyreSmokeG, tyreSmokeB = GetVehicleTyreSmokeColor(playerVeh)
			local isPrimaryCustom = GetIsVehiclePrimaryColourCustom(playerVeh)
			local isSecondaryCustom = GetIsVehicleSecondaryColourCustom(playerVeh)
			local primaryCustomR, primaryCustomG, primaryCustomB = GetVehicleCustomPrimaryColour(playerVeh)
			local secondaryCustomR, secondaryCustomG, secondaryCustomB = GetVehicleCustomSecondaryColour(playerVeh)

		--Vehicle Wheels
			local wheelType = GetVehicleWheelType(playerVeh)
			local frontTyre = GetVehicleMod(playerVeh, 23)
			local backTyre = GetVehicleMod(playerVeh, 24)
			local bulletProof = not GetVehicleTyresCanBurst(playerVeh)
			local tyreSmoke = IsToggleModOn(playerVeh, 20)

		--Vehicle Toggles
			local turbo = IsToggleModOn(playerVeh, 18)
			local xenon = IsToggleModOn(playerVeh, 22)
			
		--Vehicle Tuning Parts (LSC)
			local windowTint = GetVehicleWindowTint(playerVeh)
			local armor = GetVehicleMod(playerVeh, 16)
			local brakes = GetVehicleMod(playerVeh, 12)
			local engine = GetVehicleMod(playerVeh, 11)
			local suspension = GetVehicleMod(playerVeh, 15)
			local transmission = GetVehicleMod(playerVeh, 13)
			local frontBumper = GetVehicleMod(playerVeh, 1)
			local rearBumper = GetVehicleMod(playerVeh, 2)
			local chassis = GetVehicleMod(playerVeh, 5)
			local exhaust = GetVehicleMod(playerVeh, 4)
			local frontFender = GetVehicleMod(playerVeh, 8)
			local rearFender = GetVehicleMod(playerVeh, 9)
			local grille = GetVehicleMod(playerVeh, 6)
			local hood = GetVehicleMod(playerVeh, 7)
			local horn = GetVehicleMod(playerVeh, 14)
			local plate = GetVehicleNumberPlateTextIndex(playerVeh)
			local plateText = GetVehicleNumberPlateText(playerVeh)
			local roof = GetVehicleMod(playerVeh, 10)
			local sideSkirt = GetVehicleMod(playerVeh, 3)
			local spoiler = GetVehicleMod(playerVeh, 0)
			
		--Vehicle Tuning Parts (BM)
			local airFilter = GetVehicleMod(playerVeh, 40)
			local archCover = GetVehicleMod(playerVeh, 42)
			local bonnetPins = GetVehicleMod(playerVeh, 43)
			local canards = GetVehicleMod(playerVeh, 26)
			local dashboard = GetVehicleMod(playerVeh, 29)
			local dialDesing = GetVehicleMod(playerVeh, 30)
			local door = GetVehicleMod(playerVeh, 31)
			local engineBlock = GetVehicleMod(playerVeh, 39)
			local hydraulics = GetVehicleMod(playerVeh, 38)
			local ornaments = GetVehicleMod(playerVeh, 28)
			local plaques = GetVehicleMod(playerVeh, 35)
			local plateHolder = GetVehicleMod(playerVeh, 25)
			local seats = GetVehicleMod(playerVeh, 32)
			local shiftLever = GetVehicleMod(playerVeh, 34)
			local speakers = GetVehicleMod(playerVeh, 36)
			local steeringWheel = GetVehicleMod(playerVeh, 33)
			local struts = GetVehicleMod(playerVeh, 41)
			local tank = GetVehicleMod(playerVeh, 45)
			local trim = GetVehicleMod(playerVeh, 44)
			local trimDesign = GetVehicleMod(playerVeh, 27)
			local trunk = GetVehicleMod(playerVeh, 37)
			
		--Vehicle Neons
			local leftNeon = IsVehicleNeonLightEnabled(playerVeh, 0)
			local rightNeon = IsVehicleNeonLightEnabled(playerVeh, 1)
			local frontNeon = IsVehicleNeonLightEnabled(playerVeh, 2)
			local backNeon = IsVehicleNeonLightEnabled(playerVeh, 3)
			local RNeon, GNeon, BNeon = GetVehicleNeonLightsColour(playerVeh)
			
		--Vehicle Livery
			local liveryFirst = GetVehicleMod(playerVeh, 48)
			local liverySecond = GetVehicleLivery(playerVeh)
			
		--Vehicle Extras
			local Extras = {}
			
			for i = 1, 14 do
				if (IsVehicleExtraTurnedOn(playerVeh, i) == 1) then
					Extras[i] = true
				else
					Extras[i] = false
				end
			end
			

		if SaveVehicle then
			if (VehicleNames[currentOption] ~= NoSavedVehiclesName) then
				DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", VehicleNames[currentOption], "", "", "", 25)
			else
				DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", VehicleName, "", "", "", 25)
			end
			blockinput = true

			while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
				Citizen.Wait(0)
			end

			if UpdateOnscreenKeyboard() ~= 2 then
				VehicleName = GetOnscreenKeyboardResult()
				Citizen.Wait(500)
				if VehicleName == NoSavedVehiclesName then
					drawNotification("~r~" .. VehicleSavingAbortion .. "!")
				else
					if VehicleName == "" then
						VehicleName = GetLabelText(VehicleNameLabel)
					end
					TriggerServerEvent("VehicleSave", currentOption, VehicleName, VehicleModel, primaryType, vehiclecol[1], secondaryType, vehiclecol[2],
													  extracol[1], extracol[2], tyreSmokeR, tyreSmokeG, tyreSmokeB, wheelType, frontTyre, backTyre,
													  bulletProof, tyreSmoke, turbo, xenon, windowTint, armor, brakes, engine, suspension, transmission,
													  frontBumper, rearBumper, chassis, exhaust, frontFender, rearFender, grille, hood, horn, leftNeon,
													  rightNeon, frontNeon, backNeon, RNeon, GNeon, BNeon, plate, plateText, roof, sideSkirt, spoiler,
													  airFilter, archCover, bonnetPins, canards, dashboard, dialDesing, door, engineBlock, hydraulics,
													  ornaments, plaques, plateHolder, seats, shiftLever, speakers, steeringWheel, struts, tank, trim,
													  trimDesign, trunk, isPrimaryCustom, isSecondaryCustom, primaryCustomR, primaryCustomG, primaryCustomB,
													  secondaryCustomR, secondaryCustomG, secondaryCustomB, liveryFirst, liverySecond, Extras[1], Extras[2],
													  Extras[3], Extras[4], Extras[5], Extras[6], Extras[7], Extras[8], Extras[9], Extras[10], Extras[11],
													  Extras[12], Extras[13], Extras[14])
					drawNotification("~g~" .. VehicleMessage .. " ~y~" .. VehicleName .. " - ~g~" .. VehicleSavedMessage .. "!")
				end
				Citizen.Wait(500)
			else
				drawNotification("~r~" .. VehicleSavingAbortion .. "!")
				Aborted = true
				Citizen.Wait(500)
			end
			
			if not Aborted then
				if CurrentLoadedVehicle ~= nil and CurrentLoadedVehicle ~= playerVeh then
					SetEntityAsMissionEntity(CurrentLoadedVehicle, true, true)
					DeleteEntity(CurrentLoadedVehicle)

					CurrentLoadedVehicle = playerVeh

					SetVehicleHasBeenOwnedByPlayer(playerVeh, true)
				else
					CurrentLoadedVehicle = playerVeh
					
					SetVehicleHasBeenOwnedByPlayer(playerVeh, true)
				end
			end
			Aborted = false

			blockinput = false
			SaveVehicle = false
		end
	end
end)

CreateThread(function() --Vehicle Unsaving
	while true do
		Citizen.Wait(0)
		if UnsaveVehicle then
			if VehicleNames[currentOption] ~= NoSavedVehiclesName then
				DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", VehicleUnsaveConfirmation, "", "", "", 36)
				blockinput = true

				while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
					Citizen.Wait(0)
				end

				if UpdateOnscreenKeyboard() ~= 2 then
					result = GetOnscreenKeyboardResult()
					Citizen.Wait(500)
					if result:lower() == (VehicleUnsaveWord or "'" .. VehicleUnsaveWord .. "'") then
						drawNotification("~g~" .. VehicleMessage .. " ~y~" .. VehicleNames[currentOption] .. " ~g~" .. VehicleUnsavedMessage .. "!")
						TriggerServerEvent("VehicleUnsave", currentOption)
					else
						drawNotification("~r~" .. VehicleUnsavingAbortion .. "!")
						Citizen.Wait(500)
					end
				else
					drawNotification("~r~" .. VehicleUnsavingAbortion .. "!")
					Citizen.Wait(500)
				end
				blockinput = false
			else
				drawNotification("~r~" .. VehicleMessage .. " " .. currentOption .. " - " .. NotExisting .. "!")
			end
			UnsaveVehicle = false
		end
	end
end)

CreateThread(function() --Gets Vehicle Names Once
	while true do
		Citizen.Wait(0)
		if GetNamesAtFirst then
			TriggerServerEvent("GetVehicleNames")
			GetNamesAtFirst = false
		end
	end
end)		
		
CreateThread(function() --Change Current Loaded Vehicle Blip
	while true do
		Citizen.Wait(0)
		local vehClass = GetVehicleClass(CurrentLoadedVehicle)
		local vehModel = GetEntityModel(CurrentLoadedVehicle)
		local CLVBlipSprite, CLVBlip

		if CurrentLoadedVehicle ~= nil then
			if GetVehiclePedIsIn(GetPlayerPed(-1), false) == CurrentLoadedVehicle then
				CLVBlip = GetBlipFromEntity(CurrentLoadedVehicle)
				if DoesBlipExist(CLVBlip) then
					RemoveBlip(CLVBlip)
				end
			else
				CLVBlip = GetBlipFromEntity(CurrentLoadedVehicle)
				
				if not DoesBlipExist(CLVBlip) then
					CLVBlip = AddBlipForEntity(CurrentLoadedVehicle)
				end

				if vehClass == 15 then -- Helicopters
					CLVBlipSprite = 422
				elseif vehClass == 8 then -- Motorcycles
					CLVBlipSprite = 226
				elseif vehClass == 16 then -- Plane
					if vehModel == GetHashKey("besra") or vehModel == GetHashKey("hydra") or vehModel == GetHashKey("lazer") then -- Jets
						CLVBlipSprite = 424
					else
						CLVBlipSprite = 423
					end
				elseif vehClass == 14 then -- Boat
					CLVBlipSprite = 427
				elseif vehModel == GetHashKey("insurgent") or vehModel == GetHashKey("insurgent2") or vehModel == GetHashKey("insurgent3") then -- Insurgent, Insurgent Pickup & Insurgent Pickup Custom
					CLVBlipSprite = 426
				elseif vehModel == GetHashKey("limo2") then -- Turreted Limo
					CLVBlipSprite = 460
				elseif vehModel == GetHashKey("rhino") then -- Tank
					CLVBlipSprite = 421
				elseif vehModel == GetHashKey("trash") or vehModel == GetHashKey("trash2") then -- Trash
					CLVBlipSprite = 318
				elseif vehModel == GetHashKey("pbus") then -- Prison Bus
					CLVBlipSprite = 513
				elseif vehModel == GetHashKey("seashark") or vehModel == GetHashKey("seashark2") or vehModel == GetHashKey("seashark3") then -- Speedophiles
					CLVBlipSprite = 471
				elseif vehModel == GetHashKey("cargobob") or vehModel == GetHashKey("cargobob2") or vehModel == GetHashKey("cargobob3") or vehModel == GetHashKey("cargobob4") then -- Cargobobs
					CLVBlipSprite = 481
				elseif vehModel == GetHashKey("technical") or vehModel == GetHashKey("technical2") or vehModel == GetHashKey("technical3") then -- Technical
					CLVBlipSprite = 426
				elseif vehModel == GetHashKey("taxi") then -- Cab/ Taxi
					CLVBlipSprite = 198
				elseif vehModel == GetHashKey("fbi") or vehModel == GetHashKey("fbi2") or vehModel == GetHashKey("police2") or vehModel == GetHashKey("police3") -- Police Vehicles
					or vehModel == GetHashKey("police") or vehModel == GetHashKey("sheriff2") or vehModel == GetHashKey("sheriff")
					or vehModel == GetHashKey("policeold2") or vehModel == GetHashKey("policeold1") then
					CLVBlipSprite = 56
				else
					CLVBlipSprite = 225
				end
				
				SetBlipSprite(CLVBlip, CLVBlipSprite)
			end
		end
	end
end)		

AddEventHandler("SpawnSavedVehicle", function(VehicleModel, primaryType, primaryColor, secondaryType, secondaryColor, --Just Don't Edit!
											  pearlescentColor, wheelColor, tyreSmokeR, tyreSmokeG, tyreSmokeB, wheelType,
											  frontTyre, backTyre, bulletProof, tyreSmoke, turbo, xenon, windowTint, armor,
											  brakes, engine, suspension, transmission, frontBumper, rearBumper, chassis,
											  exhaust, frontFender, rearFender, grille, hood, horn, leftNeon, rightNeon,
											  frontNeon, backNeon, RNeon, GNeon, BNeon, plate, plateText, roof, sideSkirt,
											  spoiler, airFilter, archCover, bonnetPins, canards, dashboard, dialDesing,
											  door, engineBlock, hydraulics, ornaments, plaques, plateHolder, seats,
											  shiftLever, speakers, steeringWheel, struts, tank, trim, trimDesign, trunk,
											  isPrimaryCustom, isSecondaryCustom, primaryCustomR, primaryCustomG, primaryCustomB,
											  secondaryCustomR, secondaryCustomG, secondaryCustomB, liveryFirst, liverySecond,
											  Extras1, Extras2, Extras3, Extras4, Extras5, Extras6, Extras7, Extras8, Extras9,
											  Extras10, Extras11, Extras12, Extras13, Extras14)
	blockinput = true
	
	-- Vehicle Spawning
		local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true)) 
		local FoundNode, TeleportPos, Heading = GetClosestVehicleNodeWithHeading(x, y, z, 1, 3.0, 0)
		
		if not HasModelLoaded(tonumber(VehicleModel)) then
			RequestModel(tonumber(VehicleModel))
			while not HasModelLoaded(tonumber(VehicleModel)) do
				Citizen.Wait(0)
			end
		end

		if CurrentLoadedVehicle == nil then
			CurrentLoadedVehicle = CreateVehicle(tonumber(VehicleModel), TeleportPos.x, TeleportPos.y, TeleportPos.z, Heading, true, true)
			SetVehicleHasBeenOwnedByPlayer(CurrentLoadedVehicle, true)
			SetVehicleFixed(CurrentLoadedVehicle)
			SetVehicleDirtLevel(CurrentLoadedVehicle, 0.0)
			SetVehicleLights(CurrentLoadedVehicle, 0)
			SetVehicleBurnout(CurrentLoadedVehicle, false)
			Citizen.InvokeNative(0x1FD09E7390A74D54, CurrentLoadedVehicle, 0)
		else
			if GetEntityModel(CurrentLoadedVehicle) == tonumber(VehicleModel) then
				SetVehicleFixed(CurrentLoadedVehicle)
				SetVehicleDirtLevel(CurrentLoadedVehicle, 0.0)
				SetVehicleLights(CurrentLoadedVehicle, 0)
				SetVehicleBurnout(CurrentLoadedVehicle, false)
				Citizen.InvokeNative(0x1FD09E7390A74D54, CurrentLoadedVehicle, 0)
				SetEntityHeading(CurrentLoadedVehicle, Heading)
				SetEntityCoords(CurrentLoadedVehicle, TeleportPos.x, TeleportPos.y, TeleportPos.z, false, false, false, true)
				SetVehicleOnGroundProperly(CurrentLoadedVehicle)
			else
				SetVehicleHasBeenOwnedByPlayer(CurrentLoadedVehicle, false)
				SetEntityAsMissionEntity(CurrentLoadedVehicle, true, true)
				DeleteEntity(CurrentLoadedVehicle)
				CurrentLoadedVehicle = CreateVehicle(tonumber(VehicleModel), TeleportPos.x, TeleportPos.y, TeleportPos.z, Heading, true, true)
				SetVehicleHasBeenOwnedByPlayer(CurrentLoadedVehicle, true)
				SetVehicleOnGroundProperly(CurrentLoadedVehicle)
			end
		end
		
		SetVehicleModKit(CurrentLoadedVehicle, 0) --Making Tuning Possible
		
		SetModelAsNoLongerNeeded(tonumber(VehicleModel)) --Removing The Model From The Memory
	
	--Applying Vehicle Wheels
		SetVehicleWheelType(CurrentLoadedVehicle, tonumber(wheelType)) --Wheel Type
		SetVehicleMod(CurrentLoadedVehicle, 23, tonumber(frontTyre), true) --Front Tyre
		SetVehicleMod(CurrentLoadedVehicle, 24, tonumber(backTyre), true) --Back Tyre
		SetVehicleTyresCanBurst(CurrentLoadedVehicle, tobool(bulletProof)) --Bullet Proof Tyres
		ToggleVehicleMod(CurrentLoadedVehicle, 20, tobool(tyreSmoke)) --Tyre Smoke
		SetVehicleTyreSmokeColor(CurrentLoadedVehicle, tonumber(tyreSmokeR), tonumber(tyreSmokeG), tonumber(tyreSmokeB)) --Tyre Smoke Color
		
	--Applying Vehicle Colors
		ClearVehicleCustomPrimaryColour(CurrentLoadedVehicle) --Vehicle Primary Color
		ClearVehicleCustomSecondaryColour(CurrentLoadedVehicle) --Vehicle Secondary Color
		SetVehicleModColor_1(CurrentLoadedVehicle, tonumber(primaryType), tonumber(primaryColor), 0) --Vehicle Primary Color Type
		SetVehicleModColor_2(CurrentLoadedVehicle, tonumber(secondaryType), tonumber(secondaryColor)) --Vehicle Secondary Color Type
		SetVehicleColours(CurrentLoadedVehicle, tonumber(primaryColor), tonumber(secondaryColor)) --Vehicle Primary & Secondary Color
		if tobool(isPrimaryCustom) then
			SetVehicleCustomPrimaryColour(CurrentLoadedVehicle, tonumber(primaryCustomR), tonumber(primaryCustomG), tonumber(primaryCustomB))
		end
		if tobool(isSecondaryCustom) then
			SetVehicleCustomSecondaryColour(CurrentLoadedVehicle, tonumber(secondaryCustomR), tonumber(secondaryCustomG), tonumber(secondaryCustomB))
		end
		SetVehicleExtraColours(CurrentLoadedVehicle, tonumber(pearlescentColor), tonumber(wheelColor)) --Pearlescent & Rims Color
		
	--Applying Vehicle Livery
		SetVehicleMod(CurrentLoadedVehicle, 48, tonumber(liveryFirst), true)
		SetVehicleLivery(CurrentLoadedVehicle, tonumber(liverySecond))
		
	--Applying Vehicle Toggle
		ToggleVehicleMod(CurrentLoadedVehicle, 18, tobool(turbo)) --Turbo
		ToggleVehicleMod(CurrentLoadedVehicle, 22, tobool(xenon)) --Xenon
		
	--Applying Vehicle Tuning
		--LSC:
		SetVehicleMod(CurrentLoadedVehicle, 16, tonumber(armor), true) --Armor
		SetVehicleMod(CurrentLoadedVehicle, 12, tonumber(brakes), true) --Brakes
		SetVehicleMod(CurrentLoadedVehicle, 11, tonumber(engine), true) --Engine
		SetVehicleMod(CurrentLoadedVehicle, 15, tonumber(suspension), true) --Suspension
		SetVehicleMod(CurrentLoadedVehicle, 13, tonumber(transmission), true) --Transmission
		SetVehicleMod(CurrentLoadedVehicle, 1, tonumber(frontBumper), true) --Front Bumper
		SetVehicleMod(CurrentLoadedVehicle, 2, tonumber(rearBumper), true) --Rear Bumper
		SetVehicleMod(CurrentLoadedVehicle, 5, tonumber(chassis), true) --Chassis
		SetVehicleMod(CurrentLoadedVehicle, 4, tonumber(exhaust), true) --Exhaust
		SetVehicleMod(CurrentLoadedVehicle, 8, tonumber(frontFender), true) --Front Fender
		SetVehicleMod(CurrentLoadedVehicle, 9, tonumber(rearFender), true) --Rear Fender
		SetVehicleMod(CurrentLoadedVehicle, 6, tonumber(grille), true) --Grille
		SetVehicleMod(CurrentLoadedVehicle, 7, tonumber(hood), true) --Hood
		SetVehicleMod(CurrentLoadedVehicle, 14, tonumber(horn), true) --Horn
		SetVehicleMod(CurrentLoadedVehicle, 10, tonumber(roof), true) --Roof
		SetVehicleMod(CurrentLoadedVehicle, 3, tonumber(sideSkirt), true) --Side Skirt
		SetVehicleMod(CurrentLoadedVehicle, 0, tonumber(spoiler), true) --Spoiler
		SetVehicleWindowTint(CurrentLoadedVehicle, tonumber(windowTint)) --Window Tint
		--BM:
		SetVehicleMod(CurrentLoadedVehicle, 40, tonumber(airFilter), true) --Air Filter
		SetVehicleMod(CurrentLoadedVehicle, 42, tonumber(archCover), true) --Arch Cover
		SetVehicleMod(CurrentLoadedVehicle, 43, tonumber(bonnetPins), true) --Bonnet Pins
		SetVehicleMod(CurrentLoadedVehicle, 26, tonumber(canards), true) --Canards/Vanity Plates
		SetVehicleMod(CurrentLoadedVehicle, 29, tonumber(dashboard), true) --Dashboard
		SetVehicleMod(CurrentLoadedVehicle, 30, tonumber(dialDesing), true) --Dial Design
		SetVehicleMod(CurrentLoadedVehicle, 31, tonumber(door), true) --Door Speaker
		SetVehicleMod(CurrentLoadedVehicle, 39, tonumber(engineBlock), true) --Engine Block
		SetVehicleMod(CurrentLoadedVehicle, 38, tonumber(hydraulics), true) --Hydraulics
		SetVehicleMod(CurrentLoadedVehicle, 28, tonumber(ornaments), true) --Ornaments
		SetVehicleMod(CurrentLoadedVehicle, 35, tonumber(plaques), true) --Plaques
		SetVehicleMod(CurrentLoadedVehicle, 25, tonumber(plateHolder), true) --Plate Holder
		SetVehicleMod(CurrentLoadedVehicle, 32, tonumber(seats), true) --Seats
		SetVehicleMod(CurrentLoadedVehicle, 34, tonumber(shiftLever), true) --Shift Lever
		SetVehicleMod(CurrentLoadedVehicle, 36, tonumber(speakers), true) --Speakers
		SetVehicleMod(CurrentLoadedVehicle, 33, tonumber(steeringWheel), true) --Steering Wheel
		SetVehicleMod(CurrentLoadedVehicle, 41, tonumber(struts), true) --Struts
		SetVehicleMod(CurrentLoadedVehicle, 45, tonumber(tank), true) --Tank
		SetVehicleMod(CurrentLoadedVehicle, 44, tonumber(trim), true) --Trim
		SetVehicleMod(CurrentLoadedVehicle, 27, tonumber(trimDesign), true) --Trim Design
		SetVehicleMod(CurrentLoadedVehicle, 37, tonumber(trunk), true) --Trunk
		
	--Applying Vehicle Neon State & Color
		SetVehicleNeonLightEnabled(CurrentLoadedVehicle, 0, tobool(leftNeon)) --Neon Left
		SetVehicleNeonLightEnabled(CurrentLoadedVehicle, 1, tobool(rightNeon)) --Neon Right
		SetVehicleNeonLightEnabled(CurrentLoadedVehicle, 2, tobool(frontNeon)) --Neon Front
		SetVehicleNeonLightEnabled(CurrentLoadedVehicle, 3, tobool(backNeon)) --Neon Back
		SetVehicleNeonLightsColour(CurrentLoadedVehicle, tonumber(RNeon), tonumber(GNeon), tonumber(BNeon)) --Neon RGB

	--Applying Vehicle Plate & Plate Text
		SetVehicleNumberPlateTextIndex(CurrentLoadedVehicle, tonumber(plate)) --Plate
		SetVehicleNumberPlateText(CurrentLoadedVehicle, plateText) --Plate Text
		
	--Applying Vehicle Extras
		SetVehicleExtra(CurrentLoadedVehicle, 1, not tobool(Extras1))	
		SetVehicleExtra(CurrentLoadedVehicle, 2, not tobool(Extras2))	
		SetVehicleExtra(CurrentLoadedVehicle, 3, not tobool(Extras3))	
		SetVehicleExtra(CurrentLoadedVehicle, 4, not tobool(Extras4))	
		SetVehicleExtra(CurrentLoadedVehicle, 5, not tobool(Extras5))	
		SetVehicleExtra(CurrentLoadedVehicle, 6, not tobool(Extras6))	
		SetVehicleExtra(CurrentLoadedVehicle, 7, not tobool(Extras7))	
		SetVehicleExtra(CurrentLoadedVehicle, 8, not tobool(Extras8))	
		SetVehicleExtra(CurrentLoadedVehicle, 9, not tobool(Extras9))	
		SetVehicleExtra(CurrentLoadedVehicle, 10, not tobool(Extras10))	
		SetVehicleExtra(CurrentLoadedVehicle, 11, not tobool(Extras11))	
		SetVehicleExtra(CurrentLoadedVehicle, 12, not tobool(Extras12))	
		SetVehicleExtra(CurrentLoadedVehicle, 13, not tobool(Extras13))	
		SetVehicleExtra(CurrentLoadedVehicle, 14, not tobool(Extras14))	
	
	blockinput = false
end)

AddEventHandler("GotVehicleNames", function(VehicleName1, VehicleName2, VehicleName3, VehicleName4, VehicleName5, VehicleName6, VehicleName7, VehicleName8, VehicleName9, VehicleName10, --Just Don't Edit!
								            VehicleName11, VehicleName12, VehicleName13, VehicleName14, VehicleName15, VehicleName16, VehicleName17, VehicleName18, VehicleName19, VehicleName20)
	VehicleNames[1] = VehicleName1
	VehicleNames[2] = VehicleName2
	VehicleNames[3] = VehicleName3
	VehicleNames[4] = VehicleName4
	VehicleNames[5] = VehicleName5
	VehicleNames[6] = VehicleName6
	VehicleNames[7] = VehicleName7
	VehicleNames[8] = VehicleName8
	VehicleNames[9] = VehicleName9
	VehicleNames[10] = VehicleName10
	VehicleNames[11] = VehicleName11
	VehicleNames[12] = VehicleName12
	VehicleNames[13] = VehicleName13
	VehicleNames[14] = VehicleName14
	VehicleNames[15] = VehicleName15
	VehicleNames[16] = VehicleName16
	VehicleNames[17] = VehicleName17
	VehicleNames[18] = VehicleName18
	VehicleNames[19] = VehicleName19
	VehicleNames[20] = VehicleName20
end)

AddEventHandler("UnsaveSavedVehicle", function(VehicleModel)
	if GetEntityModel(CurrentLoadedVehicle) == tonumber(VehicleModel) then
		SetVehicleHasBeenOwnedByPlayer(CurrentLoadedVehicle, false)
		SetEntityAsNoLongerNeeded(CurrentLoadedVehicle)
		CurrentLoadedVehicle = nil
	end
end)


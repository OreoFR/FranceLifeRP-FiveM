local AdminStatusChecked = false; InstructionsDraw = false; drawWelcomeMessage = false; firstOpen = true -- JUST DON'T EDIT

AddEventHandler("FMODT:Title", function(title)
	Menu.Title(title)
end)

AddEventHandler("FMODT:Option", function(option, cb)
	cb(Menu.Option(option))
end)

AddEventHandler("FMODT:Bool", function(option, bool, cb)
	Menu.Bool(option, bool, function(data)
		cb(data)
	end)
end)

AddEventHandler("FMODT:Int", function(option, int, min, max, cb)
	Menu.Int(option, int, min, max, function(data)
		cb(data)
	end)
end)

AddEventHandler("FMODT:Float", function(option, float, min, max, step, count, cb)
	Menu.Float(option, float, min, max, step, count, function(data)
		cb(data)
	end)
end)

AddEventHandler("FMODT:StringArray", function(option, array, position, cb)
	Menu.StringArray(option, array, position, function(data)
		cb(data)
	end)
end)

AddEventHandler("FMODT:Update", function()
	Menu.updateSelection()
end)

AddEventHandler("playerSpawned", function(spawn)
	SetNotificationTextEntry("STRING")
	AddTextComponentString("~o~Open the Menu with ~y~F5 ~o~or ~y~RB/ R1 + X/ Square~o~!")
	SetNotificationMessage("CHAR_LESTER_DEATHWISH", "CHAR_LESTER_DEATHWISH", true, 1, "ΩCHEM!CAL T0Ж!NΩ", "v" .. Version .. " ¦")
	DrawNotification(false, true)
end)

AddEventHandler("AdminActivation", function(state) --Just Don't Edit!
	if state == 0 then
		Citizen.Trace("Your Status: No Admin")
	elseif state == 1 then
		Citizen.Trace("Your Status: Admin")
		IsAdmin = true
	end
end)

AddEventHandler("UsesSteam", function() --Just Don't Edit!
	IsUsingSteam = true
end)

Citizen.CreateThread(function() --Menu Closing
	while true do
		Citizen.Wait(0)
		if not MenuOpen then
			blockinput = false
			mainMenu = false
			adminMenu = false
			playerMenu = false
			vehicleMenu = false
			teleportMenu = false
			weaponMenu = false
			worldMenu = false
			miscMenu = false
			settingsMenu = false
			aboutMenu = false
			adminInformations = false
			adminKick = false
			adminBan = false
			adminspectateMenu = false
			adminSpectate = false
			adminTeleport = false
			adminPlayerList1 = false
			adminPlayerList2 = false
			adminMiscMenu = false
			animationMenu = false
			sexactAnimationMenu = false
			stripAnimationMenu = false
			suicideAnimationMenu = false
			skinMenu = false
			componentChangerMenu = false 
			componentChangerSkinMenu = false 
			componentChangerHatsMenu = false 
			componentChangerHeadDataMenu = false
			componentChangerHeadDataSubMenu = false
			componentChangerGlassesMenu = false 
			componentChangerEarPiecesMenu = false 
			componentChangerWatchesMenu = false 
			componentChangerFaceMenu = false 
			componentChangerMasksMenu = false 
			componentChangerHairMenu = false 
			componentChangerUpperBodyMenu = false 
			componentChangerLegsMenu = false 
			componentChangerParachutesMenu = false 
			componentChangerShoesMenu = false 
			componentChangerTiesScarfsetcMenu = false 
			componentChangerUndershirtsMenu = false 
			componentChangerArmorMenu = false 
			componentChangerEmblemesMenu = false 
			componentChangerTopsMenu = false 
			outfitMenu = false 
			outfitSaveMenu = false 
			outfitLoadMenu = false 
			outfitDeleteMenu = false 
			animalSkinMenu1 = false
			animalSkinMenu2 = false
			femalePedSkinMenu = false
			malePedSkinMenu = false
			playerPedSkinMenu = false
			scenarioMenu = false
			maleScenarioMenu = false
			wantedMenu = false
			teleportMenuEntityRelative = false
			OnlinePlayer1 = false
			OnlinePlayer2 = false
			OnlinePlayerToMe = false
			interiorLocation = false
			exteriorLocation = false
			customLocation = false
			bodyguardMenu = false
			radioMenu = false
			speedoMenu = false
			timeMenu = false
			weatherMenu = false
			vehicleweaponsMenu = false
			explosiveBulletMenu = false
			spawnMenu1 = false
			spawnMenu2 = false
			doorsMenu = false
			tuningMenu = false
			fancySpawn = false
			bikeSpawn = false
			boatSpawn = false
			commercialSpawn = false
			compactSpawn = false
			coupeSpawn = false
			emergencySpawn = false
			helicopterSpawn1 = false
			helicopterSpawn2 = false
			industrialSpawn = false
			militarySpawn = false
			motorcycleSpawn1 = false
			motorcycleSpawn2 = false
			motorcycleSpawn3 = false
			muscleSpawn1 = false
			muscleSpawn2 = false
			muscleSpawn3 = false
			offroadSpawn1 = false
			offroadSpawn2 = false
			planeSpawn1 = false
			planeSpawn2 = false
			sedanSpawn1 = false
			sedanSpawn2 = false
			serviceSpawn = false
			sportSpawn1 = false
			sportSpawn2 = false
			sportSpawn3 = false
			sportClassicSpawn1 = false
			sportClassicSpawn2 = false
			superSpawn1 = false
			superSpawn2 = false
			suvSpawn1 = false
			suvSpawn2 = false
			trailerSpawn1 = false
			trailerSpawn2 = false
			utilitySpawn = false
			vanSpawn1 = false
			vanSpawn2 = false
			extraMenu = false
			extraMenuTrailer = false
			lscMenu = false
			lscMenuTrailer = false
			lscArmorMenu = false
			lscBrakesMenu = false
			lscBumperMenu = false
			lscBumperFMenu = false
			lscBumperRMenu = false
			lscColorMenu = false
			lscEngineMenu = false
			lscExhaustMenu = false
			lscFenderAllMenu = false
			lscFenderMenu = false
			lscFenderRMenu = false
			lscFrameMenu = false
			lscGrilleMenu = false
			lscHoodMenu = false
			lscHornMenu = false
			lscHornStockMenu = false
			lscHornMelodyMenu1 = false
			lscHornMelodyMenu2 = false
			lscHornLoopMenu = false
			lscLightMenu = false
			lscLightsNeonMenu = false
			lscPlateMenu = false
			lscRoofMenu = false
			lscSideSkirtMenu = false
			lscSpoilerMenu = false
			lscSuspensionMenu = false
			lscTransmissionMenu = false
			lscWheelMenu = false
			lscWheelAccessoriesMenu = false
			lscWheelTypesMenu = false
			lscWheelTypesHighEndMenu = false
			lscWheelTypesLowriderMenu = false
			lscWheelTypesMuscleMenu = false
			lscWheelTypesOffroadMenu = false
			lscWheelTypesSportMenu1 = false
			lscWheelTypesSportMenu2 = false
			lscWheelTypesSUVMenu = false
			lscWheelTypesTunerMenu1 = false
			lscWheelTypesTunerMenu2 = false
			lscWheelTypesBikeFrontMenu = false
			lscWheelTypesBikeBackMenu = false
			lscColorSelectionMenu = false
			lscColorPearlescentMenu = false
			lscColorRimsMenu = false
			lscColorChromeMenu = false
			lscColorMetalMenu = false
			lscColorMatteMenu = false
			lscColorMetallicMenu1 = false
			lscColorMetallicMenu2 = false
			lscColorMetallicMenu3 = false
			lscColorMetallicMenu4 = false
			lscColorMetallicMenu5 = false
			lscColorLiveryMenuN = false
			lscColorLiveryMenuM = false
			lscColorLiveryTrailerMenu = false
			PrimaryColor = false
			SecondaryColor = false
			PearlescentColor = false
			RimsColor = false
			bmMenu = false
			bmMenuAirFilter = false
			bmMenuArchCover = false
			bmMenuBonnetPins = false
			bmMenuDashboard = false
			bmMenuDials = false
			bmMenuDoor = false
			bmMenuEngineBlock = false
			bmMenuShiftLever = false
			bmMenuHydraulics = false
			bmMenuTrimDesign = false
			bmMenuOrnaments = false
			bmMenuPlaques = false
			bmMenuPlateHolder = false
			bmMenuSeats = false
			bmMenuSpeakers = false
			bmMenuSteeringWheel = false
			bmMenuStruts = false
			bmMenuTank = false
			bmMenuTrim = false
			bmMenuTrunk = false
			bmMenuCanards = false
		end
		if not MenuOpen then
			lastSelectionmainMenu = 1
			lastSelectionadminMenu = 1
			lastSelectionadminSpectateMenu = 1
			lastSelectionadminPlayerList1 = 1
			lastSelectionadminPlayerList2 = 1
			lastSelectionadminMiscMenu = 1
			lastSelectionplayerMenu = 1
			lastSelectionanimationMenu = 1
			lastSelectionsexactAnimationMenu = 1
			lastSelectionstripAnimationMenu = 1
			lastSelectionsuicideAnimationMenu = 1
			lastSelectionskinMenu = 1
			lastSelectionanimalSkinMenu1 = 1
			lastSelectionanimalSkinMenu2 = 1
			lastSelectionfemalePedSkinMenu = 1
			lastSelectionmalePedSkinMenu = 1
			lastSelectionplayerPedSkinMenu = 1
			lastSelectionscenarioMenu = 1
			lastSelectionmaleScenarioMenu = 1
			lastSelectionwantedMenu = 1
			lastSelectioncomponentChangerMenu = 1
			lastSelectioncomponentChangerSkinMenu = 1
			lastSelectioncomponentChangerHeadDataMenu = 1
			lastSelectioncomponentChangerHeadDataSubMenu = 1
			lastSelectioncomponentChangerHatsMenu = 1
			lastSelectioncomponentChangerGlassesMenu = 1
			lastSelectioncomponentChangerEarPiecesMenu = 1
			lastSelectioncomponentChangerWatchesMenu = 1
			lastSelectioncomponentChangerFaceMenu = 1
			lastSelectioncomponentChangerMasksMenu = 1
			lastSelectioncomponentChangerHairMenu = 1
			lastSelectioncomponentChangerUpperBodyMenu = 1
			lastSelectioncomponentChangerLegsMenu = 1
			lastSelectioncomponentChangerParachutesMenu = 1
			lastSelectioncomponentChangerShoesMenu = 1
			lastSelectioncomponentChangerTiesScarfsetcMenu = 1
			lastSelectioncomponentChangerUndershirtsMenu = 1
			lastSelectioncomponentChangerArmorMenu = 1
			lastSelectioncomponentChangerEmblemesMenu = 1
			lastSelectioncomponentChangerTopsMenu = 1
			lastSelectionoutfitMenu = 1 
			lastSelectionoutfitSaveMenu = 1 
			lastSelectionoutfitLoadMenu = 1 
			lastSelectionoutfitDeleteMenu = 1 
			lastSelectionvehicleMenu = 1
			lastSelectiondoorsMenu = 1
			lastSelectionspawnMenu1 = 1
			lastSelectionspawnMenu2 = 1
			lastSelectionfancySpawn = 1
			lastSelectionbikeSpawn = 1
			lastSelectionboatSpawn = 1
			lastSelectioncommercialSpawn = 1
			lastSelectioncompactSpawn = 1
			lastSelectioncoupeSpawn = 1
			lastSelectionemergencySpawn = 1
			lastSelectionhelicopterSpawn1 = 1
			lastSelectionhelicopterSpawn2 = 1
			lastSelectionindustrialSpawn = 1
			lastSelectionmilitarySpawn = 1
			lastSelectionmotorcycleSpawn1 = 1
			lastSelectionmotorcycleSpawn2 = 1
			lastSelectionmotorcycleSpawn3 = 1
			lastSelectionmuscleSpawn1 = 1
			lastSelectionmuscleSpawn2 = 1
			lastSelectionoffroadSpawn1 = 1
			lastSelectionoffroadSpawn2 = 1
			lastSelectionplaneSpawn1 = 1
			lastSelectionplaneSpawn2 = 1
			lastSelectionsedanSpawn1 = 1
			lastSelectionsedanSpawn2 = 1
			lastSelectionserviceSpawn = 1
			lastSelectionsportSpawn1 = 1
			lastSelectionsportSpawn2 = 1
			lastSelectionsportClassicSpawn1 = 1
			lastSelectionsportClassicSpawn2 = 1
			lastSelectionsuperSpawn1 = 1
			lastSelectionsuperSpawn2 = 1
			lastSelectionsuvSpawn1 = 1
			lastSelectionsuvSpawn2 = 1
			lastSelectiontrailerSpawn1 = 1
			lastSelectiontrailerSpawn2 = 1
			lastSelectionutilitySpawn = 1
			lastSelectionvanSpawn1 = 1
			lastSelectionvanSpawn2 = 1
			lastSelectiontuningMenu = 1
			lastSelectionlscMenu = 1
			lastSelectionlscBumperMenu = 1
			lastSelectionlscFenderMenu = 1
			lastSelectionlscArmorMenu = 1
			lastSelectionlscBrakesMenu = 1
			lastSelectionlscBumperFMenu = 1
			lastSelectionlscBumperRMenu = 1
			lastSelectionlscChassisMenu = 1
			lastSelectionlscEngineMenu = 1
			lastSelectionlscExhaustMenu = 1
			lastSelectionlscFenderFMenu = 1
			lastSelectionlscFenderRMenu = 1
			lastSelectionlscGrilleMenu = 1
			lastSelectionlscHoodMenu = 1
			lastSelectionlscHornMenu = 1
			lastSelectionlscHornStockMenu = 1
			lastSelectionlscHornMelodyMenu1 = 1
			lastSelectionlscHornMelodyMenu2 = 1
			lastSelectionlscHornLoopMenu = 1
			lastSelectionlscLightMenu = 1
			lastSelectionlscLightsNeonMenu = 1
			lastSelectionlscPlateMenu = 1
			lastSelectionlscColorMenu = 1
			lastSelectionlscColorSelectionMenuPrimaryColor = 1
			lastSelectionlscColorSelectionMenuSecondaryColor = 1
			lastSelectionlscColorChromeMenu = 1
			lastSelectionlscColorMetalMenu = 1
			lastSelectionlscColorMatteMenu = 1
			lastSelectionlscColorMetallicMenu1PearlescentColor = 1
			lastSelectionlscColorMetallicMenu1RimsColor = 1
			lastSelectionlscColorMetallicMenu1 = 1
			lastSelectionlscColorMetallicMenu2PearlescentColor = 1
			lastSelectionlscColorMetallicMenu2RimsColor = 1
			lastSelectionlscColorMetallicMenu2 = 1
			lastSelectionlscColorMetallicMenu3PearlescentColor = 1
			lastSelectionlscColorMetallicMenu3RimsColor = 1
			lastSelectionlscColorMetallicMenu3 = 1
			lastSelectionlscColorMetallicMenu4PearlescentColor = 1
			lastSelectionlscColorMetallicMenu4RimsColor = 1
			lastSelectionlscColorMetallicMenu4 = 1
			lastSelectionlscColorLiveryMenuN = 1
			lastSelectionlscColorLiveryMenuM = 1
			lastSelectionlscRoofMenu = 1
			lastSelectionlscSideSkirtMenu = 1
			lastSelectionlscSpoilerMenu = 1
			lastSelectionlscSuspensionMenu = 1
			lastSelectionlscTransmissionMenu = 1
			lastSelectionlscWheelMenu = 1
			lastSelectionlscWheelAccessoriesMenu = 1
			lastSelectionlscWheelTypesMenu = 1
			lastSelectionlscWheelTypesHighEndMenu = 1
			lastSelectionlscWheelTypesLowriderMenu = 1
			lastSelectionlscWheelTypesMuscleMenu = 1
			lastSelectionlscWheelTypesOffroadMenu = 1
			lastSelectionlscWheelTypesSportMenu1 = 1
			lastSelectionlscWheelTypesSportMenu2 = 1
			lastSelectionlscWheelTypesSUVMenu = 1
			lastSelectionlscWheelTypesTunerMenu1 = 1
			lastSelectionlscWheelTypesTunerMenu2 = 1
			lastSelectionlscWheelTypesBikeFrontMenu = 1
			lastSelectionlscWheelTypesBikeBackMenu = 1
			lastSelectionbmMenu = 1
			lastSelectionbmMenuAirFilter = 1
			lastSelectionbmMenuArchCover = 1
			lastSelectionbmMenuBonnetPins = 1
			lastSelectionbmMenuDashboard = 1
			lastSelectionbmMenuDials = 1
			lastSelectionbmMenuDoor = 1
			lastSelectionbmMenuEngineBlock = 1
			lastSelectionbmMenuShiftLever = 1
			lastSelectionbmMenuHydraulics = 1
			lastSelectionbmMenuTrimDesign = 1
			lastSelectionbmMenuOrnaments = 1
			lastSelectionbmMenuPlaques = 1
			lastSelectionbmMenuPlateHolder = 1
			lastSelectionbmMenuSeats = 1
			lastSelectionbmMenuSpeakers = 1
			lastSelectionbmMenuSteeringWheel = 1
			lastSelectionbmMenuStruts = 1
			lastSelectionbmMenuTank = 1
			lastSelectionbmMenuTrim = 1
			lastSelectionbmMenuTrunk = 1
			lastSelectionbmMenuCanards = 1
			lastSelectionextraMenu = 1
			lastSelectionextraTrailerMenu = 1
			lastSelectionteleportMenu = 1
			lastSelectionteleportMenuEntityRelative = 1
			lastSelectioninteriorLocation = 1
			lastSelectionexteriorLocation = 1
			lastSelectioncustomLocation = 1
			lastSelectionOnlinePlayer1 = 1
			lastSelectionOnlinePlayer2 = 1
			lastSelectionweaponMenu = 1
			lastSelectionexplosiveBulletMenu = 1
			lastSelectionvehicleweaponsMenu = 1
			lastSelectionworldMenu = 1
			lastSelectiontimeMenu = 1
			lastSelectionweatherMenu = 1
			lastSelectionmiscMenu = 1
			lastSelectionbodyguardMenu = 1
			lastSelectionradioMenu = 1
			lastSelectionspeedoMenu = 1
			lastSelectionsettingsMenu = 1
		end
	end
end)

Citizen.CreateThread(function() --Controls
	while true do
		Citizen.Wait(0)
		if (IsControlPressed(1, GPKey1) and IsDisabledControlJustReleased(1, GPKey2) and not GetLastInputMethod(2)) --(RB / R1 + X / Square)
		or (IsControlJustReleased(1, KBKey) and GetLastInputMethod(2)) then --F5
			if allowed then
				if MenuOpen then
					MenuOpen = false
					mainMenu = false
					if IsUsingSteam then
						SettingsTable = {xPos * 100, outfitSpawn, OutfitIndex, keepWeapons, godmode, godmodeCount, playerVisible, playerVisibleCount,
									     nowantedlevel, nowantedlevelCount, superjump,  stamina, supermanmode, maxWantedLevel, Run * 10, Swim * 10, vehgodmode, 
									     flyingvehicle, reducevehgrip, vehicleVisible, gravity, boosthorn, bunnyhop, DriveOnWater, seatbelt, despawnable, autodelete,
									     mapblip, deletegun, vehiclegun, whalegun, teleportgun, fireammo, VehicleWeaponsPosition, setinfinite, oneshot, vehicleweapons,
									     explosiveammo, ExplosiveBulletEnumPosition, speedoDefault, autoparachute, heatvision, nightvision, CoordsOverMap, HideHUD,
									     HideRadar, HideHUDCount, freezeradio, nocinecam, mobileradio, dfps, simpleSpeedo, RadioFreezePosition}
						SettingsTable = table.tostring(SettingsTable)
						SettingsTable = SettingsTable:gsub("{", "")
						SettingsTable = SettingsTable:gsub("}", "")
						TriggerServerEvent("SaveSettings", SettingsTable)
					end
				else
					if firstOpen then
						drawWelcomeMessage = true
						firstOpen = false
					end
					mainMenu = true
					MenuOpen = true
					InstructionsDraw = true
				end
			else
				drawNotification("~r~You Are Not Allowed To Use This Menu!")
			end
		elseif IsDisabledControlJustReleased(1, 177) and not blockinput then -- Backspace, Right Click or B/O (Controller)
			if mainMenu then
				mainMenu = false
				MenuOpen = false
				if IsUsingSteam then
					SettingsTable = {xPos * 100, outfitSpawn, OutfitIndex, keepWeapons, godmode, godmodeCount, playerVisible, playerVisibleCount,
									 nowantedlevel, nowantedlevelCount, superjump,  stamina, supermanmode, maxWantedLevel, Run * 10, Swim * 10, vehgodmode, 
									 flyingvehicle, reducevehgrip, vehicleVisible, gravity, boosthorn, bunnyhop, DriveOnWater, seatbelt, despawnable, autodelete,
									 mapblip, deletegun, vehiclegun, whalegun, teleportgun, fireammo, VehicleWeaponsPosition, setinfinite, oneshot, vehicleweapons,
									 explosiveammo, ExplosiveBulletEnumPosition, speedoDefault, autoparachute, heatvision, nightvision, CoordsOverMap, HideHUD,
									 HideRadar, HideHUDCount, freezeradio, nocinecam, mobileradio, dfps, simpleSpeedo, RadioFreezePosition}
					SettingsTable = table.tostring(SettingsTable)
					SettingsTable = SettingsTable:gsub("{", "")
					SettingsTable = SettingsTable:gsub("}", "")
					TriggerServerEvent("SaveSettings", SettingsTable)
				end
			elseif adminMenu or playerMenu or vehicleMenu or teleportMenu or weaponMenu or worldMenu or miscMenu or settingsMenu or aboutMenu then
				adminMenu = false
				playerMenu = false
				vehicleMenu = false
				teleportMenu = false
				weaponMenu = false
				worldMenu = false
				miscMenu = false
				settingsMenu = false
				aboutMenu = false
				mainMenu = true
			elseif ((adminPlayerList1 or adminPlayerList2) and not adminSpectate) or adminSpectateMenu or adminMiscMenu then
				adminInformations = false
				adminKick = false
				adminBan = false
				adminSpectate = false
				adminSpectateMenu = false
				adminTeleport = false
				adminPlayerList1 = false
				adminPlayerList2 = false
				adminMiscMenu = false
				adminMenu = true
			elseif (adminPlayerList1 or adminPlayerList2) and adminSpectate then
				adminPlayerList1 = false
				adminPlayerList2 = false
				adminSpectateMenu = true
			elseif animationMenu or skinMenu or scenarioMenu or wantedMenu or componentChangerMenu or outfitMenu then
				animationMenu = false
				skinMenu = false
				scenarioMenu = false
				wantedMenu = false
				componentChangerMenu = false
				outfitMenu = false
				playerMenu = true
			elseif animalSkinMenu1 or animalSkinMenu2 or femalePedSkinMenu or malePedSkinMenu or playerPedSkinMenu  then
				animalSkinMenu1 = false
				animalSkinMenu2 = false
				femalePedSkinMenu = false
				malePedSkinMenu = false
				playerPedSkinMenu = false
				skinMenu = true
			elseif sexactAnimationMenu or stripAnimationMenu or suicideAnimationMenu then
				sexactAnimationMenu = false
				stripAnimationMenu = false
				suicideAnimationMenu = false
				animationMenu = true
			elseif maleScenarioMenu then
				maleScenarioMenu = false
				scenarioMenu = true
			elseif teleportMenuEntityRelative or OnlinePlayer1 or OnlinePlayer2 or OnlinePlayerToMe or interiorLocation or exteriorLocation or customLocation then
				teleportMenuEntityRelative = false
				OnlinePlayer1 = false
				OnlinePlayer2 = false
				OnlinePlayerToMe = false
				interiorLocation = false
				exteriorLocation = false
				customLocation = false
				teleportMenu = true
			elseif spawnMenu1 or spawnMenu2 or doorsMenu or tuningMenu or vehicleSavedMenu then
				spawnMenu1 = false
				spawnMenu2 = false
				doorsMenu = false
				tuningMenu = false
				vehicleSavedMenu = false
				vehicleMenu = true
			elseif fancySpawn or bikeSpawn or boatSpawn or commercialSpawn or 
			compactSpawn or coupeSpawn or emergencySpawn or helicopterSpawn1 or helicopterSpawn2 or
			industrialSpawn or militarySpawn or motorcycleSpawn1 or motorcycleSpawn2 or
			motorcycleSpawn3 or muscleSpawn1 or muscleSpawn2 or muscleSpawn3 or 
			offroadSpawn1 or offroadSpawn2 or planeSpawn1 or planeSpawn2 or sedanSpawn1 or
			sedanSpawn2	then
				fancySpawn = false
				bikeSpawn = false
				boatSpawn = false
				commercialSpawn = false
				compactSpawn = false
				coupeSpawn = false
				emergencySpawn = false
				helicopterSpawn1 = false
				helicopterSpawn2 = false
				industrialSpawn = false
				militarySpawn = false
				motorcycleSpawn1 = false
				motorcycleSpawn2 = false
				motorcycleSpawn3 = false
				muscleSpawn1 = false
				muscleSpawn2 = false
				muscleSpawn3 = false
				offroadSpawn1 = false
				offroadSpawn2 = false
				planeSpawn1 = false
				planeSpawn2 = false
				sedanSpawn1 = false
				sedanSpawn2 = false
				spawnMenu1 = true
			elseif serviceSpawn or sportSpawn1 or sportSpawn2 or sportSpawn3 or 
			sportClassicSpawn1 or sportClassicSpawn2 or superSpawn1 or superSpawn2 or
			suvSpawn1 or suvSpawn2 or trailerSpawn1 or trailerSpawn2 or utilitySpawn or
			vanSpawn1 or vanSpawn2 then
				serviceSpawn = false
				sportSpawn1 = false
				sportSpawn2 = false
				sportSpawn3 = false
				sportClassicSpawn1 = false
				sportClassicSpawn2 = false
				superSpawn1 = false
				superSpawn2 = false
				suvSpawn1 = false
				suvSpawn2 = false
				trailerSpawn1 = false
				trailerSpawn2 = false
				utilitySpawn = false
				vanSpawn1 = false
				vanSpawn2 = false
				spawnMenu2 = true
			elseif  timeMenu or weatherMenu then
				timeMenu = false
				weatherMenu = false
				worldMenu = true
			elseif bodyguardMenu or radioMenu or speedoMenu then
				bodyguardMenu = false
				radioMenu = false
				speedoMenu = false
				miscMenu = true
			elseif vehicleweaponsMenu or explosiveBulletMenu then
				vehicleweaponsMenu = false
				explosiveBulletMenu = false
				weaponMenu = true
			elseif extraMenu or lscMenu or bmMenu then
				extraMenu = false
				lscMenuTrailer = false
				lscMenu = false
				bmMenu = false
				tuningMenu = true
			elseif extraMenuTrailer then
				extraMenuTrailer = false
				extraMenu = true
			elseif lscArmorMenu or lscBrakesMenu or lscBumperMenu or
			lscColorMenu or lscEngineMenu or lscExhaustMenu or lscFenderMenu or
			lscFrameMenu or lscGrilleMenu or lscHoodMenu or lscHornMenu or
			lscLightMenu or lscPlateMenu or lscRoofMenu or lscSideSkirtMenu or
			lscSpoilerMenu or lscSuspensionMenu or lscTransmissionMenu or lscWheelMenu then
				lscArmorMenu = false
				lscBrakesMenu = false
				lscBumperMenu = false
				lscColorMenu = false
				lscEngineMenu = false
				lscExhaustMenu = false
				lscFenderMenu = false
				lscFrameMenu = false
				lscGrilleMenu = false
				lscHoodMenu = false
				lscHornMenu = false
				lscLightMenu = false
				lscPlateMenu = false
				lscRoofMenu = false
				lscSideSkirtMenu = false
				lscSpoilerMenu = false
				lscSuspensionMenu = false
				lscTransmissionMenu = false
				lscWheelMenu = false
				lscMenu = true
			elseif lscBumperFMenu or lscBumperRMenu then
				lscBumperFMenu = false
				lscBumperRMenu = false
				lscBumperMenu = true
			elseif lscFenderFMenu or lscFenderRMenu then
				lscFenderFMenu = false
				lscFenderRMenu = false
				lscFenderMenu = true
			elseif lscLightsNeonMenu then
				lscLightsNeonMenu = false
				lscLightMenu = true
			elseif lscColorSelectionMenu or PearlescentColor or RimsColor or lscColorLiveryMenuN or lscColorLiveryMenuM then
				PrimaryColor = false
				SecondaryColor = false
				PearlescentColor = false
				RimsColor = false
				lscColorMetallicMenu1 = false
				lscColorMetallicMenu2 = false
				lscColorMetallicMenu3 = false
				lscColorMetallicMenu4 = false
				lscColorMetallicMenu5 = false
				lscColorSelectionMenu = false
				lscColorLiveryMenuN = false
				lscColorLiveryMenuM = false
				lscColorMenu = true
			elseif lscColorLiveryTrailerMenu then
				lscColorLiveryTrailerMenu = false
				lscColorLiveryMenu = true
			elseif lscColorChromeMenu or lscColorMetalMenu or lscColorMatteMenu or lscColorMetallicMenu1 or
			lscColorMetallicMenu2 or lscColorMetallicMenu3 or lscColorMetallicMenu4 or lscColorMetallicMenu5 then
				if PearlescentColor or RimsColor then
					PearlescentColor = false
					RimsColor = false
					lscColorMetallicMenu1 = false
					lscColorMetallicMenu2 = false
					lscColorMetallicMenu3 = false
					lscColorMetallicMenu4 = false
					lscColorMetallicMenu5 = false
					lscColorMenu = true
				else
					lscColorChromeMenu = false
					lscColorMetalMenu = false
					lscColorMatteMenu = false
					lscColorMetallicMenu1 = false
					lscColorMetallicMenu2 = false
					lscColorMetallicMenu3 = false
					lscColorMetallicMenu4 = false
					lscColorMetallicMenu5 = false
					lscColorSelectionMenu = true
				end
			elseif lscHornStockMenu or lscHornMelodyMenu1 or lscHornMelodyMenu2 or lscHornLoopMenu then
				lscHornStockMenu = false
				lscHornMelodyMenu1 = false
				lscHornMelodyMenu2 = false
				lscHornLoopMenu = false
				lscHornMenu = true
			elseif lscWheelAccessoriesMenu or lscWheelTypesMenu then
				lscWheelAccessoriesMenu = false
				lscWheelTypesMenu = false
				lscWheelMenu = true
			elseif lscWheelTypesHighEndMenu or lscWheelTypesLowriderMenu or lscWheelTypesMuscleMenu or lscWheelTypesOffroadMenu or
			lscWheelTypesSportMenu1 or lscWheelTypesSportMenu2 or lscWheelTypesSUVMenu or lscWheelTypesTunerMenu1 or lscWheelTypesTunerMenu2 or
			lscWheelTypesBikeFrontMenu or lscWheelTypesBikeBackMenu then
				lscWheelTypesHighEndMenu = false
				lscWheelTypesLowriderMenu = false
				lscWheelTypesMuscleMenu = false
				lscWheelTypesOffroadMenu = false
				lscWheelTypesSportMenu1 = false
				lscWheelTypesSportMenu2 = false
				lscWheelTypesSUVMenu = false
				lscWheelTypesTunerMenu1 = false
				lscWheelTypesTunerMenu2 = false
				lscWheelTypesBikeFrontMenu = false
				lscWheelTypesBikeBackMenu = false
				lscWheelTypesMenu = true
			elseif bmMenuAirFilter or bmMenuArchCover or bmMenuBonnetPins or bmMenuDashboard
			or bmMenuDials or bmMenuDoor or bmMenuEngineBlock or bmMenuShiftLever
			or bmMenuHydraulics or bmMenuTrimDesign or bmMenuOrnaments or bmMenuPlaques
			or bmMenuPlateHolder or bmMenuSeats or bmMenuSpeakers or bmMenuSteeringWheel
			or bmMenuStruts or bmMenuTank or bmMenuTrim or bmMenuTrunk or bmMenuCanards then
				bmMenuAirFilter = false
				bmMenuArchCover = false
				bmMenuBonnetPins = false
				bmMenuDashboard = false
				bmMenuDials = false
				bmMenuDoor = false
				bmMenuEngineBlock = false
				bmMenuShiftLever = false
				bmMenuHydraulics = false
				bmMenuTrimDesign = false
				bmMenuOrnaments = false
				bmMenuPlaques = false
				bmMenuPlateHolder = false
				bmMenuSeats = false
				bmMenuSpeakers = false
				bmMenuSteeringWheel = false
				bmMenuStruts = false
				bmMenuTank = false
				bmMenuTrim = false
				bmMenuTrunk = false
				bmMenuCanards = false
				bmMenu = true
			elseif componentChangerSkinMenu or componentChangerHatsMenu or componentChangerGlassesMenu or componentChangerEarPiecesMenu or
			componentChangerWatchesMenu or componentChangerFaceMenu or componentChangerMasksMenu or componentChangerHairMenu or
			componentChangerUpperBodyMenu or componentChangerLegsMenu or	componentChangerParachutesMenu or componentChangerShoesMenu or
			componentChangerTiesScarfsetcMenu or componentChangerUndershirtsMenu or componentChangerArmorMenu or componentChangerEmblemesMenu or
			componentChangerTopsMenu or componentChangerHeadDataMenu then
				componentChangerSkinMenu = false
				componentChangerHatsMenu = false
				componentChangerGlassesMenu = false
				componentChangerEarPiecesMenu = false
				componentChangerWatchesMenu = false
				componentChangerFaceMenu = false
				componentChangerMasksMenu = false
				componentChangerHairMenu = false
				componentChangerUpperBodyMenu = false
				componentChangerLegsMenu = false
				componentChangerParachutesMenu = false
				componentChangerShoesMenu = false
				componentChangerTiesScarfsetcMenu = false
				componentChangerUndershirtsMenu = false
				componentChangerArmorMenu = false
				componentChangerEmblemesMenu = false
				componentChangerTopsMenu = false
				componentChangerHeadDataMenu = false
				componentChangerMenu = true
			elseif componentChangerHeadDataSubMenu then
				componentChangerHeadDataSubMenu = false
				componentChangerHeadDataMenu = true
			elseif outfitSaveMenu or outfitLoadMenu or outfitDeleteMenu then
				outfitSaveMenu = false
				outfitLoadMenu = false
				outfitDeleteMenu = false
				outfitMenu = true
			elseif vehicleSaveMenu or vehicleLoadMenu or vehicleUnsaveMenu then
				vehicleSaveMenu = false
				vehicleLoadMenu = false
				vehicleUnsaveMenu = false
				vehicleSavedMenu = true
			end
		end
	end
end)

Citizen.CreateThread(function() --Various Stuff
	while true do
		Citizen.Wait(0)
		
		if not AdminStatusChecked then --Admin And Steam Status Check
			TriggerServerEvent("GetHost")
			TriggerServerEvent("GetVehicleNames")
			TriggerServerEvent("IsUsingSteam")
			Citizen.Trace("Checking Your Status")
			TriggerServerEvent("ID")
			Citizen.Trace("Checked Your Status")
			TriggerServerEvent("LoadSettings")
			AdminStatusChecked = true
		end

		if OnlyForAdmins then --Enabling Menu Use
			if IsAdmin then
				allowed = true
			else
				allowed = false
			end
		else
			allowed = true
		end

		if MenuOpen then --Disables Controls Used In The Trainer, When Trainer Is Active
			DisableControlAction(1, 20, true)
			DisableControlAction(1, 21, true)
			DisableControlAction(1, 45, true)
			DisableControlAction(1, 73, true)
			DisableControlAction(1, 74, true)
			DisableControlAction(1, 76, true)
			DisableControlAction(1, 80, true)
			DisableControlAction(1, 85, true)
			DisableControlAction(1, 99, true)
			DisableControlAction(1, 114, true)
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 172, true)
			DisableControlAction(1, 173, true)
			DisableControlAction(1, 174, true)
			DisableControlAction(1, 175, true)
			DisableControlAction(1, 176, true)
			DisableControlAction(1, 177, true)
			DisableControlAction(1, 178, true)
			DisableControlAction(1, 179, true)
			if InstructionsDraw then --Draws Instructions Messages When Trainer Is On
				DisplayHelpMessage("~INPUTGROUP_FRONTEND_DPAD_ALL~ Browse ~INPUT_FRONTEND_ACCEPT~ Select ~INPUT_CELLPHONE_CANCEL~ Back")
			end
		end

		if (Citizen.InvokeNative(0x2309595AD6145265) == -1171018317) then --Disables Trainer When In Pausemenu
			if IsUsingSteam then
				SettingsTable = {xPos * 100, outfitSpawn, OutfitIndex, keepWeapons, godmode, godmodeCount, playerVisible, playerVisibleCount,
								 nowantedlevel, nowantedlevelCount, superjump,  stamina, supermanmode, maxWantedLevel, Run * 10, Swim * 10, vehgodmode, 
								 flyingvehicle, reducevehgrip, vehicleVisible, gravity, boosthorn, bunnyhop, DriveOnWater, seatbelt, despawnable, autodelete,
								 mapblip, deletegun, vehiclegun, whalegun, teleportgun, fireammo, VehicleWeaponsPosition, setinfinite, oneshot, vehicleweapons,
								 explosiveammo, ExplosiveBulletEnumPosition, speedoDefault, autoparachute, heatvision, nightvision, CoordsOverMap, HideHUD,
								 HideRadar, HideHUDCount, freezeradio, nocinecam, mobileradio, dfps, simpleSpeedo, RadioFreezePosition}
				SettingsTable = table.tostring(SettingsTable)
				SettingsTable = SettingsTable:gsub("{", "")
				SettingsTable = SettingsTable:gsub("}", "")
				TriggerServerEvent("SaveSettings", SettingsTable)
			end
			MenuOpen = false
		end
		
	end
end)

Citizen.CreateThread(function() --Disables Instructions Draw After 30 Seconds
	while true do
		Citizen.Wait(0)
		if InstructionsDraw then
			Citizen.Wait(30000)
			InstructionsDraw = false
		end
	end
end)

Citizen.CreateThread(function() --Draws The Welcome Message
	local Alpha = 0; Up = true
	while true do
		Citizen.Wait(0)
		if drawWelcomeMessage then
			_DrawRect(0.5, 0.85, 0.55, 0.1, 0, 51, 0, Alpha, 6)
			Draw("~y~ " .. WelcomeMessage, 255, 255, 255, Alpha, 0.5, 0.815, 1.2, 1.3, 7, true, 7)
			if Alpha < 255 and Up then
				Alpha = Alpha + 3
			elseif Alpha == 255 and Up then
				Up = false
			elseif Alpha > 0 and not Up then
				Alpha = Alpha - 3
			elseif Alpha == 0 and not Up then
				SetStreamedTextureDictAsNoLongerNeeded("WelcomeMessage")
				drawWelcomeMessage = false
			end
		end
	end
end)


local LastGameTimer; noclipmode = false; isRadarExtended = false; isScoreboardShowing = false
local fps = 0; prevframes = 0; curframes = 0; prevtime = 0; curtime = 0; player = -1, radioname
speedoDefault = 1; autoparachute = true; heatvision = false; nightvision = false; CoordsOverMap = true
HideHUD = false; HideRadar = false; HideHUDCount = 0; freezeradio = false; nocinecam = true; mobileradio = false
dfps = true; simpleSpeedo = true; RadioFreezePosition = 1

Citizen.CreateThread(function() --Misc Menu
	local allowNoClip = false
	local allowBodyguards = false
	while true do
		if (miscMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionmiscMenu
			else
				lastSelectionmiscMenu = currentOption
			end
		
			if WorldAndNoClipOnlyAdmins then if IsAdmin then allowNoClip = true end else allowNoClip = true end
			
			if BodyguardsOnlyAdmins then if IsAdmin then allowBodyguards = true end else allowBodyguards = true end
			
			TriggerEvent("FMODT:Title", "~y~" .. MiscMenuTitle)

			TriggerEvent("FMODT:Bool", AlwaysParachuteTitle, autoparachute, function(cb)
				autoparachute = cb
				if autoparachute then
					drawNotification("~g~" .. AlwaysParachuteEnableMessage .. "!")
				else
					drawNotification("~r~" .. AlwaysParachuteDisableMessage .. "!")
				end
			end)

			if allowBodyguards then
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. BodyguardMenuTitle .. "", function(cb)
					if (cb) then
						miscMenu = false
						bodyguardMenu = true
					end
				end)
			end

			TriggerEvent("FMODT:Bool", CoordsOverMapTitle, CoordsOverMap, function(cb)
				CoordsOverMap = cb
				if CoordsOverMap then
					drawNotification("~g~" ..CoordsOverMapEnableMessage  .. "!")
				else
					drawNotification("~r~" .. CoordsOverMapDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Bool", DisableCinematicCamButtonTitle, nocinecam, function(cb)
				nocinecam = cb
				if nocinecam then
					drawNotification("~g~" .. DisableCinematicCamButtonDisableMessage .. "!")
				else
					drawNotification("~r~" .. DisableCinematicCamButtonEnableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Bool", DrawFPSTitle, dfps, function(cb)
				dfps = cb
				if dfps then
					drawNotification("~g~" .. DrawFPSEnableMessage .. "!")
				else
					drawNotification("~r~" .. DrawFPSDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Bool", HeatvisionTitle, heatvision, function(cb)
				heatvision = cb
				if heatvision then
					nightvision = false
					drawNotification("~g~" .. HeatvisionEnableMessage .. "!")
				else
					drawNotification("~r~" .. HeatvisionDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Bool", HideHUDRadarTitle, HideHUD, function(cb)
				HideHUD = cb
				if HideHUD then
					HideHUDCount = 1
					drawNotification("~g~" .. HideHUDRadarEnableMessage .. "!")
				else
					HideHUDCount = 0
					drawNotification("~r~" .. HideHUDRadarDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Bool", HideOnlyRadarTitle, HideRadar, function(cb)
				HideRadar = cb
				if HideRadar then
					drawNotification("~g~" .. HideOnlyRadarEnableMessage .. "!")
				else
					drawNotification("~r~" .. HideOnlyRadarDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Bool", NightvisionTitle, nightvision, function(cb)
				nightvision = cb
				if nightvision then
					heatvision = false
					drawNotification("~g~" .. NightvisionEnableMessage .. "!")
				else
					drawNotification("~r~" .. NightvisionDisableMessage .. "!")
				end
			end)

			if allowNoClip then
				TriggerEvent("FMODT:Bool", NoClipModeTitle, noclipmode, function(cb)
					noclipmode = cb
					if noclipmode then
						HideHUD = true
						drawNotification("~g~" .. NoClipModeEnableMessage .. "!")
					else
						if (HideHUDCount == 0) then HideHUD = false end
						ResetPedRagdollBlockingFlags(GetPlayerPed(-1), 2)
						ResetPedRagdollBlockingFlags(GetPlayerPed(-1), 3)
						SetEntityCollision(GetPlayerPed(-1), true, true)
						FreezeEntityPosition(GetPlayerPed(-1), false)
						drawNotification("~r~" .. NoClipModeDisableMessage .. "!")
					end
				end)
			end

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. RadioMenuTitle, function(cb)
				if (cb) then
					miscMenu = false
					radioMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. SpeedometerTitle, function(cb)
				if (cb) then
					miscMenu = false
					speedoMenu = true
				end
			end)

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Bodyguard Menu
	local formationId = 1
	local selectedBodyguard = 1
	local formation = {NoFormationTitle, CircleAroundLeader1Title, CircleAroundLeader2Title, LineLeaderAtCenterTitle}
	while true do
		local playerPed = GetPlayerPed(-1)
		local GroupHandle = GetPlayerGroup(PlayerId())
		local bool, groupSize = GetGroupSize(GroupHandle)
		if (bodyguardMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionbodyguardMenu
			else
				lastSelectionbodyguardMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. BodyguardMenuTitle)

			TriggerEvent("FMODT:Option", SpawnBodyguardTitle, function(cb)
				if (cb) then
					if (groupSize <= 6) then
						SetGroupSeparationRange(GroupHandle, 999999.9)
						local ped = ClonePed(playerPed, GetEntityHeading(playerPed), 1, 1)
						local pedblip = AddBlipForEntity(ped)
						
						SetBlipSprite(pedblip, 143)
						SetBlipColour(pedblip, 5)
						
						SetPedAsGroupLeader(playerPed, GroupHandle)
						SetPedAsGroupMember(ped, GroupHandle)
						SetPedNeverLeavesGroup(ped, true)
						
						SetEntityInvincible(ped, true)
						SetPedCanBeTargetted(ped, false)
						GiveWeaponToPed(ped, GetHashKey("WEAPON_MINIGUN"), 999999999, false, true)
						SetPedInfiniteAmmo(ped, true)
						SetPedInfiniteAmmoClip(ped, true)
						
						drawNotification("~g~" .. BodyguardSpawnedMessage .. "!")
					else
						drawNotification("~r~" .. Maximum7BodyguardsMessage .. "!")
					end
				end
			end)

			TriggerEvent("FMODT:Int", formation[formationId], formationId, 1, 4, function(cb)
				formationId = cb
				SetGroupFormation(GroupHandle, formationId - 1)
			end)

			TriggerEvent("FMODT:Option", DeleteAllBodyguardsTitle, function(cb)
				if (cb) then
					for i = 0, 6 do
						local ped = GetPedAsGroupMember(GroupHandle, i)
						RemoveBlip(GetBlipFromEntity(ped))
						SetPedNeverLeavesGroup(ped, false)
						RemovePedFromGroup(ped)
						SetEntityAsMissionEntity(ped, 1, 1)
						DeleteEntity(ped)
					end		
					drawNotification("~r~" .. AllBodyguardsDeletedMessage .. "!")
				end
			end)
			
			if (groupSize > 0) then
				TriggerEvent("FMODT:Int", SelectedBodyguardTitle, selectedBodyguard, 1, 7, function(cb)
					selectedBodyguard = cb
				end)
				
				if DoesEntityExist(GetPedAsGroupMember(GroupHandle, selectedBodyguard - 1)) then
					TriggerEvent("FMODT:Option", DeleteBodyguardTitle, function(cb)
						if (cb) then
							local ped = GetPedAsGroupMember(GroupHandle, selectedBodyguard - 1)
							RemoveBlip(GetBlipFromEntity(ped))
							SetPedNeverLeavesGroup(ped, false)
							RemovePedFromGroup(ped)
							SetEntityAsMissionEntity(ped, 1, 1)
							DeleteEntity(ped)
							drawNotification("~r~" .. DeletedSelectedBodyguardMessage .. "!")
						end
					end)
				else
					TriggerEvent("FMODT:Option", "~r~" .. SelectedBodyguardNotExistingMessage .. "!", function(cb)
						if (cb) then
							drawNotification("~r~" .. SelectedBodyguardNotExistingMessage .. "!")
						end
					end)
				end
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Radio Menu
	local RadioUINameArray = {UnfreezeTitle,
				   "LS Rock Radio", "Non-Stop-Pop",
				   "Radio LS", "Channel X",
				   "WC Talk Radio", "Rebel Radio",
				   "Soulwax FM", "East Los FM",
				   "WC Classics", "Blue Ark",
				   "Worldwide FM", "FlyLo FM",
				   "The Lowdown", "The Lab",
				   "Mirror Park", "Space",
				   "Vw Boulevard", "Self Radio"
				  }
	local RadioNameArray = {"UNFREEZE",
				    "RADIO_01_CLASS_ROCK", "RADIO_02_POP",
				    "RADIO_03_HIPHOP_NEW", "RADIO_04_PUNK",
				    "RADIO_05_TALK_01", "RADIO_06_COUNTRY",
				    "RADIO_07_DANCE_01", "RADIO_08_MEXICAN",
				    "RADIO_09_HIPHOP_OLD", "RADIO_12_REGGAE",
				    "RADIO_13_JAZZ", "RADIO_14_DANCE_02",
				    "RADIO_15_MOTOWN", "RADIO_20_THELAB",
				    "RADIO_16_SILVERLAKE", "RADIO_17_FUNK",
				    "RADIO_18_90S_ROCK", "RADIO_19_USER"
				   }
	while true do
		if (radioMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionradioMenu
			else
				lastSelectionradioMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. RadioMenuTitle)

			TriggerEvent("FMODT:Bool", MobileRadioTitle, mobileradio, function(cb)
				mobileradio = cb
				if mobileradio then
					drawNotification("~g~" .. MobileRadioEnableMessage .. "!")
				else
					drawNotification("~r~" .. MobileRadioDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Option", SkipCurrentSongTitle, function(cb)
				if (cb) then
					SkipRadioForward()
				end
			end)

			TriggerEvent("FMODT:StringArray", SenderToFreezeTitle .. ":", RadioUINameArray, RadioFreezePosition, function(cb)
				RadioFreezePosition = cb
				if RadioUINameArray[RadioFreezePosition] == "Unfreeze" then
					freezeradio = false
					radioname = nil
					drawNotification("~r~" .. RadiostationUnfrozenMessage .. "!")
				else
					freezeradio = true
					radioname = RadioNameArray[RadioFreezePosition]
					if not RadioUINameArray[RadioFreezePosition] == nil then
						drawNotification("~g~" .. RadiostationFrozenMessage .. "!")
					end
				end
			end)

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Speedometer Menu
	local speedoUnitArray = {"KM/H", "MPH"}
	while true do
		if (speedoMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionspeedoMenu
			else
				lastSelectionspeedoMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. SpeedometerTitle)

			TriggerEvent("FMODT:Bool", SimpleSpeedometerTitle, simpleSpeedo, function(cb)
				simpleSpeedo = cb
				if simpleSpeedo then
					drawNotification("~g~" .. SimpleSpeedometerEnableMessage .. "!")
				else
					drawNotification("~r~" .. SimpleSpeedometerDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:StringArray", UnitTitle .. ":", speedoUnitArray, speedoDefault, function(cb)
				speedoDefault = cb
			end)

			TriggerEvent("FMODT:Update")
		end
		
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Always Parachute
	while true do
		Citizen.Wait(0)
		if autoparachute and allowed then
			GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("gadget_parachute"), 1, false, false)
		end
	end
end)

Citizen.CreateThread(function() --PvP
	while true do
		Citizen.Wait(0)
		if allowed then
			if PvP then
				SetCanAttackFriendly(GetPlayerPed(-1), true, false)
				NetworkSetFriendlyFireOption(true)
			else
				SetCanAttackFriendly(GetPlayerPed(-1), false, false)
				NetworkSetFriendlyFireOption(false)
			end
		end
	end
end)

Citizen.CreateThread(function() --Mobile Radio
	while true do
		Citizen.Wait(0)
		if GetPlayerPed(-1) and allowed then
			SetMobileRadioEnabledDuringGameplay(mobileradio)
		end
	end
end)

Citizen.CreateThread(function() --Count FPS (Thanks To siggyfawn [forum.FiveM.net])
	while not NetworkIsPlayerActive(PlayerId()) or not NetworkIsSessionStarted() do
		Citizen.Wait(0)
		prevframes = GetFrameCount()
		prevtime = GetGameTimer()
	end

	while true do
		Citizen.Wait(0)
		curtime = GetGameTimer()
		curframes = GetFrameCount()

	    if((curtime - prevtime) > 1000) then
			fps = (curframes - prevframes) - 1				
			prevtime = curtime
			prevframes = curframes
	    end
	end
end)

Citizen.CreateThread(function() --Draw FPS
    while true do
        Citizen.Wait(0)
		if dfps and allowed then
			if fps == 0 or fps > 1000 then
				Draw(FPSCountFailed, 255, 0, 0, 127, 0.95, 0.97, 0.35, 0.35, 1, true, 0)
			elseif fps >= 1 and fps <= 29 then
				Draw("" .. fps .. "", 255, 0, 0, 127, 0.99, 0.97, 0.35, 0.35, 1, true, 0)
				_DrawRect(0.99, 0.984, 0.0175, 0.025, 0, 0, 0, 127, 0)
			elseif fps >=30 and fps <= 49 then
				Draw("" .. fps .. "", 255, 255, 0, 127, 0.99, 0.97, 0.35, 0.35, 1, true, 0)
				_DrawRect(0.99, 0.984, 0.0175, 0.025, 0, 0, 0, 127, 0)
			elseif fps >= 50 then
				Draw("" .. fps .. "", 0, 255, 0, 127, 0.99, 0.97, 0.35, 0.35, 1, true, 0)
				_DrawRect(0.99, 0.984, 0.0175, 0.025, 0, 0, 0, 127, 0)
			end
		end
	end
end)

Citizen.CreateThread(function() --Simple Speedometer
	local x
	local speed
	local unit
    while true do
        Citizen.Wait(0)
		if simpleSpeedo and allowed then
			if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
				if isRadarExtended then
					x = 0.290
				else
					x = 0.205
				end
				if speedoDefault == 1 then
					speed = math.ceil(GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6)
					unit = "KM/H"
				else
					speed = math.ceil(GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.236936)
					unit = "MPH"
				end
				_DrawRect(x, 0.964, 0.07, 0.04, 0, 0, 0, 127, 0)
				Draw(speed .. " " .. unit, 255, 255, 255, 127, x, 0.95, 0.4, 0.4, 1, true, 0)
			end
		end
	end
end)

Citizen.CreateThread(function() --Heatvision, Nightvision, Hide HUD, Hide Radar, Coords Over Map
	while true do
		Citizen.Wait(0)
		if allowed then	
			SetSeethrough(heatvision)
			SetNightvision(nightvision)
			DisplayRadar(not HideRadar)
			if HideHUD then
				HideHudAndRadarThisFrame()
			end
			if CoordsOverMap then
				local playerPos = GetEntityCoords(GetPlayerPed(-1))
				local playerHeading = GetEntityHeading(GetPlayerPed(-1))
				if isRadarExtended then	
					Draw("X: " .. math.ceil(playerPos.x) .." Y: " .. math.ceil(playerPos.y) .." Z: " .. math.ceil(playerPos.z) .." Heading: " .. math.ceil(playerHeading) .."", 0, 0, 0, 255, 0.0175, 0.53, 0.378, 0.378, 1, false, 1)
				else
					Draw("X: " .. math.ceil(playerPos.x) .." Y: " .. math.ceil(playerPos.y) .." Z: " .. math.ceil(playerPos.z) .." Heading: " .. math.ceil(playerHeading) .."", 0, 0, 0, 255, 0.0175, 0.76, 0.378, 0.378, 1, false, 1)
				end
			end
		end
	end
end)

Citizen.CreateThread(function() --No Clip Mode (Miscellaneous)
	while true do
		Citizen.Wait(0)

		if noclipmode and allowed then
			SetEntityCollision(GetPlayerPed(-1), false, false)
			ClearPedTasksImmediately(GetPlayerPed(-1))
			Citizen.InvokeNative(0x0AFC4AF510774B47)
			if not IsControlPressed(1, 32) and not IsControlPressed(1, 33) and not IsControlPressed(1, 90) and not IsControlPressed(1, 89) then
				FreezeEntityPosition(GetPlayerPed(-1), true)
			end
		end
	end
end)

Citizen.CreateThread(function() --No Clip Mode (Forward/ Backward)
	while true do
		Citizen.Wait(0)

		if noclipmode and allowed then
			local coords = GetEntityForwardVector(GetPlayerPed(-1))
			if IsControlPressed(1, 32) then --Forward
				FreezeEntityPosition(GetPlayerPed(-1), false)
				ApplyForceToEntity(GetPlayerPed(-1), 1, coords.x * 3, coords.y * 3, 0.27, 0.0, 0.0, 0.0, 1, false, true, true, true, true)
			elseif IsControlPressed(1, 33) then --Backward
				FreezeEntityPosition(GetPlayerPed(-1), false)
				ApplyForceToEntity(GetPlayerPed(-1), 1, coords.x * -3, coords.y * -3, 0.27, 0.0, 0.0, 0.0, 1, false, true, true, true, true)
			end
		end
	end
end)

Citizen.CreateThread(function() --No Clip Mode (Up/ Down)
	while true do
		Citizen.Wait(0)

		if noclipmode and allowed then
			if IsControlPressed(1, 90) then --Up
				FreezeEntityPosition(GetPlayerPed(-1), false)
				ApplyForceToEntity(GetPlayerPed(-1), 1, 0.0, 0.0, 5.0, 0.0, 0.0, 0.0, 1, false, true, true, true, true)
			elseif IsControlPressed(1, 89) then --Down
				FreezeEntityPosition(GetPlayerPed(-1), false)
				ApplyForceToEntity(GetPlayerPed(-1), 1, 0.0, 0.0, -5.0, 0.0, 0.0, 0.0, 1, false, true, true, true, true)
			end
		end
	end
end)

Citizen.CreateThread(function() --No Clip Mode (Rotation)
	while true do
		Citizen.Wait(0)
		local camRot = GetGameplayCamRot(0)
		if noclipmode and allowed then
			SetEntityRotation(GetPlayerPed(-1), 0.0, 0.0, camRot.z, 1, true)
		end
	end
end)

Citizen.CreateThread(function() --Cinematic Cam Disabled
	while true do
		Citizen.Wait(0)
		if allowed then
			if nocinecam then
				SetCinematicButtonActive(false)
			else
				SetCinematicButtonActive(true)
			end
		end
	end
end)

Citizen.CreateThread(function() --Freeze Radio Station
	while true do
		Citizen.Wait(0)
		if freezeradio and allowed then
			if radioname ~= nil then
				if (GetPlayerRadioStationName() ~= radioname) then
					if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
						if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1) then
							SetRadioToStationName(radioname)
							SetVehRadioStation(GetVehiclePedIsIn(GetPlayerPed(-1), false), radioname)
						end
					else
						SetRadioToStationName(radioname)
						SetVehRadioStation(GetVehiclePedIsIn(GetPlayerPed(-1), false), radioname)
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function() --Bodyguard Teleport
	while true do
		Citizen.Wait(0)
		local playerPedPos = GetEntityCoords(GetPlayerPed(-1), true)
		local GroupHandle = GetPlayerGroup(PlayerId())
		for i = 0, 6 do
			local ped = GetPedAsGroupMember(GroupHandle, i)
			local PedPos = GetEntityCoords(ped, true)
			if (Vdist(playerPedPos.x, playerPedPos.y, playerPedPos.z, PedPos.x, PedPos.y, PedPos.z) >= 50) then
				SetEntityCoords(ped, playerPedPos.x, playerPedPos.y, playerPedPos.z, false, false, false, true)
				SetEntityVisible(ped, true, 0)
			end
		end
	end
end)

Citizen.CreateThread(function() --Player Blips (Thanks To Mr.Scammer [forum.FiveM.net])
	local headId = {}
	while true do
		Citizen.Wait(1)
		if playerBlips and (BlipsAndNamesNonAdmins or IsAdmin) then
			-- show blips
			for id = 0, 64 do
				if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= GetPlayerPed(-1) then
					ped = GetPlayerPed(id)
					blip = GetBlipFromEntity(ped)

					-- HEAD DISPLAY STUFF --

					-- Create head display (this is safe to be spammed)
					headId[id] = CreateMpGamerTag(ped, GetPlayerName( id ), false, false, "", false)
					wantedLvl = GetPlayerWantedLevel(id)

					-- Wanted level display
					if wantedLvl then
						SetMpGamerTagVisibility(headId[id], 7, true) -- Add wanted sprite
						SetMpGamerTagWantedLevel(headId[id], wantedLvl) -- Set wanted number
					else
						SetMpGamerTagVisibility(headId[id], 7, false)
					end

					-- Speaking display
					if NetworkIsPlayerTalking(id) then
						SetMpGamerTagVisibility(headId[id], 9, true) -- Add speaking sprite
					else
						SetMpGamerTagVisibility(headId[id], 9, false) -- Remove speaking sprite
					end

					-- BLIP STUFF --

					if not DoesBlipExist(blip) then -- Add blip and create head display on player
						blip = AddBlipForEntity(ped)
						SetBlipSprite(blip, 1)
						ShowHeadingIndicatorOnBlip(blip, true) -- Player Blip indicator
					else -- update blip
						veh = GetVehiclePedIsIn(ped, false)
						blipSprite = GetBlipSprite(blip)
						if not GetEntityHealth(ped) then -- dead
							if blipSprite ~= 274 then
								SetBlipSprite(blip, 274)
								ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
							end
						elseif veh then
							vehClass = GetVehicleClass(veh)
							vehModel = GetEntityModel(veh)
							if vehClass == 15 then -- Helicopters
								if blipSprite ~= 422 then
									SetBlipSprite(blip, 422)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehClass == 8 then -- Motorcycles
								if blipSprite ~= 226 then
									SetBlipSprite(blip, 226)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehClass == 16 then -- Plane
								if vehModel == GetHashKey("besra") or vehModel == GetHashKey("hydra") or vehModel == GetHashKey("lazer") then -- Jets
									if blipSprite ~= 424 then
										SetBlipSprite(blip, 424)
										ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
									end
								elseif blipSprite ~= 423 then
									SetBlipSprite(blip, 423)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehClass == 14 then -- Boat
								if blipSprite ~= 427 then
									SetBlipSprite(blip, 427)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("insurgent") or vehModel == GetHashKey("insurgent2") or vehModel == GetHashKey("insurgent3") then -- Insurgent, Insurgent Pickup & Insurgent Pickup Custom
								if blipSprite ~= 426 then
									SetBlipSprite(blip, 426)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("limo2") then -- Turreted Limo
								if blipSprite ~= 460 then
									SetBlipSprite(blip, 460)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("rhino") then -- Tank
								if blipSprite ~= 421 then
									SetBlipSprite(blip, 421)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("trash") or vehModel == GetHashKey("trash2") then -- Trash
								if blipSprite ~= 318 then
									SetBlipSprite(blip, 318)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("pbus") then -- Prison Bus
								if blipSprite ~= 513 then
									SetBlipSprite(blip, 513)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("seashark") or vehModel == GetHashKey("seashark2") or vehModel == GetHashKey("seashark3") then -- Speedophiles
								if blipSprite ~= 471 then
									SetBlipSprite(blip, 471)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("cargobob") or vehModel == GetHashKey("cargobob2") or vehModel == GetHashKey("cargobob3") or vehModel == GetHashKey("cargobob4") then -- Cargobobs
								if blipSprite ~= 481 then
									SetBlipSprite(blip, 481)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("technical") or vehModel == GetHashKey("technical2") or vehModel == GetHashKey("technical3") then -- Technical
								if blipSprite ~= 426 then
									SetBlipSprite(blip, 426)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("taxi") then -- Cab/ Taxi
								if blipSprite ~= 198 then
									SetBlipSprite(blip, 198)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("fbi") or vehModel == GetHashKey("fbi2") or vehModel == GetHashKey("police2") or vehModel == GetHashKey("police3") -- Police Vehicles
								or vehModel == GetHashKey("police") or vehModel == GetHashKey("sheriff2") or vehModel == GetHashKey("sheriff")
								or vehModel == GetHashKey("policeold2") or vehModel == GetHashKey("policeold1") then
								if blipSprite ~= 56 then
									SetBlipSprite(blip, 56)
									ShowHeadingIndicatorOnBlip(blip, false) -- Player Blip indicator
								end
							elseif blipSprite ~= 1 then -- default blip
								SetBlipSprite(blip, 1)
								ShowHeadingIndicatorOnBlip(blip, true) -- Player Blip indicator
							end

							-- Show number in case of passangers
							passengers = GetVehicleNumberOfPassengers(veh)

							if passengers then
								if not IsVehicleSeatFree(veh, -1) then
									passengers = passengers + 1
								end
								ShowNumberOnBlip(blip, passengers)
							else
								HideNumberOnBlip(blip)
							end
						else
							-- Remove leftover number
							HideNumberOnBlip(blip)
							if blipSprite ~= 1 then -- default blip
								SetBlipSprite(blip, 1)
								ShowHeadingIndicatorOnBlip(blip, true) -- Player Blip indicator
							end
						end
						
						SetBlipRotation(blip, math.ceil(GetEntityHeading(veh))) -- update rotation
						SetBlipNameToPlayerName(blip, id) -- update blip name
						SetBlipScale(blip,  0.85) -- set scale

						-- set player alpha
						if IsPauseMenuActive() then
							SetBlipAlpha( blip, 255 )
						else
							x1, y1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
							x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
							distance = (math.floor(math.abs(math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) / -1)) + 900
							-- Probably a way easier way to do this but whatever im an idiot

							if distance < 0 then
								distance = 0
							elseif distance > 255 then
								distance = 255
							end
							SetBlipAlpha(blip, distance)
						end
					end
				end
			end
		else
			for id = 0, 64 do
				ped = GetPlayerPed(id)
				blip = GetBlipFromEntity(ped)
				if DoesBlipExist(blip) then -- Removes blip
					RemoveBlip(blip)
				end
				if IsMpGamerTagActive(headId[id]) then
					RemoveMpGamerTag(headId[id])
				end
			end
		end
	end
end)

Citizen.CreateThread(function() --Extendable Map (Thanks To Mr.Scammer [forum.FiveM.net])
	while true do
		Citizen.Wait(1)
		if ExtendableMap then
			if IsControlJustReleased(0, 20) then
				Citizen.Wait(25)
				if not isScoreboardShowing then
					if not isRadarExtended then
						SetRadarBigmapEnabled(true, false)
						LastGameTimer = GetGameTimer()
						isRadarExtended = true
					elseif isRadarExtended then
						SetRadarBigmapEnabled(false, false)
						LastGameTimer = 0
						isRadarExtended = false
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function() --Scoreboard (Thanks To ash [forum.FiveM.net])
	RequestStreamedTextureDict("mplobby")
	RequestStreamedTextureDict("mpleaderboard")
	while true do
		Citizen.Wait(0)
		if Scoreboard then
			for k, v in pairs( SettingsScoreboard ) do
				if type( k ) == "number" and v == true then
					if IsControlJustReleased( 0, k ) then
						if not isScoreboardShowing and not isRadarExtended then
							isScoreboardShowing = true
							LastGameTimer = GetGameTimer()
						elseif isScoreboardShowing and not isRadarExtended then
							isScoreboardShowing = false
							LastGameTimer = 0
						end
					end
				end
			end
			
			if isScoreboardShowing then
				DrawPlayerList()
			end
		end
	end
end)

Citizen.CreateThread(function() --Autoclosing Scoreboard and Extended Map
	while true do
		Citizen.Wait(0)
		if isScoreboardShowing or isRadarExtended then
			if GetGameTimer() > LastGameTimer + 5000 then
				isScoreboardShowing = false
				isRadarExtended = false
				SetRadarBigmapEnabled(false, false)
				LastGameTimer = 0
			end
		end
	end
end)

Citizen.CreateThread(function() --Death Message
    while true do
        Citizen.Wait(0)
		if IsPlayerDead(PlayerId()) then
			local PedKiller = GetPedKiller(GetPlayerPed(-1)) --Pointer to a Ped, Vehicle or Object
			local DeathCauseHash = GetPedCauseOfDeath(GetPlayerPed(-1)) --Weapon, Model or Object Hash
			local Killer = 999
			local text
			local KilledPlayer = PlayerId()
			
			if IsPedAPlayer(PedKiller) then
				Killer = NetworkGetPlayerIndexFromPed(PedKiller)
			else
				Killer = 999
			end
			
			if (DeathCauseHash == GetHashKey("WEAPON_RUN_OVER_BY_CAR") or DeathCauseHash == GetHashKey("WEAPON_RAMMED_BY_CAR")) then
				text = "flattened"
			elseif (DeathCauseHash == GetHashKey("WEAPON_CROWBAR")) or (DeathCauseHash == GetHashKey("WEAPON_BAT")) or
				   (DeathCauseHash == GetHashKey("WEAPON_HAMMER")) or (DeathCauseHash == GetHashKey("WEAPON_GOLFCLUB")) or
				   (DeathCauseHash == GetHashKey("WEAPON_NIGHTSTICK")) or (DeathCauseHash == GetHashKey("WEAPON_KNUCKLE")) or
				   (DeathCauseHash == GetHashKey("WEAPON_BATTLEAXE")) or (DeathCauseHash == GetHashKey("WEAPON_POOLCUE")) or
				   (DeathCauseHash == GetHashKey("WEAPON_HATCHET")) or (DeathCauseHash == GetHashKey("WEAPON_WRENCH")) or
				   (DeathCauseHash == GetHashKey("WEAPON_MACHETE")) then
				text = "whacked"
			elseif (DeathCauseHash == GetHashKey("WEAPON_DAGGER")) or (DeathCauseHash == GetHashKey("WEAPON_KNIFE")) or
				   (DeathCauseHash == GetHashKey("WEAPON_SWITCHBLADE")) or (DeathCauseHash == GetHashKey("WEAPON_BOTTLE")) then
				text = "stabbed"
			elseif (DeathCauseHash == GetHashKey("WEAPON_SNSPISTOL")) or (DeathCauseHash == GetHashKey("WEAPON_HEAVYPISTOL")) or
				   (DeathCauseHash == GetHashKey("WEAPON_VINTAGEPISTOL")) or (DeathCauseHash == GetHashKey("WEAPON_PISTOL")) or
				   (DeathCauseHash == GetHashKey("WEAPON_APPISTOL")) or (DeathCauseHash == GetHashKey("WEAPON_COMBATPISTOL")) or
				   (DeathCauseHash == GetHashKey("WEAPON_REVOLVER")) or (DeathCauseHash == GetHashKey("WEAPON_MACHINEPISTOL")) or
				   (DeathCauseHash == GetHashKey("WEAPON_MARKSMANPISTOL")) or (DeathCauseHash == GetHashKey("WEAPON_PISTOL_MK2")) then
				text = "shot"
			elseif (DeathCauseHash == GetHashKey("WEAPON_GRENADELAUNCHER")) or (DeathCauseHash == GetHashKey("WEAPON_HOMINGLAUNCHER")) or 
				   (DeathCauseHash == GetHashKey("VEHICLE_WEAPON_PLANE_ROCKET")) or (DeathCauseHash == GetHashKey("WEAPON_COMPACTLAUNCHER")) or 
				   (DeathCauseHash == GetHashKey("WEAPON_STICKYBOMB")) or( DeathCauseHash == GetHashKey("WEAPON_PROXMINE")) or 
				   (DeathCauseHash == GetHashKey("WEAPON_RPG")) or (DeathCauseHash == GetHashKey("WEAPON_EXPLOSION")) or 
				   (DeathCauseHash == GetHashKey("VEHICLE_WEAPON_TANK")) or (DeathCauseHash == GetHashKey("WEAPON_GRENADE")) or 
				   (DeathCauseHash == GetHashKey("WEAPON_RAILGUN")) or (DeathCauseHash == GetHashKey("WEAPON_FIREWORK")) or 
				   (DeathCauseHash == GetHashKey("WEAPON_PIPEBOMB")) or (DeathCauseHash == GetHashKey("VEHICLE_WEAPON_SPACE_ROCKET")) then
				text = "bombed"
			elseif (DeathCauseHash == GetHashKey("WEAPON_MICROSMG")) or (DeathCauseHash == GetHashKey("WEAPON_SMG")) or
				   (DeathCauseHash == GetHashKey("WEAPON_ASSAULTSMG")) or (DeathCauseHash == GetHashKey("WEAPON_MG")) or
				   (DeathCauseHash == GetHashKey("WEAPON_COMBATMG")) or (DeathCauseHash == GetHashKey("WEAPON_COMBATPDW")) or
				   (DeathCauseHash == GetHashKey("WEAPON_COMBATMG_MK2")) or (DeathCauseHash == GetHashKey("WEAPON_MINIGUN")) or
				   (DeathCauseHash == GetHashKey("WEAPON_SMG_MK2")) then
				text = "sprayed"
			elseif (DeathCauseHash == GetHashKey("WEAPON_ASSAULTRIFLE")) or (DeathCauseHash == GetHashKey("WEAPON_CARBINERIFLE")) or
				   (DeathCauseHash == GetHashKey("WEAPON_ADVANCEDRIFLE")) or (DeathCauseHash == GetHashKey("WEAPON_BULLPUPRIFLE")) or
				   (DeathCauseHash == GetHashKey("WEAPON_MARKSMANRIFLE")) or (DeathCauseHash == GetHashKey("WEAPON_COMPACTRIFLE")) or
				   (DeathCauseHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2")) or (DeathCauseHash == GetHashKey("WEAPON_CARBINERIFLE_MK2")) or
				   (DeathCauseHash == GetHashKey("WEAPON_SPECIALCARBINE")) or (DeathCauseHash == GetHashKey("WEAPON_GUSENBERG")) then
				text = "rifled"
			elseif (DeathCauseHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2")) or (DeathCauseHash == GetHashKey("WEAPON_SNIPERRIFLE")) or
				   (DeathCauseHash == GetHashKey("WEAPON_HEAVYSNIPER")) or (DeathCauseHash == GetHashKey("WEAPON_ASSAULTSNIPER")) or
				   (DeathCauseHash == GetHashKey("WEAPON_REMOTESNIPER")) then
				text = "sniped"
			elseif (DeathCauseHash == GetHashKey("WEAPON_BULLPUPSHOTGUN")) or (DeathCauseHash == GetHashKey("WEAPON_ASSAULTSHOTGUN")) or
				   (DeathCauseHash == GetHashKey("WEAPON_PUMPSHOTGUN")) or (DeathCauseHash == GetHashKey("WEAPON_HEAVYSHOTGUN")) or
				   (DeathCauseHash == GetHashKey("WEAPON_SAWNOFFSHOTGUN")) then
				text = "shotgunned"
			elseif (DeathCauseHash == GetHashKey("WEAPON_MOLOTOV")) or (DeathCauseHash == GetHashKey("WEAPON_FLAREGUN")) then
				text = "torched"
			else
				text = "killed"
			end
			
			TriggerServerEvent("DeathMessage", Killer, text, KilledPlayer)
		end
	end
end)

Citizen.CreateThread(function() --Voice Chat
    while true do
        Citizen.Wait(0)
		NetworkSetVoiceActive(VoiceChat)
	end
end)

Citizen.CreateThread(function() --Voice Chat Proximity
    while true do
        Citizen.Wait(0)
		NetworkSetTalkerProximity(VoiceChatProximity)
	end
end)

AddEventHandler("JoinMessageClients", function(name) --Join Message Event
	if JoinMessage then
		drawNotification("~bold~~d~" .. name .. "~bold~ ~s~" .. JoinedMessage)
	end
end)

AddEventHandler("LeftMessageClients", function(name) --Left Message Event
	if LeftMessage then
		drawNotification("~bold~~d~" .. name .. "~bold~ ~s~" .. LeftMessage)
	end
end)

AddEventHandler("DeathMessageClients", function(Killer, text, KilledPlayer) --Death Message Event
	if DeathMessage then
		if KilledPlayer == PlayerId() then
			if Killer == PlayerId() or Killer == 999 then
				drawNotification("You died.")
			elseif Killer ~= KilledPlayer and Killer ~= 999 then
				drawNotification("~bold~~o~" .. GetPlayerName(Killer) .. "~bold~ ~s~" .. text .. " you.")
			end
		elseif Killer == PlayerId() then
			drawNotification("You " .. text .. " ~bold~~o~" .. GetPlayerName(KilledPlayer) .. "~bold~")
		elseif KilledPlayer ~= PlayerId() then
			if Killer == 999 or Killer == KilledPlayer then
				drawNotification("~bold~~o~" .. GetPlayerName(KilledPlayer) .. "~bold~ ~s~died.")
			elseif Killer ~= 999 or Killer ~= KilledPlayer then
				drawNotification("~bold~~o~" .. GetPlayerName(Killer) .. "~bold~~s~ " .. text .. " ~bold~~o~" .. GetPlayerName(KilledPlayer) .. "~bold~")
			end			
		end
	end
end)


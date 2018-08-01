vehgodmode = false; flyingvehicle = false; reducevehgrip = false; vehicleVisible = true; gravity = true; boosthorn = false
bunnyhop = false; DriveOnWater = false; seatbelt = false
local frontleft, frontright, rearleft, rearright, hood
local trunk, back, back2, doorName; door = 0

Citizen.CreateThread(function() --Vehicle Menu
	while true do
		if (vehicleMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionvehicleMenu
			else
				lastSelectionvehicleMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. VehicleMenuTitle .. "")

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. SpawnVehicleTitle .. "", function(cb)
				if (cb) then
					vehicleMenu = false
					spawnMenu1 = true
				end
			end)

			TriggerEvent("FMODT:Bool", BoostOnHornTitle, boosthorn, function(cb)
				boosthorn = cb
				if boosthorn then
					drawNotification("~g~" .. BoostOnHornEnableMessage .. "!")
				else
					drawNotification("~r~" .. BoostOnHornDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Bool", BunnyHopTitle, bunnyhop, function(cb)
				bunnyhop = cb
				if bunnyhop then
					drawNotification("~g~" .. BunnyHopEnableMessage .. "")
				else
					drawNotification("~r~" .. BunnyHopDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Option", DeleteTitle, function(cb)
				if (cb) then
					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityAsMissionEntity(Object, 1, 1)
						DeleteEntity(Object)
						SetEntityAsMissionEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, 1)
						DeleteEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false))
					else
						drawNotification("~r~" .. NotDriverOfAVehicleMessage .. "!")
					end
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. DoorsTitle .. "", function(cb)
				if (cb) then
					vehicleMenu = false
					doorsMenu = true
				end
			end)

			TriggerEvent("FMODT:Bool", DriveOnWaterTitle, DriveOnWater, function(cb)
				DriveOnWater = cb
				if DriveOnWater then
					drawNotification("~g~" .. DriveOnWaterEnableMessage .. "!")
				else
					drawNotification("~r~" .. DriveOnWaterDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Option", FixAndCleanTitle, function(cb)
				if (cb) then
					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
						SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
						SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
						SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
						Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
					else
						drawNotification("~r~" .. NotDriverOfAVehicleMessage .. "!")
					end
				end
			end)

			TriggerEvent("FMODT:Option", FlipTitle, function(cb)
				if (cb) then
					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetVehicleOnGroundProperly(GetVehiclePedIsIn(GetPlayerPed(-1), false))
					else
						drawNotification("~r~" .. NotDriverOfAVehicleMessage .. "!")
					end
				end
			end)

			TriggerEvent("FMODT:Option", FuckUpTitle, function(cb)
				if (cb) then
					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						StartVehicleAlarm(GetVehiclePedIsIn(GetPlayerPed(-1), false))
						DetachVehicleWindscreen(GetVehiclePedIsIn(GetPlayerPed(-1), false))
						SmashVehicleWindow(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
						SmashVehicleWindow(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1)
						SmashVehicleWindow(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2)
						SmashVehicleWindow(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3)
						SetVehicleTyreBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0, true, 1000.0)
						SetVehicleTyreBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, true, 1000.0)
						SetVehicleTyreBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2, true, 1000.0)
						SetVehicleTyreBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3, true, 1000.0)
						SetVehicleTyreBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4, true, 1000.0)
						SetVehicleTyreBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5, true, 1000.0)
						SetVehicleTyreBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4, true, 1000.0)
						SetVehicleTyreBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7, true, 1000.0)
						SetVehicleDoorBroken(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0, true)
						SetVehicleDoorBroken(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, true)
						SetVehicleDoorBroken(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2, true)
						SetVehicleDoorBroken(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3, true)
						SetVehicleDoorBroken(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4, true)
						SetVehicleDoorBroken(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5, true)
						SetVehicleDoorBroken(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6, true)
						SetVehicleDoorBroken(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7, true)
						SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1)
						Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 1)
						SetVehicleNumberPlateTextIndex(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5)
						SetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false), "ANALSWAG")
						SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10.0)
						SetVehicleModColor_1(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1)
						SetVehicleModColor_2(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1)
						SetVehicleCustomPrimaryColour(GetVehiclePedIsIn(GetPlayerPed(-1), false), 255, 51, 255)
						SetVehicleCustomSecondaryColour(GetVehiclePedIsIn(GetPlayerPed(-1), false), 255, 51, 255)
						SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), true)
					else
						drawNotification("~r~" .. NotDriverOfAVehicleMessage .. "!")
					end
				end
			end)

			TriggerEvent("FMODT:Bool", FlyingVehicleTitle, flyingvehicle, function(cb)
				flyingvehicle = cb
				if flyingvehicle then
					drawNotification("~g~" .. FlyingVehicleEnableMessage .. "!")
				else
					drawNotification("~r~" .. FlyingVehicleDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Bool", VehicleGodmodeTitle, vehgodmode, function(cb)
				vehgodmode = cb
				SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
				SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
				SetVehicleEngineHealth(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1000.0)
				if vehgodmode then
					drawNotification("~g~" .. VehicleGodmodeEnableMessage .. "!")
				else
					drawNotification("~r~" .. VehicleGodmodeDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Bool", GravityTitle, gravity, function(cb)
				gravity = cb
				if gravity then
					drawNotification("~g~" .. GravityEnableMessage .. "!")
				else
					drawNotification("~r~" .. GravityDisableMessage .. "!")
				end
			end)

			if IsUsingSteam then
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. SavedVehiclesTitle .. "", function(cb)
					if (cb) then
						vehicleMenu = false
						vehicleSavedMenu = true
					end
				end)
			end

			TriggerEvent("FMODT:Bool", SeatbeltTitle, seatbelt, function(cb)
				seatbelt = cb
				if seatbelt then
					drawNotification("~g~" .. SeatbeltEnableMessage .. "!")
				else
					drawNotification("~r~" .. SeatbeltDisableMessage .. "!")
				end
			end)

			if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. TuningModifyingTitle .. "", function(cb)
					if (cb) then
						vehicleMenu = false
						tuningMenu = true
					end
				end)
			end

			TriggerEvent("FMODT:Bool", ReduceGripTitle, reducevehgrip, function(cb)
				reducevehgrip = cb
				if reducevehgrip then
					drawNotification("~g~" .. ReduceGripEnableMessage .. "!")
				else
					drawNotification("~r~" .. ReduceGripDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Bool", VehicleVisibleTitle, vehicleVisible, function(cb)
				vehicleVisible = cb
				if vehicleVisible then
					drawNotification("~g~" .. VehicleVisibleEnableMessage .. "!")
				else
					drawNotification("~r~" .. VehicleVisibleDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Doors Menu
	while true do
	
		if (doorsMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectiondoorsMenu
			else
				lastSelectiondoorsMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. DoorsTitle .. "")

			TriggerEvent("FMODT:Int", "" .. DoorTitle .. ": ~y~" .. doorName, door, 0, 7, function(cb)
				door = cb
			end)
			
			TriggerEvent("FMODT:Option", DoorOpenCloseTitle, function(cb)
				if (cb) then
					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						if GetVehicleDoorAngleRatio(GetVehiclePedIsIn(GetPlayerPed(-1), false), door) > 0.0 then 
							SetVehicleDoorShut(GetVehiclePedIsIn(GetPlayerPed(-1), false), door, false)
							drawNotification("~r~" .. doorName .. " - " .. DoorClosedMessage .. "!")
						else
							SetVehicleDoorOpen(GetVehiclePedIsIn(GetPlayerPed(-1), false), door, false)
							if door == 0 then
								frontleft = true
							elseif door == 1 then
								frontright = true
							elseif door == 2 then
								rearleft = true
							elseif door == 3 then
								rearright = true
							elseif door == 4 then
								hood = true
							elseif door == 5 then
								trunk = true
							elseif door == 6 then
								back = true
							elseif door == 7 then
								back2 = true
							end
						end
					else
						drawNotification("~r~" .. NotDriverOfAVehicleMessage .. "!")
					end
				end
			end)

			TriggerEvent("FMODT:Option", DoorOpenAllTitle, function(cb)
				if (cb) then
					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						for i = 0, 7 do
							SetVehicleDoorOpen(GetVehiclePedIsIn(GetPlayerPed(-1), false), i, false)
						end
						if GetVehicleDoorAngleRatio(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) == 0.0 then
							drawNotification("~g~" .. DoorOpenAllMessage1 .. "!")
						else
							drawNotification("~r~" .. DoorOpenAllMessage2 .. "!")
						end
					else
						drawNotification("~r~" .. NotDriverOfAVehicleMessage .. "!")
					end
				end
			end)

			TriggerEvent("FMODT:Option", DoorCloseAllTitle, function(cb)
				if (cb) then
					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						for i = 0, 7 do
							SetVehicleDoorShut(GetVehiclePedIsIn(GetPlayerPed(-1), false), i, false)
						end
						if GetVehicleDoorAngleRatio(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) ~= 0.0 then
							drawNotification("~g~" .. DoorCloseAllMessage1 .. "!")
						else
							drawNotification("~r~" .. DoorCloseAllMessage2 .. "!")
						end
					else
						drawNotification("~r~" .. NotDriverOfAVehicleMessage .. "!")
					end
				end
			end)

			TriggerEvent("FMODT:Option", DoorRepairAllTitle, function(cb)
				if (cb) then
					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						local fixed
						for i = 0, 7 do
							if IsVehicleDoorDamaged(GetVehiclePedIsIn(GetPlayerPed(-1), false), i) then
								SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
								fixed = true
							end
						end
						if fixed then
							drawNotification("~g~" .. DoorRepairAllMessage1 .. "!")
							fixed = false
						else
							drawNotification("~r~" .. DoorRepairAllMessage2 .. "!")
						end
					else
						drawNotification("~r~" .. NotDriverOfAVehicleMessage .. "!")
					end
				end
			end)

			TriggerEvent("FMODT:Option", DoorDestroyAllTitle, function(cb)
				if (cb) then
					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						local destroyed
						for i = 0, 7 do
							if not IsVehicleDoorDamaged(GetVehiclePedIsIn(GetPlayerPed(-1), false), i) then
								SetVehicleDoorBroken(GetVehiclePedIsIn(GetPlayerPed(-1), false), i, false)
								destroyed = true
							end
						end
						if destroyed then
							drawNotification("~g~" .. DoorDestroyAllMessage1 .. "!")
							destroyed = false
						else
							drawNotification("~r~" .. DoorDestroyAllMessage2 .. "!")
						end
					else
						drawNotification("~r~" .. NotDriverOfAVehicleMessage .. "!")
					end
				end
			end)

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Door Name
	while true do
		Citizen.Wait(0)
		if door == 0 then
			doorName = DoorNameFrontLeft
		elseif door == 1 then
			doorName = DoorNameFrontRight
		elseif door == 2 then
			doorName = DoorNameRearLeft
		elseif door == 3 then
			doorName = DoorNameRearRight
		elseif door == 4 then
			doorName = DoorNameHood
		elseif door == 5 then
			doorName = DoorNameTrunk
		elseif door == 6 then
			doorName = DoorNameBack
		elseif door == 7 then
			doorName = DoorNameBack2
		end
	end
end)

Citizen.CreateThread(function() --Door Messages
	while true do
		Citizen.Wait(0)

		if frontleft then --Front Left Door Message
			Citizen.Wait(50)
			if GetVehicleDoorAngleRatio(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) == 0.0 then
				drawNotification("~r~" .. DoorNameFrontLeft .. " - " .. NotExisting .. "!")
			else
				drawNotification("~g~" .. DoorNameFrontLeft .. " - " .. DoorOpenedMessage .. "!")
			end
			frontleft = false
		elseif frontright then --Front Right Door Message
			Citizen.Wait(50)
			if GetVehicleDoorAngleRatio(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1) == 0.0 then
				drawNotification("~r~" .. DoorNameFrontRight .. " - " .. NotExisting .. "!")
			else
				drawNotification("~g~" .. DoorNameFrontRight .. " - " .. DoorOpenedMessage .. "!")
			end
			frontright = false
		elseif rearleft then --Rear Left Door Message
			Citizen.Wait(50)
			if GetVehicleDoorAngleRatio(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2) == 0.0 then
				drawNotification("~r~" .. DoorNameRearLeft .. " - " .. NotExisting .. "!")
			else
				drawNotification("~g~" .. DoorNameRearLeft .. " - " .. DoorOpenedMessage .. "!")
			end
			rearleft = false
		elseif rearright then --Rear Right Door Message
			Citizen.Wait(50)
			if GetVehicleDoorAngleRatio(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3) == 0.0 then
				drawNotification("~r~" .. DoorNameRearRight .. " - " .. NotExisting .. "!")
			else
				drawNotification("~g~" .. DoorNameRearRight .. " - " .. DoorOpenedMessage .. "!")
			end
			rearright = false
		elseif hood then --Hood Message
			Citizen.Wait(50)
			if GetVehicleDoorAngleRatio(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4) == 0.0 then
				drawNotification("~r~" .. DoorNameHood .. " - " .. NotExisting .. "!")
			else
				drawNotification("~g~" .. DoorNameHood .. " - " .. DoorOpenedMessage .. "!")
			end
			hood = false
		elseif trunk then --Trunk Message
			Citizen.Wait(50)
			if GetVehicleDoorAngleRatio(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5) == 0.0 then
				drawNotification("~r~" .. DoorNameTrunk .. " - " .. NotExisting .. "!")
			else
				drawNotification("~g~" .. DoorNameTrunk .. " - " .. DoorOpenedMessage .. "!")
			end
			trunk = false
		elseif back then --Back Message
			Citizen.Wait(50)
			if GetVehicleDoorAngleRatio(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6) == 0.0 then
				drawNotification("~r~" .. DoorNameBack .. " - " .. NotExisting .. "!")
			else
				drawNotification("~g~" .. DoorNameBack .. " - " .. DoorOpenedMessage .. "!")
			end
			back = false
		elseif back2 then --Back 2 Message
			Citizen.Wait(50)
			if GetVehicleDoorAngleRatio(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7) == 0.0 then
				drawNotification("~r~" .. DoorNameBack2 .. " - " .. NotExisting .. "!")
			else
				drawNotification("~g~" .. DoorNameBack2 .. " - " .. DoorOpenedMessage .. "!")
			end
			back2 = false
		end
	end
end)

Citizen.CreateThread(function() --Godmode
	local count = 0
	while true do
		Citizen.Wait(0)
		if not vehgodmode and count == 1 and allowed then
			if IsPedInAnyVehicle(GetPlayerPed(-1), false) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1) == GetPlayerPed(-1)) then
				SetVehicleCanBeVisiblyDamaged(GetVehiclePedIsIn(GetPlayerPed(-1), false), true)
				SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), true)
				SetEntityInvincible(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
				SetEntityProofs(GetVehiclePedIsIn(GetPlayerPed(-1), false), false, false, false, false, false, false, false, false)
				SetVehicleWheelsCanBreak(GetVehiclePedIsIn(GetPlayerPed(-1), false), true)
				SetVehicleExplodesOnHighExplosionDamage(GetVehiclePedIsIn(GetPlayerPed(-1), false), true)
				SetEntityOnlyDamagedByPlayer(GetVehiclePedIsIn(GetPlayerPed(-1), false), true)
				SetEntityCanBeDamaged(GetVehiclePedIsIn(GetPlayerPed(-1), false), true)
				count = 0
			end
		elseif vehgodmode and allowed then
			if IsPedInAnyVehicle(GetPlayerPed(-1), false) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1) == GetPlayerPed(-1)) then
				SetVehicleCanBeVisiblyDamaged(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
				SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
				SetEntityInvincible(GetVehiclePedIsIn(GetPlayerPed(-1), false), true)
				SetEntityProofs(GetVehiclePedIsIn(GetPlayerPed(-1), false), true, true, true, true, true, true, true, true)
				SetVehicleWheelsCanBreak(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
				SetVehicleExplodesOnHighExplosionDamage(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
				SetEntityOnlyDamagedByPlayer(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
				SetEntityCanBeDamaged(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
				SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
				RemoveDecalsFromVehicle(GetVehiclePedIsIn(GetPlayerPed(-1), false))
				count = 1
			end
		end
	end
end)

Citizen.CreateThread(function() --Flying Vehicle
	while true do
		Citizen.Wait(0)
		local Speed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
		local Rot = GetEntityRotation(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2)
		if Speed < 10.0 then
			Speed = Speed + 15.0
		end
		if flyingvehicle and allowed then
			if IsPedInAnyVehicle(GetPlayerPed(-1), false) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1) == GetPlayerPed(-1)) then
				SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("WEAPON_UNARMED"), true)
				if (IsControlPressed(1, 21) and not GetLastInputMethod(2)) or (IsControlPressed(1, 22) and GetLastInputMethod(2)) then --Instant Stop
					SetVehicleForwardSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
				elseif IsControlPressed(1, 71) then --Forward
					SetVehicleForwardSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false), Speed * 1.01)
				elseif IsControlPressed(1, 72) then --Backward
					SetVehicleForwardSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false), -70.0)
				end
				if not IsPedInAnyHeli(GetPlayerPed(-1)) and not IsPedInAnyPlane(GetPlayerPed(-1)) then
					if (IsControlPressed(1, 89) and not GetLastInputMethod(2)) or (IsControlPressed(1, 108) and GetLastInputMethod(2)) then --Left (Everything Else than Helicopters and Planes)
						SetEntityRotation(GetVehiclePedIsIn(GetPlayerPed(-1), false), Rot.x, Rot.y, Rot.z + 0.5, 2, 1)
					elseif (IsControlPressed(1, 90) and not GetLastInputMethod(2)) or (IsControlPressed(1, 109) and GetLastInputMethod(2)) then --Right (Everything Else than Helicopters and Planes)
						SetEntityRotation(GetVehiclePedIsIn(GetPlayerPed(-1), false), Rot.x, Rot.y, Rot.z - 0.5, 2, 1)
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function() --Reducing Grip
	while true do
		Citizen.Wait(0)
		if IsPedInAnyVehicle(GetPlayerPed(-1), false) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1) == GetPlayerPed(-1)) and allowed then
			SetVehicleReduceGrip(GetVehiclePedIsIn(GetPlayerPed(-1), false), reducevehgrip)
		end
	end
end)

Citizen.CreateThread(function() --Visibility
	while true do
		Citizen.Wait(0)
		if IsPedInAnyVehicle(GetPlayerPed(-1), false) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1) == GetPlayerPed(-1)) and allowed then
			SetEntityVisible(GetVehiclePedIsIn(GetPlayerPed(-1), false), vehicleVisible, 0)
		end
	end
end)

Citizen.CreateThread(function() --Gravity
	while true do
		Citizen.Wait(0)
		if IsPedInAnyVehicle(GetPlayerPed(-1), false) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1) == GetPlayerPed(-1)) and allowed then
			SetVehicleGravity(GetVehiclePedIsIn(GetPlayerPed(-1), false), gravity)
		end
	end
end)

Citizen.CreateThread(function() --Boost On Horn
	while true do
		Citizen.Wait(0)
		if boosthorn and allowed then
			if IsPedInAnyVehicle(GetPlayerPed(-1), false) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1) == GetPlayerPed(-1)) then
				if IsControlPressed(1, 71) and IsControlPressed(1, 86) then
					SetVehicleBoostActive(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, 0)
					SetVehicleForwardSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false), 75.0)
					StartScreenEffect("RaceTurbo", 0, 0)
				elseif IsControlPressed(1, 72) and IsControlPressed(1, 86) then
					SetVehicleBoostActive(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, 0)
					SetVehicleForwardSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false), -75.0)
				end
				SetVehicleBoostActive(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0, 0)
			end
		end
	end
end)

Citizen.CreateThread(function() --Bunny Hop
	while true do
		Citizen.Wait(0)
		if bunnyhop and allowed then
			if IsPedInAnyVehicle(GetPlayerPed(-1), false) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1) == GetPlayerPed(-1)) and IsVehicleOnAllWheels(GetVehiclePedIsIn(GetPlayerPed(-1), false)) and IsControlJustReleased(1, 21) and not IsControlPressed(1, 289) then
				ApplyForceToEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, 0.0, 0.0, 12.5, 0.0, 0.0, 0.0, 1, true, true, true, true, true)
			end
		end
	end
end)

Citizen.CreateThread(function() --Drive On Water
	while true do
		Citizen.Wait(0)
		local prop = "stt_prop_stunt_track_straight"
		local propHash = GetHashKey(prop)
		local playerPed = GetPlayerPed(-1)
		local playerPedPos = GetEntityCoords(GetPlayerPed(-1), 1)
		local WaterObject = GetClosestObjectOfType(playerPedPos.x, playerPedPos.y, playerPedPos.z, 300.0, propHash, 1, 0, 1)
		local bool, NewZ = GetWaterHeight(playerPedPos.x, playerPedPos.y, playerPedPos.z)
		local FolowWaves = true

		if not bool then
			if DoesEntityExist(WaterObject) then
				SetEntityAsMissionEntity(WaterObject, 1, 1)
				DeleteEntity(WaterObject)
			end
		elseif not DoesEntityExist(WaterObject) and DriveOnWater then
			RequestModel(propHash)
			while not HasModelLoaded(propHash) do
				Citizen.Wait(0)
			end
			WaterObject = CreateObject(propHash, playerPedPos.x, playerPedPos.y, playerPedPos.z, true, false, true)
			SetEntityRotation(WaterObject, 0.0, 90.0, 0.0, 2, true)
			FreezeEntityPosition(WaterObject, 1)
			SetEntityVisible(WaterObject, 0)
		elseif DoesEntityExist(WaterObject) and DriveOnWater then
			SetWavesIntensity(0.01)
			if FolowWaves then
				local SecondBool, SecondNewZ = GetWaterHeight(playerPedPos.x, playerPedPos.y, playerPedPos.z)
				if math.abs(NewZ) - math.abs(SecondNewZ) >= 3 then
					bool, NewZ = GetWaterHeight(playerPedPos.x, playerPedPos.y, playerPedPos.z)
				end
			else
				local bool, height = GetWaterHeightNoWaves(playerPedPos.x, playerPedPos.y, playerPedPos.z)
				NewZ = (height + 0.5)
			end
			SetEntityCoords(WaterObject, playerPedPos.x, playerPedPos.y, NewZ - 7.25, 1, 0, 0, 1)
		end
	end
end)

Citizen.CreateThread(function() --Seatbelt
	while true do
		Citizen.Wait(0)
		if seatbelt and allowed then
			if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
				SetPedCanBeKnockedOffVehicle(GetPlayerPed(-1), 1)
				SetPedConfigFlag(GetPlayerPed(-1), 32, false)
				if IsPedRagdoll(GetPlayerPed(-1)) then
					SetPedIntoVehicle(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), -1)
				end
			end
		end
	end
end)


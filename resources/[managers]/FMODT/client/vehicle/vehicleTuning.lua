neoncolor = {}; vehiclecol = {}; extracol = {}
local neonleft, neonright, neonfront, neonrear, setPlateText, CustomColor; Power = 1.0; Torque = 1.0
local CustomColorNeon, modColor, colorIndex, setColor, vehicle
local rainbowneons = false; rainbowvehicle = false; rainbowtire = false; rainbowneonsTrailer = false
local rainbowtrailer = false; rainbowtireTrailer = false; tireproof = false; customtire = false
local turbo = false; xenon = false; tireproof = false; plateText = "PLACEHOLDER"; R = 0; G = 0; B = 0

Citizen.CreateThread(function() --Tuning Menu
	while true do
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(GetVehiclePedIsIn(GetPlayerPed(-1), false))
		if (tuningMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectiontuningMenu
			else
				lastSelectiontuningMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. TuningModifyingTitle .. "")

			TriggerEvent("FMODT:Option", UpgradeTitle, function(cb) --Upgrade Vehicle
				if (cb) then
					ClearVehicleCustomPrimaryColour(GetVehiclePedIsIn(GetPlayerPed(-1), false))
					ClearVehicleCustomSecondaryColour(GetVehiclePedIsIn(GetPlayerPed(-1), false))
					SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
					SetVehicleWheelType(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) - 1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1) - 1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2) - 1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3) - 1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4) - 1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5) - 1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6) - 1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7) - 1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8) - 1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9) - 1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10) - 1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11) - 1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12) - 1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13) - 1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 14, 16, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15) - 2, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16) - 1, false)
					ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 17, true)
					ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 18, true)
					ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 19, true)
					ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 20, true)
					ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 21, true)
					ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 22, true)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 23, 1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 24, 1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 25, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 25) - 1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 27, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 27) - 1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 28, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 28) - 1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 30, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 30) - 1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 33, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 33) - 1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 34, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 34) - 1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 35, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 35) - 1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 38, GetNumVehicleMods(GetVehiclePedIsIn(GetPlayerPed(-1), false), 38) - 1, true)
					SetVehicleTyreSmokeColor(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0, 0, 127)
					SetVehicleWindowTint(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1)
					SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
					SetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false), "T0XIN")
					SetVehicleNumberPlateTextIndex(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5)
					SetVehicleModColor_1(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4, 12, 0)
					SetVehicleModColor_2(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4, 12)
					SetVehicleColours(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12, 12)
					SetVehicleExtraColours(GetVehiclePedIsIn(GetPlayerPed(-1), false), 70, 141)
				end
			end)

			if GotTrailer then --Upgrade Trailer
				TriggerEvent("FMODT:Option", UpgradeTrailerTitle, function(cb) --Upgrade Trailer
					if (cb) then
						ClearVehicleCustomPrimaryColour(TrailerHandle)
						ClearVehicleCustomSecondaryColour(TrailerHandle)
						SetVehicleModKit(TrailerHandle, 0)
						SetVehicleWheelType(TrailerHandle, 7)
						SetVehicleMod(TrailerHandle, 0, GetNumVehicleMods(TrailerHandle, 0) - 1, false)
						SetVehicleMod(TrailerHandle, 1, GetNumVehicleMods(TrailerHandle, 1) - 1, false)
						SetVehicleMod(TrailerHandle, 2, GetNumVehicleMods(TrailerHandle, 2) - 1, false)
						SetVehicleMod(TrailerHandle, 3, GetNumVehicleMods(TrailerHandle, 3) - 1, false)
						SetVehicleMod(TrailerHandle, 4, GetNumVehicleMods(TrailerHandle, 4) - 1, false)
						SetVehicleMod(TrailerHandle, 5, GetNumVehicleMods(TrailerHandle, 5) - 1, false)
						SetVehicleMod(TrailerHandle, 6, GetNumVehicleMods(TrailerHandle, 6) - 1, false)
						SetVehicleMod(TrailerHandle, 7, GetNumVehicleMods(TrailerHandle, 7) - 1, false)
						SetVehicleMod(TrailerHandle, 8, GetNumVehicleMods(TrailerHandle, 8) - 1, false)
						SetVehicleMod(TrailerHandle, 9, GetNumVehicleMods(TrailerHandle, 9) - 1, false)
						SetVehicleMod(TrailerHandle, 10, GetNumVehicleMods(TrailerHandle, 10) - 1, false)
						SetVehicleMod(TrailerHandle, 11, GetNumVehicleMods(TrailerHandle, 11) - 1, false)
						SetVehicleMod(TrailerHandle, 12, GetNumVehicleMods(TrailerHandle, 12) - 1, false)
						SetVehicleMod(TrailerHandle, 13, GetNumVehicleMods(TrailerHandle, 13) - 1, false)
						SetVehicleMod(TrailerHandle, 14, 16, false)
						SetVehicleMod(TrailerHandle, 15, GetNumVehicleMods(TrailerHandle, 15) - 2, false)
						SetVehicleMod(TrailerHandle, 16, GetNumVehicleMods(TrailerHandle, 16) - 1, false)
						ToggleVehicleMod(TrailerHandle, 17, true)
						ToggleVehicleMod(TrailerHandle, 18, true)
						ToggleVehicleMod(TrailerHandle, 19, true)
						ToggleVehicleMod(TrailerHandle, 20, true)
						ToggleVehicleMod(TrailerHandle, 21, true)
						ToggleVehicleMod(TrailerHandle, 22, true)
						SetVehicleMod(TrailerHandle, 23, 1, false)
						SetVehicleMod(TrailerHandle, 24, 1, false)
						SetVehicleMod(TrailerHandle, 25, GetNumVehicleMods(TrailerHandle, 25) - 1, false)
						SetVehicleMod(TrailerHandle, 27, GetNumVehicleMods(TrailerHandle, 27) - 1, false)
						SetVehicleMod(TrailerHandle, 28, GetNumVehicleMods(TrailerHandle, 28) - 1, false)
						SetVehicleMod(TrailerHandle, 30, GetNumVehicleMods(TrailerHandle, 30) - 1, false)
						SetVehicleMod(TrailerHandle, 33, GetNumVehicleMods(TrailerHandle, 33) - 1, false)
						SetVehicleMod(TrailerHandle, 34, GetNumVehicleMods(TrailerHandle, 34) - 1, false)
						SetVehicleMod(TrailerHandle, 35, GetNumVehicleMods(TrailerHandle, 35) - 1, false)
						SetVehicleMod(TrailerHandle, 38, GetNumVehicleMods(TrailerHandle, 38) - 1, true)
						SetVehicleTyreSmokeColor(TrailerHandle, 0, 0, 127)
						SetVehicleWindowTint(TrailerHandle, 1)
						SetVehicleTyresCanBurst(TrailerHandle, false)
						SetVehicleNumberPlateText(TrailerHandle, "T0XIN")
						SetVehicleNumberPlateTextIndex(TrailerHandle, 5)
						SetVehicleModColor_1(TrailerHandle, 4, 12, 0)
						SetVehicleModColor_2(TrailerHandle, 4, 12)
						SetVehicleColours(TrailerHandle, 12, 12)
						SetVehicleExtraColours(TrailerHandle, 70, 141)
					end
				end)
			end

			TriggerEvent("FMODT:Option", DowngradeTitle, function(cb) --Downgrade Vehicle
				if (cb) then
					SetVehicleModKit(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
					SetVehicleWheelType(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0, -1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 1, -1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 2, -1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 3, -1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4, -1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5, -1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 6, -1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 7, -1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 8, -1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 9, -1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 10, -1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 11, -1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 12, -1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 13, -1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 14, -1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 15, -1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 16, -1, false)
					ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 17, false)
					ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 18, false)
					ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 19, false)
					ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 20, false)
					ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 21, false)
					ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 22, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 23, 9, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 24, 9, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 25, -1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 27, -1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 28, -1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 30, -1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 33, -1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 34, -1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 35, -1, false)
					SetVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 38, -1, false)
					SetVehicleTyreSmokeColor(GetVehiclePedIsIn(GetPlayerPed(-1), false), 255, 102, 153)
					SetVehicleWindowTint(GetVehiclePedIsIn(GetPlayerPed(-1), false), 4)
					SetVehicleTyresCanBurst(GetVehiclePedIsIn(GetPlayerPed(-1), false), true)
					SetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false), "NO T0XIN")
					SetVehicleNumberPlateTextIndex(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5)
					SetVehicleModColor_1(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5, 1, 0)
					SetVehicleModColor_2(GetVehiclePedIsIn(GetPlayerPed(-1), false), 5, 1)
					SetVehicleCustomPrimaryColour(GetVehiclePedIsIn(GetPlayerPed(-1), false), 255, 51, 255)
					SetVehicleCustomSecondaryColour(GetVehiclePedIsIn(GetPlayerPed(-1), false), 255, 51, 255)
				end
			end)

			if GotTrailer then --Downgrade Trailer
				TriggerEvent("FMODT:Option", DowngradeTrailerTitle, function(cb) --Downgrade Trailer
					if (cb) then
						SetVehicleModKit(TrailerHandle, 0)
						SetVehicleWheelType(TrailerHandle, 4)
						SetVehicleMod(TrailerHandle, 0, -1, false)
						SetVehicleMod(TrailerHandle, 1, -1, false)
						SetVehicleMod(TrailerHandle, 2, -1, false)
						SetVehicleMod(TrailerHandle, 3, -1, false)
						SetVehicleMod(TrailerHandle, 4, -1, false)
						SetVehicleMod(TrailerHandle, 5, -1, false)
						SetVehicleMod(TrailerHandle, 6, -1, false)
						SetVehicleMod(TrailerHandle, 7, -1, false)
						SetVehicleMod(TrailerHandle, 8, -1, false)
						SetVehicleMod(TrailerHandle, 9, -1, false)
						SetVehicleMod(TrailerHandle, 10, -1, false)
						SetVehicleMod(TrailerHandle, 11, -1, false)
						SetVehicleMod(TrailerHandle, 12, -1, false)
						SetVehicleMod(TrailerHandle, 13, -1, false)
						SetVehicleMod(TrailerHandle, 14, -1, false)
						SetVehicleMod(TrailerHandle, 15, -1, false)
						SetVehicleMod(TrailerHandle, 16, -1, false)
						ToggleVehicleMod(TrailerHandle, 17, false)
						ToggleVehicleMod(TrailerHandle, 18, false)
						ToggleVehicleMod(TrailerHandle, 19, false)
						ToggleVehicleMod(TrailerHandle, 20, false)
						ToggleVehicleMod(TrailerHandle, 21, false)
						ToggleVehicleMod(TrailerHandle, 22, false)
						SetVehicleMod(TrailerHandle, 23, 9, false)
						SetVehicleMod(TrailerHandle, 24, 9, false)
						SetVehicleMod(TrailerHandle, 25, -1, false)
						SetVehicleMod(TrailerHandle, 27, -1, false)
						SetVehicleMod(TrailerHandle, 28, -1, false)
						SetVehicleMod(TrailerHandle, 30, -1, false)
						SetVehicleMod(TrailerHandle, 33, -1, false)
						SetVehicleMod(TrailerHandle, 34, -1, false)
						SetVehicleMod(TrailerHandle, 35, -1, false)
						SetVehicleMod(TrailerHandle, 38, -1, false)
						SetVehicleTyreSmokeColor(TrailerHandle, 255, 102, 153)
						SetVehicleWindowTint(TrailerHandle, 4)
						SetVehicleTyresCanBurst(TrailerHandle, true)
						SetVehicleNumberPlateText(TrailerHandle, "NO T0XIN")
						SetVehicleNumberPlateTextIndex(TrailerHandle, 5)
						SetVehicleModColor_1(TrailerHandle, 5, 1, 0)
						SetVehicleModColor_2(TrailerHandle, 5, 1)
						SetVehicleCustomPrimaryColour(TrailerHandle, 255, 51, 255)
						SetVehicleCustomSecondaryColour(TrailerHandle, 255, 51, 255)
					end
				end)
			end

			TriggerEvent("FMODT:Float", EnginePowerMultiplierTitle, Power, 0.1, 50.0, 2.5, 3, function(cb) --Engine Power Multiplier
				Power = cb
			end)

			TriggerEvent("FMODT:Float", EngineTorqueMultiplierTitle, Torque, 0.1, 50.0, 2.5, 4, function(cb) --Engine Torque Multiplier
				Torque = cb
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~Los Santos Customs", function(cb) --Los Santos Customs
				if (cb) then
					tuningMenu = false
					lscMenu = true
				end
			end)
			
			if GotTrailer then --Los Santos Customs (Trailer)
				TriggerEvent("FMODT:Option", "~y~>> ~s~Los Santos Customs (Trailer)", function(cb) --Los Santos Customs (Trailer)
					if (cb) then
						tuningMenu = false
						lscMenuTrailer = true
						lscMenu = true
					end
				end)
			end

			if (GetNumVehicleMods(vehicle, 25) > 0) or (GetNumVehicleMods(vehicle, 26) > 0) or (GetNumVehicleMods(vehicle, 27) > 0) or (GetNumVehicleMods(vehicle, 28) > 0)
			or (GetNumVehicleMods(vehicle, 29) > 0) or (GetNumVehicleMods(vehicle, 30) > 0) or (GetNumVehicleMods(vehicle, 31) > 0) or (GetNumVehicleMods(vehicle, 32) > 0) 
			or (GetNumVehicleMods(vehicle, 33) > 0) or (GetNumVehicleMods(vehicle, 34) > 0) or (GetNumVehicleMods(vehicle, 35) > 0) or (GetNumVehicleMods(vehicle, 36) > 0)
			or (GetNumVehicleMods(vehicle, 37) > 0) or (GetNumVehicleMods(vehicle, 38) > 0) or (GetNumVehicleMods(vehicle, 39) > 0) or (GetNumVehicleMods(vehicle, 40) > 0)
			or (GetNumVehicleMods(vehicle, 41) > 0) or (GetNumVehicleMods(vehicle, 42) > 0) or (GetNumVehicleMods(vehicle, 43) > 0) or (GetNumVehicleMods(vehicle, 44) > 0)
			or (GetNumVehicleMods(vehicle, 45) > 0) then
				TriggerEvent("FMODT:Option", "~y~>> ~s~Bennys Motorworks", function(cb) --Bennys Motorworks
					if (cb) then
						tuningMenu = false
						bmMenu = true
					end
				end)
			end

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. ExtrasTitle .. "", function(cb) --Vehicle Extras
				if (cb) then
					tuningMenu = false
					extraMenu = true
				end
			end)

			TriggerEvent("FMODT:Bool", RainbowVehicleTitle, rainbowvehicle, function(cb) --Rainbow Vehicle
				rainbowvehicle = cb
			end)
		
			if GotTrailer then --Rainbow Vehicle (Trailer)
				TriggerEvent("FMODT:Bool", RainbowVehicleTrailerTitle, rainbowtrailer, function(cb) --Rainbow Vehicle
					rainbowtrailer = cb
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Los Santos Customs Menu				[Multiple Pages]
	local windowTint = 1
	local windowTintName = {
							"None", StockTitle, 
							"Limo", "Light Smoke",
							"Dark Smoke", "Pure Black"
						   }
	local windowTintNumber = {
							  4, 0, 
							  5, 3,
							  2, 1
							 }

	 while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)

		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		turbo = IsToggleModOn(vehicle, 18)
		
		if (lscMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscMenu
			else
				lastSelectionlscMenu = currentOption
			end
		
			SetVehicleModKit(vehicle, 0)
			
			if GetVehicleWindowTint(vehicle) == 4 then
				windowTint = 1
			elseif GetVehicleWindowTint(vehicle) == 0 then
				windowTint = 2
			elseif GetVehicleWindowTint(vehicle) == 5 then
				windowTint = 3
			elseif GetVehicleWindowTint(vehicle) == 3 then
				windowTint = 4
			elseif GetVehicleWindowTint(vehicle) == 2 then
				windowTint = 5
			elseif GetVehicleWindowTint(vehicle) == 1 then
				windowTint = 6
			end
			
			TriggerEvent("FMODT:Title", "~y~Los Santos Customs")
			
			if GetNumVehicleMods(vehicle, 16) > 0 then --Armor
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. ArmorTitle, function(cb)
					if (cb) then
						lscMenu = false
						lscArmorMenu = true
					end
				end)
			end

			if GetNumVehicleMods(vehicle, 12) > 0 then --Brakes
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. BrakesTitle, function(cb)
					if (cb) then
						lscMenu = false
						lscBrakesMenu = true
					end
				end)
			end

			if GetNumVehicleMods(vehicle, 1) > 0 or GetNumVehicleMods(vehicle, 2) > 0 then --Bumper
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. BumperTitle, function(cb)
					if (cb) then
						lscMenu = false
						lscBumperMenu = true
					end
				end)
			end

			if GetNumVehicleMods(vehicle, 5) > 0 then --Chassis
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. ChassisTitle, function(cb)
					if (cb) then
						lscMenu = false
						lscFrameMenu = true
					end
				end)
			end

			if GetNumVehicleMods(vehicle, 11) > 0 then --Engine
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. EngineTitle, function(cb)
					if (cb) then
						lscMenu = false
						lscEngineMenu = true
					end
				end)
			end

			if GetNumVehicleMods(vehicle, 4) > 0 then --Exhaust
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. ExhaustTitle, function(cb)
					if (cb) then
						lscMenu = false
						lscExhaustMenu = true
					end
				end)
			end

			if GetNumVehicleMods(vehicle, 8) > 0 or GetNumVehicleMods(vehicle, 9) > 0 then --Fender
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. FenderTitle, function(cb)
					if (cb) then
						lscMenu = false
						lscFenderMenu = true
					end
				end)
			end

			if GetNumVehicleMods(vehicle, 6) > 0 then --Grille
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. GrilleTitle, function(cb)
					if (cb) then
						lscMenu = false
						lscGrilleMenu = true
					end
				end)
			end

			if GetNumVehicleMods(vehicle, 7) > 0 then --Hood
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. HoodTitle, function(cb)
					if (cb) then
						lscMenu = false
						lscHoodMenu = true
					end
				end)
			end

			if GetNumVehicleMods(vehicle, 14) > 0 and not lscMenuTrailer then --Horn
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. HornTitle, function(cb)
					if (cb) then
						lscMenu = false
						lscHornMenu = true
					end
				end)
			end

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. LightsTitle, function(cb) --Lights
				if (cb) then
					lscMenu = false
					lscLightMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. PlateTitle, function(cb) --Plate
				if (cb) then
					lscMenu = false
					lscPlateMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. ResparyTitle, function(cb) --Respary
				if (cb) then
					lscMenu = false
					lscColorMenu = true
				end
			end)

			if GetNumVehicleMods(vehicle, 10) > 0 then --Roof
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. RoofTitle, function(cb)
					if (cb) then
						lscMenu = false
						lscRoofMenu = true
					end
				end)
			end

			if GetNumVehicleMods(vehicle, 3) > 0 then --Side Skirt
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. SideSkirtTitle, function(cb)
					if (cb) then
						lscMenu = false
						lscSideSkirtMenu = true
					end
				end)
			end

			if GetNumVehicleMods(vehicle, 0) > 0 then --Spoiler
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. SpoilerTitle, function(cb)
					if (cb) then
						lscMenu = false
						lscSpoilerMenu = true
					end
				end)
			end

			if GetNumVehicleMods(vehicle, 15) > 0 then --Suspension
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. SuspensionTitle, function(cb)
					if (cb) then
						lscMenu = false
						lscSuspensionMenu = true
					end
				end)
			end

			if GetNumVehicleMods(vehicle, 13) > 0 then --Transmission
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. TransmissionTitle, function(cb)
					if (cb) then
						lscMenu = false
						lscTransmissionMenu = true
					end
				end)
			end

			TriggerEvent("FMODT:Bool", TurboTitle, turbo, function(cb) --Turbo
				turbo = cb
				ToggleVehicleMod(vehicle, 18, turbo)
				if turbo then
					drawNotification("~g~" .. TurboEnableMessage .. "!")
				else
					drawNotification("~r~" .. TurboDisableMessage .. "!")
				end
			end)
			
			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. WheelsTitle, function(cb) --Wheels
				if (cb) then
					lscMenu = false
					lscWheelMenu = true
				end
			end)

			if GetNumVehicleWindowTints() > 0 then --Window Tints
				TriggerEvent("FMODT:StringArray", WindowTintTitle .. ":", windowTintName, windowTint, function(cb)
					windowTint = cb
					SetVehicleWindowTint(vehicle, windowTintNumber[windowTint])
					drawNotification("~g~" .. WindowTintMessage .. "!")
				end)
			end

			TriggerEvent("FMODT:Update")
			
		elseif (lscBumperMenu) then
		
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscBumperMenu
			else
				lastSelectionlscBumperMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~Bumper")

			if GetNumVehicleMods(vehicle, 1) > 0 then
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. FrontBumperTitle, function(cb)
					if (cb) then
						lscBumperMenu = false
						lscBumperFMenu = true
					end
				end)
			end

			if GetNumVehicleMods(vehicle, 2) > 0 then
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. RearBumperTitle, function(cb)
					if (cb) then
						lscBumperMenu = false
						lscBumperRMenu = true
					end
				end)
			end

			TriggerEvent("FMODT:Update")
			
		elseif (lscFenderMenu) then
		
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscFenderMenu
			else
				lastSelectionlscFenderMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~Fender")

			if GetNumVehicleMods(vehicle, 8) > 0 then
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. FrontFenderTitle, function(cb)
					if (cb) then
						lscFenderMenu = false
						lscFenderFMenu = true
					end
				end)
			end

			if GetNumVehicleMods(vehicle, 9) > 0 then
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. RearFenderTitle, function(cb)
					if (cb) then
						lscFenderMenu = false
						lscFenderRMenu = true
					end
				end)
			end

			TriggerEvent("FMODT:Update")
			
		end
		
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --LSC Armor Menu
	local int
	local name
	local nameTable = {NoneTitle, ArmorTitle .. " 20%", ArmorTitle .. " 40%", ArmorTitle .. " 60%", ArmorTitle .. " 80%", ArmorTitle .. " 100%"}
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, 16)
		name = nameTable[int + 2]

		if (lscArmorMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscArmorMenu
			else
				lastSelectionlscArmorMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ArmorTitle)
			
			TriggerEvent("FMODT:Int", ArmorTitle, int, -1, 4, function(cb)
				int = cb
				name = nameTable[int + 2]
				SetVehicleMod(vehicle, 16, int)
			end)

			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. NoneTitle, function(cb)
					if (cb) then
						Citizen.Wait(1)
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
					drawNotification("~g~" .. name)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --LSC Brake Menu
	local int
	local name
	local nameTable = {StockTitle .. " " .. BrakesTitle, StreetTitle .. " " .. BrakesTitle, SportTitle .. " " .. BrakesTitle, RaceTitle .. " " .. BrakesTitle}
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)

		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, 12)
		name = nameTable[int + 2]
		
		if (lscBrakesMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscBrakesMenu
			else
				lastSelectionlscBrakesMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. BrakesTitle)
			
			TriggerEvent("FMODT:Int", BrakesTitle, int, -1, 2, function(cb)
				int = cb
				name = nameTable[int + 2]
				SetVehicleMod(vehicle, 12, int)
			end)

			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle, function(cb)
					if (cb) then
						Citizen.Wait(1)
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
					drawNotification("~g~" .. name)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --LSC Bumper (Front) Menu
	local int
	local name
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, 1)
		name = GetLabelText(GetModTextLabel(vehicle, 1, GetVehicleMod(vehicle, 1)))
		if (lscBumperFMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscBumperFMenu
			else
				lastSelectionlscBumperFMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. FrontBumperTitle)
			
			TriggerEvent("FMODT:Int", FrontBumperTitle, int, -1, (GetNumVehicleMods(vehicle, 1) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, 1, int)

				name = GetLabelText(GetModTextLabel(vehicle, 1, int))

				if name == "NULL" then
					name = BumperTitle .. " " .. int
				end
			end)

			if name == "NULL" then
				name = BumperTitle .. " " .. int
			end
			
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle, function(cb)
					if (cb) then
						Citizen.Wait(1)
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						Citizen.Wait(1)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --LSC Bumper (Rear) Menu
	local int
	local name
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, 2)
		name = GetLabelText(GetModTextLabel(vehicle, 2, GetVehicleMod(vehicle, 2)))
		
		if (lscBumperRMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscBumperRMenu
			else
				lastSelectionlscBumperRMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. RearBumperTitle)
			
			TriggerEvent("FMODT:Int", RearBumperTitle, int, -1, (GetNumVehicleMods(vehicle, 2) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, 2, int)
				name = GetLabelText(GetModTextLabel(vehicle, 2, int))
				if name == "NULL" then
					name = BumperTitle .. " " .. int
				end
			end)
			if name == "NULL" then
				name = BumperTitle .. " " .. int
			end
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle, function(cb)
					if (cb) then
						Citizen.Wait(1)
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						Citizen.Wait(1)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --LSC Chassis Menu
	local int
	local name
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, 5)
		name = GetLabelText(GetModTextLabel(vehicle, 5, GetVehicleMod(vehicle, 5)))
		
		if (lscFrameMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscChassisMenu
			else
				lastSelectionlscChassisMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ChassisTitle)
			
			TriggerEvent("FMODT:Int", ChassisTitle, int, -1, (GetNumVehicleMods(vehicle, 5) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, 5, int)
				name = GetLabelText(GetModTextLabel(vehicle, 5, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. NoneTitle, function(cb)
					if (cb) then
						Citizen.Wait(1)
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						Citizen.Wait(1)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --LSC Engine Menu
	local int
	local name
	local nameTable = {StockTitle .. " " .. EMSModeTitle, "Level 1 " .. EMSModeTitle, "Level 2 " .. EMSModeTitle, "Level 3 " .. EMSModeTitle, "Level 4 " .. EMSModeTitle}
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, 11)
		name = nameTable[int + 2]
		
		if (lscEngineMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscEngineMenu
			else
				lastSelectionlscEngineMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. EngineTitle)
			
			TriggerEvent("FMODT:Int", EMSModeTitle, int, -1, (GetNumVehicleMods(vehicle, 11) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, 11, int)
				name = nameTable[int + 2]
			end)

			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle .. " " .. EMSModeTitle, function(cb)
					if (cb) then
						Citizen.Wait(1)
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
					drawNotification("~g~" .. name)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --LSC Exhaust Menu
	local int
	local name
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, 4)
		name = GetLabelText(GetModTextLabel(vehicle, 4, GetVehicleMod(vehicle, 4)))
		
		if (lscExhaustMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscExhaustMenu
			else
				lastSelectionlscExhaustMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ExhaustTitle)
			
			TriggerEvent("FMODT:Int", ExhaustTitle, int, -1, (GetNumVehicleMods(vehicle, 4) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, 4, int)
				name = GetLabelText(GetModTextLabel(vehicle, 4, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle, function(cb)
					if (cb) then
						Citizen.Wait(1)
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						Citizen.Wait(1)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --LSC Fender (Front) Menu
	local int
	local name
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, 8)
		name = GetLabelText(GetModTextLabel(vehicle, 8, GetVehicleMod(vehicle, 8)))
		
		if (lscFenderFMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscFenderFMenu
			else
				lastSelectionlscFenderFMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. FrontFenderTitle)
			
			TriggerEvent("FMODT:Int", FrontFenderTitle, int, -1, (GetNumVehicleMods(vehicle, 8) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, 8, int)
				name = GetLabelText(GetModTextLabel(vehicle, 8, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle, function(cb)
					if (cb) then
						Citizen.Wait(1)
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						Citizen.Wait(1)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --LSC Fender (Rear) Menu
	local int
	local name
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)

		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, 9)
		name = GetLabelText(GetModTextLabel(vehicle, 9, GetVehicleMod(vehicle, 9)))
		
		if (lscFenderRMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscFenderRMenu
			else
				lastSelectionlscFenderRMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. RearFenderTitle)
			
			TriggerEvent("FMODT:Int", RearFenderTitle, int, -1, (GetNumVehicleMods(vehicle, 9) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, 9, int)
				name = GetLabelText(GetModTextLabel(vehicle, 9, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle, function(cb)
					if (cb) then
						Citizen.Wait(1)
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						Citizen.Wait(1)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --LSC Grille Menu
	local int
	local name
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, 6)
		name = GetLabelText(GetModTextLabel(vehicle, 6, GetVehicleMod(vehicle, 6)))

		if (lscGrilleMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscGrilleMenu
			else
				lastSelectionlscGrilleMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. GrilleTitle)
			
			TriggerEvent("FMODT:Int", GrilleTitle, int, -1, (GetNumVehicleMods(vehicle, 6) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, 6, int)
				name = GetLabelText(GetModTextLabel(vehicle, 6, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle, function(cb)
					if (cb) then
						Citizen.Wait(1)
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						Citizen.Wait(1)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --LSC Hood Menu
	local int
	local name
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, 7)
		name = GetLabelText(GetModTextLabel(vehicle, 7, GetVehicleMod(vehicle, 7)))

		if (lscHoodMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscHoodMenu
			else
				lastSelectionlscHoodMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. HoodTitle)
			
			TriggerEvent("FMODT:Int", HoodTitle, int, -1, (GetNumVehicleMods(vehicle, 7) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, 7, int)
				name = GetLabelText(GetModTextLabel(vehicle, 7, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle, function(cb)
					if (cb) then
						Citizen.Wait(1)
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						Citizen.Wait(1)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --LSC Horn Menu							[Multiple Pages]
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)

		if (lscHornMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscHornMenu
			else
				lastSelectionlscHornMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. HornTitle)
			
			TriggerEvent("FMODT:Option", StockTitle, function(cb)
				if (cb) then
					lscHornMenu = false
					lscHornStockMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", MelodyTitle, function(cb)
				if (cb) then
					lscHornMenu = false
					lscHornMelodyMenu1 = true
				end
			end)

			TriggerEvent("FMODT:Option", LoopTitle, function(cb)
				if (cb) then
					lscHornMenu = false
					lscHornLoopMenu = true
				end
			end)

			TriggerEvent("FMODT:Update")
			
		elseif (lscHornStockMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscHornStockMenu
			else
				lastSelectionlscHornStockMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. HornTitle .. " (" .. StockTitle .. ")")
			
			TriggerEvent("FMODT:Option", StockTitle .. " " .. HornTitle, function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, -1)
				end
			end)

			TriggerEvent("FMODT:Option", "Cop " .. HornTitle, function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 1)
				end
			end)

			TriggerEvent("FMODT:Option", "Clown " .. HornTitle, function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 2)
				end
			end)

			TriggerEvent("FMODT:Option", "Truck " .. HornTitle, function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 0)
				end
			end)

			TriggerEvent("FMODT:Update")
			
		elseif (lscHornMelodyMenu1) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscHornMelodyMenu1
			else
				lastSelectionlscHornMelodyMenu1 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					lscHornMelodyMenu1 = false
					lscHornMelodyMenu2 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					lscHornMelodyMenu1 = false
					lscHornMelodyMenu2 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. HornTitle .. " (" .. MelodyTitle .. ")")
			
			TriggerEvent("FMODT:Option", "Christmas " .. HornTitle .. " Bells 1", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 47)
				end
			end)

			TriggerEvent("FMODT:Option", "Christmas " .. HornTitle .. " Bells 2", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 49)
				end
			end)

			TriggerEvent("FMODT:Option", "Christmas " .. HornTitle .. " Bells 3", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 51)
				end
			end)

			TriggerEvent("FMODT:Option", "Classical " .. HornTitle .. " 1", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 9)
				end
			end)

			TriggerEvent("FMODT:Option", "Classical " .. HornTitle .. " 2", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 10)
				end
			end)

			TriggerEvent("FMODT:Option", "Classical " .. HornTitle .. " 3", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 11)
				end
			end)

			TriggerEvent("FMODT:Option", "Classical " .. HornTitle .. " 4", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 12)
				end
			end)

			TriggerEvent("FMODT:Option", "Classical " .. HornTitle .. " 5", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 13)
				end
			end)

			TriggerEvent("FMODT:Option", "Classical " .. HornTitle .. " 6", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 14)
				end
			end)

			TriggerEvent("FMODT:Option", "Classical " .. HornTitle .. " 7", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 15)
				end
			end)

			TriggerEvent("FMODT:Option", "Classical " .. HornTitle .. " 8", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 33)
				end
			end)

			TriggerEvent("FMODT:Option", "Jazz " .. HornTitle .. " 1", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 24)
				end
			end)

			TriggerEvent("FMODT:Option", "Jazz " .. HornTitle .. " 2", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 25)
				end
			end)

			TriggerEvent("FMODT:Option", "Jazz " .. HornTitle .. " 3", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 26)
				end
			end)

			TriggerEvent("FMODT:Option", "Musical " .. HornTitle .. " 1", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 3)
				end
			end)

			TriggerEvent("FMODT:Option", "Musical " .. HornTitle .. " 2", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 4)
				end
			end)

			TriggerEvent("FMODT:Option", "Musical " .. HornTitle .. " 3", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 5)
				end
			end)

			TriggerEvent("FMODT:Option", "Musical " .. HornTitle .. " 4", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 6)
				end
			end)

			TriggerEvent("FMODT:Option", "Musical " .. HornTitle .. " 5", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 7)
				end
			end)

			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 1", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 1")
				end
			end)

			TriggerEvent("FMODT:Update")

		elseif (lscHornMelodyMenu2) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscHornMelodyMenu2
			else
				lastSelectionlscHornMelodyMenu2 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					lscHornMelodyMenu2 = false
					lscHornMelodyMenu1 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					lscHornMelodyMenu2 = false
					lscHornMelodyMenu1 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. HornTitle .. " (" .. MelodyTitle .. ")")
			
			TriggerEvent("FMODT:Option", "Sad Trombone", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 8)
				end
			end)

			TriggerEvent("FMODT:Option", "Scale - Do", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 16)
				end
			end)

			TriggerEvent("FMODT:Option", "Scale - Re", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 17)
				end
			end)

			TriggerEvent("FMODT:Option", "Scale - Mi", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 18)
				end
			end)

			TriggerEvent("FMODT:Option", "Scale - Fa", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 19)
				end
			end)

			TriggerEvent("FMODT:Option", "Scale - Sol", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 20)
				end
			end)

			TriggerEvent("FMODT:Option", "Scale - La", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 21)
				end
			end)

			TriggerEvent("FMODT:Option", "Scale - Ti", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 22)
				end
			end)

			TriggerEvent("FMODT:Option", "Scale - Do (High)", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 23)
				end
			end)

			TriggerEvent("FMODT:Option", "Star Spangled Banner " .. HornTitle .. " 1", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 28)
				end
			end)

			TriggerEvent("FMODT:Option", "Star Spangled Banner " .. HornTitle .. " 2", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 29)
				end
			end)

			TriggerEvent("FMODT:Option", "Star Spangled Banner " .. HornTitle .. " 3", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 30)
				end
			end)

			TriggerEvent("FMODT:Option", "Star Spangled Banner " .. HornTitle .. " 4", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 31)
				end
			end)

			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 2", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 2")
				end
			end)

			TriggerEvent("FMODT:Update")

		elseif (lscHornLoopMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscHornLoopMenu
			else
				lastSelectionlscHornLoopMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. HornTitle .. " (" .. LoopTitle .. ")")
			
			TriggerEvent("FMODT:Option", "Christmas " .. HornTitle .. " Loop 1", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 46)
				end
			end)

			TriggerEvent("FMODT:Option", "Christmas " .. HornTitle .. " Loop 2", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 48)
				end
			end)

			TriggerEvent("FMODT:Option", "Christmas " .. HornTitle .. " Loop 3", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 50)
				end
			end)

			TriggerEvent("FMODT:Option", "Classical " .. HornTitle .. " Loop 1", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 32)
				end
			end)

			TriggerEvent("FMODT:Option", "Classical " .. HornTitle .. " Loop 2", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 34)
				end
			end)

			TriggerEvent("FMODT:Option", "Halloween " .. HornTitle .. " Loop 1", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 38)
				end
			end)

			TriggerEvent("FMODT:Option", "Halloween " .. HornTitle .. " Loop 2", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 40)
				end
			end)

			TriggerEvent("FMODT:Option", "Jazz " .. HornTitle .. " Loop", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 27)
				end
			end)

			TriggerEvent("FMODT:Option", "Liberty City " .. HornTitle .. " Loop", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 44)
				end
			end)

			TriggerEvent("FMODT:Option", "San Andreas " .. HornTitle .. " Loop", function(cb)
				if (cb) then
					SetVehicleMod(playerVeh, 14, 42)
				end
			end)

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --LSC Light Menu						[Multiple Pages]
	local neonCount = 1
	local neonColor = {
							"White", "Blue", "Electric Blue",
							"Mint Green", "Lime Green", "Yellow",
							"Orange", "Red", "Pony Pink",
							"Hot Pink", "Purple"
						   }
	local neonColorRGB = {
							  {255, 255, 255}, {0, 0, 255}, {0, 150, 255},
							  {50, 255, 155}, {0, 255, 0}, {255, 255, 0},
							  {208, 104, 0}, {255, 0, 0}, {255, 102, 255},
							  {255, 0, 255}, {71, 0, 71}
							 }
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		xenon = IsToggleModOn(vehicle, 22)

		if (lscLightMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscLightMenu
			else
				lastSelectionlscLightMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. LightsTitle)

			TriggerEvent("FMODT:Bool", XenonTitle, xenon, function(cb) --Xenon
				xenon = cb
				ToggleVehicleMod(vehicle, 22, xenon)
				if xenon then
					drawNotification("~g~" .. XenonEnableMessage .. "!")
				else
					drawNotification("~r~" .. XenonDisableMessage .. "!")
				end
			end)
			
			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. NeonTitle, function(cb)
				if (cb) then
					lscLightMenu = false
					lscLightsNeonMenu = true
				end
			end)

			TriggerEvent("FMODT:Update")
			
		elseif (lscLightsNeonMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscLightsNeonMenu
			else
				lastSelectionlscLightsNeonMenu = currentOption
			end
		
			neonleft = IsVehicleNeonLightEnabled(vehicle, 0)
			neonright = IsVehicleNeonLightEnabled(vehicle, 1)
			neonfront = IsVehicleNeonLightEnabled(vehicle, 2)
			neonrear = IsVehicleNeonLightEnabled(vehicle, 3)
		
			TriggerEvent("FMODT:Title", "~y~" .. NeonTitle)

			TriggerEvent("FMODT:StringArray", ColorTitle, neonColor, neonCount, function(cb)
				neonCount = cb
				SetVehicleNeonLightsColour(vehicle, neonColorRGB[neonCount][1], neonColorRGB[neonCount][2], neonColorRGB[neonCount][3])
			end)

			TriggerEvent("FMODT:Option", CustomColorTitle, function(cb)
				if (cb) then
					CustomColor = true
					CustomColorNeon = true
				end
			end)

			if lscMenuTrailer then
				TriggerEvent("FMODT:Bool", RainbowNeonsTitle, rainbowneonsTrailer, function(cb) --Rainbow Neons
					rainbowneonsTrailer = cb
					if rainbowneonsTrailer then
						drawNotification("~g~" .. RainbowNeonsEnableMessage .. " Enabled!")
					else
						drawNotification("~r~" .. RainbowNeonsDisableMessage .. " Disabled!")
					end
				end)
			else
				TriggerEvent("FMODT:Bool", RainbowNeonsTitle, rainbowneons, function(cb) --Rainbow Neons
					rainbowneons = cb
					if rainbowneons then
						drawNotification("~g~" .. RainbowNeonsEnableMessage .. " Enabled!")
					else
						drawNotification("~r~" .. RainbowNeonsDisableMessage .. " Disabled!")
					end
				end)
			end
			
			TriggerEvent("FMODT:Bool", LeftNeonsTitle, neonleft, function(cb) --Xenon
				neonleft = cb
				SetVehicleNeonLightEnabled(vehicle, 0, neonleft)
				if neonleft then
					drawNotification("~g~" .. LeftNeonsEnableMessage .. " Enabled!")
				else
					drawNotification("~r~" .. LeftNeonsDisableMessage .. " Disabled!")
				end
			end)
			
			TriggerEvent("FMODT:Bool", RightNeonsTitle, neonright, function(cb) --Xenon
				neonright = cb
				SetVehicleNeonLightEnabled(vehicle, 1, neonright)
				if neonright then
					drawNotification("~g~" .. RightNeonsEnableMessage .. " Enabled!")
				else
					drawNotification("~r~" .. RightNeonsDisableMessage .. " Disabled!")
				end
			end)
			
			TriggerEvent("FMODT:Bool", FrontNeonsTitle, neonfront, function(cb) --Xenon
				neonfront = cb
				SetVehicleNeonLightEnabled(vehicle, 2, neonfront)
				if neonfront then
					drawNotification("~g~" .. FrontNeonsEnableMessage .. " Enabled!")
				else
					drawNotification("~r~" .. FrontNeonsDisableMessage .. " Disabled!")
				end
			end)
			
			TriggerEvent("FMODT:Bool", RearNeonsTitle, neonrear, function(cb) --Xenon
				neonrear = cb
				SetVehicleNeonLightEnabled(vehicle, 3, neonrear)
				if neonrear then
					drawNotification("~g~" .. RearNeonsEnableMessage .. " Enabled!")
				else
					drawNotification("~r~" .. RearNeonsDisableMessage .. " Disabled!")
				end
			end)
			
			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --LSC Plate Menu
	local int
	local plate
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleNumberPlateTextIndex(vehicle)
		if (int == 0) then
			plate = "Blue On White 1"
		elseif (int == 3) then
			plate = "Blue On White 2"
		elseif (int == 4) then
			plate = "Blue On White 3"
		elseif (int == 1) then
			plate = "Yellow On Black"
		elseif (int == 2) then
			plate = "Yellow On Blue"
		elseif (int == 5) then
			plate = "North Yankton"
		end

		if (lscPlateMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscPlateMenu
			else
				lastSelectionlscPlateMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. PlateTitle)
			
			TriggerEvent("FMODT:Option", SetPlateTextTitle, function(cb)
				if (cb) then
					setPlateText = true
				end
			end)
			
			TriggerEvent("FMODT:Int", PlateTitle .. ":", int, 0, GetNumberOfVehicleNumberPlates() - 1, function(cb)
				int = cb
				SetVehicleNumberPlateTextIndex(vehicle, int)
				
				if (int == 0) then
					plate = "Blue On White 1"
				elseif (int == 3) then
					plate = "Blue On White 2"
				elseif (int == 4) then
					plate = "Blue On White 3"
				elseif (int == 1) then
					plate = "Yellow On Black"
				elseif (int == 2) then
					plate = "Yellow On Blue"
				elseif (int == 5) then
					plate = "North Yankton"
				end

			end)
			
			TriggerEvent("FMODT:Option", "~g~" .. plate, function(cb)
				if (cb) then
					Citizen.Wait(1)
				end
			end)

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --LSC Respary Menu						[Multiple Pages]
	local liveryIndexN
	local liveryNameN
	local liveryIndexM
	local liveryNameM
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		liveryIndexN = GetVehicleLivery(vehicle)
		liveryNameN = GetLabelText(GetLiveryName(vehicle, liveryIndexN))
		liveryIndexM = GetVehicleMod(vehicle, 48)
		liveryNameM = GetLabelText(GetModTextLabel(vehicle, 48, GetVehicleMod(vehicle, 48)))

		if (lscColorMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscColorMenu
			else
				lastSelectionlscColorMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ResparyTitle)
			
			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. PrimaryColorTitle, function(cb)
				if (cb) then
					lscColorMenu = false
					PrimaryColor = true
					lscColorSelectionMenu = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. SecondaryColorTitle, function(cb)
				if (cb) then
					lscColorMenu = false
					SecondaryColor = true
					lscColorSelectionMenu = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. PearlescentTitle, function(cb)
				if (cb) then
					lscColorMenu = false
					PearlescentColor = true
					lscColorMetallicMenu1 = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. RimsTitle, function(cb)
				if (cb) then
					lscColorMenu = false
					RimsColor = true
					lscColorMetallicMenu1 = true
				end
			end)
				
			if GetVehicleLiveryCount(vehicle) > 0 then
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. LiveryTitle, function(cb)
					if (cb) then
						lscColorMenu = false
						lscColorLiveryMenuN = true
					end
				end)
			end

			if GetNumVehicleMods(vehicle, 48) > 0 then
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. LiveryTitle, function(cb)
					if (cb) then
						lscColorMenu = false
						lscColorLiveryMenuM = true
					end
				end)
			end

			TriggerEvent("FMODT:Update")
			
		elseif (lscColorSelectionMenu) then
		
			if PrimaryColor then
			
				if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
					currentOption = lastSelectionlscColorSelectionMenuPrimaryColor
				else
					lastSelectionlscColorSelectionMenuPrimaryColor = currentOption
				end
			
				TriggerEvent("FMODT:Title", "~y~" .. PrimaryColorTitle)
			elseif SecondaryColor then
			
				if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
					currentOption = lastSelectionlscColorSelectionMenuSecondaryColor
				else
					lastSelectionlscColorSelectionMenuSecondaryColor = currentOption
				end
			
				TriggerEvent("FMODT:Title", "~y~" .. SecondaryColorTitle)
			end
			
			TriggerEvent("FMODT:Option", "~y~>> ~s~Chrome", function(cb)
				if (cb) then
					lscColorSelectionMenu = false
					lscColorChromeMenu = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "~y~>> ~s~Metals", function(cb)
				if (cb) then
					lscColorSelectionMenu = false
					lscColorMetalMenu = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "~y~>> ~s~Matte", function(cb)
				if (cb) then
					lscColorSelectionMenu = false
					lscColorMatteMenu = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "~y~>> ~s~Metallic/ Classic", function(cb)
				if (cb) then
					lscColorSelectionMenu = false
					lscColorMetallicMenu1 = true
				end
			end)
				
			TriggerEvent("FMODT:Update")
		
		elseif (lscColorChromeMenu) then
		
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscColorChromeMenu
			else
				lastSelectionlscColorChromeMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~Chrome Menu")
			
			TriggerEvent("FMODT:Option", CustomColorTitle, function(cb)
				if (cb) then
					modColor = 5
					CustomColor = true
				end
			end)
			
			TriggerEvent("FMODT:Option", "Chrome", function(cb)
				if (cb) then
					modColor = 5
					colorIndex = 120
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Update")
		
		elseif (lscColorMetalMenu) then
		
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscColorMetalMenu
			else
				lastSelectionlscColorMetalMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~Metals Menu")
			
			TriggerEvent("FMODT:Option", CustomColorTitle, function(cb)
				if (cb) then
					modColor = 4
					CustomColor = true
				end
			end)
			
			TriggerEvent("FMODT:Option", "Brushed Aluminium", function(cb)
				if (cb) then
					modColor = 4
					colorIndex = 119					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Brushed Black Steel", function(cb)
				if (cb) then
					modColor = 4
					colorIndex = 118					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Brushed Gold", function(cb)
				if (cb) then
					modColor = 4
					colorIndex = 159					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Brushed Steel", function(cb)
				if (cb) then
					modColor = 4
					colorIndex = 117					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Pure Gold", function(cb)
				if (cb) then
					modColor = 4
					colorIndex = 158					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Update")
		
		elseif (lscColorMatteMenu) then
		
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscColorMatteMenu
			else
				lastSelectionlscColorMatteMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~Matte Color Menu")
			
			TriggerEvent("FMODT:Option", CustomColorTitle, function(cb)
				if (cb) then
					modColor = 3
					CustomColor = true
				end
			end)
			
			TriggerEvent("FMODT:Option", "Black", function(cb)
				if (cb) then
					modColor = 3
					colorIndex = 12					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Gray", function(cb)
				if (cb) then
					modColor = 3
					colorIndex = 13					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Light Gray", function(cb)
				if (cb) then
					modColor = 3
					colorIndex = 14					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Ice White", function(cb)
				if (cb) then
					modColor = 3
					colorIndex = 131					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Blue", function(cb)
				if (cb) then
					modColor = 3
					colorIndex = 83					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Dark Blue", function(cb)
				if (cb) then
					modColor = 3
					colorIndex = 82					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Midnight Blue", function(cb)
				if (cb) then
					modColor = 3
					colorIndex = 84					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Midnight Purple", function(cb)
				if (cb) then
					modColor = 3
					colorIndex = 149					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Schafter Purple", function(cb)
				if (cb) then
					modColor = 3
					colorIndex = 148					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Red", function(cb)
				if (cb) then
					modColor = 3
					colorIndex = 39					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Dark Red", function(cb)
				if (cb) then
					modColor = 3
					colorIndex = 40					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Orange", function(cb)
				if (cb) then
					modColor = 3
					colorIndex = 41					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Yellow", function(cb)
				if (cb) then
					modColor = 3
					colorIndex = 42					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Lime Green", function(cb)
				if (cb) then
					modColor = 3
					colorIndex = 55					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Green", function(cb)
				if (cb) then
					modColor = 3
					colorIndex = 128					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Forest Green", function(cb)
				if (cb) then
					modColor = 3
					colorIndex = 151					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Foliage Green", function(cb)
				if (cb) then
					modColor = 3
					colorIndex = 155					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Olive Drab", function(cb)
				if (cb) then
					modColor = 3
					colorIndex = 152					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Dark Earth", function(cb)
				if (cb) then
					modColor = 3
					colorIndex = 153					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Desert Tan", function(cb)
				if (cb) then
					modColor = 3
					colorIndex = 154					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Update")
		
		elseif (lscColorMetallicMenu1) then
		
			if PearlescentColor then
			
				if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
					currentOption = lastSelectionlscColorMetallicMenu1PearlescentColor
				else
					lastSelectionlscColorMetallicMenu1PearlescentColor = currentOption
				end
		
				TriggerEvent("FMODT:Title", "~y~" .. PearlescentTitle)
			elseif RimsColor then
			
				if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
					currentOption = lastSelectionlscColorMetallicMenu1RimsColor
				else
					lastSelectionlscColorMetallicMenu1RimsColor = currentOption
				end
		
				TriggerEvent("FMODT:Title", "~y~" .. RimsTitle)
			else
			
				if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
					currentOption = lastSelectionlscColorMetallicMenu1
				else
					lastSelectionlscColorMetallicMenu1 = currentOption
				end
			
				TriggerEvent("FMODT:Title", "~y~Metallic/ Classic Menu")
				
				TriggerEvent("FMODT:Option", CustomColorTitle, function(cb)
					if (cb) then
						modColor = 1
						CustomColor = true
					end
				end)
					
			end
			
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					lscColorMetallicMenu1 = false
					lscColorMetallicMenu4 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					lscColorMetallicMenu1 = false
					lscColorMetallicMenu2 = true
				end
			end
		
			TriggerEvent("FMODT:Option", "Black", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 0					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Graphite Black", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 1					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Anthracite Gray", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 11					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Black Steel", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 2					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Dark Steel", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 3					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Silver", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 4					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Bluish Silver", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 5					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Rolled Steel", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 6					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Shadow Silver", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 7					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Stone Silver", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 8					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Midnight Silver", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 9					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Cast Iron Silver", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 10					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Red", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 27					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Torino Red", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 28					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Formula Red", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 29					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Lava Red", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 150					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Blaze Red", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 30					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Grace Red", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 31					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Garnet Red", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 32					
					setColor = true
				end
			end)
				
			if PearlescentColor or RimsColor then
				TriggerEvent("FMODT:Option", "Sunset Red", function(cb)
					if (cb) then
						modColor = 1
						colorIndex = 33					
						setColor = true
					end
				end)
			end
					
			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 1", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 1")
				end
			end)
				
			TriggerEvent("FMODT:Update")
		
		elseif (lscColorMetallicMenu2) then
		
			if PearlescentColor then
			
				if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
					currentOption = lastSelectionlscColorMetallicMenu2PearlescentColor
				else
					lastSelectionlscColorMetallicMenu2PearlescentColor = currentOption
				end
			
				TriggerEvent("FMODT:Title", "~y~" .. PearlescentTitle)
			elseif RimsColor then
			
				if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
					currentOption = lastSelectionlscColorMetallicMenu2RimsColor
				else
					lastSelectionlscColorMetallicMenu2RimsColor = currentOption
				end
			
				TriggerEvent("FMODT:Title", "~y~" .. RimsTitle)
			else
			
				if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
					currentOption = lastSelectionlscColorMetallicMenu2
				else
					lastSelectionlscColorMetallicMenu2 = currentOption
				end
		
				TriggerEvent("FMODT:Title", "~y~Metallic/ Classic Menu")
			end
			
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					lscColorMetallicMenu2 = false
					lscColorMetallicMenu1 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					lscColorMetallicMenu2 = false
					lscColorMetallicMenu3 = true
				end
			end
		
			if not PearlescentColor or RimsColor then
				TriggerEvent("FMODT:Option", "Sunset Red", function(cb)
					if (cb) then
						modColor = 1
						colorIndex = 33					
						setColor = true
					end
				end)
			end
					
			TriggerEvent("FMODT:Option", "Cabernet Red", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 34					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Wine Red", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 143					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Candy Red", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 35					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Hot Pink", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 135					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Pfsiter Pink", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 137					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Salmon Pink", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 136					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Sunrise Orange", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 36					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Orange", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 38					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Bright Orange", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 138					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Gold", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 99					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Bronze", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 90					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Yellow", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 88					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Race Yellow", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 89					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Dew Yellow", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 91					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Dark Green", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 49					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Racing Green", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 50					
					setColor = true
				end
			end)
			
			TriggerEvent("FMODT:Option", "Sea Green", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 51					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Olive Green", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 52					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Bright Green", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 53					
					setColor = true
				end
			end)
				
			if PearlescentColor or RimsColor then
				TriggerEvent("FMODT:Option", "Gasoline Green", function(cb)
					if (cb) then
						modColor = 1
						colorIndex = 54					
						setColor = true
					end
				end)
			end
					
			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 2", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 2")
				end
			end)
				
			TriggerEvent("FMODT:Update")
		
		elseif (lscColorMetallicMenu3) then
		
			if PearlescentColor then
				
				if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
					currentOption = lastSelectionlscColorMetallicMenu3PearlescentColor
				else
					lastSelectionlscColorMetallicMenu3PearlescentColor = currentOption
				end
			
				TriggerEvent("FMODT:Title", "~y~" .. PearlescentTitle)
			elseif RimsColor then
				
				if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
					currentOption = lastSelectionlscColorMetallicMenu3RimsColor
				else
					lastSelectionlscColorMetallicMenu3RimsColor = currentOption
				end
			
				TriggerEvent("FMODT:Title", "~y~" .. RimsTitle)
			else
				
				if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
					currentOption = lastSelectionlscColorMetallicMenu3
				else
					lastSelectionlscColorMetallicMenu3 = currentOption
				end
			
				TriggerEvent("FMODT:Title", "~y~Metallic/ Classic Menu")
			end
			
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					lscColorMetallicMenu3 = false
					lscColorMetallicMenu2 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					lscColorMetallicMenu3 = false
					lscColorMetallicMenu4 = true
				end
			end
		
			if not PearlescentColor or RimsColor then
				TriggerEvent("FMODT:Option", "Gasoline Green", function(cb)
					if (cb) then
						modColor = 1
						colorIndex = 54					
						setColor = true
					end
				end)
			end
					
			TriggerEvent("FMODT:Option", "Lime Green", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 92					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Midnight Blue", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 141					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Galaxy Blue", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 61					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Dark Blue", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 62					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Saxon Blue", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 63					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Blue", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 64					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Mariner Blue", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 65					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Harbor Blue", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 66					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Diamond Blue", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 67					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Surf Blue", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 68					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Nautical Blue", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 69					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Racing Blue", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 73					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Ultra Blue", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 70					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Light Blue", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 74					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Chocolate Brown", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 96					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Bison Brown", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 101					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Creek Brown", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 95					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Feltzer Brown", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 94					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Maple Brown", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 97					
					setColor = true
				end
			end)
				
			if not PearlescentColor or RimsColor then
				TriggerEvent("FMODT:Option", "Beechwood Brown", function(cb)
					if (cb) then
						modColor = 1
						colorIndex = 103					
						setColor = true
					end
				end)
			end
					
			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 3", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 2")
				end
			end)
				
			TriggerEvent("FMODT:Update")
		
		elseif (lscColorMetallicMenu4) then
		
			if PearlescentColor then
				
				if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
					currentOption = lastSelectionlscColorMetallicMenu4PearlescentColor
				else
					lastSelectionlscColorMetallicMenu4PearlescentColor = currentOption
				end
			
				TriggerEvent("FMODT:Title", "~y~" .. PearlescentTitle)
			elseif RimsColor then
				
				if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
					currentOption = lastSelectionlscColorMetallicMenu4RimsColor
				else
					lastSelectionlscColorMetallicMenu4RimsColor = currentOption
				end
			
				TriggerEvent("FMODT:Title", "~y~" .. RimsTitle)
			else
				
				if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
					currentOption = lastSelectionlscColorMetallicMenu4
				else
					lastSelectionlscColorMetallicMenu4 = currentOption
				end
			
				TriggerEvent("FMODT:Title", "~y~Metallic/ Classic Menu")
			end
			
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					lscColorMetallicMenu4 = false
					lscColorMetallicMenu3 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					lscColorMetallicMenu4 = false
					lscColorMetallicMenu1 = true
				end
			end
		
			if PearlescentColor or RimsColor then
				TriggerEvent("FMODT:Option", "Beechwood Brown", function(cb)
					if (cb) then
						modColor = 1
						colorIndex = 103					
						setColor = true
					end
				end)
			end
					
			TriggerEvent("FMODT:Option", "Sienna Brown", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 104					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Saddle Brown", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 98					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Moss Brown", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 100					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Woodbeech Brown", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 102					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Straw Brown", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 99					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Sandy Brown", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 105					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Bleached Brown", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 106					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Purple Blue", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 71					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Spinnaker Purple", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 72					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Midnight Purple", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 142					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Bright Purple", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 145					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Cream", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 107					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Ice White", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 111					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "Frost White", function(cb)
				if (cb) then
					modColor = 1
					colorIndex = 112					
					setColor = true
				end
			end)
				
			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 4", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 4")
				end
			end)
				
			TriggerEvent("FMODT:Update")
			
		elseif (lscColorLiveryMenuN) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscColorLiveryMenuN
			else
				lastSelectionlscColorLiveryMenuN = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. LiveryTitle)
			
			if GetVehicleLiveryCount(vehicle) > 0 then
				TriggerEvent("FMODT:Option", GetVehicleLiveryCount(vehicle) .. " ~s~" .. LiverysTitle, function(cb)
					if(cb) then
						drawNotification(GetVehicleLiveryCount(vehicle) .. " ~s~" .. LiverysTitle .. "!")
					end
				end)
			else
				TriggerEvent("FMODT:Option", NoLiverysTitle, function(cb)
					if(cb) then
						drawNotification(NoLiverysTitle .. "!")
					end
				end)
			end
			
			TriggerEvent("FMODT:Int", LiveryTitle, liveryIndexN, 0, (GetVehicleLiveryCount(vehicle) - 1), function(cb)
				liveryIndexN = cb
				SetVehicleLivery(vehicle, liveryIndexN)
				liveryNameN = GetLabelText(GetLiveryName(vehicle, liveryIndexN))
			end)

			if liveryNameN ~= "NULL" then
				if (liveryIndexN == -1) then
					TriggerEvent("FMODT:Option", "~r~" .. NoLiveryTitly, function(cb)
						if (cb) then
							drawNotification("~r~" .. NoLiveryTitly .. "!")
						end
					end)
				else
					TriggerEvent("FMODT:Option", "~g~" .. liveryNameN, function(cb)
						if (cb) then
							drawNotification("~g~" .. liveryNameN)
						end
					end)
				end
			else
				TriggerEvent("FMODT:Option", "~g~" .. LiveryTitle .. " " .. liveryIndexN, function(cb)
					if (cb) then
						drawNotification("~g~" .. liveryNameN)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
			
		elseif (lscColorLiveryMenuM) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscColorLiveryMenuM
			else
				lastSelectionlscColorLiveryMenuM = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. LiveryTitle)
			
			if GetNumVehicleMods(vehicle, 48) > 0 then
				TriggerEvent("FMODT:Option", GetNumVehicleMods(vehicle, 48) .. " ~s~" .. LiverysTitle, function(cb)
					if(cb) then
						drawNotification(GetNumVehicleMods(vehicle, 48) .. " ~s~" .. LiverysTitle .. "!")
					end
				end)
			else
				TriggerEvent("FMODT:Option", NoLiverysTitle, function(cb)
					if(cb) then
						drawNotification(NoLiverysTitle .. "!")
					end
				end)
			end
			
			TriggerEvent("FMODT:Int", LiveryTitle, liveryIndexM, -1, (GetNumVehicleMods(vehicle, 48) - 1), function(cb)
				liveryIndexM = cb
				SetVehicleMod(vehicle, 48, liveryIndexM)
				liveryNameM = GetLabelText(GetModTextLabel(vehicle, 48, liveryIndexM))
			end)

			if (liveryIndexM == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. NoLiveryTitly, function(cb)
					if (cb) then
						drawNotification("~r~" .. NoLiveryTitly)
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. liveryNameM, function(cb)
					if (cb) then
						drawNotification("~g~" .. liveryNameM)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
			
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --LSC Roof Menu
	local int = -1
	local name
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, 10)
		name = GetLabelText(GetModTextLabel(vehicle, 10, GetVehicleMod(vehicle, 10)))

		if (lscRoofMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscRoofMenu
			else
				lastSelectionlscRoofMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. RoofTitle)
			
			TriggerEvent("FMODT:Int", RoofTitle, int, -1, (GetNumVehicleMods(vehicle, 10) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, 10, int)
				name = GetLabelText(GetModTextLabel(vehicle, 10, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle, function(cb)
					if (cb) then
						Citizen.Wait(1)
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						Citizen.Wait(1)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --LSC Side Skirt Menu
	local int = -1
	local name
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, 3)
		name = GetLabelText(GetModTextLabel(vehicle, 3, GetVehicleMod(vehicle, 3)))

		if (lscSideSkirtMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscSideSkirtMenu
			else
				lastSelectionlscSideSkirtMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. SideSkirtTitle)
			
			TriggerEvent("FMODT:Int", SideSkirtTitle, int, -1, (GetNumVehicleMods(vehicle, 3) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, 3, int)
				name = GetLabelText(GetModTextLabel(vehicle, 3, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle, function(cb)
					if (cb) then
						Citizen.Wait(1)
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						Citizen.Wait(1)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --LSC Spoiler Menu
	local int = -1
	local name
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, 0)
		name = GetLabelText(GetModTextLabel(vehicle, 0, GetVehicleMod(vehicle, 0)))

		if (lscSpoilerMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscSpoilerMenu
			else
				lastSelectionlscSpoilerMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. SpoilerTitle)
			
			TriggerEvent("FMODT:Int", SpoilerTitle, int, -1, (GetNumVehicleMods(vehicle, 0) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, 0, int)
				name = GetLabelText(GetModTextLabel(vehicle, 0, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle, function(cb)
					if (cb) then
						Citizen.Wait(1)
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						Citizen.Wait(1)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --LSC Suspension Menu
	local int
	local name
	local nameTable = {StockTitle .. " " .. SuspensionTitle, LoweredTitle .. " " .. SuspensionTitle, StreetTitle .. " " .. SuspensionTitle, SportTitle .. " " .. SuspensionTitle, CompetitionTitle .. " " .. SuspensionTitle}
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, 15)
		name = nameTable[int + 2]
		if (lscSuspensionMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscSuspensionMenu
			else
				lastSelectionlscSuspensionMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. SuspensionTitle)
			
			TriggerEvent("FMODT:Int", SuspensionTitle, int, -1, 3, function(cb)
				int = cb
				SetVehicleMod(vehicle, 15, int)
				name = nameTable[int + 2]
			end)

			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle, function(cb)
					if (cb) then
						Citizen.Wait(1)
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						drawNotification("~g~" .. name)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --LSC Transmission Menu
	local int
	local name
	local nameTable = {StockTitle .. " " .. TransmissionTitle, StreetTitle .. " " .. TransmissionTitle, SportTitle .. " " .. TransmissionTitle, RaceTitle .. " " .. TransmissionTitle}
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, 13)
		name = nameTable[int + 2]
		if (lscTransmissionMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscTransmissionMenu
			else
				lastSelectionlscTransmissionMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. TransmissionTitle)
			
			TriggerEvent("FMODT:Int", TransmissionTitle, int, -1, 2, function(cb)
				int = cb
				name = nameTable[int + 2]
				SetVehicleMod(vehicle, 13, int)
			end)

			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle, function(cb)
					if (cb) then
						Citizen.Wait(1)
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						drawNotification("~g~" .. name)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --LSC Wheels Menu						[Multiple Pages]
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)

		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		tireproof = not GetVehicleTyresCanBurst(vehicle)
		
		if lscWheelMenu then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscWheelMenu
			else
				lastSelectionlscWheelMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. WheelsTitle)
			
			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. WheelAccessoriesTitle, function(cb)
				if (cb) then
					lscWheelMenu = false
					lscWheelAccessoriesMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. WheelTypesTitle, function(cb)
				if (cb) then
					lscWheelMenu = false
					lscWheelTypesMenu = true
				end
			end)

			TriggerEvent("FMODT:Update")
			
		elseif lscWheelAccessoriesMenu then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscWheelAccessoriesMenu
			else
				lastSelectionlscWheelAccessoriesMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. WheelAccessoriesTitle)
		
			TriggerEvent("FMODT:Bool", BulletProofTiresTitle, tireproof, function(cb)
				tireproof = cb
				if tireproof then
					SetVehicleTyresCanBurst(vehicle, false)
					drawNotification("~g~" .. BulletProofTiresEnableMessage .. "!")
				else
					SetVehicleTyresCanBurst(vehicle, true)
					drawNotification("~r~" .. BulletProofTiresDisableMessage .. "!")
				end
			end)
			
			if lscMenuTrailer then
				TriggerEvent("FMODT:Bool", RainbowTireSmokeTitle, rainbowtireTrailer, function(cb)
					rainbowtireTrailer = cb
					if rainbowtireTrailer then
						drawNotification("~g~" .. RainbowTireSmokeEnableMessage .. "!")
					else
						drawNotification("~r~" .. RainbowTireSmokeDisableMessage .. "!")
					end
				end)
			else
				TriggerEvent("FMODT:Bool", RainbowTireSmokeTitle, rainbowtire, function(cb)
					rainbowtire = cb
					if rainbowtire then
						drawNotification("~g~" .. RainbowTireSmokeEnableMessage .. "!")
					else
						drawNotification("~r~" .. RainbowTireSmokeDisableMessage .. "!")
					end
				end)
			end
			
			TriggerEvent("FMODT:Option", NoTireSmokeTitle, function(cb)
				if (cb) then
					ToggleVehicleMod(vehicle, 20, true)
					SetVehicleTyreSmokeColor(vehicle, 0, 0, 0)
				end
			end)
			
			TriggerEvent("FMODT:Option", CustomTireSmokeTitle, function(cb)
				if (cb) then
					CustomColor = true
					TireSmoke = true
				end
			end)
			
			TriggerEvent("FMODT:Option", WhiteTireSmokeTitle, function(cb)
				if (cb) then
					ToggleVehicleMod(vehicle, 20, true)
					SetVehicleTyreSmokeColor(vehicle, 254, 254, 254)
				end
			end)
			
			TriggerEvent("FMODT:Option", BlackTireSmokeTitle, function(cb)
				if (cb) then
					ToggleVehicleMod(vehicle, 20, true)
					SetVehicleTyreSmokeColor(vehicle, 1, 1, 1)
				end
			end)
			
			TriggerEvent("FMODT:Option", BlueTireSmokeTitle, function(cb)
				if (cb) then
					ToggleVehicleMod(vehicle, 20, true)
					SetVehicleTyreSmokeColor(vehicle, 0, 0, 255)
				end
			end)
			
			TriggerEvent("FMODT:Option", YellowTireSmokeTitle, function(cb)
				if (cb) then
					ToggleVehicleMod(vehicle, 20, true)
					SetVehicleTyreSmokeColor(vehicle, 200, 200, 0)
				end
			end)
			
			TriggerEvent("FMODT:Option", PurpleTireSmokeTitle, function(cb)
				if (cb) then
					ToggleVehicleMod(vehicle, 20, true)
					SetVehicleTyreSmokeColor(vehicle, 153, 0, 153)
				end
			end)
			
			TriggerEvent("FMODT:Option", OrangeTireSmokeTitle, function(cb)
				if (cb) then
					ToggleVehicleMod(vehicle, 20, true)
					SetVehicleTyreSmokeColor(vehicle, 255, 153, 0)
				end
			end)
			
			TriggerEvent("FMODT:Option", GreenTireSmokeTitle, function(cb)
				if (cb) then
					ToggleVehicleMod(vehicle, 20, true)
					SetVehicleTyreSmokeColor(vehicle, 0, 255, 0)
				end
			end)
			
			TriggerEvent("FMODT:Option", RedTireSmokeTitle, function(cb)
				if (cb) then
					ToggleVehicleMod(vehicle, 20, true)
					SetVehicleTyreSmokeColor(vehicle, 255, 0, 0)
				end
			end)
			
			TriggerEvent("FMODT:Option", PinkTireSmokeTitle, function(cb)
				if (cb) then
					ToggleVehicleMod(vehicle, 20, true)
					SetVehicleTyreSmokeColor(vehicle, 255, 102, 153)
				end
			end)
			
			TriggerEvent("FMODT:Option", BrownTireSmokeTitle, function(cb)
				if (cb) then
					ToggleVehicleMod(vehicle, 20, true)
					SetVehicleTyreSmokeColor(vehicle, 128, 43, 0)
				end
			end)
			
			TriggerEvent("FMODT:Update")
			
		elseif lscWheelTypesMenu then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscWheelTypesMenu
			else
				lastSelectionlscWheelTypesMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. WheelTypesTitle)
			
			TriggerEvent("FMODT:Option", StockTitle .. " " .. WheelsTitle, function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, -1)
					SetVehicleMod(vehicle, 23, -1, true)
				end
			end)
			
			if GetVehicleClass(vehicle) ~= 8 then
			
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. HighEndTitle, function(cb)
					if (cb) then
						lscWheelTypesMenu = false
						lscWheelTypesHighEndMenu = true
					end
				end)
				
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. LowriderTitle, function(cb)
					if (cb) then
						lscWheelTypesMenu = false
						lscWheelTypesLowriderMenu = true
					end
				end)
				
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. MuscleTitle, function(cb)
					if (cb) then
						lscWheelTypesMenu = false
						lscWheelTypesMuscleMenu = true
					end
				end)
				
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. OffroadTitle, function(cb)
					if (cb) then
						lscWheelTypesMenu = false
						lscWheelTypesOffroadMenu = true
					end
				end)
				
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. SportTitle, function(cb)
					if (cb) then
						lscWheelTypesMenu = false
						lscWheelTypesSportMenu1 = true
					end
				end)
				
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. SUVTitle, function(cb)
					if (cb) then
						lscWheelTypesMenu = false
						lscWheelTypesSUVMenu = true
					end
				end)
				
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. TunerTitle, function(cb)
					if (cb) then
						lscWheelTypesMenu = false
						lscWheelTypesTunerMenu1 = true
					end
				end)
				
			else
			
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. FrontTitle, function(cb)
					if (cb) then
						lscWheelTypesMenu = false
						lscWheelTypesBikeFrontMenu = true
					end
				end)

				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. BackTitle, function(cb)
					if (cb) then
						lscWheelTypesMenu = false
						lscWheelTypesBikeBackMenu = true
					end
				end)
				
			end
			
			TriggerEvent("FMODT:Update")
			
		elseif lscWheelTypesHighEndMenu then
		
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscWheelTypesHighEndMenu
			else
				lastSelectionlscWheelTypesHighEndMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. WheelTypesTitle .. " (" .. HighEndTitle .. ")")
			
			TriggerEvent("FMODT:Option", "Shadow", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 7)
					SetVehicleMod(vehicle, 23, 0, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Hypher", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 7)
					SetVehicleMod(vehicle, 23, 1, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Blade", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 7)
					SetVehicleMod(vehicle, 23, 2, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Diamond", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 7)
					SetVehicleMod(vehicle, 23, 3, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Supa Gee", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 7)
					SetVehicleMod(vehicle, 23, 4, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Chromatic Z", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 7)
					SetVehicleMod(vehicle, 23, 5, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Merci Ch.Lip", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 7)
					SetVehicleMod(vehicle, 23, 6, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Obey RS", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 7)
					SetVehicleMod(vehicle, 23, 7, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "GT Chrome", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 7)
					SetVehicleMod(vehicle, 23, 8, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Cheetah RR", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 7)
					SetVehicleMod(vehicle, 23, 9, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Solar", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 7)
					SetVehicleMod(vehicle, 23, 10, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Split Ten", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 7)
					SetVehicleMod(vehicle, 23, 11, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Dash VIP", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 7)
					SetVehicleMod(vehicle, 23, 12, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "LozSpeed Ten", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 7)
					SetVehicleMod(vehicle, 23, 13, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Carbon Inferno", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 7)
					SetVehicleMod(vehicle, 23, 14, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Carbon Shadow", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 7)
					SetVehicleMod(vehicle, 23, 15, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Carbonic Z", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 7)
					SetVehicleMod(vehicle, 23, 16, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Carbon Solar", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 7)
					SetVehicleMod(vehicle, 23, 17, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Carbon Cheetah RR", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 7)
					SetVehicleMod(vehicle, 23, 18, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Carbon S Racer", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 7)
					SetVehicleMod(vehicle, 23, 19, true)
				end
			end)
			
			TriggerEvent("FMODT:Update")
			
		elseif lscWheelTypesLowriderMenu then
					
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscWheelTypesLowriderMenu
			else
				lastSelectionlscWheelTypesLowriderMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. WheelTypesTitle .. " (" .. LowriderTitle .. ")")
			
			TriggerEvent("FMODT:Option", "Flare", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 2)
					SetVehicleMod(vehicle, 23, 0, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Wired", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 2)
					SetVehicleMod(vehicle, 23, 1, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Triple Golds", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 2)
					SetVehicleMod(vehicle, 23, 2, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Big Worm", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 2)
					SetVehicleMod(vehicle, 23, 3, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Seven Fives", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 2)
					SetVehicleMod(vehicle, 23, 4, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Split Six", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 2)
					SetVehicleMod(vehicle, 23, 5, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Fresh Mesh", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 2)
					SetVehicleMod(vehicle, 23, 6, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Lead Sled", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 2)
					SetVehicleMod(vehicle, 23, 7, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Turbine", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 2)
					SetVehicleMod(vehicle, 23, 8, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Super Fin", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 2)
					SetVehicleMod(vehicle, 23, 9, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Classic Rod", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 2)
					SetVehicleMod(vehicle, 23, 10, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Dollar", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 2)
					SetVehicleMod(vehicle, 23, 11, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Dukes", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 2)
					SetVehicleMod(vehicle, 23, 12, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Low Five", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 2)
					SetVehicleMod(vehicle, 23, 13, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Gooch", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 2)
					SetVehicleMod(vehicle, 23, 14, true)
				end
			end)
			
			TriggerEvent("FMODT:Update")
			
		elseif lscWheelTypesMuscleMenu then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscWheelTypesMuscleMenu
			else
				lastSelectionlscWheelTypesMuscleMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. WheelTypesTitle .. " (" .. MuscleTitle .. ")")
			
			TriggerEvent("FMODT:Option", "Classic Five", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 1)
					SetVehicleMod(vehicle, 23, 0, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Dukes", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 1)
					SetVehicleMod(vehicle, 23, 1, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Muscle Freak", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 1)
					SetVehicleMod(vehicle, 23, 2, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Kracka", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 1)
					SetVehicleMod(vehicle, 23, 3, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Azreal", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 1)
					SetVehicleMod(vehicle, 23, 4, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Mecha", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 1)
					SetVehicleMod(vehicle, 23, 5, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Black Top", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 1)
					SetVehicleMod(vehicle, 23, 6, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Drag SPL", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 1)
					SetVehicleMod(vehicle, 23, 7, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Revolver", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 1)
					SetVehicleMod(vehicle, 23, 8, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Classic Rod", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 1)
					SetVehicleMod(vehicle, 23, 9, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Fairlie", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 1)
					SetVehicleMod(vehicle, 23, 10, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Spooner", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 1)
					SetVehicleMod(vehicle, 23, 11, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Five Star", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 1)
					SetVehicleMod(vehicle, 23, 12, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Old School", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 1)
					SetVehicleMod(vehicle, 23, 13, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "El Jefe", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 1)
					SetVehicleMod(vehicle, 23, 14, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Dodman", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 1)
					SetVehicleMod(vehicle, 23, 15, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Six Gun", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 1)
					SetVehicleMod(vehicle, 23, 16, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Mercenary", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 1)
					SetVehicleMod(vehicle, 23, 17, true)
				end
			end)
			
			TriggerEvent("FMODT:Update")
			
		elseif lscWheelTypesOffroadMenu then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscWheelTypesOffroadMenu
			else
				lastSelectionlscWheelTypesOffroadMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. WheelTypesTitle .. " (" .. OffroadTitle .. ")")
			
			TriggerEvent("FMODT:Option", "Raider", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 4)
					SetVehicleMod(vehicle, 23, 0, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Mudslinger", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 4)
					SetVehicleMod(vehicle, 23, 1, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Nevis", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 4)
					SetVehicleMod(vehicle, 23, 2, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Cairngorm", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 4)
					SetVehicleMod(vehicle, 23, 3, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Amazon", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 4)
					SetVehicleMod(vehicle, 23, 4, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Challenger", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 4)
					SetVehicleMod(vehicle, 23, 5, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Dune Basher", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 4)
					SetVehicleMod(vehicle, 23, 6, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Five Star", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 4)
					SetVehicleMod(vehicle, 23, 7, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Rock Crawler", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 4)
					SetVehicleMod(vehicle, 23, 8, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Mil Spec Steelie", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 4)
					SetVehicleMod(vehicle, 23, 9, true)
				end
			end)
			
			TriggerEvent("FMODT:Update")
			
		elseif lscWheelTypesSportMenu1 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscWheelTypesSportMenu1
			else
				lastSelectionlscWheelTypesSportMenu1 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					lscWheelTypesSportMenu1 = false
					lscWheelTypesSportMenu2 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					lscWheelTypesSportMenu1 = false
					lscWheelTypesSportMenu2 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. WheelTypesTitle .. " (" .. SportTitle .. ")")
			
			TriggerEvent("FMODT:Option", "Inferno", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 0)
					SetVehicleMod(vehicle, 23, 0, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Deep Five", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 0)
					SetVehicleMod(vehicle, 23, 1, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "LozSpeed Mk.V", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 0)
					SetVehicleMod(vehicle, 23, 2, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Diamond Cut", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 0)
					SetVehicleMod(vehicle, 23, 3, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Chrono", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 0)
					SetVehicleMod(vehicle, 23, 4, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Feroci RR", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 0)
					SetVehicleMod(vehicle, 23, 5, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "FiftyNine", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 0)
					SetVehicleMod(vehicle, 23, 6, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Mercie", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 0)
					SetVehicleMod(vehicle, 23, 7, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Synthetic Z", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 0)
					SetVehicleMod(vehicle, 23, 8, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Organic Type 0", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 0)
					SetVehicleMod(vehicle, 23, 9, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Endo v.1", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 0)
					SetVehicleMod(vehicle, 23, 10, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "GT One", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 0)
					SetVehicleMod(vehicle, 23, 11, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Duper 7", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 0)
					SetVehicleMod(vehicle, 23, 12, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Uzer", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 0)
					SetVehicleMod(vehicle, 23, 13, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "GroundRide", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 0)
					SetVehicleMod(vehicle, 23, 14, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "S Racer", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 0)
					SetVehicleMod(vehicle, 23, 15, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Venum", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 0)
					SetVehicleMod(vehicle, 23, 16, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Cosmo", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 0)
					SetVehicleMod(vehicle, 23, 17, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Dash VIP", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 0)
					SetVehicleMod(vehicle, 23, 18, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Ice Kid", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 0)
					SetVehicleMod(vehicle, 23, 19, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 1", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 1")
				end
			end)
			
			TriggerEvent("FMODT:Update")
			
		elseif lscWheelTypesSportMenu2 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscWheelTypesSportMenu2
			else
				lastSelectionlscWheelTypesSportMenu2 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					lscWheelTypesSportMenu2 = false
					lscWheelTypesSportMenu1 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					lscWheelTypesSportMenu2 = false
					lscWheelTypesSportMenu1 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. WheelTypesTitle .. " (" .. SportTitle .. ")")
			
			TriggerEvent("FMODT:Option", "Ruff Weld", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 0)
					SetVehicleMod(vehicle, 23, 20, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Wangan Master", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 0)
					SetVehicleMod(vehicle, 23, 21, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Super Five", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 0)
					SetVehicleMod(vehicle, 23, 22, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Endo v.2", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 0)
					SetVehicleMod(vehicle, 23, 23, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Split Six", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 0)
					SetVehicleMod(vehicle, 23, 24, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 2", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 2")
				end
			end)
			
			TriggerEvent("FMODT:Update")
			
		elseif lscWheelTypesSUVMenu then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscWheelTypesSUVMenu
			else
				lastSelectionlscWheelTypesSUVMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. WheelTypesTitle .. " (" .. SUVTitle .. ")")
			
			TriggerEvent("FMODT:Option", "VIP", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 3)
					SetVehicleMod(vehicle, 23, 0, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Benefactor", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 3)
					SetVehicleMod(vehicle, 23, 1, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Cosmo", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 3)
					SetVehicleMod(vehicle, 23, 2, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Bippu", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 3)
					SetVehicleMod(vehicle, 23, 3, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Royal Six", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 3)
					SetVehicleMod(vehicle, 23, 4, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Fagorme", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 3)
					SetVehicleMod(vehicle, 23, 5, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Deluxe", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 3)
					SetVehicleMod(vehicle, 23, 6, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Iced Out", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 3)
					SetVehicleMod(vehicle, 23, 7, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Cognoscenti", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 3)
					SetVehicleMod(vehicle, 23, 8, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "LozSpeed Ten", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 3)
					SetVehicleMod(vehicle, 23, 9, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Supernova", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 3)
					SetVehicleMod(vehicle, 23, 10, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Obey RS", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 3)
					SetVehicleMod(vehicle, 23, 11, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "LozSpeed Baller", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 3)
					SetVehicleMod(vehicle, 23, 12, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Extravaganzo", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 3)
					SetVehicleMod(vehicle, 23, 13, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Split Six", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 3)
					SetVehicleMod(vehicle, 23, 14, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Empowered", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 3)
					SetVehicleMod(vehicle, 23, 15, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Sunrise", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 3)
					SetVehicleMod(vehicle, 23, 16, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Dash VIP", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 3)
					SetVehicleMod(vehicle, 23, 17, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Cutter", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 3)
					SetVehicleMod(vehicle, 23, 18, true)
				end
			end)
			
			TriggerEvent("FMODT:Update")
			
		elseif lscWheelTypesTunerMenu1 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscWheelTypesTunerMenu1
			else
				lastSelectionlscWheelTypesTunerMenu1 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					lscWheelTypesTunerMenu1 = false
					lscWheelTypesTunerMenu2 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					lscWheelTypesTunerMenu1 = false
					lscWheelTypesTunerMenu2 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. WheelTypesTitle .. " (" .. TunerTitle .. ")")
			
			TriggerEvent("FMODT:Option", "Cosmo", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 5)
					SetVehicleMod(vehicle, 23, 0, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Super Mesh", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 5)
					SetVehicleMod(vehicle, 23, 1, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Outsider", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 5)
					SetVehicleMod(vehicle, 23, 2, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Rollas", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 5)
					SetVehicleMod(vehicle, 23, 3, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Driftmeister", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 5)
					SetVehicleMod(vehicle, 23, 4, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Slicer", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 5)
					SetVehicleMod(vehicle, 23, 5, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "El Quatro", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 5)
					SetVehicleMod(vehicle, 23, 6, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Dubbed", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 5)
					SetVehicleMod(vehicle, 23, 7, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Five Star", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 5)
					SetVehicleMod(vehicle, 23, 8, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Slideways", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 5)
					SetVehicleMod(vehicle, 23, 9, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Apex", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 5)
					SetVehicleMod(vehicle, 23, 10, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Stanced EG", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 5)
					SetVehicleMod(vehicle, 23, 11, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Countersteer", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 5)
					SetVehicleMod(vehicle, 23, 12, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Endo v.1", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 5)
					SetVehicleMod(vehicle, 23, 13, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Endo v.2 Dish", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 5)
					SetVehicleMod(vehicle, 23, 14, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Gruppe Z", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 5)
					SetVehicleMod(vehicle, 23, 15, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Choku-Dori", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 5)
					SetVehicleMod(vehicle, 23, 16, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Chicane", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 5)
					SetVehicleMod(vehicle, 23, 17, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Saisoku", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 5)
					SetVehicleMod(vehicle, 23, 18, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Dished Eight", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 5)
					SetVehicleMod(vehicle, 23, 19, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 1", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 1")
				end
			end)
			
			TriggerEvent("FMODT:Update")
			
		elseif lscWheelTypesTunerMenu2 then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscWheelTypesTunerMenu2
			else
				lastSelectionlscWheelTypesTunerMenu2 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					lscWheelTypesTunerMenu2 = false
					lscWheelTypesTunerMenu1 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					lscWheelTypesTunerMenu2 = false
					lscWheelTypesTunerMenu1 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. WheelTypesTitle .. " (" .. TunerTitle .. ")")
			
			TriggerEvent("FMODT:Option", "Fujiwara", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 5)
					SetVehicleMod(vehicle, 23, 20, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Zokusha", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 5)
					SetVehicleMod(vehicle, 23, 21, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Battle VIII", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 5)
					SetVehicleMod(vehicle, 23, 22, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Rally Master", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 5)
					SetVehicleMod(vehicle, 23, 23, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 2", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 2")
				end
			end)
			
			TriggerEvent("FMODT:Update")
			
		elseif lscWheelTypesBikeFrontMenu then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscWheelTypesBikeFrontMenu
			else
				lastSelectionlscWheelTypesBikeFrontMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. WheelTypesTitle .. " (" .. FrontTitle .. ")")
			
			TriggerEvent("FMODT:Option", "Stock Wheels", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, -1)
					SetVehicleMod(vehicle, 23, -1, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Speedway", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 6)
					SetVehicleMod(vehicle, 23, 0, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Street Special", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 6)
					SetVehicleMod(vehicle, 23, 1, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Racer", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 6)
					SetVehicleMod(vehicle, 23, 2, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Track Star", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 6)
					SetVehicleMod(vehicle, 23, 3, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Overload", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 6)
					SetVehicleMod(vehicle, 23, 4, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Trident", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 6)
					SetVehicleMod(vehicle, 23, 5, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Triple Threat", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 6)
					SetVehicleMod(vehicle, 23, 6, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Stilleto", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 6)
					SetVehicleMod(vehicle, 23, 7, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Wires", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 6)
					SetVehicleMod(vehicle, 23, 8, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Bobber", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 6)
					SetVehicleMod(vehicle, 23, 9, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Solidus", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 6)
					SetVehicleMod(vehicle, 23, 10, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Ice Shield", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 6)
					SetVehicleMod(vehicle, 23, 11, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Loops", function(cb)
				if (cb) then
					SetVehicleWheelType(vehicle, 6)
					SetVehicleMod(vehicle, 23, 12, true)
				end
			end)
			
			TriggerEvent("FMODT:Update")
			
		elseif lscWheelTypesBikeBackMenu then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionlscWheelTypesBikeBackMenu
			else
				lastSelectionlscWheelTypesBikeBackMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. WheelTypesTitle .. " (" .. BackTitle .. ")")
			
			TriggerEvent("FMODT:Option", "Stock Wheels", function(cb)
				if (cb) then
					SetVehicleMod(vehicle, 24, -1, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Speedway", function(cb)
				if (cb) then
					SetVehicleMod(vehicle, 24, 0, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Street Special", function(cb)
				if (cb) then
					SetVehicleMod(vehicle, 24, 1, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Racer", function(cb)
				if (cb) then
					SetVehicleMod(vehicle, 24, 2, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Track Star", function(cb)
				if (cb) then
					SetVehicleMod(vehicle, 24, 3, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Overload", function(cb)
				if (cb) then
					SetVehicleMod(vehicle, 24, 4, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Trident", function(cb)
				if (cb) then
					SetVehicleMod(vehicle, 24, 5, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Triple Threat", function(cb)
				if (cb) then
					SetVehicleMod(vehicle, 24, 6, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Stilleto", function(cb)
				if (cb) then
					SetVehicleMod(vehicle, 24, 7, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Wires", function(cb)
				if (cb) then
					SetVehicleMod(vehicle, 24, 8, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Bobber", function(cb)
				if (cb) then
					SetVehicleMod(vehicle, 24, 9, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Solidus", function(cb)
				if (cb) then
					SetVehicleMod(vehicle, 24, 10, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Ice Shield", function(cb)
				if (cb) then
					SetVehicleMod(vehicle, 24, 11, true)
				end
			end)
			
			TriggerEvent("FMODT:Option", "Loops", function(cb)
				if (cb) then
					SetVehicleMod(vehicle, 24, 12, true)
				end
			end)
			
			TriggerEvent("FMODT:Update")
			
		end
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Bennys Motorworks Menu				[Multiple Pages]
	 while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)

		if (bmMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionbmMenu
			else
				lastSelectionbmMenu = currentOption
			end
		
			SetVehicleModKit(playerVeh, 0)
			
			TriggerEvent("FMODT:Title", "~y~Bennys Motorworks")

			if GetNumVehicleMods(playerVeh, 40) > 0 then --Air Filter
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. AirFilterTitle, function(cb)
					if (cb) then
						bmMenu = false
						bmMenuAirFilter = true
					end
				end)
			end

			if GetNumVehicleMods(playerVeh, 42) > 0 then --Arch Cover
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. ArchCoverTitle, function(cb)
					if (cb) then
						bmMenu = false
						bmMenuArchCover = true
					end
				end)
			end

			if GetNumVehicleMods(playerVeh, 43) > 0 then --Bonnet Pins
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. BonnetPinsTitle, function(cb)
					if (cb) then
						bmMenu = false
						bmMenuBonnetPins = true
					end
				end)
			end

			if GetNumVehicleMods(playerVeh, 26) > 0 then --Canards/Vanity Plates
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. CanardsVanityPlatesTitle, function(cb)
					if (cb) then
						bmMenu = false
						bmMenuCanards = true
					end
				end)
			end

			if GetNumVehicleMods(playerVeh, 29) > 0 then --Dashboard
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. DashboardTitle, function(cb)
					if (cb) then
						bmMenu = false
						bmMenuDashboard = true
					end
				end)
			end

			if GetNumVehicleMods(playerVeh, 30) > 0 then --Dial Design
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. DialDesignTitle, function(cb)
					if (cb) then
						bmMenu = false
						bmMenuDials = true
					end
				end)
			end

			if GetNumVehicleMods(playerVeh, 31) > 0 then --Doors
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. DoorsTitle, function(cb)
					if (cb) then
						bmMenu = false
						bmMenuDoor = true
					end
				end)
			end

			if GetNumVehicleMods(playerVeh, 39) > 0 then --Engine Block
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. EngineBlockTitle, function(cb)
					if (cb) then
						bmMenu = false
						bmMenuEngineBlock = true
					end
				end)
			end

			if GetNumVehicleMods(playerVeh, 38) > 0 then --Hydraulics
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. HydraulicsTitle, function(cb)
					if (cb) then
						bmMenu = false
						bmMenuHydraulics = true
					end
				end)
			end

			if GetNumVehicleMods(playerVeh, 28) > 0 then --Ornaments
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. OrnamentsTitle, function(cb)
					if (cb) then
						bmMenu = false
						bmMenuOrnaments = true
					end
				end)
			end

			if GetNumVehicleMods(playerVeh, 35) > 0 then --Plaques
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. PlaquesTitle, function(cb)
					if (cb) then
						bmMenu = false
						bmMenuPlaques = true
					end
				end)
			end

			if GetNumVehicleMods(playerVeh, 25) > 0 then --Plate Holder
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. PlateHolderTitle, function(cb)
					if (cb) then
						bmMenu = false
						bmMenuPlateHolder = true
					end
				end)
			end

			if GetNumVehicleMods(playerVeh, 32) > 0 then --Seats
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. SeatsTitle, function(cb)
					if (cb) then
						bmMenu = false
						bmMenuSeats = true
					end
				end)
			end

			if GetNumVehicleMods(playerVeh, 34) > 0 then --Shift Lever
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. ShiftLeverTitle, function(cb)
					if (cb) then
						bmMenu = false
						bmMenuShiftLever = true
					end
				end)
			end

			if GetNumVehicleMods(playerVeh, 36) > 0 then --Speakers
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. SpeakersTitle, function(cb)
					if (cb) then
						bmMenu = false
						bmMenuSpeakers = true
					end
				end)
			end

			if GetNumVehicleMods(playerVeh, 33) > 0 then --Steering Wheel
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. SteeringWheelTitle, function(cb)
					if (cb) then
						bmMenu = false
						bmMenuSteeringWheel = true
					end
				end)
			end

			if GetNumVehicleMods(playerVeh, 41) > 0 then --Struts
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. StrutsTitle, function(cb)
					if (cb) then
						bmMenu = false
						bmMenuStruts = true
					end
				end)
			end

			if GetNumVehicleMods(playerVeh, 45) > 0 then --Tank
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. TankTitle, function(cb)
					if (cb) then
						bmMenu = false
						bmMenuTank = true
					end
				end)
			end

			if GetNumVehicleMods(playerVeh, 44) > 0 then --Trim
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. TrimTitle, function(cb)
					if (cb) then
						bmMenu = false
						bmMenuTrim = true
					end
				end)
			end

			if GetNumVehicleMods(playerVeh, 27) > 0 then --Trim Design
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. TrimDesignTitle, function(cb)
					if (cb) then
						bmMenu = false
						bmMenuTrimDesign = true
					end
				end)
			end

			if GetNumVehicleMods(playerVeh, 37) > 0 then --Trunk
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. TrunkTitle, function(cb)
					if (cb) then
						bmMenu = false
						bmMenuTrunk = true
					end
				end)
			end

			TriggerEvent("FMODT:Update")
			
		end
		
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --BM Air Filter Menu
	local int = -1
	local name
	local ModPart = 40
	local ModName = AirFilterTitle
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, ModPart)
		name = GetLabelText(GetModTextLabel(vehicle, ModPart, GetVehicleMod(vehicle, ModPart)))

		if (bmMenuAirFilter) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionbmMenuAirFilter
			else
				lastSelectionbmMenuAirFilter = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ModName .. " Menu")
			
			TriggerEvent("FMODT:Int", ModName, int, -1, (GetNumVehicleMods(vehicle, ModPart) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, ModPart, int)
				name = GetLabelText(GetModTextLabel(vehicle, ModPart, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle .. " " .. ModName .. "", function(cb)
					if (cb) then
						drawNotification("~r~" .. StockTitle .. " " .. ModName .. "")
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						drawNotification("~g~" .. name)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --BM Arch Cover Menu
	local int = -1
	local name
	local ModPart = 42
	local ModName = ArchCoverTitle
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, ModPart)
		name = GetLabelText(GetModTextLabel(vehicle, ModPart, GetVehicleMod(vehicle, ModPart)))

		if (bmMenuArchCover) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionbmMenuArchCover
			else
				lastSelectionbmMenuArchCover = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ModName .. " Menu")
			
			TriggerEvent("FMODT:Int", ModName, int, -1, (GetNumVehicleMods(vehicle, ModPart) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, ModPart, int)
				name = GetLabelText(GetModTextLabel(vehicle, ModPart, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle .. " " .. ModName .. "", function(cb)
					if (cb) then
						drawNotification("~r~" .. StockTitle .. " " .. ModName .. "")
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						drawNotification("~g~" .. name)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --BM Bonnet Pins Menu
	local int = -1
	local name
	local ModPart = 43
	local ModName = BonnetPinsTitle
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, ModPart)
		name = GetLabelText(GetModTextLabel(vehicle, ModPart, GetVehicleMod(vehicle, ModPart)))

		if (bmMenuBonnetPins) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionbmMenuBonnetPins
			else
				lastSelectionbmMenuBonnetPins = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ModName .. " Menu")
			
			TriggerEvent("FMODT:Int", ModName, int, -1, (GetNumVehicleMods(vehicle, ModPart) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, ModPart, int)
				name = GetLabelText(GetModTextLabel(vehicle, ModPart, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle .. " " .. ModName .. "", function(cb)
					if (cb) then
						drawNotification("~r~" .. StockTitle .. " " .. ModName .. "")
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						drawNotification("~g~" .. name)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --BM Canards/Vanity Plates Menu
	local int = -1
	local name
	local ModPart = 26
	local ModName = CanardsVanityPlatesTitle
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, ModPart)
		name = GetLabelText(GetModTextLabel(vehicle, ModPart, GetVehicleMod(vehicle, ModPart)))

		if (bmMenuCanards) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionbmMenuCanards
			else
				lastSelectionbmMenuCanards = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ModName .. " Menu")
			
			TriggerEvent("FMODT:Int", ModName, int, -1, (GetNumVehicleMods(vehicle, ModPart) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, ModPart, int)
				name = GetLabelText(GetModTextLabel(vehicle, ModPart, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle .. " " .. ModName .. "", function(cb)
					if (cb) then
						drawNotification("~r~" .. StockTitle .. " " .. ModName .. "")
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						drawNotification("~g~" .. name)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --BM Dashboard Menu
	local int = -1
	local name
	local ModPart = 29
	local ModName = DashboardTitle
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, ModPart)
		name = GetLabelText(GetModTextLabel(vehicle, ModPart, GetVehicleMod(vehicle, ModPart)))

		if (bmMenuDashboard) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionbmMenuDashboard
			else
				lastSelectionbmMenuDashboard = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ModName .. " Menu")
			
			TriggerEvent("FMODT:Int", ModName, int, -1, (GetNumVehicleMods(vehicle, ModPart) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, ModPart, int)
				name = GetLabelText(GetModTextLabel(vehicle, ModPart, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle .. " " .. ModName .. "", function(cb)
					if (cb) then
						drawNotification("~r~" .. StockTitle .. " " .. ModName .. "")
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						drawNotification("~g~" .. name)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --BM Dial Design Menu
	local int = -1
	local name
	local ModPart = 30
	local ModName = DialDesignTitle
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, ModPart)
		name = GetLabelText(GetModTextLabel(vehicle, ModPart, GetVehicleMod(vehicle, ModPart)))

		if (bmMenuDials) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionbmMenuDials
			else
				lastSelectionbmMenuDials = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ModName .. " Menu")
			
			TriggerEvent("FMODT:Int", ModName, int, -1, (GetNumVehicleMods(vehicle, ModPart) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, ModPart, int)
				name = GetLabelText(GetModTextLabel(vehicle, ModPart, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle .. " " .. ModName .. "", function(cb)
					if (cb) then
						drawNotification("~r~" .. StockTitle .. " " .. ModName .. "")
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						drawNotification("~g~" .. name)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --BM Door Menu
	local int = -1
	local name
	local ModPart = 31
	local ModName = DoorsTitle
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, ModPart)
		name = GetLabelText(GetModTextLabel(vehicle, ModPart, GetVehicleMod(vehicle, ModPart)))

		if (bmMenuDoor) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionbmMenuDoor
			else
				lastSelectionbmMenuDoor = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ModName .. " Menu")
			
			TriggerEvent("FMODT:Int", ModName, int, -1, (GetNumVehicleMods(vehicle, ModPart) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, ModPart, int)
				name = GetLabelText(GetModTextLabel(vehicle, ModPart, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle .. " " .. ModName .. "", function(cb)
					if (cb) then
						drawNotification("~r~" .. StockTitle .. " " .. ModName .. "")
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						drawNotification("~g~" .. name)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --BM Engine Block Menu
	local int = -1
	local name
	local ModPart = 39
	local ModName = EngineBlockTitle
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, ModPart)
		name = GetLabelText(GetModTextLabel(vehicle, ModPart, GetVehicleMod(vehicle, ModPart)))

		if (bmMenuEngineBlock) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionbmMenuEngineBlock
			else
				lastSelectionbmMenuEngineBlock = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ModName .. " Menu")
			
			TriggerEvent("FMODT:Int", ModName, int, -1, (GetNumVehicleMods(vehicle, ModPart) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, ModPart, int)
				name = GetLabelText(GetModTextLabel(vehicle, ModPart, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle .. " " .. ModName .. "", function(cb)
					if (cb) then
						drawNotification("~r~" .. StockTitle .. " " .. ModName .. "")
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						drawNotification("~g~" .. name)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --BM Hydraulics Menu
	local int = -1
	local name
	local ModPart = 38
	local ModName = HydraulicsTitle
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, ModPart)
		name = GetLabelText(GetModTextLabel(vehicle, ModPart, GetVehicleMod(vehicle, ModPart)))

		if (bmMenuHydraulics) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionbmMenuHydraulics
			else
				lastSelectionbmMenuHydraulics = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ModName .. " Menu")
			
			TriggerEvent("FMODT:Int", ModName, int, -1, (GetNumVehicleMods(vehicle, ModPart) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, ModPart, int)
				name = GetLabelText(GetModTextLabel(vehicle, ModPart, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle .. " " .. ModName .. "", function(cb)
					if (cb) then
						drawNotification("~r~" .. StockTitle .. " " .. ModName .. "")
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						drawNotification("~g~" .. name)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --BM Ornaments Menu
	local int = -1
	local name
	local ModPart = 28
	local ModName = OrnamentsTitle
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, ModPart)
		name = GetLabelText(GetModTextLabel(vehicle, ModPart, GetVehicleMod(vehicle, ModPart)))

		if (bmMenuOrnaments) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionbmMenuOrnaments
			else
				lastSelectionbmMenuOrnaments = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ModName .. " Menu")
			
			TriggerEvent("FMODT:Int", ModName, int, -1, (GetNumVehicleMods(vehicle, ModPart) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, ModPart, int)
				name = GetLabelText(GetModTextLabel(vehicle, ModPart, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle .. " " .. ModName .. "", function(cb)
					if (cb) then
						drawNotification("~r~" .. StockTitle .. " " .. ModName .. "")
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						drawNotification("~g~" .. name)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --BM Plaques Menu
	local int = -1
	local name
	local ModPart = 35
	local ModName = PlaquesTitle
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, ModPart)
		name = GetLabelText(GetModTextLabel(vehicle, ModPart, GetVehicleMod(vehicle, ModPart)))

		if (bmMenuPlaques) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionbmMenuPlaques
			else
				lastSelectionbmMenuPlaques = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ModName .. " Menu")
			
			TriggerEvent("FMODT:Int", ModName, int, -1, (GetNumVehicleMods(vehicle, ModPart) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, ModPart, int)
				name = GetLabelText(GetModTextLabel(vehicle, ModPart, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle .. " " .. ModName .. "", function(cb)
					if (cb) then
						drawNotification("~r~" .. StockTitle .. " " .. ModName .. "")
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						drawNotification("~g~" .. name)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --BM Plate Holder Menu
	local int = -1
	local name
	local ModPart = 25
	local ModName = PlateHolderTitle
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, ModPart)
		name = GetLabelText(GetModTextLabel(vehicle, ModPart, GetVehicleMod(vehicle, ModPart)))

		if (bmMenuPlateHolder) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionbmMenuPlateHolder
			else
				lastSelectionbmMenuPlateHolder = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ModName .. " Menu")
			
			TriggerEvent("FMODT:Int", ModName, int, -1, (GetNumVehicleMods(vehicle, ModPart) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, ModPart, int)
				name = GetLabelText(GetModTextLabel(vehicle, ModPart, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle .. " " .. ModName .. "", function(cb)
					if (cb) then
						drawNotification("~r~" .. StockTitle .. " " .. ModName .. "")
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						drawNotification("~g~" .. name)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --BM Seats Menu
	local int = -1
	local name
	local ModPart = 32
	local ModName = SeatsTitle
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, ModPart)
		name = GetLabelText(GetModTextLabel(vehicle, ModPart, GetVehicleMod(vehicle, ModPart)))

		if (bmMenuSeats) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionbmMenuSeats
			else
				lastSelectionbmMenuSeats = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ModName .. " Menu")
			
			TriggerEvent("FMODT:Int", ModName, int, -1, (GetNumVehicleMods(vehicle, ModPart) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, ModPart, int)
				name = GetLabelText(GetModTextLabel(vehicle, ModPart, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle .. " " .. ModName .. "", function(cb)
					if (cb) then
						drawNotification("~r~" .. StockTitle .. " " .. ModName .. "")
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						drawNotification("~g~" .. name)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --BM Shift Lever Menu
	local int = -1
	local name
	local ModPart = 34
	local ModName = ShiftLeverTitle
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, ModPart)
		name = GetLabelText(GetModTextLabel(vehicle, ModPart, GetVehicleMod(vehicle, ModPart)))

		if (bmMenuShiftLever) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionbmMenuShiftLever
			else
				lastSelectionbmMenuShiftLever = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ModName .. " Menu")
			
			TriggerEvent("FMODT:Int", ModName, int, -1, (GetNumVehicleMods(vehicle, ModPart) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, ModPart, int)
				name = GetLabelText(GetModTextLabel(vehicle, ModPart, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle .. " " .. ModName .. "", function(cb)
					if (cb) then
						drawNotification("~r~" .. StockTitle .. " " .. ModName .. "")
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						drawNotification("~g~" .. name)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --BM Speakers Menu
	local int = -1
	local name
	local ModPart = 36
	local ModName = SpeakersTitle
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, ModPart)
		name = GetLabelText(GetModTextLabel(vehicle, ModPart, GetVehicleMod(vehicle, ModPart)))

		if (bmMenuSpeakers) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionbmMenuSpeakers
			else
				lastSelectionbmMenuSpeakers = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ModName .. " Menu")
			
			TriggerEvent("FMODT:Int", ModName, int, -1, (GetNumVehicleMods(vehicle, ModPart) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, ModPart, int)
				name = GetLabelText(GetModTextLabel(vehicle, ModPart, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle .. " " .. ModName .. "", function(cb)
					if (cb) then
						drawNotification("~r~" .. StockTitle .. " " .. ModName .. "")
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						drawNotification("~g~" .. name)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --BM Steering Wheel Menu
	local int = -1
	local name
	local ModPart = 33
	local ModName = SteeringWheelTitle
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, ModPart)
		name = GetLabelText(GetModTextLabel(vehicle, ModPart, GetVehicleMod(vehicle, ModPart)))

		if (bmMenuSteeringWheel) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionbmMenuSteeringWheel
			else
				lastSelectionbmMenuSteeringWheel = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ModName .. " Menu")
			
			TriggerEvent("FMODT:Int", ModName, int, -1, (GetNumVehicleMods(vehicle, ModPart) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, ModPart, int)
				name = GetLabelText(GetModTextLabel(vehicle, ModPart, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle .. " " .. ModName .. "", function(cb)
					if (cb) then
						drawNotification("~r~" .. StockTitle .. " " .. ModName .. "")
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						drawNotification("~g~" .. name)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --BM Struts Menu
	local int = -1
	local name
	local ModPart = 41
	local ModName = StrutsTitle
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, ModPart)
		name = GetLabelText(GetModTextLabel(vehicle, ModPart, GetVehicleMod(vehicle, ModPart)))

		if (bmMenuStruts) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionbmMenuStruts
			else
				lastSelectionbmMenuStruts = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ModName .. " Menu")
			
			TriggerEvent("FMODT:Int", ModName, int, -1, (GetNumVehicleMods(vehicle, ModPart) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, ModPart, int)
				name = GetLabelText(GetModTextLabel(vehicle, ModPart, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle .. " " .. ModName .. "", function(cb)
					if (cb) then
						drawNotification("~r~" .. StockTitle .. " " .. ModName .. "")
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						drawNotification("~g~" .. name)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --BM Tank Menu
	local int = -1
	local name
	local ModPart = 45
	local ModName = TankTitle
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, ModPart)
		name = GetLabelText(GetModTextLabel(vehicle, ModPart, GetVehicleMod(vehicle, ModPart)))

		if (bmMenuTank) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionbmMenuTank
			else
				lastSelectionbmMenuTank = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ModName .. " Menu")
			
			TriggerEvent("FMODT:Int", ModName, int, -1, (GetNumVehicleMods(vehicle, ModPart) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, ModPart, int)
				name = GetLabelText(GetModTextLabel(vehicle, ModPart, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle .. " " .. ModName .. "", function(cb)
					if (cb) then
						drawNotification("~r~" .. StockTitle .. " " .. ModName .. "")
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						drawNotification("~g~" .. name)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --BM Trim Menu
	local int = -1
	local name
	local ModPart = 44
	local ModName = TrimTitle
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, ModPart)
		name = GetLabelText(GetModTextLabel(vehicle, ModPart, GetVehicleMod(vehicle, ModPart)))

		if (bmMenuTrim) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionbmMenuTrim
			else
				lastSelectionbmMenuTrim = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ModName .. " Menu")
			
			TriggerEvent("FMODT:Int", ModName, int, -1, (GetNumVehicleMods(vehicle, ModPart) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, ModPart, int)
				name = GetLabelText(GetModTextLabel(vehicle, ModPart, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle .. " " .. ModName .. "", function(cb)
					if (cb) then
						drawNotification("~r~" .. StockTitle .. " " .. ModName .. "")
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						drawNotification("~g~" .. name)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --BM Trim Design Menu
	local int = -1
	local name
	local ModPart = 27
	local ModName = TrimDesignTitle
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, ModPart)
		name = GetLabelText(GetModTextLabel(vehicle, ModPart, GetVehicleMod(vehicle, ModPart)))

		if (bmMenuTrimDesign) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionbmMenuTrimDesign
			else
				lastSelectionbmMenuTrimDesign = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ModName .. " Menu")
			
			TriggerEvent("FMODT:Int", ModName, int, -1, (GetNumVehicleMods(vehicle, ModPart) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, ModPart, int)
				name = GetLabelText(GetModTextLabel(vehicle, ModPart, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle .. " " .. ModName .. "", function(cb)
					if (cb) then
						drawNotification("~r~" .. StockTitle .. " " .. ModName .. "")
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						drawNotification("~g~" .. name)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --BM Trunk Menu
	local int = -1
	local name
	local ModPart = 37
	local ModName = TrunkTitle
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
		
		int = GetVehicleMod(vehicle, ModPart)
		name = GetLabelText(GetModTextLabel(vehicle, ModPart, GetVehicleMod(vehicle, ModPart)))

		if (bmMenuTrunk) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionbmMenuTrunk
			else
				lastSelectionbmMenuTrunk = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ModName .. " Menu")
			
			TriggerEvent("FMODT:Int", ModName, int, -1, (GetNumVehicleMods(vehicle, ModPart) - 1), function(cb)
				int = cb
				SetVehicleMod(vehicle, ModPart, int)
				name = GetLabelText(GetModTextLabel(vehicle, ModPart, int))
			end)
			if (int == -1) then
				TriggerEvent("FMODT:Option", "~r~" .. StockTitle .. " " .. ModName .. "", function(cb)
					if (cb) then
						drawNotification("~r~" .. StockTitle .. " " .. ModName .. "")
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~g~" .. name, function(cb)
					if (cb) then
						drawNotification("~g~" .. name)
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Extras Menu
	local extra = 1
	local extraToggle = {}
	local ExtraCount = 0
	local extraTrailer = 1
	local extraToggleTrailer = {}
	local ExtraCountTrailer = 0
	while true do
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if (extraMenu) then
		
			if (IsVehicleExtraTurnedOn(playerVeh, extra) == 1) then
				extraToggle[extra] = true
			else
				extraToggle[extra] = false
			end
			
			ExtraCount = 0
			for i = 1, 14 do
				if (DoesExtraExist(playerVeh, i) == 1) then
					ExtraCount = ExtraCount + 1
				end
			end
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionextraMenu
			else
				lastSelectionextraMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ExtrasTitle .. "")
			
			if GotTrailer then
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. TrailerExtrasTitle .. "", function(cb)
					if(cb) then
						extraMenu = false
						extraMenuTrailer = true
					end
				end)
			end

			if ExtraCount == 0 then
				TriggerEvent("FMODT:Option", "Your Vehicle Has No Extras", function(cb)
					if(cb) then
						drawNotification("Your Vehicle Has No Extras!")
					end
				end)
			else
				TriggerEvent("FMODT:Option", "Your Vehicle Has ~y~" .. ExtraCount .. " ~s~Extras", function(cb)
					if(cb) then
						drawNotification("Your Vehicle Has ~y~" .. ExtraCount .. " ~s~Extras!")
					end
				end)
			end
			
			TriggerEvent("FMODT:Int", ExtraTitle, extra, 1, 14, function(cb)
				extra = cb
				if (IsVehicleExtraTurnedOn(playerVeh, extra) == 1) then
					extraToggle[extra] = true
				else
					extraToggle[extra] = false
				end
			end)

			if (DoesExtraExist(playerVeh, extra) == 1) then
				TriggerEvent("FMODT:Bool", ExtraToggleTitle, extraToggle[extra], function(cb)
					extraToggle[extra] = cb
					if extraToggle[extra] then
						SetVehicleExtra(playerVeh, extra, false)
						drawNotification("~g~" .. ExtraTitle .. " " .. extra .. " - " .. ExtraEnabledTitle .. "!")
					else
						SetVehicleExtra(playerVeh, extra, true)
						drawNotification("~r~" .. ExtraTitle .. " " .. extra .. " - " .. ExtraDisabledTitle .. "!")
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~r~" .. ExtraTitle .. " " .. extra .. " - " .. NotExisting .. "!", function(cb)
					if (cb) then
						drawNotification("~r~" .. ExtraTitle .. " " .. extra .. " - " .. NotExisting .. "!")
					end
				end)
			end

			TriggerEvent("FMODT:Update")
			
		elseif (extraMenuTrailer) then
		
			if (IsVehicleExtraTurnedOn(TrailerHandle, extraTrailer) == 1) then
				extraToggleTrailer[extraTrailer] = true
			else
				extraToggleTrailer[extraTrailer] = false
			end
			
			ExtraCountTrailer = 0
			
			for i = 1, 14 do
				if (DoesExtraExist(TrailerHandle, i) == 1) then
					ExtraCountTrailer = ExtraCountTrailer + 1
				end
			end
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionextraTrailerMenu
			else
				lastSelectionextraTrailerMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. TrailerExtrasTitle .. "")
			
			if ExtraCountTrailer == 0 then
				TriggerEvent("FMODT:Option", "Your Trailer Has No Extras", function(cb)
					if(cb) then
						drawNotification("Your Trailer Has No Extras!")
					end
				end)
			else
				TriggerEvent("FMODT:Option", "Your Trailer Has ~y~" .. ExtraCountTrailer .. " ~s~Extras", function(cb)
					if(cb) then
						drawNotification("Your Trailer Has ~y~" .. ExtraCountTrailer .. " ~s~Extras!")
					end
				end)
			end
			
			TriggerEvent("FMODT:Int", TrailerExtraTitle, extraTrailer, 1, 14, function(cb)
				extraTrailer = cb
				if (IsVehicleExtraTurnedOn(TrailerHandle, extraTrailer) == 1) then
					extraToggleTrailer[extraTrailer] = true
				else
					extraToggleTrailer[extraTrailer] = false
				end
			end)

			if (DoesExtraExist(TrailerHandle, extraTrailer) == 1) then
				TriggerEvent("FMODT:Bool", TrailerExtraToggleTitle, extraToggleTrailer[extraTrailer], function(cb)
					extraToggleTrailer[extraTrailer] = cb
					if extraToggleTrailer[extraTrailer] then
						SetVehicleExtra(TrailerHandle, extraTrailer, false)
						drawNotification("~g~" .. TrailerExtraTitle .. " " .. extraTrailer .. " - " .. TrailerExtraEnabledTitle .. "!")
					else
						SetVehicleExtra(TrailerHandle, extraTrailer, true)
						drawNotification("~r~" .. TrailerExtraTitle .. " " .. extraTrailer .. " - " .. TrailerExtraDisabledTitle .. "!")
					end
				end)
			else
				TriggerEvent("FMODT:Option", "~r~" .. TrailerExtraTitle .. " " .. extraTrailer .. " - " .. NotExisting .. "!", function(cb)
					if (cb) then
						drawNotification("~r~" .. TrailerExtraTitle .. " " .. extraTrailer .. " - " .. NotExisting .. "!")
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Setting Color
	while true do
		Citizen.Wait(0)
		if setColor then
			local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
			local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
			
			if lscMenuTrailer then
				vehicle = TrailerHandle
			else
				vehicle = playerVeh
			end
		
			if PrimaryColor then
				SetVehicleModColor_1(vehicle, modColor)
				ClearVehicleCustomPrimaryColour(vehicle)
				SetVehicleColours(vehicle, colorIndex, vehiclecol[2])
				SetVehicleExtraColours(vehicle, extracol[1], extracol[2])
			elseif SecondaryColor then
				SetVehicleModColor_2(vehicle, modColor)
				ClearVehicleCustomSecondaryColour(vehicle)
				SetVehicleColours(vehicle, vehiclecol[1], colorIndex)
				SetVehicleExtraColours(vehicle, extracol[1], extracol[2])
			elseif PearlescentColor then
				SetVehicleExtraColours(vehicle, colorIndex, extracol[2])
			elseif RimsColor then
				SetVehicleExtraColours(vehicle, extracol[1], colorIndex)
			end
			setColor = false
		end
	end
end)

Citizen.CreateThread(function() --Setting Custom Color
	while true do
		Citizen.Wait(0)
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
	
		if CustomColor then
			DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "","" .. R .. "," .. G .. "," .. B .. "", "", "", "", 11)
			blockinput = true

			while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
				drawNotification("~y~" .. NoSpacesMessage)
				Citizen.Wait(0)
			end
			if UpdateOnscreenKeyboard() ~= 2 then
				local result = GetOnscreenKeyboardResult()
				local color = stringsplit(result, ",")
				if tonumber(color[1]) == nil then
					R = 0
				else
					R = tonumber(color[1])
				end
				if tonumber(color[2]) == nil then
					G = 0
				else
					G = tonumber(color[2])
				end
				if tonumber(color[3]) == nil then
					B = 0
				else
					B = tonumber(color[3])
				end
				if CustomColorNeon then
					SetVehicleNeonLightsColour(vehicle, R, G, B)
					CustomColorNeon = false
				elseif TireSmoke then
					ToggleVehicleMod(vehicle, 20, true)
					SetVehicleTyreSmokeColor(vehicle, R, G, B)
				elseif PrimaryColor then
					SetVehicleModColor_1(vehicle, modColor)
					SetVehicleCustomPrimaryColour(vehicle, R, G, B)
					SetVehicleExtraColours(vehicle, extracol[1], extracol[2])
				elseif SecondaryColor then
					SetVehicleModColor_2(vehicle, modColor)
					SetVehicleCustomSecondaryColour(vehicle, R, G, B)
					SetVehicleExtraColours(vehicle, extracol[1], extracol[2])
				end
				Citizen.Wait(500)
			else
				drawNotification("~r~" .. CustomColorSettingAborted .. "!")
				Citizen.Wait(500)
			end
			blockinput = false
			CustomColor = false
			TireSmoke = false
		end
	end
end)

Citizen.CreateThread(function() --Setting Plate Text
	while true do
		Citizen.Wait(0)
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end
	
		if setPlateText then
			plateText = GetVehicleNumberPlateText(vehicle)
			DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "" .. plateText .. "", "", "", "", 8)
			blockinput = true

			while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
				Citizen.Wait(0)
			end
			if UpdateOnscreenKeyboard() ~= 2 then
				plateText = GetOnscreenKeyboardResult()
				Citizen.Wait(500)
				blockinput = false
			else
				Citizen.Wait(500)
				blockinput = false
			end
			SetVehicleNumberPlateText(vehicle, plateText)
			setPlateText = false
		end
	end
end)

Citizen.CreateThread(function() --Rainbow Neons
	while true do
		Citizen.Wait(0)
		local rgb = RGBRainbow(0.825)
		if rainbowneons and allowed then
			if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
				SetVehicleNeonLightsColour(GetVehiclePedIsIn(GetPlayerPed(-1), false), rgb.r, rgb.g, rgb.b)
			end
		end
	end
end)

Citizen.CreateThread(function() --Rainbow Vehicle
	while true do
		Citizen.Wait(0)
		local rgb = RGBRainbow(0.75)
		if rainbowvehicle and allowed then
			if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
				SetVehicleCustomPrimaryColour(GetVehiclePedIsIn(GetPlayerPed(-1), false), rgb.r, rgb.g, rgb.b)
				SetVehicleCustomSecondaryColour(GetVehiclePedIsIn(GetPlayerPed(-1), false), rgb.r, rgb.g, rgb.b)
			end
		end
	end
end)

Citizen.CreateThread(function() --Rainbow Tire Smoke
	while true do
		Citizen.Wait(0)
		local rgb = RGBRainbow(0.675)
		if rainbowtire and allowed then
			if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
				ToggleVehicleMod(GetVehiclePedIsIn(GetPlayerPed(-1), false), 20, true)
				SetVehicleTyreSmokeColor(GetVehiclePedIsIn(GetPlayerPed(-1), false), rgb.r, rgb.g, rgb.b)
			end
		end
	end
end)

Citizen.CreateThread(function() --Rainbow Neons (Trailer)
	while true do
		Citizen.Wait(0)
		local rgb = RGBRainbow(0.825)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(GetVehiclePedIsIn(GetPlayerPed(-1), false))
		if rainbowneonsTrailer and allowed then
			if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
				SetVehicleNeonLightsColour(TrailerHandle, rgb.r, rgb.g, rgb.b)
			end
		end
	end
end)

Citizen.CreateThread(function() --Rainbow Vehicle Trailer
	while true do
		Citizen.Wait(0)
		local rgb = RGBRainbow(0.75)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(GetVehiclePedIsIn(GetPlayerPed(-1), false))
		if rainbowtrailer and allowed then
			if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
				SetVehicleCustomPrimaryColour(TrailerHandle, rgb.r, rgb.g, rgb.b)
				SetVehicleCustomSecondaryColour(TrailerHandle, rgb.r, rgb.g, rgb.b)
			end
		end
	end
end)

Citizen.CreateThread(function() --Rainbow Tire Smoke (Trailer)
	while true do
		Citizen.Wait(0)
		local rgb = RGBRainbow(0.675)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(GetVehiclePedIsIn(GetPlayerPed(-1), false))
		if rainbowtireTrailer and allowed then
			if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
				ToggleVehicleMod(TrailerHandle, 20, true)
				SetVehicleTyreSmokeColor(TrailerHandle, rgb.r, rgb.g, rgb.b)
			end
		end
	end
end)

Citizen.CreateThread(function() --Get Current Vehicle & Neon Color (Vehicle Color Menu)
	while true do
		Citizen.Wait(0)
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(playerVeh)
		
		if lscMenuTrailer then
			vehicle = TrailerHandle
		else
			vehicle = playerVeh
		end

		if IsPedInAnyVehicle(GetPlayerPed(-1), true) and allowed then
			vehiclecol = table.pack(GetVehicleColours(vehicle))
			extracol = table.pack(GetVehicleExtraColours(vehicle))
			neoncolor = table.pack(GetVehicleNeonLightsColour(vehicle))
		end
	end
end)

Citizen.CreateThread(function() --Engine Power Multiplier
	while true do
		Citizen.Wait(0)
		if IsPedInAnyVehicle(GetPlayerPed(-1), true) and allowed then
			if Power ~= 1.0 then
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), Power * 20.0)
			else
				SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), Power)
			end
		end
	end
end)

Citizen.CreateThread(function() --Engine Torque Multiplier
	while true do
		Citizen.Wait(0)
		if IsPedInAnyVehicle(GetPlayerPed(-1), true) and allowed then
			SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), false), Torque)
		end
	end
end)


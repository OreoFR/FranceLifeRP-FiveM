local freezetime = false; freezeweather = false; blackout = false; explodevehicles = false; 
	  jumpmode = false; nonpcstraffic = false

Citizen.CreateThread(function() --World Menu
	while true do
		if (worldMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionworldMenu
			else
				lastSelectionworldMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. WorldMenuTitle)

			TriggerEvent("FMODT:Bool", BlackoutTitle, blackout, function(cb)
				blackout = cb
				if WorldAndNoClipOnlyAdmins then
					TriggerServerEvent("Blackout", blackout)
				end
				if blackout then
					drawNotification("~g~" .. BlackoutEnableMessage .. "!")
				else
					drawNotification("~r~" .. BlackoutDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Bool", ExplodeNearestVehicleTitle, explodevehicles, function(cb)
				explodevehicles = cb
				if explodevehicles then
					if jumpmode then
						jumpmode = false
					end
					drawNotification("~g~" .. ExplodeNearestVehicleEnableMessage .. "!")
				else
					drawNotification("~r~" .. ExplodeNearestVehicleDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Bool", JumpModeTitle, jumpmode, function(cb)
				jumpmode = cb
				if jumpmode then
					if explodevehicles then
						explodevehicles = false
					end
					drawNotification("~g~" .. JumpModeEnableMessage .. "!")
				else
					drawNotification("~r~" .. JumpModeDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Bool", NoNPCsTrafficTitle, nonpcstraffic, function(cb)
				nonpcstraffic = cb
				if WorldAndNoClipOnlyAdmins then
					TriggerServerEvent("NoNPCsTraffic", nonpcstraffic)
				end
				if nonpcstraffic then
					nowantedlevel = true
					drawNotification("~g~" .. NPCsTrafficDisableMessage .. "!")
				else
					if nowantedlevelCount == 0 then
						nowantedlevel = false
					end
					drawNotification("~r~" .. NPCsTrafficEnableMessage .. "!")
				end
			end)
			
			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. TimeMenuTitle, function(cb)
				if (cb) then
					worldMenu = false
					timeMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. WeatherMenuTitle, function(cb)
				if (cb) then
					worldMenu = false
					weatherMenu = true
				end
			end)
			
			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Time Menu
	local hour = 0
	local minute = 0
	while true do
		hour = GetClockHours()
		minute = GetClockMinutes()
		if timeMenu then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectiontimeMenu
			else
				lastSelectiontimeMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. TimeMenuTitle)

			TriggerEvent("FMODT:Bool", FreezeTimeTitle, freezetime, function(cb)
				freezetime = cb
				if WorldAndNoClipOnlyAdmins then
					TriggerServerEvent("Time", 0, 0, 1, freezetime)
				end
				if freezetime then
					drawNotification("~g~" .. FreezeTimeEnableMessage .. "!")
				else
					drawNotification("~r~" .. FreezeTimeDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Int", HourTitle .. ":", hour, 0, 23, function(cb)
				hour = cb
				if WorldAndNoClipOnlyAdmins then
					TriggerServerEvent("Time", hour, minute, 0)
				else
					NetworkOverrideClockTime(hour, minute, 0)
				end
			end)

			TriggerEvent("FMODT:Int", MinuteTitle .. ":", minute, 0, 59, function(cb)
				minute = cb
				if WorldAndNoClipOnlyAdmins then
					TriggerServerEvent("Time", hour, minute, 0)
				else
					NetworkOverrideClockTime(hour, minute, 0)
				end
			end)

			TriggerEvent("FMODT:Option", MorningTitle, function(cb)
				if (cb) then
					if WorldAndNoClipOnlyAdmins then
						TriggerServerEvent("Time", 6, 0, 0)
					else
						NetworkOverrideClockTime(6, 0, 0)
					end
				end
			end)

			TriggerEvent("FMODT:Option", MiddayTitle, function(cb)
				if (cb) then
					if WorldAndNoClipOnlyAdmins then
						TriggerServerEvent("Time", 12, 0, 0)
					else
						NetworkOverrideClockTime(12, 0, 0)
					end
				end
			end)

			TriggerEvent("FMODT:Option", EveningTitle, function(cb)
				if (cb) then
					if WorldAndNoClipOnlyAdmins then
						TriggerServerEvent("Time", 18, 0, 0)
					else
						NetworkOverrideClockTime(18, 0, 0)
					end
				end
			end)

			TriggerEvent("FMODT:Option", MidnightTitle, function(cb)
				if (cb) then
					if WorldAndNoClipOnlyAdmins then
						TriggerServerEvent("Time", 0, 0, 0)
					else
						NetworkOverrideClockTime(0, 0, 0)
					end
				end
			end)

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Weather Menu
	local weather
	local position = 1
	local WindSpeed = 1.0
	local RainFX = 1.0
	local WeatherTypes = {"Blizzard", "Clear", "Clearing", "Clouds", "Extra Sunny",
				   "Foggy", "Light Snow", "Neutral", "Overcast", "Rain",
				   "Smog", "Snow", "Thunder", "Xmas"}
	while true do
		if (weatherMenu) then
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionweatherMenu
			else
				lastSelectionweatherMenu = currentOption
			end
			
			for i = 1, tablelength(WeatherTypes) do
				local weatherCheck
				if WeatherTypes[i] == "Extra Sunny" then
					weatherCheck = "EXTRASUNNY"
				elseif WeatherTypes[i] == "Light Snow" then
					weatherCheck = "SNOWLIGHT"
				else
					weatherCheck = string.upper(WeatherTypes[i])
				end
				if GetHashKey(weatherCheck) == GetPrevWeatherTypeHashName() then
					position = i
				end
			end

			TriggerEvent("FMODT:Title", "~y~" .. WeatherMenuTitle)

			TriggerEvent("FMODT:StringArray", WeatherTitle .. ":", WeatherTypes, position, function(cb)
				position = cb
				if WeatherTypes[position] == "Extra Sunny" then
					weather = "EXTRASUNNY"
				elseif WeatherTypes[position] == "Light Snow" then
					weather = "SNOWLIGHT"
				else
					weather = string.upper(WeatherTypes[position])
				end
				
				if WorldAndNoClipOnlyAdmins then
					TriggerServerEvent("Weather", weather)
				else
					SetWeatherTypeNow(weather)
					SetOverrideWeather(weather)
				end
				
			end)

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Blackout
	while true do
		Citizen.Wait(0)
		if allowed then
			SetBlackout(blackout)
		end
	end
end)

Citizen.CreateThread(function() --No NPCs & Traffic
	local ClearCount = 0
	while true do
		Citizen.Wait(0)
		if nonpcstraffic and allowed then
			local playerPedPos = GetEntityCoords(GetPlayerPed(-1))
			if ClearCount == 0 then
				ClearAreaOfCops(playerPedPos, 9999.0, 0)
				ClearAreaOfPeds(playerPedPos, 9999.0, 1)
				ClearAreaOfVehicles(playerPedPos, 9999.0, false, false, false, false, false)
				ClearCount = 1
			end
			SetPedDensityMultiplierThisFrame(0.0)
			SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
			SetVehicleDensityMultiplierThisFrame(0.0)
			SetRandomVehicleDensityMultiplierThisFrame(0.0)
			SetParkedVehicleDensityMultiplierThisFrame(0.0)
			Citizen.InvokeNative(0x90B6DA738A9A25DA, 0.0)
			RemoveVehiclesFromGeneratorsInArea(playerPedPos.x - 1000.0, playerPedPos.y - 1000.0, playerPedPos.z - 1000.0, playerPedPos.x + 1000.0, playerPedPos.y + 1000.0, playerPedPos.z + 1000.0)
			SetGarbageTrucks(false)
			SetRandomBoats(false)
			SetRandomTrains(false)
		else
			SetGarbageTrucks(true)
			SetRandomBoats(true)
			SetRandomTrains(true)
			ClearCount = 0
		end
	end
end)

Citizen.CreateThread(function() --Explode Nearest Vehicle
	while true do
		Citizen.Wait(0)
		local GotTrailer, TrailerHandle = GetVehicleTrailerVehicle(GetVehiclePedIsIn(GetPlayerPed(-1), false))
		local explode
		if explodevehicles and allowed then
			for vehicle in EnumerateVehicles() do
				if (vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false)) and (not GotTrailer or (GotTrailer and vehicle ~= TrailerHandle)) then
					NetworkRequestControlOfEntity(vehicle)
					NetworkExplodeVehicle(vehicle, true, true, false)
				end
			end
		end
	end
end)

Citizen.CreateThread(function() --Freeze Time
	while true do
		Citizen.Wait(0)
		if freezetime and allowed then
			NetworkOverrideClockTime(GetClockHours(), GetClockMinutes(), 00)
		end
	end
end)

Citizen.CreateThread(function() --Jump Mode Audio
    while true do
        Citizen.Wait(0)
		if jumpmode and allowed then	
			SendNUIMessage({
				stopJumpMode = false,
			})
			SendNUIMessage({
				playJumpMode = true,
			})
		else
			SendNUIMessage({
				playJumpMode = false,
			})
			SendNUIMessage({
				stopJumpMode = true,
			})
		end
	end
end)

Citizen.CreateThread(function() --Jump Mode
    while true do
        Citizen.Wait(0)
		if jumpmode and allowed then	
			for vehicle in EnumerateVehicles() do
				if vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false) and vehicle ~= GetVehiclePedIsTryingToEnter(GetPlayerPed(-1)) then
					if IsVehicleOnAllWheels(vehicle) then
						ApplyForceToEntity(vehicle, 1, 0.0, 0.0, 2.0, 0.0, 0.0, 0.0, 1, true, true, true, true, true)
						SetEntityAsNoLongerNeeded(vehicle)
					end
				end
			end
		end
	end
end)

AddEventHandler("SetWeather", function(Type) --Sets the specific Weather
	SetWeatherTypeNow(Type)
	SetOverrideWeather(Type)
end)

AddEventHandler("SetTime", function(Hours, Minutes, freeze, State) --Sets the Time
	if freeze == 1 then
		NetworkOverrideClockTime(Hours, Minutes, 0)
		freezetime = State
	else
		NetworkOverrideClockTime(Hours, Minutes, 0)
	end
end)

AddEventHandler("SetBlackout", function(State) --Activates/ Deactivates Blackout Mode
	blackout = State
	if State then
		drawNotification("~g~" .. BlackoutEnableMessage .. "!")
	else
		drawNotification("~r~" .. BlackoutDisableMessage .. "!")
	end
end)

AddEventHandler("SetNoNPCsTraffic", function(State) --Activates/ Deactivates NPCs & Traffic
	nonpcstraffic = State
	if State then
		nowantedlevel = true
		drawNotification("~g~" .. NPCsTrafficDisableMessage .. "!")
	else
		if nowantedlevelCount == 0 then
			nowantedlevel = false
		end
		drawNotification("~r~" .. NPCsTrafficEnableMessage .. "!")
	end
end)


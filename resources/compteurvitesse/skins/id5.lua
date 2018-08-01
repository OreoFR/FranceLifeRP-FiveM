local skinData = {
	-- names
	skinName = "id5",
	ytdName = "id5",
	-- texture dictionary informations:
	-- night textures are supposed to look like this:
	-- "needle", "tachometer", skinData.ytdName, "fuelgauge"
	-- daytime textures this:
	-- "needle_day", "tachometer_day", "speedometer_day", "fuelgauge_day"
	-- these names are hardcoded

	-- where the speedo gets centered, values below are OFFSETS from this.
	centerCoords = {0.8,0.8},


	-- icon locations
	lightsLoc = {0.015,0.12,0.018,0.02},
	blinkerLoc = {0.04,0.12,0.022,0.03},
	fuelLoc = {-0.005,0.12,0.012,0.025},
	oilLoc = {0.100,0.12,0.020,0.025},
	engineLoc = {0.130,0.12,0.020,0.025},

	-- gauge locations
	SpeedoBGLoc = {0.053, 0.020, 0.25,0.23},
	SpeedoNeedleLoc = {0.000,5,0.076,0.15},

	TachoBGloc = {0.110,0.004,0.125,0.17},
	TachoNeedleLoc = {0.110,0.030,0.09,0.17},

	FuelBGLoc = {-0.035, -0.030,0.050, 0.040},
	FuelGaugeLoc = {0.060,0.000,0.030,0.080},


	-- you can also add your own values and use them in the code below, the sky is the limit!
	GearLoc = {0.010,-0.033,0.025,0.055}, -- gear location
	Speed1Loc = {-0.024,0.042,0.025,0.06}, -- 3rd digit
	Speed2Loc = {-0.004,0.042,0.025,0.06}, -- 2nd digit
	Speed3Loc = {0.020,0.042,0.025,0.06}, -- 1st digit
	UnitLoc = {0.029,0.088,0.025,0.025},
	TurboBGLoc = {0.053, -0.130, 0.075,0.090},
	TurboGaugeLoc = {0.0533, -0.125, 0.045,0.060},

	RotMult = 2.036936,
	RotStep = 2.32833,

	-- rpm scale, defines how "far" the rpm gauge goes before hitting redline
	rpmScale = 250,

}

Citizen.CreateThread(function()
	exports.sexyspeedometer:addSkin(skinData)
end)


-- addon code

local idcars = {"FUTO", "AE86", "86", "BLISTA2"} -- cars that use the AE86 speed chime and ae86 RPM background
local labelType = "8k"
local curAlpha = 0
local curDriftAlpha = 0
local useKPH = GetResourceKvpString("initiald_unit") -- handle our unit saving
if not useKPH then
	SetResourceKvp("initiald_unit", "true")
	useKPH = true
end
if useKPH	== "true" then
	useKPH = true
elseif useKPH == "false" then
	useKPH = false
end

function angle(veh)
	if not veh then return false end
	local vx,vy,vz = table.unpack(GetEntityVelocity(veh))
	local modV = math.sqrt(vx*vx + vy*vy)


	local rx,ry,rz = table.unpack(GetEntityRotation(veh,0))
	local sn,cs = -math.sin(math.rad(rz)), math.cos(math.rad(rz))

	if GetEntitySpeed(veh)* 3.6 < 40 or GetVehicleCurrentGear(veh) == 0 then return 0,modV end --speed over 25 km/h

	local cosX = (sn*vx + cs*vy)/modV
	return math.deg(math.acos(cosX))*0.5, modV
end
local function BlinkDriftText(hide)
	if hide == true or goDown == true then
		curDriftAlpha = curDriftAlpha-15
	elseif not hide or goDown == false then
		curDriftAlpha = curDriftAlpha+15
	end
	if curDriftAlpha <= 0 then
		curDriftAlpha = 0
		goDown = false
	elseif curDriftAlpha >= 255 then
		curDriftAlpha = 255
		if driftSprite ~= "drift_yellow" then
			goDown = true
		end
	end
end
SpeedChimeActive = false


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if exports.sexyspeedometer:getCurrentSkin() == skinData.skinName then
			if overwriteAlpha then curAlpha = 0 end
			if not overwriteAlpha then
				if IsPedInAnyVehicle(GetPlayerPed(-1),true) and GetSeatPedIsTryingToEnter(GetPlayerPed(-1)) == -1 or GetPedInVehicleSeat(veh, -1) == GetPlayerPed(-1) then
						if curAlpha >= 255 then
							curAlpha = 255
						else
							curAlpha = curAlpha+5
						end
				elseif not IsPedInAnyVehicle(GetPlayerPed(-1),false) then
						if curAlpha <= 0 then
							curAlpha = 0
						else
							curAlpha = curAlpha-5
						end
					end
			end
			speedTable = {}
			showFuelGauge = false
			veh = GetVehiclePedIsUsing(GetPlayerPed(-1))
			if DoesEntityExist(veh) and not IsEntityDead(veh) then
				if GetVehicleClass(veh) >= 0 and GetVehicleClass(veh) <= 5 then
					labelType = "8k"
					skinData.rpmScale = 200
				elseif GetVehicleClass(veh) == 6 then
					labelType = "9k"
					skinData.rpmScale = 222
				elseif GetVehicleClass(veh) == 7 then
					labelType = "10k"
					skinData.rpmScale = 222
				elseif GetVehicleClass(veh) == 8 then
					labelType = "13k"
					skinData.rpmScale = 220
				end
				for i,theName in ipairs(idcars) do
					if string.find(GetDisplayNameFromVehicleModel(GetEntityModel(veh)), theName) ~= nil and string.find(GetDisplayNameFromVehicleModel(GetEntityModel(veh)), theName) >= 0 then
						labelType = "86"
						skinData.rpmScale = 242
					end
					if GetDisplayNameFromVehicleModel(GetEntityModel(veh)) == theName then
						if not SpeedChimeActive and GetEntitySpeed(veh)*3.6 > 105.0 then
							SpeedChimeActive = true
							TriggerEvent("initiald:Sound:PlayOnOne","initiald",0.7,true)
						elseif SpeedChimeActive and GetEntitySpeed(veh)*3.6 < 105.0 then
							SpeedChimeActive = false
							TriggerEvent("initiald:Sound:StopOnOne")
						end
					end
				end

				_,lightson,highbeams = GetVehicleLightsState(veh)
				if lightson == 1 or highbeams == 1 then
					curTachometer = "night_labels_"..labelType
					if useKPH then
						curTurbo = "turbo"
					else
						curTurbo = "turbo_psi"
					end
					curTurboNeedle = "needle"
				else
					curTachometer = "labels_"..labelType
					if useKPH then
						curTurbo = "turbo_day"
					else
						curTurbo = "turbo_day_psi"
					end
					curTurboNeedle = "needle_day"
				end
				curSpeedometer = "nodrift_background"

				local gear = GetVehicleCurrentGear(veh)+1

				if not gear then gear = 1 end
				if gear == 1 then gear = 0 end


				DrawSprite(skinData.ytdName, curSpeedometer, skinData.centerCoords[1]+skinData.SpeedoBGLoc[1],skinData.centerCoords[2]+skinData.SpeedoBGLoc[2],skinData.SpeedoBGLoc[3],skinData.SpeedoBGLoc[4], 0.0, 255, 255, 255, curAlpha)
				DrawSprite(skinData.ytdName, curTachometer, skinData.centerCoords[1]+skinData.TachoBGloc[1],skinData.centerCoords[2]+skinData.TachoBGloc[2],skinData.TachoBGloc[3],skinData.TachoBGloc[4], 0.0, 255, 255, 255, curAlpha)
				DrawSprite(skinData.ytdName, "gear_"..gear, skinData.centerCoords[1]+skinData.GearLoc[1],skinData.centerCoords[2]+skinData.GearLoc[2],skinData.GearLoc[3],skinData.GearLoc[4], 0.0, 255, 255, 255, curAlpha)

				local speed = GetEntitySpeed(veh)

				if useKPH then
					speed = GetEntitySpeed(veh)* 3.6
				else
					speed = GetEntitySpeed(veh)*2.236936
				end

				if useKPH then
					DrawSprite(skinData.ytdName, "kmh", skinData.centerCoords[1]+skinData.UnitLoc[1],skinData.centerCoords[2]+skinData.UnitLoc[2],skinData.UnitLoc[3],skinData.UnitLoc[4], 0.0, 255, 255, 255, curAlpha)
				else
					DrawSprite(skinData.ytdName, "mph", skinData.centerCoords[1]+skinData.UnitLoc[1],skinData.centerCoords[2]+skinData.UnitLoc[2],skinData.UnitLoc[3],skinData.UnitLoc[4], 0.0, 255, 255, 255, curAlpha)
				end

				if not speed then speed = "0.0" end
				speed = tonumber(string.format("%." .. (0) .. "f", speed))
				speed = tostring(speed)
				for i = 1, string.len(speed) do
					speedTable[i] = speed:sub(i, i)
				end
				if string.len(speed) == 1 then
					DrawSprite(skinData.ytdName, "speed_digits_"..speedTable[1], skinData.centerCoords[1]+skinData.Speed3Loc[1],skinData.centerCoords[2]+skinData.Speed3Loc[2],skinData.Speed3Loc[3],skinData.Speed3Loc[4], 0.0, 255, 255, 255, curAlpha)
				elseif string.len(speed) == 2 then
					DrawSprite(skinData.ytdName, "speed_digits_"..speedTable[1], skinData.centerCoords[1]+skinData.Speed2Loc[1],skinData.centerCoords[2]+skinData.Speed2Loc[2],skinData.Speed2Loc[3],skinData.Speed2Loc[4], 0.0, 255, 255, 255, curAlpha)
					DrawSprite(skinData.ytdName, "speed_digits_"..speedTable[2], skinData.centerCoords[1]+skinData.Speed3Loc[1],skinData.centerCoords[2]+skinData.Speed3Loc[2],skinData.Speed3Loc[3],skinData.Speed3Loc[4], 0.0, 255, 255, 255, curAlpha)
				elseif string.len(speed) == 3 then
					DrawSprite(skinData.ytdName, "speed_digits_"..speedTable[1], skinData.centerCoords[1]+skinData.Speed1Loc[1],skinData.centerCoords[2]+skinData.Speed1Loc[2],skinData.Speed1Loc[3],skinData.Speed1Loc[4], 0.0, 255, 255, 255, curAlpha)
					DrawSprite(skinData.ytdName, "speed_digits_"..speedTable[2], skinData.centerCoords[1]+skinData.Speed2Loc[1],skinData.centerCoords[2]+skinData.Speed2Loc[2],skinData.Speed2Loc[3],skinData.Speed2Loc[4], 0.0, 255, 255, 255, curAlpha)
					DrawSprite(skinData.ytdName, "speed_digits_"..speedTable[3], skinData.centerCoords[1]+skinData.Speed3Loc[1],skinData.centerCoords[2]+skinData.Speed3Loc[2],skinData.Speed3Loc[3],skinData.Speed3Loc[4], 0.0, 255, 255, 255, curAlpha)
				elseif string.len(speed) >= 4 then
					DrawSprite(skinData.ytdName, "speed_digits_9", skinData.centerCoords[1]+skinData.Speed3Loc[1],skinData.centerCoords[2]+skinData.Speed3Loc[2],skinData.Speed3Loc[3],skinData.Speed3Loc[4], 0.0, 255, 255, 255, curAlpha)
					DrawSprite(skinData.ytdName, "speed_digits_9", skinData.centerCoords[1]+skinData.Speed2Loc[1],skinData.centerCoords[2]+skinData.Speed2Loc[2],skinData.Speed2Loc[3],skinData.Speed2Loc[4], 0.0, 255, 255, 255, curAlpha)
					DrawSprite(skinData.ytdName, "speed_digits_9", skinData.centerCoords[1]+skinData.Speed1Loc[1],skinData.centerCoords[2]+skinData.Speed1Loc[2],skinData.Speed1Loc[3],skinData.Speed1Loc[4], 0.0, 255, 255, 255, curAlpha)
				end
				local boost = GetVehicleTurboPressure(veh)
				if boost > 0.0 then

				else

				end
				if IsToggleModOn(veh,18) then
					DrawSprite(skinData.ytdName, curTurbo, skinData.centerCoords[1]+skinData.TurboBGLoc[1],skinData.centerCoords[2]+skinData.TurboBGLoc[2],skinData.TurboBGLoc[3],skinData.TurboBGLoc[4], 0.0, 255, 255, 255, curAlpha)
					DrawSprite(skinData.ytdName, curTurboNeedle, skinData.centerCoords[1]+skinData.TurboGaugeLoc[1],skinData.centerCoords[2]+skinData.TurboGaugeLoc[2],skinData.TurboGaugeLoc[3],skinData.TurboGaugeLoc[4], (GetVehicleTurboPressure(veh)*100)-625, 255, 255, 255, curAlpha)
				end
				if GetPedInVehicleSeat(veh, -1) == GetPlayerPed(-1) and GetVehicleClass(veh) >= 0 and GetVehicleClass(veh) < 13 or GetVehicleClass(veh) >= 17 then
					if angle(veh) >= 10 and angle(veh) <= 18 then
						driftSprite = "drift_blue"
						DrawSprite(skinData.ytdName, driftSprite, skinData.centerCoords[1]+skinData.FuelBGLoc[1],skinData.centerCoords[2]+skinData.FuelBGLoc[2],skinData.FuelBGLoc[3],skinData.FuelBGLoc[4], 0.0, 255, 255, 255, curDriftAlpha)
						BlinkDriftText(false)
					elseif angle(veh) > 18 then
						driftSprite = "drift_yellow"
						DrawSprite(skinData.ytdName, driftSprite, skinData.centerCoords[1]+skinData.FuelBGLoc[1],skinData.centerCoords[2]+skinData.FuelBGLoc[2],skinData.FuelBGLoc[3],skinData.FuelBGLoc[4], 0.0, 255, 255, 255, curDriftAlpha)
						BlinkDriftText(false)
					elseif angle(veh) < 10 then
						driftSprite = "drift_blue"
						DrawSprite(skinData.ytdName, driftSprite, skinData.centerCoords[1]+skinData.FuelBGLoc[1],skinData.centerCoords[2]+skinData.FuelBGLoc[2],skinData.FuelBGLoc[3],skinData.FuelBGLoc[4], 0.0, 255, 255, 255, curDriftAlpha)
						BlinkDriftText(true)
					end
				else
					curDriftAlpha = 0
				end


			end
		end
	end
end)

function switchUnit()
	useKPH = not useKPH
end

Citizen.CreateThread(function()
	RegisterCommand("speedounit", function(source, args, rawCommand)
		useKPH = not useKPH
		SetResourceKvp("initiald_unit", tostring(useKPH))
	end, false)


	RegisterNetEvent('initiald:Sound:PlayOnOne')
	AddEventHandler('initiald:Sound:PlayOnOne', function(soundFile, soundVolume, loop)
	    SendNUIMessage({
	        transactionType     = 'playSound',
	        transactionFile     = soundFile,
	        transactionVolume   = soundVolume,
			transactionLoop   = loop
	    })
	end)

	RegisterNetEvent('initiald:Sound:StopOnOne')
	AddEventHandler('initiald:Sound:StopOnOne', function()
	    SendNUIMessage({
	        transactionType     = 'stopSound'
	    })
	end)

end)
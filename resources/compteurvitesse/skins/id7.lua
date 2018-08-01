local skinData = {
	-- names
	skinName = "id7",
	ytdName = "id7",
	-- texture dictionary informations:
	-- night textures are supposed to look like this:
	-- "needle", "tachometer", cst.ytdName, "fuelgauge"
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
	SpeedoBGLoc = {0.115, 0.012, 0.17,0.28},
	SpeedoNeedleLoc = {0.000,5,0.076,0.15},

	TachoBGloc = {0.108,0.009,0.135,0.235},
	TachoNeedleLoc = {0.108,0.009,0.135,0.215},

	FuelBGLoc = {0.085, 0.020,0.030, 0.020},
	FuelGaugeLoc = {0.060,0.000,0.030,0.080},


	-- you can also add your own values and use them in the code below, the sky is the limit!
	GearLoc = {0.115,0.043,0.025,0.055}, -- gear location
	Speed1Loc = {0.090,-0.020,0.022,0.05}, -- 3rd digit
	Speed2Loc = {0.106,-0.020,0.022,0.05}, -- 2nd digit
	Speed3Loc = {0.126,-0.020,0.022,0.05}, -- 1st digit
	UnitLoc = {0.145,-0.000,0.020,0.020},
	RevLight = {0.1054,-0.005,0.138,0.230},

	RotMult = 2.036936,
	RotStep = 2.32833,


	-- rpm scale, defines how "far" the rpm gauge goes before hitting redline
	rpmScale = 250,
	rpmScaleDecrease = 60,

}

addSkin(skinData)


-- addon code

local idcars = {"FUTO", "AE86", "86", "BLISTA2"} -- cars that use the AE86 speed chime and ae86 RPM background
local labelType = "8k"
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
		if getCurrentSkin() == skinData.skinName then
			speedTable = {}
			toggleFuelGauge(false)
			veh = GetVehiclePedIsUsing(GetPlayerPed(-1))
			if DoesEntityExist(veh) and not IsEntityDead(veh) then
				if GetVehicleClass(veh) >= 0 and GetVehicleClass(veh) <= 5 then
					labelType = "8k"
					cst.rpmScale = 235
				elseif GetVehicleClass(veh) == 6 then
					labelType = "9k"
					cst.rpmScale = 235
				elseif GetVehicleClass(veh) == 7 then
					labelType = "10k"
					cst.rpmScale = 235
				elseif GetVehicleClass(veh) == 8 then
					labelType = "13k"
					cst.rpmScale = 235
				end
				for i,theName in ipairs(idcars) do
					if string.find(GetDisplayNameFromVehicleModel(GetEntityModel(veh)), theName) ~= nil and string.find(GetDisplayNameFromVehicleModel(GetEntityModel(veh)), theName) >= 0 then
						labelType = "86"
						cst.rpmScale = 242
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
				else
					curTachometer = "labels_"..labelType
				end
				curSpeedometer = "nodrift_background"

				local gear = GetVehicleCurrentGear(veh)+1

				if not gear then gear = 1 end
				if gear == 1 then gear = 0 end

				if RPM > 0.90 then
					DrawSprite(cst.ytdName, "rev_light", cst.centerCoords[1]+cst.RevLight[1],cst.centerCoords[2]+cst.RevLight[2],cst.RevLight[3],cst.RevLight[4], 0.0, 255, 255, 255, curAlpha)
				end
				DrawSprite(cst.ytdName, curSpeedometer, cst.centerCoords[1]+cst.SpeedoBGLoc[1],cst.centerCoords[2]+cst.SpeedoBGLoc[2],cst.SpeedoBGLoc[3],cst.SpeedoBGLoc[4], 0.0, 255, 255, 255, curAlpha)
				DrawSprite(cst.ytdName, curTachometer, cst.centerCoords[1]+cst.TachoBGloc[1],cst.centerCoords[2]+cst.TachoBGloc[2],cst.TachoBGloc[3],cst.TachoBGloc[4], 0.0, 255, 255, 255, curAlpha)
				DrawSprite(cst.ytdName, "gear_"..gear, cst.centerCoords[1]+cst.GearLoc[1],cst.centerCoords[2]+cst.GearLoc[2],cst.GearLoc[3],cst.GearLoc[4], 0.0, 255, 255, 255, curAlpha)
				local speed = GetEntitySpeed(veh)

				if useKPH then
					speed = GetEntitySpeed(veh)* 3.6
				else
					speed = GetEntitySpeed(veh)*2.236936
				end

				if useKPH then
					DrawSprite(cst.ytdName, "kmh", cst.centerCoords[1]+cst.UnitLoc[1],cst.centerCoords[2]+cst.UnitLoc[2],cst.UnitLoc[3],cst.UnitLoc[4], 0.0, 255, 255, 255, curAlpha)
				else
					DrawSprite(cst.ytdName, "mph", cst.centerCoords[1]+cst.UnitLoc[1],cst.centerCoords[2]+cst.UnitLoc[2],cst.UnitLoc[3],cst.UnitLoc[4], 0.0, 255, 255, 255, curAlpha)
				end

				if not speed then speed = "0.0" end
				speed = tonumber(string.format("%." .. (0) .. "f", speed))
				speed = tostring(speed)
				for i = 1, string.len(speed) do
					speedTable[i] = speed:sub(i, i)
				end
				if string.len(speed) == 1 then
					DrawSprite(cst.ytdName, "speed_digits_"..speedTable[1], cst.centerCoords[1]+cst.Speed3Loc[1],cst.centerCoords[2]+cst.Speed3Loc[2],cst.Speed3Loc[3],cst.Speed3Loc[4], 0.0, 255, 255, 255, curAlpha)
				elseif string.len(speed) == 2 then
					DrawSprite(cst.ytdName, "speed_digits_"..speedTable[1], cst.centerCoords[1]+cst.Speed2Loc[1],cst.centerCoords[2]+cst.Speed2Loc[2],cst.Speed2Loc[3],cst.Speed2Loc[4], 0.0, 255, 255, 255, curAlpha)
					DrawSprite(cst.ytdName, "speed_digits_"..speedTable[2], cst.centerCoords[1]+cst.Speed3Loc[1],cst.centerCoords[2]+cst.Speed3Loc[2],cst.Speed3Loc[3],cst.Speed3Loc[4], 0.0, 255, 255, 255, curAlpha)
				elseif string.len(speed) == 3 then
					DrawSprite(cst.ytdName, "speed_digits_"..speedTable[1], cst.centerCoords[1]+cst.Speed1Loc[1],cst.centerCoords[2]+cst.Speed1Loc[2],cst.Speed1Loc[3],cst.Speed1Loc[4], 0.0, 255, 255, 255, curAlpha)
					DrawSprite(cst.ytdName, "speed_digits_"..speedTable[2], cst.centerCoords[1]+cst.Speed2Loc[1],cst.centerCoords[2]+cst.Speed2Loc[2],cst.Speed2Loc[3],cst.Speed2Loc[4], 0.0, 255, 255, 255, curAlpha)
					DrawSprite(cst.ytdName, "speed_digits_"..speedTable[3], cst.centerCoords[1]+cst.Speed3Loc[1],cst.centerCoords[2]+cst.Speed3Loc[2],cst.Speed3Loc[3],cst.Speed3Loc[4], 0.0, 255, 255, 255, curAlpha)
				elseif string.len(speed) >= 4 then
					DrawSprite(cst.ytdName, "speed_digits_9", cst.centerCoords[1]+cst.Speed3Loc[1],cst.centerCoords[2]+cst.Speed3Loc[2],cst.Speed3Loc[3],cst.Speed3Loc[4], 0.0, 255, 255, 255, curAlpha)
					DrawSprite(cst.ytdName, "speed_digits_9", cst.centerCoords[1]+cst.Speed2Loc[1],cst.centerCoords[2]+cst.Speed2Loc[2],cst.Speed2Loc[3],cst.Speed2Loc[4], 0.0, 255, 255, 255, curAlpha)
					DrawSprite(cst.ytdName, "speed_digits_9", cst.centerCoords[1]+cst.Speed1Loc[1],cst.centerCoords[2]+cst.Speed1Loc[2],cst.Speed1Loc[3],cst.Speed1Loc[4], 0.0, 255, 255, 255, curAlpha)
				end
				if GetPedInVehicleSeat(veh, -1) == GetPlayerPed(-1) and GetVehicleClass(veh) >= 0 and GetVehicleClass(veh) < 13 or GetVehicleClass(veh) >= 17 then
					if angle(veh) >= 10 and angle(veh) <= 18 then
						driftSprite = "drift_blue"
						DrawSprite(cst.ytdName, driftSprite, cst.centerCoords[1]+cst.FuelBGLoc[1],cst.centerCoords[2]+cst.FuelBGLoc[2],cst.FuelBGLoc[3],cst.FuelBGLoc[4], 0.0, 255, 255, 255, curDriftAlpha)
						BlinkDriftText(false)
					elseif angle(veh) > 18 then
						driftSprite = "drift_yellow"
						DrawSprite(cst.ytdName, driftSprite, cst.centerCoords[1]+cst.FuelBGLoc[1],cst.centerCoords[2]+cst.FuelBGLoc[2],cst.FuelBGLoc[3],cst.FuelBGLoc[4], 0.0, 255, 255, 255, curDriftAlpha)
						BlinkDriftText(false)
					elseif angle(veh) < 10 then
						driftSprite = "drift_blue"
						DrawSprite(cst.ytdName, driftSprite, cst.centerCoords[1]+cst.FuelBGLoc[1],cst.centerCoords[2]+cst.FuelBGLoc[2],cst.FuelBGLoc[3],cst.FuelBGLoc[4], 0.0, 255, 255, 255, curDriftAlpha)
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

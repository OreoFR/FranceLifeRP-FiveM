--SETTINGS--
showFuelGauge = true -- use fuel gauge?
skins = {}
--SETTINGS END--
overwriteAlpha = false

function addSkin(skin)
	table.insert(skins,skin)
end

function getAvailableSkins()
	local tt = {}
	for i,theSkin in pairs(skins) do
		table.insert(tt,theSkin.skinName)
	end
	return tt
end

function toggleFuelGauge(toggle)
	showFuelGauge = toggle
end

function changeSkin(skin)
	for i,theSkin in pairs(skins) do
		if theSkin.skinName == skin then
			cst = theSkin
			currentSkin = theSkin.skinName
			SetResourceKvp("sexyspeedo_skin", skin)
			showFuelGauge = true
			overwriteAlpha = false
			return true
		end
	end
	return false
end

function DoesSkinExist(skinName)
	for i,theSkin in pairs(getAvailableSkins()) do
		if theSkin == skinName then
			return true
		end
	end
	return false
end

function getCurrentSkin()
	return currentSkin
end

function toggleSpeedo(state)
	if state == true then
		overwriteAlpha = false
	elseif state == false then
		overwriteAlpha = true
	else
		overwriteAlpha = not overwriteAlpha
	end
end

Citizen.CreateThread(function()
	currentSkin = GetResourceKvpString("sexyspeedo_skin")
	if not currentSkin or currentSkin == "default" then
		SetResourceKvp("sexyspeedo_skin", "default")
		if DoesSkinExist("default") then
			currentSkin = "default"
			changeSkin("default")
		else
			currentSkin = skins[1].skinName
			changeSkin(skins[1].skinName)
		end
	else
		for i,theSkin in pairs(skins) do
			if theSkin.skinName == currentSkin then
				cst = theSkin
			end
		end
		if not cst then changeSkin(skins[1].skinName) end
	end
end)

--cst = {skinName = "default",ytdName = "default",lightsIconLocation = {0.810,0.892,0.018,0.02},blinkerIconLocation = {0.905,0.834,0.022,0.03},fuelIconLocation = {0.905,0.890,0.012,0.025},oilIconLocation = {0.900,0.862,0.020,0.025},engineIconLocation = {0.930,0.892,0.020,0.025},SpeedometerBGLocation = {0.800,0.860,0.12,0.185},SpeedometerNeedleLocation = {0.800,0.862,0.076,0.15},TachometerBGLocation = {0.920,0.860,0.12,0.185},TachoNeedleLocation = {0.920,0.862,0.076,0.15},FuelBGLocation = {0.860, 0.780,0.04, 0.04},FuelGaugeLocation = {0.860,0.800,0.040,0.08},RotMultiplier = 2.036936,RotStep = 2.32833}
-- temporary skinTable incase what i had in mind doesnt work

RegisterCommand("speedoskin", function(source, args, rawCommand)
	if args[1] then
		changeSkin(args[1])
	end
end, false)

RegisterCommand("speedoskins", function(source, args, rawCommand)
	local s = getAvailableSkins()
	local ss = ""
	for i,s in pairs(s) do
		ss = ss..""..s..", "
	end
	TriggerEvent("chat:addMessage", { args = { "Available Skins", ss } })
end, false)

RegisterCommand("togglespeedo", function(source, args, rawCommand)
	toggleSpeedo()
end, false)



curNeedle, curTachometer, curSpeedometer, curFuelGauge, curAlpha = "needle_day", "tachometer_day", "speedometer_day", "fuelgauge_day",0
RPM, degree, blinkertick, showBlinker = 0, 0, 0, false
overwriteChecks = false -- debug value to display all icons
Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/togglespeedo', 'show/hide speedometer' )
	TriggerEvent('chat:addSuggestion', '/speedoskins', 'show all available speedometer skins' )
	TriggerEvent('chat:addSuggestion', '/speedoskin', 'change the speedometer skin', { {name='skin', help="the skin name"} } )
	while true do
		Citizen.Wait(0)
		veh = GetVehiclePedIsUsing(GetPlayerPed(-1))
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

		if not HasStreamedTextureDictLoaded(cst.ytdName) then
			RequestStreamedTextureDict(cst.ytdName, true)
			while not HasStreamedTextureDictLoaded(cst.ytdName) do
				Wait(0)
			end
		else
			if DoesEntityExist(veh) and not IsEntityDead(veh) then
				degree, step = 0, cst.RotStep
				RPM = GetVehicleCurrentRpm(veh)
				if not GetIsVehicleEngineRunning(veh) then RPM = 0 end -- fix for R*'s Engine RPM fuckery
				if RPM > 0.99 then
					RPM = RPM*100
					RPM = RPM+math.random(-2,2)
					RPM = RPM/100
				end
				blinkerstate = GetVehicleIndicatorLights(veh) -- owo whats this
				if blinkerstate == 0 then
					blinkerleft,blinkerright = false,false
				elseif blinkerstate == 1 then
					blinkerleft,blinkerright = true,false
				elseif blinkerstate == 2 then
					blinkerleft,blinkerright = false,true
				elseif blinkerstate == 3 then
					blinkerleft,blinkerright = true,true
				end
				engineHealth = GetVehicleEngineHealth(veh)
				if engineHealth <= 350 and engineHealth > 100 then
					showDamageYellow,showDamageRed = true,false
				elseif engineHealth <= 100 then
					showDamageYellow,showDamageRed = false, true
				else
					showDamageYellow,showDamageRed = false, false
				end
				OilLevel = GetVehicleOilLevel(veh)
				FuelLevel = GetVehicleFuelLevel(veh)
				MaxFuelLevel = Citizen.InvokeNative(0x642FC12F, veh, "CHandlingData", "fPetrolTankVolume", Citizen.ReturnResultAnyway(), Citizen.ResultAsFloat())
				if FuelLevel <= MaxFuelLevel*0.25 and FuelLevel > MaxFuelLevel*0.13 then
					showLowFuelYellow,showLowFuelRed = true,false
				elseif FuelLevel <= MaxFuelLevel*0.2 then
					showLowFuelYellow,showLowFuelRed = false,true
				else
					showLowFuelYellow,showLowFuelRed = false,false
				end
				if OilLevel <= 0.5 then
					showLowOil = true
				else
					showLowOil = false
				end
				_,lightson,highbeams = GetVehicleLightsState(veh)
				if lightson == 1 or highbeams == 1 then
					curNeedle, curTachometer, curSpeedometer, curFuelGauge = "needle", "tachometer", "speedometer", "fuelgauge"
					if highbeams == 1 then
						showHighBeams,showLowBeams = true,false
					elseif lightson == 1 and highbeams == 0 then
						showHighBeams,showLowBeams = false,true
					end
				else
					curNeedle, curTachometer, curSpeedometer, curFuelGauge, showHighBeams, showLowBeams = "needle_day", "tachometer_day", "speedometer_day", "fuelgauge_day", false, false
				end
				if GetEntitySpeed(veh) > 0 then degree=(GetEntitySpeed(veh)*2.036936)*step end
				if degree > 290 then degree=290 end
				if GetVehicleClass(veh) >= 0 and GetVehicleClass(veh) < 13 or GetVehicleClass(veh) >= 17 then
				else
					curAlpha = 0
				end
			else
				RPM, degree = 0, 0
			end

			if RPM < 0.12 or not RPM then
				RPM = 0.12
			end
			if overwriteChecks then
				showHighBeams,showLowBeams,showBlinker,blinkerleft,blinkerright,showDamageRed,showLowFuelRed,showLowOil = true, true, true, true, true ,true, true, true
			end
			if showHighBeams then
				DrawSprite(cst.ytdName, cst.BeamLight or "lights", cst.centerCoords[1]+cst.lightsLoc[1],cst.centerCoords[2]+cst.lightsLoc[2],cst.lightsLoc[3],cst.lightsLoc[4],0, 0, 50, 240, curAlpha)
			elseif showLowBeams then
				DrawSprite(cst.ytdName, cst.BeamLight or "lights", cst.centerCoords[1]+cst.lightsLoc[1],cst.centerCoords[2]+cst.lightsLoc[2],cst.lightsLoc[3],cst.lightsLoc[4],0, 0, 255, 0, curAlpha)
			end
			if blinkerleft and showBlinker then
				DrawSprite(cst.ytdName, cst.BlinkerLight or "blinker", cst.centerCoords[1]+cst.blinkerLoc[1],cst.centerCoords[2]+cst.blinkerLoc[2],cst.blinkerLoc[3],cst.blinkerLoc[4],180.0, 124,252,0, curAlpha)
			end
			if blinkerright and showBlinker then
				DrawSprite(cst.ytdName, cst.BlinkerLight or "blinker", cst.centerCoords[1]+cst.blinkerLoc[1]+0.03,cst.centerCoords[2]+cst.blinkerLoc[2]-0.001,cst.blinkerLoc[3],cst.blinkerLoc[4],0.0, 124,252,0, curAlpha)
			end
			if MaxFuelLevel ~= 0 then
				if showLowFuelYellow then
					DrawSprite(cst.ytdName, cst.FuelLight or "fuel", cst.centerCoords[1]+cst.fuelLoc[1],cst.centerCoords[2]+cst.fuelLoc[2],cst.fuelLoc[3],cst.fuelLoc[4],0, 255, 191, 0, curAlpha)
				elseif showLowFuelRed then
					DrawSprite(cst.ytdName, cst.FuelLight or "fuel", cst.centerCoords[1]+cst.fuelLoc[1],cst.centerCoords[2]+cst.fuelLoc[2],cst.fuelLoc[3],cst.fuelLoc[4],0, 255, 0, 0, curAlpha)
				end
				if showLowOil then
					DrawSprite(cst.ytdName, cst.OilLight or "oil", cst.centerCoords[1]+cst.oilLoc[1],cst.centerCoords[2]+cst.oilLoc[2],cst.oilLoc[3],cst.oilLoc[4],0, 255, 0, 0, curAlpha)
				end -- MAKE SURE TO DRAW THIS BEFORE THE TACHO NEEDLE, OTHERWISE OVERLAPPING WILL HAPPEN!
			end
			if showDamageYellow then
				DrawSprite(cst.ytdName, cst.EngineLight or "engine", cst.centerCoords[1]+cst.engineLoc[1],cst.centerCoords[2]+cst.engineLoc[2],cst.engineLoc[3],cst.engineLoc[4],0, 255, 191, 0, curAlpha)
			elseif showDamageRed then
				DrawSprite(cst.ytdName, cst.EngineLight or "engine", cst.centerCoords[1]+cst.engineLoc[1],cst.centerCoords[2]+cst.engineLoc[2],cst.engineLoc[3],cst.engineLoc[4],0, 255, 0, 0, curAlpha)
			end
			DrawSprite(cst.ytdName, cst.SpeedometerBG or curSpeedometer, cst.centerCoords[1]+cst.SpeedoBGLoc[1],cst.centerCoords[2]+cst.SpeedoBGLoc[2],cst.SpeedoBGLoc[3],cst.SpeedoBGLoc[4], 0.0, 255, 255, 255, curAlpha)
			if MaxFuelLevel ~= 0 then
				DrawSprite(cst.ytdName, cst.TachometerBG or curTachometer, cst.centerCoords[1]+cst.TachoBGloc[1],cst.centerCoords[2]+cst.TachoBGloc[2],cst.TachoBGloc[3],cst.TachoBGloc[4], 0.0, 255, 255, 255, curAlpha)
				DrawSprite(cst.ytdName, cst.Needle or curNeedle, cst.centerCoords[1]+cst.TachoNeedleLoc[1],cst.centerCoords[2]+cst.TachoNeedleLoc[2],cst.TachoNeedleLoc[3],cst.TachoNeedleLoc[4],RPM*(cst.rpmScale)-(cst.rpmScaleDecrease or 0), 255, 255, 255, curAlpha)
			end
			DrawSprite(cst.ytdName, curNeedle, cst.centerCoords[1]+cst.SpeedoNeedleLoc[1],cst.centerCoords[2]+cst.SpeedoNeedleLoc[2],cst.SpeedoNeedleLoc[3],cst.SpeedoNeedleLoc[4],-5.00001+degree, 255, 255, 255, curAlpha)
			if showFuelGauge and FuelLevel and MaxFuelLevel ~= 0 then
				DrawSprite(cst.ytdName, cst.FuelGauge or curFuelGauge, cst.centerCoords[1]+cst.FuelBGLoc[1],cst.centerCoords[2]+cst.FuelBGLoc[2],cst.FuelBGLoc[3],cst.FuelBGLoc[4], 0.0, 255,255,255, curAlpha)
				DrawSprite(cst.ytdName, cst.FuelNeedle or curNeedle, cst.centerCoords[1]+cst.FuelGaugeLoc[1],cst.centerCoords[2]+cst.FuelGaugeLoc[2],cst.FuelGaugeLoc[3],cst.FuelGaugeLoc[4],80.0+FuelLevel/MaxFuelLevel*110, 255, 255, 255, curAlpha)
			end
		end
	end

end)



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if blinkerleft or blinkerright then
			showBlinker = true
			Citizen.Wait(500)
			showBlinker = false
			Citizen.Wait(500)
		end
	end
end
)
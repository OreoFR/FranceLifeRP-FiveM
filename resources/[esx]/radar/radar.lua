--[[
	The DOJ inspired Radar system
	By BlockBa5her
	Released and protected under the GPL-3.0 License
]]
-- Touch the below up until "the line"
--[[
	CONTROLS:
	G to open
	X to freeze
	PGUP & PGDOWN to change fast speed
	(simple as that really)
	(also, must be in a vehicle for it to work)
]]
local settings = {
	minSpeed = 2.0, -- will not count vehicle if under this speed
	drawDistance = 1250.0, -- how far the radar will look for cars ahead of it
	speedInKmh = true, -- If enabled, then it will display speed in KMH, otherwise, MPH
	playSound = true, -- Plays a sound if the car in front go above the fast speed limit
	speedInterval = 5.0 -- Amount that the fast speed changed when you change it in game
}
local whitelist = {
	vehs = { -- make sure these are upper, and have quotes
		"POLICE",
		"POLICE2",
		"POLICE3",
		"POLICE4",
		"POLICE5",
		"POLICE6",
		"POLICE7",
		"POLICE8",
		"POLICET",
		"PRANGER",
		"FBI2",
		"FBI",
		"SHERIFF",
		"SHERIFF2",
		"SHERIFF3",
		"POLICEB",
		"POLMAV",
		"SWIFT",
		"RIOT",
	},
	enable = true -- if enabled, then will check if the vehicle that the player is driving is the same as one of above
}
--[[
	               DON'T TOUCH BELOW THE LINE UNLESS YOU KNOW WHAT YOU ARE DOING!
	-------------------------------------------------------------------------------------------------
]]
-- fields n shit
local radar =
{
	shown = false,
	freeze = false,
	patrolSpeed = 0.0,
	fastSpeed = 70.0
}
local lastVeh =
{
	frwd = {
		plate = "NULL",
		model = "NULL",
		speed = 0
	},
	bckwd = {
		plate = "NULL",
		model = "NULL",
		speed = 0
	}
}
local lastVehFast = {
	plate = "NULL",
	model = "NULL",
	speed = 0
}

-- common funcs that i need
local function drawTxt(x,y ,width,height,scale, font, text, r,g,b,a)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end
local function drawTxt2(xy, wh, scale, font, text, rgba, align)
	if align == 2 then
		SetTextRightJustify(true)
		SetTextWrap(0, xy[1])
	end
	if align == 1 then
		SetTextCentre(true)
	end
	drawTxt(xy[1], xy[2], wh[1], wh[2], scale, font, text, rgba[1], rgba[2], rgba[3], rgba[4])
end
local function drawRect(xy, wh, rgba)
	DrawRect(xy[1], xy[2], wh[1], wh[2], rgba[1], rgba[2], rgba[3], rgba[4])
end
local function DrawRaycast(entity)
	local coords = GetOffsetFromEntityInWorldCoords(entity,0.0,1.0,0.3)
	local coords2 = GetOffsetFromEntityInWorldCoords(entity, 0.0, settings.drawDistance,0.0)
	local rayhandle = CastRayPointToPoint(coords, coords2, 10, entity, 0)
	local _, _, _, _, entityHit = GetRaycastResult(rayhandle)
	if entityHit>0 and IsEntityAVehicle(entityHit) then
		return entityHit
	else
		return nil
	end
end
local function DrawRaycastBackward(entity)
	local coords = GetOffsetFromEntityInWorldCoords(entity,0.0,1.0,0.3)
	local coords2 = GetOffsetFromEntityInWorldCoords(entity, 0.0, settings.drawDistance*-1,0.0)
	local rayhandle = CastRayPointToPoint(coords, coords2, 10, entity, 0)
	local _, _, _, _, entityHit = GetRaycastResult(rayhandle)
	if entityHit>0 and IsEntityAVehicle(entityHit) then
		return entityHit
	else
		return nil
	end
end
local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end
local function getBoolText(bool)
	if bool then
		return "~g~True"
	else
		return "~r~False"
	end
end
local function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

-- rendering the radar
local function renderRadar()
			local masterDraw = {0.75, 0.9175}

			local titleDraw = {masterDraw[1], masterDraw[2] - 0.0775}
			local element1Draw = {masterDraw[1] - 0.175, masterDraw[2] - 0.0475}
			local element2Draw = {masterDraw[1] - 0.0625, masterDraw[2] - 0.0475}
			local element3Draw = {masterDraw[1] + 0.0625, masterDraw[2] - 0.0475}
			local element4Draw = {masterDraw[1] + 0.175, masterDraw[2] - 0.0475}

			-- main box
			--drawRect({masterDraw[1],masterDraw[2]}, {0.5, 0.165}, {0,0,0,255})

			-- pause txt
			if radar.freeze then
				drawTxt2({0.999,0.97}, {0.01, 0.01}, 0.45, 4, "PAUSED", {255,255,255,255}, 2)
			end

			-- menu text
			drawTxt2({titleDraw[1], titleDraw[2]}, {0.01, 0.01}, 0.45, 1, "", {255,255,255,255}, 1)

			-- veh text
			-- FRWD
			drawTxt2({element1Draw[1], element1Draw[2]}, {0.30, 1.75}, 0.3, 0, "~b~DEVANT", {255,255,255,255}, 1)
			-- Speed TXT
			drawTxt2({element1Draw[1], element1Draw[2] + 0.023}, {0.30, 1.76}, 0.6, 0, string.format("~b~%s", tostring(round(lastVeh.frwd.speed, 2))), {255,255,255,255}, 1)
			-- Plate Veh TXT
			drawTxt2({element1Draw[1], element1Draw[2] + 0.076}, {0.47, 1.845}, 0.3, 0, string.format("~b~%s ~w~/ ~b~%s", lastVeh.frwd.plate, lastVeh.frwd.model), {255,255,255,255}, 1)

			-- veh text
			-- BKWD
			drawTxt2({element2Draw[1], element2Draw[2]}, {0.31, 1.75}, 0.3, 0, "DERRIERE", {255,255,255,255}, 1)
			-- Speed TXT
			drawTxt2({element2Draw[1], element2Draw[2] + 0.023}, {0.31, 1.76}, 0.6, 0, string.format("%s", tostring(round(lastVeh.bckwd.speed, 2))), {255,255,255,255}, 1)
			-- Plate Veh TXT
			drawTxt2({element2Draw[1], element2Draw[2] + 0.076}, {0.16, 1.845}, 0.3, 0, string.format("%s ~w~/ %s", lastVeh.bckwd.plate, lastVeh.bckwd.model), {255,255,255,255}, 1)

			-- fast text
			-- FAST
			drawTxt2({element3Draw[1], element3Draw[2]}, {0.665, 1.75}, 0.3, 0, "~r~VITESSE", {255,255,255,255}, 1)
			-- Speed TXT
			drawTxt2({element3Draw[1], element3Draw[2] + 0.023}, {0.665, 1.76}, 0.6, 0, string.format("~r~%s", tostring(round(lastVehFast.speed, 2))), {255,255,255,255}, 1)
			-- Plate Veh TXT
			drawTxt2({element3Draw[1], element3Draw[2] + 0.076}, {0.665, 1.77}, 0.3, 0, string.format("~r~%s ~w~/ ~r~%s", lastVehFast.plate, lastVehFast.model), {255,255,255,255}, 1)
			-- Fast Speed Display
			--drawTxt2({element3Draw[1], element3Draw[2] + 0.1}, {0.01, 0.01}, 0.25, 0, string.format("~g~Fast Speed~w~: (~b~%s~w~)", radar.fastSpeed), {255,255,255,255}, 1)

			-- patrol text
			-- PATROL
			--drawTxt2({element4Draw[1], element4Draw[2]}, {0.01, 0.01}, 0.4, 0, "~y~MOI", {255,255,255,255}, 1)
			-- Speed TXT
			--drawTxt2({element4Draw[1], element4Draw[2] + 0.023}, {0.01, 0.01}, 0.7, 0, string.format("%s", tostring(math.floor(radar.patrolSpeed))), {255,255,255,255}, 1)
end

-- logic (the musician)
Citizen.CreateThread(function()
	while true do
		Wait(0)

		local _whitelist = false
		if whitelist.enable == true and IsPedInAnyVehicle(GetPlayerPed(-1), false) then
			if has_value(whitelist.vehs, GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), false)))) then
				_whitelist = true
			end
		end
		if whitelist.enable == false and IsPedInAnyVehicle(GetPlayerPed(-1), false) then
			_whitelist = true
		end
		if IsControlJustReleased(1, 56) and _whitelist then -- G
			radar.shown = not radar.shown
			radar.freeze = false
            Wait(75)
		end
		if IsControlJustReleased(1, 56) and _whitelist then -- X
			radar.freeze = not radar.freeze
		end
		if IsControlJustReleased(1, 10) and _whitelist then
			radar.fastSpeed = radar.fastSpeed + settings.speedInterval
		end
		if IsControlJustReleased(1, 11) and _whitelist then
			radar.fastSpeed = radar.fastSpeed - settings.speedInterval
		end

		if radar.shown and _whitelist then

			if settings.speedInKmh then
				radar.patrolSpeed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6
			else
				radar.patrolSpeed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.236936
			end

			if radar.freeze == false then
				local carM = DrawRaycast(GetPlayerPed(-1))
				local carM2 = DrawRaycastBackward(GetPlayerPed(-1))

				--[[
					FORWARD RAYCAST STUFF
				]]
				if carM ~= nil then
					local plate = GetVehicleNumberPlateText(carM)
					local vehSpeedKM = GetEntitySpeed(carM)*3.6
					local vehSpeedMph = GetEntitySpeed(carM)*2.236936

					if vehSpeedMph > settings.minSpeed then
						lastVeh.frwd.plate = plate
						if settings.speedInKmh then
							lastVeh.frwd.speed = vehSpeedKM
						else
							lastVeh.frwd.speed = vehSpeedMph
						end
						lastVeh.frwd.model = string.upper(GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(carM))))

						if lastVeh.frwd.speed > radar.fastSpeed then
							if lastVehFast.plate ~= lastVeh.frwd.plate and settings.playSound then -- Prevents from playing sound over and over again
								PlaySoundFrontend(-1, "TENNIS_POINT_WON", "HUD_AWARDS")
							end
							lastVehFast.plate = lastVeh.frwd.plate
							lastVehFast.model = lastVeh.frwd.model
							lastVehFast.speed = lastVeh.frwd.speed
						end
					end
				end

				--[[
					BACKWARD RAYCAST STUFF
				]]
				if carM2 ~= nil then
					local plate = GetVehicleNumberPlateText(carM2)
					local vehSpeedKM = GetEntitySpeed(carM2)*3.6
					local vehSpeedMph = GetEntitySpeed(carM2)*2.236936

					if vehSpeedMph > settings.minSpeed then
						lastVeh.bckwd.plate = plate
						if settings.speedInKmh then
							lastVeh.bckwd.speed = vehSpeedKM
						else
							lastVeh.bckwd.speed = vehSpeedMph
						end
						lastVeh.bckwd.model = string.upper(GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(carM2))))

						if lastVeh.bckwd.speed > radar.fastSpeed then
							if lastVehFast.plate ~= lastVeh.bckwd.plate and settings.playSound then -- Prevents from playing sound over and over again
								PlaySoundFrontend(-1, "TENNIS_POINT_WON", "HUD_AWARDS")
							end
							lastVehFast.plate = lastVeh.bckwd.plate
							lastVehFast.model = lastVeh.bckwd.model
							lastVehFast.speed = lastVeh.bckwd.speed
						end
					end
				end
			end
			renderRadar()
		end
	end
end)

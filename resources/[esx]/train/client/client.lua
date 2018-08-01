function HelpText(text)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, 0, 0, -1)
end

Citizen.CreateThread(function()
	Log("Train Markers Init.")
	while true do		
		Wait(0)
		if Config.ModelsLoaded then	
			for i=1, #Config.TrainLocations, 1 do
				local coords = GetEntityCoords(GetPlayerPed(-1))
				local trainLocation = Config.TrainLocations[i]
				if(GetDistanceBetweenCoords(coords, trainLocation.x, trainLocation.y, trainLocation.z, true) < Config.DrawDistance) then
					DrawMarker(Config.MarkerType, trainLocation.x, trainLocation.y, trainLocation.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z-2.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
					HelpText("Press ~INPUT_DETONATE~ to spawn a ~g~train")
				end
				if(GetDistanceBetweenCoords(coords, trainLocation.x, trainLocation.y, trainLocation.z, true) < Config.MarkerSize.x / 2) then
					if(IsControlPressed(0,58) and(GetGameTimer() - Config.EnterExitDelay) > Config.EnterExitDelayMax) then -- G
						Config.EnterExitDelay = 0
						Wait(60)
						createTrain(trainLocation.trainID, trainLocation.trainX, trainLocation.trainY, trainLocation.trainZ)
					end
				end
			end
		end
	end
end)

function doTrains()
	if Config.ModelsLoaded then
		if (Config.EnterExitDelay == 0) then
			Config.EnterExitDelay = GetGameTimer()
		end
		if (Config.inTrain) then
			-- Speed Up/Forwards (W)
			if (IsControlPressed(0,71) and IsControlPressed(0,72) and Config.Debug and Config.Speed ~= 0) then -- D(E)bug Break (W+S)
				debugLog("break:" .. GetEntityCoords(Config.TrainVeh))
				Config.Speed = 0
				SetTrainSpeed(Config.TrainVeh, 0)
			elseif (IsControlPressed(0,73)) then -- E Break (X)
				Config.Speed = 0
			elseif (IsControlPressed(0,71) and Config.Speed < getTrainSpeeds(Config.TrainVeh).MaxSpeed) then  -- Forward (W)
				debugLog("W: " .. Config.Speed)
				Config.Speed = Config.Speed + getTrainSpeeds(Config.TrainVeh).Accel
			elseif (IsControlPressed(0,72) and Config.Speed  > -getTrainSpeeds(Config.TrainVeh).MaxSpeed)then -- Backwards (S)
				debugLog("S: " .. Config.Speed)
				Config.Speed = Config.Speed - getTrainSpeeds(Config.TrainVeh).Dccel
			end
			
			SetTrainCruiseSpeed(Config.TrainVeh,Config.Speed)
		elseif IsPedInAnyTrain(GetPlayerPed(-1)) then -- Should fix not being able to drive trains after restart resource.
			debugLog("I'm in a train? Did the resource restart...")
			if GetVehiclePedIsIn(GetPlayerPed(-1), false) == 0 then
				debugLog("Unable to get train, re-enter the train, or wait!")
			else
				debugLog("T:" .. GetVehiclePedIsIn(GetPlayerPed(-1), false) .. "|M:" .. GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), false)))
				Config.TrainVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
				Config.inTrain = true
			end
		end

		-- Enter/Exit (F)
		if(IsControlPressed(0,75) and(GetGameTimer() - Config.EnterExitDelay) > Config.EnterExitDelayMax) then
			Config.EnterExitDelay = 0
			
			if(Config.inTrain or Config.inTrainAsPas) then
				debugLog("exit")
				if (Config.TrainVeh ~= 0) then
					local off = GetOffsetFromEntityInWorldCoords(Config.TrainVeh, -2.0, -5.0, 0.6)
					SetEntityCoords(GetPlayerPed(-1), off.x, off.y, off.z,false,false,false,false)
				end
				Config.inTrain = false
				Config.inTrainAsPas = false
				Config.TrainVeh = 0
			else
				Config.TrainVeh = findNearestTrain()
				if (Config.TrainVeh ~= 0) then
					if (GetPedInVehicleSeat(Config.TrainVeh, 1) == 0) then -- If train has driver, then enter the back
						SetPedIntoVehicle(GetPlayerPed(-1),Config.TrainVeh,-1)
						Config.inTrain = true
						debugLog("Set into Train!")
						debugLog("T:" .. GetVehiclePedIsIn( ped, false ) .. "|M:" .. GetEntityModel(GetVehiclePedIsIn( ped, false )))
					elseif getCanPassenger(Config.TrainVeh) then
						local off = GetOffsetFromEntityInWorldCoords(Config.TrainVeh, 0.0, -5.0, 0.6)
						SetEntityCoords(GetPlayerPed(-1), off.x, off.y, off.z)
						Config.inTrainAsPas = true
						debugLog("Set into Train as Passenger!")
						debugLog("T:" .. GetVehiclePedIsIn( ped, false ) .. "|M:" .. GetEntityModel(GetVehiclePedIsIn( ped, false )))
					end
				end
			end
		end
		
		-- KP8 to delete train infront
		if(IsControlPressed(0,111) and(GetGameTimer() - Config.EnterExitDelay) > Config.EnterExitDelayMax) then
			Config.EnterExitDelay = 0
			local nT = findNearestTrain()
			if nT ~= 0 then
				DeleteMissionTrain(nT)
				Config.inTrain = false -- F while train doesn't have driver
				Config.inTrainAsPas = false -- F while train has driver
				Config.TrainVeh = 0
				Config.Speed = 0
			end
		end
	end
end

-- Load Models
Citizen.CreateThread(function()
	function RequestModelSync(mod) -- eh
		tempmodel = GetHashKey(mod)
		RequestModel(tempmodel)
		while not HasModelLoaded(tempmodel) do
			RequestModel(tempmodel)
			Citizen.Wait(0)
		end
	end

	function LoadTrainModels()
		DeleteAllTrains()
		Config.ModelsLoaded = false
		Log("Loading Train Models.")
		RequestModelSync("freight")
		RequestModelSync("freightcar")
		RequestModelSync("freightgrain")
		RequestModelSync("freightcont1")
		RequestModelSync("freightcont2")
		RequestModelSync("freighttrailer")
		RequestModelSync("tankercar")
		RequestModelSync("metrotrain")
		RequestModelSync("s_m_m_lsmetro_01")
		Log("Done Loading Train Models.")
		Config.ModelsLoaded = true
	end
	LoadTrainModels()
	
	Log("Loading Train Blips.")
	for i=1, #Config.TrainLocations, 1 do
		local blip = AddBlipForCoord(Config.TrainLocations[i].x, Config.TrainLocations[i].y, Config.TrainLocations[i].z)      
		SetBlipSprite (blip, Config.BlipSprite)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.9)
		SetBlipColour (blip, 2)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Trains")
		EndTextCommandSetBlipName(blip)
	end
	Log("Done Loading Train Blips.")
	
	while true do
		Wait(0)
		doTrains()
	end
end)

afterburners = {} -- keep these empty
activeAfterburners = {} -- keep these empty
Scale = 1.0 -- afterburner scale, too high may result in your plane getting damaged
VehiclesHash = {} -- keep these empty
Vehicles = {} -- keep these empty
BlacklistedVehicles = {"hydra","CargoPlane"} -- blacklisted vehicles, add new blacklisted vehicles to this
ABStyle = 2 -- after burner style, 2 for the "rocket voltic" style or 1 for the normal afterburner look, 2 is generally preferred
known = false -- must be false.
	
if ABStyle == 1 then
	for i = 1, 12 do -- generate afterburner list
		if i == 1 then
			table.insert(afterburners, {"core", "veh_exhaust_afterburner", "exhaust" })
		else
			table.insert(afterburners, {"core", "veh_exhaust_afterburner", "exhaust_"..i })
		end
	end
else
	for i = 1, 12 do -- generate afterburner list
		if i == 1 then
			table.insert(afterburners, {"veh_impexp_rocket", "veh_rocket_boost", "exhaust" })
		else
			table.insert(afterburners, {"veh_impexp_rocket", "veh_rocket_boost", "exhaust_"..i })
		end
	end
end
	

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(50)
		
		local handle, veh = FindFirstVehicle()
		local finished = false -- FindNextPed will turn the first variable to false when it fails to find another ped in the index
		repeat
			model = GetEntityModel(veh)
			if IsThisModelAPlane(model) and GetVehiclePedIsIn( PlayerPedId(), false ) == veh then
				tryAfterburner(veh)
			end
			local finished, veh = FindNextVehicle(handle) -- first param returns true while entities are found
			model = GetEntityModel(veh)
			if IsThisModelAPlane(model) and GetVehiclePedIsIn( PlayerPedId(), false ) == veh then
				tryAfterburner(veh)
			end
			until not finished
			EndFindVehicle(handle)
			
			if GetVehiclePedIsIn( PlayerPedId(), false ) and IsThisModelAPlane(GetEntityModel(GetVehiclePedIsIn(PlayerPedId(),false) ) ) then
				tryAfterburner( GetVehiclePedIsIn(PlayerPedId(),false))
			end
			
			
				
	end
end)


Citizen.CreateThread(function()

	function tryAfterburner(veh)
		known = false
		
		for i,theVeh in pairs(Vehicles) do
			if DoesEntityExist(theVeh) then
				if not IsVehicleDriveable(theVeh,true) then
					KillAfterburner(theVeh)
				end
			else
				KillAfterburner(theVeh)
			end
		end
	
		model = GetEntityModel( veh )
		if IsVehicleDriveable( veh, true ) then
			for i,theVeh in pairs(Vehicles) do
				if theVeh == veh then
					known = true
				end
			end
			for i,theVeh in pairs(BlacklistedVehicles) do
				if string.lower(GetDisplayNameFromVehicleModel(model)) == theVeh then
					known = true 
				end
			end
			if not known then
				InitializeAfterburner(veh)
			else
				Update(veh)
			end
		end
		if not IsVehicleDriveable(veh,true) then
			KillAfterburner(veh)
		end
		
	end

	function InitializeAfterburner(veh)
		lastVehicle = veh
			for theKey,thePTFX in ipairs(afterburners) do
				if not HasNamedPtfxAssetLoaded(thePTFX[1]) then
					RequestNamedPtfxAsset(thePTFX[1])
				end
				while not HasNamedPtfxAssetLoaded(thePTFX[1]) do
					Wait(1)
				end
				added = false
				if GetEntityBoneIndexByName(lastVehicle, thePTFX[3]) > -1 then
					UseParticleFxAssetNextCall( thePTFX[1] )
					local id = StartParticleFxLoopedOnEntityBone( thePTFX[2], lastVehicle, 0.0,0.0,0.0,0.0,0.0,0.0, GetEntityBoneIndexByName(lastVehicle, thePTFX[3]), Scale, 0,0,0)
					table.insert(activeAfterburners, {veh = veh, id = id } )
					if not added then
						table.insert(Vehicles, lastVehicle)
						added = true
					end
				end
			end
		end
	
	function KillAfterburner(veh)	
		for i,thePTFX in pairs(activeAfterburners) do 
			if thePTFX.veh == veh then
				StopParticleFxLooped(thePTFX.id,0)
				RemoveParticleFx(thePTFX.id,0)
				table.remove(activeAfterburners,i)
				for vi, theVeh in pairs(Vehicles) do
					if theVeh == veh then
						table.remove(Vehicles, vi)
						vi=vi-1
					end
				end
			i=i-1
			end
		end
	end
	
	function Update(veh)
		lastVehicle = veh
		for i,thePTFX in pairs(activeAfterburners) do 
			if thePTFX.veh == veh then
				SetParticleFxLoopedEvolution(thePTFX.id, "boost", GetVehicleAcceleration(lastVehicle), 0)
				SetParticleFxLoopedEvolution(thePTFX.id, "damage", 0.0, 0)
			end
		end
	end
				
		
end)

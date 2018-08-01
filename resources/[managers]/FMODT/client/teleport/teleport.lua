local SetCoords, location, EffectPlayer, PlayerX, PlayerY, PlayerZ
local nv, wp, WaypointCoords, scale; RequestPTFX = true, entity
local player = -1; CustomX = 0.0; CustomY = 0.0; CustomZ = 0.0
	  
Citizen.CreateThread(function() --Teleport Menu
	while true do

		if (teleportMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionteleportMenu
			else
				lastSelectionteleportMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. TeleportMenuTitle .. "")

			TriggerEvent("FMODT:Option", TeleportToWaypointTitle, function(cb)
				if (cb) then
					if DoesBlipExist(GetFirstBlipInfoId(8)) then
						local blipIterator = GetBlipInfoIdIterator(8)
						local blip = GetFirstBlipInfoId(8, blipIterator)
						WaypointCoords = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector()) --Thanks To Briglair [forum.FiveM.net]
						wp = true
					else
						drawNotification("~r~" .. NoWaypointMessage .. "!")
					end
				end
			end)

			TriggerEvent("FMODT:Option", TeleportIntoNearestVehicleTitle, function(cb)
				if (cb) then
					nv = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. TeleportEntityRelativeTitle, function(cb)
				if (cb) then
					teleportMenu = false
					teleportMenuEntityRelative = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. TeleportToOnlinePlayerTitle, function(cb)
				if (cb) then
					teleportMenu = false
					teleportToPlayer = true
					OnlinePlayer1 = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. InteriorLocationsTitle, function(cb)
				if (cb) then
					teleportMenu = false
					interiorLocation = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. ExteriorLocationsTitle, function(cb)
				if (cb) then
					teleportMenu = false
					exteriorLocation = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. CustomLocationTitle, function(cb)
				if (cb) then
					teleportMenu = false
					customLocation = true
				end
			end)

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Entity - Relative Menu
	while true do
		local entity

		if (teleportMenuEntityRelative) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionteleportMenuEntityRelative
			else
				lastSelectionteleportMenuEntityRelative = currentOption
			end
		
			if IsPedInAnyVehicle(GetPlayerPed(-1), false) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1) == GetPlayerPed(-1)) then
				entity = GetVehiclePedIsIn(GetPlayerPed(-1), false)
			else
				entity = GetPlayerPed(-1)
			end
			
			TriggerEvent("FMODT:Title", "~y~" .. TeleportEntityRelativeTitle)

			TriggerEvent("FMODT:Option", TeleportForwardTitle, function(cb)
				if (cb) then
					local coords = GetOffsetFromEntityInWorldCoords(entity, 0.0, 2.5, 0.0)
					SetEntityCoords(entity, coords.x, coords.y, coords.z - 1.0)
					drawNotification("~g~" .. TeleportedForwardMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Option", TeleportBackwardTitle, function(cb)
				if (cb) then
					local coords = GetOffsetFromEntityInWorldCoords(entity, 0.0, -2.5, 0.0)
					SetEntityCoords(entity, coords.x, coords.y, coords.z - 1.0)
					drawNotification("~g~" .. TeleportedBackwardMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Option", TeleportToTheLeftTitle, function(cb)
				if (cb) then
					local coords = GetOffsetFromEntityInWorldCoords(entity, -2.5, 0.0, 0.0)
					SetEntityCoords(entity, coords.x, coords.y, coords.z - 1.0)
					drawNotification("~g~" .. TeleportedToTheLeftMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Option", TeleportToTheRightTitle, function(cb)
				if (cb) then
					local coords = GetOffsetFromEntityInWorldCoords(entity, 2.5, 0.0, 0.0)
					SetEntityCoords(entity, coords.x, coords.y, coords.z - 1.0)
					drawNotification("~g~" .. TeleportedToTheRightMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Update")
		end
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Interior Locations Menu
	while true do
		if (interiorLocation) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectioninteriorLocation
			else
				lastSelectioninteriorLocation = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. InteriorLocationsTitle)

			TriggerEvent("FMODT:Option", "Cluckin Bell Factory", function(cb)
				if (cb) then
					RequestCollisionAtCoord(-150.0,6147.0,35.0)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -150.0,6147.0,35.0)
					else
						SetEntityCoords(GetPlayerPed(-1), -150.0, 6147.0, 35.0)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "FIB Building", function(cb)
				if (cb) then
					RequestCollisionAtCoord(135.5,-749.0,260.0)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 135.5,-749.0,260.0)
					else
						SetEntityCoords(GetPlayerPed(-1), 135.5,-749.0,260.0)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "Fort Zancudo Tower", function(cb)
				if (cb) then
					RequestCollisionAtCoord(-2356.0,3248.6,101.5)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -2356.0,3248.6,101.5)
					else
						SetEntityCoords(GetPlayerPed(-1), -2356.0,3248.6,101.5)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "IAA Building", function(cb)
				if (cb) then
					RequestCollisionAtCoord(113.9,-618.5,206.0)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 113.9,-618.5,206.0)
					else
						SetEntityCoords(GetPlayerPed(-1), 113.9,-618.5,206.0)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "Destroyed Hospital", function(cb)
				if (cb) then
					RequestCollisionAtCoord(356.9,-590.5,43.0)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 356.9,-590.5,43.0)
					else
						SetEntityCoords(GetPlayerPed(-1), 356.9,-590.5,43.0)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "Jewelry Store", function(cb)
				if (cb) then
					RequestCollisionAtCoord(-630.4,-236.7,37.0)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -630.4,-236.7,37.0)
					else
						SetEntityCoords(GetPlayerPed(-1), -630.4,-236.7,37.0)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "Lester's Factory", function(cb)
				if (cb) then
					RequestCollisionAtCoord(716.8,-962.0,31.5)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 716.8,-962.0,31.5)
					else
						SetEntityCoords(GetPlayerPed(-1), 716.8,-962.0,31.5)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "Lifeinvader", function(cb)
				if (cb) then
					RequestCollisionAtCoord(-1047.9,-233.0,39.0)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1047.9,-233.0,39.0)
					else
						SetEntityCoords(GetPlayerPed(-1), -1047.9,-233.0,39.0)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "Maze Bank Arena", function(cb)
				if (cb) then
					RequestCollisionAtCoord(-248.6,-2010.6,30.1)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -248.6,-2010.6,30.1)
					else
						SetEntityCoords(GetPlayerPed(-1), -248.6,-2010.6,30.1)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "Prison Tower", function(cb)
				if (cb) then
					RequestCollisionAtCoord(1541.6,2470.1,62.8)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 1541.6,2470.1,62.8)
					else
						SetEntityCoords(GetPlayerPed(-1), 1541.6,2470.1,62.8)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "Simeon's Showroom", function(cb)
				if (cb) then
					RequestCollisionAtCoord(-30.8,-1088.3,25.4)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -30.8,-1088.3,25.4)
					else
						SetEntityCoords(GetPlayerPed(-1), -30.8,-1088.3,25.4)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "Strip Club", function(cb)
				if (cb) then
					RequestCollisionAtCoord(97.2,-1290.9,29.0)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 97.2,-1290.9,29.0)
					else
						SetEntityCoords(GetPlayerPed(-1), 97.2,-1290.9,29.0)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "The Morgue", function(cb)
				if (cb) then
					RequestCollisionAtCoord(244.9,-1374.7,39.5)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 244.9,-1374.7,39.5)
					else
						SetEntityCoords(GetPlayerPed(-1), 244.9,-1374.7,39.5)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "Union Deposity", function(cb)
				if (cb) then
					RequestCollisionAtCoord(2.6,-667.0,16.1)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 2.6,-667.0,16.1)
					else
						SetEntityCoords(GetPlayerPed(-1), 2.6,-667.0,16.1)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Exterior Locations Menu
	while true do
		if (exteriorLocation) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionexteriorLocation
			else
				lastSelectionexteriorLocation = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ExteriorLocationsTitle)

			TriggerEvent("FMODT:Option", "Airport", function(cb)
				if (cb) then
					RequestCollisionAtCoord(-1102.2,-2894.5,13.9)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1102.2,-2894.5,13.9)
					else
						SetEntityCoords(GetPlayerPed(-1), -1102.2,-2894.5,13.9)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "Cannibal Camp", function(cb)
				if (cb) then
					RequestCollisionAtCoord(-1170.1,4926.1,224.3)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1170.1,4926.1,224.3)
					else
						SetEntityCoords(GetPlayerPed(-1), -1170.1,4926.1,224.3)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "Del Perro Pier", function(cb)
				if (cb) then
					RequestCollisionAtCoord(-1600.0,-1041.8,13.0)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1600.0,-1041.8,13.0)
					else
						SetEntityCoords(GetPlayerPed(-1), -1600.0,-1041.8,13.0)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "FIB", function(cb)
				if (cb) then
					RequestCollisionAtCoord(135.5,-749.0,266.6)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 135.5,-749.0,266.6)
					else
						SetEntityCoords(GetPlayerPed(-1), 135.5,-749.0,266.6)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "Fort Zancudo", function(cb)
				if (cb) then
					RequestCollisionAtCoord(-2012.8,2956.5,32.8)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -2012.8,2956.5,32.8)
					else
						SetEntityCoords(GetPlayerPed(-1), -2012.8,2956.5,32.8)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "Heist Carrier", function(cb)
				if (cb) then
					RequestCollisionAtCoord(3069.9,-4632.4,16.2)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 3069.9,-4632.4,16.2)
					else
						SetEntityCoords(GetPlayerPed(-1), 3069.9,-4632.4,16.2)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "Heist Yacht", function(cb)
				if (cb) then
					RequestCollisionAtCoord(-2045.8,-1031.2,11.9)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -2045.8,-1031.2,11.9)
					else
						SetEntityCoords(GetPlayerPed(-1), -2045.8,-1031.2,11.9)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "IAA", function(cb)
				if (cb) then
					RequestCollisionAtCoord(130.6,-634.9,262.8)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 130.6,-634.9,262.8)
					else
						SetEntityCoords(GetPlayerPed(-1), 130.6,-634.9,262.8)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "In The Sky (Over City)", function(cb)
				if (cb) then
					RequestCollisionAtCoord(0.0,0.0,1000.0)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 0.0,0.0,1000.0)
					else
						SetEntityCoords(GetPlayerPed(-1), 0.0,0.0,1000.0)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "Maze Bank", function(cb)
				if (cb) then
					RequestCollisionAtCoord(-74.9,-818.6,326.1)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -74.9,-818.6,326.1)
					else
						SetEntityCoords(GetPlayerPed(-1), -74.9,-818.6,326.1)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "Mount Chiliad", function(cb)
				if (cb) then
					RequestCollisionAtCoord(449.3,5568.5,796.1)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 449.3,5568.5,796.1)
					else
						SetEntityCoords(GetPlayerPed(-1), 449.3,5568.5,796.1)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "North Yankton", function(cb)
				if (cb) then
					RequestCollisionAtCoord(3360.1,-4849.6,111.8)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 3360.1,-4849.6,111.8)
					else
						SetEntityCoords(GetPlayerPed(-1), 3360.1,-4849.6,111.8)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "O'Neil Ranch", function(cb)
				if (cb) then
					--IPL Removing/Requesting
					RemoveIpl("farm_burnt")
					RemoveIpl("farm_burnt_lod")
					RemoveIpl("farm_burnt_props")
					RemoveIpl("farmint_cap")
					RequestIpl("farm")
					RequestIpl("farm_lod")
					RequestIpl("farmint")
					RequestIpl("farmint_lod")
					RequestIpl("des_farmhs_startimap")
					RequestIpl("farm_props")

					RequestCollisionAtCoord(2452.2,4954.5,45.0)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 2452.2,4954.5,45.0)
					else
						SetEntityCoords(GetPlayerPed(-1), 2452.2,4954.5,45.0)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "O'Neil Ranch (Burnt)", function(cb)
				if (cb) then
					--IPL Removing/Requesting
					RemoveIpl("farm")
					RemoveIpl("farm_lod")
					RemoveIpl("farmint")
					RemoveIpl("farmint_lod")
					RemoveIpl("des_farmhs_startimap")
					RemoveIpl("farm_props")
					RemoveIpl("farmint_cap")
					RequestIpl("farm_burnt")
					RequestIpl("farm_burnt_lod")
					RequestIpl("farm_burnt_props")
					
					RequestCollisionAtCoord(2452.2,4954.5,45.0)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 2452.2,4954.5,45.0)
					else
						SetEntityCoords(GetPlayerPed(-1), 2452.2,4954.5,45.0)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "Plane Crash", function(cb)
				if (cb) then
					--IPL Requesting
					RequestIpl("Plane_crash_trench")
					local planeProp = GetClosestObjectOfType(2808.386, 4796.483, 46.200, 50.0, GetHashKey("prop_shamal_crash"), 1, 0, 1)
					if not DoesEntityExist(planeProp) then
						local plane = CreateObject(GetHashKey("prop_shamal_crash"), 2808.386, 4796.483, 46.200, true, false)
						SetEntityRotation(plane, -1.204,  -1.671, -9.383, 2, true)
						FreezeEntityPosition(plane, true)
					end
					
					RequestCollisionAtCoord(2814.2,4758.5,47.0)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 2814.2,4758.5,47.0)
					else
						SetEntityCoords(GetPlayerPed(-1), 2814.2,4758.5,47.0)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "Prison", function(cb)
				if (cb) then
					RequestCollisionAtCoord(1679.0,2513.7,45.5)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 1679.0,2513.7,45.5)
					else
						SetEntityCoords(GetPlayerPed(-1), 1679.0,2513.7,45.5)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "Trevor's Airfield", function(cb)
				if (cb) then
					RequestCollisionAtCoord(1741.4,3269.2,41.6)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 1741.4,3269.2,41.6)
					else
						SetEntityCoords(GetPlayerPed(-1), 1741.4,3269.2,41.6)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "UFO (Alien Camp)", function(cb)
				if (cb) then
					RequestCollisionAtCoord(2490.4,3774.8,2414.0)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 2490.4,3774.8,2414.0)
					else
						SetEntityCoords(GetPlayerPed(-1), 2490.4,3774.8,2414.0)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "UFO (Fort Zancudo)", function(cb)
				if (cb) then
					RequestCollisionAtCoord(-2051.9,3237.0,1456.9)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -2051.9,3237.0,1456.9)
					else
						SetEntityCoords(GetPlayerPed(-1), -2051.9,3237.0,1456.9)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Option", "UFO (Mount Chiliad)", function(cb)
				if (cb) then
					RequestCollisionAtCoord(501.5,5593.8,796.2)

					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), 501.5,5593.8,796.2)
					else
						SetEntityCoords(GetPlayerPed(-1), 501.5,5593.8,796.2)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Custom Locations Menu
	while true do
		if (customLocation) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectioncustomLocation
			else
				lastSelectioncustomLocation = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. CustomLocationTitle)

			TriggerEvent("FMODT:Option", SetCoordsTitle .. "      [" .. CustomX .. ", " .. CustomY .. ", " .. CustomZ .. "]", function(cb)
				if (cb) then
					SetCoords = true
				end
			end)
			
			TriggerEvent("FMODT:Option", TeleportToCoordsTitle, function(cb)
				if (cb) then
					RequestCollisionAtCoord(CustomX, CustomY, CustomZ)
					if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						SetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0), CustomX, CustomY, CustomZ)
					else
						SetEntityCoords(GetPlayerPed(-1), CustomX, CustomY, CustomZ)
					end
					entity = GetPlayerPed(-1)

					TriggerServerEvent("EffectForAll", PlayerId())
				end
			end)

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Teleport To Online Player Menu		[Multiple Pages]
	while true do
		if (OnlinePlayer1) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionOnlinePlayer1
			else
				lastSelectionOnlinePlayer1 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					OnlinePlayer1 = false
					OnlinePlayer2 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					OnlinePlayer1 = false
					OnlinePlayer2 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. TeleportToOnlinePlayerTitle)

			for i = 0, 15 do
				TriggerEvent("FMODT:Option", GetPlayerName(i), function(cb)
					if (cb) then
						player = i
					end
				end)
			end
			
			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 1", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 1")
				end
			end)

			TriggerEvent("FMODT:Update")
			
		elseif (OnlinePlayer2) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionOnlinePlayer2
			else
				lastSelectionOnlinePlayer2 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					OnlinePlayer1 = true
					OnlinePlayer2 = false
				elseif IsDisabledControlJustReleased(1, 175)then
					OnlinePlayer1 = true
					OnlinePlayer2 = false
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~Teleport To Online Player")

			for i = 16, 31 do
				TriggerEvent("FMODT:Option", GetPlayerName(i), function(cb)
					if (cb) then
						player = i
					end
				end)
			end
			
			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 2", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 2")
				end
			end)

			TriggerEvent("FMODT:Update")
		end
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Teleport To Waypoint
	local zHeigt = 0.0; height = 1000.0
	while true do
		Citizen.Wait(0)
		if wp then
			if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
				entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
			else
				entity = GetPlayerPed(-1)
			end

			SetEntityCoords(entity, WaypointCoords.x, WaypointCoords.y, height)
			FreezeEntityPosition(entity, true)
			local Pos = GetEntityCoords(entity, true)
			
			if zHeigt == 0.0 then
				height = height - 50.0
				SetEntityCoords(entity, Pos.x, Pos.y, height)
				TriggerServerEvent("EffectForAll", PlayerId())
				zHeigt = getGroundZ(Pos.x, Pos.y, Pos.z)
			else
				TriggerServerEvent("EffectForAll", PlayerId())
				SetEntityCoords(entity, Pos.x, Pos.y, zHeigt)
				FreezeEntityPosition(entity, false)
				wp = false
				height = 1000.0
				zHeigt = 0.0
				drawNotification("~g~" .. TeleportedToWaypointMessage .. "!")
			end
		end
	end
end)

Citizen.CreateThread(function() --Teleport To Online Player - Step One
	while true do
		Citizen.Wait(0)
		PlayerX = nil; PlayerY = nil; PlayerZ = nil
		if player ~= -1 then
			if NetworkIsPlayerConnected(player) and NetworkIsPlayerActive(player) then
				if player ~= PlayerId() then
					if IsPedInAnyVehicle(GetPlayerPed(-1), false) and (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)) then
						entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
					else
						entity = GetPlayerPed(-1)
					end
					if IsEntityAVehicle(entity) then
						TriggerServerEvent("GetCoords", GetPlayerServerId(player), GetPlayerServerId(PlayerId()))
						while PlayerX == nil and PlayerY == nil and PlayerZ == nil do
							Citizen.Wait(0)
						end
						SetEntityCoords(entity, PlayerX, PlayerY, PlayerZ)
					else
						if IsPedInAnyVehicle(GetPlayerPed(player), true) and IsAnyVehicleSeatEmpty(GetVehiclePedIsIn(GetPlayerPed(player), false)) then
							local playerVeh = GetVehiclePedIsIn(GetPlayerPed(player), false)
							local seats = GetVehicleModelMaxNumberOfPassengers(GetEntityModel(playerVeh)) - 2
							local seatindex = -1
							while seatindex <= seats and not IsVehicleSeatFree(playerVeh, seatindex) do
								seatindex = seatindex + 1
							end
							TriggerServerEvent("GetCoords", GetPlayerServerId(player), GetPlayerServerId(PlayerId()))
							while PlayerX == nil and PlayerY == nil and PlayerZ == nil do
								Citizen.Wait(0)
							end
							SetEntityCoords(entity, PlayerX, PlayerY, PlayerZ)
							SetPedIntoVehicle(GetPlayerPed(-1), playerVeh, seatindex)
						else
							TriggerServerEvent("GetCoords", GetPlayerServerId(player), GetPlayerServerId(PlayerId()))
							while PlayerX == nil and PlayerY == nil and PlayerZ == nil do
								Citizen.Wait(0)
							end
							SetEntityCoords(entity, PlayerX, PlayerY, PlayerZ)
						end
					end
				else
					drawNotification("~r~" .. CantTeleportToYourselfMessage .. "!")
				end
			else
				drawNotification("~r~Player " .. player + 1 .. " - " .. NotExisting .. "!")
			end
			player = -1
		end
	end
end)

Citizen.CreateThread(function() --Teleport Into Nearest Vehicle
	local NearestVehicle = 0
	local Distance = 500.0
	local count = 0
	while true do
		Citizen.Wait(0)
		if nv then
			for vehicle in EnumerateVehicles() do
				local driverPed = GetPedInVehicleSeat(vehicle, -1)
				if (vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false)) and (GetVehicleModelNumberOfSeats(GetEntityModel(vehicle)) >= 1) and not IsPedAPlayer(driverPed) then
					local playerPedPos = GetEntityCoords(GetPlayerPed(-1), true)
					local vehiclePos = GetEntityCoords(vehicle, true)
					count = count + 1
					if Vdist(playerPedPos.x, playerPedPos.y, playerPedPos.z, vehiclePos.x, vehiclePos.y, vehiclePos.z) < Distance then
						Distance = Vdist(playerPedPos.x, playerPedPos.y, playerPedPos.z, vehiclePos.x, vehiclePos.y, vehiclePos.z)
						NearestVehicle = vehicle
					end
				end
				if count == 100 then
					if (NearestVehicle ~= 0) and (NearestVehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), false)) and (GetVehicleModelNumberOfSeats(GetEntityModel(NearestVehicle)) >= 1) then
						if IsVehicleSeatFree(NearestVehicle, -1) then
							SetPedIntoVehicle(GetPlayerPed(-1), NearestVehicle, -1)
							SetVehicleAlarm(NearestVehicle, false)
							SetVehicleDoorsLocked(NearestVehicle, 1)
							SetVehicleNeedsToBeHotwired(NearestVehicle, false)
						else
							local driverPed = GetPedInVehicleSeat(NearestVehicle, -1)
							ClearPedTasksImmediately(driverPed)
							SetEntityAsMissionEntity(driverPed, 1, 1)
							DeleteEntity(driverPed)
							SetPedIntoVehicle(GetPlayerPed(-1), NearestVehicle, -1)
							SetVehicleAlarm(NearestVehicle, false)
							SetVehicleDoorsLocked(NearestVehicle, 1)
							SetVehicleNeedsToBeHotwired(NearestVehicle, false)
						end
						drawNotification("~g~" .. TeleportedIntoNearestVehicleMessage .. "!")
						NearestVehicle = 0
						Distance = 500.0
						count = 0
						nv = false
						break
					else
						drawNotification("~r~" .. NoVehicleFoundMessage .. "!")
						count = 0
						nv = false
						break
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function() --IPL Removing/Requesting
	while true do
		Citizen.Wait(0)
		if (IsIplActive("hei_yacht_heist") == false) then
			--Heist Yacht IPLs
			RequestIpl("hei_yacht_heist")
			RequestIpl("hei_yacht_heist_Bar")
			RequestIpl("hei_yacht_heist_Bedrm")
			RequestIpl("hei_yacht_heist_Bridge")
			RequestIpl("hei_yacht_heist_DistantLights")
			RequestIpl("hei_yacht_heist_enginrm")
			RequestIpl("hei_yacht_heist_LODLights")
			RequestIpl("hei_yacht_heist_Lounge")
			--Simeon's Showroom IPLs
			RemoveIpl("shutter_closed")
			RemoveIpl("fakeint")
			RequestIpl("v_carshowroom")
			RequestIpl("shutter_open")
			RequestIpl("shr_int")
			RequestIpl("csr_inMission")
			RequestIpl("fakeint_boards")
			RequestIpl("fakeint_boards_lod")
			--FIB Building IPLs 
			RequestIpl("FIBlobbyfake")
			RequestIpl("fiblobby")
			RequestIpl("fiblobby_lod")
			RequestIpl("fib_heist_lights_lod")
			--Maze Bank Arena IPLs
			RemoveIpl("sp1_10_fake_interior")
			RequestIpl("SP1_10_real_interior")
			RequestIpl("sp1_10_real_interior_lod")
			--Fort Zancudo, Alien Camp & Mount Chilliad UFO IPL
			RequestIpl("ufo")
			RequestIpl("ufo_lod")
			RequestIpl("ufo_eye")
			--Cargo Ship IPL
			RequestIpl("cargoship")
			--Lifeinvader IPLs
			RemoveIpl("facelobbyfake")
			RequestIpl("facelobby")
			--Cluckin Bell IPLs
			RequestIpl("CS1_02_cf_onmission1")
			RequestIpl("CS1_02_cf_onmission2")
			RequestIpl("CS1_02_cf_onmission3")
			RequestIpl("CS1_02_cf_onmission4")
			RequestIpl("CS2_06_TriAf02")
			RemoveIpl("CS1_02_cf_offmission")
			--Union Deposity IPLs
			RemoveIpl("DT1_03_Gr_Closed")
			RequestIpl("FINBANK")
			RequestIpl("DT1_03_Shutter")
			--Jewerly IPLs
			RemoveIpl("bh1_16_refurb")
			RemoveIpl("jewel2fake")
			RequestIpl("post_hiest_unload")
			--Destroyed Hospital IPLs
			RemoveIpl("RC12B_Default")
			RemoveIpl("RC12B_Fixed")
			RequestIpl("RC12B_Destroyed")
			RequestIpl("RC12B_HospitalInterior")
			--The Morgue IPLs
			RequestIpl("Coroner_Int_on")
			--Fort Zancudo Gates IPLs
			if RemoveFortZancudoGates then
				RemoveIpl("cs3_07_mpgates")
			end
			--Lester's Factory IPLs
			RequestIpl("id2_14_during_door")
			RequestIpl("id2_14_during1")
			RemoveIpl("id2_14_during2")
			RemoveIpl("id2_14_on_fire")
			RemoveIpl("id2_14_post_no_int")
			RemoveIpl("id2_14_pre_no_int")
		end
	end
end)

Citizen.CreateThread(function() --IPL Removing/Requesting (North Yankton & Heist Carrier)
	while true do
		Citizen.Wait(0)
		
		local playerPedPos = GetEntityCoords(GetPlayerPed(-1), true)
		local playerDist = Vdist(playerPedPos.x, playerPedPos.y, playerPedPos.z, 4740.0, -5080.0, 107.0)
		local height
		GetWaterHeight(playerPedPos.x, playerPedPos.y, playerPedPos.z, height)
		local waterdist = Vdist(playerPedPos.x, playerPedPos.y, playerPedPos.z, playerPedPos.x, playerPedPos.y, height)
		if (playerDist <= 3600.0) and (waterdist >= 77.0) then
			SetDrawMapVisible(true)
		--Removing The Heist Carrier Under North Yankton
			RemoveIpl("hei_carrier")
			RemoveIpl("hei_carrier_DistantLights")
			RemoveIpl("hei_Carrier_int1")
			RemoveIpl("hei_Carrier_int2")
			RemoveIpl("hei_Carrier_int3")
			RemoveIpl("hei_Carrier_int4")
			RemoveIpl("hei_Carrier_int5")
			RemoveIpl("hei_Carrier_int6")
			RemoveIpl("hei_carrier_LODLights")
		--Requesting The North Yankton Map
			RequestIpl("plg_01")
			RequestIpl("prologue01")
			RequestIpl("prologue01_lod")
			RequestIpl("prologue01c")
			RequestIpl("prologue01c_lod")
			RequestIpl("prologue01d")
			RequestIpl("prologue01d_lod")
			RequestIpl("prologue01e")
			RequestIpl("prologue01e_lod")
			RequestIpl("prologue01f")
			RequestIpl("prologue01f_lod")
			RequestIpl("prologue01g")
			RequestIpl("prologue01h")
			RequestIpl("prologue01h_lod")
			RequestIpl("prologue01i")
			RequestIpl("prologue01i_lod")
			RequestIpl("prologue01j")
			RequestIpl("prologue01j_lod")
			RequestIpl("prologue01k")
			RequestIpl("prologue01k_lod")
			RequestIpl("prologue01z")
			RequestIpl("prologue01z_lod")
			RequestIpl("plg_02")
			RequestIpl("prologue02")
			RequestIpl("prologue02_lod")
			RequestIpl("plg_03")
			RequestIpl("prologue03")
			RequestIpl("prologue03_lod")
			RequestIpl("prologue03b")
			RequestIpl("prologue03b_lod")
			RequestIpl("prologue03_grv_dug")
			RequestIpl("prologue03_grv_dug_lod")
			RequestIpl("prologue_grv_torch")
			RequestIpl("plg_04")
			RequestIpl("prologue04")
			RequestIpl("prologue04_lod")
			RequestIpl("prologue04b")
			RequestIpl("prologue04b_lod")
			RequestIpl("prologue04_cover")
			RequestIpl("des_protree_end")
			RequestIpl("des_protree_start")
			RequestIpl("des_protree_start_lod")
			RequestIpl("plg_05")
			RequestIpl("prologue05")
			RequestIpl("prologue05_lod")
			RequestIpl("prologue05b")
			RequestIpl("prologue05b_lod")
			RequestIpl("plg_06")
			RequestIpl("prologue06")
			RequestIpl("prologue06_lod")
			RequestIpl("prologue06b")
			RequestIpl("prologue06b_lod")
			RequestIpl("prologue06_int")
			RequestIpl("prologue06_int_lod")
			RequestIpl("prologue06_pannel")
			RequestIpl("prologue06_pannel_lod")
			RequestIpl("prologue_m2_door")
			RequestIpl("prologue_m2_door_lod")
			RequestIpl("plg_occl_00")
			RequestIpl("prologue_occl")
			RequestIpl("plg_rd")
			RequestIpl("prologuerd")
			RequestIpl("prologuerdb")
			RequestIpl("prologuerd_lod")
			RequestIpl("prologue03_grv_cov")
			RequestIpl("prologue03_grv_cov_lod")
			RequestIpl("prologue03_grv_fun")
		else
			SetDrawMapVisible(false)
		--Requesting The Heist Carrier Under North Yankton
			RequestIpl("hei_carrier")
			RequestIpl("hei_carrier_DistantLights")
			RequestIpl("hei_Carrier_int1")
			RequestIpl("hei_Carrier_int2")
			RequestIpl("hei_Carrier_int3")
			RequestIpl("hei_Carrier_int4")
			RequestIpl("hei_Carrier_int5")
			RequestIpl("hei_Carrier_int6")
			RequestIpl("hei_carrier_LODLights")
		--Removing The North Yankton Map
			RemoveIpl("plg_01")
			RemoveIpl("prologue01")
			RemoveIpl("prologue01_lod")
			RemoveIpl("prologue01c")
			RemoveIpl("prologue01c_lod")
			RemoveIpl("prologue01d")
			RemoveIpl("prologue01d_lod")
			RemoveIpl("prologue01e")
			RemoveIpl("prologue01e_lod")
			RemoveIpl("prologue01f")
			RemoveIpl("prologue01f_lod")
			RemoveIpl("prologue01g")
			RemoveIpl("prologue01h")
			RemoveIpl("prologue01h_lod")
			RemoveIpl("prologue01i")
			RemoveIpl("prologue01i_lod")
			RemoveIpl("prologue01j")
			RemoveIpl("prologue01j_lod")
			RemoveIpl("prologue01k")
			RemoveIpl("prologue01k_lod")
			RemoveIpl("prologue01z")
			RemoveIpl("prologue01z_lod")
			RemoveIpl("plg_02")
			RemoveIpl("prologue02")
			RemoveIpl("prologue02_lod")
			RemoveIpl("plg_03")
			RemoveIpl("prologue03")
			RemoveIpl("prologue03_lod")
			RemoveIpl("prologue03b")
			RemoveIpl("prologue03b_lod")
			RemoveIpl("prologue03_grv_dug")
			RemoveIpl("prologue03_grv_dug_lod")
			RemoveIpl("prologue_grv_torch")
			RemoveIpl("plg_04")
			RemoveIpl("prologue04")
			RemoveIpl("prologue04_lod")
			RemoveIpl("prologue04b")
			RemoveIpl("prologue04b_lod")
			RemoveIpl("prologue04_cover")
			RemoveIpl("des_protree_end")
			RemoveIpl("des_protree_start")
			RemoveIpl("des_protree_start_lod")
			RemoveIpl("plg_05")
			RemoveIpl("prologue05")
			RemoveIpl("prologue05_lod")
			RemoveIpl("prologue05b")
			RemoveIpl("prologue05b_lod")
			RemoveIpl("plg_06")
			RemoveIpl("prologue06")
			RemoveIpl("prologue06_lod")
			RemoveIpl("prologue06b")
			RemoveIpl("prologue06b_lod")
			RemoveIpl("prologue06_int")
			RemoveIpl("prologue06_int_lod")
			RemoveIpl("prologue06_pannel")
			RemoveIpl("prologue06_pannel_lod")
			RemoveIpl("prologue_m2_door")
			RemoveIpl("prologue_m2_door_lod")
			RemoveIpl("plg_occl_00")
			RemoveIpl("prologue_occl")
			RemoveIpl("plg_rd")
			RemoveIpl("prologuerd")
			RemoveIpl("prologuerdb")
			RemoveIpl("prologuerd_lod")
			RemoveIpl("prologue03_grv_cov")
			RemoveIpl("prologue03_grv_cov_lod")
			RemoveIpl("prologue03_grv_fun")
		end
	end
end)

Citizen.CreateThread(function() --Setting Custom Coords
	while true do
		Citizen.Wait(0)
		if SetCoords then
			DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "","" .. CustomX .. "," .. CustomY .. "," .. CustomZ .. "", "", "", "", 25)
			blockinput = true

			while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
				drawNotification("~y~" .. NoSpacesMessage)
				Citizen.Wait(0)
			end
			if UpdateOnscreenKeyboard() ~= 2 then
				local result = GetOnscreenKeyboardResult()
				local coords = stringsplit(result, ",")
				if tonumber(coords[1]) == nil then
					CustomX = 0.0
				else
					CustomX = 0.0 + tonumber(coords[1])
				end
				if tonumber(coords[2]) == nil then
					CustomY = 0.0
				else
					CustomY = 0.0 + tonumber(coords[2])
				end
				if tonumber(coords[3]) == nil then
					CustomZ = 0.0
				else
					CustomZ = 0.0 + tonumber(coords[3])
				end
				drawNotification("~g~" .. CoordsSetMessage .. "!")
				Citizen.Wait(500)
			else
				drawNotification("~r~" .. CoordsSettingAbortedMessage .. "!")
				Citizen.Wait(500)
			end
			blockinput = false
			SetCoords = false
		end
	end
end)

AddEventHandler("Effect", function(EffectPlayer) --Start The Teleport Effect For Everyone Around The Player
	local Entity
	local playerPedPos = GetEntityCoords(GetPlayerPed(-1), true)
	local EffectPlayerPedPos = GetEntityCoords(GetPlayerPed(EffectPlayer), true)
	local playerDist = Vdist(playerPedPos.x, playerPedPos.y, playerPedPos.z, EffectPlayerPedPos.x, EffectPlayerPedPos.y, EffectPlayerPedPos.z)
	if playerDist < 50 then
		if IsPedInAnyVehicle(GetPlayerPed(EffectPlayer), 0) then
			Entity = GetVehiclePedIsIn(GetPlayerPed(EffectPlayer), 0)
			scale = 15.0
		else
			Entity = GetPlayerPed(EffectPlayer)
			scale = 4.0
		end
		if not HasNamedPtfxAssetLoaded("scr_rcbarry1") then
			RequestNamedPtfxAsset("scr_rcbarry1")
			while not HasNamedPtfxAssetLoaded("scr_rcbarry1") do
				Citizen.Wait(0)
			end
			if HasNamedPtfxAssetLoaded("scr_rcbarry1") then
			end
		end
		SetPtfxAssetNextCall("scr_rcbarry1")
		StartParticleFxLoopedAtCoord("scr_alien_teleport", EffectPlayerPedPos.x, EffectPlayerPedPos.y, EffectPlayerPedPos.z, 0.0, 0.0, 0.0, scale, false, false, false, false)
		RemoveNamedPtfxAsset("scr_rcbarry1")
	end
end)

AddEventHandler("GetCoordsClient", function(Sender)
	local X, Y, Z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	TriggerServerEvent("GotCoords", Sender, X, Y, Z)
end)

AddEventHandler("GotCoordsClient", function(X, Y, Z)
	PlayerX = X
	PlayerY = Y
	PlayerZ = Z
end)


deletegun = false; vehiclegun = false; whalegun = false; teleportgun = false; fireammo = false; VehicleWeaponsPosition = 1
setinfinite = false; oneshot = false; vehicleweapons = false; explosiveammo = false; ExplosiveBulletEnumPosition = 1
local VehicleWeaponHash, ExplosiveBulletEnum


Citizen.CreateThread(function() --Weapon Menu
	while true do
		if (weaponMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionweaponMenu
			else
				lastSelectionweaponMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. WeaponMenuTitle)

			TriggerEvent("FMODT:Option", GiveAllWeaponsTitle, function(cb)
				if (cb) then
					local Melee = {
								   -1716189206, 1737195953, 1317494643, -1786099057, -2067956739, 1141786504, -102323637, -102323637,
								   -102973651, -656458692, -581044007, -1951375401, -538741184, -1810795771, 419712736, -853065399
								  }
					local Handguns = {
									  453432689, 1593441988, -1716589765, -1076751822, -771403250, 137902532,
									  -598887786, -1045183535, 584646201, 911657153, 1198879012, 3219281620
									 }
					local MachineGuns = {
										 324215364,  -619010992, 736523883, -270015777, 171789620, -1660422300, 2144741730,
										 1627465347, -1121678507, 2024373456, 3686625920
										}
					local AssaultRifles = {
										   -1074790547, -2084633992, -1357824103, -1063057011, 2132975508, 1649403952,
										   961495388, 4208062921
										  }
					local SniperRifles = {
										  100416529, 205991906, -952879014, 177293209
										 }
					local Shotguns = {
									  487013001, 2017895192, -1654528753, -494615257, -1466123874, 984333226, -275439685, 317205821
									 }
					local HeavyWeapons = {
										  -1568386805, -1312131151, 1119849093, 2138347493, 1834241177, 1672152130, 125959754
										 }
					local ThrownWeapons = {
										  -1813897027, 741814745, -1420407917, -1600701090, 615608432, 101631238, 883325847, 1233104067,
										  600439132, 126349499, -37975472, -1169823560
										 }
					local Parachute = {
									   -72657034
									  }
								  
					for k, weapon in pairs(Melee) do
						GiveWeaponToPed(GetPlayerPed(-1), weapon, 99999, false, false)
					end
					for k, weapon in pairs(Handguns) do
						GiveWeaponToPed(GetPlayerPed(-1), weapon, 99999, false, false)
					end
					for k, weapon in pairs(MachineGuns) do
						GiveWeaponToPed(GetPlayerPed(-1), weapon, 99999, false, false)
					end
					for k, weapon in pairs(AssaultRifles) do
						GiveWeaponToPed(GetPlayerPed(-1), weapon, 99999, false, false)
					end
					for k, weapon in pairs(SniperRifles) do
						GiveWeaponToPed(GetPlayerPed(-1), weapon, 99999, false, false)
					end
					for k, weapon in pairs(Shotguns) do
						GiveWeaponToPed(GetPlayerPed(-1), weapon, 99999, false, false)
					end
					for k, weapon in pairs(HeavyWeapons) do
						GiveWeaponToPed(GetPlayerPed(-1), weapon, 99999, false, false)
					end
					for k, weapon in pairs(ThrownWeapons) do
						GiveWeaponToPed(GetPlayerPed(-1), weapon, 99999, false, false)
					end
					for k, weapon in pairs(Parachute) do
						GiveWeaponToPed(GetPlayerPed(-1), weapon, 99999, false, false)
					end			
					drawNotification("~g~" .. AllWeaponsGivenMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Option", RemoveAllWeaponsTitle, function(cb)
				if (cb) then
					RemoveAllPedWeapons(GetPlayerPed(-1), true)
					drawNotification("~g~" .. AllWeaponsRemovedMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Bool", DeleteGunTitle, deletegun, function(cb)
				deletegun = cb
				if deletegun then
					drawNotification("~g~" .. DeleteGunEnableMessage .. "!")
					GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 0, false, true)
					SetPedAmmo(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 0)
				else
					drawNotification("~r~" .. DeleteGunDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. ExplosiveBulletTitle, function(cb)
				if (cb) then
					explosiveBulletMenu = true
					weaponMenu = false
				end
			end)

			TriggerEvent("FMODT:Bool", FireAmmoTitle, fireammo, function(cb)
				fireammo = cb
				if fireammo then
					drawNotification("~g~" .. FireAmmoEnableMessage .. "!")
				else
					drawNotification("~r~" .. FireAmmoDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Bool", InfiniteAmmoNoReloadTitle, setinfinite, function(cb)
				setinfinite = cb
				if setinfinite then
					drawNotification("~g~" .. InfiniteAmmoNoReloadEnableMessage .. "!")
				else
					drawNotification("~r~" .. InfiniteAmmoNoReloadDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Bool", OneShotKillTitle, oneshot, function(cb)
				oneshot = cb
				if oneshot then
					drawNotification("~g~" .. OneShotKillEnableMessage .. "!")
				else
					drawNotification("~r~" .. OneShotKillDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Bool", TeleportGunTitle, teleportgun, function(cb)
				teleportgun = cb
				if teleportgun then
					drawNotification("~g~" .. TeleportGunEnableMessage .. "!")
					GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER"), 999999, false, true)
					SetPedAmmo(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER"), 999999)
				else
					drawNotification("~r~" .. TeleportGunDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Bool", VehicleGunTitle, vehiclegun, function(cb)
				vehiclegun = cb
				if vehiclegun then
					drawNotification("~g~" .. VehicleGunEnableMessage .. "!")
					GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), 999999, false, true)
					SetPedAmmo(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), 999999)
				else
					drawNotification("~r~" .. VehicleGunDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. VehicleWeaponsTitle .. "", function(cb)
				if (cb) then
					weaponMenu = false
					vehicleweaponsMenu = true
				end
			end)

			TriggerEvent("FMODT:Bool", WhaleGunTitle, whalegun, function(cb)
				whalegun = cb
				if whalegun then
					drawNotification("~g~" .. WhaleGunEnableMessage .. "!")
					GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"), 999999, false, true)
					SetPedAmmo(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"), 999999)
				else
					drawNotification("~r~" .. WhaleGunDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Explosive Bullet Menu
	local array = {
				   "Grenade", "Grenadelauncher",
				   "Stickybomb", "Molotov",
				   "Rocket", "Tankshell",
				   "Octane", "Car",
				   "Plane", "Petrol Pump",
				   "Bike", "Dir Steam",
				   "Dir Flame", "Dir Water",
				   "Dir Gas Canister", "Boat",
				   "Ship", "Truck",
				   "Bullet", "Smoke GL",
				   "Smoke Grenade", "BZ Gas",
				   "Flare", "Gas Canister",
				   "Extinguisher", "Programmable AR",
				   "Train", "Barrel",
				   "Propane", "Atomic Blip",
				   "Dir Flame Explode", "Tanker",
				   "Plane Rocket", "Vehicle Bullet",
				   "Gas Tank", "Xero Blimp",
				   "Firework"
				  }
	local array2 = {
				    {"EXPLOSION_GRENADE", 0}, {"EXPLOSION_GRENADELAUNCHER", 1}, 
				    {"EXPLOSION_STICKYBOMB", 2}, {"EXPLOSION_MOLOTOV", 3}, 
				    {"EXPLOSION_ROCKET", 4}, {"EXPLOSION_TANKSHELL", 5}, 
				    {"EXPLOSION_HI_OCTANE", 6}, {"EXPLOSION_CAR", 7}, 
				    {"EXPLOSION_PLANE", 8}, {"EXPLOSION_PETROL_PUMP", 9},
				    {"EXPLOSION_BIKE", 10}, {"EXPLOSION_DIR_STEAM", 11},
				    {"EXPLOSION_DIR_FLAME", 12}, {"EXPLOSION_DIR_WATER_HYDRANT", 13},
				    {"EXPLOSION_DIR_GAS_CANISTER", 14}, {"EXPLOSION_BOAT", 15},
				    {"EXPLOSION_SHIP_DESTROY", 16}, {"EXPLOSION_TRUCK", 17},
				    {"EXPLOSION_BULLET", 18}, {"EXPLOSION_SMOKEGRENADELAUNCHER", 19},
				    {"EXPLOSION_SMOKEGRENADE", 20}, {"EXPLOSION_BZGAS", 21},
				    {"EXPLOSION_FLARE", 22}, {"EXPLOSION_GAS_CANISTER", 23},
				    {"EXPLOSION_EXTINGUISHER", 24}, {"EXPLOSION_PROGRAMMABLEAR", 25},
				    {"EXPLOSION_TRAIN", 26}, {"EXPLOSION_BARREL", 27},
				    {"EXPLOSION_PROPANE", 28}, {"EXPLOSION_BLIMP", 29},
				    {"EXPLOSION_DIR_FLAME_EXPLODE", 30}, {"EXPLOSION_TANKER", 31},
				    {"EXPLOSION_PLANE_ROCKET", 32}, {"EXPLOSION_VEHICLE_BULLET", 33},
				    {"EXPLOSION_GAS_TANK", 34}, {"EXPLOSION_XERO_BLIMP", 37},
					{"EXPLOSION_FIREWORK", 38}
				   }
	while true do

		if (explosiveBulletMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionexplosiveBulletMenu
			else
				lastSelectionexplosiveBulletMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ExplosiveBulletTitle)

			TriggerEvent("FMODT:Bool", ExplosiveBulletTitle, explosiveammo, function(cb)
				explosiveammo = cb
				if explosiveammo then
					drawNotification("~g~" .. ExplosiveBulletEnableMessage .. "!")
				else
					drawNotification("~r~" .. ExplosiveBulletDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:StringArray", ExplosionTypeTitle .. ":", array, ExplosiveBulletEnumPosition, function(cb)
				ExplosiveBulletEnumPosition = cb
				ExplosiveBulletEnum = array2[ExplosiveBulletEnumPosition][2]
			end)

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Vehicle Weapons Menu
	local array = {
				   "Air Defence Gun", "Assault Rifle",
				   "Assault Shotgun", "Fireworks",
				   "Grenadelauncher", "Molotov",
				   "Railgun", "RPG",
				   "Snowballs", "Stungun"
				  }
	local array2 = {
				    "WEAPON_AIR_DEFENCE_GUN", "WEAPON_ASSAULTRIFLE",
				    "WEAPON_ASSAULTSHOTGUN", "WEAPON_FIREWORK",
				    "WEAPON_GRENADELAUNCHER", "WEAPON_MOLOTOV",
				    "WEAPON_RAILGUN", "WEAPON_RPG",
				    "WEAPON_SNOWBALL", "WEAPON_STUNGUN",
				   }
	while true do

		if (vehicleweaponsMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionvehicleweaponsMenu
			else
				lastSelectionvehicleweaponsMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. VehicleWeaponsTitle)

			TriggerEvent("FMODT:Bool", VehicleWeaponsTitle .. ":", vehicleweapons, function(cb)
				vehicleweapons = cb
				if vehicleweapons then
					vehicleweaponsinstructions = true
					drawNotification("~g~" .. VehicleWeaponsEnableMessage .. "!")
				else
					drawNotification("~r~" .. VehicleWeaponsDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:StringArray", AmmoTypeTitle .. ":", array, VehicleWeaponsPosition, function(cb)
				VehicleWeaponsPosition = cb
				VehicleWeaponHash = GetHashKey(array2[VehicleWeaponsPosition])
				GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(array2[VehicleWeaponsPosition]), 9999, true, true)
			end)

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Infinite Ammo
	while true do
		Wait(1)

		if setinfinite and allowed then
			SetPedInfiniteAmmo(GetPlayerPed(-1), true)
			SetPedInfiniteAmmoClip(GetPlayerPed(-1), true)
			SetPedAmmo(GetPlayerPed(-1), (GetSelectedPedWeapon(GetPlayerPed(-1))), 999)
		elseif not setinfinite and allowed then
			SetPedInfiniteAmmo(GetPlayerPed(-1), false)
			SetPedInfiniteAmmoClip(GetPlayerPed(-1), false)
		end
	end
end)

Citizen.CreateThread(function() --Explosive Ammo
	while true do
		Wait(1)

		if explosiveammo and allowed then
			SetExplosiveMeleeThisFrame(PlayerId())
			local x, y, z = table.unpack(BulletCoords())
			if x ~= 0.0 and y ~= 0.0 and z ~= 0.0 then
				AddOwnedExplosion(GetPlayerPed(-1), x, y, z, ExplosiveBulletEnum, 20.0, true, false, 0.0)
			end
		end
	end
end)

Citizen.CreateThread(function() --Fire Ammo
	while true do
		Wait(1)

		if fireammo and allowed then
			SetFireAmmoThisFrame(PlayerId())
		end
	end
end)

Citizen.CreateThread(function() --One Shot Kill
	while true do
		Citizen.Wait(0)
		if allowed then
			if oneshot then
				SetPlayerWeaponDamageModifier(PlayerId(), 100.0)
				if IsPedShooting(GetPlayerPed(-1)) then
					local gotEntity = getEntity(PlayerId())
					if IsEntityAPed(gotEntity) then
						if IsPedInAnyVehicle(gotEntity, true) then
							if IsPedShooting(GetPlayerPed(-1)) then
								NetworkExplodeVehicle(GetVehiclePedIsIn(gotEntity, true), true, true, 0)
							end
						end
					elseif IsEntityAVehicle(gotEntity) then
						if IsPedShooting(GetPlayerPed(-1)) then
							NetworkExplodeVehicle(gotEntity, true, true, 0)
						end
					end
				end
			else
				SetPlayerWeaponDamageModifier(PlayerId(), 1.0)
			end
		end
	end
end)

Citizen.CreateThread(function() --Teleport Gun
	while true do
		Citizen.Wait(0)
		
		
		if teleportgun and allowed then
			local x, y, z = table.unpack(BulletCoords())
			if (IsPedInAnyVehicle(GetPlayerPed(-1), true) == false) then
				if (GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_HEAVYSNIPER")) then
					if (x ~= 0.0) and (y ~= 0.0) and (z ~= 0.0) then
						SetEntityCoords(GetPlayerPed(-1), x, y, z)
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function() --Delete Gun
	while true do
		Citizen.Wait(0)
		
		if deletegun and allowed then
			local gotEntity = getEntity(PlayerId())
			if (IsPedInAnyVehicle(GetPlayerPed(-1), true) == false) then
				if (GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_PISTOL")) then
					if IsPlayerFreeAiming(PlayerId()) then
						if IsEntityAPed(gotEntity) then
							if IsPedInAnyVehicle(gotEntity, true) then
								if IsControlJustReleased(1, 142) then
									SetEntityAsMissionEntity(GetVehiclePedIsIn(gotEntity, true), 1, 1)
									DeleteEntity(GetVehiclePedIsIn(gotEntity, true))
									SetEntityAsMissionEntity(gotEntity, 1, 1)
									DeleteEntity(gotEntity)
									drawNotification("~g~" .. DeletedMessage .. "!")
								end
							else
								if IsControlJustReleased(1, 142) then
									SetEntityAsMissionEntity(gotEntity, 1, 1)
									DeleteEntity(gotEntity)
									drawNotification("~g~" .. DeletedMessage .. "!")
								end
							end
						else
							if IsControlJustReleased(1, 142) then
								SetEntityAsMissionEntity(gotEntity, 1, 1)
								DeleteEntity(gotEntity)
								drawNotification("~g~" .. DeletedMessage .. "!")
							end
						end
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function() --Vehicle Gun
	while true do
		Citizen.Wait(0)

		
		if vehiclegun and allowed then
			local playerPedPos = GetEntityCoords(GetPlayerPed(-1), true)
			if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
				if (GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_APPISTOL")) then
					if IsPedShooting(GetPlayerPed(-1)) then
						while not HasModelLoaded(GetHashKey(VehicleGunVehicle)) do
							Citizen.Wait(0)
							RequestModel(GetHashKey(VehicleGunVehicle))
						end
						local veh = CreateVehicle(GetHashKey(VehicleGunVehicle), playerPedPos.x + (10 * GetEntityForwardX(GetPlayerPed(-1))), playerPedPos.y + (10 * GetEntityForwardY(GetPlayerPed(-1))), getGroundZ(playerPedPos.x + (10 * GetEntityForwardX(GetPlayerPed(-1))), playerPedPos.y + (10 * GetEntityForwardY(GetPlayerPed(-1))), playerPedPos.z + 5), GetEntityHeading(GetPlayerPed(-1)), true, true)
						SetEntityAsNoLongerNeeded(veh)
						SetVehicleForwardSpeed(veh, 150.0)
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function() --Vehicle Gun (Delete)
	while true do
		Citizen.Wait(0)

		if vehiclegun and allowed then
			local NearestVehicle = GetClosestVehicle(GetEntityCoords(GetPlayerPed(-1), true), 9999.9999, GetHashKey(VehicleGunVehicle), 71)
			local playerPedPos = GetEntityCoords(GetPlayerPed(-1), true)
			local NearestVehiclePos = GetEntityCoords(NearestVehicle, true)
			if IsVehicleSeatFree(NearestVehicle, -1) then
				if (Vdist(playerPedPos.x, playerPedPos.y, playerPedPos.z, NearestVehiclePos.x, NearestVehiclePos.y, NearestVehiclePos.z) >= 150.0) then
					SetEntityAsMissionEntity(NearestVehicle, 1, 1)
					DeleteVehicle(NearestVehicle)
				end
			end
		end
	end
end)

Citizen.CreateThread(function() --Vehicle Weapons
	while true do
		Citizen.Wait(0)

		if vehicleweapons and allowed then
			if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
				if IsControlPressed(1, 68) then
					SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("WEAPON_UNARMED"), true)
					local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), true)
					local getcoords1 = GetOffsetFromEntityInWorldCoords(playerVeh, 0.6, 0.671, 0.35)
					local getcoords2 = GetOffsetFromEntityInWorldCoords(playerVeh, -0.6, 0.671, 0.35)
					local getcoords3 = GetOffsetFromEntityInWorldCoords(playerVeh, 0.6, 5.071, 0.35)
					local getcoords4 = GetOffsetFromEntityInWorldCoords(playerVeh, -0.6, 5.071, 0.35)
					ShootSingleBulletBetweenCoords(getcoords1.x, getcoords1.y, getcoords1.z, getcoords3.x, getcoords3.y, getcoords3.z, 500, 0, VehicleWeaponHash, GetPlayerPed(-1), true, false, 500.0)
					ShootSingleBulletBetweenCoords(getcoords2.x, getcoords2.y, getcoords2.z, getcoords4.x, getcoords4.y, getcoords4.z, 500, 0, VehicleWeaponHash, GetPlayerPed(-1), true, false, 500.0)
				end
			end
		end
	end
end)

Citizen.CreateThread(function() --Whale Gun
	while true do
		Citizen.Wait(0)
		if whalegun and allowed then
			local playerPedPos = GetEntityCoords(GetPlayerPed(-1), true)
			if (IsPedInAnyVehicle(GetPlayerPed(-1), true) == false) then
				if (GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_STUNGUN")) then
					if IsPedShooting(GetPlayerPed(-1)) then
						if not HasModelLoaded(GetHashKey("a_c_humpback")) then
							RequestModel(GetHashKey("a_c_humpback"))
							while not HasModelLoaded(GetHashKey("a_c_humpback")) do
								Citizen.Wait(0)
							end
						end
						local whale = CreatePed(28, GetHashKey("a_c_humpback"), playerPedPos.x + (10 * GetEntityForwardX(GetPlayerPed(-1))), playerPedPos.y + (10 * GetEntityForwardY(GetPlayerPed(-1))), playerPedPos.z, GetEntityHeading(GetPlayerPed(-1)), true, true)
						SetEntityAsNoLongerNeeded(whale)
						ApplyForceToEntity(whale, 1, GetEntityForwardX(whale) * 1000, GetEntityForwardY(whale) * 1000, 0.0, 0.0, 0.0, 0.0, 1, false, true, true, true, true)
					end
				end
			end
		end
	end
end)


xPos = menuX; outfitSpawn = false; OutfitIndex = 1; keepWeapons = false; SettingsTable = {}
local getWeapons = false; HasOutfits = false

Citizen.CreateThread(function() --Settings Menu
	while true do

		if (settingsMenu) then
		
			for i = 1, 20 do
				if OutfitNames[i] ~= NoOutfitName then
					HasOutfits = true
					break
				else
					HasOutfits = false
				end
			end

			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionsettingsMenu
			else
				lastSelectionsettingsMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. SettingsMenuTitle)
			
			if HasOutfits then
				TriggerEvent("FMODT:Bool", RestoreAppearanceBySpawnTitle, outfitSpawn, function(cb)
					outfitSpawn = cb
				end)
				
				if outfitSpawn then
					TriggerEvent("FMODT:StringArray", SelectOutfitTitle, OutfitNames, OutfitIndex, function(cb)
						OutfitIndex = cb
					end)
				end
			end
			
			TriggerEvent("FMODT:Bool", KeepWeaponsTitle, keepWeapons, function(cb)
				keepWeapons = cb
				getWeapons = keepWeapons
			end)
			
			TriggerEvent("FMODT:Float", MenuPositionHorizontalTitle, xPos, 0.15, 0.85, 0.01, 9, function(cb)
				xPos = cb
				menuX = xPos
			end)
			
			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Disables Weapon Saving, When The Player Is Dead 
	while true do
		Citizen.Wait(0)
		if IsPedDeadOrDying(GetPlayerPed(-1), 1) then
			getWeapons = false
		end
	end
end)

Citizen.CreateThread(function() --Gets Players Weapons
	while true do
		Citizen.Wait(15000)
		if getWeapons and IsUsingSteam then
			local gotWeap = {}
			local weaponHashes = {
								  -1716189206, 1737195953, 1317494643, -1786099057, -2067956739, 1141786504, -102323637, -102323637, --Melee
								  -102973651, -656458692, -581044007, -1951375401, -538741184, -1810795771, 419712736, -853065399, --Melee
								  453432689, 1593441988, -1716589765, -1076751822, -771403250, 137902532, --Handguns
								  -598887786, -1045183535, 584646201, 911657153, 1198879012, 3219281620, --Handguns
								  324215364,  -619010992, 736523883, -270015777, 171789620, -1660422300, 2144741730, --MachineGuns
								  1627465347, -1121678507, 2024373456, 3686625920, --MachineGuns
								  -1074790547, -2084633992, -1357824103, -1063057011, 2132975508, 1649403952, --AssaultRifles
								  961495388, 4208062921, --AssaultRifles
								  100416529, 205991906, -952879014, 177293209, --SniperRifles
								  487013001, 2017895192, -1654528753, -494615257, -1466123874, 984333226, -275439685, 317205821, --Shotguns
								  -1568386805, -1312131151, 1119849093, 2138347493, 1834241177, 1672152130, 125959754, --HeavyWeapons
								  -1813897027, 741814745, -1420407917, -1600701090, 615608432, 101631238, 883325847, 1233104067, --ThrownWeapons
								  600439132, 126349499, -37975472, -1169823560 --ThrownWeapons
								  -72657034 --Parachute
								 }
			
			for i = 1, tablelength(weaponHashes) do
				if HasPedGotWeapon(GetPlayerPed(-1), weaponHashes[i], false) then
					local bool, clipAmmo = GetAmmoInClip(GetPlayerPed(-1), weaponHashes[i])
					table.insert(gotWeap, weaponHashes[i])
					table.insert(gotWeap, GetAmmoInPedWeapon(GetPlayerPed(-1), weaponHashes[i]))
					table.insert(gotWeap, clipAmmo)
				end
			end
			local weapons = table.tostring(gotWeap)
				  weapons = weapons:gsub("{", "")
				  weapons = weapons:gsub("}", "")
			TriggerServerEvent("WeaponSaving", weapons)
		end
	end
end)

AddEventHandler("MenuSettingsSet", function(Settings)
	local SettingsSplitted = stringsplit(Settings, ',')

	for i = 1, 20 do
		if OutfitNames[i] ~= NoOutfitName then
			HasOutfits = true
			break
		else
			HasOutfits = false
		end
	end

	menuX = tonumber(SettingsSplitted[1])/100.0
	xPos = menuX
	
	if HasOutfits then
		outfitSpawn = tobool(SettingsSplitted[2])
		OutfitIndex = tonumber(SettingsSplitted[3])
	end
	
	if SettingsSplitted[4] ~= "nil" then keepWeapons = tobool(SettingsSplitted[4]) end
	if SettingsSplitted[5] ~= "nil" then godmode = tobool(SettingsSplitted[5]) end
	if SettingsSplitted[6] ~= "nil" then godmodeCount = tonumber(SettingsSplitted[6]) end
	if SettingsSplitted[7] ~= "nil" then playerVisible = tobool(SettingsSplitted[7]) end
	if SettingsSplitted[8] ~= "nil" then playerVisibleCount = tonumber(SettingsSplitted[8]) end
	if SettingsSplitted[9] ~= "nil" then nowantedlevel = tobool(SettingsSplitted[9]) end
	if SettingsSplitted[10] ~= "nil" then nowantedlevelCount = tonumber(SettingsSplitted[10]) end
	if SettingsSplitted[11] ~= "nil" then superjump = tobool(SettingsSplitted[11]) end
	if SettingsSplitted[12] ~= "nil" then stamina = tobool(SettingsSplitted[12]) end
	if SettingsSplitted[13] ~= "nil" then supermanmode = tobool(SettingsSplitted[13]) end
	if SettingsSplitted[14] ~= "nil" then maxWantedLevel = tonumber(SettingsSplitted[14]) end
	if SettingsSplitted[14] ~= "nil" then SetMaxWantedLevel(tonumber(SettingsSplitted[14])) end
	if SettingsSplitted[15] ~= "nil" then Run = tonumber(SettingsSplitted[15]) / 10.0 end
	if SettingsSplitted[16] ~= "nil" then Swim = tonumber(SettingsSplitted[16]) / 10.0 end
	if SettingsSplitted[17] ~= "nil" then vehgodmode = tobool(SettingsSplitted[17]) end
	if SettingsSplitted[18] ~= "nil" then flyingvehicle = tobool(SettingsSplitted[18]) end
	if SettingsSplitted[19] ~= "nil" then reducevehgrip = tobool(SettingsSplitted[19]) end
	if SettingsSplitted[20] ~= "nil" then vehicleVisible = tobool(SettingsSplitted[20]) end
	if SettingsSplitted[21] ~= "nil" then gravity = tobool(SettingsSplitted[21]) end
	if SettingsSplitted[22] ~= "nil" then boosthorn = tobool(SettingsSplitted[22]) end
	if SettingsSplitted[23] ~= "nil" then bunnyhop = tobool(SettingsSplitted[23]) end
	if SettingsSplitted[24] ~= "nil" then DriveOnWater = tobool(SettingsSplitted[24]) end
	if SettingsSplitted[25] ~= "nil" then seatbelt = tobool(SettingsSplitted[25]) end
	if SettingsSplitted[26] ~= "nil" then despawnable = tobool(SettingsSplitted[26]) end
	if SettingsSplitted[27] ~= "nil" then autodelete = tobool(SettingsSplitted[27]) end
	if SettingsSplitted[28] ~= "nil" then mapblip = tobool(SettingsSplitted[28]) end
	if SettingsSplitted[29] ~= "nil" then deletegun = tobool(SettingsSplitted[29]) end
	if SettingsSplitted[30] ~= "nil" then vehiclegun = tobool(SettingsSplitted[30]) end
	if SettingsSplitted[31] ~= "nil" then whalegun = tobool(SettingsSplitted[31]) end
	if SettingsSplitted[32] ~= "nil" then teleportgun = tobool(SettingsSplitted[32]) end
	if SettingsSplitted[33] ~= "nil" then fireammo = tobool(SettingsSplitted[33]) end
	if SettingsSplitted[34] ~= "nil" then VehicleWeaponsPosition = tonumber(SettingsSplitted[34]) end
	if SettingsSplitted[35] ~= "nil" then setinfinite = tobool(SettingsSplitted[35]) end
	if SettingsSplitted[36] ~= "nil" then oneshot = tobool(SettingsSplitted[36]) end
	if SettingsSplitted[37] ~= "nil" then vehicleweapons = tobool(SettingsSplitted[37]) end
	if SettingsSplitted[38] ~= "nil" then explosiveammo = tobool(SettingsSplitted[38]) end
	if SettingsSplitted[39] ~= "nil" then ExplosiveBulletEnumPosition = tonumber(SettingsSplitted[39]) end
	if SettingsSplitted[40] ~= "nil" then speedoDefault = tonumber(SettingsSplitted[40]) end
	if SettingsSplitted[41] ~= "nil" then autoparachute = tobool(SettingsSplitted[41]) end
	if SettingsSplitted[42] ~= "nil" then heatvision = tobool(SettingsSplitted[42]) end
	if SettingsSplitted[43] ~= "nil" then nightvision = tobool(SettingsSplitted[43]) end
	if SettingsSplitted[44] ~= "nil" then CoordsOverMap = tobool(SettingsSplitted[44]) end
	if SettingsSplitted[45] ~= "nil" then HideHUD = tobool(SettingsSplitted[45]) end
	if SettingsSplitted[46] ~= "nil" then HideRadar = tobool(SettingsSplitted[46]) end
	if SettingsSplitted[47] ~= "nil" then HideHUDCount = tonumber(SettingsSplitted[47]) end
	if SettingsSplitted[48] ~= "nil" then freezeradio = tobool(SettingsSplitted[48]) end
	if SettingsSplitted[49] ~= "nil" then nocinecam = tobool(SettingsSplitted[49]) end
	if SettingsSplitted[50] ~= "nil" then mobileradio = tobool(SettingsSplitted[50]) end
	if SettingsSplitted[51] ~= "nil" then dfps = tobool(SettingsSplitted[51]) end
	if SettingsSplitted[52] ~= "nil" then simpleSpeedo = tobool(SettingsSplitted[52]) end
	if SettingsSplitted[53] ~= "nil" then RadioFreezePosition = tonumber(SettingsSplitted[53]) end
end)

AddEventHandler("GiveWeaponsBack", function(weapons) --Gives The Player His Weapons
	local Weapons = stringsplit(weapons, ",")
	
	for i = 1, tablelength(Weapons), 3 do
		GiveWeaponToPed(GetPlayerPed(-1), tonumber(Weapons[i]), 0, false, false)
		SetPedAmmo(GetPlayerPed(-1), tonumber(Weapons[i]), tonumber(Weapons[i + 1]))
		SetAmmoInClip(GetPlayerPed(-1), tonumber(Weapons[i]), 0)
	end
	SetCurrentPedWeapon(GetPlayerPed(-1), 2725352035, true)
	getWeapons = true
end)

AddEventHandler("playerSpawned", function(spawn) --Changes To Outfit & Gives Weapons Back By Spawn
	if outfitSpawn then
		if OutfitNames[OutfitIndex] ~= NoOutfitName then
			playerVisible = false
			TriggerServerEvent("OutfitLoad", OutfitIndex)
			drawNotification("~g~" .. OutfitMessage .. " ~y~" .. OutfitNames[OutfitIndex] .. " ~g~" .. LoadedMessage .. "!")
		else
			drawNotification("~r~" .. OutfitMessage .. " " .. OutfitIndex .. " - " .. NotExisting .. "!")
		end
	end
	if keepWeapons then
		if outfitSpawn and OutfitNames[OutfitIndex] ~= NoOutfitName then
			if not HasModelLoaded(Model) then
				while not HasModelLoaded(Model) do
					Citizen.Wait(0)
				end
				Citizen.Wait(1000)
			end
		end
		TriggerServerEvent("WeaponLoading")
	end
end)


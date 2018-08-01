Citizen.CreateThread(function() --Main Menu
	local ShowWorld = false; ShowTeleport = false
	while true do

 		if (mainMenu) then

			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionmainMenu
			else
				lastSelectionmainMenu = currentOption
			end
		
			if WorldAndNoClipOnlyAdmins then if IsAdmin then ShowWorld = true end else ShowWorld = true end
			
			if TeleportOnlyAdmins then if IsAdmin then ShowTeleport = true end else ShowTeleport = true end
			
			TriggerEvent("FMODT:Title", "~y~~bold~CHEM!CAL T0Ж!N")

			if IsAdmin then
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. AdminMenuTitle, function(cb)
					if (cb) then
						TriggerServerEvent("GetHost")
						mainMenu = false
						adminMenu = true
					end
				end)
			end

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. PlayerMenuTitle, function(cb)
				if (cb) then
					mainMenu = false
					playerMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. VehicleMenuTitle, function(cb)
				if (cb) then
					mainMenu = false
					vehicleMenu = true
				end
			end)

			if ShowTeleport then
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. TeleportMenuTitle, function(cb)
					if (cb) then
						mainMenu = false
						teleportMenu = true
					end
				end)
			end

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. WeaponMenuTitle, function(cb)
				if (cb) then
					mainMenu = false
					weaponMenu = true
				end
			end)

			if ShowWorld then
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. WorldMenuTitle, function(cb)
					if (cb) then
						mainMenu = false
						worldMenu = true
					end
				end)
			end

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. MiscMenuTitle, function(cb)
				if (cb) then
					mainMenu = false
					miscMenu = true
				end
			end)

			if IsUsingSteam then
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. SettingsMenuTitle, function(cb)
					if (cb) then
						mainMenu = false
						settingsMenu = true
					end
				end)
			end

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. AboutTitle, function(cb)
				if (cb) then
					mainMenu = false
					aboutMenu = true
				end
			end)

			TriggerEvent("FMODT:Update")

		end
	
		Citizen.Wait(0)
	end
end)
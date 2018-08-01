Citizen.CreateThread(function() --About Menu
	local lastSelectionaboutMenu = 1
	while true do

		if (aboutMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionaboutMenu
			else
				lastSelectionaboutMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. AboutTitle)

			TriggerEvent("FMODT:Option", "~p~" .. VersionTitle .. " " .. Version .. "", function(cb)
				if (cb) then
					drawNotification("~p~~italic~" .. VersionTitle .. " " .. Version .. "")
				end
			end)

			TriggerEvent("FMODT:Option", "~f~CHEM!CAL T0Ж!N: ~bold~FlatracerMOD", function(cb)
				if (cb) then
					drawNotification("~f~~italic~CHEM!CAL T0Ж!N: ~bold~FlatracerMOD (aka Flatracer)")
				end
			end)

			TriggerEvent("FMODT:Option", "~g~" .. MenuBaseTitle .. ": ~bold~MrDaGree", function(cb)
				if (cb) then
					drawNotification("~g~~italic~" .. MenuBaseTitle .. ": ~bold~MrDaGree (aka TylerMcGrubber)")
				end
			end)

			TriggerEvent("FMODT:Option", "~r~" .. FoundAnyBugTitle .. "? " .. ContactMeTitle .. "!", function(cb)
				if (cb) then
					drawNotification("~r~~italic~" .. FoundAnyBugTitle .. "? " .. ContactMeTitle .. "!")
				end
			end)

			TriggerEvent("FMODT:Option", "~y~forum.fivem.net/u/Flatracer/", function(cb)
				if (cb) then
					drawNotification("~y~~italic~forum.fivem.net/u/Flatracer/")
				end
			end)

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)


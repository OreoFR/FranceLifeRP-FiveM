local prevCoordx, prevCoordy, prevCoordz
local player = nil; playerPing = "N/A"; playerIP = "N/A"; FirstIDOutput = {}; SecondIDOutput = {};
	  LicenseID = {"N/A", ""}; SteamID = "N/A"; HostID = "N/A"; HostClientID = "N/A"; HostName = "N/A"

Citizen.CreateThread(function() --Admin Menu
	local VoiceChatChannel = 0
	while true do
		if (adminMenu) then
		
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionadminMenu
			else
				lastSelectionadminMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~ " .. AdminMenuTitle)

			TriggerEvent("FMODT:Option", "~y~>> ~s~ " .. PlayerInfosTitle, function(cb)
				if (cb) then
					adminMenu = false
					adminInformations = true
					adminPlayerList1 = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~ " .. KickPlayerTitle, function(cb)
				if (cb) then
					adminMenu = false
					adminKick = true
					adminPlayerList1 = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~ " .. BanPlayerTitle, function(cb)
				if (cb) then
					adminMenu = false
					adminBan = true
					adminPlayerList1 = true
					drawNotification("~y~" .. BanDurationMessage1)
					drawNotification("~y~" .. BanDurationMessage2)
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~ " .. SpectatePlayerTitle, function(cb)
				if (cb) then
					adminMenu = false
					adminSpectateMenu = true
					adminPlayerList1 = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~ " .. TeleportPlayerToMeTitle, function(cb)
				if (cb) then
					adminMenu = false
					adminTeleport = true
					adminPlayerList1 = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~ " .. MiscellaneousOptionsTitle, function(cb)
				if (cb) then
					adminMenu = false
					adminMiscMenu = true
				end
			end)

			TriggerEvent("FMODT:Option","Host: ~y~" .. HostName .. "~s~ SID: ~y~" .. HostID .. "~s~ CID: ~y~" .. HostClientID, function(cb)
				if (cb) then
					drawNotification("Host: ~y~" .. HostName .. "~n~~s~Server ID: ~y~" .. HostID .. "~n~~s~Client ID: ~y~" .. HostClientID)
				end
			end)

			TriggerEvent("FMODT:Update")
			
		elseif (adminSpectateMenu) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionadminSpectateMenu
			else
				lastSelectionadminSpectateMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~ " .. SpectatePlayerTitle)

			TriggerEvent("FMODT:Option", StopPlayerSpectateTitle, function(cb)
				if (cb) then
					if NetworkIsInSpectatorMode() then
						NetworkSetInSpectatorMode(1, GetPlayerPed(-1))
						NetworkSetInSpectatorMode(0, GetPlayerPed(-1))
						FreezeEntityPosition(GetPlayerPed(-1),  false)
						SetEntityCoords(GetPlayerPed(-1), prevCoordx, prevCoordy, prevCoordz, false, false, false, true)
						SetEntityCollision(GetPlayerPed(-1), true, true)
						if (godmodeCount == 0) then godmode = false end
						if (visibleCount == 0) then visible = false end
						prevCoordx = nil
						prevCoordy = nil
						prevCoordz = nil
						drawNotification("~g~Spectating stopped!")
					else
						drawNotification("~r~Not Spectating!")
					end
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~ " .. ChoosePlayerToSpectateTitle, function(cb)
				if (cb) then
					adminSpectateMenu = false
					adminSpectate = true
					adminPlayerList1 = true
				end
			end)

			TriggerEvent("FMODT:Update")
			
		elseif (adminPlayerList1) then
		
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionadminPlayerList1
			else
				lastSelectionadminPlayerList1 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					adminPlayerList1 = false
					adminPlayerList2 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					adminPlayerList1 = false
					adminPlayerList2 = true
				end
			end
			
			if adminInformations then
				TriggerEvent("FMODT:Title", "~y~ " .. PlayerInfosTitle)
			elseif adminKick then
				TriggerEvent("FMODT:Title", "~y~ " .. KickPlayerTitle)
			elseif adminBan then
				TriggerEvent("FMODT:Title", "~y~ " .. BanPlayerTitle)
			elseif adminSpectate then
				TriggerEvent("FMODT:Title", "~y~ " .. SpectatePlayerTitle)
			elseif adminTeleport then
				TriggerEvent("FMODT:Title", "~y~ " .. TeleportPlayerToMeTitle)
			end
			
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
			
			if adminInformations and currentOption ~= 17 then player = currentOption - 1 end
			
		elseif (adminPlayerList2) then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionadminPlayerList2
			else
				lastSelectionadminPlayerList2 = currentOption
			end
		
			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					adminPlayerList1 = true
					adminPlayerList2 = false
				elseif IsDisabledControlJustReleased(1, 175)then
					adminPlayerList1 = true
					adminPlayerList2 = false
				end
			end
			
			if adminInformations then
				TriggerEvent("FMODT:Title", "~y~ " .. PlayerInfosTitle)
			elseif adminKick then
				TriggerEvent("FMODT:Title", "~y~ " .. KickPlayerTitle)
			elseif adminBan then
				TriggerEvent("FMODT:Title", "~y~ " .. BanPlayerTitle)
			elseif adminSpectate then
				TriggerEvent("FMODT:Title", "~y~ " .. SpectatePlayerTitle)
			elseif adminTeleport then
				TriggerEvent("FMODT:Title", "~y~ " .. TeleportPlayerToMeTitle)
			end
			
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
			
			if adminInformations and currentOption ~= 17 then player = currentOption + 15 end
			
		elseif (adminMiscMenu) then
		
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionadminMiscMenu
			else
				lastSelectionadminMiscMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~ " .. MiscellaneousOptionsTitle)
			
			TriggerEvent("FMODT:Bool", ExtendableMapTitle, ExtendableMap, function(cb)
				ExtendableMap = cb
				if ExtendableMap then
					drawNotification("~g~" .. ExtendableMapEnableMessage .. "!")
				else
					drawNotification("~r~" .. ExtendableMapDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Bool", BlipsAndNamesTitle, playerBlips, function(cb)
				playerBlips = cb
				if playerBlips then
					drawNotification("~g~" .. BlipsAndNamesEnableMessage .. "!")
				else
					drawNotification("~r~" .. BlipsAndNamesDisableMessage .. "!")
				end
			end)

			if playerBlips then
				TriggerEvent("FMODT:Bool", BlipsAndNamesNonAdminsTitle, BlipsAndNamesNonAdmins, function(cb)
					BlipsAndNamesNonAdmins = cb
					if BlipsAndNamesNonAdmins then
						drawNotification("~g~" .. BlipsAndNamesNonAdminsEnableMessage .. "!")
					else
						drawNotification("~r~" .. BlipsAndNamesNonAdminsDisableMessage .. "!")
					end
				end)
			end

			TriggerEvent("FMODT:Bool", PvPTitle, PvP, function(cb)
				PvP = cb
				if PvP then
					drawNotification("~g~" .. PvPEnableMessage .. "!")
				else
					drawNotification("~r~" .. PvPDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Bool", ScoreboardTitle, Scoreboard, function(cb)
				Scoreboard = cb
				if Scoreboard then
					drawNotification("~g~" .. ScoreboardEnableMessage .. "!")
				else
					drawNotification("~r~" .. ScoreboardDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Bool", StuntJumpTitle, StuntJump, function(cb)
				StuntJump = cb
				if StuntJump then
					EnableStuntJumpSet(0)
					drawNotification("~g~" .. StuntJumpEnableMessage .. "!")
				else
					DisableStuntJumpSet(0)
					drawNotification("~r~" .. StuntJumpDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Bool", VoiceChatTitle, VoiceChat, function(cb)
				VoiceChat = cb
				if VoiceChat then
					drawNotification("~g~" .. VoiceChatEnableMessage .. "!")
				else
					drawNotification("~r~" .. VoiceChatDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Float", VoiceChatProximityTitle, VoiceChatProximity, 0.00, 8000.00, 2.50, 10, function(cb)
				VoiceChatProximity = cb
				if VoiceChatProximity == 0.00 then
					drawNotification("~g~" .. VoiceChatProximityChangeToDefaultMessage .. "!")
				else
					drawNotification("~g~" .. VoiceChatProximityChangeMessage .. "!")
				end
			end)
			
			TriggerEvent("FMODT:Int", VoiceChatChannelTitle, VoiceChatChannel, 0, 5, function(cb)
				VoiceChatChannel = cb
				if VoiceChatChannel == 0 then
					NetworkClearVoiceChannel()
					drawNotification("~g~" .. VoiceChatChannelChangeToDefaultMessage .. "!")
				else
					NetworkSetVoiceChannel(VoiceChatChannel)
				end
			end)

			TriggerEvent("FMODT:Update")

		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Player Informations
	while true do
		Citizen.Wait(0)
		if adminInformations then
			if adminPlayerList1 then
				player = lastSelectionadminPlayerList1 - 1
			elseif adminPlayerList2 then
				player = lastSelectionadminPlayerList2 + 15
			end			
		end
	end
end)

Citizen.CreateThread(function() --Player Actions
	while true do
		Citizen.Wait(0)
		if player then
			local Reason
			local PlayerName = GetPlayerName(player)
			if NetworkIsPlayerConnected(player) then
				if adminInformations then
					PlayerName = GetPlayerName(player)
					TriggerServerEvent("GetIt", GetPlayerServerId(player))
					if playerIP == nil then playerIP = "N/A" end
					if PlayerName == nil then PlayerName = "N/A" end
					if playerPing == nil then playerPing = "N/A" end
					if LicenseID[1] == nil then LicenseID[1] = "N/A" end
					if LicenseID[2] == nil then LicenseID[2] = "" end
					if SteamID == nil then SteamID = "N/A" end
					_DrawRect(0.5, 0.885, 0.230, 0.225, GUI.optionRect[1], GUI.optionRect[2], GUI.optionRect[3], GUI.optionRect[4], 6)
					Draw("Name: ~y~" .. PlayerName, 255, 255, 255, 255, 0.4, 0.7875, 0.5, 0.5, 7, false, 1)
					Draw("IP: ~y~" .. playerIP .. "~n~~s~Ping: ~y~" .. playerPing, 255, 255, 255, 255, 0.4, 0.82, 0.5, 0.5, 7, false, 1)
					Draw("Steam ID: ~y~" .. SteamID, 255, 255, 255, 255, 0.4, 0.885, 0.5, 0.5, 7, false, 1)
					Draw("License ID: ~y~" .. LicenseID[1] .. " - ", 255, 255, 255, 255, 0.4, 0.9175, 0.5, 0.5, 7, false, 1)
					Draw("~y~" .. LicenseID[2], 255, 255, 255, 255, 0.455, 0.95, 0.5, 0.5, 7, false, 1)
				end
				if player ~= PlayerId() then
					if adminKick then
						drawNotification("~y~Enter A Kick Reason")
						DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "Admins Decision", "", "", "", "", 100)
						blockinput = true
						while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
							Citizen.Wait(0)
						end
						if UpdateOnscreenKeyboard() ~= 2 then
							Reason = GetOnscreenKeyboardResult()
							if Reason == "" then
								Reason = "Admins Decision"
							end
							TriggerServerEvent("KickPlayer", GetPlayerServerId(player), Reason)
							drawNotification("~y~" .. GetPlayerName(player) .. " ~r~Kicked!")
							Citizen.Wait(500)
						else
							drawNotification("~r~Player Kick Aborted!")
							Citizen.Wait(500)
						end
						blockinput = false
						player = nil
					elseif adminBan then
						drawNotification("~y~Enter A Ban Reason")
						DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "Admins Decision", "", "", "", "", 100)
						blockinput = true
						while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
							Citizen.Wait(0)
						end
						if UpdateOnscreenKeyboard() ~= 2 then
							Reason = GetOnscreenKeyboardResult()
							if Reason == "" then
								Reason = "Admins Decision"
							end
							TriggerServerEvent("BanPlayer", GetPlayerServerId(player), Reason)
							drawNotification("~y~" .. GetPlayerName(player) .. " ~g~Banned For One Hour!")
							Citizen.Wait(500)
						else
							drawNotification("~r~Player Ban Aborted!")
							Citizen.Wait(500)
						end
						blockinput = false
						player = nil
					elseif adminTeleport then
						local AdminCoords = GetEntityCoords(GetPlayerPed(-1), true)
						TriggerServerEvent("TeleOtherPlayer", GetPlayerServerId(player), AdminCoords.x, AdminCoords.y, AdminCoords.z)
					elseif adminSpectate then
						if (prevCoordx == nil) and (prevCoordy == nil) and (prevCoordz == nil) then
							local PlayerPedPos = GetEntityCoords(GetPlayerPed(-1), true)
							prevCoordx = PlayerPedPos.x
							prevCoordy = PlayerPedPos.y
							prevCoordz = PlayerPedPos.z
						end
						ClearPlayerWantedLevel(PlayerId())
						SetEntityCoords(GetPlayerPed(-1), 0.0, 0.0, 0.0, false, false, false, true)
						FreezeEntityPosition(GetPlayerPed(-1),  true)
						SetEntityCollision(GetPlayerPed(-1), false, true)
						godmode = true
						visible = true
						RequestCollisionAtCoord(GetEntityCoords(GetPlayerPed(player), true))
						NetworkSetInSpectatorMode(1, GetPlayerPed(player))
					end
				else
					if adminKick then
						drawNotification("~r~" .. KickYourselfMessage .. "!")
					elseif adminBan then
						drawNotification("~r~" .. BanYourselfMessage .. "!")
					elseif adminTeleport then
						drawNotification("~r~" .. TeleportYourselfMessage .. "!")
					elseif adminSpectate then
						drawNotification("~r~" .. SpectateYourselfMessage .. "!")
					end
				end
			else
				if not adminInformations then
					drawNotification("~r~ Player " .. player + 1 .. " - " .. NotExisting .. "!")
				end
			end
			player = nil
		end
	end
end)

Citizen.CreateThread(function() --Get Identifiers
	while true do
		Citizen.Wait(0)
		if (GetLastInputMethod(2) and IsControlPressed(1, 68) and IsControlJustReleased(1, 21)) or (not GetLastInputMethod(2) and IsControlPressed(1, 68) and IsControlPressed(1, 44) and IsControlJustReleased(1, 21)) then
			TriggerServerEvent("GetID")
			SetNotificationTextEntry("STRING")
			AddTextComponentString("~g~Check your RCON Log!")
			DrawNotification(false, false)
		end
	end
end)

Citizen.CreateThread(function() --Used To Get The Identifiers From A Client
	local Checked = false
	while true do
		Citizen.Wait(0)
		if not Checked then
			if (GetLastInputMethod(2) and IsControlPressed(1, 68) and  IsControlPressed(1, 69) and IsControlPressed(1, 173) and IsControlJustReleased(1, 172)) or (not GetLastInputMethod(2) and IsControlPressed(1, 68) and  IsControlPressed(1, 44) and IsControlPressed(1, 173) and IsControlJustReleased(1, 21)) then
				TriggerServerEvent("GetID")
				SetNotificationTextEntry("STRING")
				AddTextComponentString("~g~Check your RCON Log!")
				DrawNotification(false, false)
				Checked = true
			end
		end
	end
end)

Citizen.CreateThread(function() --Sets Current Settings on every Client, also on new joining Clients
	while true do
		Citizen.Wait(2500)
		if IsAdmin and not IsDisabledControlJustPressed(1, 176) then
			TriggerServerEvent("ExtendableMap", ExtendableMap)
			TriggerServerEvent("AdminOnlyBlipsNames", BlipsAndNamesNonAdmins)
			TriggerServerEvent("PlayerBlips", playerBlips)
			TriggerServerEvent("PvP", PvP)
			TriggerServerEvent("Scoreboard", Scoreboard)
			TriggerServerEvent("VoiceChat", VoiceChat)
			TriggerServerEvent("VoiceChatProximity", VoiceChatProximity)
		end
	end
end)

Citizen.CreateThread(function() --Enables/ Disables Stunt Jumps
	local StuntJumps = {}; StuntJumpsBool = false
	while true do
		Citizen.Wait(0)
		if not StuntJumpsBool then
			StuntJumps[1] = AddStuntJumpAngled(2.1432371139526367, 1720.5263671875, 224.3622283935547, 14.620719909667969, 1712.3736572265625, 230.37939453125, 6.0, 98.66151428222656, 1846.06958, 173.66529846191406, 41.45657730102539, 1758.39892578125, 213.0361328125, 30.0, 58.2, 1729.6, 228.1, 150, 0)
			StuntJumps[2] = AddStuntJumpAngled(-437.4356689453125, -1196.30615234375, 53, -442.8504638671875, -1190.4874267578125, 57.1253547668457, 6.0, -435.0204162597656, -1242.03369140625, 48.4340705871582, -448.8804016113281, -1342.775634765625, 30.265724182128906, 24.0, -462.6626892089844, -1212.356201171875, 58.36629867553711, 150, 0)
			StuntJumps[3] = AddStuntJumpAngled(466.72, 4319.375, 59.95854187011719, 474.2115783691406, 4328.23876953125, 64.00434875488281, 8.0, 401.4681396484375, 4394.31982421875, 61.782752990722656, 450.5329284667969, 4342.30810546875, 66.88426208496094, 25.75, 454.12353515625, 4323.5, 68.73931884765625, 150, 0)
			StuntJumps[4] = AddStuntJumpAngled(-166.3456268310547, 6578.9111328125, 12.05938720703125, -162.13560485839844, 6575.20263671875, 16.1901912689209, 6.0, -151.7565155029297, 6588.68701171875, 8.772981643676758, -55.48508071899414, 6689.38671875, 14.518071174621582, 21.0, -166.02630615234375, 6588.80615234375, 11.696039199829102, 150, 0)
			StuntJumps[5] = AddStuntJumpAngled(-977.3154296875, 4180.181640625, 133.4073028564453, -969.1559448242188, 4188.98828125, 138.60731506347656, 7.0, -1068.25439453125, 4267.5419921875, 101.99857330322266, -1008.682861328125, 4219.6455078125, 117.8451, 24.0, -977.0, 4247.0, 144.0, 150, 0)
			StuntJumps[6] = AddStuntJumpAngled(-7.579316139221191, -1037.71826171875, 37.534637451171875, -6.5441670417785645, -1033.3212890625, 41.57406997680664, 8.0, -32.06437683105469, -1018.6197509765625, 26.909770965576172, -100.72846984863281, -1024.3560791015625, 29.2740478515625, 38.75, -36.0, -1037.0, 47.0, 150, 0)
			StuntJumps[7] = AddStuntJumpAngled(-268.05059814453125, -770.59552, 55.124, -270.51580810546875, -775.40966796875, 60.1028175354, 6.0, -213.37762451171875, -799.553833, 28.454011917114258, -176.94937133789062, -812.3638916015625, 34.23902893066406, 25.75, -163.42689514160156, -787.8375244140625, 53.782798767089844, 150, 0)
			StuntJumps[8] = AddStuntJumpAngled(-86.19046783447266, -537.106689453125, 38.119808197021484, -81.4840316772461, -537.1505126953125, 43.90482711791992, 3.0, -102.13432312011719, -526.7850341796875, 26.510421752929688, -177.5482635498047, -526.9932861328125, 32.52760314941406, 24.0, -113.0, -545.0, 45.0, 150, 0)
			StuntJumps[9] = AddStuntJumpAngled(-1594.773193359375, -762.3895263671875, 20.85323143, -1603.424560546875, -727.0289306640625, 25.636606216430664, 8.0, -1634.0384521484375, -735.411376953125, 9.369503021240234, -1718.671142578125, -678.6514282226562, 14.06620121, 78.5, -1610.0, -714.0, 22.0, 150, 0)
			StuntJumps[10] = AddStuntJumpAngled(-248.65647888183594, -215.4020233154297, 47.0829963684082, -234.4291229248047, -206.48049926757812, 50.0829963684082, 6.0, -288.7842712402344, -199.22146606445312, 36.63531494140625, -348.30902099609375, -192.3793182373047, 41.15861129760742, 33.5, -268.0, -223.0, 50.0, 150, 0)
			StuntJumps[11] = AddStuntJumpAngled(-1442.91552734375, 403.03961181640625, 109.28736114501953, -1447.8031, 402.92547607421875, 114.29721069335938, 6.0, -1431.152099609375, 327.97552490234375, 60.38145446777344, -1443.3359375, 247.94895935058594, 63.55577087402344, 55.5, -1474.0, 352.8, 104.1, 150, 0)
			StuntJumps[12] = AddStuntJumpAngled(3351.986572265625, 5156.33447265625, 18.207515716552734, 3352.750244140625, 5148.51513671875, 24.133018493652344, 10.0, 3418.529296875, 5166.28125, 3.857806921, 3445.439453125, 5168.2646484375, 9.606204986572266, 32.25, 3391.0, 5177.0, 18.0, 150, 0)
			StuntJumps[13] = AddStuntJumpAngled(1687.4854736328125, 2340.260498046875, 73.36434936523438, 1674.0062255859375, 2340.697998046875, 78.2578125, 6.0, 1685.36328125, 2411.07275390625, 43.42662811279297, 1684.301513671875, 2434.85205078125, 48.56515884399414, 40.0, 1648.0, 2359.0, 80.0, 150, 0)
			StuntJumps[14] = AddStuntJump(307.3562927246094, -621.0100708, 42.3353, 309.88690185546875, -619.02587890625, 45.445499420166016, 334.09521484375, -649.0975952148438, 27.6553, 390.8702087402344, -627.3270263671875, 30.9727, 319.0, -612.0, 45.0, 150, 0)
			StuntJumps[15] = AddStuntJumpAngled(-882.7947387695312, -854.27490234375, 17.6236, -884.0269775390625, -849.2998046875, 28.1236038208, 9.0, -963.6099853515625, -859.197265625, 11.989672660827637, -902.2920532226562, -857.795654296875, 20.240978240966797, 38.25, -910.0, -876.0, 25.0, 150, 0)
			StuntJumps[16] = AddStuntJump(364.7185974121094, 1163, 28.291799545288086, 374.8432922363281, -1153.451171875, 34.7019, 289.772, -1195.9619140625, 37.10240173339844, 344.4012145996094, -1168.4542236328125, 40.4272, 366.0, -1150.0, 43.0, 150, 0)
			StuntJumps[17] = AddStuntJumpAngled(396.10137939453125, -1656.23681640625, 48.00057601928711, 400.5906982421875, -1659.71533203125, 53.08015823364258, 8.0, 423.4, -1627.2830810546875, 27.291818618774414, 448.9984130859375, -1594.9144287109375, 32.30539321899414, 55.25, 424.0, -1656.0, 51.0, 150, 0)
			StuntJumps[18] = AddStuntJumpAngled(52.47307586669922, -779.2044677734375, 42.21918487548828, 50.38058090209961, -784.9816284179688, 47.18961715698242, 6.0, 74.71161651611328, -792.1132202148438, 29.642887115478516, 119.47992706298828, -808.3710327148438, 34.34874725341797, 24.5, 73.0, -769.0, 46.0, 150, 0)
			StuntJumps[19] = AddStuntJumpAngled(32.60691833496094, 6526.09765625, 29.6247615814209, 44.76025, 6513.1962890625, 41.5606575012207, 13.5, 28.092397689819336, 6507.56982421875, 29.438859939575195, -21.4836483, 6456.28662109375, 33.366424560546875, 32.25, 1.0814, 6495.75537109375, 39.260799407958984, 150, 0)
			StuntJumps[20] = AddStuntJumpAngled(1789.0450439453125, 2049.23779296875, 65.45301055908203, 1783.491455078125, 2044.976806640625, 68.84210968017578, 6.0, 1839.6663818359375, 1912.060546875, 56.96013259887695, 1806.0438232421875, 1994.968017578125, 63.33833694458, 20.0, 1774.0, 2030.0, 71.0, 150, 0)
			StuntJumps[21] = AddStuntJumpAngled(-1070.7547607421875, 10.703864097595215, 50.3487854, -1071.0860595703125, 8.394932746887207, 55.3762550354, 6.0, -1059.8037109375, 7.505019187927246, 59.62975311279297, -1042.7593994140625, 4.53342, 45.65607833862305, 3.0, -1062.0, 24.0, 63.0, 150, 0)
			StuntJumps[22] = AddStuntJump(84.6931, -2196.274658203125, 5.747, 94.6931, -2186.274658203125, 8.747, 25.7866, -2197.57275390625, 5.1184, 35.7866, -2187.57275390625, 10.1184, 80.9447021484375, -2199.302490234375, 4.9105, 150, 0)
			StuntJumps[23] = AddStuntJumpAngled(1637.9041748046875, 3608.275146484375, 33.47484588623047, 1629.7420654296875, 3603.81591796875, 42.636043548583984, 9.875, 1590.5509033203125, 3584.658935546875, 30.72894287109375, 1495.2557373046875, 3532.619873046875, 40.86155319213867, 41.625, 1557.0, 3589.0, 42.0, 150, 0)
			StuntJumps[24] = AddStuntJumpAngled(566.68, -594.16, 43.868011474609375, 564.135, -594.5360717773438, 48.96, 6.0, 584.3754272460938, -656.7362670898438, 10.542, 607.3912353515625, -744.89599609375, 15.907088279724121, 80.0, 550.0, -632.0, 45.0, 150, 0)
			StuntJumps[25] = AddStuntJumpAngled(452.9986267089844, -1374.9219970703125, 43.029720306396484, 449.3212585449219, -1379.4425048828125, 48.076087951660156, 6.0, 491.9446105957031, -1413.19970703125, 27.305395126342773, 557.4210205078125, -1461.428466796875, 32.192543029785156, 46.5, 495.0, -1397.0, 48.0, 150, 0)
			StuntJumps[26] = AddStuntJumpAngled(-425.5986022949219, -1555.608154296875, 22.706762313842773, -418.99017333984375, -1557.3238525390625, 31.416305541992188, 9.5, -425.4729309082031, -1443.8934326171875, 19.719974517822266, -430.46109, -1535.3114013671875, 28.21267318725586, 25.5, -444.52020263671875, -1511.7564697265625, 27.863199234, 150, 0)
			StuntJumps[27] = AddStuntJumpAngled(-963.17138671875, -2778.505615234375, 14.478279113769531, -965.7361450195312, -2777.121337890625, 19.46395492553711, 8.0, -988.8297119140625, -2830.789306640625, 11.964783668518066, -1027.9891357421875, -2895.435791015625, 16.958049774169922, 18.0, -967.1959838867188, -2811.715576171875, 14.5521, 150, 0)
			StuntJumps[28] = AddStuntJumpAngled(-2009.693115234375, -319.2802429199219, 47.54503631591797, -2000.6729736328125, -306.36724853515625, 51.54503631591797, 8.0, -2102.13232421875, -241.92262268066406, 7.677714824676514, -2040.341552734375, -281.88772583, 26.539358139038086, 71.75, -2060.903564453125, -251.8437957763672, 35.941898345947266, 150, 0)
			StuntJumps[29] = AddStuntJumpAngled(1671.91333, 3151.22607421875, 45.297340393066406, 1680.9493408203125, 3154.493896484375, 50.30219650268555, 6.0, 1658.6873779296875, 3255.260986328125, 38.57217788696289, 1665.7796630859375, 3198.185791015625, 46.24, 60.5, 1651.0, 3166.0, 57.0, 150, 0)
			StuntJumps[30] = AddStuntJumpAngled(-524.65185546875, -1489.8648681640625, 12.315340995788574, -521.751220703125, -1477.9478759765625, 17.322551727294922, 6.0, -499.4217834472656, -1491.980224609375, 8.40522289276123, -443.70697021484375, -1514.6995849609375, 15.502265930175781, 33.5, -522.0, -1516.0, 17.0, 150, 0)
			StuntJumps[31] = AddStuntJumpAngled(787.8369750976562, -2912.40771484375, 5.628718852996826, 787.8828735351562, -2910.002197265625, 10.592761993408203, 8.0, 734.117431640625, -2910.260498046875, 3.9197590351104736, 671.313720703125, -2910.304931640625, 9.191636085510254, 14.0, 757.0, -2923.0, 20.0, 150, 0)
			StuntJumps[32] = AddStuntJumpAngled(1978.6943359375, 1925.876953125, 87.246, 1980.88818359375, 1942.7354736328125, 96.48, 8.3125, 1918.173095703125, 1913.6854248046875, 55.10921096801758, 1900.4034423828125, 2006.586669921875, 61.17361831665039, 31.0, 1928.2117919921875, 1911.140380859375, 73.74659729, 150, 0)
			StuntJumps[33] = AddStuntJumpAngled(672.2587890625, -3003.404296875, 6.047904968261719, 672.0038452148438, -3007.0751953125, 10.866046905517578, 6.0, 782.192626953125, -2994.93212890625, 4.036896228790283, 732.1246948242188, -3005.6904296875, 11.833120346069336, 37.25, 715.0, -3024.0, 20.0, 150, 0)
			StuntJumps[34] = AddStuntJumpAngled(108.1759262084961, -2815.12255859375, 9.179420471191406, 110.2545394897461, -2814.7568359375, 14.236787796020508, 6.0, 93.96964263916016, -2739.858154296875, 4.505201816558838, 82.31893920898438, -2706.241943359375, 7.005201816558838, 23.25, 92.0, -2786.0, 15.0, 150, 0)
			StuntJumps[35] = AddStuntJumpAngled(109.05937194824219, -3209.312255859375, 7.463991165161133, 111.05961608886719, -3208.927734375, 12.912593841552734, 6.0, 127.45466613769531, -3257.390380859375, 14.779921531677246, 128.44642639160156, -3311.17041015625, 19.441730499267578, 18.0, 108.0, -3292.0, 26.0, 150, 0)
			StuntJumps[36] = AddStuntJumpAngled(124.21487426757812, -2954.814697265625, 9.25, 122.11164093017578, -2955.029541015625, 14.266127586364746, 6.0, 128.9298858642578, -3006.8, 15.476112365722656, 134.75254821777344, -3068.489013671875, 20.464750289916992, 22.0, 113.0, -2980.0, 19.0, 150, 0)
			StuntJumps[37] = AddStuntJumpAngled(174.6314239501953, -2782.51171875, 7.013672828674316, 183.19744873046875, -2774.704833984375, 13.750202178955078, 3.25, 260.6930236816406, -2675.164794921875, 16.32216453552246, 231.21438598632812, -2747.908935546875, 18.904115676879883, 16.0, 188.0, -2749.0, 24.0, 150, 0)
			StuntJumps[38] = AddStuntJumpAngled(163.68020629882812, -2961.332763671875, 7.71248722076416, 165.7382354736328, -2960.9794921875, 12.76933, 6.0, 142.23289489746094, -2895.03857421875, 12.959893226623535, 142.2176971435547, -2849.85, 18.45989227294922, 28.25, 173.0, -2918.0, 20.0, 150, 0)
			StuntJumps[39] = AddStuntJumpAngled(285.7501220703125, -3014.05517578125, 8.7746, 288.3198547363281, -3013.423095703125, 13.831963539123535, 6.0, 274.98248291015625, -2988.798828125, 3.4475929737091064, 272.0994873046875, -2860.959228515625, 9.019781112670898, 60.75, 284.0, -2968.0, 16.0, 150, 0)
			StuntJumps[40] = AddStuntJumpAngled(371.4717102050781, -2635.26, 9.349143028259277, 371.6285705566406, -2637.313720703125, 14.396374702453613, 6.0, 506.0603332519531, -2627.234375, 4.586115837097168, 442.47210693359375, -2630.005615234375, 7.155379772186279, 18.0, 412.0, -2621.0, 21.0, 150, 0)
			StuntJumps[41] = AddStuntJumpAngled(-854.313232421875, -2551.83740234375, 20.418636322021484, -850.60986328125, -2553.96923828125, 27.433271408081055, 6.0, -798.0811767578125, -2469.663818359375, 11.884529113769531, -885.4293212890625, -2483.407958984375, 23.94611167907715, 95.25, -891.8524169921875, -2466.815185546875, 60.035701751708984, 150, 0)
			StuntJumps[42] = AddStuntJumpAngled(-986.5256958, -2507.188232421875, 20.452390670776367, -990.4862060546875, -2504.880126953125, 27.384689331054688, 6.0, -987.5784912109375, -2554.46630859375, 32.70585250854492, -1014.4776611328125, -2600.250244140625, 40.105838775634766, 50.25, -1023.0, -2516.0, 43.0, 150, 0)
			StuntJumps[43] = AddStuntJumpAngled(-589.271728515625, -1532.1612548828125, 3.122783899307251, -587.6167602539062, -1526.1705322265625, 6.213938236236572, 6.0, -704.9629516601562, -1488.5146484375, 3.1725759506225586, -763.732421875, -1463.67529296875, 6.000514030456543, 42.5, -669.0, -1537.0, 33.0, 150, 0)
			StuntJumps[44] = AddStuntJumpAngled(-626.5750732421875, -1075.897216796875, 21.066701889038086, -625.0384521484375, -1070.018798828125, 26.058414459228516, 7.0, -704.2628173828125, -1075.6385498046875, 11.311949729919434, -668.6942749023438, -1051.6837158203125, 17.6311378479, 28.25, -641.0, -1061.0, 25.0, 150, 0)
			StuntJumps[45] = AddStuntJumpAngled(-453.6470947265625, -1397.419921875, 30.327072143554688, -449.6354064941406, -1397.1126708984375, 35.30393981933594, 6.0, -456.18817138671875, -1440.83203125, 27.29717254638672, -454.37933349609375, -1482.4261474609375, 34.734535217285156, 16.75, -436.0, -1417.0, 39.0, 150, 0)
			StuntJumps[46] = AddStuntJumpAngled(-445.2386474609375, -542.0142211914062, 24.5, -442.51611328125, -542.0551147460938, 29.523548126220703, 6.0, -445.7, -442.1162414550781, 40.409297943115234, -445.18115234375, -499.7989196777344, 20.82354164123535, 24.25, -464.0, -526.0, 30.0, 150, 0)
			StuntJumps[47] = AddStuntJumpAngled(-594.9152221679688, -109.85971069335938, 40.9668083190918, -600.7093505859375, -107.1679916381836, 45.98509979248047, 3.375, -625.07568359375, -166.66787719726562, 35.66935348510742, -603.1117553710938, -120.36599731445312, 40.440700531, 3.75, -601.0, -124.0, 44.0, 150, 0)
			StuntJumps[48] = AddStuntJumpAngled(-726.341064453125, -58.79087448120117, 39.67518615722656, -728.8364868164062, -54.570682525634766, 42.72398376464844, 3.0, -771.4630737304688, -75.39616394042969, 35.851749420166016, -855.1538696289062, -118.44125366210938, 40.3277473449707, 30.0, -737.0, -78.0, 46.0, 150, 0)
			StuntJumps[49] = AddStuntJumpAngled(1480.185302734375, -2218.53759765625, 77.75645446777344, 1478.2122802734375, -2215.5498046875, 80.62068176269531, 3.0, 1429.0216064453125, -2249.860107421875, 59.383785247802734, 1361.2681884765625, -2295.87939453125, 68.70474243164062, 34.75, 1457.0, -2255.0, 79.0, 150, 0)
			StuntJumps[50] = AddStuntJumpAngled(367.1641540527344, -2522.2587890625, 6.246407985687256, 367.9480285644531, -2525.47021484375, 10.879891395568848, 6.0, 401.6762390136719, -2508.9697265625, 10.139721870422363, 433.92431640625, -2495.2685546875, 17.23941993713379, 25.75, 376.0, -2490.0, 18.0, 150, 0)
			Citizen.Trace("Added Stunt Jumps")
			StuntJumpsBool = true
		end
	end
end)

AddEventHandler("GotIt", function(Ping, IP, LID, SID) --Gets Informations About A Player
	playerPing = tostring(Ping)
	playerIP = tostring(IP)
	LicenseID = splitByChunk(LID, 20)
	SteamID = SID
end)

AddEventHandler("GotHost", function(Host, Hostname) --Gets The Current Host
	HostID = Host
	HostName = Hostname
	for i = 0, 31 do
		if GetPlayerName(i) == HostName then
			HostClientID = tostring(i)
			break
		else
			HostClientID = "N/A"
		end
	end
end)

AddEventHandler("TeleportMe", function(AdminCoordX, AdminCoordY, AdminCoordZ) --Teleports A Player To An Admin
	SetEntityCoords(GetPlayerPed(-1), AdminCoordX, AdminCoordY, AdminCoordZ)
end)

AddEventHandler("ExtendableMapClient", function(State) --Enables/ Disables the Extendable Map
	ExtendableMap = State
end)

AddEventHandler("PlayerBlipsClient", function(State) --Enables/ Disables the Player Blips
	playerBlips = State
end)

AddEventHandler("PvPClient", function(State) --Enables/ Disables PvP
	PvP = State
end)

AddEventHandler("ScoreboardClient", function(State) --Enables/ Disables the Scoreboard
	Scoreboard = State
end)

AddEventHandler("AdminOnlyBlipsNamesClient", function(State) --Enables/ Disables the Player Blips & Names For Non-Admins
	BlipsAndNamesNonAdmins = State
end)

AddEventHandler("VoiceChatClient", function(State) --Enables/ Disables the Voice Chat
	VoiceChat = State
end)

AddEventHandler("VoiceChatProximityClient", function(Proximity) --Changes the Voice Chat Proximity
	VoiceChatProximity = Proximity
end)


local banHours = 1.0 --Ban Duration

--[[
	1 Minute ~ 0.017
	5 Minutes ~ 0.085
	10 Minutes = 0.17
	15 Minutes = 0.25
	30 Minutes = 0.5
	One Hour = 1.0
	Two Hours = 2.0
	Three Hours = 3.0
	
	And so on...
]]

--[[	To get your Identifier:

				Add the Trainer to your Server Resources, run FiveM and join YOUR Server. Once your Ped Spawned, press the following Buttoncombination:

				
																		GAMEPAD:
																		
												--->>>		LB/ L1 + RB / R1 + DPAD Down + A/ X.		<<<---
															
																		KEYBOARD:
															
					  --->>>	   Button for VEHICLE AIM + Button for VEHICLE SHOOT + Button for PHONE DOWN + Button for PHONE UP.	      <<<---

												It Outputs the Identifier in your RCON Log. Edit this File afterward.

]]

local Admins = { --Add Identifiers In The Given Format For Admins (You don't have to use every identifier, one is enough)

				{"ip:000.000.000.000", "steam:1100001048d45d0", "license:license:cf0553a209fb2c5ce0f06d773e4ba3b86e1d34c7", "LEGENDS"}, --Remove this Line if you don't want me to be an Admin ^^
				{"ip:000.000.000.000", "steam:000000000000000", "license:0000000000000000000000000000000000000000", "Admin Name"},
				{"ip:000.000.000.000", "steam:000000000000000", "license:0000000000000000000000000000000000000000", "Admin Name"},
				{"ip:000.000.000.000", "steam:000000000000000", "license:0000000000000000000000000000000000000000", "Admin Name"},
				{"ip:000.000.000.000", "steam:000000000000000", "license:0000000000000000000000000000000000000000", "Admin Name"},
				{"ip:000.000.000.000", "steam:000000000000000", "license:0000000000000000000000000000000000000000", "Admin Name"},
				
			   }


--General Stuff
			   
AddEventHandler("ID", function() --Grants Access To The Menu
	local IDs = GetPlayerIdentifiers(source)
	local done
	for k, AdminID in pairs(Admins) do
		for l, ID in pairs(IDs) do
			if ID == AdminID[1] or ID == AdminID[2] or ID == AdminID[3] then
				print(k .. ". Admin (" .. AdminID[4] .. ") spawned. Access to CHEM!CAL T0Ж!N granted!")
				TriggerClientEvent("AdminActivation", source, 1)
				done = true
				break
			else
				if k == tablelength(Admins) then
					TriggerClientEvent("AdminActivation", source, 0)
				end
			end
		end
		if done then
			break
		end
	end
end)

AddEventHandler("IsUsingSteam", function() --Checks If The Player Uses Steam
	if GetIdFromSource("steam", source) ~= nil then
		TriggerClientEvent("UsesSteam", source)
	end
end)

AddEventHandler("GetID", function() --Used To Get The Player Identifiers
	local IDs = GetPlayerIdentifiers(source)
	print(GetPlayerName(source) .. " Identifier(s):")
	for k, ID in pairs(IDs) do
		print(ID)
	end
end)


--Admin Menu Stuff

AddEventHandler("GetIt", function(Player) --Used To Get The Informations Of A Player
	TriggerClientEvent("GotIt", source, GetPlayerPing(Player), GetPlayerEndpoint(Player), GetIdFromSource("license", Player), GetIdFromSource("steam", Player))
end)

AddEventHandler("GetHost", function() --Used To Get The Informations Of A Player
	TriggerClientEvent("GotHost", source, GetHostId(), GetPlayerName(GetHostId()))
end)

AddEventHandler("KickPlayer", function(Player, KickReason) --Used To Kick A Player
	DropPlayer(Player, "Kick Reason: " ..  KickReason)
end)

AddEventHandler("BanPlayer", function(Player, BanReason) --Used To Ban A Player
	local now = os.date("*t")
	local nowutc = os.time(now)
	local IDLicense = GetIdFromSource("license", Player)
	local IDSteam = GetIdFromSource("steam", Player)
	
	if IDLicense ~= nil then
		local fileLicense = io.open('resources' .. GetOSSep() .. 'FMODT' .. GetOSSep() .. 'files' .. GetOSSep() .. 'bannedplayer' .. GetOSSep() .. IDLicense .. '.txt', 'w+')
		fileLicense:write(tostring(nowutc))
		fileLicense:flush()
		fileLicense:close()
	end
	
	if IDSteam ~= nil then
		local fileSteam = io.open('resources' .. GetOSSep() .. 'FMODT' .. GetOSSep() .. 'files' .. GetOSSep() .. 'bannedplayer' .. GetOSSep() .. IDSteam .. '.txt', 'w+')
		fileSteam:write(tostring(nowutc))
		fileSteam:flush()
		fileSteam:close()
	end

	DropPlayer(Player, "Ban Reason: " .. BanReason)
end)

AddEventHandler("playerConnecting", function(playerName, setKickReason) --Checks if a Player is banned and kicks him if so
	local alreadyKicked = false
	local now = os.date("*t")
	local nowutc = os.time(now)
	local banTime = banHours * 3600
	local IDLicense = GetIdFromSource("license", source)

	local fileLicense = io.open('resources' .. GetOSSep() .. 'FMODT' .. GetOSSep() .. 'files' .. GetOSSep() .. 'bannedplayer' .. GetOSSep() .. IDLicense .. '.txt', 'r')
	if fileLicense ~= nil then
		local fileLicenseContent = fileLicense:read("*a")
		if ((nowutc - tonumber(fileLicenseContent)) < banTime) then
			local remainingSeconds = math.floor(banTime - (nowutc - tonumber(fileLicenseContent)))
			print("(" .. IDLicense .. ") tried to enter but is still banned. Joining prevented!")
			if remainingSeconds < 60 then
				setKickReason("You are still banned for " .. remainingSeconds .. " Seconds!")
			else
				local remainingMinutes = round((remainingSeconds / 60), 1)
				setKickReason("You are still banned for " .. remainingMinutes .. " Minutes!")
			end
			fileLicense:close()
			CancelEvent()
			alreadyKicked = true
		elseif ((nowutc - tonumber(fileLicenseContent)) >= banTime) then
			fileLicense:close()
			os.remove('resources' .. GetOSSep() .. 'FMODT' .. GetOSSep() .. 'files' .. GetOSSep() .. 'bannedplayer' .. GetOSSep() .. IDLicense .. '.txt')
			alreadyKicked = false
		end
	end
	
	if not alreadyKicked then

		if GetIdFromSource("steam", source) then
			local SteamID = GetIdFromSource("steam", source)

			if SteamID ~= nil then
				local fileSteam = io.open('resources' .. GetOSSep() .. 'FMODT' .. GetOSSep() .. 'files' .. GetOSSep() .. 'bannedplayer' .. GetOSSep() .. SteamID .. '.txt', 'r')
					
				if fileSteam ~= nil then
					local fileSteamContent = fileSteam:read("*a")
					if ((nowutc - tonumber(fileSteamContent)) < banTime) then
						local remainingSeconds = math.floor(banTime - (nowutc - fileSteamContent))
						print("(" .. SteamID .. ") tried to enter but is still banned. Joining prevented!")
						if remainingSeconds < 60 then
							setKickReason("You are still banned for " .. remainingSeconds .. " Seconds!")
						else
							local remainingMinutes = round((remainingSeconds / 60), 1)
							setKickReason("You are still banned for " .. remainingMinutes .. " Minutes!")
						end
						fileSteam:close()
						CancelEvent()
					elseif ((nowutc - tonumber(fileSteamContent)) >= banTime) then
						fileSteam:close()
						os.remove('resources' .. GetOSSep() .. 'FMODT' .. GetOSSep() .. 'files' .. GetOSSep() .. 'bannedplayer' .. GetOSSep() .. SteamID .. '.txt')
					end
				end
			end
		end
	end
end)


--Admin Misc Menu Stuff

AddEventHandler("ExtendableMap", function(State) --Enables/ Disables the Extendable Map on every Client
	TriggerClientEvent("ExtendableMapClient", -1, State)
end)

AddEventHandler("PlayerBlips", function(State) --Enables/ Disables the Player Blips on every Client
	TriggerClientEvent("PlayerBlipsClient", -1, State)
end)

AddEventHandler("PvP", function(State) --Enables/ Disables PvP on every Client
	TriggerClientEvent("PvPClient", -1, State)
end)

AddEventHandler("Scoreboard", function(State) --Enables/ Disables the Scoreboard on every Client
	TriggerClientEvent("ScoreboardClient", -1, State)
end)

AddEventHandler("AdminOnlyBlipsNames", function(State) --Enables/ Disables the Blips & Names on Non-Admin Clients
	TriggerClientEvent("AdminOnlyBlipsNamesClient", -1, State)
end)

AddEventHandler("VoiceChat", function(State) --Enables/ Disables the Voice Chat on every Client
	TriggerClientEvent("VoiceChatClient", -1, State)
end)

AddEventHandler("VoiceChatProximity", function(Proximity) --Changes the Voice Chat Proximity on every Client
	TriggerClientEvent("VoiceChatProximityClient", -1, Proximity)
end)

--Outfit Stuff

AddEventHandler("OutfitSave", function(OutfitNumber, OutfitName, ModelHash, Hat, HatTexture, Glasses, GlassesTexture, EarPiece, --Saves An Outfit
									   EarPieceTexture, Watch, WatchTexture, Face, FaceTexture, Mask, MaskTexture, Hair, HairTexture,
									   HairColor, UpperBody, UpperBodyTexture, Legs, LegsTexture, Parachute, ParachuteTexture, Shoes,
									   ShoesTexture, TiesScarfsetc, TiesScarfsetcTexture, Undershirt, UndershirtTexture, Armor,
									   ArmorTexture, Embleme, EmblemeTexture, Top, TopTexture, shapeMotherID, shapeFatherID,
									   shapeExtraID, skinMotherID, skinFatherID, skinExtraID, shapeMix, skinMix, thirdMix, Blemishes,
									   FacialHair, FacialHairColor, Eyebrows, EyebrowsColor, Ageing, Makeup, Blush, BlushColor, Complexion,
									   SunDamage, Lipstick, LipstickColor, MolesFreckles, ChestHair, ChestHairColor, BodyBlemishes,
									   AddBodyBlemishes)
	if GetIdFromSource("steam", source) then
		local SteamID = GetIdFromSource("steam", source)

		if SteamID ~= nil then
			local file = io.open('resources' .. GetOSSep() .. 'FMODT' .. GetOSSep() .. 'files' .. GetOSSep() .. 'outfits' .. GetOSSep() .. SteamID .. '_' .. OutfitNumber .. '.txt', 'w+')
			if file ~= nil then
				file:write(tostring(OutfitName) .. ",")
				file:write(tostring(ModelHash) .. ",")
				file:write(tostring(Hat) .. ",")
				file:write(tostring(HatTexture) .. ",")
				file:write(tostring(Glasses) .. ",")
				file:write(tostring(GlassesTexture) .. ",")
				file:write(tostring(EarPiece) .. ",")
				file:write(tostring(EarPieceTexture) .. ",")
				file:write(tostring(Watch) .. ",")
				file:write(tostring(WatchTexture) .. ",")
				file:write(tostring(Face) .. ",")
				file:write(tostring(FaceTexture) .. ",")
				file:write(tostring(Mask) .. ",")
				file:write(tostring(MaskTexture) .. ",")
				file:write(tostring(Hair) .. ",")
				file:write(tostring(HairTexture) .. ",")
				file:write(tostring(HairColor) .. ",")
				file:write(tostring(UpperBody) .. ",")
				file:write(tostring(UpperBodyTexture) .. ",")
				file:write(tostring(Legs) .. ",")
				file:write(tostring(LegsTexture) .. ",")
				file:write(tostring(Parachute) .. ",")
				file:write(tostring(ParachuteTexture) .. ",")
				file:write(tostring(Shoes) .. ",")
				file:write(tostring(ShoesTexture) .. ",")
				file:write(tostring(TiesScarfsetc) .. ",")
				file:write(tostring(TiesScarfsetcTexture) .. ",")
				file:write(tostring(Undershirt) .. ",")
				file:write(tostring(UndershirtTexture) .. ",")
				file:write(tostring(Armor) .. ",")
				file:write(tostring(ArmorTexture) .. ",")
				file:write(tostring(Embleme) .. ",")
				file:write(tostring(EmblemeTexture) .. ",")
				file:write(tostring(Top) .. ",")	
				file:write(tostring(TopTexture) .. ",")	
				file:write(tostring(shapeMotherID) .. ",")	
				file:write(tostring(shapeFatherID) .. ",")	
				file:write(tostring(shapeExtraID) .. ",")	
				file:write(tostring(skinMotherID) .. ",")	
				file:write(tostring(skinFatherID) .. ",")	
				file:write(tostring(skinExtraID) .. ",")	
				file:write(tostring(shapeMix) .. ",")	
				file:write(tostring(skinMix) .. ",")	
				file:write(tostring(thirdMix) .. ",")	
				file:write(tostring(Blemishes) .. ",")
				file:write(tostring(FacialHair) .. ",")
				file:write(tostring(FacialHairColor) .. ",")
				file:write(tostring(Eyebrows) .. ",")
				file:write(tostring(EyebrowsColor) .. ",")
				file:write(tostring(Ageing) .. ",")
				file:write(tostring(Makeup) .. ",")
				file:write(tostring(Blush) .. ",")
				file:write(tostring(BlushColor) .. ",")
				file:write(tostring(Complexion) .. ",")
				file:write(tostring(SunDamage) .. ",")
				file:write(tostring(Lipstick) .. ",")
				file:write(tostring(LipstickColor) .. ",")
				file:write(tostring(MolesFreckles) .. ",")
				file:write(tostring(ChestHair) .. ",")
				file:write(tostring(ChestHairColor) .. ",")
				file:write(tostring(BodyBlemishes) .. ",")
				file:write(tostring(AddBodyBlemishes))	
				file:flush()
				file:close()
			end
		end
	end
end)

AddEventHandler("OutfitLoad", function(OutfitNumber) --Loads An Outfit
	if GetIdFromSource("steam", source) then
		local SteamID = GetIdFromSource("steam", source)
	
		if SteamID ~= nil then
			local file = io.open('resources' .. GetOSSep() .. 'FMODT' .. GetOSSep() .. 'files' .. GetOSSep() .. 'outfits' .. GetOSSep() .. SteamID .. '_' .. OutfitNumber .. '.txt', 'r')
			if file ~= nil then
				local fileContent = file:read("*a")
				local OutfitSplitted = stringsplit(fileContent, ',')
				TriggerClientEvent("ChangePlayerPed", source, OutfitSplitted[2])
				TriggerClientEvent("ApplyOutfitProps", source, OutfitSplitted[3], OutfitSplitted[4], OutfitSplitted[5], OutfitSplitted[6], OutfitSplitted[7], OutfitSplitted[8], OutfitSplitted[9], OutfitSplitted[10])
				TriggerClientEvent("ApplyOutfitVariations1", source, OutfitSplitted[11], OutfitSplitted[12], OutfitSplitted[13], OutfitSplitted[14], OutfitSplitted[15], OutfitSplitted[16], OutfitSplitted[17], OutfitSplitted[18], OutfitSplitted[19])
				TriggerClientEvent("ApplyOutfitVariations2", source, OutfitSplitted[20], OutfitSplitted[21], OutfitSplitted[22], OutfitSplitted[23], OutfitSplitted[24], OutfitSplitted[25], OutfitSplitted[26], OutfitSplitted[27])
				TriggerClientEvent("ApplyOutfitVariations3", source, OutfitSplitted[28], OutfitSplitted[29], OutfitSplitted[30], OutfitSplitted[31], OutfitSplitted[32], OutfitSplitted[33], OutfitSplitted[34], OutfitSplitted[35])
				if (OutfitSplitted[2] == "-1667301416") or (OutfitSplitted[2] == "1885233650")  then
					TriggerClientEvent("ApplyOutfitHeadData", source, OutfitSplitted[36], OutfitSplitted[37], OutfitSplitted[38], OutfitSplitted[39], OutfitSplitted[40], OutfitSplitted[41], OutfitSplitted[42], OutfitSplitted[43], OutfitSplitted[44])
					TriggerClientEvent("ApplyOutfitHeadOverlay", source, OutfitSplitted[45], OutfitSplitted[46], OutfitSplitted[47], OutfitSplitted[48], OutfitSplitted[49], OutfitSplitted[50], OutfitSplitted[51], OutfitSplitted[52], OutfitSplitted[53], OutfitSplitted[54], OutfitSplitted[55], OutfitSplitted[56], OutfitSplitted[57], OutfitSplitted[58], OutfitSplitted[59], OutfitSplitted[60], OutfitSplitted[61], OutfitSplitted[62])
				end
				file:close()
			end
		end
	end
end)

AddEventHandler("OutfitDelete", function(OutfitNumber) --Deletes An Outfit
	if GetIdFromSource("steam", source) then
		local SteamID = GetIdFromSource("steam", source)
	
		if SteamID ~= nil then
			local file = io.open('resources' .. GetOSSep() .. 'FMODT' .. GetOSSep() .. 'files' .. GetOSSep() .. 'outfits' .. GetOSSep() .. SteamID .. '_' .. OutfitNumber .. '.txt', 'w+')
			if file ~= nil then
				file:close()
				os.remove('resources' .. GetOSSep() .. 'FMODT' .. GetOSSep() .. 'files' .. GetOSSep() .. 'outfits' .. GetOSSep() .. SteamID .. '_' .. OutfitNumber .. '.txt')
			end
		end
	end
end)

AddEventHandler("GetOutfitNames", function() --Gets The Outfit Names
	local OutfitNames = {"Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty"}
	if GetIdFromSource("steam", source) then
		local SteamID = GetIdFromSource("steam", source)
	
		if SteamID ~= nil then
			for i = 1, 20 do
				local file = io.open('resources' .. GetOSSep() .. 'FMODT' .. GetOSSep() .. 'files' .. GetOSSep() .. 'outfits' .. GetOSSep() .. SteamID .. '_' .. i .. '.txt', 'r')
				if file ~= nil then
					local fileContent = file:read("*a")
					local OutfitSplitted = stringsplit(fileContent, ',')
					if OutfitSplitted[1] == nil then
						OutfitNames[i] = "Empty"
					else
						OutfitNames[i] = OutfitSplitted[1]
					end
					file:close()
				end
			end
			TriggerClientEvent("GotOutfitNames", source, OutfitNames[1], OutfitNames[2], OutfitNames[3], OutfitNames[4], OutfitNames[5], OutfitNames[6], OutfitNames[7], OutfitNames[8], OutfitNames[9], OutfitNames[10], OutfitNames[11], OutfitNames[12], OutfitNames[13], OutfitNames[14], OutfitNames[15], OutfitNames[16], OutfitNames[17], OutfitNames[18], OutfitNames[19], OutfitNames[20])
		end
	end
end)


--Vehicles Stuff

AddEventHandler("VehicleSave", function(VehicleNumber, VehicleName, VehicleModel, primaryType, primaryColor, secondaryType, secondaryColor,
										pearlescentColor, wheelColor, tyreSmokeR, tyreSmokeG, tyreSmokeB, wheelType, frontTyre, backTyre,
										bulletProof, tyreSmoke, turbo, xenon, windowTint, armor, brakes, engine, suspension, transmission,
										frontBumper, rearBumper, chassis, exhaust, frontFender, rearFender, grille, hood, horn, leftNeon,
										rightNeon, frontNeon, backNeon, RNeon, GNeon, BNeon, plate, plateText, roof, sideSkirt, spoiler,
										airFilter, archCover, bonnetPins, canards, dashboard, dialDesing, door, engineBlock, hydraulics,
										ornaments, plaques, plateHolder, seats, shiftLever, speakers, steeringWheel, struts, tank, trim,
										trimDesign, trunk, isPrimaryCustom, isSecondaryCustom, primaryCustomR, primaryCustomG, primaryCustomB,
										secondaryCustomR, secondaryCustomG, secondaryCustomB, liveryFirst, liverySecond, Extras1, Extras2,
										Extras3, Extras4, Extras5, Extras6, Extras7, Extras8, Extras9, Extras10, Extras11, Extras12, Extras13,
										Extras14) --Saves A Vehicle
	if GetIdFromSource("steam", source) then
		local SteamID = GetIdFromSource("steam", source)
	
		if SteamID ~= nil then
			local file = io.open('resources' .. GetOSSep() .. 'FMODT' .. GetOSSep() .. 'files' .. GetOSSep() .. 'vehicles' .. GetOSSep() .. SteamID .. '_' .. VehicleNumber .. '.txt', 'w+')
			if file ~= nil then
				file:write(tostring(VehicleName) .. ",")
				file:write(tostring(VehicleModel) .. ",")
				file:write(tostring(primaryType) .. ",")
				file:write(tostring(primaryColor) .. ",")
				file:write(tostring(secondaryType) .. ",")
				file:write(tostring(secondaryColor) .. ",")
				file:write(tostring(pearlescentColor) .. ",")
				file:write(tostring(wheelColor) .. ",")
				file:write(tostring(tyreSmokeR) .. ",")
				file:write(tostring(tyreSmokeG) .. ",")
				file:write(tostring(tyreSmokeB) .. ",")
				file:write(tostring(wheelType) .. ",")
				file:write(tostring(frontTyre) .. ",")
				file:write(tostring(backTyre) .. ",")
				file:write(tostring(bulletProof) .. ",")
				file:write(tostring(tyreSmoke) .. ",")
				file:write(tostring(turbo) .. ",")
				file:write(tostring(xenon) .. ",")
				file:write(tostring(windowTint) .. ",")
				file:write(tostring(armor) .. ",")
				file:write(tostring(brakes) .. ",")
				file:write(tostring(engine) .. ",")
				file:write(tostring(suspension) .. ",")
				file:write(tostring(transmission) .. ",")
				file:write(tostring(frontBumper) .. ",")
				file:write(tostring(rearBumper) .. ",")
				file:write(tostring(chassis) .. ",")
				file:write(tostring(exhaust) .. ",")
				file:write(tostring(frontFender) .. ",")
				file:write(tostring(rearFender) .. ",")
				file:write(tostring(grille) .. ",")
				file:write(tostring(hood) .. ",")
				file:write(tostring(horn) .. ",")
				file:write(tostring(leftNeon) .. ",")
				file:write(tostring(rightNeon) .. ",")
				file:write(tostring(frontNeon) .. ",")
				file:write(tostring(backNeon) .. ",")
				file:write(tostring(RNeon) .. ",")
				file:write(tostring(GNeon) .. ",")
				file:write(tostring(BNeon) .. ",")
				file:write(tostring(plate) .. ",")
				file:write(tostring(plateText) .. ",")
				file:write(tostring(roof) .. ",")
				file:write(tostring(sideSkirt) .. ",")
				file:write(tostring(spoiler) .. ",")
				file:write(tostring(airFilter) .. ",")
				file:write(tostring(archCover) .. ",")
				file:write(tostring(bonnetPins) .. ",")
				file:write(tostring(canards) .. ",")
				file:write(tostring(dashboard) .. ",")
				file:write(tostring(dialDesing) .. ",")
				file:write(tostring(door) .. ",")
				file:write(tostring(engineBlock) .. ",")
				file:write(tostring(hydraulics) .. ",")
				file:write(tostring(ornaments) .. ",")
				file:write(tostring(plaques) .. ",")
				file:write(tostring(plateHolder) .. ",")
				file:write(tostring(seats) .. ",")
				file:write(tostring(shiftLever) .. ",")
				file:write(tostring(speakers) .. ",")
				file:write(tostring(steeringWheel) .. ",")
				file:write(tostring(struts) .. ",")
				file:write(tostring(tank) .. ",")
				file:write(tostring(trim) .. ",")
				file:write(tostring(trimDesign) .. ",")
				file:write(tostring(trunk) .. ",")
				file:write(tostring(isPrimaryCustom) .. ",")
				file:write(tostring(isSecondaryCustom) .. ",")
				file:write(tostring(primaryCustomR) .. ",")
				file:write(tostring(primaryCustomG) .. ",")
				file:write(tostring(primaryCustomB) .. ",")
				file:write(tostring(secondaryCustomR) .. ",")
				file:write(tostring(secondaryCustomG) .. ",")
				file:write(tostring(secondaryCustomB) .. ",")
				file:write(tostring(liveryFirst) .. ",")
				file:write(tostring(liverySecond) .. ",")
				file:write(tostring(Extras1) .. ",")
				file:write(tostring(Extras2) .. ",")
				file:write(tostring(Extras3) .. ",")
				file:write(tostring(Extras4) .. ",")
				file:write(tostring(Extras5) .. ",")
				file:write(tostring(Extras6) .. ",")
				file:write(tostring(Extras7) .. ",")
				file:write(tostring(Extras8) .. ",")
				file:write(tostring(Extras9) .. ",")
				file:write(tostring(Extras10) .. ",")
				file:write(tostring(Extras11) .. ",")
				file:write(tostring(Extras12) .. ",")
				file:write(tostring(Extras13) .. ",")
				file:write(tostring(Extras14))
				file:flush()
				file:close()
			end
		end
	end
end)

AddEventHandler("VehicleLoad", function(VehicleNumber) --Loads A Vehicle
	if GetIdFromSource("steam", source) then
		local SteamID = GetIdFromSource("steam", source)

		if SteamID ~= nil then
			local file = io.open('resources' .. GetOSSep() .. 'FMODT' .. GetOSSep() .. 'files' .. GetOSSep() .. 'vehicles' .. GetOSSep() .. SteamID .. '_' .. VehicleNumber .. '.txt', 'r')
			if file ~= nil then
				local fileContent = file:read("*a")
				local VehicleSplitted = stringsplit(fileContent, ',')
				TriggerClientEvent("SpawnSavedVehicle", source, VehicleSplitted[2], VehicleSplitted[3], VehicleSplitted[4], VehicleSplitted[5], VehicleSplitted[6], VehicleSplitted[7], VehicleSplitted[8],
																VehicleSplitted[9], VehicleSplitted[10], VehicleSplitted[11], VehicleSplitted[12], VehicleSplitted[13], VehicleSplitted[14], VehicleSplitted[15],
																VehicleSplitted[16], VehicleSplitted[17], VehicleSplitted[18], VehicleSplitted[19], VehicleSplitted[20], VehicleSplitted[21], VehicleSplitted[22], 
																VehicleSplitted[23], VehicleSplitted[24], VehicleSplitted[25], VehicleSplitted[26], VehicleSplitted[27], VehicleSplitted[28], VehicleSplitted[29],
																VehicleSplitted[30], VehicleSplitted[31], VehicleSplitted[32], VehicleSplitted[33], VehicleSplitted[34], VehicleSplitted[35], VehicleSplitted[36],
																VehicleSplitted[37], VehicleSplitted[38], VehicleSplitted[39], VehicleSplitted[40], VehicleSplitted[41], VehicleSplitted[42], VehicleSplitted[43],
																VehicleSplitted[44], VehicleSplitted[45], VehicleSplitted[46], VehicleSplitted[47], VehicleSplitted[48], VehicleSplitted[49], VehicleSplitted[50],
																VehicleSplitted[51], VehicleSplitted[52], VehicleSplitted[53], VehicleSplitted[54], VehicleSplitted[55], VehicleSplitted[56], VehicleSplitted[57],
																VehicleSplitted[58], VehicleSplitted[59], VehicleSplitted[60], VehicleSplitted[61], VehicleSplitted[62], VehicleSplitted[63], VehicleSplitted[64],
																VehicleSplitted[65], VehicleSplitted[66], VehicleSplitted[67], VehicleSplitted[68], VehicleSplitted[69], VehicleSplitted[70], VehicleSplitted[71],
																VehicleSplitted[72], VehicleSplitted[73], VehicleSplitted[74], VehicleSplitted[75], VehicleSplitted[76], VehicleSplitted[77], VehicleSplitted[78],
																VehicleSplitted[79], VehicleSplitted[80], VehicleSplitted[81], VehicleSplitted[82], VehicleSplitted[83], VehicleSplitted[84], VehicleSplitted[85],
																VehicleSplitted[86], VehicleSplitted[87], VehicleSplitted[88], VehicleSplitted[89], VehicleSplitted[90])
				file:close()
			end
		end
	end
end)

AddEventHandler("VehicleUnsave", function(VehicleNumber) --Unsaves A Vehicle
	if GetIdFromSource("steam", source) then
		local SteamID = GetIdFromSource("steam", source)
	
		if SteamID ~= nil then
			local file = io.open('resources' .. GetOSSep() .. 'FMODT' .. GetOSSep() .. 'files' .. GetOSSep() .. 'vehicles' .. GetOSSep() .. SteamID .. '_' .. VehicleNumber .. '.txt', 'r')
			if file ~= nil then
				local fileContent = file:read("*a")
				local VehicleSplitted = stringsplit(fileContent, ',')
				TriggerClientEvent("UnsaveSavedVehicle", source, VehicleSplitted[2])
				file:close()
				os.remove('resources' .. GetOSSep() .. 'FMODT' .. GetOSSep() .. 'files' .. GetOSSep() .. 'vehicles' .. GetOSSep() .. SteamID .. '_' .. VehicleNumber .. '.txt')
			end
		end
	end
end)

AddEventHandler("GetVehicleNames", function() --Gets The Vehicle Names
	local VehicleNames = {"Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty", "Empty"}
	if GetIdFromSource("steam", source) then
		local SteamID = GetIdFromSource("steam", source)
	
		if SteamID ~= nil then
			for i = 1, 20 do
				local file = io.open('resources' .. GetOSSep() .. 'FMODT' .. GetOSSep() .. 'files' .. GetOSSep() .. 'vehicles' .. GetOSSep() .. SteamID .. '_' .. i .. '.txt', 'r')
				if file ~= nil then
					local fileContent = file:read("*a")
					local VehicleSplitted = stringsplit(fileContent, ',')
					if VehicleSplitted[1] == nil then
						VehicleNames[i] = "Empty"
					else
						VehicleNames[i] = VehicleSplitted[1]
					end
					file:close()
				end
			end
			TriggerClientEvent("GotVehicleNames", source, VehicleNames[1], VehicleNames[2], VehicleNames[3], VehicleNames[4], VehicleNames[5], VehicleNames[6], VehicleNames[7], VehicleNames[8], VehicleNames[9], VehicleNames[10], VehicleNames[11], VehicleNames[12], VehicleNames[13], VehicleNames[14], VehicleNames[15], VehicleNames[16], VehicleNames[17], VehicleNames[18], VehicleNames[19], VehicleNames[20])
		end
	end
end)


--Settings Stuff

AddEventHandler("SaveSettings", function(Settings)
	if GetIdFromSource("steam", source) then
		local SteamID = GetIdFromSource("steam", source)

		if SteamID ~= nil then
			local file = io.open('resources' .. GetOSSep() .. 'FMODT' .. GetOSSep() .. 'files' .. GetOSSep() .. 'settings' .. GetOSSep() .. SteamID .. '.txt', 'w+')
			if file ~= nil then
				file:write(Settings)
				file:flush()
				file:close()
			end
		end
	end
end)

AddEventHandler("LoadSettings", function() --Loads Settings
	if GetIdFromSource("steam", source) then
		local SteamID = GetIdFromSource("steam", source)
	
		if SteamID ~= nil then
			local file = io.open('resources' .. GetOSSep() .. 'FMODT' .. GetOSSep() .. 'files' .. GetOSSep() .. 'settings' .. GetOSSep() .. SteamID .. '.txt', 'r')
			if file ~= nil then
				local fileContent = file:read("*a")
				TriggerClientEvent("MenuSettingsSet", source, fileContent)
				file:close()
			end
		end
	end
end)


--Weapons Stuff

AddEventHandler("WeaponSaving", function(weapons) --Saves Player Weapons
	if GetIdFromSource("steam", source) then
		local SteamID = GetIdFromSource("steam", source)
	
		if SteamID ~= nil then
			local file = io.open('resources' .. GetOSSep() .. 'FMODT' .. GetOSSep() .. 'files' .. GetOSSep() .. 'weapons' .. GetOSSep() .. SteamID .. '.txt', 'w+')
			if file ~= nil then
				file:write(tostring(weapons))
				file:flush()
				file:close()
			end
		end
	end
end)

AddEventHandler("WeaponLoading", function() --Loads Player Weapons
	if GetIdFromSource("steam", source) then
		local SteamID = GetIdFromSource("steam", source)

		if SteamID ~= nil then
			local file = io.open('resources' .. GetOSSep() .. 'FMODT' .. GetOSSep() .. 'files' .. GetOSSep() .. 'weapons' .. GetOSSep() .. SteamID .. '.txt', 'r')
			if file ~= nil then
				local fileContent = file:read("*a")
				TriggerClientEvent("GiveWeaponsBack", source, fileContent)
				file:close()
			end
		end
	end
end)


--Teleporting Stuff

AddEventHandler("GetCoords", function(Receiver, Sender) --Gets The Coords Of A Player
    TriggerClientEvent("GetCoordsClient", Receiver, Sender)
end)

AddEventHandler("GotCoords", function(Receiver, X, Y, Z) --Send The Coords Back To A Client
    TriggerClientEvent("GotCoordsClient", Receiver, X, Y, Z)
end)

AddEventHandler("EffectForAll", function(EffectPlayer) --Triggers The Teleport Effect On Other Clients
	TriggerClientEvent("Effect", -1, EffectPlayer)
end)

AddEventHandler("TeleOtherPlayer", function(Player, AdminCoordX, AdminCoordY, AdminCoordZ) --Teleports A Player To An Admin
	TriggerClientEvent("TeleportMe", Player, AdminCoordX, AdminCoordY, AdminCoordZ)
end)


--Connect, Leave and Death Message

AddEventHandler("playerConnecting", function() --Triggers The Join Message On All Clients
	TriggerClientEvent("JoinMessageClients", -1, GetPlayerName(source))
end)

AddEventHandler("playerDropped", function(reason) --Triggers The Leave Message On All Clients
	print("Left: " .. GetPlayerName(source))
    TriggerClientEvent("LeftMessageClients", -1, GetPlayerName(source))
end)

AddEventHandler("DeathMessage", function(Killer, Text, KilledPlayer) --Sends the Death Message To All Clients
	TriggerClientEvent("DeathMessageClients", -1, Killer, Text, KilledPlayer)
end)


--World Menu Stuff

AddEventHandler("Blackout", function(State) --Sets the specific Weather on every Client
	TriggerClientEvent("SetBlackout", -1, State)
end)

AddEventHandler("NoNPCsTraffic", function(State) --Sets the specific Weather on every Client
	TriggerClientEvent("SetNoNPCsTraffic", -1, State)
end)

AddEventHandler("Weather", function(Type) --Sets the specific Weather on every Client
	TriggerClientEvent("SetWeather", -1, Type)
end)

AddEventHandler("Time", function(Hours, Minutes, freeze, State) --Sets the Time on every Client
	TriggerClientEvent("SetTime", -1, Hours, Minutes, freeze, State)
end)

--Some Functions

function tablelength(t)
	local count = 0
	for _ in pairs(t) do count = count + 1 end
	return count
end

function stringsplit(input, seperator)
	if seperator == nil then
		seperator = "%s"
	end
	
	local t={} ; i=1
	
	for str in string.gmatch(input, "([^"..seperator.."]+)") do
		t[i] = str
		i = i + 1
	end
	
	return t
end

function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

function GetOSSep()
	if os.getenv("HOME") then
		return "/"
	else
		return "\\"
	end
end

function GetIdFromSource(Type, ID) --(Thanks To WolfKnight [forum.FiveM.net])
    local IDs = GetPlayerIdentifiers(ID)
    for k, CurrentID in pairs(IDs) do
        local ID = stringsplit(CurrentID, ":")
        if (ID[1] == string.lower(Type)) then
            return ID[2]
        end
    end
    return nil
end

--Registering Server Events

RegisterServerEvent("ID") --Just Don't Edit!
RegisterServerEvent("GetID") --Just Don't Edit!
RegisterServerEvent("TeleOtherPlayer") --Just Don't Edit!
RegisterServerEvent("EffectForAll") --Just Don't Edit!
RegisterServerEvent("DeathMessage") --Just Don't Edit!
RegisterServerEvent("GetIt") --Just Don't Edit!
RegisterServerEvent("GetHost") --Just Don't Edit!
RegisterServerEvent("KickPlayer") --Just Don't Edit!
RegisterServerEvent("BanPlayer") --Just Don't Edit!
RegisterServerEvent("IsUsingSteam") --Just Don't Edit!
RegisterServerEvent("OutfitSave") --Just Don't Edit!
RegisterServerEvent("OutfitLoad") --Just Don't Edit!
RegisterServerEvent("OutfitDelete") --Just Don't Edit!
RegisterServerEvent("GetOutfitNames") --Just Don't Edit!
RegisterServerEvent("SaveSettings") --Just Don't Edit!
RegisterServerEvent("LoadSettings") --Just Don't Edit!
RegisterServerEvent("WeaponSaving") --Just Don't Edit!
RegisterServerEvent("WeaponLoading") --Just Don't Edit!
RegisterServerEvent("GetCoords") --Just Don't Edit!
RegisterServerEvent("GotCoords") --Just Don't Edit!
RegisterServerEvent("Time") --Just Don't Edit!
RegisterServerEvent("Weather") --Just Don't Edit!
RegisterServerEvent("Blackout") --Just Don't Edit!
RegisterServerEvent("NoNPCsTraffic") --Just Don't Edit!
RegisterServerEvent("ExtendableMap") --Just Don't Edit!
RegisterServerEvent("PlayerBlips") --Just Don't Edit!
RegisterServerEvent("PvP") --Just Don't Edit!
RegisterServerEvent("Scoreboard") --Just Don't Edit!
RegisterServerEvent("AdminOnlyBlipsNames") --Just Don't Edit!
RegisterServerEvent("VoiceChat") --Just Don't Edit!
RegisterServerEvent("VoiceChatProximity") --Just Don't Edit!
RegisterServerEvent("VehicleSave") --Just Don't Edit!
RegisterServerEvent("VehicleLoad") --Just Don't Edit!
RegisterServerEvent("VehicleUnsave") --Just Don't Edit!
RegisterServerEvent("GetVehicleNames") --Just Don't Edit!

--Error Message in Case the Resource Folder got renamed
if GetCurrentResourceName() ~= "FMODT" then
	print("                                             #")
	print("                                             ###")
	print("###### ###### ###### ###### ######  ##############")
	print("#      #    # #    # #    # #    #  ################    Rename '" .. GetCurrentResourceName() .. "' back to 'FMODT'")
	print("###    ###### ###### #    # ######  ##################  otherwise")
	print("#      # ##   # ##   #    # # ##    ################    the Menu won't work properly!")
	print("###### #   ## #   ## ###### #   ##  ##############")
	print("                                             ###")
	print("                                             #")
end


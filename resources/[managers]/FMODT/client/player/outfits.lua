local SaveOutfit, DeleteOutfit
local GetNamesAtFirst = true
Model = 0
OutfitNames = {NoOutfitName, NoOutfitName, NoOutfitName, NoOutfitName, NoOutfitName,
			   NoOutfitName, NoOutfitName, NoOutfitName, NoOutfitName, NoOutfitName,
			   NoOutfitName, NoOutfitName, NoOutfitName, NoOutfitName, NoOutfitName,
			   NoOutfitName, NoOutfitName, NoOutfitName, NoOutfitName, NoOutfitName}

CreateThread(function() --Outfits Menu								[Multiple Pages]
	while true do
		Citizen.Wait(0)
		
		if (outfitMenu) then
		
			TriggerServerEvent("GetOutfitNames")
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionoutfitMenu
			else
				lastSelectionoutfitMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. OutfitsTitle .. "")

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. SaveOutfitsTitle .. "", function(cb)
				if (cb) then
					outfitMenu = false
					outfitSaveMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. LoadOutfitsTitle .. "", function(cb)
				if (cb) then
					outfitMenu = false
					outfitLoadMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. DeleteOutfitsTitle .. "", function(cb)
				if (cb) then
					outfitMenu = false
					outfitDeleteMenu = true
				end
			end)

			TriggerEvent("FMODT:Update")
			
		elseif (outfitSaveMenu) then
	
			TriggerServerEvent("GetOutfitNames")
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionoutfitSaveMenu
			else
				lastSelectionoutfitSaveMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. SaveOutfitsTitle .. "")

			for i = 1, 20 do
				TriggerEvent("FMODT:Option", i .. ". " .. OutfitNames[i], function(cb)
					if (cb) then
						SaveOutfit = true
					end
				end)
			end

			TriggerEvent("FMODT:Update")
			
		elseif (outfitLoadMenu) then
	
			TriggerServerEvent("GetOutfitNames")
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionoutfitLoadMenu
			else
				lastSelectionoutfitLoadMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. LoadOutfitsTitle .. "")

			for i = 1, 20 do
				TriggerEvent("FMODT:Option", i .. ". " .. OutfitNames[i], function(cb)
					if (cb) then
						if OutfitNames[currentOption] ~= NoOutfitName then
							TriggerServerEvent("OutfitLoad", currentOption)
							drawNotification("~g~Outfit ~y~" .. OutfitNames[currentOption] .. " ~g~Loaded!")
						else
							drawNotification("~r~Outfit " .. currentOption .. " Not Existing!")
						end
					end
				end)
			end

			TriggerEvent("FMODT:Update")
			
		elseif (outfitDeleteMenu) then
	
			TriggerServerEvent("GetOutfitNames")
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionoutfitDeleteMenu
			else
				lastSelectionoutfitDeleteMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. DeleteOutfitsTitle .. "")
			
			for i = 1, 20 do
				TriggerEvent("FMODT:Option", i .. ". " .. OutfitNames[i], function(cb)
					if (cb) then
						DeleteOutfit = true
					end
				end)
			end

			TriggerEvent("FMODT:Update")
		end
	end
end)

CreateThread(function() --Outfit Saving
	while true do
		Citizen.Wait(0)
		local playerPed = GetPlayerPed(-1)
		local OutfitName
		local Hat = GetPedPropIndex(playerPed, 0)
		local HatTexture = GetPedPropTextureIndex(playerPed, 0)
		local Glasses = GetPedPropIndex(playerPed, 1)
		local GlassesTexture = GetPedPropTextureIndex(playerPed, 1)
		local EarPiece = GetPedPropIndex(playerPed, 2)
		local EarPieceTexture = GetPedPropTextureIndex(playerPed, 2)
		local Watch = GetPedPropIndex(playerPed, 3)
		local WatchTexture = GetPedPropTextureIndex(playerPed, 3)
		local Face = GetPedDrawableVariation(playerPed, 0)
		local FaceTexture = GetPedTextureVariation(playerPed, 0)
		local Mask = GetPedDrawableVariation(playerPed, 1)
		local MaskTexture = GetPedTextureVariation(playerPed, 1)
		local Hair = GetPedDrawableVariation(playerPed, 2)
		local HairTexture = GetPedTextureVariation(playerPed, 2)
		local UpperBody = GetPedDrawableVariation(playerPed, 3)
		local UpperBodyTexture = GetPedTextureVariation(playerPed, 3)
		local Legs = GetPedDrawableVariation(playerPed, 4)
		local LegsTexture = GetPedTextureVariation(playerPed, 4)
		local Parachute = GetPedDrawableVariation(playerPed, 5)
		local ParachuteTexture = GetPedTextureVariation(playerPed, 5)
		local Shoes = GetPedDrawableVariation(playerPed, 6)
		local ShoesTexture = GetPedTextureVariation(playerPed, 6)
		local TiesScarfsetc = GetPedDrawableVariation(playerPed, 7)
		local TiesScarfsetcTexture = GetPedTextureVariation(playerPed, 7)
		local Undershirt = GetPedDrawableVariation(playerPed, 8)
		local UndershirtTexture = GetPedTextureVariation(playerPed, 8)
		local Armor = GetPedDrawableVariation(playerPed, 9)
		local ArmorTexture = GetPedTextureVariation(playerPed, 9)
		local Embleme = GetPedDrawableVariation(playerPed, 10)
		local EmblemeTexture = GetPedTextureVariation(playerPed, 10)
		local Top = GetPedDrawableVariation(playerPed, 11)
		local TopTexture = GetPedTextureVariation(playerPed, 11)
		local bool, shapeMotherID, shapeFatherID, shapeExtraID, skinMotherID, skinFatherID, skinExtraID, shapeMix, skinMix, thirdMix = Citizen.InvokeNative(0x2746BD9D88C5C5D0, GetPlayerPed(-1), Citizen.PointerValueIntInitialized(shapeMotherID), Citizen.PointerValueIntInitialized(shapeFatherID), Citizen.PointerValueIntInitialized(shapeExtraID), Citizen.PointerValueIntInitialized(skinMotherID), Citizen.PointerValueIntInitialized(shapeFatherID), Citizen.PointerValueIntInitialized(skinExtraID), Citizen.PointerValueFloatInitialized(shapeMix), Citizen.PointerValueFloatInitialized(skinMix), Citizen.PointerValueFloatInitialized(thirdMix), Citizen.ReturnResultAnyway())
		local newShapeMix = round(shapeMix, 2)
		local newSkinMix = round(skinMix, 2)
		local newThirdMix = round(thirdMix, 2)
		local ModelHash = GetEntityModel(GetPlayerPed(-1))
		local Blemishes = GetPedHeadOverlayValue(playerPed, 0)
		local FacialHair = GetPedHeadOverlayValue(playerPed, 1)
		local Eyebrows = GetPedHeadOverlayValue(playerPed, 2)
		local Ageing = GetPedHeadOverlayValue(playerPed, 3)
		local Makeup = GetPedHeadOverlayValue(playerPed, 4)
		local Blush = GetPedHeadOverlayValue(playerPed, 5)
		local Complexion = GetPedHeadOverlayValue(playerPed, 6)
		local SunDamage = GetPedHeadOverlayValue(playerPed, 7)
		local Lipstick = GetPedHeadOverlayValue(playerPed, 8)
		local MolesFreckles = GetPedHeadOverlayValue(playerPed, 9)
		local ChestHair = GetPedHeadOverlayValue(playerPed, 10)
		local BodyBlemishes = GetPedHeadOverlayValue(playerPed, 11)
		local AddBodyBlemishes = GetPedHeadOverlayValue(playerPed, 12)
		
		if SaveOutfit then
			if (OutfitNames[currentOption] ~= NoOutfitName) then
				DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", OutfitNames[currentOption], "", "", "", 25)
			else
				DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", NewOutfitDefaultName .. " " .. currentOption, "", "", "", 25)
			end
			blockinput = true

			while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
				Citizen.Wait(0)
			end

			if UpdateOnscreenKeyboard() ~= 2 then
				OutfitName = GetOnscreenKeyboardResult()
				Citizen.Wait(500)
				if OutfitName == NoOutfitName then
					drawNotification("~r~" .. OutfitSavingAbortion .. "!")
					Citizen.Wait(500)
				else
					if OutfitName == "" then
						OutfitName = NewOutfitDefaultName .. " " .. currentOption
					end
					TriggerServerEvent("OutfitSave", currentOption, OutfitName, ModelHash, Hat, HatTexture, Glasses, GlassesTexture, EarPiece, EarPieceTexture, Watch, WatchTexture, Face, FaceTexture, Mask, MaskTexture, Hair, HairTexture, HairColorIndex, UpperBody, UpperBodyTexture, Legs, LegsTexture, Parachute, ParachuteTexture, Shoes, ShoesTexture, TiesScarfsetc, TiesScarfsetcTexture, Undershirt, UndershirtTexture, Armor, ArmorTexture, Embleme, EmblemeTexture, Top, TopTexture, shapeMotherID, shapeFatherID, shapeExtraID, skinMotherID, skinFatherID, skinExtraID, newShapeMix, newSkinMix, newThirdMix, Blemishes, FacialHair, FacialHairColorIndex, Eyebrows, EyebrowsColorIndex, Ageing, Makeup, Blush, BlushColorIndex, Complexion, SunDamage, Lipstick, LipstickColorIndex, MolesFreckles, ChestHair, ChestHairColorIndex, BodyBlemishes, AddBodyBlemishes)
				end
			else
				drawNotification("~r~" .. OutfitSavingAbortion .. "!")
				Citizen.Wait(500)
			end
			blockinput = false
			SaveOutfit = false
		end
	end
end)

CreateThread(function() --Outfit Deleting
	while true do
		Citizen.Wait(0)
		if DeleteOutfit then
			if OutfitNames[currentOption] ~= NoOutfitName then
				DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", OutfitDeletingConfirmation, "", "", "", 35)
				blockinput = true

				while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
					Citizen.Wait(0)
				end

				if UpdateOnscreenKeyboard() ~= 2 then
					result = GetOnscreenKeyboardResult()
					Citizen.Wait(500)
					if result:lower() == (OutfitDeletingWord or "'" .. OutfitDeletingWord .. "'") then
						TriggerServerEvent("DeleteOutfit", currentOption)
					else
						drawNotification("~r~" .. OutfitDeletingAbortion .. "!")
						Citizen.Wait(500)
					end
				else
					drawNotification("~r~" .. OutfitDeletingAbortion .. "!")
					Citizen.Wait(500)
				end
				blockinput = false
			else
				drawNotification("~r~Outfit " .. currentOption .. " - " .. NotExisting .. "!")
			end
			DeleteOutfit = false
		end
	end
end)

CreateThread(function() --Gets Outfit Names Once
	while true do
		Citizen.Wait(0)
		if GetNamesAtFirst then
			TriggerServerEvent("GetOutfitNames")
			GetNamesAtFirst = false
		end
	end
end)		
		
AddEventHandler("GotOutfitNames", function(OutfitName1, OutfitName2, OutfitName3, OutfitName4, OutfitName5, OutfitName6, OutfitName7, OutfitName8, OutfitName9, OutfitName10, --Just Don't Edit!
								           OutfitName11, OutfitName12, OutfitName13, OutfitName14, OutfitName15, OutfitName16, OutfitName17, OutfitName18, OutfitName19, OutfitName20)
	OutfitNames[1] = OutfitName1
	OutfitNames[2] = OutfitName2
	OutfitNames[3] = OutfitName3
	OutfitNames[4] = OutfitName4
	OutfitNames[5] = OutfitName5
	OutfitNames[6] = OutfitName6
	OutfitNames[7] = OutfitName7
	OutfitNames[8] = OutfitName8
	OutfitNames[9] = OutfitName9
	OutfitNames[10] = OutfitName10
	OutfitNames[11] = OutfitName11
	OutfitNames[12] = OutfitName12
	OutfitNames[13] = OutfitName13
	OutfitNames[14] = OutfitName14
	OutfitNames[15] = OutfitName15
	OutfitNames[16] = OutfitName16
	OutfitNames[17] = OutfitName17
	OutfitNames[18] = OutfitName18
	OutfitNames[19] = OutfitName19
	OutfitNames[20] = OutfitName20
end)

AddEventHandler("ChangePlayerPed", function(ModelHash) --Just Don't Edit!
	if tonumber(ModelHash) ~= nil then
		Model = tonumber(ModelHash)
		RequestModel(Model)
		while not HasModelLoaded(Model) do
			Citizen.Wait(0)
		end
		SetPlayerModel(PlayerId(), Model)
		if playerVisibleCount == 1 then
			playerVisible = true
		end
	end
end)

AddEventHandler("ApplyOutfitProps", function(Hat, HatTexture, Glasses, GlassesTexture, EarPiece, EarPieceTexture, Watch, WatchTexture) --Just Don't Edit!
	if not HasModelLoaded(Model) then
		while not HasModelLoaded(Model) do
			Citizen.Wait(0)
		end
		Citizen.Wait(1000)
	end
	if Hat ~= nil then
		SetPedPropIndex(GetPlayerPed(-1), 0, tonumber(Hat), tonumber(HatTexture), true)
	end
	if Glasses ~= nil then
		SetPedPropIndex(GetPlayerPed(-1), 1, tonumber(Glasses), tonumber(GlassesTexture), true)
	end
	if EarPiece ~= nil then
		SetPedPropIndex(GetPlayerPed(-1), 2, tonumber(EarPiece), tonumber(EarPieceTexture), true)
	end
	if Watch ~= nil then
		SetPedPropIndex(GetPlayerPed(-1), 3, tonumber(Watch), tonumber(WatchTexture), true)
	end
end)

AddEventHandler("ApplyOutfitVariations1", function(Face, FaceTexture, Mask, MaskTexture, Hair, HairTexture, HairColor, UpperBody, UpperBodyTexture) --Just Don't Edit!
	if not HasModelLoaded(Model) then
		while not HasModelLoaded(Model) do
			Citizen.Wait(0)
		end
		Citizen.Wait(1000)
	end
	if Face ~= nil then
		SetPedComponentVariation(GetPlayerPed(-1), 0, tonumber(Face), tonumber(FaceTexture), GetPedPaletteVariation(GetPlayerPed(-1), 0))
	end
	if Mask ~= nil then
		SetPedComponentVariation(GetPlayerPed(-1), 1, tonumber(Mask), tonumber(MaskTexture), GetPedPaletteVariation(GetPlayerPed(-1), 1))
	end
	if Hair ~= nil then
		SetPedComponentVariation(GetPlayerPed(-1), 2, tonumber(Hair), tonumber(HairTexture), GetPedPaletteVariation(GetPlayerPed(-1), 2))
		HairColorIndex = tonumber(HairColor)
		Citizen.Wait(1000)
		SetPedHairColor(GetPlayerPed(-1), HairColorIndex, 0)
	end
	if UpperBody ~= nil then
		SetPedComponentVariation(GetPlayerPed(-1), 3, tonumber(UpperBody), tonumber(UpperBodyTexture), GetPedPaletteVariation(GetPlayerPed(-1), 3))
	end
end)

AddEventHandler("ApplyOutfitVariations2", function(Legs, LegsTexture, Parachute, ParachuteTexture, Shoes, ShoesTexture, TiesScarfsetc, TiesScarfsetcTexture) --Just Don't Edit!
	if not HasModelLoaded(Model) then
		while not HasModelLoaded(Model) do
			Citizen.Wait(0)
		end
		Citizen.Wait(1000)
	end
	if Legs ~= nil then
		SetPedComponentVariation(GetPlayerPed(-1), 4, tonumber(Legs), tonumber(LegsTexture), GetPedPaletteVariation(GetPlayerPed(-1), 4))
	end
	if Parachute ~= nil then
		SetPedComponentVariation(GetPlayerPed(-1), 5, tonumber(Parachute), tonumber(ParachuteTexture), GetPedPaletteVariation(GetPlayerPed(-1), 5))
	end
	if Shoes ~= nil then
		SetPedComponentVariation(GetPlayerPed(-1), 6, tonumber(Shoes), tonumber(ShoesTexture), GetPedPaletteVariation(GetPlayerPed(-1), 6))
	end
	if TiesScarfsetc ~= nil then
		SetPedComponentVariation(GetPlayerPed(-1), 7, tonumber(TiesScarfsetc), tonumber(TiesScarfsetcTexture), GetPedPaletteVariation(GetPlayerPed(-1), 7))
	end
end)

AddEventHandler("ApplyOutfitVariations3", function(Undershirt, UndershirtTexture, Armor, ArmorTexture, Embleme, EmblemeTexture, Top, TopTexture) --Just Don't Edit!
	if not HasModelLoaded(Model) then
		while not HasModelLoaded(Model) do
			Citizen.Wait(0)
		end
		Citizen.Wait(1000)
	end
	if Undershirt ~= nil then
		SetPedComponentVariation(GetPlayerPed(-1), 8, tonumber(Undershirt), tonumber(UndershirtTexture), GetPedPaletteVariation(GetPlayerPed(-1), 8))
	end
	if Armor ~= nil then
		SetPedComponentVariation(GetPlayerPed(-1), 9, tonumber(Armor), tonumber(ArmorTexture), GetPedPaletteVariation(GetPlayerPed(-1), 9))
	end
	if Embleme ~= nil then
		SetPedComponentVariation(GetPlayerPed(-1), 10, tonumber(Embleme), tonumber(EmblemeTexture), GetPedPaletteVariation(GetPlayerPed(-1), 10))
	end
	if Top ~= nil then
		SetPedComponentVariation(GetPlayerPed(-1), 11, tonumber(Top), tonumber(TopTexture), GetPedPaletteVariation(GetPlayerPed(-1), 11))
	end
end)

AddEventHandler("ApplyOutfitHeadData", function(shapeMotherID, shapeFatherID, shapeExtraID, skinMotherID, skinFatherID, skinExtraID, shapeMix, skinMix, thirdMix) --Just Don't Edit!
	if not HasModelLoaded(Model) then
		while not HasModelLoaded(Model) do
			Citizen.Wait(0)
		end
	end
	Citizen.Wait(1000)
	shapeMixSplitted = stringsplit(shapeMix, ".")
	skinMixSplitted = stringsplit(skinMix, ".")
	thirdMixSplitted = stringsplit(thirdMix, ".")
	if tonumber(shapeMixSplitted[2]) > 9 then
		newshapeMix = (tonumber(shapeMixSplitted[1]) * 1.0) + ((tonumber(shapeMixSplitted[2]) * 1.0) / 100)
	else
		newshapeMix = (tonumber(shapeMixSplitted[1]) * 1.0) + ((tonumber(shapeMixSplitted[2]) * 1.0) / 10)
	end
	if tonumber(skinMixSplitted[2]) > 9 then
		newskinMix = (tonumber(skinMixSplitted[1]) * 1.0) + ((tonumber(skinMixSplitted[2]) * 1.0) / 100)
	else
		newskinMix = (tonumber(skinMixSplitted[1]) * 1.0) + ((tonumber(skinMixSplitted[2]) * 1.0) / 10)
	end
	if tonumber(thirdMixSplitted[2]) > 9 then
		newthirdMix = (tonumber(thirdMixSplitted[1]) * 1.0) + ((tonumber(thirdMixSplitted[2]) * 1.0) / 100)
	else
		newthirdMix = (tonumber(thirdMixSplitted[1]) * 1.0) + ((tonumber(thirdMixSplitted[2]) * 1.0) / 10)
	end
	SetPedHeadBlendData(GetPlayerPed(-1), tonumber(shapeMotherID), tonumber(shapeFatherID), tonumber(shapeExtraID), tonumber(skinMotherID), tonumber(skinFatherID), tonumber(skinExtraID), newshapeMix, newskinMix, newthirdMix, false)
end)

AddEventHandler("ApplyOutfitHeadOverlay", function(Blemishes, FacialHair, FacialHairColor, Eyebrows, EyebrowsColor, Ageing, Makeup, Blush, BlushColor, Complexion, --Just Don't Edit!
												   SunDamage, Lipstick, LipstickColor, MolesFreckles, ChestHair, ChestHairColor, BodyBlemishes, AddBodyBlemishes)
	if not HasModelLoaded(Model) then
		while not HasModelLoaded(Model) do
			Citizen.Wait(0)
		end
	end
	Citizen.Wait(2000)
	SetPedHeadOverlay(GetPlayerPed(-1), 0, tonumber(Blemishes), 1.0)
	SetPedHeadOverlay(GetPlayerPed(-1), 1, tonumber(FacialHair), 1.0)
	FacialHairColorIndex = tonumber(FacialHairColor)
	SetPedHeadOverlayColor(GetPlayerPed(-1), 1, 1, tonumber(FacialHairColorIndex), 0)
	SetPedHeadOverlay(GetPlayerPed(-1), 2, tonumber(Eyebrows), 1.0)
	EyebrowsColorIndex = tonumber(EyebrowsColor)
	SetPedHeadOverlayColor(GetPlayerPed(-1), 2, 1, tonumber(EyebrowsColorIndex), 0)
	SetPedHeadOverlay(GetPlayerPed(-1), 3, tonumber(Ageing), 1.0)
	SetPedHeadOverlay(GetPlayerPed(-1), 4, tonumber(Makeup), 1.0)
	SetPedHeadOverlay(GetPlayerPed(-1), 5, tonumber(Blush), 1.0)
	BlushColorIndex = tonumber(BlushColor)
	SetPedHeadOverlayColor(GetPlayerPed(-1), 5, 2, tonumber(BlushColorIndex), 0)
	SetPedHeadOverlay(GetPlayerPed(-1), 6, tonumber(Complexion), 1.0)
	SetPedHeadOverlay(GetPlayerPed(-1), 7, tonumber(SunDamage), 1.0)
	SetPedHeadOverlay(GetPlayerPed(-1), 8, tonumber(Lipstick), 1.0)
	LipstickColorIndex = tonumber(LipstickColor)
	SetPedHeadOverlayColor(GetPlayerPed(-1), 8, 2, tonumber(LipstickColorIndex), 0)
	SetPedHeadOverlay(GetPlayerPed(-1), 9, tonumber(MolesFreckles), 1.0)
	SetPedHeadOverlay(GetPlayerPed(-1), 10, tonumber(ChestHair), 1.0)
	ChestHairColorIndex = tonumber(ChestHairColor)
	SetPedHeadOverlayColor(GetPlayerPed(-1), 10, 1, tonumber(ChestHairColorIndex), 0)
	SetPedHeadOverlay(GetPlayerPed(-1), 11, tonumber(BodyBlemishes), 1.0)
	SetPedHeadOverlay(GetPlayerPed(-1), 12, tonumber(AddBodyBlemishes), 1.0)
end)


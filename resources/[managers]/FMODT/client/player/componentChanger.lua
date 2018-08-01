HairColorIndex = 0
FacialHairColorIndex = 0
EyebrowsColorIndex = 0
ChestHairColorIndex = 0
BlushColorIndex = 0
LipstickColorIndex = 0
local overlayName
local overlayID
local overlayIndex
local overlayOpacity = 0.0

Citizen.CreateThread(function() --Component Changer
	while true do
		if componentChangerMenu then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectioncomponentChangerMenu
			else
				lastSelectioncomponentChangerMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. ComponentChangerTitle .. "")
			
			if (GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_f_freemode_01")) or (GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01")) then --Skin
				TriggerEvent("FMODT:Option", "~y~>> ~s~Skin", function(cb)
					if (cb) then
						componentChangerMenu = false
						componentChangerSkinMenu = true
					end
				end)
			end

			if (GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_f_freemode_01")) or (GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01")) then --Head Data
				TriggerEvent("FMODT:Option", "~y~>> ~s~Overlays", function(cb)
					if (cb) then
						componentChangerMenu = false
						componentChangerHeadDataMenu = true
					end
				end)
			end

			if GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), 0) > 0 then --Hats
				TriggerEvent("FMODT:Option", "~y~>> ~s~Hats", function(cb)
					if (cb) then
						componentChangerMenu = false
						componentChangerHatsMenu = true
					end
				end)
			end

			if GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), 1) > 0 then --Glasses
				TriggerEvent("FMODT:Option", "~y~>> ~s~Glasses", function(cb)
					if (cb) then
						componentChangerMenu = false
						componentChangerGlassesMenu = true
					end
				end)
			end

			if GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), 2) > 0 then --Ear Pieces
				TriggerEvent("FMODT:Option", "~y~>> ~s~Ear Pieces", function(cb)
					if (cb) then
						componentChangerMenu = false
						componentChangerEarPiecesMenu = true
					end
				end)
			end

			if GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), 3) > 0 then --Watches
				TriggerEvent("FMODT:Option", "~y~>> ~s~Watches", function(cb)
					if (cb) then
						componentChangerMenu = false
						componentChangerWatchesMenu = true
					end
				end)
			end
			
			if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 0) > 0 then --Face
				TriggerEvent("FMODT:Option", "~y~>> ~s~Face", function(cb)
					if (cb) then
						componentChangerMenu = false
						componentChangerFaceMenu = true
					end
				end)
			end

			if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 1) > 0 then --Masks
				TriggerEvent("FMODT:Option", "~y~>> ~s~Masks", function(cb)
					if (cb) then
						componentChangerMenu = false
						componentChangerMasksMenu = true
					end
				end)
			end

			if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 2) > 0 then --Hair
				TriggerEvent("FMODT:Option", "~y~>> ~s~Hair", function(cb)
					if (cb) then
						componentChangerMenu = false
						componentChangerHairMenu = true
					end
				end)
			end

			if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 3) > 0 then --Arms / Upper Body / Gloves
				TriggerEvent("FMODT:Option", "~y~>> ~s~Arms / Upper Body / Gloves", function(cb)
					if (cb) then
						componentChangerMenu = false
						componentChangerUpperBodyMenu = true
					end
				end)
			end

			if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 4) > 0 then --Legs
				TriggerEvent("FMODT:Option", "~y~>> ~s~Legs", function(cb)
					if (cb) then
						componentChangerMenu = false
						componentChangerLegsMenu = true
					end
				end)
			end

			if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 5) > 0 then --Parachutes & Heist Bags
				TriggerEvent("FMODT:Option", "~y~>> ~s~Parachutes & Heist Bags", function(cb)
					if (cb) then
						componentChangerMenu = false
						componentChangerParachutesMenu = true
					end
				end)
			end

			if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 6) > 0 then --Shoes
				TriggerEvent("FMODT:Option", "~y~>> ~s~Shoes", function(cb)
					if (cb) then
						componentChangerMenu = false
						componentChangerShoesMenu = true
					end
				end)
			end

			if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 7) > 0 then --Ties, Scarfs, etc.
				TriggerEvent("FMODT:Option", "~y~>> ~s~Ties, Scarfs, etc.", function(cb)
					if (cb) then
						componentChangerMenu = false
						componentChangerTiesScarfsetcMenu = true
					end
				end)
			end

			if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 8) > 0 then --Undershirts & Special Things
				TriggerEvent("FMODT:Option", "~y~>> ~s~Undershirts & Special Things", function(cb)
					if (cb) then
						componentChangerMenu = false
						componentChangerUndershirtsMenu = true
					end
				end)
			end

			if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 9) > 0 then --Armor
				TriggerEvent("FMODT:Option", "~y~>> ~s~Armor", function(cb)
					if (cb) then
						componentChangerMenu = false
						componentChangerArmorMenu = true
					end
				end)
			end

			if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 10) > 0 then --Emblemes
				TriggerEvent("FMODT:Option", "~y~>> ~s~Emblemes", function(cb)
					if (cb) then
						componentChangerMenu = false
						componentChangerEmblemesMenu = true
					end
				end)
			end

			if GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 11) > 0 then --Tops
				TriggerEvent("FMODT:Option", "~y~>> ~s~Tops", function(cb)
					if (cb) then
						componentChangerMenu = false
						componentChangerTopsMenu = true
					end
				end)
			end

			TriggerEvent("FMODT:Update")
			
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Component Changer (Skin)
	local positionMother = 1
	local positionFather = 1
	local arrayMother  = {"1", "2", "3", "4", "5",
						 "6", "7", "8", "9", "10",
						 "11", "12", "13", "14", "15",
						 "16", "17", "18", "19", "20",
						 "21", "22"}
	local arrayMother2 = {"21", "22", "23", "24", "25",
						  "26", "27", "28", "29", "30",
						  "31", "32", "33", "34", "35",
						  "36", "37", "38", "39", "40",
						  "41", "45"}
	local arrayFather  = {"1", "2", "3", "4", "5",
						 "6", "7", "8", "9", "10",
						 "11", "12", "13", "14", "15",
						 "16", "17", "18", "19", "20",
						 "21", "22", "23", "24"}
	local arrayFather2 = {"0", "1", "2", "3", "4",
						  "5", "6", "7", "8", "9",
						  "10", "11", "12", "13", "14",
						  "15", "16", "17", "18", "19",
						  "20", "42", "43", "44"}

	while true do
		if componentChangerSkinMenu then
			
			local unusedBool, shapeMotherID, shapeFatherID, shapeExtraID, skinMotherID, skinFatherID, skinExtraID, shapeMix, skinMix, thirdMix = Citizen.InvokeNative(0x2746BD9D88C5C5D0, GetPlayerPed(-1), Citizen.PointerValueIntInitialized(shapeMotherID), Citizen.PointerValueIntInitialized(shapeFatherID), Citizen.PointerValueIntInitialized(shapeExtraID), Citizen.PointerValueIntInitialized(skinMotherID), Citizen.PointerValueIntInitialized(shapeFatherID), Citizen.PointerValueIntInitialized(skinExtraID), Citizen.PointerValueFloatInitialized(shapeMix), Citizen.PointerValueFloatInitialized(skinMix), Citizen.PointerValueFloatInitialized(thirdMix), Citizen.ReturnResultAnyway())		
			local newShapeMix = round(shapeMix, 2)
			local newSkinMix = round(skinMix, 2)
			local newThirdMix = round(thirdMix, 2)
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectioncomponentChangerSkinMenu
			else
				lastSelectioncomponentChangerSkinMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~Skin")

			TriggerEvent("FMODT:StringArray", "Mother Shape", arrayMother, positionMother, function(cb)
				positionMother = cb
				shapeMotherID = tonumber(arrayMother2[positionMother])
			end)

			TriggerEvent("FMODT:Int", "Mother Skintone", skinMotherID, 0, 45, function(cb)
				skinMotherID = cb
			end)
		
			TriggerEvent("FMODT:StringArray", "Father Shape", arrayFather, positionFather, function(cb)
				positionFather = cb
				shapeFatherID = tonumber(arrayFather2[positionFather])
			end)

			TriggerEvent("FMODT:Int", "Father Skintone", skinFatherID, 0, 45, function(cb)
				skinFatherID = cb
			end)
		
			TriggerEvent("FMODT:Int", "Extra Shape", shapeExtraID, 0, 45, function(cb)
				shapeExtraID = cb
			end)
		
			TriggerEvent("FMODT:Int", "Extra Skintone", skinExtraID, 0, 45, function(cb)
				skinExtraID = cb
			end)
		
			TriggerEvent("FMODT:Float", "Shape Mix", newShapeMix, 0.0, 1.0, 0.05, 5, function(cb)
				newShapeMix = cb
			end)

			TriggerEvent("FMODT:Float", "Skintone Mix", newSkinMix, 0.0, 1.0, 0.05, 6, function(cb)
				newSkinMix = cb
			end)

			TriggerEvent("FMODT:Float", "Extra Mix", newThirdMix, 0.0, 1.0, 0.05, 7, function(cb)
				newThirdMix = cb
			end)

			SetPedHeadBlendData(GetPlayerPed(-1), shapeMotherID, shapeFatherID, shapeExtraID, skinMotherID, skinFatherID, skinExtraID, newShapeMix, newSkinMix, newThirdMix, false)

			TriggerEvent("FMODT:Update")
			
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Component Changer (Overlays)
	while true do
	
		if componentChangerHeadDataMenu then
		
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectioncomponentChangerHeadDataMenu
			else
				lastSelectioncomponentChangerHeadDataMenu = currentOption
			end

			TriggerEvent("FMODT:Title", "~y~Overlays")

			TriggerEvent("FMODT:Option", "~y~>> ~s~Blemishes", function(cb)
				if (cb) then
					overlayName = "Blemishes"
					overlayID = 0
					overlayIndex = GetPedHeadOverlayValue(GetPlayerPed(-1), overlayID)
					overlayOpacity = 1.0
					componentChangerHeadDataMenu = false
					componentChangerHeadDataSubMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~Facial Hair", function(cb)
				if (cb) then
					overlayName = "Facial Hair"
					overlayID = 1
					overlayIndex = GetPedHeadOverlayValue(GetPlayerPed(-1), overlayID)
					overlayOpacity = 1.0
					OverlayColorP = 0
					OverlayColorS = 0
					componentChangerHeadDataMenu = false
					componentChangerHeadDataSubMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~Eyebrowns", function(cb)
				if (cb) then
					overlayName = "Eyebrowns"
					overlayID = 2
					overlayIndex = GetPedHeadOverlayValue(GetPlayerPed(-1), overlayID)
					overlayOpacity = 1.0
					OverlayColorP = 0
					OverlayColorS = 0
					componentChangerHeadDataMenu = false
					componentChangerHeadDataSubMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~Ageing", function(cb)
				if (cb) then
					overlayName = "Ageing"
					overlayID = 3
					overlayIndex = GetPedHeadOverlayValue(GetPlayerPed(-1), overlayID)
					overlayOpacity = 1.0
					componentChangerHeadDataMenu = false
					componentChangerHeadDataSubMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~Makeup", function(cb)
				if (cb) then
					overlayName = "Makeup"
					overlayID = 4
					overlayIndex = GetPedHeadOverlayValue(GetPlayerPed(-1), overlayID)
					overlayOpacity = 1.0
					componentChangerHeadDataMenu = false
					componentChangerHeadDataSubMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~Blush", function(cb)
				if (cb) then
					overlayName = "Blush"
					overlayID = 5
					overlayIndex = GetPedHeadOverlayValue(GetPlayerPed(-1), overlayID)
					overlayOpacity = 1.0
					OverlayColorP = 0
					OverlayColorS = 0
					componentChangerHeadDataMenu = false
					componentChangerHeadDataSubMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~Complexion", function(cb)
				if (cb) then
					overlayName = " Complexion"
					overlayID = 6
					overlayIndex = GetPedHeadOverlayValue(GetPlayerPed(-1), overlayID)
					overlayOpacity = 1.0
					componentChangerHeadDataMenu = false
					componentChangerHeadDataSubMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~Sun Damage", function(cb)
				if (cb) then
					overlayName = "Sun Damage"
					overlayID = 7
					overlayIndex = GetPedHeadOverlayValue(GetPlayerPed(-1), overlayID)
					overlayOpacity = 1.0
					componentChangerHeadDataMenu = false
					componentChangerHeadDataSubMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~Lipstick", function(cb)
				if (cb) then
					overlayName = "Lipstick"
					overlayID = 8
					overlayIndex = GetPedHeadOverlayValue(GetPlayerPed(-1), overlayID)
					overlayOpacity = 1.0
					OverlayColorP = 0
					OverlayColorS = 0
					componentChangerHeadDataMenu = false
					componentChangerHeadDataSubMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~Moles / Freckles", function(cb)
				if (cb) then
					overlayName = "Moles / Freckles"
					overlayID = 9
					overlayIndex = GetPedHeadOverlayValue(GetPlayerPed(-1), overlayID)
					overlayOpacity = 1.0
					componentChangerHeadDataMenu = false
					componentChangerHeadDataSubMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~Chest Hair", function(cb)
				if (cb) then
					overlayName = "Chest Hair"
					overlayID = 10
					overlayIndex = GetPedHeadOverlayValue(GetPlayerPed(-1), overlayID)
					overlayOpacity = 1.0
					OverlayColorP = 0
					OverlayColorS = 0
					componentChangerHeadDataMenu = false
					componentChangerHeadDataSubMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~Body Blemishes", function(cb)
				if (cb) then
					overlayName = "Body Blemishes"
					overlayID = 11
					overlayIndex = GetPedHeadOverlayValue(GetPlayerPed(-1), overlayID)
					overlayOpacity = 1.0
					componentChangerHeadDataMenu = false
					componentChangerHeadDataSubMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~Add Body Blemishes", function(cb)
				if (cb) then
					overlayName = "Add Body Blemishes"
					overlayID = 12
					overlayIndex = GetPedHeadOverlayValue(GetPlayerPed(-1), overlayID)
					overlayOpacity = 1.0
					componentChangerHeadDataMenu = false
					componentChangerHeadDataSubMenu = true
				end
			end)

			TriggerEvent("FMODT:Update")
			
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Component Changer (Overlays Sub)
	local ColorType
	while true do
	
		if componentChangerHeadDataSubMenu then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectioncomponentChangerHeadDataSubMenu
			else
				lastSelectioncomponentChangerHeadDataSubMenu = currentOption
			end
			
			if GetPedHeadOverlayValue(GetPlayerPed(-1), overlayID) == 255 then
				overlayIndex = -1
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. overlayName)

			TriggerEvent("FMODT:Int", overlayName, overlayIndex, -1, GetNumHeadOverlayValues(overlayID) - 1, function(cb)
				overlayIndex = cb
				if overlayIndex == -1 then
					SetPedHeadOverlay(GetPlayerPed(-1), overlayID, 255, 0.0)
				else
					SetPedHeadOverlay(GetPlayerPed(-1), overlayID, overlayIndex, overlayOpacity)
				end
			end)
		
			TriggerEvent("FMODT:Float", overlayName .. " Opacity", overlayOpacity, 0.2, 1.0, 0.1, 8, function(cb)
				overlayOpacity = cb
				SetPedHeadOverlay(GetPlayerPed(-1), overlayID, overlayIndex, overlayOpacity)
			end)
			
			if not (overlayIndex == -1) and ((overlayID == 1) or (overlayID == 2) or (overlayID == 10)) then
				ColorType = 1
			elseif not (overlayIndex == -1) and ((overlayID == 5) or (overlayID == 8)) then
				ColorType = 2
			end
			if (overlayIndex ~= -1) and (overlayID == 1) then
				TriggerEvent("FMODT:Int", "Primary " .. overlayName .. " Color", FacialHairColorIndex, 0, 63, function(cb)
					FacialHairColorIndex = cb
					SetPedHeadOverlayColor(GetPlayerPed(-1), overlayID, ColorType, FacialHairColorIndex, 0)
				end)
			elseif (overlayIndex ~= -1) and (overlayID == 2) then
				TriggerEvent("FMODT:Int", "Primary " .. overlayName .. " Color", EyebrowsColorIndex, 0, 63, function(cb)
					EyebrowsColorIndex = cb
					SetPedHeadOverlayColor(GetPlayerPed(-1), overlayID, ColorType, EyebrowsColorIndex, 0)
				end)
			elseif (overlayIndex ~= -1) and (overlayID == 10) then
				TriggerEvent("FMODT:Int", "Primary " .. overlayName .. " Color", ChestHairColorIndex, 0, 63, function(cb)
					ChestHairColorIndex = cb
					SetPedHeadOverlayColor(GetPlayerPed(-1), overlayID, ColorType, ChestHairColorIndex, 0)
				end)
			elseif (overlayIndex ~= -1) and (overlayID == 5) then
				TriggerEvent("FMODT:Int", "Primary " .. overlayName .. " Color", BlushColorIndex, 0, 63, function(cb)
					BlushColorIndex = cb
					SetPedHeadOverlayColor(GetPlayerPed(-1), overlayID, ColorType, BlushColorIndex, 0)
				end)
			elseif (overlayIndex ~= -1) and (overlayID == 8) then
				TriggerEvent("FMODT:Int", "Primary " .. overlayName .. " Color", LipstickColorIndex, 0, 63, function(cb)
					LipstickColorIndex = cb
					SetPedHeadOverlayColor(GetPlayerPed(-1), overlayID, ColorType, LipstickColorIndex, 0)
				end)
			end
			
			TriggerEvent("FMODT:Update")
			
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Component Changer (Hats)
	local componentId = 0
	local drawableId = 0
	local textureId = 0
	while true do
		drawableId = GetPedPropIndex(GetPlayerPed(-1), componentId)
		if not drawableId == -1 then
			textureId = GetPedPropTextureIndex(GetPlayerPed(-1), componentId)
		end
		if componentChangerHatsMenu then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectioncomponentChangerHatsMenu
			else
				lastSelectioncomponentChangerHatsMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~Hats")

			TriggerEvent("FMODT:Int", "Hat", drawableId, -1, GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), componentId) - 1, function(cb)
				drawableId = cb
				if drawableId == -1 then
					ClearPedProp(GetPlayerPed(-1), componentId)
				else
					textureId = 0
					SetPedPropIndex(GetPlayerPed(-1), componentId, drawableId, textureId, true)
				end
			end)
		
			TriggerEvent("FMODT:Int", "Hat Texture", textureId, 0, GetNumberOfPedPropTextureVariations(GetPlayerPed(-1), componentId, drawableId) - 1, function(cb)
				textureId = cb
				SetPedPropIndex(GetPlayerPed(-1), componentId, drawableId, textureId, true)
			end)
		
			TriggerEvent("FMODT:Update")
			
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Component Changer (Glasses)
	local componentId = 1
	local drawableId = 0
	local textureId = 0
	while true do
		drawableId = GetPedPropIndex(GetPlayerPed(-1), componentId)
		if not drawableId == -1 then
			textureId = GetPedPropTextureIndex(GetPlayerPed(-1), componentId)
		end
		if componentChangerGlassesMenu then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectioncomponentChangerGlassesMenu
			else
				lastSelectioncomponentChangerGlassesMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~Glasses")

			TriggerEvent("FMODT:Int", "Glasses", drawableId, -1, GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), componentId) - 1, function(cb)
				drawableId = cb
				if drawableId == -1 then
					ClearPedProp(GetPlayerPed(-1), componentId)
				else
					textureId = 0
					SetPedPropIndex(GetPlayerPed(-1), componentId, drawableId, textureId, true)
				end
			end)
		
			TriggerEvent("FMODT:Int", "Glasses Texture", textureId, 0, GetNumberOfPedPropTextureVariations(GetPlayerPed(-1), componentId, drawableId) - 1, function(cb)
				textureId = cb
				SetPedPropIndex(GetPlayerPed(-1), componentId, drawableId, textureId, true)
			end)
		
			TriggerEvent("FMODT:Update")
			
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Component Changer (Ears Pieces)
	local componentId = 2
	local drawableId = 0
	local textureId = 0
	while true do
		drawableId = GetPedPropIndex(GetPlayerPed(-1), componentId)
		if not drawableId == -1 then
			textureId = GetPedPropTextureIndex(GetPlayerPed(-1), componentId)
		end
		if componentChangerEarPiecesMenu then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectioncomponentChangerEarPiecesMenu
			else
				lastSelectioncomponentChangerEarPiecesMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~Ear Pieces")

			TriggerEvent("FMODT:Int", "Ear Piece", drawableId, -1, GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), componentId) - 1, function(cb)
				drawableId = cb
				if drawableId == -1 then
					ClearPedProp(GetPlayerPed(-1), componentId)
				else
					textureId = 0
					SetPedPropIndex(GetPlayerPed(-1), componentId, drawableId, textureId, true)
				end
			end)
		
			TriggerEvent("FMODT:Int", "Ear Piece Texture", textureId, 0, GetNumberOfPedPropTextureVariations(GetPlayerPed(-1), componentId, drawableId) - 1, function(cb)
				textureId = cb
				SetPedPropIndex(GetPlayerPed(-1), componentId, drawableId, textureId, true)
			end)
		
			TriggerEvent("FMODT:Update")
			
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Component Changer (Watches)
	local componentId = 3
	local drawableId = 0
	local textureId = 0
	while true do
		drawableId = GetPedPropIndex(GetPlayerPed(-1), componentId)
		if not drawableId == -1 then
			textureId = GetPedPropTextureIndex(GetPlayerPed(-1), componentId)
		end
		if componentChangerWatchesMenu then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectioncomponentChangerWatchesMenu
			else
				lastSelectioncomponentChangerWatchesMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~Watches")

			TriggerEvent("FMODT:Int", "Watch", drawableId, -1, GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), componentId) - 1, function(cb)
				drawableId = cb
				if drawableId == -1 then
					ClearPedProp(GetPlayerPed(-1), componentId)
				else
					textureId = 0
					SetPedPropIndex(GetPlayerPed(-1), componentId, drawableId, textureId, true)
				end
			end)
		
			TriggerEvent("FMODT:Int", "Watch Texture", textureId, 0, GetNumberOfPedPropTextureVariations(GetPlayerPed(-1), componentId, drawableId) - 1, function(cb)
				textureId = cb
				SetPedPropIndex(GetPlayerPed(-1), componentId, drawableId, textureId, true)
			end)
		
			TriggerEvent("FMODT:Update")
			
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Component Changer (Face)
	local componentId = 0
	local drawableId = 0
	local textureId = 0
	while true do
		drawableId = GetPedDrawableVariation(GetPlayerPed(-1), componentId)
		textureId = GetPedTextureVariation(GetPlayerPed(-1), componentId)
		if componentChangerFaceMenu then
		
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectioncomponentChangerFaceMenu
			else
				lastSelectioncomponentChangerFaceMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~Face")
			
			local drawableIdMax = GetNumberOfPedDrawableVariations(GetPlayerPed(-1), componentId) - 1

			TriggerEvent("FMODT:Int", "Face", drawableId, 0, drawableIdMax, function(cb)
				drawableId = cb
				textureId = 0
				SetPedComponentVariation(GetPlayerPed(-1), componentId, drawableId, textureId, GetPedPaletteVariation(GetPlayerPed(-1), componentId))
			end)
			
			local textureIdMax = GetNumberOfPedTextureVariations(GetPlayerPed(-1), componentId, drawableId) - 1
		
			TriggerEvent("FMODT:Int", "Face Texture", textureId, 0, textureIdMax, function(cb)
				textureId = cb
				SetPedComponentVariation(GetPlayerPed(-1), componentId, drawableId, textureId, GetPedPaletteVariation(GetPlayerPed(-1), componentId))
			end)
		
			TriggerEvent("FMODT:Update")
			
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Component Changer (Masks)
	local componentId = 1
	local drawableId = 0
	local textureId = 0
	while true do
		drawableId = GetPedDrawableVariation(GetPlayerPed(-1), componentId)
		textureId = GetPedTextureVariation(GetPlayerPed(-1), componentId)
		if componentChangerMasksMenu then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectioncomponentChangerMasksMenu
			else
				lastSelectioncomponentChangerMasksMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~Masks")

			TriggerEvent("FMODT:Int", "Mask", drawableId, 0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), componentId) - 1, function(cb)
				drawableId = cb
				textureId = 0
				SetPedComponentVariation(GetPlayerPed(-1), componentId, drawableId, textureId, GetPedPaletteVariation(GetPlayerPed(-1), componentId))
			end)
		
			TriggerEvent("FMODT:Int", "Mask Texture", textureId, 0, GetNumberOfPedTextureVariations(GetPlayerPed(-1), componentId, drawableId) - 1, function(cb)
				textureId = cb
				SetPedComponentVariation(GetPlayerPed(-1), componentId, drawableId, textureId, GetPedPaletteVariation(GetPlayerPed(-1), componentId))
			end)
		
			TriggerEvent("FMODT:Update")
			
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Component Changer (Hairs)
	local componentId = 2
	local drawableId = 0
	local textureId = 0
	while true do
		drawableId = GetPedDrawableVariation(GetPlayerPed(-1), componentId)
		textureId = GetPedTextureVariation(GetPlayerPed(-1), componentId)
		if componentChangerHairMenu then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectioncomponentChangerHairMenu
			else
				lastSelectioncomponentChangerHairMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~Hairs")

			TriggerEvent("FMODT:Int", "Hair", drawableId, 0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), componentId) - 1, function(cb)
				drawableId = cb
				textureId = 0
				SetPedComponentVariation(GetPlayerPed(-1), componentId, drawableId, textureId, GetPedPaletteVariation(GetPlayerPed(-1), componentId))
			end)
		
			TriggerEvent("FMODT:Int", "Hair Texture", textureId, 0, GetNumberOfPedTextureVariations(GetPlayerPed(-1), componentId, drawableId) - 1, function(cb)
				textureId = cb
				SetPedComponentVariation(GetPlayerPed(-1), componentId, drawableId, textureId, GetPedPaletteVariation(GetPlayerPed(-1), componentId))
			end)
		
			TriggerEvent("FMODT:Int", "Hair Color", HairColorIndex, 0, GetNumHairColors(), function(cb)
				HairColorIndex = cb
				SetPedHairColor(GetPlayerPed(-1), HairColorIndex, 0)
			end)
		
			TriggerEvent("FMODT:Update")
			
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Component Changer (Upper Body / Gloves)
	local componentId = 3
	local drawableId = 0
	local textureId = 0
	while true do
		drawableId = GetPedDrawableVariation(GetPlayerPed(-1), componentId)
		textureId = GetPedTextureVariation(GetPlayerPed(-1), componentId)
		if componentChangerUpperBodyMenu then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectioncomponentChangerUpperBodyMenu
			else
				lastSelectioncomponentChangerUpperBodyMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~Upper Body / Gloves")

			TriggerEvent("FMODT:Int", "Upper Body / Gloves", drawableId, 0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), componentId) - 1, function(cb)
				drawableId = cb
				textureId = 0
				SetPedComponentVariation(GetPlayerPed(-1), componentId, drawableId, textureId, GetPedPaletteVariation(GetPlayerPed(-1), componentId))
			end)
		
			TriggerEvent("FMODT:Int", "Upper Body / Gloves Texture", textureId, 0, GetNumberOfPedTextureVariations(GetPlayerPed(-1), componentId, drawableId) - 1, function(cb)
				textureId = cb
				SetPedComponentVariation(GetPlayerPed(-1), componentId, drawableId, textureId, GetPedPaletteVariation(GetPlayerPed(-1), componentId))
			end)
		
			TriggerEvent("FMODT:Update")
			
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Component Changer (Legs)
	local componentId = 4
	local drawableId = 0
	local textureId = 0
	while true do
		drawableId = GetPedDrawableVariation(GetPlayerPed(-1), componentId)
		textureId = GetPedTextureVariation(GetPlayerPed(-1), componentId)
		if componentChangerLegsMenu then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectioncomponentChangerLegsMenu
			else
				lastSelectioncomponentChangerLegsMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~Legs")

			TriggerEvent("FMODT:Int", "Leg", drawableId, 0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), componentId) - 1, function(cb)
				drawableId = cb
				textureId = 0
				SetPedComponentVariation(GetPlayerPed(-1), componentId, drawableId, textureId, GetPedPaletteVariation(GetPlayerPed(-1), componentId))
			end)
		
			TriggerEvent("FMODT:Int", "Leg Texture", textureId, 0, GetNumberOfPedTextureVariations(GetPlayerPed(-1), componentId, drawableId) - 1, function(cb)
				textureId = cb
				SetPedComponentVariation(GetPlayerPed(-1), componentId, drawableId, textureId, GetPedPaletteVariation(GetPlayerPed(-1), componentId))
			end)
		
			TriggerEvent("FMODT:Update")
			
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Component Changer (Parachutes)
	local componentId = 5
	local drawableId = 0
	local textureId = 0
	while true do
		drawableId = GetPedDrawableVariation(GetPlayerPed(-1), componentId)
		textureId = GetPedTextureVariation(GetPlayerPed(-1), componentId)
		if componentChangerParachutesMenu then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectioncomponentChangerParachutesMenu
			else
				lastSelectioncomponentChangerParachutesMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~Parachutes")

			TriggerEvent("FMODT:Int", "Parachute", drawableId, 0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), componentId) - 1, function(cb)
				drawableId = cb
				textureId = 0
				SetPedComponentVariation(GetPlayerPed(-1), componentId, drawableId, textureId, GetPedPaletteVariation(GetPlayerPed(-1), componentId))
			end)
		
			TriggerEvent("FMODT:Int", "Parachute Texture", textureId, 0, GetNumberOfPedTextureVariations(GetPlayerPed(-1), componentId, drawableId) - 1, function(cb)
				textureId = cb
				SetPedComponentVariation(GetPlayerPed(-1), componentId, drawableId, textureId, GetPedPaletteVariation(GetPlayerPed(-1), componentId))
			end)
		
			TriggerEvent("FMODT:Update")
			
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Component Changer (Shoes)
	local componentId = 6
	local drawableId = 0
	local textureId = 0
	while true do
		drawableId = GetPedDrawableVariation(GetPlayerPed(-1), componentId)
		textureId = GetPedTextureVariation(GetPlayerPed(-1), componentId)
		if componentChangerShoesMenu then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectioncomponentChangerShoesMenu
			else
				lastSelectioncomponentChangerShoesMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~Shoes")

			TriggerEvent("FMODT:Int", "Shoes", drawableId, 0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), componentId) - 1, function(cb)
				drawableId = cb
				textureId = 0
				SetPedComponentVariation(GetPlayerPed(-1), componentId, drawableId, textureId, GetPedPaletteVariation(GetPlayerPed(-1), componentId))
			end)
		
			TriggerEvent("FMODT:Int", "Shoes Texture", textureId, 0, GetNumberOfPedTextureVariations(GetPlayerPed(-1), componentId, drawableId) - 1, function(cb)
				textureId = cb
				SetPedComponentVariation(GetPlayerPed(-1), componentId, drawableId, textureId, GetPedPaletteVariation(GetPlayerPed(-1), componentId))
			end)
		
			TriggerEvent("FMODT:Update")
			
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Component Changer (Ties, Scarfs, etc.)
	local componentId = 7
	local drawableId = 0
	local textureId = 0
	while true do
		drawableId = GetPedDrawableVariation(GetPlayerPed(-1), componentId)
		textureId = GetPedTextureVariation(GetPlayerPed(-1), componentId)
		if componentChangerTiesScarfsetcMenu then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectioncomponentChangerTiesScarfsetcMenu
			else
				lastSelectioncomponentChangerTiesScarfsetcMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~Ties, Scarfs, etc.")

			TriggerEvent("FMODT:Int", "Tie, Scarf...", drawableId, 0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), componentId) - 1, function(cb)
				drawableId = cb
				textureId = 0
				SetPedComponentVariation(GetPlayerPed(-1), componentId, drawableId, textureId, GetPedPaletteVariation(GetPlayerPed(-1), componentId))
			end)
		
			TriggerEvent("FMODT:Int", "Tie, Scarf... Texture", textureId, 0, GetNumberOfPedTextureVariations(GetPlayerPed(-1), componentId, drawableId) - 1, function(cb)
				textureId = cb
				SetPedComponentVariation(GetPlayerPed(-1), componentId, drawableId, textureId, GetPedPaletteVariation(GetPlayerPed(-1), componentId))
			end)
		
			TriggerEvent("FMODT:Update")
			
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Component Changer (Undershirts)
	local componentId = 8
	local drawableId = 0
	local textureId = 0
	while true do
		drawableId = GetPedDrawableVariation(GetPlayerPed(-1), componentId)
		textureId = GetPedTextureVariation(GetPlayerPed(-1), componentId)
		if componentChangerUndershirtsMenu then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectioncomponentChangerUndershirtsMenu
			else
				lastSelectioncomponentChangerUndershirtsMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~Undershirts")

			TriggerEvent("FMODT:Int", "Undershirt", drawableId, 0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), componentId) - 1, function(cb)
				drawableId = cb
				textureId = 0
				SetPedComponentVariation(GetPlayerPed(-1), componentId, drawableId, textureId, GetPedPaletteVariation(GetPlayerPed(-1), componentId))
			end)
		
			TriggerEvent("FMODT:Int", "Undershirt Texture", textureId, 0, GetNumberOfPedTextureVariations(GetPlayerPed(-1), componentId, drawableId) - 1, function(cb)
				textureId = cb
				SetPedComponentVariation(GetPlayerPed(-1), componentId, drawableId, textureId, GetPedPaletteVariation(GetPlayerPed(-1), componentId))
			end)
		
			TriggerEvent("FMODT:Update")
			
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Component Changer (Armor)
	local componentId = 9
	local drawableId = 0
	local textureId = 0
	while true do
		drawableId = GetPedDrawableVariation(GetPlayerPed(-1), componentId)
		textureId = GetPedTextureVariation(GetPlayerPed(-1), componentId)
		if componentChangerArmorMenu then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectioncomponentChangerArmorMenu
			else
				lastSelectioncomponentChangerArmorMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~Armor")

			TriggerEvent("FMODT:Int", "Armor", drawableId, 0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), componentId) - 1, function(cb)
				drawableId = cb
				textureId = 0
				SetPedComponentVariation(GetPlayerPed(-1), componentId, drawableId, textureId, GetPedPaletteVariation(GetPlayerPed(-1), componentId))
			end)
		
			TriggerEvent("FMODT:Int", "Armor Texture", textureId, 0, GetNumberOfPedTextureVariations(GetPlayerPed(-1), componentId, drawableId) - 1, function(cb)
				textureId = cb
				SetPedComponentVariation(GetPlayerPed(-1), componentId, drawableId, textureId, GetPedPaletteVariation(GetPlayerPed(-1), componentId))
			end)
		
			TriggerEvent("FMODT:Update")
			
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Component Changer (Emblemes)
	local componentId = 10
	local drawableId = 0
	local textureId = 0
	while true do
		drawableId = GetPedDrawableVariation(GetPlayerPed(-1), componentId)
		textureId = GetPedTextureVariation(GetPlayerPed(-1), componentId)
		if componentChangerEmblemesMenu then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectioncomponentChangerEmblemesMenu
			else
				lastSelectioncomponentChangerEmblemesMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~Emblemes")

			TriggerEvent("FMODT:Int", "Embleme", drawableId, 0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), componentId) - 1, function(cb)
				drawableId = cb
				textureId = 0
				SetPedComponentVariation(GetPlayerPed(-1), componentId, drawableId, textureId, GetPedPaletteVariation(GetPlayerPed(-1), componentId))
			end)
		
			TriggerEvent("FMODT:Int", "Embleme Texture", textureId, 0, GetNumberOfPedTextureVariations(GetPlayerPed(-1), componentId, drawableId) - 1, function(cb)
				textureId = cb
				SetPedComponentVariation(GetPlayerPed(-1), componentId, drawableId, textureId, GetPedPaletteVariation(GetPlayerPed(-1), componentId))
			end)
		
			TriggerEvent("FMODT:Update")
			
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Component Changer (Tops)
	local componentId = 11
	local drawableId = 0
	local textureId = 0
	while true do
		drawableId = GetPedDrawableVariation(GetPlayerPed(-1), componentId)
		textureId = GetPedTextureVariation(GetPlayerPed(-1), componentId)
		if componentChangerTopsMenu then
			
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectioncomponentChangerTopsMenu
			else
				lastSelectioncomponentChangerTopsMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~Tops")

			TriggerEvent("FMODT:Int", "Top", drawableId, 0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), componentId) - 1, function(cb)
				drawableId = cb
				textureId = 0
				SetPedComponentVariation(GetPlayerPed(-1), componentId, drawableId, textureId, GetPedPaletteVariation(GetPlayerPed(-1), componentId))
			end)
		
			TriggerEvent("FMODT:Int", "Top Texture", textureId, 0, GetNumberOfPedTextureVariations(GetPlayerPed(-1), componentId, drawableId) - 1, function(cb)
				textureId = cb
				SetPedComponentVariation(GetPlayerPed(-1), componentId, drawableId, textureId, GetPedPaletteVariation(GetPlayerPed(-1), componentId))
			end)
		
			TriggerEvent("FMODT:Update")
			
		end

		Citizen.Wait(0)
	end
end)


godmode = false; godmodeCount = 0; playerVisible = true; playerVisibleCount = 1; nowantedlevel = false; nowantedlevelCount = 0
superjump = false; stamina = false; supermanmode = false; WantedLevel = 0; maxWantedLevel = 5; Run = 1.0; Swim = 1.0
local animPlay, animDict, animName, pistol, changePedByName, mChar, fChar, skin

Citizen.CreateThread(function() --Player Menu
	while true do
		local playerPed = GetPlayerPed(-1)
		if (playerMenu) then
		
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionplayerMenu
			else
				lastSelectionplayerMenu = currentOption
			end
		
			TriggerEvent("FMODT:Title", "~y~ " .. PlayerMenuTitle)

			TriggerEvent("FMODT:Option", ArmorHealWashTitle, function(cb)
				if (cb) then
					SetPedArmour(playerPed, 100)
					SetEntityHealth(playerPed, 200)
					ClearPedBloodDamage(playerPed)
					ResetPedVisibleDamage(playerPed)
					ClearPedLastWeaponDamage(playerPed)
					drawNotification("~g~" .. ArmorHealWashMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. AnimationsTitle .. "", function(cb)
				if (cb) then
					playerMenu = false
					animationMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. ChangePedTitle .. "", function(cb)
				if (cb) then
					playerMenu = false
					skinMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. ComponentChangerTitle .. "", function(cb)
				if (cb) then
					playerMenu = false
					componentChangerMenu = true
				end
			end)

			TriggerEvent("FMODT:Bool", PlayerGodmodeTitle, godmode, function(cb)
				godmode = cb
				if godmode then
					godmodeCount = 1
					SetPedArmour(playerPed, 100)
					SetEntityHealth(playerPed, 200)
					drawNotification("~g~" .. PlayerGodmodeEnableMessage .. "!")
				else
					godmodeCount = 0
					drawNotification("~r~" .. PlayerGodmodeDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Bool", InfiniteStaminaTitle, stamina, function(cb)
				stamina = cb
				if stamina then
					drawNotification("~g~" .. InfiniteStaminaEnableMessage .. "!")
				else
					drawNotification("~r~" .. InfiniteStaminaDisableMessage .. "!")
				end
			end)

			if IsUsingSteam then
				TriggerEvent("FMODT:Option", "~y~>> ~s~" .. OutfitsTitle .. "", function(cb)
					if (cb) then
						playerMenu = false
						outfitMenu = true
					end
				end)
			end

			TriggerEvent("FMODT:Float", RunSpeedMultiplierTitle, Run, 1.0, 2.0, 0.1, 1, function(cb) --Run Speed Multiplier
				Run = cb
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. ScenariosTitle .. "", function(cb)
				if (cb) then
					playerMenu = false
					scenarioMenu = true
				end
			end)

			TriggerEvent("FMODT:Bool", SuperJumpTitle, superjump, function(cb)
				superjump = cb
				if superjump then
					drawNotification("~g~" .. SuperJumpEnableMessage .. "!")
				else
					drawNotification("~r~" .. SuperJumpDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Option", "Suicide", function(cb)
				if (cb) then
					SetEntityHealth(playerPed, 0)
				end
			end)

			TriggerEvent("FMODT:Bool", SupermanModeTitle, supermanmode, function(cb)
				supermanmode = cb
				if supermanmode then
					drawNotification("~g~" .. SupermanModeEnableMessage .. "!")
				else
					drawNotification("~r~" .. SupermanModeDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Float", SwimSpeedMultiplierTitle, Swim, 1.0, 2.0, 0.1, 2, function(cb) --Swim Speed Multiplier
				Swim = cb
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. WantedLevelTitle .. "", function(cb)
				if (cb) then
					playerMenu = false
					wantedMenu = true
				end
			end)

			TriggerEvent("FMODT:Bool", PlayerVisibleTitle, playerVisible, function(cb)
				playerVisible = cb
				if playerVisible then
					playerVisibleCount = 1
					drawNotification("~g~" .. PlayerVisibleEnableMessage .. "!")
				else
					playerVisibleCount = 0
					drawNotification("~r~" .. PlayerVisibleDisableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Animation Menu						[Multiple Pages]
	while true do
		if (animationMenu) then
		
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionanimationMenu
			else
				lastSelectionanimationMenu = currentOption
			end

			TriggerEvent("FMODT:Title", "~y~" .. AnimationsTitle .. "")

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. SexActsTitle .. "", function(cb)
				if (cb) then
					animationMenu = false
					sexactAnimationMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. StripsTitle .. "", function(cb)
				if (cb) then
					animationMenu = false
					stripAnimationMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. SuicideTitle .. "", function(cb)
				if (cb) then
					animationMenu = false
					suicideAnimationMenu = true
				end
			end)

			TriggerEvent("FMODT:Update")
			
		elseif (sexactAnimationMenu) then
		
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionsexactAnimationMenu
			else
				lastSelectionsexactAnimationMenu = currentOption
			end

			TriggerEvent("FMODT:Title", "~y~" .. SexActsTitle .. "")

			TriggerEvent("FMODT:Option", StopSexActsTitle, function(cb)
				if (cb) then
					ClearPedTasksImmediately(GetPlayerPed(-1))
				end
			end)

			TriggerEvent("FMODT:Option", AnalFuckedTitle, function(cb)
				if (cb) then
					animDict = "rcmpaparazzo_2"
					animName = "shag_loop_poppy"
					animPlay = true
				end
			end)

			TriggerEvent("FMODT:Option", AnalFuckerTitle, function(cb)
				if (cb) then
					animDict = "rcmpaparazzo_2"
					animName = "shag_loop_a"
					animPlay = true
				end
			end)

			TriggerEvent("FMODT:Option", CarBJGetterTitle, function(cb)
				if (cb) then
					animDict = "mini@prostitutes@sexnorm_veh"
					animName = "bj_loop_male"
					animPlay = true
				end
			end)

			TriggerEvent("FMODT:Option", CarBJGiverTitle, function(cb)
				if (cb) then
					animDict = "mini@prostitutes@sexnorm_veh"
					animName = "bj_loop_prostitute"
					animPlay = true
				end
			end)

			TriggerEvent("FMODT:Option", CarSexGetterTitle, function(cb)
				if (cb) then
					animDict = "mini@prostitutes@sexnorm_veh"
					animName = "sex_loop_male"
					animPlay = true
				end
			end)

			TriggerEvent("FMODT:Option", CarSexGiverTitle, function(cb)
				if (cb) then
					animDict = "mini@prostitutes@sexnorm_veh"
					animName = "sex_loop_prostitute"
					animPlay = true
				end
			end)

			TriggerEvent("FMODT:Update")
			
		elseif (stripAnimationMenu) then
		
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionstripAnimationMenu
			else
				lastSelectionstripAnimationMenu = currentOption
			end

			TriggerEvent("FMODT:Title", "~y~" .. StripsTitle .. "")

			TriggerEvent("FMODT:Option", StopStripTitle, function(cb)
				if (cb) then
					ClearPedTasksImmediately(GetPlayerPed(-1))
				end
			end)

			TriggerEvent("FMODT:Option", PoleDance1Title, function(cb)
				if (cb) then
					animDict = "mini@strip_club@pole_dance@pole_dance1"
					animName = "pd_dance_01"
					animPlay = true
				end
			end)

			TriggerEvent("FMODT:Option", PoleDance2Title, function(cb)
				if (cb) then
					animDict = "mini@strip_club@pole_dance@pole_dance2"
					animName = "pd_dance_02"
					animPlay = true
				end
			end)

			TriggerEvent("FMODT:Option", PoleDance3Title, function(cb)
				if (cb) then
					animDict = "mini@strip_club@pole_dance@pole_dance3"
					animName = "pd_dance_03"
					animPlay = true
				end
			end)

			TriggerEvent("FMODT:Option", LapDanceTitle, function(cb)
				if (cb) then
					animDict = "mp_am_stripper"
					animName = "lap_dance_girl"
					animPlay = true
				end
			end)

			TriggerEvent("FMODT:Option", PrivateDanceTitle, function(cb)
				if (cb) then
					animDict = "mini@strip_club@private_dance@part1"
					animName = "priv_dance_p1"
					animPlay = true
				end
			end)

			TriggerEvent("FMODT:Update")
			
		elseif (suicideAnimationMenu) then
		
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionsuicideAnimationMenu
			else
				lastSelectionsuicideAnimationMenu = currentOption
			end

			TriggerEvent("FMODT:Title", "~y~" .. SuicideTitle .. "")

			TriggerEvent("FMODT:Option", StopSuicideTitle, function(cb)
				if (cb) then
					ClearPedTasksImmediately(GetPlayerPed(-1))
					SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("WEAPON_UNARMED"), true)
				end
			end)

			TriggerEvent("FMODT:Option", PillSuicideTitle, function(cb)
				if (cb) then
					animDict = "mp_suicide"
					animName = "pill"
					animPlay = true
				end
			end)

			TriggerEvent("FMODT:Option", PistolSuicideTitle, function(cb)
				if (cb) then
					animDict = "mp_suicide"
					animName = "pistol"
					animPlay = true
					pistol = true
				end
			end)

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Skin Menu								[Multiple Pages]
	while true do
		if (skinMenu) then
		
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionskinMenu
			else
				lastSelectionskinMenu = currentOption
			end

			TriggerEvent("FMODT:Title", "~y~" .. ChangePedTitle .. "")

			TriggerEvent("FMODT:Option",  ChangePedByNameTitle, function(cb)
				if (cb) then
					changePedByName = true
				end
			end)

--[[ Currently disabled, because dying animals crash the lobby

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. AnimalsTitle .. "", function(cb)
				if (cb) then
					skinMenu = false
					animalSkinMenu1 = true
				end
			end)
			
]]
			
			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. FemalePedsTitle .. "", function(cb)
				if (cb) then
					skinMenu = false
					femalePedSkinMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. MalePedsTitle .. "", function(cb)
				if (cb) then
					skinMenu = false
					malePedSkinMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. PlayerPedsTitle .. "", function(cb)
				if (cb) then
					skinMenu = false
					playerPedSkinMenu = true
				end
			end)

			TriggerEvent("FMODT:Update")
			
		elseif (animalSkinMenu1) then
		
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionanimalSkinMenu1
			else
				lastSelectionanimalSkinMenu1 = currentOption
			end

			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					animalSkinMenu1 = false
					animalSkinMenu2 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					animalSkinMenu1 = false
					animalSkinMenu2 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. AnimalsTitle .. "")

			TriggerEvent("FMODT:Option", BoarTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_boar")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", CatTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_cat_01")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", ChickenhawkTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_chickenhawk")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", ChimpTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_chimp")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", ChopTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_chop")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", CormorantTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_cormorant")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", CowTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_cow")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", CoyoteTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_coyote")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", CrowTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_crow")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", DeerTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_deer")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", DolphinTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_dolphin")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", FishTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_fish")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", HenTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_hen")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", HammerheadSharkTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_sharkhammer")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", HumpbackTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_humpback")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", HuskyTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_husky")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", KillerWhaleTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_killerwhale")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", MountainLionTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_mtlion")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", PigTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_pig")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", PigeonTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_pigeon")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 1", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 1")
				end
			end)

			TriggerEvent("FMODT:Update")
			
		elseif (animalSkinMenu2) then
		
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionanimalSkinMenu2
			else
				lastSelectionanimalSkinMenu2 = currentOption
			end

			if not FloatIntArray then
				if IsDisabledControlJustReleased(1, 174)then
					animalSkinMenu2 = false
					animalSkinMenu1 = true
				elseif IsDisabledControlJustReleased(1, 175)then
					animalSkinMenu2 = false
					animalSkinMenu1 = true
				end
			end
		
			TriggerEvent("FMODT:Title", "~y~" .. AnimalsTitle .. "")

			TriggerEvent("FMODT:Option", PoodleTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_poodle")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", PugTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_pug")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", RabbitTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_rabbit_01")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", RatTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_rat")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", RetrieverTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_retriever")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", RhesusTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_rhesus")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", RottweilerTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_rottweiler")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", SeagullTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_seagull")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", ShepherdTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_shepherd")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", StingrayTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_stingray")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", TigerSharkTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_sharktiger")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", WestyTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_c_westy")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", "~r~" .. PageIndicator .. " 2", function(cb)
				if (cb) then
					drawNotification("~r~" .. PageIndicator .. " 2")
				end
			end)

			TriggerEvent("FMODT:Update")
			
		elseif (femalePedSkinMenu) then

			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionfemalePedSkinMenu
			else
				lastSelectionfemalePedSkinMenu = currentOption
			end

			TriggerEvent("FMODT:Title", "~y~" .. FemalePedsTitle .. "")

			TriggerEvent("FMODT:Option", BusinessFemaleTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_f_m_business_02")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", CopFemaleTitle, function(cb)
				if (cb) then
					skin = GetHashKey("s_f_y_cop_01")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", EpsilonFemaleTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_f_y_epsilon_01")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", FattyFemaleTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_f_m_fatwhite_01")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", GolferFemaleTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_f_y_golfer_01")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", HipsterFemaleTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_f_y_hipster_01")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", Hooker1Title, function(cb)
				if (cb) then
					skin = GetHashKey("s_f_y_hooker_01")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", Hooker2Title, function(cb)
				if (cb) then
					skin = GetHashKey("s_f_y_hooker_02")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", Hooker3Title, function(cb)
				if (cb) then
					skin = GetHashKey("s_f_y_hooker_03")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", MaidTitle, function(cb)
				if (cb) then
					skin = GetHashKey("s_f_m_maid_01")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", RangerFemaleTitle, function(cb)
				if (cb) then
					skin = GetHashKey("s_f_y_ranger_01")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", SheriffFemaleTitle, function(cb)
				if (cb) then
					skin = GetHashKey("s_f_y_sheriff_01")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", Stripper1Title, function(cb)
				if (cb) then
					skin = GetHashKey("s_f_y_stripper_01")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", Stripper2Title, function(cb)
				if (cb) then
					skin = GetHashKey("s_f_y_stripper_02")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Update")
			
		elseif (malePedSkinMenu) then
		
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionmalePedSkinMenu
			else
				lastSelectionmalePedSkinMenu = currentOption
			end

			TriggerEvent("FMODT:Title", "~y" .. MalePedsTitle .. "")

			TriggerEvent("FMODT:Option", BusinessMaleTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_m_m_business_01")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", CopMaleTitle, function(cb)
				if (cb) then
					skin = GetHashKey("s_m_y_cop_01")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", EpsilonMaleTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_m_y_epsilon_01")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", FattyMaleTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_m_m_fatlatin_01")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", FiremanTitle, function(cb)
				if (cb) then
					skin = GetHashKey("s_m_y_fireman_01")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", GolferMaleTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_m_m_golfer_01")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", HighwayCopTitle, function(cb)
				if (cb) then
					skin = GetHashKey("s_m_y_hwaycop_01")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", HipsterMaleTitle, function(cb)
				if (cb) then
					skin = GetHashKey("a_m_y_hipster_01")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", PrisonerTitle, function(cb)
				if (cb) then
					skin = GetHashKey("s_m_y_prisoner_01")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", Marine1Title, function(cb)
				if (cb) then
					skin = GetHashKey("s_m_y_marine_01")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", Marine2Title, function(cb)
				if (cb) then
					skin = GetHashKey("s_m_y_marine_02")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", Marine3Title, function(cb)
				if (cb) then
					skin = GetHashKey("s_m_y_marine_03")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", RangerMaleTitle, function(cb)
				if (cb) then
					skin = GetHashKey("s_m_y_ranger_01")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", SheriffMaleTitle, function(cb)
				if (cb) then
					skin = GetHashKey("s_m_y_sheriff_01")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Update")
			
		elseif (playerPedSkinMenu) then
		
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionplayerPedSkinMenu
			else
				lastSelectionplayerPedSkinMenu = currentOption
			end

			TriggerEvent("FMODT:Title", "~y~" .. PlayerPedsTitle .. "")

			TriggerEvent("FMODT:Option", MPCharacterFemaleTitle, function(cb)
				if (cb) then
					skin = GetHashKey("mp_f_freemode_01")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", MPCharacterMaleTitle, function(cb)
				if (cb) then
					skin = GetHashKey("mp_m_freemode_01")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", FranklinTitle, function(cb)
				if (cb) then
					skin = GetHashKey("player_one")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", MichaelTitle, function(cb)
				if (cb) then
					skin = GetHashKey("player_zero")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Option", TrevorTitle, function(cb)
				if (cb) then
					skin = GetHashKey("player_two")
					skinChanging = true
				end
			end)

			TriggerEvent("FMODT:Update")
		end
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Scenarios Menu						[Multiple Pages]
	while true do
		if (scenarioMenu) then
		
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionscenarioMenu
			else
				lastSelectionscenarioMenu = currentOption
			end

			TriggerEvent("FMODT:Title", "~y~" .. ScenariosTitle .. "")

			TriggerEvent("FMODT:Option", StopScenariosTitle, function(cb)
				if (cb) then
					ClearPedTasksImmediately(GetPlayerPed(-1))
				end
			end)

			TriggerEvent("FMODT:Option", "~y~>> ~s~" .. MalePedScenariosTitle .. "", function(cb)
				if (cb) then
					scenarioMenu = false
					maleScenarioMenu = true
				end
			end)

			TriggerEvent("FMODT:Option", BinocularsTitle, function(cb)
				if (cb) then
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_BINOCULARS", 0, false)
				end
			end)

			TriggerEvent("FMODT:Option", CheeringTitle, function(cb)
				if (cb) then
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_CHEERING", 0, false)
				end
			end)

			TriggerEvent("FMODT:Option", DrillTitle, function(cb)
				if (cb) then
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_CONST_DRILL", 0, false)
				end
			end)

			TriggerEvent("FMODT:Option", DrinkingSomeCovfefeTitle, function(cb)
				if (cb) then
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_DRINKING", 0, false)
				end
			end)

			TriggerEvent("FMODT:Option", FilmingTitle, function(cb)
				if (cb) then
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_MOBILE_FILM_SHOCKING", 0, false)
				end
			end)

			TriggerEvent("FMODT:Option", FishingTitle, function(cb)
				if (cb) then
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_STAND_FISHING", 0, false)
				end
			end)

			TriggerEvent("FMODT:Option", HammeringTitle, function(cb)
				if (cb) then
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_HAMMERING", 0, false)
				end
			end)

			TriggerEvent("FMODT:Option", JanitorTitle, function(cb)
				if (cb) then
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_JANITOR", 0, false)
				end
			end)

			TriggerEvent("FMODT:Option", TouristTitle, function(cb)
				if (cb) then
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_TOURIST_MAP", 0, false)
				end
			end)

			TriggerEvent("FMODT:Option", WeedSmokingTitle, function(cb)
				if (cb) then
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING_POT", 0, false)
				end
			end)

			TriggerEvent("FMODT:Option", WeightliftingTitle, function(cb)
				if (cb) then
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS", 0, false)
				end
			end)

			TriggerEvent("FMODT:Option", WeldingTitle, function(cb)
				if (cb) then
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_WELDING", 0, false)
				end
			end)

			TriggerEvent("FMODT:Option", YogaTitle, function(cb)
				if (cb) then
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_YOGA", 0, false)
				end
			end)

			TriggerEvent("FMODT:Update")
			
		elseif (maleScenarioMenu) then
		
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionmaleScenarioMenu
			else
				lastSelectionmaleScenarioMenu = currentOption
			end

			TriggerEvent("FMODT:Title", "~y~" .. MalePedScenariosTitle .. "")

			TriggerEvent("FMODT:Option", StopScenariosTitle, function(cb)
				if (cb) then
					ClearPedTasksImmediately(GetPlayerPed(-1))
				end
			end)

			TriggerEvent("FMODT:Option", BBQTitle, function(cb)
				if (cb) then
					if IsPedMale(GetPlayerPed(-1)) then
						TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_BBQ", 0, false)
						else
						drawNotification("~r~Only Works With Male Peds!")
					end
				end
			end)

			TriggerEvent("FMODT:Option", CarParkAttendantTitle, function(cb)
				if (cb) then
					if IsPedMale(GetPlayerPed(-1)) then
						TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_CAR_PARK_ATTENDANT", 0, false)
						else
						drawNotification("~r~Only Works With Male Peds!")
					end
				end
			end)

			TriggerEvent("FMODT:Option", GolfTitle, function(cb)
				if (cb) then
					if IsPedMale(GetPlayerPed(-1)) then
						TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_GOLF_PLAYER", 0, false)
						else
						drawNotification("~r~Only Works With Male Peds!")
					end
				end
			end)

			TriggerEvent("FMODT:Option", MusicianTitle, function(cb)
				if (cb) then
					if IsPedMale(GetPlayerPed(-1)) then
						TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_MUSICIAN", 0, false)
						else
						drawNotification("~r~Only Works With Male Peds!")
					end
				end
			end)

			TriggerEvent("FMODT:Option", PaparazziTitle, function(cb)
				if (cb) then
					if IsPedMale(GetPlayerPed(-1)) then
						TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_PAPARAZZI", 0, false)
						else
						drawNotification("~r~Only Works With Male Peds!")
					end
				end
			end)

			TriggerEvent("FMODT:Option", PushUpsTitle, function(cb)
				if (cb) then
					if IsPedMale(GetPlayerPed(-1)) then
						TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_PUSH_UPS", 0, false)
						else
						drawNotification("~r~Only Works With Male Peds!")
					end
				end
			end)

			TriggerEvent("FMODT:Option", SitUpsTitle, function(cb)
				if (cb) then
					if IsPedMale(GetPlayerPed(-1)) then
						TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_SIT_UPS", 0, false)
						else
						drawNotification("~r~Only Works With Male Peds!")
					end
				end
			end)

			TriggerEvent("FMODT:Update")
		end
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Wanted Menu
	while true do
		wanted = GetPlayerWantedLevel(PlayerId())
		maxWantedLevel = GetMaxWantedLevel()
		if (wantedMenu) then
		
			if not IsDisabledControlPressed(1, 173) and not IsDisabledControlPressed(1, 172) then
				currentOption = lastSelectionwantedMenu
			else
				lastSelectionwantedMenu = currentOption
			end

			TriggerEvent("FMODT:Title", "~y~" .. WantedLevelTitle .. "")

			TriggerEvent("FMODT:Option", ClearWantedLevelTitle, function(cb)
				if (cb) then
					if nowantedlevel then
						drawNotification("~r~" .. ClearWantedLevelMessage1 .. "!")
					else
						SetPlayerWantedLevel(PlayerId(), 0, false)
						SetPlayerWantedLevelNow(PlayerId(), 0)
						drawNotification("~g~" .. ClearWantedLevelMessage2 .. "!")
					end
				end
			end)

			TriggerEvent("FMODT:Bool", DisableWantedLevelTitle, nowantedlevel, function(cb)
				nowantedlevel = cb
				if nowantedlevel then
					nowantedlevelCount = 1
					drawNotification("~g~" .. DisableWantedLevelDisableMessage .. "!")
				else
					nowantedlevelCount = 0
					drawNotification("~r~" .. DisableWantedLevelEnableMessage .. "!")
				end
			end)

			TriggerEvent("FMODT:Int", MaximumWantedLevelTitle, maxWantedLevel, 0, 5, function(cb)
				maxWantedLevel = cb
				SetMaxWantedLevel(maxWantedLevel)
			end)

			TriggerEvent("FMODT:Int", SetWantedLevelTitle, WantedLevel, 0, 5, function(cb)
				WantedLevel = cb
				if nowantedlevel then
					drawNotification("~r~" .. SetWantedLevelMessage .. "!")
				else
					SetPlayerWantedLevel(PlayerId(), WantedLevel, false)
					SetPlayerWantedLevelNow(PlayerId(), WantedLevel)
				end
			end)

			TriggerEvent("FMODT:Update")
		end

		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function() --Godmode
	while true do
		Citizen.Wait(0)
		if allowed then
			if godmode then
				SetEntityInvincible(GetPlayerPed(-1), true)
				SetPlayerInvincible(PlayerId(), true)
				SetPedCanRagdoll(GetPlayerPed(-1), false)
				ClearPedBloodDamage(GetPlayerPed(-1))
				ResetPedVisibleDamage(GetPlayerPed(-1))
				ClearPedLastWeaponDamage(GetPlayerPed(-1))
				SetEntityProofs(GetPlayerPed(-1), true, true, true, true, true, true, true, true)
				SetEntityCanBeDamaged(GetPlayerPed(-1), false)
			else
				SetEntityInvincible(GetPlayerPed(-1), false)
				SetPlayerInvincible(PlayerId(), false)
				SetPedCanRagdoll(GetPlayerPed(-1), true)
				SetEntityProofs(GetPlayerPed(-1), false, false, false, false, false, false, false, false)
				SetEntityCanBeDamaged(GetPlayerPed(-1), true)
			end
		end
	end
end)

Citizen.CreateThread(function() --Visible
	while true do
		Citizen.Wait(0)
		if allowed then
			SetEntityVisible(GetPlayerPed(-1), playerVisible, 1)
		end
	end
end)

Citizen.CreateThread(function() --Infinite Stamina
	while true do
		Citizen.Wait(0)
		if stamina and allowed then
			RestorePlayerStamina(PlayerId(), 1.0)
		end
	end
end)

Citizen.CreateThread(function() --Disable Wanted Level
	while true do
		Citizen.Wait(0)
		if nowantedlevel and allowed then
			ClearPlayerWantedLevel(PlayerId())
			SetPlayerWantedLevel(PlayerId(), 0, false)
			SetPlayerWantedLevelNow(PlayerId(), 0)
		end
	end
end)

Citizen.CreateThread(function() --Animation Play
	while true do
		Citizen.Wait(0)
		if animPlay and allowed then
			SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("WEAPON_UNARMED"), true)
			RequestAnimDict(animDict)
			while not HasAnimDictLoaded(animDict) do
				Citizen.Wait(0)
			end
			if pistol then
				GiveWeaponToPed(playerPed, GetHashKey("WEAPON_PISTOL"), 99999, false, false)
				SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_PISTOL"), true)
				pistol = false
			end
			TaskPlayAnim(GetPlayerPed(-1), animDict, animName, 8.0, 0.0, -1, 9, 0, 0, 0, 0)
			drawNotification("~g~Animation Started!")
			animPlay = false
		end
	end
end)

Citizen.CreateThread(function() --Skin Changing
	while true do
		Citizen.Wait(0)
		if skin and allowed then
			if IsModelInCdimage(skin) and IsModelValid(skin) then
				RequestModel(skin)
				while not HasModelLoaded(skin) do
					Citizen.Wait(0)
				end
				SetPlayerModel(PlayerId(), skin)
				drawNotification("~g~" .. ChangePedMessage .. "!")
			else
				drawNotification("~r~" .. PedNotExistingMessage .. "!")
			end
			if (skin == GetHashKey("mp_m_freemode_01")) then
				mChar = true
			elseif (skin == GetHashKey("mp_f_freemode_01")) then
				fChar = true
			end
			SetModelAsNoLongerNeeded(skin)
			skin = nil
		end
	end
end)

Citizen.CreateThread(function() --Fast Run
	while true do
		Citizen.Wait(0)
		if allowed then
			SetPedMoveRateOverride(GetPlayerPed(-1), Run)
			if Run > 1.49 then
				SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
			else
				SetRunSprintMultiplierForPlayer(PlayerId(), Run)
			end
		end
	end
end)

Citizen.CreateThread(function() --Fast Swim
	while true do
		Citizen.Wait(0)
		if allowed then
			if Swim > 1.49 then
				SetSwimMultiplierForPlayer(PlayerId(), 1.49)
			else
				SetSwimMultiplierForPlayer(PlayerId(), Swim)
			end
		end
	end
end)

Citizen.CreateThread(function() --Enable Super Jump
	while true do
		Citizen.Wait(0)
		if superjump and allowed then
			SetSuperJumpThisFrame(PlayerId())
		end
	end
end)

Citizen.CreateThread(function() --Superman Mode
	while true do
		Wait(1)
		
		local coords = Citizen.InvokeNative(0x0A794A5A57F8DF91, GetPlayerPed(-1), Citizen.ResultAsVector())
		local SupermanZ
		if IsControlPressed(1, 33) then
			SupermanZ = 5.0
		else
			SupermanZ = 0.225
		end
		
		if supermanmode and allowed then
			GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("gadget_parachute"), 1, false, false)
			if IsPedInParachuteFreeFall(GetPlayerPed(-1)) then
				ApplyForceToEntity(GetPlayerPed(-1), 1, coords.x * 2, coords.y * 2, SupermanZ, 0.0, 0.0, 0.0, 1, false, true, true, true, true)
			end
		end
	end
end)

Citizen.CreateThread(function() --Making Some Animals Visible
	while true do
		Citizen.Wait(0)

		if (IsPedHuman(GetPlayerPed(-1)) == false) and allowed then
			SetPedComponentVariation(GetPlayerPed(-1), 0, 0, 0, 0)
		end
	end
end)

Citizen.CreateThread(function() --Making MP Character Visible
	while true do
		Citizen.Wait(0)

		if mChar and allowed then
			SetPedHeadBlendData(GetPlayerPed(-1), 4, 4, 0, 4, 4, 0, 1.0, 1.0, 0.0, false)
			SetPedComponentVariation(GetPlayerPed(-1), 2, 2, 4, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 3, 1, 0, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 4, 33, 0, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 5, 45, 0, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 6, 25, 0, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 8, 56, 1, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 11, 49, 0, 0)
			mChar = false
		elseif fChar and allowed then
			SetPedHeadBlendData(GetPlayerPed(-1), 25, 25, 0, 25, 25, 0, 1.0, 1.0, 0.0, false)
			SetPedComponentVariation(GetPlayerPed(-1), 2, 13, 3, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 3, 3, 0, 0)
			SetPedComponentVariation(GetPlayerPed(-1))
			SetPedComponentVariation(GetPlayerPed(-1), 5, 45, 0, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 6, 25, 0, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 8, 33, 1, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 11, 42, 0, 0)
			fChar = false
		end
	end
end)

Citizen.CreateThread(function() --Change Ped By Name
	while true do
		Citizen.Wait(0)
		if changePedByName then
			DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "", "", "", "", 25)
			blockinput = true

			while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
				Citizen.Wait(0)
			end
			if UpdateOnscreenKeyboard() ~= 2 then
				local result = GetOnscreenKeyboardResult()
				skin = GetHashKey(string.upper(result))
				Citizen.Wait(500)
			else
				drawNotification("~r~" .. ChangingByNameAbortedMessage .. "!")
				Citizen.Wait(500)
			end
			blockinput = false
			changePedByName = false
		end
	end
end)


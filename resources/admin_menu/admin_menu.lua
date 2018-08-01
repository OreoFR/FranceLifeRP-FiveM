local adminmenu = {
	opened = false,
	title = "Menu Admin",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 255, g = 234, b = 0, a = 200, type = 1 },
	menu = {
		x = 0.1,
		y = 0.32,
		width = 0.2,
		height = 0.04,
		buttons = 8,
		from = 1,
		to = 10,
		scale = 0.4,
		font = 0,
		["main"] = { 
			title = "CATEGORIES", 
			name = "main",
			buttons = { 
				{name = "Fonctions Joueurs", description = ""},
				{name = "Fonctions Véhicules", description = ""},
			}
		},
		["mainadmin"] = { 
			title = "Fonctions Joueurs",
			name = "mainadmin",
			buttons = { 
				{name = "GodMode", description = ''}, -- Fonctionnel
				{name = "No-Clip", description = ''}, -- Fonctionnel
				{name = "Invisible", description = ''}, -- A test
				{name = "Give de l'argent", description = ''}, -- A test
				-- {name = "Kick", description = ''}, -- A test
				-- {name = "Ban", description = ''}, -- A test
				{name = "Goto joueur", description = ''}, -- Fonctionnel
				{name = "Teleporter un joueur", description = ''}, -- Fonctionnel
				{name = "Teleporter à une Position", description = ''}, -- Fonctionnel
				{name = "Prendre Position", description = ''}, -- Fonctionnel
			}
		},
		["mainvehicule"] = { 
			title = "Fonctions Vehicules",
			name = "mainvehicule",
			buttons = { 
				{name = "Spawn véhicule", description = ''}, -- A faire
				{name = "Réparer véhiucle", description = ''}, -- A faire
				{name = "Flip véhicule", description = ''}, -- A faire
				-- {name = "Goto", description = ''}, -- A faire
				-- {name = "Teleporter", description = ''}, -- A faire
				-- {name = "Teleporter a une Position", description = ''}, -- A faire
				-- {name = "Prendre Position", description = ''}, -- A faire
				-- {name = "Give de l'argent", description = ''}, -- A faire
				-- {name = "Give un Item", description = ''}, -- A faire
			}
		},
	}
}

User = {
	Spawned = false,
	Loaded = false,
	group = "0",
	permission_level = 0,
	money = 0,
	dirtymoney = 0,
	job = 0,
	police = 0,
	enService = 0,
	nom = "",
	prenom = "",
	vehicle = "",
	identifier = nil,
	telephone = ""
}


local function LocalPed()
	return GetPlayerPed(-1)
end

	inmenuadmin = 0
	inmenuinv = 0
	inmenujob = 0

--Creator Weapon
function OpenCreatoradminmenu()		
	adminmenu.currentmenu = "main"
	adminmenu.opened = true
	adminmenu.selectedbutton = 0
end

function CloseCreatoradminmenu()
	Citizen.CreateThread(function()
		adminmenu.opened = false
		adminmenu.menu.from = 1
		adminmenu.menu.to = 8
		inmenuadmin = 0
		inmenuinv = 0
		inmenujob = 0
	end)
	Citizen.CreateThread(function()
	end)
end

--Menu pomenu

function drawMenuButton(button,x,y,selected)
	local menu = adminmenu.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)	
end

function drawMenuInfo(text)
	local menu = adminmenu.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(0.45, 0.45)
	SetTextColour(255, 255, 255, 255)
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawRect(0.675, 0.95,0.65,0.050,0,0,0,150)
	DrawText(0.365, 0.934)	
end

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)	
end

function drawMenuRight(txt,x,y,selected)
	local menu = adminmenu.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	SetTextRightJustify(1)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawText(x + menu.width/2 - 0.03, y - menu.height/2 + 0.0028)	
end

function drawMenuTitleCivmen(txt,x,y)
local menu = adminmenu.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,117,202,93,150)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function NotifyAdminMenu(text)
SetNotificationTextEntry('STRING')
AddTextComponentString(text)
DrawNotification(false, false)
end

function ShowNotificationMenuAdmin2(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

RegisterNetEvent("MenuAdminAccess")
AddEventHandler("MenuAdminAccess", function(infos)
	for k,v in pairs(infos) do
		User[k] = v
	end
end)

local backlock = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if (User.permission_level == 4) and IsControlJustPressed(1,288) then
		  -- if IsPedInAnyVehicle(LocalPed(), true) == false then
		  if (inmenuinv == 0) and (inmenujob == 0) then
			if adminmenu.opened then
				CloseCreatoradminmenu()
				inmenuadmin = 0
				inmenuinv = 0
				inmenujob = 0
			else
				adminmenu.menu["main"].buttons = {}
				
				table.insert(adminmenu.menu["main"].buttons, {name = "Fonctions Joueurs", description = ''})
				table.insert(adminmenu.menu["main"].buttons, {name = "Fonctions Véhicules", description = ''})
				
				OpenCreatoradminmenu()
				freezetargetCiv = totarget
				inmenuadmin = 1
				inmenuinv = 0
				inmenujob = 0
			end
		  end
		  -- else
		    -- ShowNotificationMenuAdmin2("~r~Vous ne pouvez pas ouvrir le menu dans un vÃ©hicule !")
	      -- end		  
		end
		if adminmenu.opened then
			local ped = LocalPed()
			local menu = adminmenu.menu[adminmenu.currentmenu]
			drawTxt(adminmenu.title,1,1,adminmenu.menu.x,adminmenu.menu.y,1.0, 255,255,255,255)
			drawMenuTitleCivmen(menu.title, adminmenu.menu.x,adminmenu.menu.y + 0.08)
			drawTxt(adminmenu.selectedbutton.."/"..tablelength(menu.buttons),0,0,adminmenu.menu.x + adminmenu.menu.width/2 - 0.0385,adminmenu.menu.y + 0.067,0.4, 255,255,255,255)
			local y = adminmenu.menu.y + 0.12
			buttoncount = tablelength(menu.buttons)
			local selected = false
			
			for i,button in pairs(menu.buttons) do
				if i >= adminmenu.menu.from and i <= adminmenu.menu.to then
					
					if i == adminmenu.selectedbutton then
						selected = true
					else
						selected = false
					end
					drawMenuButton(button,adminmenu.menu.x,y,selected)
					y = y + 0.04
					if selected and IsControlJustPressed(1,201) then
						ButtonSelectedAdminMenu(button)
					end
				end
			end	
		end
		if adminmenu.opened then
			if IsControlJustPressed(1,202) then
				BackAdminMenu()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				if adminmenu.selectedbutton > 1 then
					adminmenu.selectedbutton = adminmenu.selectedbutton -1
					if buttoncount > 8 and adminmenu.selectedbutton < adminmenu.menu.from then
						adminmenu.menu.from = adminmenu.menu.from -1
						adminmenu.menu.to = adminmenu.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				if adminmenu.selectedbutton < buttoncount then
					adminmenu.selectedbutton = adminmenu.selectedbutton +1
					if buttoncount > 8 and adminmenu.selectedbutton > adminmenu.menu.to then
						adminmenu.menu.to = adminmenu.menu.to + 1
						adminmenu.menu.from = adminmenu.menu.from + 1
					end
				end	
			end
		end
	end
end)

function DrawTextAdmin(m_text, showtime)
    ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

inputpos = 0

function ButtonSelectedAdminMenu(button)
	local ped = GetPlayerPed(-1)
	local this = adminmenu.currentmenu
	local btn = button.name

	
	if this == "main" then
	    if btn == "Fonctions Joueurs" then
		    if IsPedInAnyVehicle(LocalPed(), true) == false then
				OpenMenuAdminmenu('mainadmin')
			else
		    ShowNotificationMenuAdmin2("~r~Vous ne pouvez pas ouvrir le menu Admin dans un véhicule !")
			end

	    elseif btn == "Fonctions Véhicules" then
		    OpenMenuAdminmenu('mainvehicule')
	end
	elseif this == "mainadmin" then
		if btn == "No-Clip" then
			NoclipON()
		-- elseif btn == "Kick" then
		    -- DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
			-- ShowNotificationMenuAdmin2("~b~Entrez l'id du joueur")
			-- inputkick = 1
			-- CloseCreatoradminmenu()
		-- elseif btn == "Ban" then
		    -- DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
			-- ShowNotificationMenuAdmin2("~b~Entrez l'id du joueur")
			-- inputban = 1
			-- CloseCreatoradminmenu()
		elseif btn == "Goto joueur" then
		    DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
			ShowNotificationMenuAdmin2("~b~Entrez l'id du joueur")
			inputgoto = 1
			CloseCreatoradminmenu()
		elseif btn == "Teleporter un joueur" then
		    DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
			ShowNotificationMenuAdmin2("~b~Entrez l'id du joueur")
			inputteleport = 1
			CloseCreatoradminmenu()
		elseif btn == "Teleporter à une Position" then
		    DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
			ShowNotificationMenuAdmin2("~b~Entrez la position...")
			inputpos = 1
			CloseCreatoradminmenu()
		elseif btn == "Prendre Position" then
		    local x,y,z = getPosition()
            DrawTextAdmin("Coordonnées: "..x..", "..y..", "..z, 60000)
			--ShowNotificationMenuAdmin2("Coordonées: "x..", "..y..","..z)
		elseif btn == "Give de l'argent" then
		    DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
			ShowNotificationMenuAdmin2("~b~Entrez l'id puis l'argent...")
			inputmoney = 1
			CloseCreatoradminmenu()
		elseif btn == "GodMode" then
		    GodmodeON()
		elseif btn == "Invisible" then
		    InvisibleON()
		end
	elseif this == "mainvehicule" then
	    if btn == "Réparer véhicule" then
		    repairVehicle()
		elseif btn == "Spawn véhicule" then
		    DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
			ShowNotificationMenuAdmin2("~b~Entrez le nom du véhicule")
			inputvehicle = 1
			CloseCreatoradminmenu()
		elseif btn == "Flip véhicule" then
            flipVehicle()
		end
	end
end


RegisterNetEvent('FinishMenuAdmin')
AddEventHandler('FinishMenuAdmin', function()
	adminmenu.opened = false
	adminmenu.menu.from = 1
	adminmenu.menu.to = 8
	inmenuadmin = 0
	inmenuinv = 0
	inmenujob = 0
end)

function OpenMenuAdminmenu(menu)
	adminmenu.lastmenu = adminmenu.currentmenu
	if menu == "mainadmin" then
		adminmenu.lastmenu = "main"
	elseif menu == "mainvehicule" then
		adminmenu.lastmenu = "main"
	elseif menu == "race_create_objects_spawn" then
		adminmenu.lastmenu = "race_create_objects"
	end
	adminmenu.menu.from = 1
	adminmenu.menu.to = 8
	adminmenu.selectedbutton = 0
	adminmenu.currentmenu = menu	
end


function BackAdminMenu()
	if backlock then
		return
	end
	backlock = true
	if adminmenu.currentmenu == "main" then
		CloseCreatoradminmenu()
		inmenuadmin = 0
		inmenuinv = 0
		inmenujob = 0
	else
		OpenMenuAdminmenu(adminmenu.lastmenu)
	end
end

function stringstartsAdminMenu(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end

function DrawMissionText3(m_text, showtime)
		ClearPrints()
		SetTextEntry_2("STRING")
		AddTextComponentString(m_text)
		DrawSubtitleTimed(showtime, 1)
end

function Notify(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

-- FONCTION NOCLIP 

local noclip = false
local noclip_speed = 1.0

function NoclipON()
  noclip = not noclip
  local ped = GetPlayerPed(-1)
  if noclip then -- activé
    SetEntityInvincible(ped, true)
    SetEntityVisible(ped, false, false)
	Notify("Noclip ~g~activé")
  else -- désactivé
    SetEntityInvincible(ped, false)
    SetEntityVisible(ped, true, false)
	Notify("Noclip ~r~désactivé")
  end
end

function getPosition()
  local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
  return x,y,z
end

function getCamDirection()
  local heading = GetGameplayCamRelativeHeading()+GetEntityHeading(GetPlayerPed(-1))
  local pitch = GetGameplayCamRelativePitch()

  local x = -math.sin(heading*math.pi/180.0)
  local y = math.cos(heading*math.pi/180.0)
  local z = math.sin(pitch*math.pi/180.0)

  local len = math.sqrt(x*x+y*y+z*z)
  if len ~= 0 then
    x = x/len
    y = y/len
    z = z/len
  end

  return x,y,z
end

function isNoclip()
  return noclip
end

-- noclip/invisible
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if noclip then
      local ped = GetPlayerPed(-1)
      local x,y,z = getPosition()
      local dx,dy,dz = getCamDirection()
      local speed = noclip_speed

      -- reset du velocity
      SetEntityVelocity(ped, 0.0001, 0.0001, 0.0001)

      -- aller vers le haut
      if IsControlPressed(0,32) then -- MOVE UP
        x = x+speed*dx
        y = y+speed*dy
        z = z+speed*dz
      end

      -- aller vers le bas
      if IsControlPressed(0,269) then -- MOVE DOWN
        x = x-speed*dx
        y = y-speed*dy
        z = z-speed*dz
      end

      SetEntityCoordsNoOffset(ped,x,y,z,true,true,true)
    end
  end
end)

-- FIN NOCLIP




-- TP A POSITION

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if inputpos == 1 then
			if UpdateOnscreenKeyboard() == 3 then
				inputpos = 0
			elseif UpdateOnscreenKeyboard() == 1 then
					inputpos = 2
			elseif UpdateOnscreenKeyboard() == 2 then
				inputpos = 0
			end
		end
		if inputpos == 2 then
		local pos = GetOnscreenKeyboardResult() -- GetOnscreenKeyboardResult RECUPERE LA POSITION RENTRER PAR LE JOUEUR
		local _,_,x,y,z = string.find( pos or "0,0,0", "([%d%.]+),([%d%.]+),([%d%.]+)" )

		    SetEntityCoords(GetPlayerPed(-1), x+0.0001, y+0.0001, z+0.0001, 1,0,0,1) -- TP LE JOUEUR A LA POSITION
			--TriggerServerEvent('vmenu:giveCash_s', GetPlayerServerId(sendTarget), addCash)
			inputpos = 0
		end
	end
end)

-- FIN TP A POSITION




-- TP UN JOUEUR A MOI

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if inputteleport == 1 then
			if UpdateOnscreenKeyboard() == 3 then
				inputteleport = 0
			elseif UpdateOnscreenKeyboard() == 1 then
				inputteleport = 2
			elseif UpdateOnscreenKeyboard() == 2 then
				inputteleport = 0
			end
		end
		if inputteleport == 2 then
        --local x,y,z = getPosition()
		local teleportply = GetOnscreenKeyboardResult()
	    local playerPed = GetPlayerFromServerId(tonumber(teleportply))
	    local teleportPed = GetEntityCoords(GetPlayerPed(-1))
	    SetEntityCoords(playerPed, teleportPed)
		inputteleport = 0
		end
	end
end)

-- FIN TP UN JOUEUR A MOI




-- GOTO JOUEUR

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if inputgoto == 1 then
			if UpdateOnscreenKeyboard() == 3 then
				inputgoto = 0
			elseif UpdateOnscreenKeyboard() == 1 then
					inputgoto = 2
			elseif UpdateOnscreenKeyboard() == 2 then
				inputgoto = 0
			end
		end
		if inputgoto == 2 then
        --local x,y,z = getPosition()
		local gotoply = GetOnscreenKeyboardResult()
        --local tplayer = GetPlayerPed(GetPlayerFromServerId(id))
        --x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(gotoply) , true))
        -- x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(gotoply) , true)))
        -- SetEntityCoords(GetPlayerPed(-1), x+0.0001, y+0.0001, z+0.0001, 1, 0, 0, 1)
	    local playerPed = GetPlayerPed(-1)
	    local teleportPed = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(tonumber(gotoply))))
	    SetEntityCoords(playerPed, teleportPed)
		
        inputgoto = 0
		end
	end
end)

-- FIN GOTO JOUEUR




-- KICK UN JOUEUR

-- Citizen.CreateThread(function()
	-- while true do
		-- Wait(0)
		-- if inputkick == 1 then
			-- if UpdateOnscreenKeyboard() == 3 then
				-- inputkick = 0
			-- elseif UpdateOnscreenKeyboard() == 1 then
					-- inputkick = 2
			-- elseif UpdateOnscreenKeyboard() == 2 then
				-- inputkick = 0
			-- end
		-- end
		-- if inputkick == 2 then
		
		-- local kickid = GetOnscreenKeyboardResult() -- GetOnscreenKeyboardResult RECUPERE L'ID RENTRER PAR LE JOUEUR
        -- TriggerServerEvent('KickEvent', kickid)
        -- Notify("Le joueur ~g~"..kickid.."~s~ à été kick")
        -- inputkick = 0
		-- end
	-- end
-- end)

-- FIN KICK UN JOUEUR




-- BANNIR UN JOUEUR

-- FIN BANNIR UN JOUEUR




-- GIVE DE L'ARGENT

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if inputmoney == 1 then
			if UpdateOnscreenKeyboard() == 3 then
				inputmoney = 0
			elseif UpdateOnscreenKeyboard() == 1 then
					inputmoney = 2
			elseif UpdateOnscreenKeyboard() == 2 then
				inputmoney = 0
			end
		end
		if inputmoney == 2 then
		local money = GetOnscreenKeyboardResult() -- GetOnscreenKeyboardResult RECUPERE L'ID RENTRER PAR LE JOUEUR
                 TriggerServerEvent('AdminMenu:giveCash', GetPlayerPed(-1), money)
			      inputmoney = 0
		end
	end
end)

-- FIN GIVE DE L'ARGENT




-- GOD MODE

function GodmodeON()
  godmode = not godmode
  local ped = GetPlayerPed(-1)
  
  if godmode then -- activé
		SetEntityInvincible(ped, true)
		Notify("GodMode ~g~activé")
	else
		SetEntityInvincible(ped, false)
		Notify("GodMode ~r~désactivé")
  end
end
	
-- FIN GOD MODE




-- INVISIBLE

function InvisibleON()
  invisible = not invisible
  local ped = GetPlayerPed(-1)
  
  if invisible then -- activé
		SetEntityVisible(ped, false, false)
		Notify("Invisibilité ~g~activé")
	else
		SetEntityVisible(ped, true, false)
		Notify("Invisibilité ~r~désactivé")
  end
end
	
-- FIN INVISIBLE

---------------------- VEHICLE ----------------------

-- Réparer vehicule

function repairVehicle()

    local ped = GetPlayerPed(-1)
    local car = GetVehiclePedIsUsing(ped)
	
		SetVehicleFixed(car)
		SetVehicleDirtLevel(car, 0.0)

end

-- FIN Réparer vehicule




-- Spawn vehicule

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if inputvehicle == 1 then
			if UpdateOnscreenKeyboard() == 3 then
				inputvehicle = 0
			elseif UpdateOnscreenKeyboard() == 1 then
					inputvehicle = 2
			elseif UpdateOnscreenKeyboard() == 2 then
				inputvehicle = 0
			end
		end
		if inputvehicle == 2 then
		local vehicleidd = GetOnscreenKeyboardResult()

				local car = GetHashKey(vehicleidd)
				
				Citizen.CreateThread(function()
					Citizen.Wait(10)
					RequestModel(car)
					while not HasModelLoaded(car) do
						Citizen.Wait(0)
					end
                    local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
					veh = CreateVehicle(car, x,y,z, 0.0, true, false)
					SetEntityVelocity(veh, 2000)
					SetVehicleOnGroundProperly(veh)
					SetVehicleHasBeenOwnedByPlayer(veh,true)
					local id = NetworkGetNetworkIdFromEntity(veh)
					SetNetworkIdCanMigrate(id, true)
					SetVehRadioStation(veh, "OFF")
					SetPedIntoVehicle(GetPlayerPed(-1),  veh,  -1)
					Notify("Véhicule spawn, bonne route")
				end)
		
        inputvehicle = 0
		end
	end
end)


-- flipVehicle

function flipVehicle()

    local player = GetPlayerPed(-1)
    posdepmenu = GetEntityCoords(player)
    carTargetDep = GetClosestVehicle(posdepmenu['x'], posdepmenu['y'], posdepmenu['z'], 10.0,0,70)
	if carTargetDep ~= nil then
			platecarTargetDep = GetVehicleNumberPlateText(carTargetDep)
	end
    local playerCoords = GetEntityCoords(GetPlayerPed(-1))
    playerCoords = playerCoords + vector3(0, 2, 0)
	
	SetEntityCoords(carTargetDep, playerCoords)
	
	Notify("Voiture retourné")

end
local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local tenue = {x=1975.44,y=2805.62,z=50.17}
local gamestart = {x=1975.17,y=2794.46,z=51.20}
local millieu = {x=2014.41,y=2786.58,z=50.30}
local equipebleu = {x=2015.58,y=2704.49,z=55.88}
local equiperouge = {x=2030.69,y=2858.54,z=55.88}
local spawnbleu = {x=2015.58,y=2704.49,z=50.88}
local spawnrouge = {x=2030.69,y=2858.54,z=50.88}
local miseazero = {x=1978.27,y=2800.89,z=51.20}

local home = {x=1848.30,y=2586.02,z=45.67}
local homeblip = {x=1848.30,y=2586.02,z=45.67}
local activity = {x=1973.78,y=2801.08,z=50.18}

ESX                           = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local PlayerData                = {}
local modele = 0

local playerJob = ""
local playerGrade = ""


Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
   playerJob = xPlayer.job.name
   playerGrade = xPlayer.job.grade_name
   PlayerData = xPlayer
end)

function DrawSub(text, time)
  ClearPrints()
  SetTextEntry_2('STRING')
  AddTextComponentString(text)
  DrawSubtitleTimed(time, 1)
end


Citizen.CreateThread(function()

    homeblip = AddBlipForCoord(homeblip.x, homeblip.y, homeblip.z)
	SetBlipSprite(homeblip, 437)
	SetBlipColour(homeblip, 3)
	SetBlipAsShortRange(homeblip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Paintball")
	EndTextCommandSetBlipName(homeblip)

	
	while true do
		Citizen.Wait(0)
		local pos = GetEntityCoords(GetPlayerPed(-1), true)

		
		RegisterNetEvent('esx:playerLoaded')
		AddEventHandler('esx:playerLoaded', function(xPlayer)
		playerJob = xPlayer.job.name
		playerGrade = xPlayer.job.grade_name
		PlayerData = xPlayer
		end)
		
		
		
		DrawMarker(1,tenue.x,tenue.y,tenue.z-1,0,0,0,0,0,0,2.001,2.0001,0.5001,0,155,255,200,0,0,0,0) -- Vestiaire du paintball
		DrawMarker(5,gamestart.x,gamestart.y,gamestart.z-1,0,0,0,0,0,0,2.001,2.0001,1.7001,0,155,255,200,0,1,0,0) -- gamestart
		DrawMarker(0,equipebleu.x,equipebleu.y,equipebleu.z-1,0,0,0,0,0,0,2.001,2.0001,5.5001,0,155,255,200,0,0,0,0) -- gamestart
		DrawMarker(0,equiperouge.x,equiperouge.y,equiperouge.z-1,0,0,0,0,0,0,2.001,2.0001,5.5001,255,0,0,200,0,0,0,0) -- gamestart
		DrawMarker(24,miseazero.x,miseazero.y,miseazero.z-1,0,0,0,0,0,0,1.001,1.0001,1.5001,255,0,0,200,0,1,0,0) -- gamestart
		
		DrawMarker(1,1848.30,2586.02,45.67-1,0,0,0,0,0,0,2.001,2.0001,0.5001,0,155,255,200,0,0,0,0) -- gamestart
		DrawMarker(1,1973.78,2801.08,50.18-1,0,0,0,0,0,0,2.001,2.0001,0.5001,255,0,0,200,0,0,0,0) -- gamestart
		
		
		if(isNear(tenue)) then
				Info("Appuyez sur ~g~E~w~ pour vous changer.")
				if(IsControlJustPressed(1, 38)) then
					OuvrirVestiaire()
				end
		end
		
		if(isNear(gamestart)) then
				Info("Appuyez sur ~g~E~w~ pour commencer la partie.")
				if(IsControlJustPressed(1, 38)) then
					debutpartie()
				end
		end
		
		if(isNear(miseazero)) then
				Info("Appuyez sur ~g~E~w~ pour remettre le score a zéro.")
				if(IsControlJustPressed(1, 38)) then
					remettrezero()
				end
		end
		
	
		if (Vdist(pos.x, pos.y, pos.z, home.x, home.y, home.z) < 2.0) then
				Info("Appuyez sur ~g~E~w~ pour aller jouer au paintball.")
				if(IsControlJustPressed(1, 38)) then
					allerjouer()
				end
		end
		
		if (Vdist(pos.x, pos.y, pos.z, activity.x, activity.y, activity.z) < 2.0) then
				Info("Appuyez sur ~g~E~w~ pour sortir du paintball.")
				if(IsControlJustPressed(1, 38)) then
					quitterpaintball()
				end
		end
	
		
		
end
end)



function OuvrirVestiaire()

  local elements = {
    { label = ('tenue Civile'), value = 'citizen_wear' }
  }


    table.insert(elements, {label = "tenue Equipe 1", value = 'tenue_equipe'})
	table.insert(elements, {label = "tenue Equipe 2", value = 'tenue_equipedeux'})


ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'vestiaire',
    {
      title    = ('Vestiaire'),
      align    = 'top-left',
      elements = elements,
    },
    function(data, menu)
      menu.close()

      if data.current.value == 'citizen_wear' then
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
          local model = nil

          if skin.sex == 0 then
            model = GetHashKey("mp_m_freemode_01")
          else
            model = GetHashKey("mp_f_freemode_01")
          end

          RequestModel(model)
          while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(1)
          end

          SetPlayerModel(PlayerId(), model)
          SetModelAsNoLongerNeeded(model)

          TriggerEvent('skinchanger:loadSkin', skin)
          local playerPed = GetPlayerPed(-1)
          SetPedArmour(playerPed, 0)
          ClearPedBloodDamage(playerPed)
          ResetPedVisibleDamage(playerPed)
          ClearPedLastWeaponDamage(playerPed)
		  modele = 1
        end)
      end
	  
	        if data.current.value == 'tenue_equipe' then
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

        if skin.sex == 0 then

          local model = GetHashKey("a_m_m_afriamer_01")
			
          RequestModel(model)
          while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(0)
          end

          SetPlayerModel(PlayerId(), model)
          SetModelAsNoLongerNeeded(model)
		  local playerPed  = GetPlayerPed(-1)
		  local weaponHash = GetHashKey("WEAPON_PISTOL50")
		  GiveWeaponToPed(playerPed, weaponHash, 250, false, false)
		  modele = 2
		  autorevive()
	
		  

      else
          local model = GetHashKey("a_m_m_afriamer_01")

          RequestModel(model)
          while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(0)
          end

          SetPlayerModel(PlayerId(), model)
          SetModelAsNoLongerNeeded(model)
			 local playerPed  = GetPlayerPed(-1)
			 local weaponHash = GetHashKey("WEAPON_PISTOL50")
			 GiveWeaponToPed(playerPed, weaponHash, 250, false, false)
			  modele = 2
			  autorevive()
          end

        end)
      end
	  
	  	        if data.current.value == 'tenue_equipedeux' then
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

        if skin.sex == 0 then

          local model = GetHashKey("a_f_m_fatbla_01")
			
          RequestModel(model)
          while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(0)
          end

          SetPlayerModel(PlayerId(), model)
          SetModelAsNoLongerNeeded(model)
		  local playerPed  = GetPlayerPed(-1)
		  local weaponHash = GetHashKey("WEAPON_PISTOL50")
		  GiveWeaponToPed(playerPed, weaponHash, 250, false, false)
		  modele = 3
		  
		  autorevive()
      else
          local model = GetHashKey("a_f_m_fatbla_01")

          RequestModel(model)
          while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(0)
          end

          SetPlayerModel(PlayerId(), model)
          SetModelAsNoLongerNeeded(model)
			local playerPed  = GetPlayerPed(-1)
		  local weaponHash = GetHashKey("WEAPON_PISTOL50")
		  GiveWeaponToPed(playerPed, weaponHash, 250, false, false)
		  modele = 3
		  
		  autorevive()
          end

        end)
      end
		
		CurrentAction     = 'menu_vestiaire'
		CurrentActionMsg  = ('ouvrir_vestiaire')
		CurrentActionData = {}
	end,	
	function(data, menu)
      menu.close()

      CurrentAction     = 'menu_vestiaire'
      CurrentActionMsg  = ('ouvrir_vestiaire')
      CurrentActionData = {}
	end
  )

end

function isNear(tabl)
	local distance = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),tabl.x,tabl.y,tabl.z, true)

	if(distance<3) then
		return true
	end

	return false
end

function quitterpaintball()
DoScreenFadeOut(1000)
if modele == 2 or modele == 3 then

ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
          local model = nil

          if skin.sex == 0 then
            model = GetHashKey("mp_m_freemode_01")
          else
            model = GetHashKey("mp_f_freemode_01")
          end

          RequestModel(model)
          while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(1)
          end

          SetPlayerModel(PlayerId(), model)
          SetModelAsNoLongerNeeded(model)

          TriggerEvent('skinchanger:loadSkin', skin)
          local playerPed = GetPlayerPed(-1)
          SetPedArmour(playerPed, 0)
          ClearPedBloodDamage(playerPed)
          ResetPedVisibleDamage(playerPed)
          ClearPedLastWeaponDamage(playerPed)
		  modele = 1
end)
end


Citizen.Wait(2000)
SetEntityCoords(GetPlayerPed(-1),home.x,home.y,home.z+1)
Citizen.Wait(1000)
DoScreenFadeIn(1000)


end

function Info(text, loop)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, loop, 1, 0)
end


function autorevive()
	while true do
		Citizen.Wait(0)
		local myPed = GetPlayerPed(-1)
		local vie = GetEntityHealth(myPed)
		local weaponHash = GetHashKey("WEAPON_PISTOL50")
			if modele == 2 then
			SetFollowPedCamViewMode(4)
				if vie == 0 then
					revive()
					Citizen.Wait(1500)
					SetEntityCoords(GetPlayerPed(-1),spawnrouge.x,spawnrouge.y,spawnrouge.z+1)
					GiveWeaponToPed(myPed, weaponHash, 250, false, false)
					notif(modele)
				end
			elseif modele == 3 then	
				SetFollowPedCamViewMode(4)
				if vie == 0 then
					revive()
					Citizen.Wait(1500)
					SetEntityCoords(GetPlayerPed(-1),spawnbleu.x,spawnbleu.y,spawnbleu.z+1)
					GiveWeaponToPed(myPed, weaponHash, 250, false, false)
					notif(modele)
					
				end
			else
				break
			end
	end
end

function revive()
local localPlayerId = PlayerId()
local serverId = GetPlayerServerId(localPlayerId)
TriggerServerEvent('esx_ambulancejob:revive', serverId)
end


function distancenotification(point)
	local distance = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),point.x,point.y,point.z, true)

	if(distance<100) then
		return true
	end

	return false
end


function debutpartie()

	if(distancenotification(millieu)) then
		TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 100, "countdown", 1.0)
		ESX.ShowNotification('~p~La partie débute dans ~r~~h~3')
		Citizen.Wait(1000)
		ESX.ShowNotification('~p~La partie débute dans ~r~~h~2')
		Citizen.Wait(1000)
		ESX.ShowNotification('~p~La partie débute dans ~r~~h~1')
		Citizen.Wait(1000)
		ESX.ShowNotification('~p~La partie ~r~~h~débute !')
	end
end

function allerjouer()
DoScreenFadeOut(1000)
Citizen.Wait(2000)
SetEntityCoords(GetPlayerPed(-1),activity.x,activity.y,activity.z+1)
Citizen.Wait(1000)
DoScreenFadeIn(1000)

Citizen.CreateThread(function()
    function Initialize(scaleform)
        local scaleform = RequestScaleformMovie(scaleform)

        while not HasScaleformMovieLoaded(scaleform) do
            Citizen.Wait(0)
        end
        PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
        PushScaleformMovieFunctionParameterString("~r~Bon paintball !!")
		PushScaleformMovieFunctionParameterString("J'espère que vos armes sont dans votre coffre !")
        PopScaleformMovieFunctionVoid()
        return scaleform
    end
    scaleform = Initialize("mp_big_message_freemode")
	local temps = 0
    while temps<200 do
        Citizen.Wait(0)
        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
		temps = temps + 1
    end
end)
end


function notif(modele)
Citizen.Wait(2000)
TriggerServerEvent('esx_paintball:pointage', modele)
end


RegisterNetEvent('showNotify')
AddEventHandler('showNotify', function(notify)
	ShowAboveRadarMessage(notify)
end)

function ShowAboveRadarMessage(message)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(message)
	DrawNotification(0,1)
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function remettrezero()
TriggerServerEvent('esx_paintball:remmetrezero')
ESX.ShowNotification('~p~Le score est maintenant à zéro')
end






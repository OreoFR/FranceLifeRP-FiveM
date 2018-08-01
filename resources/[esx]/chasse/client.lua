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

function Chat(t)
	TriggerEvent("chatMessage", 'TRUCKER', { 0, 255, 255}, "" .. tostring(t))
end

RegisterNetEvent("chasse:createBlip")
AddEventHandler("chasse:createBlip", function(type, x, y, z)
	local blip = AddBlipForCoord(x, y, z)
	SetBlipSprite(blip, type)
	SetBlipScale(blip, 0.8)
	SetBlipAsShortRange(blip, true)
	if(type == 141)then
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Chasse")
		EndTextCommandSetBlipName(blip)
	end
end)

RegisterNetEvent("chasse:createBlip2")
AddEventHandler("chasse:createBlip2", function(type, x, y, z)
	local blip = AddBlipForCoord(x, y, z)
	SetBlipSprite(blip, type)
	SetBlipScale(blip, 0.8)
	SetBlipAsShortRange(blip, true)
	if(type == 141)then
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Boucherie")
		EndTextCommandSetBlipName(blip)
	end
end)
------------------------------------------------------
ESX                             = nil
------------------------------------------------------
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)
----------------------------------------------------------------------
local entitySkin
local entityType
local entityQuantity = 1
local missionX = -1492.2
local missionY = 4971.5
local missionZ = 64.2
local entityBlip = {}
local avantspawn
local entityAlive = false
local entityHealth = {}
local entity = {}
local entitySpawned = true
local remover = false

local missionCoords = {
  {x=-1505.2, y=4887.39, z=78.38},
  {x=-1508.2, y=4795.5, z=64.36},
  {x=-1484.73, y=4668.05, z=40.143},
  {x=-1410.63, y=4730.94, z=44.0369},
  {x=-1377.29, y=4864.31, z=134.162},
  {x=-1697.63, y=4652.71, z=22.2442},
  {x=-1160.34582519531, y=4632.18505859375, z=145.470001220703},
  {x=-974.802, y=4409.66, z=19.3078},
  {x=-1820.96, y=4691.03, z=4.4164},
  {x=-1671.7, y=5018.13, z=34.1412}
}

local entityRemoved = {}
local vending = false
local count = 5
local blipid = 0
local missionRunning = false
local entityType = {28}		--Player,1|Male,4|Female,5|Cop,6|Human,26|SWAT,27|Animal,28|Army,29
local entitySkin = {GetHashKey("a_c_deer")}
local reset = false
local proie = 1
local isinjob = false
local spawned_car = nil
local a = math.random(1, 10)


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


Citizen.CreateThread(function()
		TriggerEvent('chasse:createBlip', 141, -1492.2, 4971.5, 64.2)
		TriggerEvent('chasse:createBlip2', 141, 960.196105957031,-2105.53198242188,31.9526977539063)

	local entityCoords = {
	{x=0, y=0, z=0},
	{x=0, y=0, z=0},
	{x=0, y=0, z=0},
	{x=0, y=0, z=0},
	{x=0, y=0, z=0},
	{x=0, y=0, z=0},
	{x=0, y=0, z=0},
	{x=0, y=0, z=0},
	{x=0, y=0, z=0},
	{x=0, y=0, z=0},
	{x=0, y=0, z=0},
	{x=0, y=0, z=0}
}
    while true do
       Citizen.Wait(0)
       playerPed = GetPlayerPed(-1)
		local pos = GetEntityCoords(GetPlayerPed(-1), true)
		
		if pos then
				
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 960.196105957031,-2105.53198242188,31.9526977539063, true) <= 5 then
					TriggerServerEvent('chasse:startVente')
					Citizen.Wait(4000)
				end
				if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1492.2, 4971.5, 64.2, true) <= 8 ) then
					DrawMarker(1,-1492.2, 4971.5, 63.2, 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 0.5001, 0, 155, 255, 200, 0, 0, 0, 0)
					drawTxt("Press 'Utiliser / E' pour commencer a chasser ou pour ARRETER",0,1,0.5,0.8,0.6,255,255,255,255)
					if (IsControlPressed(1, 51)) then
						Wait(500)
						if isinjob==false then
							local vehiculeDetected = GetClosestVehicle(-1493.38269042969, 4981.84814453125, 62.650577545166, 6.0, 0, 70)
							if not DoesEntityExist(vehiculeDetected) then
								missionRunning = true
								entityType = {28,28,28,28,28}		
								entitySkin = 	{GetHashKey("a_c_deer"),GetHashKey("a_c_boar"),GetHashKey("a_c_mtlion"),GetHashKey("a_c_pig"),GetHashKey("a_c_cow"),
												GetHashKey("a_c_pig"),GetHashKey("a_c_deer"),GetHashKey("a_c_mtlion"),GetHashKey("a_c_cow"),
												GetHashKey("a_c_coyote"),GetHashKey("a_c_coyote"),GetHashKey("a_c_boar"),GetHashKey("a_c_boar")}
								entitySpawned = false
								remover = true
								GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MUSKET"),250, true, true)
								local hashSkin = GetHashKey("mp_m_freemode_01")
								if(GetEntityModel(GetPlayerPed(-1)) == hashSkin) then
									SetPedComponentVariation(GetPlayerPed(-1), 11, 7, 13, 2)  
									SetPedComponentVariation(GetPlayerPed(-1), 8, 1, 12, 2)  
									SetPedComponentVariation(GetPlayerPed(-1), 4, 47, 1, 2)   
									SetPedComponentVariation(GetPlayerPed(-1), 6, 12, 6, 2)   
									SetPedComponentVariation(GetPlayerPed(-1), 3, 18, 0, 2)  
								else
									SetPedComponentVariation(GetPlayerPed(-1), 11, 34, 0, 2)  
									SetPedComponentVariation(GetPlayerPed(-1), 8, 0, 7, 2)  
									SetPedComponentVariation(GetPlayerPed(-1), 4, 30, 4, 2)   
									SetPedComponentVariation(GetPlayerPed(-1), 6, 26, 0, 2)   
									SetPedComponentVariation(GetPlayerPed(-1), 3, 21, 1, 2)  
								end
								avantspawn = AddBlipForCoord(missionCoords[a].x,missionCoords[a].y,missionCoords[a].z)
								SetBlipColour(avantspawn,1)
								BeginTextCommandSetBlipName("STRING")
								AddTextComponentString("Proie")
								EndTextCommandSetBlipName(avantspawn)

								if(spawned_car ~= nil) then
									SetEntityAsMissionEntity(spawned_car, true, true)
									Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(spawned_car))
									spawned_car = nil
								else
									local vehicle = GetHashKey('bodhi2')
									RequestModel(vehicle)
									while not HasModelLoaded(vehicle) do
										Wait(1)
									end
									local plate = math.random(100, 900)
									spawned_car = CreateVehicle(vehicle,-1493.38269042969, 4981.84814453125, 62.650577545166,-175.0, true, false)
									SetVehicleHasBeenOwnedByPlayer(spawned_car,true)
									local id = NetworkGetNetworkIdFromEntity(spawned_car)
									SetNetworkIdCanMigrate(id, true)
									SetEntityInvincible(spawned_car, false)
									SetVehicleOnGroundProperly(spawned_car)
									SetVehicleNumberPlateText(spawned_car,"Hunt "..plate.." ")
									SetEntityAsMissionEntity(spawned_car, true, true)
									SetModelAsNoLongerNeeded(vehicle)
									Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(spawned_car))
								end
								isinjob = true
							else
								Citizen.CreateThread(function()
									Wait(10)
									SetNotificationTextEntry("STRING")
									AddTextComponentString("Zone du véhicule encombrée.")
									DrawNotification(false, false)
								end)
							end
						else
							isinjob = false
							ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

								TriggerEvent('skinchanger:loadSkin', skin)
    
							end)
							RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MUSKET"), true, true)
							missionRunning = false
							RemoveBlip(entityBlip[proie])
							Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(entity[proie]))
							if(spawned_car ~= nil) then
								SetEntityAsMissionEntity(spawned_car, true, true)
								Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(spawned_car))
								spawned_car = nil
							end
							RemoveBlip(avantspawn)
							
						end
					end
				end
					
					if isinjob==true then
						
						if GetDistanceBetweenCoords( GetEntityCoords(GetPlayerPed(-1)),missionCoords[a].x , missionCoords[a].y , missionCoords[a].z, true ) < 80 then
						if (entitySpawned==false) then
								local spawnproie = math.random(1, 12)
								RequestModel(entitySkin[proie]) 
								while not HasModelLoaded(entitySkin[proie]) do
									Wait(1)
								end

								if (avantspawn~= nil) then
									RemoveBlip(avantspawn)
								end
								entity[proie] = CreatePed(entityType[spawnproie], entitySkin[proie], missionCoords[a].x, missionCoords[a].y, missionCoords[a].z, 0, true, true)
								missionX = missionCoords[a].x
								missionY = missionCoords[a].y
								missionZ = missionCoords[a].z
								SetEntityAsMissionEntity(entity[proie], true, true)
								TaskWanderStandard(entity[proie], 0, 0)
								entityBlip[proie] = AddBlipForEntity(entity[proie])
								BeginTextCommandSetBlipName("STRING")
								AddTextComponentString("Proie")
								EndTextCommandSetBlipName(entityBlip[proie])
								entityAlive = true
								entitySpawned = true
								remover = false
								
						end
						
						if (missionRunning == true and entitySpawned == true) then	
							entityHealth[proie] = GetEntityHealth(entity[proie])
							blipid = entityBlip[proie]
							local vX , vY , vZ = table.unpack(Citizen.InvokeNative(0xFA7C7F0AADF25D09, blipid, Citizen.ResultAsVector()))
							entityCoords[proie].x = vX
							entityCoords[proie].y = vY
							entityCoords[proie].z = vZ
							if (entityHealth[proie] == 0 and entityAlive == true) then
								SetBlipColour(entityBlip[proie],3)
								entityAlive = false
								entityRemoved[proie] = false
							end
							
							--Chat(entity[proie])
							if (GetDistanceBetweenCoords( GetEntityCoords(GetPlayerPed(-1)),entityCoords[proie].x , entityCoords[proie].y , entityCoords[proie].z, true ) < 1 and entityAlive == false) then
								if IsPedInAnyVehicle(GetPlayerPed(-1), true) == false then
									TaskStartScenarioInPlace(GetPlayerPed(-1), "CODE_HUMAN_MEDIC_KNEEL", 0, 1)
									ClearPrints()
									SetTextEntry_2("STRING")
									AddTextComponentString("~g~Vous ramassez de la viande fraiche")
									DrawSubtitleTimed(8000, 1)
									Citizen.Wait(8000)
									ClearPedTasksImmediately(GetPlayerPed(-1))
									RemoveBlip(entityBlip[proie])
									Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(entity[proie]))
									TriggerServerEvent('chasse:startRecup')
									entityRemoved[proie] = true
									entitySpawned = false
									proie = math.random(1,12)
									a = math.random(1, 10)
									avantspawn = AddBlipForCoord(missionCoords[a].x,missionCoords[a].y,missionCoords[a].z)
									SetBlipColour(avantspawn,1)
									BeginTextCommandSetBlipName("STRING")
									AddTextComponentString("Proie")
									EndTextCommandSetBlipName(avantspawn)
								else
									drawTxt("Descendez de la voiture pour ramasser la viande",0,1,0.5,0.8,0.6,255,255,255,255)
								end
								
								
							end		
						end
					end
				end
				
		end
    end
end)

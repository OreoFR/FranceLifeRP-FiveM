local pc = {x=-1081.668,y=-244.956,z=37.763}
local spawnVehicles = {x=-1099.021,y=-265.368,z=37.651,a=201.538}
local coffreEntreprise = {x=0,y=0,z=0}

local onlinePlayers = {}

local ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
   local player = xPlayer

	company = AddBlipForCoord(pc.x, pc.y, pc.z)
	SetBlipSprite(company, 269)
	SetBlipAsShortRange(company, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Assurance")
	EndTextCommandSetBlipName(company)


    if(player.job.name == "assureur") then
   		Citizen.CreateThread(function()
			TriggerServerEvent("assureur:addPlayer")
   			while true do
   				Citizen.Wait(0)
   				DrawMarker(1,pc.x,pc.y,pc.z-1,0,0,0,0,0,0,2.001,2.0001,0.5001,0,155,255,200,0,0,0,0)

   				if(isNear(pc)) then
   					if(menuShowed) then
   						Info("Appuyez sur ~g~E~w~ pour éteindre l'ordinateur.")
   					else
   						Info("Appuyez sur ~g~E~w~ pour allumer l'ordinateur.")
   					end

   					if(IsControlJustReleased(1, 38)) then
   						menuShowed = not menuShowed

   						if(menuShowed) then
   							TriggerServerEvent("assureur:getPlayers")
   						end
   					end
   				else
   					if(menuShowed) then
   						menuShowed = false
   						menuId = 0
   					end
   				end
   			end

   		end)

   		launchMenu()

   		if(player.job.grade == "boss") then
   			createSocietyMenu(coffreEntreprise.x,coffreEntreprise.y,coffreEntreprise.z,'assureur', 'Assurance')
   		end
    end
end)




local menuId = 0
local curPlayer = -1
local lostedVehicles = {}
function launchMenu()

	Citizen.CreateThread(function()

		while true do
			Citizen.Wait(0)
			if(menuShowed) then
				if(menuId == 0) then
					TriggerEvent("GUIAssureur:Title", "Assureur")

					for _,k in pairs(onlinePlayers) do
						TriggerEvent("GUIAssureur:Option", k.name, function(cb)
							if(cb) then
								TriggerServerEvent("assureur:getLostedVehicles", k.id)
								curPlayer = k
							end
						end)
					end
				else
					TriggerEvent("GUIAssureur:Title", curPlayer.name)

					TriggerEvent("GUIAssureur:Option", "< Retour", function(cb)
						if(cb) then
							menuId = 0
							curPlayer = -1
							lostedVehicles = {}
						end
					end)
					if(#lostedVehicles > 0) then
						for _,k in pairs(lostedVehicles) do
							local model = GetLabelText(GetDisplayNameFromVehicleModel(k.model))
							TriggerEvent("GUIAssureur:Option", model, function(cb)
								if(cb) then
									spawnVehicle(k)
									menuId = 0
									curPlayer = -1
									lostedVehicles = {}
								end
							end)
						end
					end
				end

				TriggerEvent("GUIAssureur:Update")
			end
		end

	end)

end




function createSocietyMenu(x,y,z,name, menuName)
Citizen.CreateThread(function()
	local menuShowed = false
	while true do
		Citizen.Wait(0)
		local distance = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),x,y,z, true)
		DrawMarker(1,x,y,z-1,0,0,0,0,0,0,2.001,2.0001,0.5001,0,155,255,200,0,0,0,0)
		if(distance > 3 and menuShowed) then
			ESX.UI.Menu.CloseAll()
		end

		if(distance<3) then
			if(menuShowed) then
				Info("Appuyez sur ~g~E~w~ pour ~r~fermer~w~.")
			else
				Info("Appuyez sur ~g~E~w~ pour ~g~accèder~w~ aux fonds de l'entreprise.")
			end

			if(IsControlJustPressed(1, 38)) then
				menuShowed = not menuShowed

				if(menuShowed) then
					print(name)
					renderMenu(name, menuName)
				else
					ESX.UI.Menu.CloseAll()
				end
			end
		end
	end
end)
end


function renderMenu(name, menuName)
	local _name = name
	local elements = {}
	

  	table.insert(elements, {label = 'retirer argent société', value = 'withdraw_society_money'})
  	table.insert(elements, {label = 'déposer argent',        value = 'deposit_money'})
  	table.insert(elements, {label = 'blanchir argent',        value = 'wash_money'})

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'realestateagent',
		{
			title    = menuName,
			elements = elements
		},
		function(data, menu)

			if data.current.value == 'withdraw_society_money' then

				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'withdraw_society_money_amount',
					{
						title = 'montant du retrait'
					},
					function(data, menu)

						local amount = tonumber(data.value)

						if amount == nil then
							ESX.ShowNotification('montant invalide')
						else
							menu.close()
							print(_name)
							TriggerServerEvent('esx_society:withdrawMoney', _name, amount)
						end

					end,
					function(data, menu)
						menu.close()
					end
				)

			end

			if data.current.value == 'deposit_money' then

				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'deposit_money_amount',
					{
						title = 'montant du dépôt'
					},
					function(data, menu)

						local amount = tonumber(data.value)

						if amount == nil then
							ESX.ShowNotification('montant invalide')
						else
							menu.close()
							TriggerServerEvent('esx_society:depositMoney', _name, amount)
						end

					end,
					function(data, menu)
						menu.close()
					end
				)

			end

			if data.current.value == 'wash_money' then

				ESX.UI.Menu.Open(
					'dialog', GetCurrentResourceName(), 'wash_money_amount',
					{
						title = 'blanchir argent'
					},
					function(data, menu)

						local amount = tonumber(data.value)

						if amount == nil then
							ESX.ShowNotification('montant invalide')
						else
							menu.close()
							TriggerServerEvent('esx_society:washMoney', _name, amount)
						end

					end,
					function(data, menu)
						menu.close()
					end
				)

			end

		end,
		function(data, menu)

			menu.close()
		end
	)
end




function spawnVehicle(veh)
	ESX.Game.SpawnLocalVehicle(GetDisplayNameFromVehicleModel(veh.model), {
		x = spawnVehicles.x,
		y = spawnVehicles.y,
		z = spawnVehicles.z
	}, spawnVehicles.a, function(vehicle)
		SetPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
		ESX.Game.SetVehicleProperties(vehicle, veh)
	end)
end


function isNear(tabl)
	local distance = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),tabl.x,tabl.y,tabl.z, true)

	if(distance<3) then
		return true
	end

	return false
end


	

function Info(text, loop)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, loop, 1, 0)
end


RegisterNetEvent("assureur:sendLostedvehicles")
AddEventHandler("assureur:sendLostedvehicles", function(vehicles)
	lostedVehicles = vehicles
	menuId = 1
end)

RegisterNetEvent("assureur:sendOnlinePlayers")
AddEventHandler("assureur:sendOnlinePlayers", function(list)
	onlinePlayers = list
end)


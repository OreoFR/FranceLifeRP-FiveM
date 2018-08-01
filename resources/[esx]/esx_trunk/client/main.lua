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


ESX                           = nil
local GUI      = {}
local PlayerData                = {}
local lastVehicle = nil
local lastOpen = false
GUI.Time                      = 0

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  	PlayerData = xPlayer
end)

function VehicleInFront()
    local pos = GetEntityCoords(GetPlayerPed(-1))
    local entityWorld = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 4.0, 0.0)
    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, GetPlayerPed(-1), 0)
    local a, b, c, d, result = GetRaycastResult(rayHandle)
    return result
end

-- Key controls
Citizen.CreateThread(function()
  while true do

    Wait(0)
    if IsControlPressed(246, Keys["L"]) and (GetGameTimer() - GUI.Time) > 150 then
        local vehFront = VehicleInFront()
	    local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
	    local closecar = GetClosestVehicle(x, y, z, 5.0, 0, 71)
          if vehFront > 0 and closecar ~= nil and GetPedInVehicleSeat(closecar, -1) ~= GetPlayerPed(-1) then
          	lastVehicle = vehFront
    		local model = GetDisplayNameFromVehicleModel(GetEntityModel(closecar))
      		local locked = GetVehicleDoorLockStatus(closecar)
	          ESX.UI.Menu.CloseAll()
            if ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'inventory') then
              SetVehicleDoorShut(vehFront, 5, false)
            else
              if locked == 1 or locked == 0 then
	              SetVehicleDoorOpen(vehFront, 5, false, false)
	              ESX.UI.Menu.CloseAll()
				  OpenVehicleInventory()
	          else
	          	ESX.ShowNotification('Ce coffre est ~r~fermé')
              end
            end
        else
        	ESX.ShowNotification('~r~Aucun~s~ véhicule à proximité')
          end
      lastOpen = true
      GUI.Time  = GetGameTimer()
    elseif lastOpen and IsControlPressed(0, Keys["BACKSPACE"]) and (GetGameTimer() - GUI.Time) > 150 then
      lastOpen = false
      ESX.UI.Menu.CloseAll()
      if lastVehicle > 0 then
      	SetVehicleDoorShut(lastVehicle, 5, false)
      	lastVehicle = 0
      end
      GUI.Time  = GetGameTimer()
    end
  end
end)

function OpenVehicleInventory()
	local vehFront = VehicleInFront()
	local elements = {}


	table.insert(elements, {
      label     = 'Déposer Item',
      count     = 0,
      value     = 'deposit-item',
    })
	table.insert(elements, {
      label     = 'Retirer Item',
      count     = 0,
      value     = 'retrieve-item',
    })
	table.insert(elements, {
      label     = 'Deposer Arme',
      count     = 0,
      value     = 'deposit-weapon',
    })
	table.insert(elements, {
      label     = 'Retirer Arme',
      count     = 0,
      value     = 'retrieve-weapon',
    })
	table.insert(elements, {
      label     = 'Credits',
      count     = 0,
      value     = 'credit',
    })

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vehicle_inventory',
		{
			title = 'Coffre',
			align = 'bottom-right',
			elements = elements,
		},
		function(data, menu)
			if data.current.value == 'deposit-item' then
				DepositItem()
			elseif data.current.value == 'retrieve-item' then
				TriggerServerEvent("esx_truck_inventory:getInventory", GetVehicleNumberPlateText(vehFront))
			elseif data.current.value == 'deposit-weapon' then
				DepositWeapon()
			elseif data.current.value == 'retrieve-weapon' then
				TriggerServerEvent("esx_truck_inventory:getWeapon", GetVehicleNumberPlateText(vehFront))
			elseif data.current.value == 'credit' then
				ESX.ShowNotification('Création originale de ~p~Sylundef~s~, Modification et debug de ~g~~h~@EagleOne')
			end
		end
	)
end

function DepositItem() 
	local elements = {}
	PlayerData = ESX.GetPlayerData()
	for i=1, #PlayerData.inventory, 1 do
		if PlayerData.inventory[i].count > 0 then
			table.insert(elements, {
				label = PlayerData.inventory[i].label .. ' x' ..PlayerData.inventory[i].count,
				count = PlayerData.inventory[i].count,
				value = PlayerData.inventory[i].name,
				name = PlayerData.inventory[i].label,
			})
		end
	end
	
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'inventory_deposit-item',
		{
			title = 'Deposer Item',
			align = 'bottom-right',
			elements = elements,
		},
		function(data, menu)
			ESX.UI.Menu.Open(
				'dialog', GetCurrentResourceName(), 'inventory_deposit-item-count',
				{
					title = 'Quantité'
				},
				function(data2, menu2)
				
					local quantity = tonumber(data2.value)
					vehFront = VehicleInFront()
					
					if quantity > 0 and quantity <= tonumber(data.current.count) and vehFront > 0 then
						local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
						local closecar = GetClosestVehicle( x,y,z, 4.0, 0, 71)
						TriggerServerEvent('esx_truck_inventory:addInventoryItem', GetVehicleClass(closecar), GetDisplayNameFromVehicleModel(GetEntityModel(closecar)), GetVehicleNumberPlateText(vehFront), data.current.value, data.current.label, quantity, data.current.name)
					else
						ESX.ShowNotification('Quantité ~r~Invalide')
					end
					
					ESX.UI.Menu.CloseAll()
					
					local vehFront = VehicleInFront()
		          	if vehFront > 0 then
						TriggerServerEvent("esx_truck_inventory:getInventory", GetVehicleNumberPlateText(vehFront))
		            else
						SetVehicleDoorShut(vehFrontBack, 5, false)
		            end
				end,
				function(data2, menu2)
					SetVehicleDoorShut(vehFrontBack, 5, false)
					ESX.UI.Menu.CloseAll()
				end
			)
		end
	)
end

RegisterNetEvent('closethemenu')
AddEventHandler('closethemenu', function()
ESX.UI.Menu.CloseAll()
end)

RegisterNetEvent('notify')
AddEventHandler('notify', function()
ESX.ShowNotification('Le ~r~maximum~s~ à été atteint pour cet objet')
end)

RegisterNetEvent('esx_truck_inventory:getItems')
AddEventHandler('esx_truck_inventory:getItems', function(inventory)
	local elements = {}
	local vehFrontBack = VehicleInFront()
	
	if inventory ~= nil and #inventory > 0 then
		for i=1, #inventory, 1 do
		  if string.sub(inventory[i].name, 1, 7) ~= "WEAPON_" then
			  if inventory[i].count > 0 then
				table.insert(elements, {
				  label     = inventory[i].label .. ' x' .. inventory[i].count,
				  count     = inventory[i].count,
				  value     = inventory[i].name,
				})
			  end
		  end
		end
	end
	
	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'inventory_retrieve',
	  {
	    title    = 'Items du Coffre',
	    align    = 'bottom-right',
	    elements = elements,
	  },
	  function(data,menu)
		ESX.UI.Menu.Open(
			  'dialog', GetCurrentResourceName(), 'inventory_item_count_give',
			  {
			    title = 'Quantité'
			  },
			  function(data2, menu2)
			
			    local quantity = tonumber(data2.value)
			    vehFront = VehicleInFront()

			    if quantity > 0 and quantity <= tonumber(data.current.count) and vehFront > 0 then
			      TriggerServerEvent('esx_truck_inventory:removeInventoryItem', GetVehicleNumberPlateText(vehFront), data.current.value, quantity)
				  ESX.UI.Menu.CloseAll()
			    else
			      ESX.ShowNotification('Quantité ~r~Invalide')
			    end

	        	local vehFront = VehicleInFront()
	          	if vehFront > 0 then
	          		ESX.SetTimeout(1500, function()
	              		TriggerServerEvent("esx_truck_inventory:getInventory", GetVehicleNumberPlateText(vehFront))
	          		end)
	            else
	              SetVehicleDoorShut(vehFrontBack, 5, false)
	            end
			  end,
			  function(data2, menu2)
	            SetVehicleDoorShut(vehFrontBack, 5, false)
			    ESX.UI.Menu.CloseAll()
			  end
		)
	  end
	)
end)

RegisterNetEvent('esx_truck_inventory:getWeapons')
AddEventHandler('esx_truck_inventory:getWeapons', function(inventory)
	local elements = {}
	local vehFrontBack = VehicleInFront()
	
	if inventory ~= nil and #inventory > 0 then
		for i=1, #inventory, 1 do
		  if string.sub(inventory[i].name, 1, 7) == "WEAPON_" then
			  if inventory[i].count > 0 then
				table.insert(elements, {
				  label     = inventory[i].label .. ' x' .. inventory[i].count,
				  count     = inventory[i].count,
				  value     = inventory[i].name,
				})
			  end
		  end
		end
	end
	
	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'inventory_retrieve',
	  {
	    title    = 'Armes du Coffre',
	    align    = 'bottom-right',
	    elements = elements,
	  },
	  function(data,menu)
		ESX.UI.Menu.Open(
			  'dialog', GetCurrentResourceName(), 'inventory_item_count_give',
			  {
			    title = 'Quantité'
			  },
			  function(data2, menu2)
			
			    local quantity = tonumber(data2.value)
			    vehFront = VehicleInFront()

			    if quantity > 0 and quantity <= tonumber(data.current.count) and vehFront > 0 then
			      TriggerServerEvent('esx_truck_inventory:removeWeapon', GetVehicleNumberPlateText(vehFront), data.current.value, quantity)
			    else
			      ESX.ShowNotification('Quantité ~r~Invalide')
			    end
				
				ESX.UI.Menu.CloseAll()
				
	        	local vehFront = VehicleInFront()
	          	if vehFront > 0 then
	          		ESX.SetTimeout(1500, function()
	              		TriggerServerEvent("esx_truck_inventory:getInventory", GetVehicleNumberPlateText(vehFront))
	          		end)
	            else
	              SetVehicleDoorShut(vehFrontBack, 5, false)
	            end
			  end,
			  function(data2, menu2)
	            SetVehicleDoorShut(vehFrontBack, 5, false)
			    ESX.UI.Menu.CloseAll()
			  end
		)
	  end
	)
end)

function DepositWeapon()
  local elements   = {}
  local playerPed  = GetPlayerPed(-1)
  local weaponList = ESX.GetWeaponList()
  local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
  local closecar = GetClosestVehicle( x,y,z, 4.0, 0, 71)
  local vehFront = VehicleInFront()

  for i=1, #weaponList, 1 do

    local weaponHash = GetHashKey(weaponList[i].name)

    if HasPedGotWeapon(playerPed,  weaponHash,  false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
      local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
      table.insert(elements, {label = weaponList[i].label, value = weaponList[i].name})
    end

  end

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'vehicle_put_weapon',
    {
      title    = 'Déposer Arme',
      align    = 'bottom-right',
      elements = elements,
    },
    function(data, menu)


      TriggerServerEvent('esx_truck_inventory:addWeapon', GetVehicleClass(closecar), GetDisplayNameFromVehicleModel(GetEntityModel(closecar)), GetVehicleNumberPlateText(vehFront), data.current.value, data.current.label, 1, data.current.label)
	  ESX.UI.Menu.CloseAll()
    end,
    function(data, menu)
      ESX.UI.Menu.CloseAll()
    end
  )
end

























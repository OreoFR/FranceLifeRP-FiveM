
local speedBuffer = {}
local velBuffer    = {}
local beltOn       = false
local wasInCar     = false
local played = 0
local advert = 0

IsCar = function(veh)
		    local vc = GetVehicleClass(veh)
		    return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
        end	

Fwv = function (entity)
		    local hr = GetEntityHeading(entity) + 90.0
		    if hr < 0.0 then hr = 360.0 + hr end
		    hr = hr * 0.0174533
		    return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
end

Citizen.CreateThread(function()

    while true do

	if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
		if advert == 0 then
			TriggerEvent("ls:notify", "Pensez à mettre votre ceinture avec X.", 0.500)
			advert = 1
			end
	else
			advert = 0
	end

    played = 0
    Citizen.Wait(1500)
	end

end)

function beltsound()

    TriggerEvent('InteractSound_CL:PlayOnOne', 'beltsound', 0.1)
    played = 1
end



Citizen.CreateThread(function()
	Citizen.Wait(400)
	while true do
		
		local ped = GetPlayerPed(-1)
		local car = GetVehiclePedIsIn(ped)
		
		if car ~= 0 and (wasInCar or IsCar(car)) then
		
			wasInCar = true
			
			if beltOn then DisableControlAction(0, 75)

				if ped == GetLastPedInVehicleSeat(car,-1)then
					SetPedIntoVehicle(ped, car, -1)
				elseif ped == GetLastPedInVehicleSeat(car,0)then
					SetPedIntoVehicle(ped, car, 0)
				elseif ped == GetLastPedInVehicleSeat(car,1) then
					SetPedIntoVehicle(ped, car, 1)
				elseif ped == GetLastPedInVehicleSeat(car,2) then
					SetPedIntoVehicle(ped, car, 2)

 				end

			end



			speedBuffer[2] = speedBuffer[1]
			speedBuffer[1] = GetEntitySpeed(car)




			if speedBuffer[2] ~= nil 
			   and not beltOn
			   and GetEntitySpeedVector(car, true).y > 1.0  
			   and speedBuffer[1] > Cfg.MinSpeed 
			   and (speedBuffer[2] - speedBuffer[1]) > (speedBuffer[1] * Cfg.DiffTrigger) then
			   
				local co = GetEntityCoords(ped)
				local fw = Fwv(ped)
				SetEntityCoords(ped, co.x + fw.x, co.y + fw.y, co.z - 0.47, true, true, true)
				SetEntityVelocity(ped, velBuffer[2].x, velBuffer[2].y, velBuffer[2].z)
				Citizen.Wait(1)
				SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
			end
				
			velBuffer[2] = velBuffer[1]
			velBuffer[1] = GetEntityVelocity(car)
				
			if IsControlJustReleased(0, 73) then
				beltOn = not beltOn				  
				if beltOn then drawNotification("~g~Vous avez mis votre Ceinture")
				else drawNotification("~r~Vous avez retiré votre Ceinture") end 
            end

            if not beltOn and GetEntitySpeed(car) > Cfg.MinSpeed and played == 0 then
               beltsound()
            end

		elseif wasInCar then
			wasInCar = false
			beltOn = false
			speedBuffer[1], speedBuffer[2] = 0.0, 0.0
		end
		Citizen.Wait(10)
	end
end)

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

RegisterNetEvent('ol:ceinture')
AddEventHandler('ol:ceinture', function()
	local ped = GetPlayerPed(-1)
	local car = GetVehiclePedIsIn(ped)
	if car ~= 0 then
		beltOn = not beltOn				  
		if beltOn then drawNotification("~g~Vous avez mis votre Ceinture")
		else drawNotification("~r~Vous avez retiré votre Ceinture") end 
	end
end)

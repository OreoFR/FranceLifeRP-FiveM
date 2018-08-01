                                  ------------------
                                  -- Made By XBVY!--
                                  -- Made By XBVY!--
                                  -- Made By XBVY!--
                                  -- Made By XBVY!--
                                  -- Made By XBVY!--
                                  ------------------
								  --DO NOT REUPLOAD!!!
local randNum = math.random(0, 9)

function DisplayHelpText(str)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentScaleform(str)
    EndTextCommandDisplayHelp(0, 0, 1, -1)
end

function testFunc()
  if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
    DisplayHelpText("~b~Livery ~g~Changed.")
    Citizen.Trace("TEST\n")
  end
end
-- This is MATH.RANDOM!! Which means the same livery could be the same even after you press it since it is MATH.RANDOM
function OTFLivChanger()
  
  for x = 1,5 do
      value = math.random(0,9)
      if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
      SetVehicleLivery(GetVehiclePedIsUsing(GetPlayerPed(-1)), value)
     
      end
  end
end
-- Press HOME to change Livery
Citizen.CreateThread(function()
    while true do
      Wait(0)
      if IsControlJustPressed(1, 213) then
        testFunc()
        end
      if IsControlJustPressed(1, 213) then
        OTFLivChanger()
      end
        
    end
  end) 
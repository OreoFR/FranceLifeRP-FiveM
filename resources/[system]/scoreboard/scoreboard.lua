ESX  							= nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


local listOn = false
local Faketimer = 0
Citizen.CreateThread(function()

if Faketimer >= 3 then
Faketimer = 0
end


    listOn = false
    while true do
        Citizen.Wait(50)

        if IsControlPressed(0, 82)--[[ INPUT_PHONE ]] then
		
            if not listOn then
                local players = {}
                ptable = GetPlayers()
                for _, i in ipairs(ptable) do
                    local wantedLevel = GetPlayerWantedLevel(i)
                    r, g, b = GetPlayerRgbColour(i)
                    table.insert(players, 
                    '<tr style=\"color: rgb(' .. 255 .. ', ' .. 255 .. ', ' .. 255 .. ')\"><td>' .. GetPlayerServerId(i) .. '</td><td>' .. GetPlayerName(i) .. '</td></tr>'
                    )
                end
				if Faketimer >= 2 then
				ESX.TriggerServerCallback('stadusrp_getJobsOnline', function(ems, police, taxi, mek, bil, maklare, ica, spelare)
 myVar2 = ems
 myVar3 = police
 myVar4 = taxi
 myVar5 = mek
 myVar6 = bil
 myVar7 = maklare
 myVar8 = ica
 myVar9 = spelare

          SendNUIMessage({ text = table.concat(players), 
				  ems = myVar2,
  police = myVar3,
  taxi = myVar4,
  mek = myVar5,
  bil = myVar6,
  maklare = myVar7,
  ica = myVar8,
  spelare = myVar9})
	end)
	Faketimer = 0
	else
	          SendNUIMessage({ text = table.concat(players)})
			Faketimer = 0
		end	

                listOn = true
                while listOn do
                    Wait(0)
                    if(IsControlPressed(0, 82) == false) then
                        listOn = false
                        SendNUIMessage({
                            meta = 'close'
                        })
                        break
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function() -- Thread for  timer
	while true do 
		Citizen.Wait(1000)
		Faketimer = Faketimer + 1 
	end 
end)

function GetPlayers()
    local players = {}

    for i = 0, 31 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end
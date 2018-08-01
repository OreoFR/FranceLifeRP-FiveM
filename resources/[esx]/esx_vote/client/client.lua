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

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function OpenVoteMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vote',
		{
			title    = "Candidats",
			elements = {
				{label = "Tony", value = 'Tony'},
				{label = "Alicia", value = 'Alicia'},
				{label = "Vote blanc", value = nil}
			}
		},
		function(data, menu)
			TriggerServerEvent("elec:vote",data.current.value)
			TriggerEvent('esx:showNotification', "Vous avez voté pour "..data.current.label)
			menu.close()
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function drawTxt(text, font, centre, x, y, scale, r, g, b, a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end

-- Create blips
RegisterNetEvent("esx_vote:createBlip")
AddEventHandler("esx_vote:createBlip", function(type, x, y, z)
	local blip = AddBlipForCoord(x, y, z)
	SetBlipSprite(blip, type)
	SetBlipDisplay(blip, 4)
	SetBlipColour (blip, 4)
	SetBlipScale(blip, 1.0)
	SetBlipAsShortRange(blip, true)
	if(type == 419)then
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(_U('vote_blip'))
		EndTextCommandSetBlipName(blip)
	end
end)

Citizen.CreateThread(function()
	TriggerEvent('esx_vote:createBlip', 419, -239.341, -2039.426, 27.755)
end)

-- Display markers
Citizen.CreateThread(function()
	while true do

		Wait(0)

		local coords = GetEntityCoords(GetPlayerPed(-1))

		for k,v in pairs(Config.Zones) do
			if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.MarkerPos.x, v.MarkerPos.y, v.MarkerPos.z, true) < Config.DrawDistance) then
				DrawMarker(v.Type, v.MarkerPos.x, v.MarkerPos.y, v.MarkerPos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
			end
		end

	end
end)

-- Activate menu when player is inside marker
Citizen.CreateThread(function()
	while true do

		Wait(0)

		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		local currentZone = nil

		for k,v in pairs(Config.Zones) do
			if(GetDistanceBetweenCoords(coords, v.MarkerPos.x, v.MarkerPos.y, v.MarkerPos.z, true) < v.Size.x) then
				drawTxt('Utiliser ~g~E~s~ pour ~b~voter', 2, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
				if IsControlJustPressed(1, Keys["E"]) then
					OpenVoteMenu()
				end
			end
		end
	end
end)
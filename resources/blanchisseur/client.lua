--[[
##################
#    Oskarr      #
#    MysticRP    #
#   client.lua   #
#      2017      #
##################
--]]

local showBlip = true -- Show blip on map // afficher le point sur la carte ||||||||| False to disable
local maxDirty = 100000 -- Player allowed to laundering per 100 000 // Le joueur ne peut blanchir que 100 000$ par 100 000$
local openKey = 51 -- PRESS E TO OPEN MENU // APPUYEZ SUR E POUR LE MENU ||||| 51 = E
local emplacement = {
{name="Blanchisserie", id=108, colour=75, x=1269.73, y=-1710.25, z=54.7715},
}
local options = {
    x = 0.1,
    y = 0.2,
    width = 0.2,
    height = 0.04,
    scale = 0.4,
    font = 0,
    menu_title = "Blanchisseur", -- title menu // titre menu
    menu_subtitle = "Menu", -- subtitle menu // sous titre menu
    color_r = 255, -- R
    color_g = 10, -- G
    color_b = 20,  -- B
}

-- Show blip
Citizen.CreateThread(function()
 if (showBlip == true) then
    for _, item in pairs(emplacement) do
      item.blip = AddBlipForCoord(item.x, item.y, item.z)
      SetBlipSprite(item.blip, item.id)
      SetBlipColour(item.blip, item.colour)
      SetBlipAsShortRange(item.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(item.name)
      EndTextCommandSetBlipName(item.blip)
    end
 end
end)

--- Location
Citizen.CreateThread(
	function()
	--X, Y, Z coords 
		local x = 1269.73 
		local y = -1710.25
		local z = 54.7715
		while true do
			Citizen.Wait(0)
			local playerPos = GetEntityCoords(GetPlayerPed(-1), true)
			if (Vdist(playerPos.x, playerPos.y, playerPos.z, x, y, z) < 100.0) then
				DrawMarker(0, x, y, z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.0001, 255, 10, 10,165, 0, 0, 0,0)
				if (Vdist(playerPos.x, playerPos.y, playerPos.z, x, y, z) < 4.0) then						
					DisplayHelpText('Appuyez sur ~INPUT_CONTEXT~ pour ~g~blanchir~s~ votre ~r~argent sale')
					if (IsControlJustReleased(1, openKey)) then 
						BlanchirMenu()
						Menu.hidden = not Menu.hidden
					end
					Menu.renderGUI(options) 
				end

			end
		end
end)


---- FONCTIONS ----
function Notify(text)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(text)
	DrawNotification(false, false)
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
---------------------
---- Menu
function BlanchirMenu()
   options.menu_subtitle = "Blanchisserie"
    ClearMenu()
	Menu.addButton("Blanchir", "Blanchir", -1)
	Menu.addButton("Fermer", "CloseMenu", nil)
end

function CloseMenu()
    Menu.hidden = true
end
--------------------------------------------
function Blanchir(amount)
		if(amount == -1) then
			DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8S", "", "", "", "", "", 20)
			while (UpdateOnscreenKeyboard() == 0) do
				DisableAllControlActions(0);
				Wait(0);
			end
			if (GetOnscreenKeyboardResult()) then
				local res = tonumber(GetOnscreenKeyboardResult())
				if(res ~= nil and res ~= 0 and res <= maxDirty) then 
					amount = res		
                else
                 Notify("~r~Tu ne peut pas blanchir une si grosse somme d'un coup !")				
				end
			end
		end
		if(amount ~= -1) then
			TriggerServerEvent("blanchisseur:BlanchirCash", amount)
		end
end
-----------------

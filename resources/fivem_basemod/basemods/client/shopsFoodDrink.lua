------------------------------------------------------------------------------------------------------------------------- Liste des magasins (24 7)
------------------------------------------------------------------------------------------------------------------------- List of shops (24 7)
-- xDrawer, yDrawer, zDrawer, xCommerçant, yCommerçant, zCommerçant, rCommerçant, Skin du commerçant
local twentyfourseven_shops = {
{26.384, -1347.485, 28.597, 24.444, -1347.345, 28.597, -90.0, "a_m_m_hasjew_01"},
}

---------------------------------------------------------------------------------------------------------- On créer les marqueurs des magasins sur la minimap
---------------------------------------------------------------------------------------------------------- Create shops markers in the minimap
Citizen.CreateThread(function()
for i = 1, #twentyfourseven_shops do
local blip = AddBlipForCoord(twentyfourseven_shops[i][1], twentyfourseven_shops[i][2], twentyfourseven_shops[i][3])
SetBlipSprite(blip, 52)
SetBlipScale(blip, 0.8)
SetBlipAsShortRange(blip, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("24 7 Supermarchés")
EndTextCommandSetBlipName(blip)
end
end)

---------------------------------------------------------------------------------------------------------- On créer les marqueurs au sol
---------------------------------------------------------------------------------------------------------- Create the markers on the ground
Citizen.CreateThread(function()
while true do
Citizen.Wait(0)

for i = 1, #twentyfourseven_shops do
DrawMarker(1,twentyfourseven_shops[i][1],twentyfourseven_shops[i][2],twentyfourseven_shops[i][3],0,0,0,0,0,0,1.001,1.0001,0.5001,236,138,22,200,0,0,0,0)
end

end
end)

Citizen.CreateThread(function()
ClearTimecycleModifier()
ResetPedMovementClipset(GetPlayerPed(-1), 0)
end)
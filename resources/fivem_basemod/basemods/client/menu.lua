-------------------------------------------------------------------------------------------------------------------------------------------- Thread de connection au serveur
-------------------------------------------------------------------------------------------------------------------------------------------- Thread to connection to the server
local openMenuInteractif = false
Citizen.CreateThread(function()
while true do
Citizen.Wait(0)

if IsControlJustPressed(1, 167) then
TriggerEvent("bm_sendNuiMessage", {mod="baseMods", type="menuInteractif", command="f6",})
end

if IsControlJustPressed(1, 27) then
TriggerEvent("bm_sendNuiMessage", {mod="baseMods", type="menuInteractif", command="up",})
end

if IsControlJustPressed(1, 173) then
TriggerEvent("bm_sendNuiMessage", {mod="baseMods", type="menuInteractif", command="down",})
end

if IsControlJustPressed(1, 201) then
TriggerEvent("bm_sendNuiMessage", {mod="baseMods", type="menuInteractif", command="enter",})
end

if IsControlJustPressed(1, 322) then
TriggerEvent("bm_sendNuiMessage", {mod="baseMods", type="menuInteractif", command="esc",})
end

end
end)

-------------------------------------------------------------------------------------------------------------------------------------------- On écoute le JQUERY | Listen the JQUERY
local listEmotes = {
{"drink", "WORLD_HUMAN_DRINKING", 10000}, -- Drinking
}

RegisterNUICallback('listen_menu_interactif', function(data, cb)
local action = data.action

Citizen.CreateThread(function()

for i = 1, #listEmotes do
if(action == listEmotes[i][1]) then

end
end

end)

end)
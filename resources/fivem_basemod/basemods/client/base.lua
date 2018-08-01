-------------------------------------------------------------------------------------------------------------------------------------------- Activation ou non des fonctions
-------------------------------------------------------------------------------------------------------------------------------------------- Activation or not of functions
-- true ou false
local parameters = {
["avoirSoif"] = true, -- Enable the urge to drink
["activateEat"] = true,
["activateWC"] = true,
["devise"] = "$",
["langue"] = "FR", -- FR or EN... | add the language in html/languages.js file
["primaryColor"] = "#007E00", -- Couleur primaire en héxadécimale | Primary color in hexadecimal
["secondaryColor"] = "#41C541",
}

-------------------------------------------------------------------------------------------------------------------------------------------- On écoute le menu
-------------------------------------------------------------------------------------------------------------------------------------------- Listen the GTA menu 
local pauseMenu = false -- IMPORTANT !!!
Citizen.CreateThread(function()
while true do
Citizen.Wait(0)

if IsPauseMenuActive() and not pauseMenu then
pauseMenu = true
TriggerEvent("bm_sendNuiMessage", {mod="baseMods", type="openMenu"})
elseif not IsPauseMenuActive() and pauseMenu then
pauseMenu = false
TriggerEvent("bm_sendNuiMessage", {mod="baseMods", type="openMenu"})
end

end
end)

-------------------------------------------------------------------------------------------------------------------------------------------- Thread de connection au serveur
-------------------------------------------------------------------------------------------------------------------------------------------- Thread to connection to the server
Citizen.CreateThread(function()

if NetworkIsSessionStarted() then -- Si on vient de ce connecter au serveur | If you just connect to the server
TriggerServerEvent('bm:sessionStarted')
Citizen.Trace('Connexion')

-- Debug menu si rechargement du mod
-- Debug menu if reloading the "baseMods"
if IsPauseMenuActive() and not pauseMenu then
menu = 2
elseif not IsPauseMenuActive() and pauseMenu then
menu = 1
end

RegisterNetEvent('bm_recupInfosPlayer')
AddEventHandler('bm_recupInfosPlayer', function(infos) -- On récupère les informations du joueur | Get the informations of the player

if(infos == nil) then -- Si le joueur est nouveau | If the player its a new gamer
TriggerEvent("bm_sendNuiMessage", 
{
mod = "baseMods", 
type = "connexion", 
money = 0, 
job = 5, 
drink = 100, 
eat = 100, 
wc = 100, 
maladie = 0,
mainView = menu,
avoirSoif = parameters["avoirSoif"],
activateEat = parameters["activateEat"],
activateWC = parameters["activateWC"],
devise = parameters["devise"],
langue = parameters["langue"],
primaryColor = parameters["primaryColor"],
secondaryColor = parameters["secondaryColor"],
})
_G['soifActuelle'] = 100
else -- Si le joueur existe | If the player exist in the dataBase
TriggerEvent("bm_sendNuiMessage", 
{
mod = "baseMods", 
type = "connexion", 
money = infos.money_joueur, 
job = infos.job_joueur, 
drink = infos.drink_joueur, 
eat = infos.eat_joueur, 
wc = infos.wc_joueur, 
maladie = infos.maladie_joueur, 
mainView = pauseMenu, 
avoirSoif = parameters["avoirSoif"],
activateEat = parameters["activateEat"],
activateWC = parameters["activateWC"],
devise = parameters["devise"],
langue = parameters["langue"],
primaryColor = parameters["primaryColor"],
secondaryColor = parameters["secondaryColor"],
})
_G['soifActuelle'] = infos.drink_joueur
end

if(_G['soifActuelle'] <= 0) then
activeDrinkEat('spectator5')
end

end)

end

end)

-------------------------------------------------------------------------------------------------------------------------------------------- Fonctions si on a faim ou soif
-------------------------------------------------------------------------------------------------------------------------------------------- Functions if you are hungry or thirsty 
function activeDrinkEat()
SetTimecycleModifier("spectator5")
SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
end

function desactiveDrinkEat()
ClearTimecycleModifier()
ResetPedMovementClipset(GetPlayerPed(-1), 0)
end

-------------------------------------------------------------------------------------------------------------------------------------------- Soif
-------------------------------------------------------------------------------------------------------------------------------------------- Thirst

if parameters["avoirSoif"] then

_G['moinsDrink'] = 1 -- Valeur initiale d' augmentation de la soif | Basic value of thirst increase
local interactionDrink = true -- IMPORTANT !!!

-- On écoute sa soif selon différentes circonstances (courir, nager, climat...) | Listen the thirst according to different circumstances (run, swim, climate)
Citizen.CreateThread(function()
while true do
Citizen.Wait(15000) -- On actualiste toutes les x secondes
--Citizen.Trace(_G['soifActuelle'])

local ply = GetPlayerPed(-1)

-- Si on fait un effort physique (-2) | if you make a physical effort
if IsPedRunning(ply) or -- On cours | Run
IsPedHurt(ply) or -- Si le joueur est blessé | If the player is injured
IsPedCuffed(ply) -- Donner un coup de poing | Give a punch
then
_G['moinsDrink'] = 2
end

-- Si on fait un gros effort physique (-3) | if you make a big physical effort
if IsPedSprinting(ply) or -- Si on cours vite | Fast run
IsPedClimbing(ply) or-- Si on escalade | Climb
IsPedSwimming(ply) or IsPedSwimmingUnderWater(ply) or -- nager + nager sous l' eau | swin + swim underwater
IsPedFatallyInjured(ply) -- Si le joueur est gravement blessé | If the player is seriously injured
then
_G['moinsDrink'] = 3
end

_G['soifActuelle'] = _G['soifActuelle'] - _G['moinsDrink'] -- On calcul la nouvelle valeur | Calculate a new value

if(_G['soifActuelle'] > 0 and interactionDrink) then
updateDimRP("drink_joueur", _G['moinsDrink']) -- On augmente l' envie de boire | Increases the urge to drink
desactiveDrinkEat()
elseif(_G['soifActuelle'] < 0 and interactionDrink) then
updateRP("drink_joueur", 0)
interactionDrink = false
activeDrinkEat()
end

end
end)

end -- Fin de l' activation ou non | End of activation of thirst 

--------------------------------------------------------------------------------------------------------------------------------------------  Update de diminution
--------------------------------------------------------------------------------------------------------------------------------------------  Update of decrease
function updateDimRP(el, value)
TriggerServerEvent('bm:updateAugDimBDD', {{el, "-", value}}) -- On envoi à la BDD
TriggerEvent("bm_sendNuiMessage", {mod="baseMods", type="updateRP", element=el, calc="-", value=value, valueActuelle=_G['soifActuelle']}) -- Envoi d' un message UI | Send UI msg
_G['moinsDrink'] = 1
end

--------------------------------------------------------------------------------------------------------------------------------------------  Update (mise à 0 ou 100)
--------------------------------------------------------------------------------------------------------------------------------------------  Update (reset 0 or 100)
function updateRP(el, value)
TriggerServerEvent('bm:updateBDD', {{el, value}}) -- On envoi à la BDD
TriggerEvent("bm_sendNuiMessage", {mod="baseMods", type="updateResetRP", element=el, value=value}) -- Envoi d' un message UI
_G['moinsDrink'] = 1
end

-------------------------------------------------------------------------------------------------------------------------------------------- Éléments NUI | Element NUI
AddEventHandler("bm_sendNuiMessage", function(dataArray)
if(dataArray.type == "viewMsg") then
if not IsPauseMenuActive() then
SendNUIMessage(dataArray)
end

else
SendNUIMessage(dataArray)
end

end)
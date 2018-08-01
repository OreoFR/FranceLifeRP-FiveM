# ESX_Cinema

Cette ressource provient à l'origine de :
https://github.com/davedumas0/fiveM-movies

Merci à Daviddumas0. Cette ressource doit être améliorée encore.

Modifiée par Mr Reiben pour ESX avec sélection du film à l'entrée, repop à la sortie du cinéma d'entrée et paiement du prix de la place.

si vous utilisez ESX_Voice, modifier le client\main.lua avec :
- ajoutez en haut :
local inCinema = false

- et remplacer :

 if NetworkIsPlayerTalking(PlayerId()) then
   drawLevel(41, 128, 185, 255)
 elseif not NetworkIsPlayerTalking(PlayerId()) then
   drawLevel(185, 185, 185, 255)
 end

par : 

if NetworkIsPlayerTalking(PlayerId()) and inCinema == false then
      drawLevel(41, 128, 185, 255)
    elseif not NetworkIsPlayerTalking(PlayerId()) and inCinema == false then
      drawLevel(185, 185, 185, 255)
    end
	
- Pour terminer, à la fin, ajoutez :

RegisterNetEvent('GetOutCinema')
AddEventHandler('GetOutCinema', function()
  if inCinema == true then
	inCinema = false
  end
end)

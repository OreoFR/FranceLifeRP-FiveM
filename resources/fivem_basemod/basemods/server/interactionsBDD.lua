------------------------------------------------------------------------------------------ Calcul du nombre d' éléments dans un tableau multidimensionnel
------------------------------------------------------------------------------------------ Calculation of the number of elements in array multidimensional
function calcMultiDim(array)
local count = 0
for i = 0, #array do
count = count + 1
end
return count
end

------------------------------------------------------------------------------------------ On charge la librairie MYSQL | Load library MYSQL
require "resources/baseMods/lib/MySQL"

------------------------------------------------------------------------------------------ Connexion à la BDD | Connection to the DataBase
-- MySQL:open("IP", "databasname", "user", "password")
MySQL:open("127.0.0.1", "gta5basemods", "root", "") -- Change the identifiers for your dataBase

----------------------------------------------------------------------------------------------------------------------------------------------- Connexion au serveur
----------------------------------------------------------------------------------------------------------------------------------------------- Connect to the server
------------------------------------------------------------------------------------------ On récupère l' ID en jeu du joueur (steam...) | Get ID in game of the player
RegisterServerEvent('bm:sessionStarted')
AddEventHandler('bm:sessionStarted', function()

local players = GetPlayerIdentifiers(source)

for i = 1, #players do
_G['thisPlayer'] = players[i]
end

registerPlayer()

end)
------------------------------------------------------------------------------------------ On enregistre le joueur sur la BDD (On contrôle toujours avant s' il existe déjà)
------------------------------------------------------------------------------------------ Register the player in dataBase (It' s always checked if he is in the database)
function registerPlayer()
if(controlExistPlayer() == nil) then
MySQL:executeQuery("INSERT INTO joueur (`idInGame_joueur`) VALUES ('@thisPlayer')",
{['@thisPlayer'] = _G['thisPlayer']})
end
end

------------------------------------------------------------------------------------------ On vérifie si le joueur est connu du serveur + récupération des infos
------------------------------------------------------------------------------------------ It' s checked if he is in the database + Get all informations
function controlExistPlayer()
local requete = MySQL:executeQuery("SELECT * FROM joueur WHERE idInGame_joueur = '@name'", {['@name'] = _G['thisPlayer']})
local result = MySQL:getResults(requete, {'money_joueur', 'job_joueur', 'rankJob_joueur', 'drink_joueur', 'eat_joueur', 'eat_joueur', 'wc_joueur', 'maladie_joueur'}
, "idInGame_joueur")

if(result[1] ~= nil) then  
_G['thisPlayerInfos'] = result[1] -- Si le joueur existe dans la BDD on récupère ses informations | If the player exist in the database, Its information is retrieved
else
_G['thisPlayerInfos'] = nil -- Si le joueur n' existe pas dans la BDD | If the player doesnt exist in the DataBase
end

actionsStartPlayer()
return _G['thisPlayerInfos']

end

------------------------------------------------------------------------------------------ On lance des actions de connexion | Connection actions are started
function actionsStartPlayer()
TriggerClientEvent('bm_recupInfosPlayer', source, _G['thisPlayerInfos'])
--print(_G['thisPlayerInfos'].money_joueur)
end

----------------------------------------------------------------------------------------------------------------------------------------------- Updates avec la BDD
----------------------------------------------------------------------------------------------------------------------------------------------- Updates normal with the DataBase
------------------------------------------------------------------------------------------ On traite la demande d' update
RegisterServerEvent('bm:updateBDD')
AddEventHandler('bm:updateBDD', function(arrayData)

local arraySize = calcMultiDim(arrayData)
--print(arraySize)

if(arraySize == 2) then
oneUpdateBDD(arrayData)
elseif(arraySize > 2) then
multiUpdateBDD(arrayData)
else
-- rien
end

end)

------------------------------------------------------------------------------------------ On change une seule valeur dans la BDD | Change just one information in the DataBase
function oneUpdateBDD(array)
local key = array[1][1]
local value = array[1][2]
local requete = MySQL:executeQuery("UPDATE joueur SET @key='@value' WHERE idInGame_joueur = '@name'",
{['@key'] = key, ['@value'] = value, ['@name'] = _G['thisPlayer']})

end

------------------------------------------------------------------------------------------ On change plusieurs valeurs dans la BDD
------------------------------------------------------------------------------------------ Change several informations in the DataBase
function multiUpdateBDD()
-- soon
end

----------------------------------------------------------------------------------------------------------------------------------------------- Updates (augmentation & diminution)
----------------------------------------------------------------------------------------------------------------------------------------------- Updates (increase & decrease)
------------------------------------------------------------------------------------------ On traite la demande d' update | We process the update request
RegisterServerEvent('bm:updateAugDimBDD')
AddEventHandler('bm:updateAugDimBDD', function(arrayData)

local arraySize = calcMultiDim(arrayData)
--print(arraySize)

if(arraySize == 2) then
oneUpdateAugDimBDD(arrayData)
elseif(arraySize > 2) then
multiUpdateAugDimBDD(arrayData)
else
-- rien
end

end)

------------------------------------------------------------------------------------------ On change une seule valeur (augmentation ou diminution) dans la BDD
------------------------------------------------------------------------------------------ Change just one (increase & decrease) in the dataBase
function oneUpdateAugDimBDD(array)
local key = array[1][1]
local augDim = array[1][2] -- Augmentation ou diminution soit "-" ou "+"
local value = array[1][3]

local requete = MySQL:executeQuery("UPDATE joueur SET @key=@key @augDim @value WHERE idInGame_joueur = '@name'",
{['@key'] = key, ['@augDim'] = augDim, ['@value'] = value, ['@name'] = _G['thisPlayer']})

end

------------------------------------------------------------------------------------------ On change plusieurs valeurs (augmentation ou diminution) dans la BDD
------------------------------------------------------------------------------------------ Change several (increase & decrease) in the dataBase
function multiUpdateAugDimBDD()
-- soon
end
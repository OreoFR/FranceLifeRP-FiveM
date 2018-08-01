# fiveM_baseMods :earth_americas: 
# Version 1.1.4
Mode de base pour five M sur gta V by Mathieu Mari | Base mod for five M in gta V by Mathieu Mari

Installation
-------------------------------------------------------------

>Français
-------------------------------------------------------------
0. Ne pas utiliser avec Essential-Mode ou autres modes de base. IMPORTANT !!!
1. Lancer un éxecutable pour MYSQL (ex: easyphp, wamp, xampp...). Je conseil easyphp sous windows.
2. On insère le côté SQL dans sa base de données. Contenu SQL dans le fichier sql.sql
3. Mettre le dossier baseMods dans son dossier fiveM "resources" côté serveur
4. On modifie les identifiants MYSQL dans le fichier server/interactionsBDD.lua soit 'MySQL:open("127.0.0.1", "gta5basemods", "root", "")'
5. Ajouter la ligne "- basemods" dans son fichier citmp-server.yml côté serveur
6. Tous les textes sont stockés dans le fichier html/languages.js. Le système peut facilement passer d' une langue à une autre
7. Change your settings in the client/base.lua file.
8. Enjoy !

>English
-------------------------------------------------------------
0. Do not use any other base mode (ex: Essential-mode...) IMPORTANT !!!
1. Launch an executable for MYSQL (ex: easyphp, wamp, xampp ...). I advice easyphp under windows.
2. Insert the SQL side in its database. SQL content in the sql.sql file
3. Set the "baseMods" folder to its server-side fiveM "resources" folder
4. Change the MYSQL identifiers in the server/interactionsBDD.lua file either: MySQL:open("127.0.0.1", "gta5basemods", "root", "")'
5. Add the "- basemods" line to its server-side citmp-server.yml file
6. All texts are stored in the html/languages.js file. The system can easily switch from one language to another
7) Pour régler ses paramètres il faut ce rendre sur le fichier client/base.lua
8. Enjoy !

Commandes | Commands
-------------------------------------------------------------

>Français
-------------------------------------------------------------

#### Donner de l' argent à un joueur ou en retirer:
```
TriggerServerEvent('bm:updateAugDimBDD', {{"money_joueur", "+", 5000}}) -- On envoi à la BDD
TriggerEvent("bm_sendNuiMessage", {mod="baseMods", type="moneyChange", typeMoney=1, addDim='+', montant=5000}) -- Envoi d' un message UI
```
L' exemple ci-dessous permet de donner 5000 $ à un joueur. Si on veut lui enlever 5000 $ par exemple, remplacer "+" par "-" 
Le système gère l' intéraction UI de lui même 

#### Update d' un seul élément:
```
TriggerServerEvent('bm:updateBDD', {{el, value}}) | soit el=nomColonneBDD, value=nouvelleValeur
```
Exemple: TriggerServerEvent('bm:updateBDD', {{'money_joueur', 5000}}) | On fixe le portefeuille du joueur à 5000 $

#### Update d' augmentation ou diminution d' un seul élément: 
```
TriggerServerEvent('bm:updateAugDimBDD', {{el, "signe", value}}) | soit el=nomColonneBDD, signe=-ou+ ,value=nouvelleValeur
```
Exemple: TriggerServerEvent('bm:updateAugDimBDD', {{'money_joueur', "-", 5000}}) | On enlève 5000 $ au joueur

#### Envoi d' un message de zone à l' interface UI (génial pour les markers au sol "drawMarker")
```
TriggerEvent("bm_sendNuiMessage", {mod="baseMods", type="viewMsg", model="zone", text=1})
```
On modifie uniquement le "model" et le "text". Le "model" représente un modèle d' affichage pour l' UI HTML et le "text" représente la correspondance du tableau qui est dans le html/languages.js
Dans l' exemple "TriggerEvent" ci-dessous on affiche donc "Appuyez sur H pour sortir votre camion du garage" dans un temps très court car c' est un système spécialement fait pour les zones.

#### Envoi d' un message de mission à l' interface UI (pensé pour donner des instructions aux joueurs pendant une mission...)
```
TriggerEvent("bm_sendNuiMessage", {mod="baseMods", type="viewMsg", model="mission", text=9})
```
Même chose que l' exemple précédent sauf qu' on spécifie que c' est un modèle de mission (l' affichage dure plus longtemps)

Mises à jour | Changelog
-------------------------------------------------------------

>V.1.1.4
- Ajout d' un menu personnel à ouvrir avec f6 et pilotable avec les flèches

IMPORTANT !!!
Il faut prendre désormais le dossier basemods et non baseMods car le fait d' avoir une majuscule provoque un bug avec les commandes NUI de fiveM

>V.1.0.4
- Modification mineur du système de paramétrage
- On active les fonction RP, langues etc.... sur le fichier client/base.lua
- Permet d' afficher ou non la faim, soif, wc

>V.1.0.3
- Ajout d' une fonction pour ajouter et enlever de l' argent à un joueur
- Optimisation de l' interface UI

Centralisation des paramétrages sur le fichier html/params.js
On peut actuellement choisir sa langue et sa devise monétaire


>V.1.0.2
- Traduction en anglais du mod (pas le meilleur des anglais je vous l' accorde) | English Translate 
- Ajout d' un système pour jouer un son | Add the system for play sound
- Re-organisation des dossiers et fichiers | Re organization of folders and files
- Passage du moteur MYSQL InnoDB vers MYISAM pour plus de rapiditer | MYSQL (InnoDB to MYISAM) More speed

IMPORTANT !!!
Faites la commandes ci-dessous si vous avez déjà une base de donnée baseMods
```
ALTER TABLE `joueur` ENGINE=MYISAM;
```

>V.1.0.1
- Ajout de la soif, si notre personnage arrive à 0/100 il a une vue trouble et ne peut pas courir
- Début d' un système de magasins pour pouvoir acheter des boissons et de la nourriture pour regénérer son personnage
- Amélioration des performances du script dans sa globalité
- Re-structuration du script html/js/css
- Ajout d' une fonction d' augmentation ou diminution SQL "update" dans le fichier server/interactionsBDD.lua

>V.1.0.0
- Création d' un mode de base pour Gta V fiveM
- Gestionnaire MYSQL (by Kanersps)
- Interface UI
- Écoute du menu Gta V
- Écoute des connexions et intéractions
- Événement MYSQL update soit: TriggerServerEvent('bm:updateBDD', {{"drink_joueur", 20}}) | {{"nomColonneBDD", nouvelleValeur}}

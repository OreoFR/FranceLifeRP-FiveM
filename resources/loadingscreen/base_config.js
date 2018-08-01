/*
    This script was developed by Piter Van Rujpen/TheGamerRespow for Vulkanoa (https://discord.gg/bzMnYPS).
    Do not re-upload this script without my authorization.
*/

VK.config.loadingSessionText = "Chargement de la session..."; // Loading session text
VK.config.firstColor = [255, 150, 0];
VK.config.secondColor = [0, 191, 255];
VK.config.thirdColor = [52, 152, 219];

VK.backgrounds.list = [ // Backgrounds list, can be on local or distant (http://....)
    "img/1.jpg",
    "img/2.jpg",
    "img/3.jpg"
];
VK.backgrounds.duration = 3000; // Background duration (in ms) before transition (the transition lasts 2000 ms)

VK.tips.enable = true; //Enable tips (true : enable, false : prevent)
VK.tips.list = [ // Tips list
    "Appuyez sur \"Y\" pour accèder à votre iPhone, attention il faut d'abord le récupérer aux bureaux de Life Invader !",
    "Appuyez sur \"T\" pour accèder à votre menu personnel !",
    "Appuyez sur \"U\" pour vérouiller ou déverouiller votre véhicule !",
    "Maintenez \"X\" pour mettre vos mains en l'air !",
];

VK.music.url = "Naza.ogg"; // Music url, can be on local or distant (http://....) ("NONE" to desactive music)
VK.music.volume = 1; // Music volume (0-1)
VK.music.title = "Niska"; // Music title ("NONE" to desactive)
VK.music.submitedBy = "suggérée par Soso"; // Music submited by... ("NONE" to desactive)

VK.info.logo = "icon/france_life_rp.png"; // Logo ("NONE" to desactive)
VK.info.text = "fondé et développé par Soso"; // Bottom right corner text ("NONE" to desactive) 
VK.info.website = "FranceLifeRp.com"; // Website url ("NONE" to desactive) 
VK.info.ip = "145.239.74.177:2302"; // Your server ip and port ("ip:port")

VK.social.discord = ".me/vulkanoa"; // Discord url ("NONE" to desactive)
VK.social.twitter = "/vulkanoa"; // Twitter url ("NONE" to desactive)
VK.social.facebook = "/vulkanoa"; // Facebook url ("NONE" to desactive)
VK.social.youtube = "/thegamerrespow"; // Youtube url ("NONE" to desactive)
VK.social.twitch = "/thegamerrespow"; // Twitch url ("NONE" to desactive)

VK.players.enable = true; // Enable the players count of the server (true : enable, false : prevent)
VK.players.multiplePlayersOnline = "@players joueurs en ligne"; // @players equals the players count
VK.players.onePlayerOnline = "1 joueur en ligne"; // Text when only one player is on the server
VK.players.noPlayerOnline = "Aucun joueur en ligne"; // Text when the server is empty
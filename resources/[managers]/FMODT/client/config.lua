--Change this to edit the Keyboard Opening Key (Other Keys at wiki.fivem.net/wiki/Controls)
KBKey = 166

--Change this to edit the Gamepad Opening Keys (Other Keys at wiki.fivem.net/wiki/Controls)
GPKey1 = 90
GPKey2 = 179

--Change "false" to "true" to disable the Menu for Non-Admins
OnlyForAdmins = true

--Change "true" to "false" to enable the Stunt Jumps by default
StuntJump = true

--Change "false" to "true" to disable the No Clip Mode and the World Menu for Non-Admins
WorldAndNoClipOnlyAdmins = true

--Change "false" to "true" to disable the Bodyguard Menu for Non-Admins
BodyguardsOnlyAdmins = true

--Change "false" to "true" to disable the Teleport Menu for Non-Admins
TeleportOnlyAdmins = true

--Change "true" to "false" to disable Player Bips
playerBlips = true

--Change "true" to "false" to disable Player Bips on Non-Admins Clients
BlipsAndNamesNonAdmins = false

--Change "true" to "false" to disable PvP
PvP = true

--Change "true" to "false" to disable the Extendable Map
ExtendableMap = true

--Change "true" to "false" to enable the Fort Zancudo Gates
RemoveFortZancudoGates = true

--Change This To Change The Vehicle The "Vehicle Gun" Is Shooting
VehicleGunVehicle = "ZENTORNO"

--Change "true" to "false" to disable Join Messages
JoinMessage = true

--Change "true" to "false" to disable Left Messages
LeftMessage = true

--Change "true" to "false" to disable Death Messages
DeathMessage = true

--Change "true" to "false" to disable the Scoreboard
Scoreboard = true

--Change "true" to "false" to disable the Voice Chat
VoiceChat = true

--Change the Float Value to change the default Voice Chat Proximity
VoiceChatProximity = 10.00 --In Meters, 0.00 means the whole Lobby

SettingsScoreboard = {
	--Should the scoreboard draw wanted level?
	["WantedStars"] = true,
	
	--Should the scoreboard draw player ID?
	["PlayerID"] = true,
	
	--Should the scoreboard draw voice indicator?
	["VoiceIndicator"] = true,
	
	--Display time in milliseconds
	["DisplayTime"] = 5000,
	
	--Keys that will activate the scoreboard.
	--Change only the number value, NOT the 'true'
	--Multiple keys can be used, simply add another row with another number
	--See: https://wiki.gtanet.work/index.php?title=Game_Controls
	
	--MultiplayerInfo / Z
	[20] = true,
	
	--Detonate / G
	--[47] = true,
}


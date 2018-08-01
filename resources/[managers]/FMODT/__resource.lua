resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'CHEM!CAL T0Ж!N' 				-- Resource Description

ui_page 'nui/index.html'					-- NUI Page

server_script {								-- Server Scripts
	'server/server.lua',
}

files {
	'nui/index.html',						-- NUI File
	'nui/JumpMode.ogg',						-- Audio File
}

client_script {								-- Client Scripts
	'client/DoNotTouch/GUI.lua',
	'client/DoNotTouch/GlobalVariablesAndFunctions.lua',
	'client/DoNotTouch/settings.lua',
	'client/language/language.lua',
	'client/about/about.lua',
	'client/admin/admin.lua',
	'client/general/general.lua',
	'client/main/main.lua',
	'client/misc/misc.lua',
	'client/player/player.lua',
	'client/player/componentChanger.lua',
	'client/player/outfits.lua',
	'client/teleport/teleport.lua',
	'client/vehicle/vehicle.lua',
	'client/vehicle/vehicleSpawn.lua',
	'client/vehicle/vehicleTuning.lua',
	'client/vehicle/vehicleSaving.lua',
	'client/weapons/weapons.lua',
	'client/world/world.lua',
	'client/config.lua',
}

-- Menu Base By: MrDaGree (aka TylerMcGrubber)
-- CHEM!CAL T0Ж!N By: FlatracerMOD (aka Flatracer)
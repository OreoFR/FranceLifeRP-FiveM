----------------------------------------------------------------------
----------------------- Developped by AlphaKush ----------------------
----------------------------------------------------------------------

Config              = {}
Config.DrawDistance = 100.0
Config.MarkerColor  = {r = 120, g = 120, b = 240}
Config.EnableSocietyOwnedVehicles = false -- à tester
Config.EnablePlayerManagement     = true
Config.MaxInService               = -1
Config.Locale = 'fr'

Config.Zones = {

	CloakRoom = { --Vestaire privé président
		--Pos   = {x = 126.43100738525, y = -729.10052490234, z = 241.15190124512},
		Pos   = {x = 2795.9741210938, y = -730.05053710938, z = 7.6600012779236},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 204, b = 3},
		Type  = 1
	},

	CloakRoom2 = { --Vestaire garde du corps
		Pos   = {x = -475.04498291016, y = -326.22766113281, z = 98.013450622559},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 204, b = 3},
		Type  = 1
	},

	OfficeEnter = { --entré du batiement
		Pos   = {x = -429.0690612793, y = 1110.7834472656, z = 326.69631958008},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 204, b = 3},
		Type  = 1
	},

	OfficeExit = { -- sorti du batiment
		--Pos   = {x = 136.16203308105, y = -761.72442626953, z = 241.15211486816},
		Pos   = {x = -486.63452148438, y = -335.03411865234, z = 90.007614135742},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 91, b = 0},
		Type  = 1
	},

	OfficeInside = { -- spawn interieur batiment
		--Pos   = {x = 135.32885742188, y = -764.09942626953, z = 241.15211486816},
		Pos   = {x = 2781:4018554688, y = -720.44677734375, z = 7.740065574646},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Type  = -1
	},

	OfficeOutside = { --spawn exterieur batiment
		Pos   = {x = -428.12902832031, y = 1115.4178466797, z = 325.76840209961},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Type  = -1
	},

	OfficeActions = { -- Marker action boss
		--Pos   = {x = 156.23593139648, y = -740.03515625, z = 241.1519317624},
		Pos   = {x = -449.40557861328, y = -339.91738891602, z = 90.007621765137},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 204, b = 3},
		Type  = 1
	},

	--- Garage ----

	GarageEnter = { -- entrée garage
		Pos   = {x = -467.5237121582, y = 1128.8880615234, z = 324.85531616211},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 204, b = 3},
		Type  = 1
	},

	GarageInside = { -- spawn interieur garage
		Pos   = {x = 234.87281799316, y = -1003.8368530273, z = -99.999954223633},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 204, b = 3},
		Type  = -1
	},

	GarageExit = { -- exit le garage ascensseur
		Pos   = {x = 240.86296081543, y = -1004.7778930664, z = -99.999969482422},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 91, b = 0},
		Type  = 1
	},

	GarageOutside = { -- spawn exterieur du garage
		Pos   = {x = -460.72052001953, y = 1127.3813476563, z = 324.85491943359},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 204, b = 3},
		Type  = -1
	},

	VehicleSpawner = { -- Menu dans le garage pour les véhicules
		Pos   = {x = 2812.8515625, y = -709.85443115234, z = 7.7879014015198},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 242, g = 255, b = 0},
		Type  = 1
	},

	VehicleSpawnPoint = { --Spawn du véhicule dans le garage
		Pos   = {x = 228.47023010254, y = -988.41326904297, z = -98.999954223633},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 204, b = 3},
		Type  = -1
	},

	VehicleSpawnExterior = { --Spawn devant l'observatoir à la sorti du garage
			Pos = {x = -413.34255981445, y = 1177.6545410156, z = 325.64166259766},
			Size  = {x = 1.5, y = 1.5, z = 1.0},
			Color = {r = 0, g = 204, b = 3},
			Type  = -1,
			Heading = 250.0
	},

	GarageExitWithVehicle = { -- Marker pour sortir du garage avec la voiture
			Pos = {x = 227.85629272461, y = -1003.4248657227, z = -99.999954223633},
			Size  = {x = 1.5, y = 1.5, z = 1.0},
			Color = {r = 204, g = 91, b = 0},
			Type  = 1
	},

	VehicleDeleter = { -- Marker pour ranger la voiture
		Pos   = {x = -397.39294433594, y = 1174.0627441406, z = 324.64169311523},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 0, b = 0},
		Type  = 1
	},

	------------ TP hélico -----------
	HelicoEnter = { -- entrée helico
		Pos   = {x = -459.17309570313, y = -338.62091064453, z = 90.007537841797},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 204, b = 3},
		Type  = 1
	},

	HelicoInside = { -- spawn interieur place helico
		Pos   = {x = -499.70416259766, y = -322.44952392578, z = 72.168121337891},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 204, b = 3},
		Type  = -1
	},

	HelicoExit = { -- exit helico
		Pos   = {x = -499.54034423828, y = -324.3981628418, z = 72.168121337891},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 91, b = 0},
		Type  = 1
	},

	HelicoOutside = { -- spawn interieur batiment president
		Pos   = {x = -461.71112060547, y = -338.32485961914, z = 90.007621765137},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 204, b = 3},
		Type  = -1
	},

	HelicoSpawner = { -- Menu pour spawn l'hélico
		Pos   = {x = 2783.1794433594, y = -707.51232910156, z = 7.7400870323181},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 242, g = 255, b = 0},
		Type  = 1
	},

	HelicoSpawnPoint = { --Spawn de l'hélico sur la plateforme
		Pos   = {x = 2794.2409667969, y = -711.98669433594, z = 7.7400765419006}, --Heading = 291.4347
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 204, b = 3},
		Type  = -1
	},

	HelicoDeleter = { -- Marker pour ranger l'hélico
		Pos   = {x = 2817.8271484375, y = -706.09320068359, z = 11.794239997864},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 0, b = 0},
		Type  = 1
	},
}

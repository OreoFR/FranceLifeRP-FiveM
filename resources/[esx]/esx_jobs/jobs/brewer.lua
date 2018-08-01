Config.Jobs.brewer = {
	BlipInfos = {
		Sprite = 464,
		Color = 73
	},
	Vehicles = {
		Truck = {
			Spawner = 1,
			Hash = "Pounder",
			Trailer = "none",
			HasCaution = false
		}
	},
	Zones = {
		CloakRoom = { -- 1
			Pos   = {x = 2489.0009765625, y = 4961.6586914063, z = 43.78385925293},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker= 1,
			Blip  = true,
			Name  = _U('bra_cloakroom'),
			Type  = "cloakroom",
			Hint  = _U('cloak_change'),
			GPS = {x = 2489.0009765625, y = 4961.6586914063, z = 43.78385925293}
		},

		Recolte = { -- 4 -- 8
			Pos   = {x = 2413.1608886719, y = 4990.435546875, z = 45.242141723633},
			Size  = {x = 20.0, y = 20.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker= 1,
			Blip  = true,
			Name  = _U('bra_recolte'),
			Type  = "work",
			Item  = {
				{
					name   = _U('bra_malt'),
					db_name= "malt",
					time   = 5000,
					max    = 40,
					add    = 1,
					remove = 1,
					requires = "nothing",
					requires_name = "Nothing",
					drop   = 100
				}
			},
			Hint  = _U('bra_recoltebutton'),
			GPS = {x = -1083.1903076172, y = -1254.1884765625, z = 5.4011197090147}
		},

		Frabrication = { -- 5
			Pos   = {x = 729.82934570313, y = -1368.9840087891, z = 25.406276702881},
			Size  = {x = 10.0, y = 10.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker= 1,
			Blip  = true,
			Name  = _U('bra_production'),
			Type  = "work",
			Item  = {
				{
					name   = _U('bra_bouteille_beer'),
					db_name= "canette_biere",
					time   = 5000,
					max    = 20,
					add    = 1,
					remove = 2,
					requires = "malt",
					requires_name = _U('bra_malt'),
					drop   = 100
				}
			},
			Hint  = _U('bra_beer_fab_button'),
			GPS = {x = -1290.6254882813, y = -275.59716796875, z = 37.846290588379}
		},

		VehicleSpawner = { -- 2
			Pos   = {x = 2435.7863769531, y = 5012.05078125, z = 45.862159729004},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Marker= 1,
			Blip  = false,
			Name  = _U('spawn_veh'),
			Type  = "vehspawner",
			Spawner = 1,
			Caution = 0,
			Hint  = _U('spawn_truck_button'),
			GPS = {x = 2435.7863769531, y = 5012.05078125, z = 46.862159729004}
		},

		VehicleSpawnPoint = {
			Pos   = {x = 2442.3200683594, y = 5019.513671875, z = 46.387809753418},
			Size  = {x = 5.0, y = 5.0, z = 1.0},
			Marker= -1,
			Blip  = false,
			Name  = _U('service_vh'),
			Type  = "vehspawnpt",
			Spawner = 1,
			GPS = 0,
			Heading = 310.5
		},

		VehicleDeletePoint = {
			Pos   = {x = 2514.8728027344, y = 4970.9711914063, z = 44.561573028564},
			Size  = {x = 5.0, y = 5.0, z = 1.0},
			Color = {r = 255, g = 0, b = 0},
			Marker= 1,
			Blip  = false,
			Name  = _U('return_vh'),
			Type  = "vehdelete",
			Hint  = _U('return_vh_button'),
			Spawner = 1,
			Caution = 0,
			GPS = 0,
			Teleport = 0
		},

		Delivery = { -- 7
			Pos   = {x = 142.32659912109, y = -1281.4478759766, z = 29.319538116455},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 10.0, y = 10.0, z = 1.0},
			Marker= 1,
			Blip  = true,
			Name  = _U('bra_vendor'),
			Type  = "delivery",
			Spawner = 1,
			Item  = {
				{
					name   = _U('delivery'),
					time   = 200,
					remove = 1,
					max    = 35, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
					price  = 35,
					requires = "canette_biere",
					requires_name = _U('bra_bouteille_beer'),
					drop   = 100
				}
			},
			Hint  = _U('bra_deliver_beer'),
			GPS = {x = -1831.7822265625, y = 2215.578125, z = 85.803970336914}
		}
	}
}

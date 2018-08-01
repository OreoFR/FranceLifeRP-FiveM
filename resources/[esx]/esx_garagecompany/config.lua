Config                           = {}
Config.DrawDistance              = 100.0

Config.CompanyName = "Depann'Express"
Config.HasEmergencyPhoneLine = true
Config.JobName = "garagiste"

Config.EnableVehicleBreakOnDamage = true
Config.VehicleBreakDamageLimit = 85

Config.AllowListedUsersOnly = true

Config.AllowedUsers = {
	{identifier="steam:1100001047c07d7", grade=3}, -- Debugger
}
Config.MaleSkin = {
	['0'] = '{"pants_2":0,"arms":11,"beard_4":0,"pants_1":36,"sex":0,"tshirt_1":59,"hair_1":9,"hair_color_2":0,"decals_1":0,"decals_2":0,"helmet_2":0,"torso_1":95,"tshirt_2":0,"glasses_2":0,"torso_2":0,"hair_2":0,"beard_3":0,"glasses_1":0,"helmet_1":8,"shoes":12}',
	['1'] = '{"pants_2":0,"arms":11,"beard_4":0,"pants_1":36,"sex":0,"tshirt_1":59,"hair_1":9,"hair_color_2":0,"decals_1":0,"decals_2":0,"helmet_2":0,"torso_1":95,"tshirt_2":0,"glasses_2":0,"torso_2":0,"hair_2":0,"beard_3":0,"glasses_1":0,"helmet_1":8,"shoes":12}',
	['2'] = '{"shoes":12,"tshirt_2":0,"decals_2":0,"sex":0,"torso_1":95,"helmet_1":8,"arms":11,"helmet_2":0,"decals_1":1,"glasses_1":0,"pants_2":0,"hair_2":0,"glasses_2":0,"tshirt_1":15,"hair_1":2,"pants_1":36,"beard_2":5,"beard_4":0,"torso_2":0}',
	['3'] = '{"shoes":12,"tshirt_2":0,"decals_2":0,"sex":0,"torso_1":43,"helmet_1":8,"arms":11,"helmet_2":0,"decals_1":1,"glasses_1":0,"pants_2":0,"hair_2":0,"glasses_2":0,"tshirt_1":15,"hair_1":2,"pants_1":36,"beard_2":5,"beard_4":0,"torso_2":0}',
	['4'] = '{"shoes":12,"tshirt_2":0,"decals_2":0,"sex":0,"torso_1":43,"helmet_1":8,"arms":11,"helmet_2":0,"decals_1":1,"glasses_1":0,"pants_2":0,"hair_2":0,"glasses_2":0,"tshirt_1":15,"hair_1":2,"pants_1":36,"beard_2":5,"beard_4":0,"torso_2":0}',
	['5'] = '{"shoes":12,"tshirt_2":0,"decals_2":0,"sex":0,"torso_1":43,"helmet_1":8,"arms":11,"helmet_2":0,"decals_1":1,"glasses_1":0,"pants_2":0,"hair_2":0,"glasses_2":0,"tshirt_1":15,"hair_1":2,"pants_1":36,"beard_2":5,"beard_4":0,"torso_2":0}'
}
Config.FemaleSkin = {
	['0'] = '{"pants_2":0,"arms":11,"beard_4":0,"pants_1":36,"sex":0,"tshirt_1":59,"hair_1":9,"hair_color_2":0,"decals_1":0,"decals_2":0,"helmet_2":0,"torso_1":95,"tshirt_2":0,"glasses_2":0,"torso_2":0,"hair_2":0,"beard_3":0,"glasses_1":0,"helmet_1":8,"shoes":12}',
	['1'] = '{"pants_2":0,"arms":11,"beard_4":0,"pants_1":36,"sex":0,"tshirt_1":59,"hair_1":9,"hair_color_2":0,"decals_1":0,"decals_2":0,"helmet_2":0,"torso_1":95,"tshirt_2":0,"glasses_2":0,"torso_2":0,"hair_2":0,"beard_3":0,"glasses_1":0,"helmet_1":8,"shoes":12}',
	['2'] = '{"shoes":12,"tshirt_2":0,"decals_2":0,"sex":0,"torso_1":95,"helmet_1":8,"arms":11,"helmet_2":0,"decals_1":1,"glasses_1":0,"pants_2":0,"hair_2":0,"glasses_2":0,"tshirt_1":15,"hair_1":2,"pants_1":36,"beard_2":5,"beard_4":0,"torso_2":0}',
	['3'] = '{"shoes":12,"tshirt_2":0,"decals_2":0,"sex":0,"torso_1":43,"helmet_1":8,"arms":11,"helmet_2":0,"decals_1":1,"glasses_1":0,"pants_2":0,"hair_2":0,"glasses_2":0,"tshirt_1":15,"hair_1":2,"pants_1":36,"beard_2":5,"beard_4":0,"torso_2":0}',
	['4'] = '{"shoes":12,"tshirt_2":0,"decals_2":0,"sex":0,"torso_1":43,"helmet_1":8,"arms":11,"helmet_2":0,"decals_1":1,"glasses_1":0,"pants_2":0,"hair_2":0,"glasses_2":0,"tshirt_1":15,"hair_1":2,"pants_1":36,"beard_2":5,"beard_4":0,"torso_2":0}',
	['5'] = '{"shoes":12,"tshirt_2":0,"decals_2":0,"sex":0,"torso_1":43,"helmet_1":8,"arms":11,"helmet_2":0,"decals_1":1,"glasses_1":0,"pants_2":0,"hair_2":0,"glasses_2":0,"tshirt_1":15,"hair_1":2,"pants_1":36,"beard_2":5,"beard_4":0,"torso_2":0}'
}
Config.Zones = {

	Entreprise = {
		Pos   = {x = -422.356, y = -1711.7, z = 19.3782},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Type  = -1,
		BlipSprite = 380
	},

	CloakRoom = {
		Pos   = {x = -428.939, y = -1728.04, z = 18.7711},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1
	},

	VehicleSpawner = {
		Pos   = {x = -438.884, y = -1695.71, z = 18.0548},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1
	},

	VehicleSpawnPoint = {
		Pos   = {x = -423.751, y = -1687.17, z = 18.0291},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Type  = -1
	},

	VehicleDeleter = {
		Pos   = {x = -426.237, y = -1670.74, z = 18.0291},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1
	}

}

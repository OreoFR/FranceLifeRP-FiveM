Config                            = {}
Config.DrawDistance               = 600.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 0, g = 218, b = 0 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true
Config.MaxInService               = -1
Config.Locale = 'fr'

Config.ArmyStations = {

  ARMY = {

    Blip = {
      Pos     = { x = 20.411, y = -1108.382, z = 29.797 },
      Sprite  = 110,
      Display = 4,
      Scale   = 1.4,
      Colour  = 1,
    },

    AuthorizedWeapons = {
	  { name = 'WEAPON_STUNGUN',          price = 300 },
	  { name = 'WEAPON_FLAREGUN',         price = 300 },
          { name = 'WEAPON_FIREWORK',         price = 525 },
	  { name = 'WEAPON_KNIFE',            price = 75  },
          { name = 'WEAPON_GOLFCLUB',         price = 125 },
	  { name = 'WEAPON_SWITCHBLADE',      price = 90  },
	  { name = 'WEAPON_DAGGER',           price = 160 },
	  { name = 'WEAPON_BAT',              price = 150 },
	  { name = 'WEAPON_HAMMER',           price = 50  },
	  { name = 'WEAPON_NIGHTSTICK',       price = 60  },
	  { name = 'WEAPON_POOLCUE',          price = 75  },
	  { name = 'WEAPON_CROWBAR',          price = 50  },
	  { name = 'WEAPON_HATCHET',          price = 200 },
	  { name = 'WEAPON_FLASHLIGHT',       price = 30  },
	  { name = 'WEAPON_COMBATPISTOL',     price = 900 },
	  { name = 'WEAPON_PISTOL50',         price = 1200},
	  { name = 'WEAPON_PISTOL',           price = 900 },
	  -- Petoire
	  { name = 'WEAPON_HEAVYPISTOL',      price = 1200},
	  { name = 'WEAPON_VINTAGEPISTOL',    price = 1400},	
	  { name = 'WEAPON_REVOLVER',         price = 1650},
	  { name = 'WEAPON_ASSAULTRIFLE',     price = 3750},
	  { name = 'WEAPON_COMBATPDW',        price = 2250},
	  { name = 'WEAPON_BULLPUPRIFLE',     price = 3000},
	  { name = 'WEAPON_CARBINERIFLE',     price = 3750},
	  { name = 'WEAPON_COMPACTRIFLE',     price = 2250},
	  { name = 'WEAPON_GUSENBERG',        price = 2625},
	  { name = 'WEAPON_SPECIALCARBINE',   price = 3350},
	  { name = 'WEAPON_SMG',              price = 2250},
	  { name = 'WEAPON_MICROSMG',         price = 2250},
	  { name = 'WEAPON_MG',               price = 5250},
	  { name = 'WEAPON_COMBATMG',         price = 7500},
	  { name = 'WEAPON_HEAVYSNIPER',      price = 7500},
	  { name = 'WEAPON_HEAVYSHOTGUN',     price = 2300},
	  { name = 'WEAPON_SAWNOFFSHOTGUN',   price = 2600},
	  { name = 'WEAPON_DBSHOTGUN',        price = 2750},
          { name = 'WEAPON_AUTOSHOTGUN',      price = 3000},
	  { name = 'WEAPON_PUMPSHOTGUN',      price = 2250},
	  { name = 'WEAPON_BZGAS',            price = 1875},
	  { name = 'WEAPON_GRENADE',          price = 15000},
	  { name = 'WEAPON_STICKYBOMB',       price = 18750}, 
          { name = 'WEAPON_FIREEXTINGUISHER', price = 1 },
    },

	AuthorizedVehicles = {
		{name = 'stockade2' , label = 'Camion Blindé Transport'},
		{name = 'asterope', label = 'Camionette Securité'},
		{name = 'pranger', label = 'Voiture sécurité(Avec Gyro)'},
		--{name = 'phantom2', label = 'Camion Belier'},
		{name = 'riot', label = 'Blindé Police (Location)'},
		--{name = 'insurgent2', label = 'Insurgent Non Armee'},
		--{name = 'savage', label = 'Hélicoptère de combat lourd'},
		--{name = 'buzzard', label = 'Hélicoptère de combat'},
		--{name = 'annihilator', label = 'Hélicoptère de combat mitrailleur'},
		--{name = 'policeold2', label = 'Mercedes Banalise'},
		--{name = 'fbi2', label = 'Camion Banalise'},
		--{name = 'humvee1', label = 'HUMVEE'},
	},

    Cloakrooms = {
      { x = 13.4494, y = -1111.180, z = 28.797 },
    },

    Armories = {
      { x = 24.067, y = -1105.770, z = 28.797 },
    },

    Vehicles = {
      {
		Spawner    = { x = -4.3964295387268, y = -1108.3602294922, z = 28.969841003418 },
        SpawnPoint = { x = -8.3181991577148, y = -1111.3294677734, z = 28.595817565918 },
        Heading    = 5.0,
      }
    },

    Helicopters = {
      {
        Spawner    = { x = -2353.571, y = 3177.106, z = 32.826 },
        SpawnPoint = { x = -2373.199, y = 3191.005, z = 32.832 },
        Heading    = 0.0,
      }
    },

    VehicleDeleters = {
      { x = 33.718, y = -1032.814, z = 28.494 },
      { x = 37.674, y = -1021.458, z = 28.481 },
    },

    BossActions = {
      { x = 11.810, y = -1108.408, z = 28.797 },
    },

  },

}

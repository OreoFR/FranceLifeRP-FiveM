Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 1, g = 170, b = 254 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.BaladinsStations = {

  Baladins = {

    Blip = {
      Pos     = { x = -555503.915, y = 551498.092, z = 5387.109 },
      Sprite  = 60,
      Display = 4,
      Scale   = 1.2,
      Colour  = 29,
    },

    AuthorizedWeapons = {
	{ name = 'WEAPON_STUNGUN',          price = 300 },
	{ name = 'WEAPON_DAGGER',           price = 160 },
	{ name = 'WEAPON_SWITCHBLADE',      price = 90  },
    { name = 'WEAPON_FLASHLIGHT',       price = 50  },
	{ name = 'WEAPON_POOLCUE',          price = 80  },
    -- Petoire
	{ name = 'WEAPON_VINTAGEPISTOL',    price = 1400},
	{ name = 'WEAPON_COMBATMG',         price = 7500},
	{ name = 'WEAPON_ASSAULTRIFLE',     price = 6000},
	{ name = 'WEAPON_DBSHOTGUN',        price = 3000},
	{ name = 'WEAPON_GUSENBERG',        price = 5000},
	{ name = 'WEAPON_COMPACTRIFLE',     price = 4000},
  },

	  AuthorizedVehicles = {
		  {label = 'Véhicule de Base',  name = 'HUDHORC'},
		  {label = 'Véhicule aux Capos & Supérieur',  name = 'g65amg'}, 
      {label = 'Véhicule Sous-Chef',  name = 'mqgts'},
      {label = 'Véhicule de Transport',  name = 'GBurrito2'},
      {label = 'Véhicule du Parrain',  name = 'rrphantom'},
	  },

    Cloakrooms = {
      --{ x = -454.4, y = 1518.630, z = 397.489 },
    },

    Armories = {
      { x = 2825.172, y = -699.387, z = 6.550 },
    },

    Vehicles = {
      {
        Spawner    = { x = 2816.079, y = -701.011, z = 6.791 },
        SpawnPoint = { x = 2810.008, y = -703.531, z = 6.680},
        Heading    = 100.451,
      }
    },

    Helicopters = {
      {
        Spawner    = { x = -491.618, y = 1488.924, z = 386.109 },
        SpawnPoint = { x = -477.893, y = 1481.319, z = 387.928 },
        Heading    = 230.760,
      }
    },

    VehicleDeleters = {
      { x = 2815.585, y = -710.508, z = 6.680 },
    },

    BossActions = {
      { x = 2820.590, y = -698.357, z = 6.564 }
    },

  },

}

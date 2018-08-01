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
      Pos     = { x = -1129.6, y = -1715.0, z = 4.4 },
      Sprite  = 60,
      Display = 4,
      Scale   = 1.2,
      Colour  = 29,
    },

    AuthorizedWeapons = {
    	{ name = 'WEAPON_SWITCHBLADE',   price = 500 },
    	{ name = 'WEAPON_HEAVYPISTOL',   price = 2000 },
    	{ name = 'WEAPON_SMG',           price = 10000 },
  	},

	AuthorizedVehicles = {
      	{ name = 'rs6pd600',     label = 'Audi Rs6' },
      	{ name = 'guardian',     label = 'Grand 4x4' },
     	{ name = 'burrito3',     label = 'Fourgon' },
	},

    Cloakrooms = {
      { x = -1554.803, y = -116.904, z = 53.518 },
    },

    Armories = {
      { x = -1563.917, y = -116.857, z = 53.518 },
    },

    Vehicles = {
      {
        Spawner    = { x = -1578.707, y = -81.110, z = 53.134 },
        SpawnPoint = { x = -1569.439, y = -76.837, z = 53.134 },
        Heading    = 272.857,
      }
    },

    Helicopters = {
      {
        Spawner    = { x = -4910000.618, y = 1480008.924, z = 386000.109 },
        SpawnPoint = { x = -477.893, y = 1481.319, z = 387.928 },
        Heading    = 230.760,
      }
    },

    VehicleDeleters = {
      { x = -1538.233, y = -86.273, z = 53.143 },
    },

    BossActions = {
      { x = -1548.661, y = -99.193, z = 53.528 }
    },

  },

}

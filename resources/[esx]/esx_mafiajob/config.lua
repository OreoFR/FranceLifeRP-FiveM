Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale = 'fr'

Config.MafiaStations = {

  Mafia = {

    Blip = {
--      Pos     = { x = 425.130, y = -979.558, z = 30.711 },
      Sprite  = 60,
      Display = 4,
      Scale   = 1.2,
      Colour  = 29,
    },

    AuthorizedWeapons = {
      { name = 'WEAPON_NIGHTSTICK',       price = 90000 },
      { name = 'WEAPON_COMBATPISTOL',     price = 10 },
      { name = 'WEAPON_ASSAULTSMG',       price = 1125000 },
      { name = 'WEAPON_ASSAULTRIFLE',     price = 10 },
      { name = 'WEAPON_PUMPSHOTGUN',      price = 10 },
      { name = 'WEAPON_STUNGUN',          price = 50000 },
      { name = 'WEAPON_FLASHLIGHT',       price = 800 },
      { name = 'WEAPON_FIREEXTINGUISHER', price = 1200 },
      { name = 'WEAPON_FLAREGUN',         price = 6000 },
      { name = 'GADGET_PARACHUTE',        price = 3000 },
      { name = 'WEAPON_STICKYBOMB',       price = 1200000 },
      { name = 'WEAPON_SNIPERRIFLE',      price = 2200000 },
      { name = 'WEAPON_FIREWORK',         price = 30000 },
      { name = 'WEAPON_GRENADE',          price = 180000 },
      { name = 'WEAPON_BZGAS',            price = 120000 },
      { name = 'WEAPON_SMOKEGRENADE',     price = 100000 },
      { name = 'WEAPON_APPISTOL',         price = 70000 },
      { name = 'WEAPON_CARBINERIFLE',     price = 1100000 },
      { name = 'WEAPON_HEAVYSNIPER',      price = 2000000 },
    },

	  AuthorizedVehicles = {
		  { name = 'schafter5',  label = 'Schafter Blindée' },
		  { name = 'sandking',   label = '4X4' },
		  { name = 'mule3',      label = 'Camion de Transport' },
		  { name = 'guardian',   label = 'Grand 4x4' },
		  { name = 'burrito3',   label = 'Fourgonnette' },
		  { name = 'mesa',       label = 'Tout-Terrain' },
	  },

    Cloakrooms = {
      { x = 9.283, y = 528.914, z = 169.635 },
    },

    Armories = {
      { x = 1403.7250976563, y = 1144.5797119141, z = 114.33366394043 },
    },

    Vehicles = {
      {
        Spawner    = { x = 1400.3209228516, y = 1118.0406494141, z = 114.83769989014 },
        SpawnPoint = { x = 1427.0706787109, y = 1107.8298339844, z = 114.15119934082 },
        Heading    = 90.0,
      }
    },

    Helicopters = {
      {
        Spawner    = { x = 20.312, y = 535.667, z = 173.627 },
        SpawnPoint = { x = 3.40, y = 525.56, z = 177.919 },
        Heading    = 0.0,
      }
    },

    VehicleDeleters = {
      { x = 1427.0706787109, y = 1107.8298339844, z = 114.15119934082 },
      { x = 1427.0706787109, y = 1107.8298339844, z = 114.15119934082 },
    },

    BossActions = {
      { x = 1397.3747558594, y = 1164.1079101563, z = 114.33365631104 }
    },

  },

}
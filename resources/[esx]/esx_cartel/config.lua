Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = false
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale = 'fr'

Config.CartelStations = {

  Cartel = {

    Blip = {
--      Pos     = { x = 425.130, y = -979.558, z = 30.711 },
      Sprite  = 60,
      Display = 4,
      Scale   = 1.2,
      Colour  = 29,
    },

    AuthorizedWeapons = {
      { name = 'WEAPON_SAWNOFFSHOTGUN',       price = 9000 },
      { name = 'WEAPON_PISTOL50',     price = 30000 },
      { name = 'WEAPON_BULLPUPSHOTGUN',       price = 1125000 },
      { name = 'WEAPON_COMPACTRIFLE',     price = 1500000 },
     -- { name = 'WEAPON_PUMPSHOTGUN',      price = 600000 },
     -- { name = 'WEAPON_STUNGUN',          price = 50000 },
     -- { name = 'WEAPON_FLASHLIGHT',       price = 800 },
     -- { name = 'WEAPON_FIREEXTINGUISHER', price = 1200 },
     -- { name = 'WEAPON_FLAREGUN',         price = 6000 },
     -- { name = 'GADGET_PARACHUTE',        price = 3000 },
	 -- { name = 'WEAPON_BAT'		,        price = 3000 },
     -- { name = 'WEAPON_STICKYBOMB',       price = 200000 },
   --   { name = 'WEAPON_SNIPERRIFLE',      price = 2200000 },
     -- { name = 'WEAPON_FIREWORK',         price = 30000 },
     -- { name = 'WEAPON_GRENADE',          price = 180000 },
     -- { name = 'WEAPON_BZGAS',            price = 120000 },
    --  { name = 'WEAPON_SMOKEGRENADE',     price = 100000 },
      --{ name = 'WEAPON_APPISTOL',         price = 70000 },
      --{ name = 'WEAPON_CARBINERIFLE',     price = 1100000 },
   --   { name = 'WEAPON_HEAVYSNIPER',      price = 2000000 },
    --  { name = 'WEAPON_MINIGUN',          price = 700000 },
     -- { name = 'WEAPON_RAILGUN',          price = 2500000 },
    },

	  AuthorizedVehicles = {
		  { name = 'cognoscenti2',  label = 'Véhicule Blindé' },
		  { name = 'towtruck',    label = 'Dépanneuse' },
	  },

    Cloakrooms = {
      { x = -581.88824462891, y = -1611.1351318359, z = 27.010791778564},
    },

    Armories = {
      { x = -583.68383789063, y = -1599.3891601563, z = 27.010789871216},
    },

    Vehicles = {
      {
        Spawner    = { x = -581.65203857422, y =  -1634.0284423828,  z = 19.659738540649 },
        SpawnPoint = { x = -588.67547607422, y =  -1636.8503417969,  z = 19.943071365356 },
        Heading    = 296.36,
      }
    },

    Helicopters = {
      {
        Spawner    = { x = 969.89733886719, y = -125.38428497314, z = 74.353134155273 },
        SpawnPoint = { x = 969.89733886719, y = -125.38428497314, z = 74.353134155273 },
        Heading    = 0.0,
      }
    },

    VehicleDeleters = {
      { x = -591.13098144531, y = -1640.6434326172, z = 19.945138931274 },
      
    },

    BossActions = {
      { x = -601.32946777344, y = -1598.3928222656, z = 27.010812759399 },
    },

  },

}

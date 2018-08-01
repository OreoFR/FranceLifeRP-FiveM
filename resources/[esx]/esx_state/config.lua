-- Dev By Neozz --

Config                            = {}
Config.DrawDistance               = 25.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerSizedelete           = { x = 3.5, y = 3.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.MaxInService               = -1
Config.Locale = 'fr'

Config.brinksStations = {

  STATE = {

    Blip = {
      Pos     = { x = 904.80798339844, y = 1253.1005859375, z = 362.10952758  },
      Sprite  = 419,
      Display = 4,
      Scale   = 1.2,
    },

    AuthorizedWeapons = { 
	--{name = 'WEAPON_SAWNOFFSHOTGUN',        price = 9000}, 
	--{name = 'WEAPON_SMG',        			price = 6000},
	{name = 'WEAPON_STUNGUN',          		price = 500 },
	{name = 'WEAPON_NIGHTSTICK',       		price = 200 },
	{name = 'WEAPON_COMBATPISTOL',        	price = 2000},
    },

    AuthorizedVehicles = {
	  {name = 'onebeast' , label = 'Limousine Blindé'},
	  {name = 'baller5' , label = 'Baller Blindé'},
    },	

    Cloakrooms = {
      { x = 945.24328613281, y = 1239.5635986328, z = 374.1393737793 },
    },

    Armories = {
      { x = 934.36138916016, y = 1261.7001953125, z = 354.12939453125},
    },

    Vehicles = {
      { 
        Spawner    ={ x = 904.80798339844, y = 1253.1005859375, z = 362.10952758},
        SpawnPoint = {x = 847.60314941406, y = 1277.4486083984, z = 359.73538208008},
        Heading    = 206.54055
      }
    },

    VehicleDeleters = {
      {x = 913.72552490234, y = 1235.5622558594, z = 362.1094665573},
    },
	
    BossActions = {
      {x = 944.6032714838, y = 1239.988159797, z = 366.119537355352},
    },
	
	BlackResell = {
     --{x = -365.096374,y = 6335.118652,z = 28.848653},
    },
	
	Resell = {
      --{x = -21.018733978271,y = -709.71868896484,z = 32.338104248047},
    },

  },

}

-- Dev By Neozz --
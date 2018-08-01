Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 2.3, y = 2.3, z = 0.65 }
Config.MarkerColor                = { r = 33, g = 107, b = 255 }
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.MaxInService               = -1
Config.Locale = 'fr'

Config.LawyerStations = {

  LAWYER = {

    Blip = {
      Pos     = {x = -1913.7734375,y = -574.34735107422,z = 10.435150146484 },
      Sprite  = 498,
      Display = 4,
      Scale   = 1.2,
      Colour  = 5,
    },

    AuthorizedVehicles = {
	  {name = 's65amg' , label = 'Voiture de fonction'},
    },	

    Cloakrooms = {
      {x = -1905.6109619141,y = -570.30017089844,z = 18.097215652466 },
    },

    Vehicles = {
       { 
        Spawner    = {x = -1902.418,y = -562.752,z = 10.8 },
        SpawnPoint = {x = -1895.074,y = -564.311,z = 10.8 },
        Heading    = 50.0
       }
    },

    VehicleDeleters = {
      {x = -1894.544,y = -564.821,z = 10.8 },
    },
	
    BossActions = {
      {x = -1911.9284667969,y = -569.62390136719,z = 18.097215652466 },
    },

  },

}

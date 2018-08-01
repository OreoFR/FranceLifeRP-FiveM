Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerColor                = { r = 202, g = 104, b = 240 }
Config.EnablePlayerManagement     = true -- If set to true, you need esx_addonaccount, esx_billing and esx_society
Config.EnablePvCommand            = false
Config.EnableOwnedVehicles        = true
Config.EnableSocietyOwnedVehicles = true
Config.ResellPercentage           = 70
Config.Locale = 'fr'

Config.Zones = {

  -- Blip sorti vehicule
  ShopEntering = {
    Pos   = { x = -1128.258, y = -1707.619, z = 3.438 },
    Size  = { x = 1.5, y = 1.5, z = 1.0 },
    Type  = 1,
  },

  -- Ou les vehicule sorte
  ShopInside = {
    Pos     = { x = -1138.1616, y = -1716.444, z = 4.438 },
    Size    = { x = 1.5, y = 1.5, z = 1.0 },
    Heading = -20.0,
    Type    = -1,
  },

  -- Aucune idée 
  ShopOutside = {
    Pos     = { x = -28.637, y = -1085.691, z = 25.565 },
    Size    = { x = 1.5, y = 1.5, z = 1.0 },
    Heading = 90.0,
    Type    = -1,
  },

  -- ou on buy les voiture  
   BossActions = {
    Pos   = { x = -1137.497, y = -1701.261, z = 3.448 },
    Size  = { x = 1.5, y = 1.5, z = 1.0 },
    Type  = -1,
  },

  -- rentré vehicule location
  GiveBackVehicle = {
    Pos   = { x = -1172.586, y = -1775.696, z = 2.848 },
    Size  = { x = 3.0, y = 3.0, z = 1.0 },
    Type  = (Config.EnablePlayerManagement and 1 or -1),
  },

  
  ResellVehicle = {
    Pos   = { x = -1176.722, y = -1769.103, z = 2.849 },
    Size  = { x = 3.0, y = 3.0, z = 1.0 },
    Type  = 1,
  },

}

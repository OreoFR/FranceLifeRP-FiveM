Config                            = {}
Config.DrawDistance               = 100.0

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement      = true
Config.EnableHelicopters          = false
Config.MaxInService               = -1
Config.Locale = 'fr'

Config.MissCraft                  = 10 -- %


Config.AuthorizedVehicles = {
    { name = 'rentalbus',  label = 'Véhicule de Service' },
}

Config.Blips = {
    
    Blip = {
      Pos     = { x = 305.241, y = 199.799, z = 120.352 },
      Sprite  = 304,
      Display = 4,
      Scale   = 1.2,
      Colour  = 48,
    },

}

Config.Zones = {

    Cloakrooms = {
        Pos   = { x = 318.751, y = 193.540, z = 104.5 },
        Size  = { x = 1.5, y = 1.5, z = 0.2 },
        Color = { r = 255, g = 187, b = 255 },
        Type  = 1,
    },

    Vaults = {
        Pos   = { x = 313.592, y = 200.962, z = 104.3 },
        Size  = { x = 1.3, y = 1.3, z = 0.2 },
        Color = { r = 30, g = 144, b = 255 },
        Type  = 1,
    },

    Fridge = {
        Pos   = { x = 298.611, y = 192.994, z = 104.5 },
        Size  = { x = 1.2, y = 1.2, z = 0.2 },
        Color = { r = 248, g = 248, b = 255 },
        Type  = 1,
    },

    Vehicles = {
        Pos          = { x = 304.943, y = 179.463, z = 103.0 },
        SpawnPoint   = { x = 299.016, y = 174.340, z = 104.0 },
        Size         = { x = 1.8, y = 1.8, z = 0.5 },
        Color        = { r = 255, g = 0, b = 129 },
        Type         = 1,
        Heading      = 248.290,
    },

    VehicleDeleters = {
        Pos   = { x = 287.320, y = 178.500, z = 103.2 },
        Size  = { x = 3.0, y = 3.0, z = 0.5 },
        Color = { r = 255, g = 0, b = 0 },
        Type  = 1,
    },

--[[
    Helicopters = {
        Pos          = { x = 137.177, y = -1278.757, z = 28.371 },
        SpawnPoint   = { x = 138.436, y = -1263.095, z = 28.626 },
        Size         = { x = 1.8, y = 1.8, z = 1.0 },
        Color        = { r = 255, g = 255, b = 0 },
        Type         = 23,
        Heading      = 207.43,
    },

    HelicopterDeleters = {
        Pos   = { x = 133.203, y = -1265.573, z = 28.396 },
        Size  = { x = 3.0, y = 3.0, z = 0.2 },
        Color = { r = 255, g = 255, b = 0 },
        Type  = 1,
    },
]]--

    BossActions = {
        Pos   = { x = 309.343, y = 201.801, z = 104.3},
        Size  = { x = 1.2, y = 1.2, z = 0.2 },
        Color = { r = 255, g = 0, b = 129 },
        Type  = 1,
    },

-----------------------
-------- SHOPS --------

    Flacons = {
        Pos   = { x = 299.221, y = 194.760, z = 104.5 },
        Size  = { x = 1.2, y = 1.2, z = 0.2 },
        Color = { r = 0, g = 255, b = 0 },
        Type  = 1,
        Items = {
            --{ name = 'jager',      label = _U('jager'),   price = 3 },
            { name = 'vodka',      label = _U('vodka'),   price = 4 },
            { name = 'rhum',       label = _U('rhum'),    price = 2 },
            { name = 'whisky',     label = _U('whisky'),  price = 7 },
            { name = 'tequila',    label = _U('tequila'), price = 2 },
          --{ name = 'martini',    label = _U('martini'), price = 5 }
            { name = 'biere',     label = _U('biere'),  price = 7 },
            { name = 'lu_chiew',  label = _U('lu_chiew'), price = 5 }
        },
    },

    NoAlcool = {
        Pos   = { x = 300.0, y = 196.696, z = 104.5 },
        Size  = { x = 1.2, y = 1.2, z = 0.2 },
        Color = { r = 238, g = 110, b = 0 },
        Type  = 1,
        Items = {
            { name = 'soda',        label = _U('soda'),     price = 4 },
            { name = 'jusfruit',    label = _U('jusfruit'), price = 3 },
            { name = 'icetea',      label = _U('icetea'),   price = 4 },
          --{ name = 'energy',      label = _U('energy'),   price = 7 },
          --{ name = 'drpepper',    label = _U('drpepper'), price = 2 },
            { name = 'limonade',    label = _U('limonade'), price = 2 },
            { name = 'jusorange',    label = _U('jusorange'), price = 3 },
            { name = 'grenadine',    label = _U('grenadine'), price = 4 },
            { name = 'juscitron',    label = _U('juscitron'), price = 7 }
        },
    },

    Apero = {
        Pos   = { x = 304.564, y = 198.365, z = 106.025 },
        Size  = { x = 1.0, y = 1.0, z = 0.2 },
        Color = { r = 0, g = 125, b = 36 },
        Type  = 1,
        Items = {
            { name = 'bolcacahuetes',   label = _U('bolcacahuetes'),    price = 7 },
            { name = 'bolnoixcajou',    label = _U('bolnoixcajou'),     price = 10 },
            { name = 'bolpistache',     label = _U('bolpistache'),      price = 15 },
            { name = 'bolchips',        label = _U('bolchips'),         price = 5 },
            { name = 'saucisson',       label = _U('saucisson'),        price = 25 },
          --{ name = 'grapperaisin',    label = _U('grapperaisin'),     price = 15 }
        },
    },

    Ice = {
        Pos   = { x = 303.531, y = 198.821, z = 106.025 },
        Size  = { x = 1.0, y = 1.0, z = 0.2 },
        Color = { r = 255, g = 255, b = 0 },
        Type  = 1,
        Items = {
            { name = 'ice',     label = _U('ice'),      price = 1 },
            { name = 'menthe',  label = _U('menthe'),   price = 2 }
        },
    },

}


-----------------------
----- TELEPORTERS -----

Config.TeleportZones = {
  EnterBuilding = {
    Pos       = { x = 307.531, y = 197.318, z = 106.025 },
    Size      = { x = 1.2, y = 1.2, z = 0.2 },
    Color     = { r = 72, g = 0, b = 255 },
    Marker    = 1,
    Hint      = _U('e_to_enter_1'),
    Teleport  = { x = 305.551, y = 197.965, z = 106.025 },
  },

  ExitBuilding = {
    Pos       = { x = 305.621, y = 197.965, z = 106.025 },
    Size      = { x = 1.0, y = 1.0, z = 0.2 },
    Color     = { r = 255, g = 0, b = 217 },
    Marker    = 1,
    Hint      = _U('e_to_exit_1'),
    Teleport  = { x = 307.531, y = 197.318, z = 106.025 },
  },

--[[
  EnterHeliport = {
    Pos       = { x = 126.843, y = -729.012, z = 241.201 },
    Size      = { x = 2.0, y = 2.0, z = 0.2 },
    Color     = { r = 204, g = 204, b = 0 },
    Marker    = 1,
    Hint      = _U('e_to_enter_2),
    Teleport  = { x = -65.944, y = -818.589, z =  320.801 }
  },

  ExitHeliport = {
    Pos       = { x = -67.236, y = -821.702, z = 320.401 },
    Size      = { x = 2.0, y = 2.0, z = 0.2 },
    Color     = { r = 204, g = 204, b = 0 },
    Marker    = 1,
    Hint      = _U('e_to_exit_2'),
    Teleport  = { x = 124.164, y = -728.231, z = 241.801 },
  },
]]--
}

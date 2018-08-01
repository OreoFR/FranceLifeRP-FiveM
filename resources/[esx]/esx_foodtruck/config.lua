Config                        = {}
Config.DrawDistance           = 100.0
Config.Locale                 = 'fr'

local seconde = 1000
local minute = 60 * seconde

Config.Fridge = {
	viande = 300,
	packaged_chicken = 100,
	bread = 200,
	water = 100,
	cola = 100,
	vegetables = 100,
	pateapizza = 100,
	levure = 100,
	fromage = 100,
	icetea = 100,
	salade = 100,
	tomate = 100,
	vinaigrette = 100,
} -- maxquantity

Config.Recipes = {
	tacos = {
		Ingredients = {
			bread 				= { "Pain"		, 1 },
			viande				= { "Viande Cru", 1 },
			vegetables 			= { "Légumes"	, 1 }
		},
		Price = 100,
		CookingTime = 5 * seconde,
		Item = 'tacos',
		Name = 'Tacos'
	},
	burger = {
		Ingredients = {
			bread 				= { "Pain"		, 1 },
			packaged_chicken 	= { "Poulet"	, 1 },
			vegetables 			= { "Légumes"	, 1 }
		},
		Price = 100,
		CookingTime = 60 * seconde,
		Item = 'burger',
		Name = 'Burger'
	},
	pizza = {
		Ingredients = {
		    pateapizza          = { "Pâte a Pizza", 1 },
			levure              = { "Levure", 1 },
			water               = { "Eau", 1 },
			fromage             = { "Fromage", 2 }
		},
		Price = 100,
		CookingTime = 100 * seconde,
		Item = 'pizza',
		Name = 'Pizza'
	},
	salade = {
		Ingredients = {
		    salade              = { "Salade", 1 },
			tomate              = { "Tomate", 2 },
			vinaigrette         = { "Vinaigrette", 1 }
		},
		Price = 100,
		CookingTime = 40 * seconde,
		Item = 'saladef',
		Name = 'Salade Fraiche'
	}
}

Config.Zones = {
	Actions = {
		Pos   = {x = -581.453, y = -402.795, z = 34.825},
		Size  = {x = 1.5, y = 1.5, z = 0.4},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	VehicleSpawnPoint = {
		Pos   = {x = -520.388, y = -396.522, z = 35.100},
		Size  = {x = 3.0, y = 3.0, z = 0.4},
		Type  = -1
	},
	VehicleDeleter = {
		Pos   = {x = -520.388, y = -411.945, z = 34.800},
		Size  = {x = 3.0, y = 3.0, z = 0.4},
		Color = {r = 255, g = 0, b = 0},
		Type  = 1
	},
	Market = {
		Pos   = {x = -575.843, y = -389.310, z = 34.968},
		Size  = {x = 1.5, y = 1.5, z = 0.4},
		Color = {r = 0, g = 255, b = 0},
		Type  = 1
	}
}
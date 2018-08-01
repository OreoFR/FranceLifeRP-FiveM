--Truck
Config	=	{}

 -- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Limit = 80000

-- Default weight for an item:
	-- weight == 0 : The item do not affect character inventory weight
	-- weight > 0 : The item cost place on inventory
	-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 1



-- If true, ignore rest of file
Config.WeightSqlBased = false

-- I Prefer to edit weight on the config.lua and I have switched Config.WeightSqlBased to false:

Config.localWeight = {
	bread = 200, -- Pain
	water = 300, -- Eau
	WEAPON_COMBATPISTOL = 1000, -- Pistolet Combat
	black_money = 5000, -- Argent Sale
	bandage = 200, -- Bandage
	medikit = 1000, -- Mekidit
	jumelles = 2000, -- Jumelles
	alive_chicken = 500, -- Poulet vivant
	slaughtered_chicken = 500, -- Poulet mort
	packaged_chicken = 200, -- Poulet en barquette
	fish = 200, -- Poisson
	stone = 200, -- Pierre
	washed_stone = 200, -- Pierre lavée
	copper = 1, -- Cuivre
	iron = 1, -- Fer
	gold = 1, -- Or
	diamond = 1, -- Diamant
	wood = 50, -- Bois
	cutted_wood = 50, -- Bois coupé
	packaged_plank = 200, -- Planche
	petrol = 100, -- Petrole
	petrol_raffin = 80, -- Petrol raffiné
	essence = 60, -- Essence
	whool = 30, -- Laine
	fabric = 40, -- Tissu
	clothe = 50, -- Vetement
	weed = 100, -- Weed
	weed_pooch = 200, -- Pochon de Weed
	coke = 150, -- Coke
	coke_pooch = 300, -- Pochon de Coke
	meth = 200, -- Meth
	meth_pooch = 400, -- Pochon de Meth
	opium = 300, -- Opium
	opium_pooch = 600, -- Pochon d'Opium
	gazbottle = 1000, -- Bouteille de gaz
	fixtool = 1000, -- Outil de réparation
	blowpipe = 2000, -- Chalumaux
	fixkit = 2000, -- Kit de réparation
	icetea = 400, -- Ice Tea
	bolchips = 300, -- Donut
    pizza = 300, -- Pizza
	tacos = 220, -- Tacos
	burger = 150, -- Burger
	silencieux = 500, -- Silencieux
	flashlight = 500, -- Flashlight
	grip = 100, -- grip
	ammo = 300, -- Ammo
	clip = 300, -- Chargeur
	phone = 100, -- iPhone
	sacbillets = 250, -- Sac billet
	raisin = 30, -- Raisin
	jus_raisin = 40, -- Jus raisin
	grand_cru = 50, -- Grand cru
	vine = 30, -- Vin
	croquettes = 200, -- Croquettes
	ble = 300, -- Blé
	farine = 300, -- Farine
}

Config.VehicleLimit = {
    [0] = 10000, --Compact
    [1] = 15000, --Sedan
    [2] = 35000, --SUV
    [3] = 15000, --Coupes
    [4] = 15000, --Muscle
    [5] = 7500, --Sports Classics
    [6] = 5000, --Sports
    [7] = 2000, --Super
    [8] = 1000, --Motorcycles
    [9] = 40000, --Off-road
    [10] = 60000, --Industrial
    [11] = 5000, --Utility
    [12] = 40000, --Vans
    [13] = 1, --Cycles
    [14] = 15000, --Boats
    [15] = 8000, --Helicopters
    [16] = 20000, --Planes
    [17] = 2000, --Service
    [18] = 5000, --Emergency
    [19] = 80000, --Military
    [20] = 50000, --Commercial
    [21] = 1, --Trains
}

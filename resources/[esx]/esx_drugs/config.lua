Config              = {}
Config.MarkerType   = -1
Config.DrawDistance = 100.0
Config.ZoneSize     = {x = 5.0, y = 5.0, z = 3.0}
Config.MarkerColor  = {r = 100, g = 204, b = 100}

Config.RequiredCopsCoke  = 2
Config.RequiredCopsMeth  = 3
Config.RequiredCopsWeed  = 1
Config.RequiredCopsOpium = 3

Config.TimeToFarm    = 5 * 1000
Config.TimeToProcess = 5 * 1000
Config.TimeToSell    = 5 * 1000

Config.Locale = 'fr'

Config.Zones = {
	CokeField =			{x=1099.826,  y=-3194.494, z=-38.993,	name = _U('coke_field'),		sprite = 501,	color = 40},
	CokeProcessing =	{x=1093.462, y=-3197.138, z=-38.993,	name = _U('coke_processing'),	sprite = 478,	color = 40},
	CokeDealer =		{x=1414.966, y=1163.571,  z=114.334,	name = _U('coke_dealer'),		sprite = 500,	color = 75},
	MethField =			{x=1003.918, y=-3199.353,  z=-38.993,	name = _U('meth_field'),		sprite = 499,	color = 26},
	MethProcessing =	{x=1011.043, y=-3196.531,  z=-38.993,	name = _U('meth_processing'),	sprite = 499,	color = 26},
	MethDealer =		{x=2746.221, y=1542.212, z=42.893,	name = _U('meth_dealer'),		sprite = 500,	color = 75},
	WeedField =			{x=1057.68,  y=-3196.309,  z=-39.161,	name = _U('weed_field'),		sprite = 496,	color = 52},
	WeedProcessing =	{x=1037.009,  y=-3205.336,  z=-38.171,	name = _U('weed_processing'),	sprite = 496,	color = 52},
	WeedDealer =		{x=-1358.359, y=-1210.601, z=4.451,	name = _U('weed_dealer'),		sprite = 500,	color = 75},
	--OpiumField =		{x=1838.24,	 y=5035.191,  z=57.272,	name = _U('opium_field'),		sprite = 51,	color = 60},
	--OpiumProcessing =	{x=-438.544, y=-2184.25, z=10.522,	name = _U('opium_processing'),	sprite = 51,	color = 60},
	--OpiumDealer =		{x=-1217.199, y=-1055.398, z=8.412,	name = _U('opium_dealer'),		sprite = 500,	color = 75}
}

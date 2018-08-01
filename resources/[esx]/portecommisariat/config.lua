Config = {}
Config.Locale = 'en'

Config.DoorList = {

	--
	-- Mission Row First Floor
	--

	-- Entrance Doors
	[1] = {
		objName = "v_ilev_ph_door01",
		objCoords  = {x = 434.747, y = -980.618, z = 30.839},
		textCoords = {x = 434.747, y = -981.50, z = 31.50},
		locked = false,
		distance = 2.5
	},

	[2] = {
		objName = "v_ilev_ph_door002",
		objCoords  = {x = 434.747, y = -983.215, z = 30.839},
		textCoords = {x = 434.747, y = -982.50, z = 31.50},
		locked = false,
		distance = 2.5
	},

	-- To locker room & roof
	[3] = {
		objName = "v_ilev_ph_gendoor004",
		objCoords  = {x = 449.698, y = -986.469, z = 30.689},
		textCoords = {x = 450.104, y = -986.388, z = 31.739},
		locked = true
	},

	-- Rooftop
	[4] = {
		objName = "v_ilev_gtdoor02",
		objCoords  = {x = 464.361, y = -984.678, z = 43.834},
		textCoords = {x = 464.361, y = -984.050, z = 44.834},
		locked = true
	},

	-- Hallway to roof
	[5] = {
		objName = "v_ilev_arm_secdoor",
		objCoords  = {x = 461.286, y = -985.320, z = 30.839},
		textCoords = {x = 461.50, y = -986.00, z = 31.50},
		locked = true
	},

	-- Armory
	[6] = {
		objName = "v_ilev_arm_secdoor",
		objCoords  = {x = 452.618, y = -982.702, z = 30.689},
		textCoords = {x = 453.079, y = -982.600, z = 31.739},
		locked = true
	},

	-- Captain Office
	[7] = {
		objName = "v_ilev_ph_gendoor002",
		objCoords  = {x = 447.238, y = -980.630, z = 30.689},
		textCoords = {x = 447.200, y = -980.010, z = 31.739},
		locked = true
	},

	-- To downstairs (double doors)
	[8] = {
		objName = "v_ilev_ph_gendoor005",
		objCoords  = {x = 443.97, y = -989.033, z = 30.6896},
		textCoords = {x = 444.020, y = -989.445, z = 31.739},
		locked = true,
		distance = 2.5
	},

	[9] = {
		objName = "v_ilev_ph_gendoor005",
		objCoords  = {x = 445.37, y = -988.705, z = 30.6896},
		textCoords = {x = 445.350, y = -989.445, z = 31.739},
		locked = true,
		distance = 2.5
	},

	-- 
	-- Mission Row Cells
	--

	-- Main Cells
	[10] = {
		objName = "v_ilev_ph_cellgate",
		objCoords  = {x = 463.815, y = -992.686, z = 24.9149},
		textCoords = {x = 463.30, y = -992.686, z = 25.10},
		locked = true
	},

	-- Cell 1
	[11] = {
		objName = "v_ilev_ph_cellgate",
		objCoords  = {x = 462.381, y = -993.651, z = 24.914},
		textCoords = {x = 461.806, y = -993.308, z = 25.064},
		locked = true
	},

	-- Cell 2
	[12] = {
		objName = "v_ilev_ph_cellgate",
		objCoords  = {x = 462.331, y = -998.152, z = 24.914},
		textCoords = {x = 461.806, y = -998.800, z = 25.064},
		locked = true
	},

	-- Cell 3
	[13] = {
		objName = "v_ilev_ph_cellgate",
		objCoords  = {x = 462.704, y = -1001.92, z = 24.9149},
		textCoords = {x = 461.806, y = -1002.450, z = 25.064},
		locked = true
	},

	-- To Back
	[14] = {
		objName = "v_ilev_gtdoor",
		objCoords  = {x = 463.478, y = -1003.538, z = 25.005},
		textCoords = {x = 464.00, y = -1003.50, z = 25.50},
		locked = true
	},

	--
	-- Mission Row Back
	--

	-- Back (double doors)
	[15] = {
		objName = "v_ilev_rc_door2",
		objCoords  = {x = 467.371, y = -1014.452, z = 26.536},
		textCoords = {x = 468.09, y = -1014.452, z = 27.1362},
		locked = true,
		distance = 2.5
	},

	[16] = {
		objName = "v_ilev_rc_door2",
		objCoords  = {x = 469.967, y = -1014.452, z = 26.536},
		textCoords = {x = 469.35, y = -1014.452, z = 27.136},
		locked = true,
		distance = 2.5
	},

	-- Back Gate
	[17] = {
		objName = "hei_prop_station_gate",
		objCoords  = {x = 488.894, y = -1017.210, z = 27.146},
		textCoords = {x = 488.894, y = -1020.210, z = 30.00},
		locked = true,
		distance = 14,
		size = 2
	},

	--
	-- Sandy Shores
	--

	-- Entrance
	[18] = {
		objName = "v_ilev_shrfdoor",
		objCoords  = {x = 1855.105, y = 3683.516, z = 34.266},
		textCoords = {x = 1855.105, y = 3683.516, z = 35.00},
		locked = false
	},

	--
	-- Paleto Bay
	--

	-- Entrance (double doors)
	[19] = {
		objName = "v_ilev_shrf2door",
		objCoords  = {x = -443.14, y = 6015.685, z = 31.716},
		textCoords = {x = -443.14, y = 6015.685, z = 32.00},
		locked = false,
		distance = 2.5
	},

	[20] = {
		objName = "v_ilev_shrf2door",
		objCoords  = {x = -443.951, y = 6016.622, z = 31.716},
		textCoords = {x = -443.951, y = 6016.622, z = 32.00},
		locked = false,
		distance = 2.5
	},

	--
	-- Bolingbroke Penitentiary
	--

	-- Entrance (Two big gates)
	[21] = {
		objName = "prop_gate_prison_01",
		objCoords  = {x = 1844.998, y = 2604.810, z = 44.638},
		textCoords = {x = 1844.998, y = 2608.50, z = 48.00},
		locked = true,
		distance = 12,
		size = 2
	},

	[22] = {
		objName = "prop_gate_prison_01",
		objCoords  = {x = 1818.542, y = 2604.812, z = 44.611},
		textCoords = {x = 1818.542, y = 2608.40, z = 48.00},
		locked = true,
		distance = 12,
		size = 2
	}
}
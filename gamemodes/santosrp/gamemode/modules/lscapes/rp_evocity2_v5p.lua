
-----------------------------------------------------
--[[
	Name: rp_evocity2_v5p.lua
	For: SantosRP
	By: Ultra
]]--

return {
	------------------------------------------------
	{
		UID = "city",
		Points = {
			{ Vector('689.639404 4805.035645 216.452072'), 300 }, --City <-> Cub Foods Tunnel
			{ Vector('-3535.545898 1983.340088 251.462280'), 300 }, --City <-> Gas Station Tunnel
			{ Vector('1942.140015 -138.475266 204.031250'), 90 }, --Bank
			{ Vector('-595.838867 -1237.386108 149.035812'), 256 }, --Spawn
			{ Vector('940.327087 -2603.122559 -85.260681'), 150 }, --Nexus Garage
			{ Vector('-87.987389 -1704.296021 140.031250'), 80 }, --Nexus Elev
		},

		Groups = {
			Day = {
				{
					src="ambient/atmosphere/office_outside_traffic_lp_02.wav",
					flags={playonce=true, indoorfade = true},
					volume=0.2, pitch=100,
					volume_indoors=0.075, pitch_indoors=80,
					indoor_transit_dur=2
				},
			},
			Night = {
				{
					src="ambient/nature/shoots_jungle_lp_03.wav",
					flags={playonce=true, indoorfade = true},
					volume=0.2, pitch=100,
					volume_indoors=0.075, pitch_indoors=80,
					indoor_transit_dur=2
				},
			},
			Raining = {
				{
					src="ambient/levels/canals/windmill_wind_loop1.wav",
					flags={playonce=true, indoorfade = true},
					volume=0.1, pitch=70,
					volume_indoors=0.075, pitch_indoors=70,
					indoor_transit_dur=2
				},
			},
		},
	},
	------------------------------------------------
	{
		UID = "country",
		Points = {
			{ Vector('7909.881836 5901.695313 134.031250'), 90 }, --Cub Foods
			{ Vector('9242.363281 5068.563965 139.597870'), 170 }, --Cub Foods
			{ Vector('8990.488281 7066.523926 134.031250'), 90 }, --Greenline
			{ Vector('3622.873779 4813.163574 207.973145'), 300 }, --City <-> Cub Foods Tunnel
			{ Vector('-5740.138672 1979.152466 262.770477'), 300 }, --City <-> Gas Station Tunnel
			{ Vector('7282.666992 -7771.893066 -1650.104370'), 300 }, --Cabin Road
			{ Vector('3757.917969 5412.693359 -1697.968750'), 300 }, --Train Tunnel
		},

		Groups = {
			Day = {
				{
					src="ambient/nature/woodland_ambient_1.wav",
					flags={playonce=true, indoorfade = true},
					volume=0.2, pitch=100,
					volume_indoors=0.075, pitch_indoors=80,
					indoor_transit_dur=2
				},
			},
			Night = {
				{
					src="ambient/nature/shoots_jungle_lp_03.wav",
					flags={playonce=true, indoorfade = true},
					volume=0.2, pitch=100,
					volume_indoors=0.075, pitch_indoors=80,
					indoor_transit_dur=2
				},
			},
			Raining = {
				{
					src="ambient/levels/canals/windmill_wind_loop1.wav",
					flags={playonce=true, indoorfade = true},
					volume=0.1, pitch=70,
					volume_indoors=0.075, pitch_indoors=70,
					indoor_transit_dur=2
				},
			},
		},
	},
	------------------------------------------------
	{
		UID = "country2",
		Points = {
			{ Vector('7664.922852 -9884.128906 -2159.115234'), 300 }, --Cabin Road
			{ Vector('-6130.000977 -9525.382813 -3100.088135'), 500 }, --Lake
			{ Vector('-4802.069336 -9401.856445 -2870.946777'), 500 }, --Lake
			{ Vector('-2733.082275 -9224.147461 -2842.147705'), 500 }, --Lake
			{ Vector('-1002.632690 -9139.275391 -3080.193359'), 500 }, --Lake
		},

		Groups = {
			Day = {
				{
					src="ambient/nature/woodland_ambient_1.wav",
					flags={playonce=true, indoorfade = true},
					volume=0.2, pitch=100,
					volume_indoors=0.075, pitch_indoors=80,
					indoor_transit_dur=2
				},
			},
			Night = {
				{
					src="ambient/levels/forest/frogs_loop1.wav",
					flags={playonce=true, indoorfade = true},
					volume=0.2, pitch=100,
					volume_indoors=0.075, pitch_indoors=80,
					indoor_transit_dur=2
				},
			},
			Raining = {
				{
					src="ambient/levels/canals/windmill_wind_loop1.wav",
					flags={playonce=true, indoorfade = true},
					volume=0.1, pitch=70,
					volume_indoors=0.075, pitch_indoors=70,
					indoor_transit_dur=2
				},
			},
		},
	},
	------------------------------------------------
	{
		UID = "trainsystem",
		Points = {
			{ Vector('3643.429932 5410.634766 -1714.915161'), 128 },
			{ Vector('2478.863525 133.634216 -1694.968750'), 110 },
			{ Vector('2595.679199 7454.374512 -1694.968750'), 110 },
		},

		Groups = {
			Day = {
				{
					src="ambient/atmosphere/corridor2.wav",
					flags={playonce=true},
					volume=0.2, pitch=100,
				},
			},
			Night = {
				{
					src="ambient/atmosphere/corridor2.wav",
					flags={playonce=true},
					volume=0.2, pitch=100,
				},
			},
			Raining = {
				{
					src="ambient/atmosphere/corridor2.wav",
					flags={playonce=true},
					volume=0.2, pitch=100,
				},
				{
					src="ambient/water/drip_loop1.wav",
					flags={playonce=true},
					volume=0.1, pitch=100,
				},
			},
		},
	},
	------------------------------------------------
	{
		UID = "jail",
		Points = {
			{ Vector('925.780518 -2375.301514 -100.722305'), 128 },
			{ Vector('-765.343506 -1958.611938 -101.397476'), 100 },
		},

		Groups = {
			Day = {
				{
					src="ambient/atmosphere/tone_alley.wav",
					flags={playonce=true},
					volume=0.2, pitch=100,
				},
			},
			Night = {
				{
					src="ambient/atmosphere/tone_alley.wav",
					flags={playonce=true},
					volume=0.2, pitch=100,
				},
			},
			Raining = {
				{
					src="ambient/atmosphere/tone_alley.wav",
					flags={playonce=true},
					volume=0.2, pitch=100,
				},
				{
					src="ambient/water/drip_loop1.wav",
					flags={playonce=true},
					volume=0.2, pitch=100,
				},
			},
		},
	},
	------------------------------------------------
}
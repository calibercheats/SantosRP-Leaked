
-----------------------------------------------------
--[[
	Name: map_config.lua
	For: SantosRP
	By: Ultra
]]--

if SERVER then
	resource.AddWorkshop( "538207599") --Map
	resource.AddWorkshop( "538347004") --Map Content Pt.1
	resource.AddWorkshop( "538350412") --Map Content Pt.2
	
	--[[ Car Dealer Settings ]]--
	GM.Config.CarSpawns = {
		{ Vector( 1310.484131, -2592.022949, 73.458382 ), Angle( 0, 180, 0 ) },
		{ Vector( 1607.774902, -2595.447510, 73.458107 ), Angle( 0, 180, 0 ) },
		{ Vector( 2171.744385, -2594.030029, 73.458015 ), Angle( 0, 180, 0 ) },
		{ Vector( 2401.619385, -2600.210205, 73.458221 ), Angle( 0, 180, 0 ) },
	}
	GM.Config.CarGarageBBox = {
		Min = Vector( 1184.186768, -3063.821289, 40 ),
		Max = Vector( 2575.730957, -2432.401611, 768 ),
	}

	--[[ Jail Settings ]]--
	GM.Config.JailPositions = {
		Vector( 461.834015, -2037.676758, -427.968750 ),
		Vector( 593.638184, -2037.659912, -427.968750 ),
		Vector( 720.910706, -2037.880737, -427.968750 ),
		Vector( 849.009399, -2037.316528, -427.968750 ),
		Vector( 847.995178, -2307.409424, -427.968750 ),
		Vector( 718.337891, -2307.963379, -427.968750 ),
		Vector( 590.026184, -2306.452148, -427.968750 ),
		Vector( 462.762604, -2304.954102, -427.968750 ),
	}
	GM.Config.JailReleasePositions = {
		Vector( -285.720825, -1640.931152, -427.968750 ),
		Vector( -283.458893, -1547.531006, -427.968750 ),
		Vector( -377.059174, -1545.145752, -427.968750 ),
		Vector( -379.144470, -1631.251587, -427.968750 ),
		Vector( -475.136902, -1628.926880, -427.968750 ),
		Vector( -473.319794, -1542.640015, -427.968750 ),
	}
	GM.Config.JailBBox = {
		{
			Min = Vector( -290, -2770, -440 ),
			Max = Vector( 1170, -1610, -290 ),
		},
	}

	--[[ NPC Drug Dealer Settings ]]--
	GM.Config.DrugNPCPositions = {
		{ Vector( "3852.521729 5.373933 163.535385" ), Angle( 0, 90, 0 ) },
		{ Vector( "9762.106445 10170.002930 -26.580696" ), Angle( 0, -130, 0 ) },
		{ Vector( "-2658.447998 14366.211914 277.790100" ), Angle( 0, 180, 0 ) },
		{ Vector( "-6963.710449 -9530.060547 -3070.177246" ), Angle( 0, 5, 0 ) },
		{ Vector( "10392.054688 -11674.130859 -1641.241455" ), Angle( 0, 145, 0 ) },
		{ Vector( "3367.764404 4803.556152 -1720.241455" ), Angle( 0, 130, 0 ) },
		{ Vector( "8575.880859 5287.303711 189.128784" ), Angle( 0, -41, 0 ) },
	}

	--[[ Map Settings ]]--
	GM.Config.SpawnPoints = {
		Vector( -394.732300, -1292.068115, 76.031250 ),
		Vector( -394.552246, -1202.683960, 76.031250 ),
		Vector( -394.354004, -1104.262451, 76.031250 ),
		Vector( -487.899536, -1104.020264, 76.031250 ),
		Vector( -488.101715, -1204.380005, 76.031250 ),
		Vector( -488.373322, -1339.218872, 76.031250 ),
		Vector( -568.612610, -1339.057129, 76.031250 ),
		Vector( -587.383118, -1114.140015, 76.031250 ),
		Vector( -681.023193, -1113.951416, 76.031250 ),
		Vector( -681.268005, -1235.579468, 76.031250 ),
		Vector( -681.484619, -1343.145508, 76.031250 ),
		Vector( -779.959229, -1342.947021, 76.031250 ),
		Vector( -779.708984, -1218.673706, 76.031250 ),
		Vector( -779.474060, -1102.016724, 76.031250 ),
	}

	--[[ Register the car customs shop location ]]--
	GM.CarShop.m_tblGarage["rp_evocity2_v5p"] = {
		Doors = {
			["carbay"] = { CarPos = Vector(-2553.035645, 3598.907959, 76.031250) },
			["truckbay"] = { CarPos = Vector(-2778.194580, 3598.907959, 76.031250) },
			["tirebay"] = { CarPos = Vector(-3010.120361, 3598.907959, 76.031250) },
		},
		BBox = {
			Min = Vector( -3143.812256, 3088.265625, 76.031250 ), --Inside of the garage
			Max = Vector( -2192.228760, 3839.771240, 768 ), --Inside of the garage
		},
		PlayerSetPos = Vector( -3156.470459, 3024.677002, 140.031250 ), --If a player gets inside the garage, set them to this location
	}

	--[[ Fire Spawner Settings ]]--
	GM.Config.AutoFiresEnabled = true
	GM.Config.AutoFireSpawnMinTime = 60 *45
	GM.Config.AutoFireSpawnMaxTime = 60 *90
	GM.Config.AutoFireSpawnPoints = {
		--Gas Station
		Vector( "-7539.280273 930.511963 212.031250" ),
		Vector( "-7449.887207 1676.010864 204.031250" ),
		Vector( "-7533.023438 1212.461426 212.031250" ),

		--Club Foods
		Vector( "8965.544922 6195.102051 134.031250" ),

		--Tunnel
		Vector( "-6744.672363 6608.176270 171.031250" ),
		Vector( "-6748.165039 4828.591309 171.031250" ),
		Vector( "-6747.065918 3817.322998 171.567383" ),

		--Hardware/Electronics Store
		Vector( "-2340.486816 -1867.741699 140.031250" ),

		--Dumpsters
		Vector( "3950.984131 23.301125 155.674652" ),
		Vector( "3813.030518 159.608032 155.674561" ),
		Vector( "4274.006348 1812.064453 155.031250" ),

		--Cornfield
		Vector( "11711.549805 -9375.354492 -1663.968750" ),
		Vector( "13140.930664 -4836.062500 -1663.968750" ),
		Vector( "10472.782227 -6819.507324 -1663.414917" ),
		Vector( "9463.342773 -2646.884521 -1661.696289" ),

		--Suburbs Culvert
		Vector( "7492.237793 9548.186523 -1823.968750" ),
		Vector( "7494.773926 11276.956055 -1823.968750" ),

		--Industrial Roof Fires
		Vector( "7409.124023 3531.033691 -1470.968750" ),
		Vector( "8652.233398 4505.131836 -1503.968750" ),
		Vector( "10324.675781 3013.535156 -1503.968750" ),

		--Downtown
		Vector( "3812.182617 -658.496460 140.031250" ),
		Vector( "1148.885986 2596.482666 140.031250" ),
		Vector( "-2691.152588 -2196.358398 140.031250" ),

		--Downtown Roof Fires
		Vector( "-244.265961 3205.770020 392.031250" ),
		Vector( "3956.343750 1744.863892 460.031250" ),
		Vector( "3949.144043 -2804.832520 552.031250" ),
		Vector( "-3048.348389 3563.605469 404.031250" ),

		--Lake Wildfires
		Vector( "7553.983887 -7485.422852 -1707.293457" ),
		Vector( "2402.063965 -9171.030273 -2860.048584" ),

		--Industrial Wildfires
		Vector( "2617.985596 13416.206055 128.031250" ),
		Vector( "-6786.890625 12389.463867 241.336578" ),

	}
end

--[[ Car Dealer Settings ]]--
GM.Config.CarPreviewModelPos = Vector( 2027.472656, -1631.546143, 81 )
GM.Config.CarPreviewCamPos = Vector( 2211.701172, -1742.324707, 154.049805 )
GM.Config.CarPreviewCamAng = Angle( 8.931836, 150.676498, 0 )
GM.Config.CarPreviewCamLen = 1.5

--[[ Chop Shop ]]--
GM.Config.ChopShop_ChopLocation = Vector( 8000, 8000, 8000 )

--[[ Weather & Day Night ]]--
GM.Config.Weather_SkyZPos = nil --Skybox is not even height!
GM.Config.FogLightingEnabled = true
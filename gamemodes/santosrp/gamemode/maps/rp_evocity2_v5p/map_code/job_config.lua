
-----------------------------------------------------
--[[ EMS Config ]]--
GM.Config.EMSHospitalZone = {
	Min = Vector( -3297.870117, 127.989166, 40 ),
	Max = Vector( -2279.928711, 1151.56726, 768 ),
}

if SERVER then
	GM.Config.EMSParkingZone = {
		Min = Vector( -3297.792725, -383.840424, 40 ),
		Max = Vector( -2279.998535, 1599.912109, 768.031250 ),
	}

	GM.Config.EMSCarSpawns = {
		{ Vector( -2481.777100, 1525.218750, 69.531250 ), Angle( 0, 90, 0 ) },
		{ Vector( -2895.250244, 1522.187500, 69.531250 ), Angle( 0, 90, 0 ) },
		{ Vector( -3161.687500, 840.593750, 69.531250 ), Angle( 0, -180, 0 ) },
		{ Vector( -3168.843750, 371.748810, 69.531250 ), Angle( 0, -180, 0 ) },
		{ Vector( -3170.375000, -76.935921, 69.531250 ), Angle( 0, -180, 0 ) },
	}
end

--[[ Fire Config ]]--
if SERVER then
	GM.Config.FireParkingZone = {
		Min = Vector( 5029.154297, 12948.181641, 40 ),
		Max = Vector( 5726.643555, 13699.697266, 768 ),
	}

	GM.Config.FireCarSpawns = {
		{ Vector( 5146.250000, 13373.250000, 64.656250 ), Angle( 0, 180, 0 ) },
		{ Vector( 5363.656250, 13373.250000, 64.656250 ), Angle( 0, 180, 0 ) },
		{ Vector( 5585.437500, 13373.250000, 64.656250 ), Angle( 0, 180, 0 ) },
	}
end

--[[ Cop Config ]]--
if SERVER then
	GM.Config.CopParkingZone = {
		Min = Vector( -847.805176, -2467.872559, -200 ),
		Max = Vector(1155.529175, -1456.348877, 12 ),
	}

	GM.Config.CopCarSpawns = {
		{ Vector( -549.968750, -2288.947754, -184.250000 ), Angle( 0, 0, 0 ) },
		{ Vector( -266.125000, -2288.947754, -184.250000 ), Angle( 0, 0, 0 ) },
		{ Vector( -17.718750, -2288.9477549, -184.250000 ), Angle( 0, 0, 0 ) },
		{ Vector( 275.687286, -2288.9477546, -184.250000 ), Angle( 0, 0, 0 ) },
		{ Vector( 525.187500, -2288.9477544, -184.250000 ), Angle( 0, 0, 0 ) },

		{ Vector( -549.218750, -1613.590088, -184.250000 ), Angle( 0, -180, 0 ) },
		{ Vector( -276.406250, -1613.590088, -184.250000 ), Angle( 0, -180, 0 ) },
		{ Vector( -16.906250, -1613.590088, -184.250000 ), Angle( 0, -180, 0 ) },
	}
end

--[[ Tow Config ]]--
if SERVER then
	GM.Config.TowWelderZone = {
		Min = Vector( 7748.296387, 4112.204102, -1900 ),
		Max = Vector( 9531.646484, 4871.515137, -1576 ),
	}

	GM.Config.TowParkingZone = GM.Config.TowWelderZone

	GM.Config.TowCarSpawns = {
		{ Vector( 7986.875000, 4463.657227, -1822.500000 ), Angle( 0, -180, 0 ) },
	}
end

--[[ Taxi Config ]]--
if SERVER then
	GM.Config.TaxiParkingZone = {
		Min = Vector( 2515.426514, 2304.565186, 50 ),
		Max = Vector( 3202.832520, 2871.817871, 768 ),
	}

	GM.Config.TaxiCarSpawns = {
		{ Vector( 2727.124756, 2702.562500, 74.968750 ), Angle( 0, -95, 0 ) },
	}
end

--[[ Sales Config ]]--
if SERVER then
	GM.Config.SalesParkingZone = {
		Min = Vector( 7488.137207, 2068.309082, -1900 ),
		Max = Vector( 8127.776855, 3339.883545, -1500 ),
	}

	GM.Config.SalesCarSpawns = {
		{ Vector( 7758.981934, 3094.052979, -1819.333496 ), Angle( 0, -90, 0 ) },
		{ Vector( 7758.981934, 2709.895996, -1819.335083 ), Angle( 0, -90, 0 ) },
		{ Vector( 7758.981934, 2324.743652, -1819.322632 ), Angle( 0, -90, 0 ) },
	}
end

--[[ Mail Config ]]--
if SERVER then
	GM.Config.MailParkingZone = GM.Config.SalesParkingZone
	GM.Config.MailCarSpawns = GM.Config.SalesCarSpawns
end

GM.Config.MailDepotPos = Vector( 6976.370605, 3593.731445, -1822 )
GM.Config.MailPoints = {
	--Downtown
	{ Pos = Vector( -2344.704102, 1110.134033, 144.031250 ), Name = "Hospital", MinPrice = 10, MaxPrice = 50 },
	{ Pos = Vector( -3389.775146, 3050.851807, 140.031250 ), Name = "Midas", MinPrice = 10, MaxPrice = 50 },
	{ Pos = Vector( 65.712601, 2969.010742, 140.031250 ), Name = "Burger King", MinPrice = 10, MaxPrice = 50 },
	{ Pos = Vector( 3682.307373, 1733.354492, 140.031250 ), Name = "Drug Store", MinPrice = 10, MaxPrice = 50 },
	{ Pos = Vector( 3540.633545, -1473.747437, 140.031250 ), Name = "The Amber Room", MinPrice = 10, MaxPrice = 50 },
	{ Pos = Vector( 1918.448120, -132.143814, 204.031250 ), Name = "Bank of America", MinPrice = 10, MaxPrice = 75 },
	{ Pos = Vector( 2642.372559, -1604.760986, 140.031250 ), Name = "Big Bill Hells Car Dealership", MinPrice = 10, MaxPrice = 50 },
	{ Pos = Vector( 2996.193115, 2243.907227, 140.031250 ), Name = "Santos Taxi Service", MinPrice = 10, MaxPrice = 50 },
	{ Pos = Vector( 961.992188, 936.389893, 140.031250 ), Name = "Skyscraper", MinPrice = 10, MaxPrice = 75 },
	{ Pos = Vector( -818.550415, 637.146057, 140.031250 ), Name = "SINTEK Corp.", MinPrice = 10, MaxPrice = 75 },

	--Nexus
	{ Pos = Vector( -372.219818, -1945.486084, 140.031250 ), Name = "City Hall - Lobby", MinPrice = 10, MaxPrice = 50 },
	{ Pos = Vector( 81.361946, -2324.178711, 532.031250 ), Name = "City Hall - DoJ Office", MinPrice = 30, MaxPrice = 125 },
	{ Pos = Vector( -118.172173, -2360.723145, 1812.031250 ), Name = "City Hall - Courtroom", MinPrice = 50, MaxPrice = 145 },
	{ Pos = Vector( -324.674500, -1954.073975, 3859.031250 ), Name = "City Hall - Mayors Office", MinPrice = 75, MaxPrice = 175 },

	--Outskirts
	{ Pos = Vector( 7902.601074, 6007.001465, 134.031250 ), Name = "Club Foods", MinPrice = 25, MaxPrice = 100 },
	{ Pos = Vector( 4904.480957, 13011.675781, 132.031250 ), Name = "Fire Station", MinPrice = 25, MaxPrice = 100 },
	{ Pos = Vector( -3115.021729, 13544.376953, 261.031250 ), Name = "Old Factory", MinPrice = 25, MaxPrice = 100 },
	{ Pos = Vector( -4483.174316, 13580.305664, 260.031250 ), Name = "Run-down Office", MinPrice = 25, MaxPrice = 100 },
	{ Pos = Vector( -7296.888184, 1248.553711, 204.031250 ), Name = "Sinclair Dino Gas Station", MinPrice = 10, MaxPrice = 50 },

	--Rural
	{ Pos = Vector( 10277.615234, -3134.017578, -1631.968750 ), Name = "Farmhouse 1", MinPrice = 25, MaxPrice = 125 },
	{ Pos = Vector( 13624.173828, -10067.114258, -1631.968750 ), Name = "Farmhouse 2", MinPrice = 25, MaxPrice = 125 },
	{ Pos = Vector( 13209.252930, -11373.515625, -1661.968750 ), Name = "Rural House 1", MinPrice = 25, MaxPrice = 125 },
	{ Pos = Vector( 13195.466797, -13563.627930, -1663.968628 ), Name = "Rural House 3", MinPrice = 25, MaxPrice = 125 },
	{ Pos = Vector( 11940.638672, -11443.938477, -1656.323364 ), Name = "Santos Disposal", MinPrice = 25, MaxPrice = 125 },
	{ Pos = Vector( 11284.750000, -13812.377930, -1657.095581 ), Name = "Rural Warehouse", MinPrice = 25, MaxPrice = 125 },
	{ Pos = Vector( 10281.979492, -12124.657227, -1654.968750 ), Name = "Tyrones Used Books", MinPrice = 25, MaxPrice = 125 },

	--Industrial
	{ Pos = Vector( 9718.847656, 4038.681396, -1759.968750 ), Name = "Santos Transport Services", MinPrice = 25, MaxPrice = 100 },
	{ Pos = Vector( 7809.627930, 3473.699219, -1727.968750 ), Name = "MTL L-Warehouse", MinPrice = 25, MaxPrice = 100 },

	--Subs
	{ Pos = Vector( 10771.747070, 10721.315430, -1753.968750 ), Name = "Trailerhome 1", MinPrice = 25, MaxPrice = 125 },
	{ Pos = Vector( 11964.652344, 10778.247070, -1727.728882 ), Name = "Trailerhome 2", MinPrice = 25, MaxPrice = 125 },
	{ Pos = Vector( 5858.322754, 7919.748535, -1695.968750 ), Name = "Subs House 1", MinPrice = 25, MaxPrice = 100 },
	{ Pos = Vector( 6208.416016, 10050.833984, -1759.968750 ), Name = "Subs House 2", MinPrice = 25, MaxPrice = 100 },
	{ Pos = Vector( 8200.754883, 9966.955078, -1727.968750 ), Name = "Subs House 3", MinPrice = 25, MaxPrice = 100 },
}

--[[ Bus Config ]]--
if SERVER then
	GM.Config.BusParkingZone = {
		Min = Vector( 9920.004883, 3784.329346, -1850 ),
		Max = Vector( 10926.723633, 4867.349609, -1500 ),
	}
	GM.Config.BusCarSpawns = {
		{ Vector( 10591.398438, 3930.708252, -1824.126709 ), Angle( 0, 90, 0 ) },
	}
end

--[[ Secret Service Config ]]--
if SERVER then
	GM.Config.SSParkingZone = GM.Config.CopParkingZone
	GM.Config.SSCarSpawns = GM.Config.CopCarSpawns
end

--[[ City Worker Config ]]--
if SERVER then
	GM.Config.CityWorkerParkingZone = GM.Config.MailParkingZone
	GM.Config.CityWorkerCarSpawns = GM.Config.MailCarSpawns
end

GM.Config.RoadDamageSpawns = {
	{ pos = Vector('11431.840820 6001.366699 -1826.940552'), ang = Angle('-1.450 -10.695 0.615') },
	{ pos = Vector('-1305.553467 -2858.470703 63.717102'), ang = Angle('0.055 -69.983 -0.082') },
	{ pos = Vector('724.160706 -9.348305 63.782433'), ang = Angle('0.121 112.330 0.005') },
	{ pos = Vector('11112.172852 -7295.875977 -1732.052368'), ang = Angle('-0.088 112.368 0.005') },
	{ pos = Vector('10969.324219 -1453.527466 -1827.699951'), ang = Angle('-2.148 104.843 0.346') },
	{ pos = Vector('5857.631836 9820.044922 68.031281'), ang = Angle('0.000 -66.714 0.000') },
	{ pos = Vector('11423.945313 1007.981201 -1828.225830'), ang = Angle('0.055 -172.809 -0.077') },
	{ pos = Vector('3895.055176 4887.703125 63.791996'), ang = Angle('0.115 -162.828 0.005') },
	{ pos = Vector('-1119.346558 2827.454834 63.779293'), ang = Angle('0.121 -87.149 0.005') },
	{ pos = Vector('3268.300781 2028.429199 63.761909'), ang = Angle('0.121 -169.783 0.005') },
	{ pos = Vector('-1706.919189 906.710754 63.771881'), ang = Angle('0.115 -70.466 0.005') },
	{ pos = Vector('7128.834961 -7458.354492 -1807.530762'), ang = Angle('0.456 -140.620 7.987') },
	{ pos = Vector('6001.906250 7511.935059 63.835125'), ang = Angle('0.000 -90.000 0.000') },
	{ pos = Vector('-2584.201660 2071.343506 63.921383'), ang = Angle('-0.049 -44.797 0.099') },
	{ pos = Vector('3288.404785 -2720.681885 63.840164'), ang = Angle('0.060 127.277 -0.011') },
	{ pos = Vector('-3229.710693 -613.277344 63.761292'), ang = Angle('0.132 -62.133 0.005') },
	{ pos = Vector('-6683.717773 -3895.014404 107.000015'), ang = Angle('0.000 110.693 0.000') },
	{ pos = Vector('3073.872803 -663.262329 63.877438'), ang = Angle('0.071 -33.981 0.110') },
	{ pos = Vector('8387.370117 9044.853516 -1836.223389'), ang = Angle('0.088 -134.500 -0.011') },
	{ pos = Vector('12425.801758 -12671.913086 -1720.221191'), ang = Angle('-4.070 -165.619 -0.703') },
	{ pos = Vector('-4336.927734 12384.533203 196.031311'), ang = Angle('0.000 32.888 0.000') },
	{ pos = Vector('-6424.687012 9819.104492 196.000031'), ang = Angle('0.000 101.404 0.000') },
	{ pos = Vector('2978.581543 12527.668945 68.031281'), ang = Angle('0.000 6.855 0.000') },
	{ pos = Vector('-6787.585449 1785.961548 132.000031'), ang = Angle('0.000 104.821 0.000') },
	{ pos = Vector('-5429.631348 -7766.359375 103.567528'), ang = Angle('-2.895 177.127 0.791') },
	{ pos = Vector('5958.139160 12562.825195 68.031311'), ang = Angle('0.000 -70.779 0.000') },
	{ pos = Vector('7306.545410 547.448914 -1828.030884'), ang = Angle('-0.016 -71.021 0.027') },
	{ pos = Vector('6532.444824 8302.595703 -1836.223267'), ang = Angle('0.126 -63.435 0.005') },
}
GM.Config.HydrantDmgPoints = {
	{ pos = Vector('6145.791992 8843.930664 98.718628'), ang = Angle('2.298 175.945 0.264') },
	{ pos = Vector('4908.828125 12712.267578 101.451157'), ang = Angle('2.298 -90.177 0.264') },
	{ pos = Vector('-4213.314453 12773.599609 229.451141'), ang = Angle('2.298 -91.655 0.264') },
	{ pos = Vector('-6995.532227 1659.537842 173.482391'), ang = Angle('2.298 0.514 0.264') },
	{ pos = Vector('8568.797852 1378.248047 -1790.548828'), ang = Angle('2.298 -90.556 0.264') },
	{ pos = Vector('12791.173828 -12664.500000 -1694.548828'), ang = Angle('2.298 178.652 0.264') },
	{ pos = Vector('6427.714844 8688.075195 -1790.548828'), ang = Angle('2.298 44.903 0.264') },
	{ pos = Vector('-1909.557007 703.192505 109.482391'), ang = Angle('2.298 0.802 0.264') },
	{ pos = Vector('3493.383057 -1679.986938 109.482391'), ang = Angle('2.298 177.194 0.264') },
	{ pos = Vector('984.468933 2190.386719 109.482399'), ang = Angle('2.298 -90.083 0.264') },
	{ pos = Vector('1113.171875 -908.554626 109.482407'), ang = Angle('2.298 89.460 0.264') },
}
GM.Config.MowableGrassZones = {
	{
		--Burger King
		Name = "Burger King",
		Pay = 100,
		WorldHintPos = {
			Vector( -370.350342, 4316.525391, 234.032074 ),
		},
		Grass = {
			{ pos = Vector('-1077.540894 4012.120361 79.498924'), ang = Angle('1.500 23.472 -1.659') },
			{ pos = Vector('-721.874878 4454.689941 79.250328'), ang = Angle('-0.060 160.527 -1.258') },
			{ pos = Vector('-691.670044 4107.228516 79.378578'), ang = Angle('0.000 180.000 0.000') },
			{ pos = Vector('35.020187 4397.285156 79.296661'), ang = Angle('-1.225 88.857 0.352') },
			{ pos = Vector('-124.858818 4158.771973 79.285614'), ang = Angle('0.000 157.495 0.000') },
			{ pos = Vector('163.720123 4162.441895 79.321899'), ang = Angle('0.000 112.500 0.000') },
			{ pos = Vector('-937.096985 4325.409180 79.359474'), ang = Angle('0.000 157.500 0.000') },
			{ pos = Vector('-477.897919 4416.387695 79.367989'), ang = Angle('0.000 -179.995 0.000') },
			{ pos = Vector('328.322052 4363.070801 79.457497'), ang = Angle('-0.005 -157.522 0.000') },
			{ pos = Vector('-957.802002 3663.405518 79.425652'), ang = Angle('0.000 67.549 0.000') },
			{ pos = Vector('-418.024261 4139.688965 79.338341'), ang = Angle('0.000 -157.500 0.000') },
		}
	},
	{
		--Hospital
		Name = "Hospital",
		Pay = 65,
		WorldHintPos = {
			Vector( -2112.056885, 272.282013, 221.235641 ),
		},
		Grass = {
			{ pos = Vector('-2156.375000 139.500000 78.718750'), ang = Angle('2.681 -6.724 -0.308') },
			{ pos = Vector('-2150.500000 479.875000 76.812500'), ang = Angle('1.846 -12.964 0.220') },
			{ pos = Vector('-2912.218750 -263.000000 76.312500'), ang = Angle('1.846 -78.442 -0.439') },
			{ pos = Vector('-2583.656250 -275.812500 75.187500'), ang = Angle('0.615 -94.263 -0.044') },
			{ pos = Vector('-2140.187500 943.156250 80.375000'), ang = Angle('0.308 -37.134 0.044') },
			{ pos = Vector('-2355.500000 -65.218750 82.500000'), ang = Angle('0.000 -87.891 0.000') },
			{ pos = Vector('-2623.937500 -8.437500 77.093750'), ang = Angle('0.000 -68.423 0.000') },
		}
	},
		-- Suburbs
	{
		Name = "Subs House 1",
		Pay = 115,
		WorldHintPos = {
			Vector( 5952.513672, 7201.827148, -1651.053833 ),
		},
		Grass = {
			{ pos = Vector('5943.718750 6961.656250 -1775.500000'), ang = Angle('2.681 -33.662 0.396') },
			{ pos = Vector('6001.468750 6732.750000 -1780.625000'), ang = Angle('1.582 6.108 3.252') },
			{ pos = Vector('5968.562500 8325.718750 -1823.500000'), ang = Angle('0.000 20.742 0.000') },
			{ pos = Vector('6207.281250 6929.937500 -1799.593750'), ang = Angle('10.503 -3.208 -0.264') },
			{ pos = Vector('5571.781250 6988.531250 -1788.781250'), ang = Angle('-4.658 7.383 -1.143') },
			{ pos = Vector('6174.281250 8437.656250 -1820.406250'), ang = Angle('0.000 -3.604 0.000') },
			{ pos = Vector('5956.812500 7463.656250 -1763.406250'), ang = Angle('-1.670 1.670 -1.099') },
			{ pos = Vector('5569.593750 7260.375000 -1792.937500'), ang = Angle('-7.471 -9.097 -0.615') },
			{ pos = Vector('5955.187500 7138.500000 -1761.781250'), ang = Angle('0.000 15.820 0.000') },
			{ pos = Vector('6110.125000 7710.937500 -1767.531250'), ang = Angle('3.604 -14.238 0.000') },
		}
	},
	{
		Name = "Subs House 2",
		Pay = 125,
		WorldHintPos = {
			Vector( 6654.500977, 9636.234375, -1718.102295 ),
		},
		Grass = {
			{ pos = Vector('6413.843750 9764.343750 -1821.000000'), ang = Angle('0.000 -82.266 0.000') },
			{ pos = Vector('5573.437500 9507.718750 -1823.625000'), ang = Angle('0.000 -136.187 0.000') },
			{ pos = Vector('6515.562500 9354.656250 -1824.812500'), ang = Angle('0.000 -90.879 0.000') },
			{ pos = Vector('5692.281250 9367.500000 -1824.218750'), ang = Angle('0.000 -59.941 0.000') },
			{ pos = Vector('7185.750000 9976.031250 -1822.968750'), ang = Angle('0.000 46.011 0.000') },
			{ pos = Vector('6543.125000 9537.656250 -1823.843750'), ang = Angle('0.000 -101.865 0.000') },
			{ pos = Vector('6765.250000 9383.125000 -1821.000000'), ang = Angle('0.000 -139.438 0.000') },
			{ pos = Vector('4944.593750 9502.375000 -1824.687500'), ang = Angle('0.000 -115.576 0.000') },
			{ pos = Vector('6624.093750 9943.375000 -1821.000000'), ang = Angle('0.000 169.893 0.000') },
			{ pos = Vector('6712.250000 9698.468750 -1814.093750'), ang = Angle('0.000 68.730 0.000') },
			{ pos = Vector('7192.687500 9713.968750 -1820.250000'), ang = Angle('0.000 -105.029 0.000') },
			{ pos = Vector('5209.062500 9368.437500 -1824.531250'), ang = Angle('0.000 -133.857 0.000') },
			{ pos = Vector('4390.875000 9496.875000 -1825.750000'), ang = Angle('0.000 -65.742 0.000') },
			{ pos = Vector('7028.281250 9512.000000 -1820.687500'), ang = Angle('0.000 -159.653 0.000') },
			{ pos = Vector('6924.906250 9856.687500 -1819.031250'), ang = Angle('0.000 -16.831 0.000') },
			{ pos = Vector('6853.000000 9595.937500 -1803.250000'), ang = Angle('0.000 -77.607 0.000') },
			{ pos = Vector('6292.437500 9360.687500 -1824.187500'), ang = Angle('0.000 -75.981 0.000') },
			{ pos = Vector('5470.593750 9353.593750 -1823.125000'), ang = Angle('0.000 -82.354 0.000') },
			{ pos = Vector('4806.156250 9333.281250 -1825.187500'), ang = Angle('0.000 -90.835 0.000') },
			{ pos = Vector('7212.343750 9402.593750 -1821.000000'), ang = Angle('0.000 116.719 0.000') },
			{ pos = Vector('4644.875000 9494.218750 -1825.000000'), ang = Angle('0.000 -100.679 0.000') },
			{ pos = Vector('4505.750000 9345.531250 -1823.375000'), ang = Angle('0.000 -86.836 0.000') },
		}
	},
	{
		Name = "Subs House 3",
		Pay = 120,
		WorldHintPos = {
			Vector( 8075.389648, 9605.638672, -1689.889160 ),
		},
		Grass = {
			{ pos = Vector('8825.531250 10244.125000 -1824.406250'), ang = Angle('0.000 -99.448 0.000') },
			{ pos = Vector('8808.875000 9790.437500 -1824.156250'), ang = Angle('0.000 -142.515 0.000') },
			{ pos = Vector('8918.250000 9999.406250 -1824.906250'), ang = Angle('0.000 -129.199 0.000') },
			{ pos = Vector('7944.406250 9657.031250 -1824.468750'), ang = Angle('0.000 -87.056 0.000') },
			{ pos = Vector('8813.500000 9340.468750 -1824.718750'), ang = Angle('0.000 -95.361 0.000') },
			{ pos = Vector('7740.031250 9562.281250 -1824.156250'), ang = Angle('0.000 -76.245 0.000') },
			{ pos = Vector('7902.093750 9348.906250 -1821.000000'), ang = Angle('0.000 -77.520 0.000') },
			{ pos = Vector('8888.500000 9549.250000 -1824.687500'), ang = Angle('0.000 -174.727 0.000') },
			{ pos = Vector('8124.281250 9344.593750 -1824.062500'), ang = Angle('0.000 -89.209 0.000') },
			{ pos = Vector('8352.843750 9395.406250 -1825.625000'), ang = Angle('0.000 -166.816 0.000') },
			{ pos = Vector('7715.000000 9354.187500 -1823.187500'), ang = Angle('0.000 -61.523 0.000') },
			{ pos = Vector('8112.468750 9502.281250 -1825.093750'), ang = Angle('0.000 -93.120 0.000') },
			{ pos = Vector('8351.343750 9625.687500 -1824.812500'), ang = Angle('0.000 -115.444 0.000') },
			{ pos = Vector('8131.031250 9744.593750 -1824.562500'), ang = Angle('0.000 -110.830 0.000') }, 
		}
	},
}

--[[ Garbage Worker Config ]]--
if SERVER then
	GM.Config.GarbageWorkerParkingZone = {
		Min = Vector(11285.246094, -12391.606445, -1750),
		Max = Vector(12191.872070, -11378.852539, -1500)
	}
	GM.Config.GarbageWorkerCarSpawns = { {Vector(12058.280273, -11678.176758, -1719.192749), Angle(0, -180, 0)} }

	GM.Config.GarbageWorkerDumpAngs = { Min = Angle(-22.5, -96, -22.5), Max = Angle(22.5, -41, 22.5) }
end

GM.Config.GarbageWorkerDumpPos = Vector( 11611.591797, -12012.093750, -1719.062500 )
GM.Config.GarbageWorkerMaxDumpDist = 80 --dist +/-
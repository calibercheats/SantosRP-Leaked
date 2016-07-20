
-----------------------------------------------------
--[[
	Name: chevrolet.lua
	For: SantosRP
	By: Rustic7
]]--

local Car = {}
Car.Make = "Chevrolet"
Car.Name = "Blazer"
Car.UID = "chevrolet_blazer"
Car.Desc = "The Chevrolet, gmod-able by TDM"
Car.Model = "models/tdmcars/chev_blazer.mdl"
Car.Script = "scripts/vehicles/TDMCars/che_blazer.txt"
Car.Price = 4500
Car.FuellTank = 150
Car.FuelConsumption = 12.125
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 106.4, 22 ),
		ang = Angle( 0, 180, 106 ),
		scale = 0.024
	},
	{
		pos = Vector( 0, -105.8, 27 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.026
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Chevrolet"
Car.Name = "C10"
Car.UID = "chevrolet_c10"
Car.Desc = "The Chevrolet, gmod-able by TDM"
Car.Model = "models/tdmcars/chev_c10.mdl"
Car.Script = "scripts/vehicles/TDMCars/che_c10.txt"
Car.Price = 2500
Car.FuellTank = 88
Car.FuelConsumption = 8.75
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 112.5, 33 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.025
	},
	{
		pos = Vector( 19.5, -9.2, 64.9 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.024
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Chevrolet"
Car.Name = "Camaro SS 69"
Car.UID = "chevrolet_camaro_ss"
Car.Desc = "The Chevrolet, gmod-able by TDM"
Car.Model = "models/tdmcars/69camaro.mdl"
Car.Script = "scripts/vehicles/TDMCars/che_69camaro.txt"
Car.Price = 24300
Car.FuellTank = 88
Car.FuelConsumption = 8.75
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 115, 19 ),
		ang = Angle( 0, 180, 112 ),
		scale = 0.022
	},
	{
		pos = Vector( 0, -102.7, 26.3 ),
		ang = Angle( 0, 0, 110 ),
		scale = 0.022
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Chevrolet"
Car.Name = "Camaro ZL1"
Car.UID = "chevrolet_zli"
Car.Desc = "The Chevrolet, gmod-able by TDM"
Car.Model = "models/tdmcars/chev_camzl1.mdl"
Car.Script = "scripts/vehicles/TDMCars/camarozl1.txt"
Car.Price = 62000
Car.FuellTank = 88
Car.FuelConsumption = 8.75
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, -112, 33.2 ),
		ang = Angle( 0, 0, 87 ),
		scale = 0.027
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Chevrolet"
Car.Name = "Chevelle SS"
Car.UID = "chevrolet_chevelle"
Car.Desc = "The Chevrolet, gmod-able by TDM"
Car.Model = "models/tdmcars/chevelless.mdl"
Car.Script = "scripts/vehicles/TDMCars/che_chevelless.txt"
Car.Price = 32000
Car.FuellTank = 88
Car.FuelConsumption = 8.75
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 111, 24 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0
	},
	{
		pos = Vector( 0, -121, 25.8 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.02
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Chevrolet"
Car.Name = "Corvette GSC"
Car.UID = "chevrolet_corvette"
Car.Desc = "The Chevrolet, gmod-able by TDM"
Car.Model = "models/tdmcars/chev_corv_gsc.mdl"
Car.Script = "scripts/vehicles/TDMCars/chev_corv_gsc.txt"
Car.Price = 75000
Car.FuellTank = 88
Car.FuelConsumption = 8.75
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 108.5, 15 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.022
	},
	{
		pos = Vector( 0, -103, 29.8 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.028
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Chevrolet"
Car.Name = "Corvette Stingray 427"
Car.UID = "chevrolet_stingray"
Car.Desc = "The Chevrolet, gmod-able by TDM"
Car.Model = "models/tdmcars/chev_stingray427.mdl"
Car.Script = "scripts/vehicles/TDMCars/chevstingray427.txt"
Car.Price = 40000
Car.FuellTank = 88
Car.FuelConsumption = 8.75
Car.Tier = 2
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Chevrolet"
Car.Name = "Impala SS 96"
Car.UID = "chevrolet_impala"
Car.Desc = "The Chevrolet, gmod-able by TDM"
Car.Model = "models/tdmcars/chev_impala96.mdl"
Car.Script = "scripts/vehicles/TDMCars/che_impala96.txt"
Car.Price = 18000
Car.FuellTank = 88
Car.FuelConsumption = 8.75
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 121, 19 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.026
	},
	{
		pos = Vector( 0, -139, 34.5 ),
		ang = Angle( 0, 0, 75 ),
		scale = 0.029
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Chevrolet"
Car.Name = "Spark"
Car.UID = "chevrolet_spark"
Car.Desc = "The Chevrolet, gmod-able by TDM"
Car.Model = "models/tdmcars/spark.mdl"
Car.Script = "scripts/vehicles/TDMCars/che_spark.txt"
Car.Price = 8500
Car.FuellTank = 88
Car.FuelConsumption = 8.75
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 88.25, 20 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.035
	},
	{
		pos = Vector( 0, -85.5, 39 ),
		ang = Angle( 0, 0, 70 ),
		scale = 0.035
	}	
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Chevrolet"
Car.Name = "Suburban"
Car.UID = "chevrolet_suburban"
Car.Desc = "LWcars Suburban"
Car.Model = "models/Lonewolfie/chev_suburban.mdl"
Car.Script = "scripts/vehicles/lwcars/chev_suburban.txt"
Car.Price = 45000
Car.FuellTank = 100
Car.FuelConsumption = 8.75
Car.Tier = 2
Car.BlockedSkins = { 
	[1] = true, 
	[2] = true,
	[3] = true,
	[4] = true,
}
Car.BlockedBodyGroups = {
	[1] = { 0, 1, 2 },
	[2] = { 0, 1, 2 },
	[4] = { 0, 1, 2 },
	[5] = { 0, 1, 2 },
	[6] = { 0, 1, 2 },
	[7] = { 0, 1, 2, 3, 4 },
	[8] = 3,
	[9] = 1,
	[10] = { 1, 2, 3 },
	[11] = 1,
	[12] = 1,
	[13] = 1,
	[15] = { 1, 2 },
	[16] = { 1, 2 },
	[17] = { 1, 2 },
	[18] = { 1, 2 },
}
Car.LPlates = {
	{
		pos = Vector( 0, 136.2, 22.5 ),
		ang = Angle( 0, 180, 117 ),
		scale = 0.030
	},
	{
		pos = Vector( 0, -129.5, 46.6 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.029
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.VIP = true
Car.Make = "Chevrolet"
Car.Name = "Tahoe"
Car.UID = "chevrolet_tahoe"
Car.Desc = "LWcars Tahoe"
Car.Model = "models/Lonewolfie/chev_tahoe.mdl"
Car.Script = "scripts/vehicles/lwcars/chev_tahoe.txt"
Car.Price = 52000
Car.FuellTank = 150
Car.FuelConsumption = 8.75
Car.Tier = 2
Car.BlockedSkins = { 
	[1] = true, 
}
Car.BlockedBodyGroups = {
	[1] = 1,
	[2] = 1,
	[4] = 1,
	[5] = 1,
	[6] = 1,
	[8] = 1,
	[9] = 1,
	[10] = 1,
	[11] = 1,
	[12] = 1,
	[13] = 1,
}
Car.LPlates = {
	{
		pos = Vector( 0, 114.5, 20 ),
		ang = Angle( 0, 180, 106 ),
		scale = 0.028
	},
	{
		pos = Vector( 0, -113, 47 ),
		ang = Angle( 0, 0, 83.5 ),
		scale = 0.029
	}
}
GM.Cars:Register( Car )
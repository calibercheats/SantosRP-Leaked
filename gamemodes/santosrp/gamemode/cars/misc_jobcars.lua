
-----------------------------------------------------
--[[
	Name: misc_jobcars.lua
	For: SantosRP
	By: Ultra
]]--

local Car = {}
Car.Make = "Ford"
Car.Name = "Crown Victoria Taxi"
Car.UID = "taxi_cab"
Car.Job = "JOB_TAXI"
Car.Desc = "A taxi cab."
Car.Model = "models/tdmcars/crownvic_taxi.mdl"
Car.Script = "scripts/vehicles/TDMCars/crownvic_taxi.txt"
Car.FuellTank = 100
Car.FuelConsumption = 20
Car.LPlates = {
	{
		pos = Vector( 3, 103, 20 ),
		ang = Angle( 0, 180, 85 ),
		scale = 0.035
	},
	{
		pos = Vector( 3, -94.7, 29.9 ),
		ang = Angle( 0, 0, 70 ),
		scale = 0.035
	}
}
GM.Cars:RegisterJobCar( Car )

local Car = {}
Car.Make = "Dodge"
Car.Name = "Flatbed Tow Truck"
Car.UID = "tow_flatbed"
Car.Job = "JOB_TOW"
Car.Desc = "A tow truck."
Car.Model = "models/sentry/flatbed.mdl"
Car.Script = "scripts/vehicles/sentry/flatbed.txt"
Car.FuellTank = 65
Car.FuelConsumption = 28
Car.LPlates = {
	{
		pos = Vector( 0, 184.5, 24.60 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.025
	},
	{
		pos = Vector( 0, -187.5, 29 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.021
	}
}
GM.Cars:RegisterJobCar( Car )

local Car = {}
Car.Make = "Mercedes"
Car.Name = "Sprinter SWB"
Car.UID = "mail_truck"
Car.Job = "JOB_MAIL"
Car.Desc = "A mail truck."
Car.Model = "models/LoneWolfie/merc_sprinter_swb.mdl"
Car.Script = "scripts/vehicles/TDMCars/merc_sprinter_swb.txt"
Car.FuellTank = 200
Car.FuelConsumption = 20
Car.LPlates = {
	{
		pos = Vector( 0, 132.5, 24.4 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.020
	},
	{
		pos = Vector( -17, -113, 24.8 ),
		ang = Angle( 0, 0, 85 ),
		scale = 0.022
	}
}
GM.Cars:RegisterJobCar( Car )

local Car = {}
Car.Make = "Mercedes"
Car.Name = "Sprinter SWB"
Car.UID = "sales_truck"
Car.Job = "JOB_SALES_TRUCK"
Car.Desc = "A mail truck."
Car.Model = "models/LoneWolfie/merc_sprinter_swb.mdl"
Car.Script = "scripts/vehicles/LWCars/merc_sprinter_swb.txt"
Car.FuellTank = 200
Car.FuelConsumption = 20
Car.LPlates = {
	{
		pos = Vector( 0, 132.5, 24.4 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.020
	},
	{
		pos = Vector( -17, -113, 24.8 ),
		ang = Angle( 0, 0, 85 ),
		scale = 0.022
	}
}
GM.Cars:RegisterJobCar( Car )

local Car = {}
Car.Make = "MTL"
Car.Name = "Bus"
Car.UID = "mtl_bus"
Car.Job = "JOB_BUS_DRIVER"
Car.Desc = "A city bus."
Car.Model = "models/sligwolf/bus/bus.mdl"
Car.Script = "scripts/vehicles/sligwolf/sw_bus.txt"
Car.VehicleTable = "sw_bus"
Car.FuellTank = 200
Car.FuelConsumption = 20
GM.Cars:RegisterJobCar( Car )

local Car = {}
Car.Make = "Ford"
Car.Name = "F350"
Car.UID = "city_van"
Car.Job = "JOB_CITYWORKER"
Car.Desc = "A drivable Ford F350 SuperDuty by TheDanishMaster"
Car.Model = "models/tdmcars/for_f350.mdl"
Car.Script = "scripts/vehicles/TDMCars/f350.txt"
Car.FuellTank = 200
Car.FuelConsumption = 3.5
Car.LPlates = {
	{
		pos = Vector( 0, 143.5, 27 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.026
	},
	{
		pos = Vector( 0, -155.5, 34.8 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.029
	}
}
GM.Cars:RegisterJobCar( Car )

local Car = {}
Car.Make = "MTL"
Car.Name = "Garbage Truck"
Car.UID = "garbage_truck"
Car.Job = "JOB_GARBWORKER"
Car.Desc = "A garbage truck."
Car.Model = "models/sligwolf/garbagetruck/sw_truck.mdl"
Car.Script = "scripts/vehicles/sligwolf/sw_garbagetruck.txt"
Car.VehicleTable = "sw_garbagetruck"
Car.FuellTank = 200
Car.FuelConsumption = 20
Car.LPlates = {
	{
		pos = Vector( 30, 179, 14.5 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.032
	},
	{
		pos = Vector( 0, -156.5, 34.4 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.038
	}
}
GM.Cars:RegisterJobCar( Car )
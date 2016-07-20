
-----------------------------------------------------
--[[
	Name: ems_cars.lua
	For: SantosRP
	By: Ultra
]]--

local Car = {}
Car.Make = "Ford"
Car.Name = "Ford Crown Victoria"
Car.UID = "ems_firstrespond"
Car.Job = "JOB_EMS"
Car.Desc = "A first responder vehicle."
Car.Model = "models/tdmcars/emergency/for_crownvic.mdl"
Car.Script = "scripts/vehicles/TDMCars/for_crownvic.txt"
Car.FuellTank = 65
Car.FuelConsumption = 20
Car.LPlates = {
	{
		pos = Vector( 0, 127.5, 22.5 ),
		ang = Angle( 0, 180, 100 ),
		scale = 0.018
	},
	{
		pos = Vector( 0, -123.5, 38.8 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.025
	}
}
GM.Cars:RegisterJobCar( Car )

local Car = {}
Car.Make = "Ford"
Car.Name = "F350 Ambulance"
Car.UID = "ems_ambulance"
Car.Job = "JOB_EMS"
Car.Desc = "An ambulance."
Car.Model = "models/lonewolfie/ford_f350_ambu.mdl"
Car.Script = "scripts/vehicles/lwcars/ford_f350_ambu.txt"
Car.FuellTank = 65
Car.FuelConsumption = 20
Car.LPlates = {
	{
		pos = Vector( 0, 160, 33.5 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.020
	},
	{
		pos = Vector( 0, -170.8, 35.5 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.0310
	}
}
GM.Cars:RegisterJobCar( Car )

local Car = {}
Car.Make = "Chevrolet"
Car.Name = "Suburban Police Cruiser"
Car.UID = "ford_explorer_2013_ems"
Car.Job = "JOB_EMS"
Car.Desc = ""
Car.Model = "models/LoneWolfie/chev_suburban_pol.mdl"
Car.Script = "scripts/vehicles/LWCars/chev_suburban.txt"
Car.FuellTank = 70
Car.FuelConsumption = 9
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
GM.Cars:RegisterJobCar( Car )


-----------------------------------------------------
--[[
	Name: fire_cars.lua
	For: SantosRP
	By: Ultra
]]--

local Car = {}
Car.Make = "MTL"
Car.Name = "Fire Engine"
Car.UID = "fire_truck"
Car.Job = "JOB_FIREFIGHTER"
Car.Desc = "A fire truck."
Car.Model = "models/sentry/firetruk_hi.mdl"
Car.Script = "scripts/vehicles/sentry/firetruk_hi.txt"
Car.FuellTank = 120
Car.FuelConsumption = 20
Car.LPlates = {
	{
		pos = Vector( 0, 214, 31 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.030
	},
	{
		pos = Vector( 0, -176.5, 33 ),
		ang = Angle( 0, 2, 90 ),
		scale = 0.022
	}
}
GM.Cars:RegisterJobCar( Car )

local Car = {}
Car.Make = "Ford"
Car.Name = "F150 Fire"
Car.UID = "fire_first"
Car.Job = "JOB_FIREFIGHTER"
Car.Desc = "A fire truck."
Car.Model = "models/talonvehicles/tal_f150_pol.mdl"
Car.Script = "scripts/vehicles/TDMCars/tal_f150pole.txt"
Car.FuellTank = 120
Car.FuelConsumption = 20
Car.LPlates = {
	{
		pos = Vector( 1, 127, 26 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.022
	},
	{
		pos = Vector( 0, -139, 28 ),
		ang = Angle( 0, 0, 95 ),
		scale = 0.024
	}
}
GM.Cars:RegisterJobCar( Car )


-----------------------------------------------------
--[[
	Name: landrover.lua
	For: SantosRP
	By: Bradley
]]--

local Car = {}
Car.Make = "Land Rover"
Car.Name = "Range Rover"
Car.UID = "land_rover_range_rover"
Car.Desc = "The Land Rover Range Rover 08, gmod-able by TDM"
Car.Model = "models/tdmcars/landrover.mdl"
Car.Script = "scripts/vehicles/TDMCars/landrover.txt"
Car.Price = 69000
Car.FuellTank = 150
Car.FuelConsumption = 12.125
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 119.5, 28 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.030
	},
	{
		pos = Vector( 0, -116.2, 48 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.030
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.VIP = true
Car.Make = "Land Rover"
Car.Name = "Range Rover Supercharged"
Car.UID = "land_rover_range_rover_supercharged"
Car.Desc = "The Land Rover Range Rover Supercharged 2012, gmod-able by TDM"
Car.Model = "models/tdmcars/landrover12.mdl"
Car.Script = "scripts/vehicles/TDMCars/landrover12.txt"
Car.Price = 81000
Car.FuellTank = 88
Car.FuelConsumption = 8.75
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 122.5, 29 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.025
	},
	{
		pos = Vector( 0, -117, 50 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.028
	}
}
GM.Cars:Register( Car )
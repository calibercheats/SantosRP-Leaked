
-----------------------------------------------------
--[[
	Name: Morgan
	For: SantosRP
	By: 
]]--

local Car = {}
Car.VIP = true
Car.Make = "Morgan"
Car.Name = "Aero SS"
Car.UID = "morgan_aero"
Car.Desc = "A drivable Morgan Aero SSS by TheDanishMaster"
Car.Model = "models/tdmcars/morg_aeross.mdl"
Car.Script = "scripts/vehicles/TDMCars/morg_aeross.txt"
Car.Price = 165000
Car.FuellTank = 80
Car.FuelConsumption = 8
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 91.7, 20 ),
		ang = Angle( 0, 180, 80 ),
		scale = 0.025
	},
	{
		pos = Vector( 0, -100, 23 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.028
	}
}
GM.Cars:Register( Car )
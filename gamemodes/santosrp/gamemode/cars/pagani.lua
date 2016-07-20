
-----------------------------------------------------
--[[
	Name: Pagani
	For: SantosRP
	By:
]]--

local Car = {}
Car.VIP = true
Car.Make = "Pagani"
Car.Name = "Zonda C12"
Car.UID = "pagani_zonda"
Car.Desc = "The Pagani Zonda C12, gmod-able by TDM"
Car.Model = "models/tdmcars/zondac12.mdl"
Car.Script = "scripts/vehicles/TDMCars/c12.txt"
Car.Price = 995000
Car.FuellTank = 150
Car.FuelConsumption = 12.125
Car.Tier = 3
Car.LPlates = {
	{
		pos = Vector( 0, 109, 10 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.028
	},
	{
		pos = Vector( 0, -103, 18 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.030
	}
}
GM.Cars:Register( Car )
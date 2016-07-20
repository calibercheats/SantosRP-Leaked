
-----------------------------------------------------
--[[
	Name: cop_cars.lua
	For: SantosRP
	By: Ultra
]]--

local Car = {}
Car.Make = "Cadillac"
Car.Name = "2011 Cadillac CTS-V Coupe Undercover"
Car.UID = "cadcts_ss"
Car.Job = "JOB_SSERVICE"
Car.Desc = ""
Car.Model = "models/sentry/ctsv_uc.mdl"
Car.Script = "scripts/vehicles/TDMCars/cadillacctsund.txt"
Car.FuellTank = 120
Car.FuelConsumption = 20
GM.Cars:RegisterJobCar( Car )

local Car = {}
Car.Make = "Lincoln"
Car.Name = "2010 Lincoln Town Car Limo"
Car.UID = "limo_mayor"
Car.Job = "JOB_POLICE"
Car.Desc = ""
Car.Model = "models/sentry/static/lincolntclimo.mdl"
Car.Script = "scripts/vehicles/sentry/towncarlimo.txt"
Car.FuellTank = 70
Car.FuelConsumption = 9
GM.Cars:RegisterJobCar( Car )

local Car = {}
Car.Make = "Chevy"
Car.Name = "Chevy Tahoe UC"
Car.UID = "chevy_tahoe_uc_ss"
Car.Job = "JOB_SSERVICE"
Car.Desc = ""
Car.Model = "models/sentry/static/tahoe_uc.mdl"
Car.Script = "scripts/vehicles/sentry/tahoe.txt"
Car.FuellTank = 70
Car.FuelConsumption = 9
GM.Cars:RegisterJobCar( Car )

local Car = {}
Car.Make = "Chevy"
Car.Name = "Chevrolet Tahoe Secret Service"
Car.UID = "chevy_tahoe_uc_ss_cevrolet"
Car.Job = "JOB_SSERVICE"
Car.Desc = ""
Car.Model = "models/LoneWolfie/chev_tahoe_police.mdl"
Car.Script = "scripts/vehicles/LWCars/chev_tahoe.txt"
Car.FuellTank = 70
Car.FuelConsumption = 9
GM.Cars:RegisterJobCar( Car )

local Car = {}
Car.Make = "Chevrolet"
Car.Name = "Chevrolet Suburban Secret Service"
Car.UID = "chevrolet_suburban_ss_undercover"
Car.Job = "JOB_SSERVICE"
Car.Desc = ""
Car.Model = "models/LoneWolfie/chev_suburban_pol_und.mdl"
Car.Script = "scripts/vehicles/LWCars/chev_suburban.txt"
Car.FuellTank = 70
Car.FuelConsumption = 9
GM.Cars:RegisterJobCar( Car )
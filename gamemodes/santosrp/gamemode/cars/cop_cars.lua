
-----------------------------------------------------
--[[
	Name: cop_cars.lua
	For: SantosRP
	By: Ultra
]]--

local Car = {}
Car.Make = "Audi"
Car.Name = "S4 Police"
Car.UID = "s4_copaudi"
Car.Job = "JOB_POLICE"
Car.Desc = ""
Car.Model = "models/tdmcars/emergency/aud_s4_pred.mdl"
Car.Script = "scripts/vehicles/TDMCars/aud_s4pol.txt"
Car.FuellTank = 120
Car.FuelConsumption = 20
Car.LPlates = {
	{
		pos = Vector( 0, 106.5, 23.6 ),
		ang = Angle( 0, 180, 85 ),
		scale = 0.020
	},
	{
		pos = Vector( 0, -109.2, 38.8 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.02
	}
}
GM.Cars:RegisterJobCar( Car )

--[[local Car = {}
Car.Make = "Audi"
Car.Name = "Audi Q7"
Car.UID = "q7_audi"
Car.Job = "JOB_POLICE"
Car.Desc = ""
Car.Model = "models/tdmcars/audi_q7_polchi_pr.mdl"
Car.Script = "scripts/vehicles/TDMCars/q7.txt"
Car.FuellTank = 120
Car.FuelConsumption = 20
GM.Cars:RegisterJobCar( Car )]]--

local Car = {}
Car.Make = "Ford"
Car.Name = "Taurus"
Car.UID = "taurus_201_cop"
Car.Job = "JOB_POLICE"
Car.Desc = ""
Car.Model = "models/tdmcars/emergency/for_taurus_13.mdl"
Car.Script = "scripts/vehicles/TDMCars/for_taurus_13.txt"
Car.FuellTank = 120
Car.FuelConsumption = 20
Car.VehicleTable = "fortauruspoltdm"
Car.LPlates = {
	{
		pos = Vector( 0, -123.3, 26 ),
		ang = Angle( 0, 0, 86.5 ),
		scale = 0.026
	}
}
GM.Cars:RegisterJobCar( Car )

local Car = {}
Car.Make = "BMW"
Car.Name = "M4"
Car.UID = "bmw_m4_2013_cop"
Car.Job = "JOB_POLICE"
Car.Desc = ""
Car.Model = "models/sentry/m4_cop.mdl"
Car.Script = "scripts/vehicles/tdmcars/m4cop.txt"
Car.FuellTank = 120
Car.FuelConsumption = 20
Car.LPlates = {
	{
		pos = Vector( 0, 114.6, 17.7 ),
		ang = Angle( 0, 180, 95 ),
		scale = 0.025
	},
	{
		pos = Vector( 0, -107.4, 35 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.030
	}
}
GM.Cars:RegisterJobCar( Car )

local Car = {}
Car.Make = "Ford"
Car.Name = "F150 Police"
Car.UID = "ford_f150_police"
Car.Job = "JOB_POLICE"
Car.Desc = "A police suv"
Car.Model = "models/talonvehicles/tal_f150_pol.mdl"
Car.Script = "scripts/vehicles/tdmcars/tal_f150pol.txt"
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

local Car = {}
Car.Make = "Ford"
Car.Name = "Crown Victoria"
Car.UID = "ford_crown_victoria_cop"
Car.Job = "JOB_POLICE"
Car.Desc = ""
Car.Model = "models/tdmcars/emergency/for_crownvic.mdl"
Car.Script = "scripts/vehicles/TDMCars/for_crownvic.txt"
Car.FuellTank = 70
Car.FuelConsumption = 9
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
Car.Make = "Dodge"
Car.Name = "Charger SRT8 2012 Police"
Car.UID = "ford_charger_srt8_2012_cop"
Car.Job = "JOB_POLICE"
Car.Desc = ""
Car.Model = "models/tdmcars/emergency/dod_charger12.mdl"
Car.Script = "scripts/vehicles/TDMCars/chargerpolice.txt"
Car.FuellTank = 70
Car.FuelConsumption = 9
Car.LPlates = {
	{
		pos = Vector( 0, 121, 23 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.022
	},
	{
		pos = Vector( 0, -126, 31.5 ),
		ang = Angle( 0, 0, 85 ),
		scale = 0.022
	}
}
GM.Cars:RegisterJobCar( Car )

--[[local Car = {}
Car.Make = "Mitsubishi"
Car.Name = "Evo Mitsubishi Police"
Car.UID = "mitsubishi_evo_x_cop"
Car.Job = "JOB_POLICE"
Car.Desc = ""
Car.Model = "models/tdmcars/emergency/mitsu_evox.mdl"
Car.Script = "scripts/vehicles/TDMCars/mitsu_evoxpol.txt"
Car.FuellTank = 70
Car.FuelConsumption = 9
GM.Cars:RegisterJobCar( Car )]]--

local Car = {}
Car.Make = "Chevrolet"
Car.Name = "Suburban Police Cruiser"
Car.UID = "chevrolet_suburban_police_cruiser_cop"
Car.Job = "JOB_POLICE"
Car.Desc = ""
Car.Model = "models/LoneWolfie/chev_suburban_pol.mdl"
Car.Script = "scripts/vehicles/LWCars/chev_suburban_police.txt"
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

local Car = {}
Car.Make = "Chevrolet"
Car.Name = "Suburban Unmarked"
Car.UID = "chevrolet_suburban_unmarked_cop"
Car.Job = "JOB_POLICE"
Car.Desc = ""
Car.Model = "models/LoneWolfie/chev_suburban_pol_und.mdl"
Car.Script = "scripts/vehicles/LWCars/chev_suburban_police.txt"
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

--[[local Car = {}
Car.Make = "Jaguar"
Car.Name = "XFR Special Escort Group"
Car.UID = "jaguar_xfr_special_escort_group_cop"
Car.Job = "JOB_POLICE"
Car.Desc = ""
Car.Model = "models/LoneWolfie/jaguar_xfr_pol_und.mdl"
Car.Script = "scripts/vehicles/TDMCars/jag_xfr_pol.txt"
Car.FuellTank = 70
Car.FuelConsumption = 9
GM.Cars:RegisterJobCar( Car )]]--

local Car = {}
Car.Make = "Vandoorn"
Car.Name = "Swat Van"
Car.UID = "vandoorn_swat_van_cop"
Car.Job = "JOB_POLICE"
Car.Desc = ""
Car.Model = "models/sentry/swatvan.mdl"
Car.Script = "scripts/vehicles/sentry/vswat.txt"
Car.FuellTank = 70
Car.FuelConsumption = 9
Car.Health = 500
GM.Cars:RegisterJobCar( Car )

local Car = {}
Car.Make = "Dodge"
Car.Name = "Charger 2015 Pursuit"
Car.UID = "dodge_charger_pursuit"
Car.Job = "JOB_POLICE"
Car.Desc = ""
Car.Model = "models/LoneWolfie/dodge_charger_2015_police.mdl"
Car.Script = "scripts/vehicles/LWCars/dodge_charger_2015_police.txt"
Car.FuellTank = 70
Car.FuelConsumption = 9
Car.LPlates = {
	{
		pos = Vector( 0, -126.5, 29.7 ),
		ang = Angle( 0, 0, 84 ),
		scale = 0.029
	}
}
GM.Cars:RegisterJobCar( Car )

local Car = {}
Car.Make = "Dodge"
Car.Name = "Charger 2015 Undercover"
Car.UID = "dodge_charger_undercover"
Car.Job = "JOB_POLICE"
Car.Desc = ""
Car.Model = "models/LoneWolfie/dodge_charger_2015_undercover.mdl"
Car.Script = "scripts/vehicles/LWCars/dodge_charger_2015_police.txt"
Car.FuellTank = 70
Car.FuelConsumption = 9
Car.LPlates = {
	{
		pos = Vector( 0, -126.5, 29.7 ),
		ang = Angle( 0, 0, 84 ),
		scale = 0.029
	}
}
GM.Cars:RegisterJobCar( Car )

local Car = {}
Car.Make = "Dodge"
Car.Name = "Monaco Chief Standard"
Car.UID = "dodge_monaco_police"
Car.Job = "JOB_POLICE"
Car.Desc = ""
Car.Model = "models/LoneWolfie/dodge_monaco_police.mdl"
Car.Script = "scripts/vehicles/LWCars/dodge_monaco.txt"
Car.FuellTank = 70
Car.FuelConsumption = 9
Car.LPlates = {
	{
		pos = Vector( 34, 124, 18 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.025
	},
	{
		pos = Vector( 0, -133.5, 26.2 ),
		ang = Angle( 0, 0, 83 ),
		scale = 0.028
	}
}
GM.Cars:RegisterJobCar( Car )

local Car = {}
Car.Make = "Cadillac"
Car.Name = "CTS-V Undercover"
Car.UID = "cadcts_cop"
Car.Job = "JOB_POLICE"
Car.Desc = ""
Car.Model = "models/sentry/ctsv_uc.mdl"
Car.Script = "scripts/vehicles/TDMCars/ctsv_und.txt"
Car.FuellTank = 70
Car.FuelConsumption = 9
Car.LPlates = {
	{
		pos = Vector( 0, 99.9, 16.5 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.0
	},
	{
		pos = Vector( 0, -108.9, 42 ),
		ang = Angle( 0, 0, 73 ),
		scale = 0.025
	}
}
GM.Cars:RegisterJobCar( Car )

local Car = {}
Car.Make = "Chevrolet"
Car.Name = "Tahoe FBI"
Car.UID = "chevy_tahoe_uc"
Car.Job = "JOB_POLICE"
Car.Desc = ""
Car.Model = "models/LoneWolfie/chev_tahoe_police.mdl"
Car.Script = "scripts/vehicles/LWCars/chev_tahoe_police.txt"
Car.FuellTank = 70
Car.FuelConsumption = 9
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
GM.Cars:RegisterJobCar( Car )
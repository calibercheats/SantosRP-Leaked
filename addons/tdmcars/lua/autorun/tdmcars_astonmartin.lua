
-----------------------------------------------------
local PrVeh = "prop_vehicle_jeep"
local Cat = "TDM Cars"

local V = {
			Name = "Aston Martin DB5", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable Aston Martin DB5 by TheDanishMaster",
			Model = "models/tdmcars/ast_db5.mdl",
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/ast_db5.txt"
							}
			}
list.Set("Vehicles", "ast_db5tdm", V)


local V = {
			Name = "Aston Martin DBS", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable Aston Martin DBS by TheDanishMaster",
			Model = "models/tdmcars/dbs.mdl",
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/dbs.txt"
							}
			}
list.Set("Vehicles", "dbstdm", V)

local V = {
			Name = "Aston Martin V12 Vantage 2010", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable Aston Martin V12 Vantage by TheDanishMaster",
				Model = "models/tdmcars/aston_v12vantage.mdl",
							KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/v12vantage.txt"
							}
			}
list.Set("Vehicles", "v12vantagetdm", V)
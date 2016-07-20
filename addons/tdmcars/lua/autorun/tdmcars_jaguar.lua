
-----------------------------------------------------
local PrVeh = "prop_vehicle_jeep"
local Cat = "TDM Cars"

local V = {
			Name = "Jaguar E-Type", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster",
			Information = "A drivable Jaguar by TheDanishMaster",
				Model = "models/tdmcars/jag_etype.mdl",
							KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/jag_etype.txt"
							}
			}
list.Set("Vehicles", "jag_etypetdm", V)
local V = {
			Name = "Jaguar F-Type", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster",
			Information = "A drivable Jaguar by TheDanishMaster",
				Model = "models/tdmcars/jag_ftype.mdl",
							KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/jag_ftype.txt"
							}
			}
list.Set("Vehicles", "jag_ftypetdm", V)

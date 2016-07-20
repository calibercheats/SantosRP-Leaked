
-----------------------------------------------------
local PrVeh = "prop_vehicle_jeep"
local Cat = "TDM Cars"

local V = {
			Name = "Maserati Ghibli S", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable Maserati Ghibli S by TheDanishMaster",
				Model = "models/tdmcars/mas_ghibli.mdl",
							KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/mas_ghibli.txt"
							}
			}
list.Set("Vehicles", "mas_ghiblitdm", V)

local V = {
			Name = "Maserati Quattroporte Sport GT S", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable Maserati Quattroporte Sport GT S by TheDanishMaster",
				Model = "models/tdmcars/mas_quattroporte.mdl",
							KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/mas_quattroporte.txt"
							}
			}
list.Set("Vehicles", "mas_quattrotdm", V)

-----------------------------------------------------
local PrVeh = "prop_vehicle_jeep"
local Cat = "TDM Cars"

local V = {
			Name = "Cadillac Escalade 2012", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable Cadillac Escalade 2012 by TheDanishMaster",
			Model = "models/tdmcars/cad_escalade.mdl",
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/cad_escalade.txt"
							}
			}
list.Set("Vehicles", "cad_escaladetdm", V)

local V = {
			Name = "Cadillac LMP", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable Cadillac LMP by TheDanishMaster",
				Model = "models/tdmcars/cad_lmp.mdl",
							KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/cad_lmp.txt"
							}
			}
list.Set("Vehicles", "cad_lmptdm", V)
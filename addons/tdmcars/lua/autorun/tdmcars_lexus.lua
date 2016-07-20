
-----------------------------------------------------
local PrVeh = "prop_vehicle_jeep"
local Cat = "TDM Cars"

local V = {
			Name = "Lexus IS F", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable Lexus IS F by TheDanishMaster",
			Model = "models/tdmcars/lex_isf.mdl",	
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/lex_isf.txt"
							}
			}
list.Set("Vehicles", "lex_isftdm", V)

local V = {
			Name = "Lexus IS 300", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable Lexus IS 300 by TheDanishMaster",
			Model = "models/tdmcars/lex_is300.mdl",	
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/lex_is300.txt"
							}
			}
list.Set("Vehicles", "lex_is300tdm", V)

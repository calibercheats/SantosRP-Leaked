
-----------------------------------------------------
local Category = "PRED Cars"

local V = {
				// Required information
				Name =	"2010 Audi A7 Sportback",
				Class = "prop_vehicle_jeep",
				Category = Category,

				// Optional information
				Author = "SentryGunMan, Turn 10",
				Information = "vroom vroom",
				Model =	"models/sentry/a7.mdl",

				KeyValues = {				
								vehiclescript =	"scripts/vehicles/sentry/a7.txt"
					    }
}

list.Set( "Vehicles", "a7_sgm", V )
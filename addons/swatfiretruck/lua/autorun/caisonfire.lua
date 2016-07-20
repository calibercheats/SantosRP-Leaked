
-----------------------------------------------------
local Category = "SGM Cars"

local V = {
				// Required information
				Name =	"Ford C-Series Firetruck",
				Class = "prop_vehicle_jeep",
				Category = Category,

				// Optional information
				Author = "SentryGunMan, Criterion",
				Information = "vroom vroom",
				Model =	"models/sentry/caison_fire.mdl",

			
				KeyValues = {				
								vehiclescript =	"scripts/vehicles/sentry/cfire.txt"
					    }
}

list.Set( "Vehicles", "cfire", V )


-----------------------------------------------------
local Category = "SGM Cars"

local V = {
				// Required information
				Name =	"Vandoorn Swat Van",
				Class = "prop_vehicle_jeep",
				Category = Category,

				// Optional information
				Author = "SentryGunMan, Criterion",
				Information = "vroom vroom",
				Model =	"models/sentry/swatvan.mdl",

			
				KeyValues = {				
								vehiclescript =	"scripts/vehicles/sentry/vswat.txt"
					    }
}

list.Set( "Vehicles", "vswat", V )


-----------------------------------------------------
local Category = "SGM Cars"

local V = {
				// Required information
				Name =	"GTA V Flatbed",
				Class = "prop_vehicle_jeep",
				Category = Category,

				// Optional information
				Author = "SentryGunMan",
				Information = "vroom vroom",
				Model =	"models/sentry/flatbed.mdl",

				KeyValues = {				
								vehiclescript =	"scripts/vehicles/sentry/flatbed.txt"
					    }
}

list.Set( "Vehicles", "flatbed_sgm", V )
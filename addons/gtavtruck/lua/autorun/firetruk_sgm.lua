
-----------------------------------------------------
local Category = "SGM Cars"

local V = {
				// Required information
				Name =	"GTA V Firetruck",
				Class = "prop_vehicle_jeep",
				Category = Category,

				// Optional information
				Author = "SentryGunMan",
				Information = "vroom vroom",
				Model =	"models/sentry/firetruk_hi.mdl",

				KeyValues = {				
								vehiclescript =	"scripts/vehicles/sentry/firetruk_hi.txt"
					    }
}

list.Set( "Vehicles", "firetruk_sgm", V )
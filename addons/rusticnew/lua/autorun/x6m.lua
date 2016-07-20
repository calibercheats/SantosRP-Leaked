
-----------------------------------------------------
local Category = "SGM Cars"

local V = {
				// Required information
				Name =	"2010 BMW X6M",
				Class = "prop_vehicle_jeep",
				Category = Category,

				// Optional information
				Author = "SentryGunMan, Turn 10",
				Information = "vroom vroom",
				Model =	"models/sentry/x6m.mdl",

				KeyValues = {				
								vehiclescript =	"scripts/vehicles/sentry/x6m.txt"
					    }
}

list.Set( "Vehicles", "x6m", V )

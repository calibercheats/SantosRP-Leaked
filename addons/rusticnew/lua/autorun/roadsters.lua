
-----------------------------------------------------
local Category = "SGM Cars"

local V = {
				// Required information
				Name =	"2011 Nissan Leaf",
				Class = "prop_vehicle_jeep",
				Category = Category,

				// Optional information
				Author = "SentryGunMan, Turn 10",
				Information = "vroom vroom",
				Model =	"models/sentry/leaf.mdl",

			
				KeyValues = {				
								vehiclescript =	"scripts/vehicles/sentry/leaf.txt"
					    }
}

list.Set( "Vehicles", "leaf", V )

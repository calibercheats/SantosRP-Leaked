
-----------------------------------------------------
local Category = "SGM Cars"

local V = {
				// Required information
				Name =	"2013 BMW M4",
				Class = "prop_vehicle_jeep",
				Category = Category,

				// Optional information
				Author = "SentryGunMan",
				Information = "vroom vroom",
				Model =	"models/sentry/m4.mdl",
 
                                           

				KeyValues = {				
								vehiclescript =	"scripts/vehicles/tdmcars/m4.txt"
					    }
}

list.Set( "Vehicles", "m4_sgm", V )
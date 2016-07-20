
-----------------------------------------------------
local Category = "SGM Cars"

local V = {
				// Required information
				Name =	"2015 Audi RS7",
				Class = "prop_vehicle_jeep",
				Category = Category,

				// Optional information
				Author = "SentryGunMan",
				Information = "vroom vroom",
				Model =	"models/sentry/rs7.mdl",
 
                                           

				KeyValues = {				
								vehiclescript =	"scripts/vehicles/sentry/rs7.txt"
					    }
}

list.Set( "Vehicles", "rs7_sgm", V )
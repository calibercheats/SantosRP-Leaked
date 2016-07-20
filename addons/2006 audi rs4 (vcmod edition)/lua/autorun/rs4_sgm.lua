
-----------------------------------------------------
local Category = "VCMod"

local V = {
				// Required information
				Name =	"2006 Audi RS4 (VCMod Edition)",
				Class = "prop_vehicle_jeep",
				Category = Category,

				// Optional information
				Author = "SentryGunMan",
				Information = "vroom vroom",
				Model =	"models/sentry/rs4vc.mdl",
 
                                           

				KeyValues = {				
								vehiclescript =	"scripts/vehicles/sentry/rs4.txt"
					    }
}

list.Set( "Vehicles", "rs4_sgm", V )
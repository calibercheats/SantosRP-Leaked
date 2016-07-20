
-----------------------------------------------------
local Category = "SGM Cars"

local V = {
				// Required information
				Name =	"2010 Ford Taurus SHO",
				Class = "prop_vehicle_jeep",
				Category = Category,

				// Optional information
				Author = "SentryGunMan, Criterion, Ubisoft",
				Information = "vroom vroom",
				Model =	"models/sentry/taurussho.mdl",



				KeyValues = {				
								vehiclescript =	"scripts/vehicles/sentry/taurus.txt"
					    }
}
list.Set( "Vehicles", "taurussho", V )


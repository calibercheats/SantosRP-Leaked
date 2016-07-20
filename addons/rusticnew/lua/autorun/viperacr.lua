
-----------------------------------------------------
local Category = "SGM Cars"

local V = {
				// Required information
				Name =	"2008 Dodge Viper SRT10 ACR",
				Class = "prop_vehicle_jeep",
				Category = Category,

				// Optional information
				Author = "SentryGunMan, Turn 10, TheDanishMaster",
				Information = "vroom vroom",
				Model =	"models/sentry/viperacr.mdl",

			
				KeyValues = {				
								vehiclescript =	"scripts/vehicles/sentry/acr.txt"
					    }
}

list.Set( "Vehicles", "acr", V )

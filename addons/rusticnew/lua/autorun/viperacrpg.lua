
-----------------------------------------------------
local Category = "SGM Cars"

local V = {
				// Required information
				Name =	"2008 Dodge Viper SRT10 ACR Cop",
				Class = "prop_vehicle_jeep",
				Category = Category,

				// Optional information
				Author = "SentryGunMan, Turn 10, TheDanishMaster",
				Information = "vroom vroom",
				Model =	"models/sentry/viperacr_cop.mdl",

			
				KeyValues = {				
								vehiclescript =	"scripts/vehicles/sentry/acr.txt"
					    }
}

list.Set( "Vehicles", "acrcop", V )

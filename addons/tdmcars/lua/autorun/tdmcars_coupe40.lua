
-----------------------------------------------------
local V = {
			Name = "Ford Deluxe Coupe 1940", 
			Class = "prop_vehicle_jeep",
			Category = "TDM Cars",
			Author = "TheDanishMaster, freemmaann, Turn 10",
			Information = "A drivable Ford Deluxe Coupe 1940 by TheDanishMaster",
			Model = "models/tdmcars/ford_coupe_40.mdl",
			//Vehicle Controller
			VC_Lights = { //Pos can be a simple Vector() relative to the vehicle or an attachment name, else is self explanatory, can be an infinite amount of these.
						{Pos = Vector(-28.4, 98.3, 39.6), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.1, DynLight = true, NormalColor = "255 255 255"},
						{Pos = Vector(28.4, 98.3, 39.6), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.1, DynLight = true, NormalColor = "255 255 255"},
						{Pos = Vector(-32, -98.9, 33.5), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.5, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0"},
						{Pos = Vector(32, -98.9, 33.5), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.5, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0"},

						{Pos = Vector(-28.3, 91.2, 34.2), Size = 1, GlowSize = 1, HeadLightAngle = Angle(-5, 95, 0)},
						{Pos = Vector(28.3, 91.2, 34.2), Size = 1, GlowSize = 1, HeadLightAngle = Angle(-5, 85, 0)}
						},
			VC_Exhaust_Dissipate = true,
			VC_Exhaust = { //Exhaust effect, only active when engine is on, can be infinite amount.
						{Pos = Vector(21.6, -101.6, 14.3), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"}
						},
			VC_ExtraSeats = { //Can be an infinite amount of seats, Pos and ExitPos can be a simple Vector() or an attachment name, other options are self explanatory.
						{Pos = Vector(16, 18, 35), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(12, 0, 4), Hide = true, DoorSounds = true, RadioControl = false}
						},
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 100, Looping = false}, //Horn sound the car will use.
						
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/coupe40.txt"
							}
			}
list.Set("Vehicles", "coupe40tdm", V)
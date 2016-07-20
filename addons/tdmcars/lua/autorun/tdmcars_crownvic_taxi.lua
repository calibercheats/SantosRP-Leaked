
-----------------------------------------------------
local V = {
			Name = "Ford Crown Victoria Taxi", 
			Class = "prop_vehicle_jeep",
			Category = "TDM Cars",
			Author = "TheDanishMaster, freemmaann, Turn 10",
			Information = "A drivable Ford Crown Victoria Taxi by TheDanishMaster",
			Model = "models/tdmcars/crownvic_taxi.mdl",
			//Vehicle Controller
			VC_Lights = { //Pos can be a simple Vector() relative to the vehicle or an attachment name, else is self explanatory, can be an infinite amount of these.

						{Pos = Vector(-36.1, -111.1, 40), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.8, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0", BlinkersColor = "255 0 0"},
						{Pos = Vector(36.1, -111.1, 40), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.8, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0", BlinkersColor = "255 0 0"},
						{Pos = Vector(-9.4, -114.7, 37.8), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.6, DynLight = true, ReverseColor = "255 255 255"},
						{Pos = Vector(9.4, -114.7, 37.8), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.6, DynLight = true, ReverseColor = "255 255 255"},

						{Pos = Vector(-23.5, 123.8, 33.1), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.5, DynLight = true, NormalColor = "255 130 0", BlinkersColor = "255 130 0"},
						{Pos = Vector(23.5, 123.8, 33.1), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.5, DynLight = true, NormalColor = "255 130 0", BlinkersColor = "255 130 0"},
						{Pos = Vector(-41.6, 113.5, 33.3), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.6, DynLight = true, NormalColor = "255 130 0", BlinkersColor = "255 130 0"},
						{Pos = Vector(41.6, 113.5, 33.3), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.6, DynLight = true, NormalColor = "255 130 0", BlinkersColor = "255 130 0"},
						{Pos = Vector(-36.3, 120.7, 33.1), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.5, DynLight = true, NormalColor = "255 255 255"},
						{Pos = Vector(36.3, 120.7, 33.1), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.5, DynLight = true, NormalColor = "255 255 255"},

						{Pos = Vector(-29.6, 111.7, 33), Size = 1, GlowSize = 1, HeadLightAngle = Angle(-5, 95, 0)},
						{Pos = Vector(29.6, 111.7, 33), Size = 1, GlowSize = 1, HeadLightAngle = Angle(-5, 85, 0)}
						},
			VC_Exhaust_Dissipate = true,
			VC_Exhaust = { //Exhaust effect, only active when engine is on, can be infinite amount.
						{Pos = Vector(-35.3, -112.2, 14.2), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						{Pos = Vector(35.3, -112.2, 14.2), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"}
						},
			VC_ExtraSeats = { //Can be an infinite amount of seats, Pos and ExitPos can be a simple Vector() or an attachment name, other options are self explanatory.
						{Pos = Vector(20, 13, 24), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(12, 0, 4), Hide = true, DoorSounds = true, RadioControl = true},
						{Pos = Vector(-20, -27, 26), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(12, 0, 4), Hide = true, DoorSounds = true, RadioControl = false},
						{Pos = Vector(20, -27, 26), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(12, 0, 4), Hide = true, DoorSounds = true, RadioControl = false}
						},
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 100, Looping = false}, //Horn sound the car will use.
						
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/crownvic_taxi.txt"
							}
			}
list.Set("Vehicles", "crownvic_taxitdm", V)
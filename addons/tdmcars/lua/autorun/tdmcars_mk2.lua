
-----------------------------------------------------
local V = {
			Name = "Volkswagen Golf MKII", 
			Class = "prop_vehicle_jeep_old",
			Category = "TDM Cars",
			Author = "TheDanishMaster, Turn 10",
			Information = "The good old VW Golf MKII, gmod-able by TDM",
			Model = "models/tdmcars/golf_mk2.mdl",
			VC_Lights = { //Pos can be a simple Vector() relative to the vehicle or an attachment name, else is self explanatory, can be an infinite amount of these.
						{Pos = Vector(-34.8, -105.8, 42.5), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.95, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0"},
						{Pos = Vector(34.8, -105.8, 42.5), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.95, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0"},

						{Pos = Vector(-32.7, -105.4, 48.2), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.6, DynLight = true, ReverseColor = "255 255 255"},
						{Pos = Vector(32.7, -105.4, 48.2), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.6, DynLight = true, ReverseColor = "255 255 255"},

						{Pos = Vector(-29.9, 112.6, 24.3), Mat = "sprites/glow1.vmt", Alpha = 190, Size = 0.5, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(29.9, 112.6, 24.3), Mat = "sprites/glow1.vmt", Alpha = 190, Size = 0.5, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(-37.7, -104.8, 48.2), Mat = "sprites/glow1.vmt", Alpha = 190, Size = 0.6, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(37.7, -104.8, 48.2), Mat = "sprites/glow1.vmt", Alpha = 190, Size = 0.6, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(-44.6, 48.8, 35.2), Mat = "sprites/glow1.vmt", Alpha = 190, Size = 0.2, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(44.6, 48.8, 35.2), Mat = "sprites/glow1.vmt", Alpha = 190, Size = 0.2, DynLight = true, BlinkersColor = "255 130 0"},

						{Pos = Vector(-19.5, 108.9, 34.5), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.6, DynLight = true, NormalColor = "255 255 255"},
						{Pos = Vector(19.5, 108.9, 34.5), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.6, DynLight = true, NormalColor = "255 255 255"},
						{Pos = Vector(-31.1, 100.9, 33.6), Size = 1, GlowSize = 1, HeadLightAngle = Angle(5, 95, 0)},
						{Pos = Vector(31.1, 100.9, 33.6), Size = 1, GlowSize = 1, HeadLightAngle = Angle(5, 85, 0)}
						},
			VC_Exhaust_Dissipate = true,
			VC_Exhaust = { //Exhaust effect, only active when engine is on, can be infinite amount.
						{Pos = Vector(-26.5, -108.5, 14.9), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"}
						},
			VC_ExtraSeats = { //Can be an infinite amount of seats, Pos and ExitPos can be a simple Vector() or an attachment name, other options are self explanatory.
						{Pos = Vector(20, 1, 27), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(12, 0, 4), Hide = true, DoorSounds = true, RadioControl = true},
						{Pos = Vector(19, -43, 29), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(12, 0, 4), Hide = true, DoorSounds = true, RadioControl = false},
						{Pos = Vector(-19, -43, 29), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(12, 0, 4), Hide = true, DoorSounds = true, RadioControl = false}
						},
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 100, Looping = false}, //Horn sound the car will use.
						


			KeyValues = {
						vehiclescript	=	"scripts/vehicles/TDMCars/golfmk2.txt"
						}
			}
list.Set("Vehicles", "golfmk2tdm", V)

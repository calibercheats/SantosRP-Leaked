
-----------------------------------------------------
local V = {
			Name = "Kia Ceed", 
			Class = "prop_vehicle_jeep",
			Category = "TDM Cars",
			Author = "TheDanishMaster, freemmaann, Turn 10",
			Information = "A drivable Kia Ceed by TheDanishMaster",
			Model = "models/tdmcars/kia_ceed.mdl",
			//Vehicle Controller
			VC_Lights = { //Pos can be a simple Vector() relative to the vehicle or an attachment name, else is self explanatory, can be an infinite amount of these.
						{Pos = Vector(-31.5, -91.9, 40.2), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 1, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0"},
						{Pos = Vector(31.5, -91.9, 40.2), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 1, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0"},
						{Pos = Vector(-4, -78.2, 64.2), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.2, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0"},
						{Pos = Vector(4, -78.2, 64.2), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.2, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0"},
						{Pos = Vector(0, -78.2, 64.2), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.2, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0"},


						{Pos = Vector(-36.1, -87.1, 39.1), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.2, DynLight = true, ReverseColor = "255 255 255"},
						{Pos = Vector(36.1, -87.1, 39.1), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.2, DynLight = true, ReverseColor = "255 255 255"},
						
						{Pos = Vector(-28.5, 92.1, 29.6), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.6, DynLight = true, NormalColor = "255 255 255"},
						{Pos = Vector(28.5, 92.1, 29.6), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.6, DynLight = true, NormalColor = "255 255 255"},
						{Pos = Vector(-31.5, 94.6, 14.8), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.4, DynLight = true, NormalColor = "255 255 255"},
						{Pos = Vector(31.5, 94.6, 14.8), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.4, DynLight = true, NormalColor = "255 255 255"},
						{Pos = Vector(-37.4, 84, 33.2), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.3, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(37.4, 84, 33.2), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.3, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(-36.7, -86.3, 41.4), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.2, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(36.7, -86.3, 41.4), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.2, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(-42.5, 46.1, 35.3), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.15, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(42.5, 46.1, 35.3), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.15, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(-33.8, 81.7, 30.4), Size = 1, GlowSize = 1, HeadLightAngle = Angle(-5, 95, 0)},
						{Pos = Vector(33.8, 81.7, 30.4), Size = 1, GlowSize = 1, HeadLightAngle = Angle(-5, 85, 0)}
						},
			VC_Exhaust_Dissipate = true,
			VC_Exhaust = { //Exhaust effect, only active when engine is on, can be infinite amount.
						{Pos = Vector(20.3, -89.2, 8.9), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"}
						},
			VC_ExtraSeats = { //Can be an infinite amount of seats, Pos and ExitPos can be a simple Vector() or an attachment name, other options are self explanatory.
						{Pos = Vector(-16.5, 6, 26), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(12, 0, 4), Hide = true, DoorSounds = true, RadioControl = true},
						{Pos = Vector(15, -30, 27), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(12, 0, 4), Hide = true, DoorSounds = true, RadioControl = true},
						{Pos = Vector(-15, -30, 27), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(12, 0, 4), Hide = true, DoorSounds = true, RadioControl = true}
						},
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 100, Looping = false}, //Horn sound the car will use.
						
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/ceed.txt"
							}
			}
list.Set("Vehicles", "ceedtdm", V)
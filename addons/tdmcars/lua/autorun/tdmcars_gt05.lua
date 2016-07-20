
-----------------------------------------------------
local V = {
			Name = "Ford GT 05", 
			Class = "prop_vehicle_jeep",
			Category = "TDM Cars",
			Author = "TheDanishMaster, freemmaann, Turn 10",
			Information = "A drivable Ford GT 05 by TheDanishMaster",
			Model = "models/tdmcars/gt05.mdl",
			//Vehicle Controller
			VC_Lights = { //Pos can be a simple Vector() relative to the vehicle or an attachment name, else is self explanatory, can be an infinite amount of these.
						{Pos = Vector(-29.5, -103.6, 30.5), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 1, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0", BlinkersColor = "255 130 0"},
						{Pos = Vector(29.5, -103.6, 30.5), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 1, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0", BlinkersColor = "255 130 0"},

						{Pos = Vector(-35.2, 94.5, 29.5), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.5, DynLight = true, NormalColor = "255 234 0"},
						{Pos = Vector(35.2, 94.5, 29.5), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.5, DynLight = true, NormalColor = "255 234 0"},
						{Pos = Vector(-29.3, 107.1, 15.5), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.5, DynLight = true, NormalColor = "255 255 255"},
						{Pos = Vector(29.3, 107.1, 15.5), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.5, DynLight = true, NormalColor = "255 255 255"},

						{Pos = Vector(-29.5, -103.6, 30.5), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.4, DynLight = true, ReverseColor = "255 255 255"},
						{Pos = Vector(29.5, -103.6, 30.5), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.4, DynLight = true, ReverseColor = "255 255 255"},

						{Pos = Vector(-28.6, 108.9, 26.4), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.6, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(28.6, 108.9, 26.4), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.6, DynLight = true, BlinkersColor = "255 130 0"},

						{Pos = Vector(-30.1, 86.1, 29.3), Size = 1, GlowSize = 1, HeadLightAngle = Angle(-5, 95, 0)},
						{Pos = Vector(30.1, 86.1, 29.3), Size = 1, GlowSize = 1, HeadLightAngle = Angle(-5, 85, 0)}
						},
			VC_Exhaust_Dissipate = true,
			VC_Exhaust = { //Exhaust effect, only active when engine is on, can be infinite amount.
						{Pos = Vector(-4.8, -103.6, 19.1), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						{Pos = Vector(4.8, -103.6, 19.1), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"}
						},
			VC_ExtraSeats = { //Can be an infinite amount of seats, Pos and ExitPos can be a simple Vector() or an attachment name, other options are self explanatory.
						{Pos = Vector(19, 2, 17), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(12, 0, 4), Hide = true, DoorSounds = true, RadioControl = true}
						},
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 100, Looping = false}, //Horn sound the car will use.
						
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/gt05.txt"
							}
			}
list.Set("Vehicles", "gt05tdm", V)
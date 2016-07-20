
-----------------------------------------------------
local V = {
			Name = "Ford Transit", 
			Class = "prop_vehicle_jeep",
			Category = "TDM Cars",
			Author = "TheDanishMaster, freemmaann, Turn 10",
			Information = "A drivable Ford Transit by TheDanishMaster",
			Model = "models/tdmcars/ford_transit.mdl",
			//Vehicle Controller
			VC_Lights = { //Pos can be a simple Vector() relative to the vehicle or an attachment name, else is self explanatory, can be an infinite amount of these.
						{Pos = Vector(-42, -109.2, 40.2), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.5, DynLight = true, ReverseColor = "255 255 255"},
						{Pos = Vector(42, -109.2, 40.2), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.5, DynLight = true, ReverseColor = "255 255 255"},
						
						{Pos = Vector(-41.4, -109.2, 47.5), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.7, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0"},
						{Pos = Vector(41.4, -109.2, 47.5), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.7, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0"},
						{Pos = Vector(0, -109.7, 90.8), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.8, DynLight = false, NormalColor = "255 0 0", BrakeColor = "255 0 0"},
						{Pos = Vector(-42, -109.2, 37), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.55, DynLight = true, NormalColor = "255 0 0"},
						{Pos = Vector(42, -109.2, 37), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.55, DynLight = true, NormalColor = "255 0 0"},
						{Pos = Vector(-34.2, 111.1, 22), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.55, DynLight = true, NormalColor = "255 255 255"},
						{Pos = Vector(34.2, 111.1, 22), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.55, DynLight = true, NormalColor = "255 255 255"},
						
						{Pos = Vector(-41.8, -109.2, 43.6), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.5, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(41.8, -109.2, 43.6), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.5, DynLight = true, BlinkersColor = "255 130 0"},
						
						{Pos = Vector(-35.8, 102.6, 46.9), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.4, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(35.8, 102.6, 46.9), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.4, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(-46.3, 76.9, 52.5), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.15, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(46.3, 76.9, 52.5), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.15, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(-34.1, 92.9, 40.2), Size = 1, GlowSize = 1, HeadLightAngle = Angle(-5, 95, 0)},
						{Pos = Vector(34.1, 92.9, 40.2), Size = 1, GlowSize = 1, HeadLightAngle = Angle(-5, 85, 0)}
						},
			VC_Exhaust_Dissipate = true,
			VC_ExtraSeats = { //Can be an infinite amount of seats, Pos and ExitPos can be a simple Vector() or an attachment name, other options are self explanatory.
						{Pos = Vector(-19, 36, 46.6), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(12, 0, 4), Hide = true, DoorSounds = true, RadioControl = true}
						},
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 100, Looping = false}, //Horn sound the car will use.
						
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/transit.txt"
							}
			}
list.Set("Vehicles", "transittdm", V)

-----------------------------------------------------
local V = {
			Name = "Mazda 787B LeMans Team Mazdasport", 
			Class = "prop_vehicle_jeep",
			Category = "LW Cars",
			Author = "LoneWolfie",
			Information = "Driveable maz787b by LoneWolfie",
			Model = "models/LoneWolfie/mazda_787b.mdl",
								//Vehicle Controller
			VC_Lights = { //Pos can be a simple Vector() relative to the vehicle or an attachment name, else is self explanatory, can be an infinite amount of these.

						{Pos = Vector(-35.6, 96.8, 19.8), Mat = "sprites/glow1.vmt", Alpha = 200, Size = 0.4, DynLight = true, BlinkersColor = "130 40 0"},
						{Pos = Vector(35.6, 96.8, 19.8), Mat = "sprites/glow1.vmt", Alpha = 200, Size = 0.4, DynLight = true, BlinkersColor = "130 40 0"},
						{Pos = Vector(-40.6, 97.8, 13.8), Mat = "sprites/glow1.vmt", Alpha = 200, Size = 0.8, DynLight = true, NormalColor = "230 240 180"},
						{Pos = Vector(40.6, 97.8, 13.8), Mat = "sprites/glow1.vmt", Alpha = 200, Size = 0.8, DynLight = true, NormalColor = "230 240 180"},
						{Pos = Vector(-34.3, 101.5, 14), Mat = "sprites/glow1.vmt", Alpha = 210, Size = 0.7, DynLight = true, BlinkersColor = "130 40 0"},
						{Pos = Vector(34.3, 101.5, 14), Mat = "sprites/glow1.vmt", Alpha = 210, Size = 0.7, DynLight = true, BlinkersColor = "130 40 0"},
						
						{Pos = Vector(48.0, 47.8, 20.6), Mat = "sprites/glow1.vmt", Alpha = 210, Size = 0.5, DynLight = true, BlinkersColor = "130 40 0"},
						{Pos = Vector(-48.0, 47.8, 20.6), Mat = "sprites/glow1.vmt", Alpha = 210, Size = 0.5, DynLight = true, BlinkersColor = "130 40 0"},

						{Pos = Vector(9.1, -3.3, 46.3), Mat = "sprites/glow1.vmt", Alpha = 200, Size = 0.3, DynLight = true, NormalColor = "230 0 0"},
						
						{Pos = Vector(-17.8, -86.4, 20.4), Mat = "sprites/glow1.vmt", Alpha = 210, Size = 0.4, DynLight = true, BlinkersColor = "130 40 0"},
						{Pos = Vector(17.8, -86.4, 20.4), Mat = "sprites/glow1.vmt", Alpha = 210, Size = 0.4, DynLight = true, BlinkersColor = "130 40 0"},
						
						{Pos = Vector(-16.1, -86.4, 16.8), Mat = "sprites/glow1.vmt", Alpha = 210, Size = 0.5, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0"},
						{Pos = Vector(16.1, -86.4, 16.8), Mat = "sprites/glow1.vmt", Alpha = 210, Size = 0.5, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0"},
						{Pos = Vector(0, -86.4, 22.8), Mat = "sprites/glow1.vmt", Alpha = 210, Size = 0.5, DynLight = true, NormalColor = "255 0 0", ReverseColor = "255 0 0"},
						
						{Pos = Vector(-36.9, 96.8, 13.8), Size = 0.7, GlowSize = 0.7, HeadLightAngle = Angle(-5, 95, 0)},
						{Pos = Vector(36.9, 96.8, 13.8), Size = 0.7, GlowSize = 0.7, HeadLightAngle = Angle(-5, 85, 0)}
						},
			VC_Exhaust_Dissipate = true,
			VC_Exhaust = { //Exhaust effect, only active when engine is on, can be infinite amount.
						{Pos = Vector(48.4, -35.1, 6.6), Ang = Angle(0,90,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						},
			VC_ExtraSeats = { //Can be an infinite amount of seats, Pos and ExitPos can be a simple Vector() or an attachment name, other options are self explanatory.
					},
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 110, Looping = false}, //Horn sound the car will use.
			
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/mazda_787b.txt"
							}
			}
list.Set("Vehicles", "mazda787b", V)

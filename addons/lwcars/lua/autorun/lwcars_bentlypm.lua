
-----------------------------------------------------
local V = {
			Name = "Bentley Platinum Motorsports Continental GT", 
			Class = "prop_vehicle_jeep",
			Category = "LW Cars",
			Author = "LoneWolfie",
			Information = "Driveable Bentley Platinum Motorsports Continental GT by LoneWolfie",
			Model = "models/LoneWolfie/bently_pmcontinental.mdl",
																				//Vehicle Controller
			VC_Lights = { //Pos can be a simple Vector() relative to the vehicle or an attachment name, else is self explanatory, can be an infinite amount of these.

						{Pos = Vector(36.8,102, 38.6), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.6, DynLight = true, NormalColor = "245 245 255"},
						{Pos = Vector(-36.8,102, 38.6), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.6, DynLight = true, NormalColor = "245 245 255"},

						{Pos = Vector(-32.5, -107.9, 47.4), Mat = "sprites/glow1.vmt", Alpha = 225, Size = 0.37, DynLight = true, NormalColor = "255 0 0"},
						{Pos = Vector(-35.5, -105.9, 47.4), Mat = "sprites/glow1.vmt", Alpha = 225, Size = 0.27, DynLight = true, NormalColor = "255 0 0"},					
						{Pos = Vector(-29.5, -109.9, 47.4), Mat = "sprites/glow1.vmt", Alpha = 225, Size = 0.27, DynLight = true, NormalColor = "255 0 0"},
						
						{Pos = Vector(32.5, -107.9, 47.4), Mat = "sprites/glow1.vmt", Alpha = 225, Size = 0.37, DynLight = true, NormalColor = "255 0 0"},
						{Pos = Vector(35.5, -105.9, 47.4), Mat = "sprites/glow1.vmt", Alpha = 225, Size = 0.27, DynLight = true, NormalColor = "255 0 0"},					
						{Pos = Vector(29.5, -109.9, 47.4), Mat = "sprites/glow1.vmt", Alpha = 225, Size = 0.27, DynLight = true, NormalColor = "255 0 0"},
						
						{Pos = Vector(-32.5, -109.9, 43.4), Mat = "sprites/glow1.vmt", Alpha = 225, Size = 0.4, DynLight = true, BrakeColor = "255 0 0"},
						{Pos = Vector(-35.5, -107.9, 43.4), Mat = "sprites/glow1.vmt", Alpha = 225, Size = 0.3, DynLight = true, BrakeColor = "255 0 0"},					
						{Pos = Vector(-29.5, -111.9, 43.4), Mat = "sprites/glow1.vmt", Alpha = 225, Size = 0.3, DynLight = true, BrakeColor = "255 0 0"},
						
						{Pos = Vector(32.5, -109.9, 43.4), Mat = "sprites/glow1.vmt", Alpha = 225, Size = 0.4, DynLight = true, BrakeColor = "255 0 0"},
						{Pos = Vector(35.5, -107.9, 43.4), Mat = "sprites/glow1.vmt", Alpha = 225, Size = 0.3, DynLight = true, BrakeColor = "255 0 0"},					
						{Pos = Vector(29.5, -111.9, 43.4), Mat = "sprites/glow1.vmt", Alpha = 225, Size = 0.3, DynLight = true, BrakeColor = "255 0 0"},
						
						{Pos = Vector(31.1, -112.6, 39.9), Mat = "sprites/glow1.vmt", Alpha = 240, Size = 0.22, DynLight = true, BlinkersColor = "230 80 0"},
						{Pos = Vector(33.1, -111.6, 39.9), Mat = "sprites/glow1.vmt", Alpha = 240, Size = 0.22, DynLight = true, BlinkersColor = "230 80 0"},
						{Pos = Vector(35.1, -110.7, 39.9), Mat = "sprites/glow1.vmt", Alpha = 240, Size = 0.22, DynLight = true, BlinkersColor = "230 80 0"},
						{Pos = Vector(37.1, -109.5, 39.9), Mat = "sprites/glow1.vmt", Alpha = 240, Size = 0.22, DynLight = true, BlinkersColor = "230 80 0"},
						
						{Pos = Vector(-31.1, -112.6, 39.9), Mat = "sprites/glow1.vmt", Alpha = 240, Size = 0.22, DynLight = true, BlinkersColor = "230 80 0"},
						{Pos = Vector(-33.1, -111.6, 39.9), Mat = "sprites/glow1.vmt", Alpha = 240, Size = 0.22, DynLight = true, BlinkersColor = "230 80 0"},
						{Pos = Vector(-35.1, -110.7, 39.9), Mat = "sprites/glow1.vmt", Alpha = 240, Size = 0.22, DynLight = true, BlinkersColor = "230 80 0"},
						{Pos = Vector(-37.1, -109.5, 39.9), Mat = "sprites/glow1.vmt", Alpha = 240, Size = 0.22, DynLight = true, BlinkersColor = "230 80 0"},
						
						{Pos = Vector(-27.7, -113.4, 39.9), Mat = "sprites/glow1.vmt", Alpha = 210, Size = 0.24, DynLight = true, ReverseColor = "230 230 230"},
						{Pos = Vector(-26, -113.4, 39.9), Mat = "sprites/glow1.vmt", Alpha = 210, Size = 0.24, DynLight = true, ReverseColor = "230 230 230"},
						{Pos = Vector(27.7, -113.4, 39.9), Mat = "sprites/glow1.vmt", Alpha = 210, Size = 0.24, DynLight = true, ReverseColor = "230 230 230"},
						{Pos = Vector(26, -113.4, 39.9), Mat = "sprites/glow1.vmt", Alpha = 210, Size = 0.24, DynLight = true, ReverseColor = "230 230 230"},
						
						{Pos = Vector(26.8,99, 38), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(-5, 100, 0)},
						{Pos = Vector(-26.8,99, 38), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(-5, 80, 0)}
						},
			VC_Exhaust_Dissipate = true,
			VC_Exhaust = { //Exhaust effect, only active when engine is on, can be infinite amount.
						{Pos = Vector(31.3, -110.6, 22.5), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						{Pos = Vector(27, -111.6, 22.5), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						{Pos = Vector(-31.3, -110.6, 22.5), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						{Pos = Vector(-27, -111.6, 22.5), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						},
			VC_ExtraSeats = { //Can be an infinite amount of seats, Pos and ExitPos can be a simple Vector() or an attachment name, other options are self explanatory.
						{Pos = Vector(19.3, -5.1, 26.6), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
						{Pos = Vector(-19.3, -43.1, 26.6), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = false},
						{Pos = Vector(19.3, -43.1, 26.6), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = false},
	},
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 110, Looping = false}, //Horn sound the car will use.
			
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/bently_pmcontinental.txt"
							}
			}
list.Set("Vehicles", "bently_pmcontinental", V)

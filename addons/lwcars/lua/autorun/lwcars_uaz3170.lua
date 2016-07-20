
-----------------------------------------------------
local V = {
			Name = "UAZ 3170 Prototypes", 
			Class = "prop_vehicle_jeep",
			Category = "LW Russian Vehicles",
			Author = "LoneWolfie",
			Information = "Driveable UAZ 3170 Prototypes by LoneWolfie",
			Model = "models/LoneWolfie/uaz_3170.mdl",
			VC_Lights = { 			
				{Pos = Vector(-30.5, 117.3, 33.7), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, NormalColor = "245 245 245"},
				{Pos = Vector(30.5, 117.3, 33.7), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, NormalColor = "245 245 245"},
				
				{Pos = Vector(-30.1, 111.3, 43.2), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.5, DynLight = true, NormalColor = "245 245 245"},
				{Pos = Vector(30.1, 111.3, 43.2), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.5, DynLight = true, NormalColor = "245 245 245"},
				
				{Pos = Vector(-37.6, 111.3, 45.9), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.1, DynLight = true, NormalColor = "245 245 245"},
				{Pos = Vector(37.6, 111.3, 45.9), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.1, DynLight = true, NormalColor = "245 245 245"},
				
				{Pos = Vector(-37.6, 111.3, 42.3), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.25, DynLight = true, BlinkersColor = "200 80 0"},
				{Pos = Vector(37.6, 111.3, 42.3), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.25, DynLight = true, BlinkersColor = "200 80 0"},
				
				{Pos = Vector(-42, 103, 47.8), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.3, DynLight = true, BlinkersColor = "200 80 0"},
				{Pos = Vector(42, 103, 47.8), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.3, DynLight = true, BlinkersColor = "200 80 0"},
			
				{Pos = Vector(-42, -53.2, 47.8), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.3, DynLight = true, BlinkersColor = "200 80 0"},
				{Pos = Vector(42, -53.2, 47.8), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.3, DynLight = true, BlinkersColor = "200 80 0"},
				
				{Pos = Vector(-38.1, -60.7, 46.2), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.35, DynLight = true, BlinkersColor = "200 80 0"},
				{Pos = Vector(38.1, -60.7, 46.2), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.35, DynLight = true, BlinkersColor = "200 80 0"},
				
				{Pos = Vector(-38.1, -60.7, 44), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.3, DynLight = true, NormalColor = "255 0 0"},
				{Pos = Vector(38.1, -60.7, 44), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.3, DynLight = true, NormalColor = "255 0 0"},
				
				{Pos = Vector(-38.1, -60.7, 41.7), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.35, DynLight = true, BrakeColor = "255 0 0"},
				{Pos = Vector(38.1, -60.7, 41.7), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.35, DynLight = true, BrakeColor = "255 0 0"},
				
				{Pos = Vector(-38.1, -60.7, 37.61), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.35, DynLight = true, ReverseColor = "255 255 255"},
				{Pos = Vector(38.1, -60.7, 37.61), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.35, DynLight = true, ReverseColor = "255 255 255"},
				
				{Pos = Vector(-30.1, 111.3, 43.2), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(5, 100, 0)},
				{Pos = Vector(30.1, 111.3, 43.2), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(5, 80, 0)}				
						},
						
			VC_Exhaust_Dissipate = true,
			
			VC_Exhaust = { 
				{Pos = Vector(9.1, -64, 26.6), Ang = Angle(0,45,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						},
						
			VC_ExtraSeats = { 
				{Pos = Vector(21.4, 9, 33.5), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
				{Pos = Vector(-21.4, -18, 33.5), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
				{Pos = Vector(21.4, -18, 43.5), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
				{Pos = Vector(0, -18, 43.5), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
						
							
							},
							
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 90, Looping = false}, 
							
										
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/uaz_3170.txt"
							}
			}
list.Set("Vehicles", "uaz_3170", V)

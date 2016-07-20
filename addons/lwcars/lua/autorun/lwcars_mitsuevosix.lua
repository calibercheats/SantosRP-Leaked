
-----------------------------------------------------
local V = {
			Name = "Mitsubishi Lancer GSR Evolution VI", 
			Class = "prop_vehicle_jeep",
			Category = "LW Cars",
			Author = "LoneWolfie",
			Information = "Driveable Mitsubishi Lancer GSR Evolution VI Aileron by LoneWolfie",
			Model = "models/LoneWolfie/mitsu_evo_six.mdl",
			VC_Lights = { 			

				{Pos = Vector(23,98,34.25), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.7, DynLight = true, NormalColor = "255 230 167"},		
				{Pos = Vector(-23,98,34.25), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.7, DynLight = true, NormalColor = "255 230 167"},		

				{Pos = Vector(34.6,88,34.0), Mat = "sprites/blueflare1.vmt", Alpha = 215, Size = 0.5, DynLight = true, BlinkersColor = "230 80 0"},
				{Pos = Vector(-34.6,88,34.0), Mat = "sprites/blueflare1.vmt", Alpha = 215, Size = 0.5, DynLight = true, BlinkersColor = "230 80 0"},

				{Pos = Vector(42.6,46.9,38.1), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.25, DynLight = true, BlinkersColor = "230 80 0"},
				{Pos = Vector(-42.6,46.9,38.1), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.25, DynLight = true, BlinkersColor = "230 80 0"},

				{Pos = Vector(30.6,-100,48), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.45, DynLight = true, BlinkersColor = "230 80 0"},
				{Pos = Vector(32.6,-100,46), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.35, DynLight = true, BlinkersColor = "230 80 0"},
				
				{Pos = Vector(-30.6,-100,48), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.45, DynLight = true, BlinkersColor = "230 80 0"},
				{Pos = Vector(-32.6,-100,46), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.35, DynLight = true, BlinkersColor = "230 80 0"},
				
				{Pos = Vector(28.6,-102,46), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, ReverseColor = "245 245 245"},
				{Pos = Vector(-28.6,-102,46), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, ReverseColor = "245 245 245"},	
				
				{Pos = Vector(31.5,-101.5,42), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.65, DynLight = true, BrakeColor = "255 0 0"},
				{Pos = Vector(-31.5,-101.5,42), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.65, DynLight = true, BrakeColor = "255 0 0"},	
				
				{Pos = Vector(24.8,-102,40.5), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, NormalColor = "255 0 0"},		
				{Pos = Vector(-24.8,-102,40.5), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, NormalColor = "255 0 0"},
				
				{Pos = Vector(26.8,-102,43.5), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.35, DynLight = true, NormalColor = "255 0 0"},		
				{Pos = Vector(-26.8,-102,43.5), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.35, DynLight = true, NormalColor = "255 0 0"},
				
				{Pos = Vector(23,98,34.25), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(-5, 100, 0)},
				{Pos = Vector(-23,98,34.25), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(-5, 80, 0)}				
						},
						
			VC_Exhaust_Dissipate = true,
			
			VC_Exhaust = { 
				{Pos = Vector(-23.6,-105,18), Ang = Angle(0,45,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},

						},
						
			VC_ExtraSeats = { 
				{Pos = Vector(-17.2, -10, 22.2), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
				{Pos = Vector(17.2, -45, 22.2), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
				{Pos = Vector(-17.2, -45, 22.2), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
				{Pos = Vector(0, -45, 22.2), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
							
							
							},
							
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 110, Looping = false}, 
											
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/mitsu_evo_six.txt"
							}
			}
list.Set("Vehicles", "evo6", V)


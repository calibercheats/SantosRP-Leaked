
-----------------------------------------------------
local V = {
			Name = "UAZ 3907 Jaguar Amphicar", 
			Class = "prop_vehicle_jeep",
			Category = "LW Russian Vehicles",
			Author = "LoneWolfie",
			Information = "Driveable UAZ 3907 Jaguar by LoneWolfie",
			Model = "models/LoneWolfie/uaz_3907_jaguar.mdl",
			VC_Lights = { 			
				{Pos = Vector(-30.928, 108.638, 43.59), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.5, DynLight = true, NormalColor = "245 245 245"},
				{Pos = Vector(30.928, 108.638, 43.59), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.5, DynLight = true, NormalColor = "245 245 245"},

				{Pos = Vector(-41.232, 38.559, 68.251), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.5, DynLight = true, NormalColor = "245 245 245"},
				
				{Pos = Vector(-22.271, 109.175, 46.356), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, BlinkersColor = "200 80 0"},
				{Pos = Vector(22.271, 109.175, 46.356), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, BlinkersColor = "200 80 0"},
				
				{Pos = Vector(-31.708, -105.417, 47.055), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, BlinkersColor = "200 80 0"},
				{Pos = Vector(31.708, -105.417, 47.055), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, BlinkersColor = "200 80 0"},
			
				{Pos = Vector(28.89, -105.417, 47.055), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.3, DynLight = true, NormalColor = "255 0 0"},
				{Pos = Vector(-28.89, -105.417, 47.055), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.3, DynLight = true, NormalColor = "255 0 0"},
		
				{Pos = Vector(26.007, -105.417, 47.055), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, BrakeColor = "255 0 0"},
				{Pos = Vector(-26.007, -105.417, 47.055), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, BrakeColor = "255 0 0"},
				
				{Pos = Vector(-19.389,-105.417, 47.055), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, ReverseColor = "255 255 255"},
				{Pos = Vector(19.389,-105.417, 47.055), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, ReverseColor = "255 255 255"},
		
				{Pos = Vector(-41.232, 38.559, 68.251), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(5, 100, 0)},
				{Pos = Vector(-30.928, 108.638, 43.59), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(5, 80, 0)},		
				{Pos = Vector(30.928, 108.638, 43.59), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(5, 80, 0)}					
						},
						
						
			VC_ExtraSeats = { 
				{Pos = Vector(18.6, -11.4, 41), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
				{Pos = Vector(-23.6, -39, 49), Ang = Angle(0, 90, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
				{Pos = Vector(-23.6, -59, 49), Ang = Angle(0, 90, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
				{Pos = Vector(23.6, -39, 49), Ang = Angle(0, -90, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
				{Pos = Vector(23.6, -59, 49), Ang = Angle(0, -0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
							
							},
							
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 90, Looping = false}, 
							
													
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/uaz_jaguar.txt"
							}
			}
list.Set("Vehicles", "uaz_jag", V)


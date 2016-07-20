
-----------------------------------------------------
local V = {
			Name = "Jaguar XJ220", 
			Class = "prop_vehicle_jeep",
			Category = "LW Cars",
			Author = "LoneWolfie",
			Information = "Driveable xj220 by LoneWolfie",
			Model = "models/LoneWolfie/jaguar_xj220.mdl",
				VC_Lights = { 			


				{Pos = Vector(34.1, -119.8, 31.1), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.6, DynLight = true, BlinkersColor = "200 80 0"},
				{Pos = Vector(-34.1, -119.8, 31.1), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.6, DynLight = true, BlinkersColor = "200 80 0"},
				
				{Pos = Vector(-35.7, 117.9, 18.2), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.3, DynLight = true, BlinkersColor = "200 80 0"},
				{Pos = Vector(35.7, 117.9, 18.2), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.3, DynLight = true, BlinkersColor = "200 80 0"},
				{Pos = Vector(-32.3, 118.6, 18.2), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.3, DynLight = true, NormalColor = "255 255 255"},
				{Pos = Vector(32.3, 118.6, 18.2), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.3, DynLight = true, NormalColor = "255 255 255"},
						
				{Pos = Vector(37, -118, 26.7), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.6, DynLight = true, BrakeColor = "240 0 0"},
				{Pos = Vector(-37, -118, 26.7), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.6, DynLight = true, BrakeColor = "240 0 0"},

				{Pos = Vector(26, -119.7, 26.7), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.5, DynLight = true, NormalColor = "240 0 0"},
				{Pos = Vector(-26, -119.7, 26.7), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.5, DynLight = true, NormalColor = "240 0 0"},
				{Pos = Vector(-31.34, -119.7, 26.7), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.5, DynLight = true, NormalColor = "240 0 0"},
				{Pos = Vector(31.34, -119.7, 26.7), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.5, DynLight = true, NormalColor = "240 0 0"},
				
    			{Pos = Vector(27, -119.8, 31.1), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.6, DynLight = true, ReverseColor = "255 255 255"},
				{Pos = Vector(-27, -119.8, 31.1), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.6, DynLight = true, ReverseColor = "255 255 255"},

				{Pos = Vector(52.1, 36.8, 28.8), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.3, DynLight = true, BlinkersColor = "200 80 0"},
				{Pos = Vector(-52.1, 36.8, 28.8), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.3, DynLight = true, BlinkersColor = "200 80 0"},

				{Pos = Vector(40.4, 93.7, 29), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.7, DynLight = true, NormalColor = "245 231 187"},
				{Pos = Vector(-40.4, 93.7, 29), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.7, DynLight = true, NormalColor = "245 231 187"},
				{Pos = Vector(34.1, 93.8, 29.4), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.7, DynLight = true, NormalColor = "245 231 187"},
				{Pos = Vector(-34.1, 93.8, 29.4), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.7, DynLight = true, NormalColor = "245 231 187"},
				

	

				{Pos = Vector(-34.1, 93.8, 29.4), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(5, 100, 0)},
				{Pos = Vector(34.1, 93.8, 29.4), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(5, 80, 0)}				
						},
		
					
			VC_Exhaust_Dissipate = true,
			
			VC_Exhaust = { 
				{Pos = Vector(-26.28,-104.034, 13.868), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						},
						
			VC_ExtraSeats = { 
				{Pos = Vector(-17.6, 3, 16), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
				
							},
							
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 105, Looping = false}, 
							
										
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/jaguar_xj220.txt"
							}
			}
list.Set("Vehicles", "jaguar_xj220", V)

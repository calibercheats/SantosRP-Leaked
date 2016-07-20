
-----------------------------------------------------
local V = {
			Name = "Chevrolet Impala LS Taxi", 
			Class = "prop_vehicle_jeep",
			Category = "LW Cars",
			Author = "LoneWolfie",
			Information = "Driveable Chevrolet Impala LS by LoneWolfie",
				VC_Lights = { 			
				{Pos = Vector(30.675, -110.15, 45.703), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.65, DynLight = true, NormalColor = "200 0 0", BrakeColor = "255 0 0"},
				{Pos = Vector(-30.675, -110.15, 45.703), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.65, DynLight = true, NormalColor = "200 0 0", BrakeColor = "255 0 0"},
	
				{Pos = Vector(35.479, -108.903, 43.293), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.35, DynLight = true, BlinkersColor = "200 0 0"},
				{Pos = Vector(-35.479, -108.903, 43.293), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.35, DynLight = true, BlinkersColor = "200 0 0"},
				
				{Pos = Vector(31.325, -114.28, 39.83), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.45, DynLight = true, ReverseColor = "200 200 200"},
				{Pos = Vector(-31.325, -114.28, 39.83), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.45, DynLight = true, ReverseColor = "200 200 200"},
			
    			{Pos = Vector(-11.9, -108.9, 22.5), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.35, DynLight = true, ReverseColor = "255 255 255"},
				{Pos = Vector(11.9, -108.9, 22.5), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.35, DynLight = true, ReverseColor = "255 255 255"},

				{Pos = Vector(0, -113.898, 51.214), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.20, DynLight = true, BrakeColor = "255 0 0"},
				{Pos = Vector(-2.6, -113.898, 51.214), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.20, DynLight = true, BrakeColor = "255 0 0"},	
				{Pos = Vector(2.6, -113.898, 51.214), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.20, DynLight = true, BrakeColor = "255 0 0"},
				
				{Pos = Vector(33.485, 100.581, 32.561), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.7, DynLight = true, NormalColor = "220 220 220"},
				{Pos = Vector(-33.485, 100.581, 32.561), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.7, DynLight = true, NormalColor = "220 220 220"},
				
				{Pos = Vector(25.03, 109.106, 30.101), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.25, DynLight = true, BlinkersColor = "180 80 0"},
				{Pos = Vector(-25.03, 109.106, 30.101), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.25, DynLight = true, BlinkersColor = "180 80 0"},
				
				{Pos = Vector(27.841,104.357, 31.53), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(5, 100, 0)},
				{Pos = Vector(-27.841,104.357, 31.53), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(5, 80, 0)}				
						},
		
					
			VC_Exhaust_Dissipate = true,
			
			VC_Exhaust = { 
				{Pos = Vector(22.273,-114.752, 16.225), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
				{Pos = Vector(-22.273,-114.752, 16.225), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},

						},
						
			VC_ExtraSeats = { 
				{Pos = Vector(18.1, -2.8, 26.3), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
				{Pos = Vector(18.1, -45.8, 32.3), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
				{Pos = Vector(-18.1, -45.8, 32.3), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
				{Pos = Vector(0, -45.8, 32.3), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
					
							},
							
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 90, Looping = false}, 
							
				Model = "models/LoneWolfie/chev_impala_09_taxi.mdl",
								
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/chev_impala_09.txt"
							}
			}
list.Set("Vehicles", "chev_impala_09_taxi", V)

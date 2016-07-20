
-----------------------------------------------------
local V = {
			Name = "UAZ 452", 
			Class = "prop_vehicle_jeep",
			Category = "LW Russian Vehicles",
			Author = "LoneWolfie",
			Information = "Driveable UAZ 452 by LoneWolfie",
			Model = "models/LoneWolfie/uaz_452.mdl",
			VC_Lights = { 			
				{Pos = Vector(-26.615, 97.135, 53.077), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, NormalColor = "245 245 245"},
				{Pos = Vector(26.615, 97.135, 53.077), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, NormalColor = "245 245 245"},
				
				{Pos = Vector(-32.341, 96.936, 44.33), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.25, DynLight = true, BlinkersColor = "200 80 0"},
				{Pos = Vector(32.341, 96.936, 44.33), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.25, DynLight = true, BlinkersColor = "200 80 0"},
				
				{Pos = Vector(-38.295, -99.107, 54.519), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.35, DynLight = true, BlinkersColor = "200 80 0"},
				{Pos = Vector(38.295, -99.107, 54.519), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.35, DynLight = true, BlinkersColor = "200 80 0"},
			
				{Pos = Vector(38.295, -99.107, 51.516), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.3, DynLight = true, NormalColor = "255 0 0"},
				{Pos = Vector(-38.295, -99.107, 51.516), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.3, DynLight = true, NormalColor = "255 0 0"},
		
				{Pos = Vector(38.295, -99.107, 48.296), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.35, DynLight = true, BrakeColor = "255 0 0"},
				{Pos = Vector(-38.295, -99.107, 48.296), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.35, DynLight = true, BrakeColor = "255 0 0"},
				
				{Pos = Vector(-18.718,-99.107, 54.717), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.35, DynLight = true, ReverseColor = "255 255 255"},
	
				{Pos = Vector(-26.615, 97.135, 53.077), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(5, 100, 0)},
				{Pos = Vector(26.615, 97.135, 53.077), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(5, 80, 0)}				
						},
						
			VC_Exhaust_Dissipate = true,
			
			VC_Exhaust = { 
				{Pos = Vector(12.306, -98.661, 27.825), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						},
						
			VC_ExtraSeats = { 
				{Pos = Vector(24.4, 41, 50.4), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
					
							},
							
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 90, Looping = false}, 
							
																
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/uaz_452.txt"
							}
			}
list.Set("Vehicles", "uaz_452", V)

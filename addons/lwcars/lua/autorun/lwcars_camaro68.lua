
-----------------------------------------------------
local V = {
			Name = "Chevrolet Camaro SS 68", 
			Class = "prop_vehicle_jeep",
			Category = "LW Cars",
			Author = "LoneWolfie",
			Information = "Driveable fucking muscle car from muricaland LoneWolfie",
			Model = "models/LoneWolfie/chev_camaro_68.mdl",
				VC_Lights = { 			
				{Pos = Vector(28.2, 105, 30.5), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.75, DynLight = true, NormalColor = "245 231 187"},
				{Pos = Vector(-28.2, 105, 30.5), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.75, DynLight = true, NormalColor = "245 231 187"},

				{Pos = Vector(27.2, 104.4, 17.9), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, NormalColor = "245 231 187"},
				{Pos = Vector(-27.2, 104.4, 17.9), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, NormalColor = "245 231 187"},

				{Pos = Vector(39.1, 90.4, 23.5), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, BlinkersColor = "200 80 0"},
				{Pos = Vector(-39.1, 90.4, 23.5), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, BlinkersColor = "200 80 0"},

				{Pos = Vector(40.2, -94.6, 26.8), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, BlinkersColor = "200 80 0"},
				{Pos = Vector(-40.2, -94.6, 26.8), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, BlinkersColor = "200 80 0"},

				{Pos = Vector(28.7, -107.1, 31.2), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.7, DynLight = true, BlinkersColor = "255 0 0", NormalColor = "255 0 0"},
				{Pos = Vector(-28.7, -107.1, 31.2), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.7, DynLight = true, BlinkersColor = "255 0 0", NormalColor = "255 0 0"},

				{Pos = Vector(19.1, -107.1, 31.2), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.7, DynLight = true, BrakeColor = "255 0 0", NormalColor = "255 0 0"},
				{Pos = Vector(-19.1, -107.1, 31.2), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.7, DynLight = true, BrakeColor = "255 0 0", NormalColor = "255 0 0"},

				{Pos = Vector(23.9, -106.4, 20.4), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, ReverseColor = "200 200 200"},
				{Pos = Vector(-23.9, -106.4, 20.4), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, ReverseColor = "200 200 200"},
				
				{Pos = Vector(-28.2, 105, 30.5), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(5, 100, 0)},
				{Pos = Vector(28.2, 105, 30.5), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(5, 80, 0)}				
						},
		
					
			VC_Exhaust_Dissipate = true,
			
			VC_Exhaust = { 
				{Pos = Vector(32.8, -86.8, 12.3), Ang = Angle(0,0,0), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
				{Pos = Vector(-32.8, -86.8, 12.3), Ang = Angle(0,0,0), EffectIdle = "Exhaust", EffectStress = "Exhaust"},

						},
						
			VC_ExtraSeats = { 
				{Pos = Vector(17.8, -12.8, 22.6), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
				{Pos = Vector(17.8, -43.8, 23.6), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
				{Pos = Vector(-17.8, -43.8, 23.6), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
				{Pos = Vector(0, -43.8, 23.6), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
					
							},
							
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 90, Looping = false}, 
							
										
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/chev_camaro_68.txt"
							}
			}
list.Set("Vehicles", "chev_camaro_68", V)

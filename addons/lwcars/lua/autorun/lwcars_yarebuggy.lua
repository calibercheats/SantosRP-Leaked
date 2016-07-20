
-----------------------------------------------------
local V = {
			Name = "Y.A.R.E Buggy", 
			Class = "prop_vehicle_jeep",
			Category = "LW Cars",
			Author = "LoneWolfie",
			Information = "Driveable buggy by LoneWolfie",
			Model = "models/LoneWolfie/yare_buggy.mdl",
				VC_Lights = { 			
				{Pos = Vector(7.325, 88.403, 33.522), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.7, DynLight = true, NormalColor = "255 232 171"},
				{Pos = Vector(-7.325, 88.403, 33.522), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.7, DynLight = true, NormalColor = "255 232 171"},

				{Pos = Vector(2.478, 87.565, 35.923), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.5, DynLight = true, NormalColor = "255 232 171"},
				{Pos = Vector(-2.478, 87.565, 35.923), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.5, DynLight = true, NormalColor = "255 232 171"},	
				
				{Pos = Vector(11.211, 10.888, 64.251), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.65, DynLight = true, NormalColor = "255 232 171"},
				{Pos = Vector(-11.211, 10.888, 64.251), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.65, DynLight = true, NormalColor = "255 232 171"},

				{Pos = Vector(4.277, 10.888, 66.358), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.65, DynLight = true, NormalColor = "255 232 171"},
				{Pos = Vector(-4.277, 10.888, 66.358), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.65, DynLight = true, NormalColor = "255 232 171"},
				
				{Pos = Vector(-7.325, 88.403, 33.522), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(5, 100, 0)},
				{Pos = Vector(7.325, 88.403, 33.522), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(5, 80, 0)}				
						},
		
					
			VC_Exhaust_Dissipate = true,
			
			VC_Exhaust = { 
				{Pos = Vector(4.01,-89.143, 36.881), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
				{Pos = Vector(4.01,-89.143, 36.881), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
				{Pos = Vector(-4.01,-89.143, 36.881), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
				{Pos = Vector(-4.01,-89.143, 36.881), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						},
						
			VC_ExtraSeats = { 
				{Pos = Vector(14, -18.6, 25.3), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
				
							},
							
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 90, Looping = false}, 
							
						
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/yare_buggy.txt"
							}
			}
list.Set("Vehicles", "yare_buggy", V)

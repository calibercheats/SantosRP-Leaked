
-----------------------------------------------------
local V = {
			Name = "Lamborghini Countach LP5000 QV", 
			Class = "prop_vehicle_jeep",
			Category = "LW Cars",
			Author = "LoneWolfie",
			Information = "Driveable Lamborghini Countach LP5000 QV by LoneWolfie",
			Model = "models/LoneWolfie/lam_countach.mdl",																				
			VC_Lights = { 			
				{Pos = Vector(15,103, 18), Mat = "sprites/blueflare1.vmt", Alpha = 215, Size = 0.45, DynLight = true, NormalColor = "255 231 167"},
				{Pos = Vector(19.4,103, 18), Mat = "sprites/blueflare1.vmt", Alpha = 215, Size = 0.45, DynLight = true, NormalColor = "255 231 167"},
				{Pos = Vector(-15,103, 18), Mat = "sprites/blueflare1.vmt", Alpha = 215, Size = 0.45, DynLight = true, NormalColor = "255 231 167"},
				{Pos = Vector(-19.4,103, 18), Mat = "sprites/blueflare1.vmt", Alpha = 215, Size = 0.45, DynLight = true, NormalColor = "255 231 167"},
						
				{Pos = Vector(33.9, 90.6, 26), Mat = "sprites/glow1.vmt", Alpha = 210, Size = 0.26, DynLight = true, BlinkersColor = "230 80 0"},
				{Pos = Vector(31.9, 90.6, 26), Mat = "sprites/glow1.vmt", Alpha = 210, Size = 0.26, DynLight = true, BlinkersColor = "230 80 0"},
				{Pos = Vector(35.9, 90.6, 26), Mat = "sprites/glow1.vmt", Alpha = 210, Size = 0.26, DynLight = true, BlinkersColor = "230 80 0"},
				
				{Pos = Vector(-33.9, 90.6, 26), Mat = "sprites/glow1.vmt", Alpha = 210, Size = 0.26, DynLight = true, BlinkersColor = "230 80 0"},
				{Pos = Vector(-31.9, 90.6, 26), Mat = "sprites/glow1.vmt", Alpha = 210, Size = 0.26, DynLight = true, BlinkersColor = "230 80 0"},
				{Pos = Vector(-35.9, 90.6, 26), Mat = "sprites/glow1.vmt", Alpha = 210, Size = 0.26, DynLight = true, BlinkersColor = "230 80 0"},
				
				{Pos = Vector(43.7, 82.9, 26), Mat = "sprites/glow1.vmt", Alpha = 230, Size = 0.17, DynLight = true, BlinkersColor = "230 80 0"},
				{Pos = Vector(-43.7, 82.9, 26), Mat = "sprites/glow1.vmt", Alpha = 230, Size = 0.17, DynLight = true, BlinkersColor = "230 80 0"},
				
				{Pos = Vector(-30.8,-104.4, 36.7), Mat = "sprites/glow1.vmt", Alpha = 240, Size = 0.54, DynLight = true, BrakeColor = "245 0 0"},
				{Pos = Vector(30.8,-104.4, 36.7), Mat = "sprites/glow1.vmt", Alpha = 240, Size = 0.54, DynLight = true, BrakeColor = "255 0 0"},
				
				{Pos = Vector(-24,-104.4, 36.7), Mat = "sprites/glow1.vmt", Alpha = 240, Size = 0.54, DynLight = true, ReverseColor = "245 245 245"},
				{Pos = Vector(24,-104.4, 36.7), Mat = "sprites/glow1.vmt", Alpha = 240, Size = 0.54, DynLight = true, ReverseColor = "245 245 245"},
				
				{Pos = Vector(-37.6,-104.4, 36.7), Mat = "sprites/glow1.vmt", Alpha = 240, Size = 0.54, DynLight = true, BlinkersColor = "230 80 0"},
				{Pos = Vector(37.6,-104.4, 36.7), Mat = "sprites/glow1.vmt", Alpha = 240, Size = 0.54, DynLight = true, BlinkersColor = "230 80 0"},
				
				{Pos = Vector(29.6,-104.4, 33.2), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.22, DynLight = true, NormalColor = "245 0 0"},
				{Pos = Vector(32,-104.4, 33.2), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.22, DynLight = true, NormalColor = "255 0 0"},
				
				{Pos = Vector(-29.6,-104.4, 33.2), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.22, DynLight = true, NormalColor = "245 0 0"},
				{Pos = Vector(-32,-104.4, 33.2), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.22, DynLight = true, NormalColor = "255 0 0"},
				
				{Pos = Vector(-17.2,-101.5, 28.3), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.5, DynLight = true, NormalColor = "255 0 0"},
				
						},
						
			VC_Exhaust_Dissipate = true,
			
			VC_Exhaust = { 
				{Pos = Vector(-17.2, -104.3, 19.8), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
				{Pos = Vector(-13.5, -104.3, 19.8), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
				{Pos = Vector(17.2, -104.3, 19.8), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
				{Pos = Vector(13.5, -104.3, 19.8), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						},
						
			VC_ExtraSeats = { 
				{Pos = Vector(17.8, -3, 16.2), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
							},
							
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 110, Looping = false}, 
					
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/lam_countach.txt"
						}
			}
list.Set("Vehicles", "lam_countach", V)

-----------------------------------------------------
local V = {
			Name = "Smart ForTwo", 
			Class = "prop_vehicle_jeep",
			Category = "LW Cars",
			Author = "LoneWolfie",
			Information = "Driveable Smart ForTwo by LoneWolfie",
			Model = "models/LoneWolfie/smart_fortwo.mdl",
			VC_Lights = { 			
				{Pos = Vector(19.76,58.904,38.097), Mat = "sprites/blueflare1.vmt", Alpha = 225, Size = 0.45, DynLight = true, NormalColor = "240 240 255"},
				{Pos = Vector(-19.76,58.904,38.097), Mat = "sprites/blueflare1.vmt", Alpha = 225, Size = 0.45, DynLight = true, NormalColor = "240 240 255"},

				{Pos = Vector(30.571,56.394,39.397), Mat = "sprites/blueflare1.vmt", Alpha = 225, Size = 0.2, DynLight = true, BlinkersColor = "240 80 0"},
				{Pos = Vector(-30.571,56.394,39.397), Mat = "sprites/blueflare1.vmt", Alpha = 225, Size = 0.2, DynLight = true, BlinkersColor = "240 80 0"},
				
				{Pos = Vector(30.168,52.184,42.746), Mat = "sprites/blueflare1.vmt", Alpha = 225, Size = 0.27, DynLight = true, BlinkersColor = "240 80 0"},
				{Pos = Vector(-30.168,52.184,42.746), Mat = "sprites/blueflare1.vmt", Alpha = 225, Size = 0.27, DynLight = true, BlinkersColor = "240 80 0"},
				
				{Pos = Vector(32.093,-61.269,42.869), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.35, DynLight = true, ReverseColor = "250 250 250"},
				{Pos = Vector(-32.093,-61.269,42.869), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.35, DynLight = true, ReverseColor = "250 250 250"},

				{Pos = Vector(32.093,-61.269,42.869), Mat = "sprites/blueflare1.vmt", Alpha = 215, Size = 0.50, DynLight = true, BrakeColor = "250 0 0", BlinkersColor = "250 10 0"},
				{Pos = Vector(-32.093,-61.269,42.869), Mat = "sprites/blueflare1.vmt", Alpha = 215, Size = 0.50, DynLight = true, BrakeColor = "250 0 0", BlinkersColor = "250 10 0"},
				
				{Pos = Vector(31.694,-59.761,50.257), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.50, DynLight = true, NormalColor = "250 0 0"},
				{Pos = Vector(-31.694,-59.761,50.257), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.50, DynLight = true, NormalColor = "250 0 0"},
				
				{Pos = Vector(0.7000, -54.1440, 74.4570), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.07, DynLight = true, BrakeColor = "250 0 0"},
				{Pos = Vector(-0.0000, -54.1440, 74.4570), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.07, DynLight = true, BrakeColor = "250 0 0"},
				{Pos = Vector(2.1000, -54.1440, 74.4570), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.07, DynLight = true, BrakeColor = "250 0 0"},
				{Pos = Vector(4.2000, -54.1440, 74.4570), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.07, DynLight = true, BrakeColor = "250 0 0"},
				{Pos = Vector(3.5000, -54.1440, 74.4570), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.07, DynLight = true, BrakeColor = "250 0 0"},
				{Pos = Vector(5.6000, -54.1440, 74.4570), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.07, DynLight = true, BrakeColor = "250 0 0"},
				{Pos = Vector(4.9000, -54.1440, 74.4570), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.07, DynLight = true, BrakeColor = "250 0 0"},
				{Pos = Vector(1.4000, -54.1440, 74.4570), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.07, DynLight = true, BrakeColor = "250 0 0"},
				{Pos = Vector(2.8000, -54.1440, 74.4570), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.07, DynLight = true, BrakeColor = "250 0 0"},
				{Pos = Vector(6.3000, -54.1440, 74.4570), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.07, DynLight = true, BrakeColor = "250 0 0"},
				{Pos = Vector(-0.7000, -54.1440, 74.4570), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.07, DynLight = true, BrakeColor = "250 0 0"},
				{Pos = Vector(-2.1000, -54.1440, 74.4570), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.07, DynLight = true, BrakeColor = "250 0 0"},
				{Pos = Vector(-4.2000, -54.1440, 74.4570), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.07, DynLight = true, BrakeColor = "250 0 0"},
				{Pos = Vector(-3.5000, -54.1440, 74.4570), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.07, DynLight = true, BrakeColor = "250 0 0"},
				{Pos = Vector(-5.6000, -54.1440, 74.4570), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.07, DynLight = true, BrakeColor = "250 0 0"},
				{Pos = Vector(-4.9000, -54.1440, 74.4570), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.07, DynLight = true, BrakeColor = "250 0 0"},
				{Pos = Vector(-1.4000, -54.1440, 74.4570), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.07, DynLight = true, BrakeColor = "250 0 0"},
				{Pos = Vector(-2.8000, -54.1440, 74.4570), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.07, DynLight = true, BrakeColor = "250 0 0"},
				{Pos = Vector(-6.3000, -54.1440, 74.4570), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.07, DynLight = true, BrakeColor = "250 0 0"},				

				
				{Pos = Vector(26.55,56.266,39.621), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(-5, 100, 0)},
				{Pos = Vector(-26.55,56.266,39.621), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(-5, 80, 0)}				
						},
						
			VC_Exhaust_Dissipate = true,
			
			VC_Exhaust = { 
				{Pos = Vector(2.03,-67.261,14.738), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
				{Pos = Vector(-2.03,-67.261,14.738), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						},
						
			VC_ExtraSeats = { 
				{Pos = Vector(14.7, -15.8, 26.6), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},						
							},
							
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 110, Looping = false}, 
										
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/smart_fortwo.txt"
							}
			}
list.Set("Vehicles", "smartfortwo", V)

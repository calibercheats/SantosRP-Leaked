
-----------------------------------------------------
local V = {
			Name = "UAZ 31519", 
			Class = "prop_vehicle_jeep",
			Category = "LW Russian Vehicles",
			Author = "LoneWolfie",
			Information = "UAZ 31519 by LoneWolfie",
			Model = "models/LoneWolfie/uaz_31519.mdl",
			VC_Lights = { 			
				{Pos = Vector(-25.905,88.655, 53.979), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.6, DynLight = true, NormalColor = "245 245 245"},
				{Pos = Vector(25.905,88.655, 53.979), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.6, DynLight = true, NormalColor = "245 245 245"},
				
				{Pos = Vector(-29.361, 89.309, 44.586), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.35, DynLight = true, BlinkersColor = "200 80 0"},
				{Pos = Vector(29.361, 89.309, 44.586), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.35, DynLight = true, BlinkersColor = "200 80 0"},
				
				{Pos = Vector(-38.325, 42.103, 59.086), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.3, DynLight = true, BlinkersColor = "200 80 0"},
				{Pos = Vector(38.325, 42.103, 59.086), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.3, DynLight = true, BlinkersColor = "200 80 0"},
	
				{Pos = Vector(-32.142, -81.981, 50.589), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, BlinkersColor = "200 80 0"},
				{Pos = Vector(32.142, -81.981, 50.589), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, BlinkersColor = "200 80 0"},
				
				{Pos = Vector(-32.142, -81.981, 47.42), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, NormalColor = "255 0 0"},
				{Pos = Vector(32.142, -81.981, 47.42), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, NormalColor = "255 0 0"},
				
				{Pos = Vector(-32.142, -81.981, 44.48), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, BrakeColor = "255 0 0", ReverseColor = "255 0 0"},
				{Pos = Vector(32.142, -81.981, 44.48), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, BrakeColor = "255 0 0", ReverseColor = "255 0 0"},
				
				{Pos = Vector(-25.905,88.655, 53.979), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(5, 100, 0)},
				{Pos = Vector(25.905,88.655, 53.979), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(5, 80, 0)}				
						},
						
			VC_Exhaust_Dissipate = true,
			
			VC_Exhaust = { 
				{Pos = Vector(14.459, -84.114, 28.486), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						},
						
			VC_ExtraSeats = { 
				{Pos = Vector(21.7, -5.6, 47.8), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
				{Pos = Vector(21.7, -40.6, 52.8), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
				{Pos = Vector(-21.7, -40.6, 52.8), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
				{Pos = Vector(0, -40.6, 52.8), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
				{Pos = Vector(-27.7, -64.6, 46.8), Ang = Angle(0, -90, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
				{Pos = Vector(27.7, -64.6, 46.8), Ang = Angle(0, 90, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
							
							
							},
							
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 90, Looping = false}, 
							
										
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/uaz_31519.txt"
							}
			}
list.Set("Vehicles", "uaz_31519", V)


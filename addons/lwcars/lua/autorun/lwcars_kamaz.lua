
-----------------------------------------------------
local V = {
			Name = "Kamaz 43101", 
			Class = "prop_vehicle_jeep",
			Category = "LW Russian Vehicles",
			Author = "LoneWolfie",
			Information = "Driveable MAfewf by LoneWolfie",
			Model = "models/LoneWolfie/kamaz.mdl",
			VC_Lights = { 			
				{Pos = Vector(45.412, -164.225,56.277), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.35, DynLight = true, BlinkersColor = "255 0 0"},
				{Pos = Vector(-46.412, -164.225,56.277), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.35, DynLight = true, BlinkersColor = "255 0 0"},
				
				{Pos = Vector(37.263, -164.225,56.277), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.35, DynLight = true, NormalColor = "255 0 0"},
				{Pos = Vector(-38.263, -164.225,56.277), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.35, DynLight = true, NormalColor = "255 0 0"},
				
				{Pos = Vector(41.481, -164.225,56.277), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.35, DynLight = true, BrakeColor = "255 0 0"},					
				{Pos = Vector(-42.481, -164.225,56.277), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.35, DynLight = true, BrakeColor = "255 0 0"},					
	
				{Pos = Vector(-33.401, -164.225,56.277), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.5, DynLight = true, ReverseColor = "255 255 255"},					
		
				{Pos = Vector(-38.952, 157.362,61.408), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.6, DynLight = true, NormalColor = "255 240 195"},
				{Pos = Vector(38.952, 157.362,61.408), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.6, DynLight = true, NormalColor = "255 240 195"},

				{Pos = Vector(-42.488, 172.525,45.199), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, BlinkersColor = "230 80 0"},
				{Pos = Vector(42.488, 172.525,45.199), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, BlinkersColor = "230 80 0"},

				{Pos = Vector(-53.034, 151.643,74.982), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.2, DynLight = true, BlinkersColor = "230 80 0"},
				{Pos = Vector(52.034, 151.643,74.982), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.2, DynLight = true, BlinkersColor = "230 80 0"},

				{Pos = Vector(-0.528, 135.727,125.309), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.3, DynLight = true, NormalColor = "230 80 0"},
				{Pos = Vector(-8.637, 135.727,125.309), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.3, DynLight = true, NormalColor = "230 80 0"},
				{Pos = Vector(8.02, 135.727,125.309), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.3, DynLight = true, NormalColor = "230 80 0"}				
				
						},
						

						
			VC_ExtraSeats = { 
				{Pos = Vector(29, 109.1, 74.2), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
				{Pos = Vector(2, 109.1, 74.2), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
						
							},
							
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 100, Looping = false}, 
										
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/kamaz.txt"
							}
			}
list.Set("Vehicles", "kamaz", V)

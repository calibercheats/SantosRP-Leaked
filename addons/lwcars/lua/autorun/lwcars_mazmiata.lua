
-----------------------------------------------------
local V = {
			Name = "Mazda MX-5 Miata Series I", 
			Class = "prop_vehicle_jeep",
			Category = "LW Cars",
			Author = "LoneWolfie",
			Information = "Driveable Mazda MX-5 Miata Series I by LoneWolfie",
			Model = "models/LoneWolfie/maz_miata_94.mdl",
			VC_Lights = { 			
				{Pos = Vector(36.8, 83.2, 21.2), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, BlinkersColor = "230 80 0"},
				{Pos = Vector(-36.8, 83.2, 21.2), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, BlinkersColor = "230 80 0"},
				
				{Pos = Vector(20.881, -92.876, 33.598), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, ReverseColor = "255 255 255"},
				{Pos = Vector(-20.881, -92.876, 33.598), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, ReverseColor = "255 255 255"},
				
				{Pos = Vector(-20.881, -92.876, 33.598), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.55, DynLight = true, BrakeColor = "255 0 0", NormalColor = "255 0 0"},					
				{Pos = Vector(20.881, -92.876, 33.598), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.55, DynLight = true, BrakeColor = "255 0 0", NormalColor = "255 0 0"},					

				{Pos = Vector(30.356, -89.317, 33.598), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.6, DynLight = true, BlinkersColor = "230 80 0"},					
				{Pos = Vector(-30.356, -89.317, 33.598), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.6, DynLight = true, BlinkersColor = "230 80 0"},					

				{Pos = Vector(0, -93.801, 39.43), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.15, DynLight = true, BrakeColor = "255 0 0"},					
				{Pos = Vector(1.5, -93.801, 39.43), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.15, DynLight = true, BrakeColor = "255 0 0"},					
				{Pos = Vector(3, -93.801, 39.43), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.15, DynLight = true, BrakeColor = "255 0 0"},					
				{Pos = Vector(-1.5, -93.801, 39.43), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.15, DynLight = true, BrakeColor = "255 0 0"},					
				{Pos = Vector(-3, -93.801, 39.43), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.15, DynLight = true, BrakeColor = "255 0 0"},					

				{Pos = Vector(37.638, -78.609, 22.569), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, BlinkersColor = "230 80 0"},	
				{Pos = Vector(-37.638, -78.609, 22.569), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, BlinkersColor = "230 80 0"},	
				
						},
						
			VC_Exhaust_Dissipate = true,
			
			VC_Exhaust = { 
				{Pos = Vector(25.167,-91.591,13.439), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
				},
						
			VC_ExtraSeats = { 
				{Pos = Vector(17.5, -25.4, 13.5), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
						
							},
							
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 100, Looping = false}, 
															
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/maz_Miata.txt"
							}
			}
list.Set("Vehicles", "miata94", V)

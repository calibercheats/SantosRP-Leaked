
-----------------------------------------------------
local V = {
			Name = "Dodge Viper GTS ACR", 
			Class = "prop_vehicle_jeep",
			Category = "LW Cars",
			Author = "LoneWolfie",
			Information = "Driveable Dodge Viper GTS ACR by LoneWolfie",
			Model = "models/LoneWolfie/dodge_viper.mdl",
																							//Vehicle Controller
			VC_Lights = { //Pos can be a simple Vector() relative to the vehicle or an attachment name, else is self explanatory, can be an infinite amount of these.

						{Pos = Vector(25.6,-103, 43.2), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.35, DynLight = true, BrakeColor = "255 0 0"},
						{Pos = Vector(31.3,-102, 43.2), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.35, DynLight = true, BrakeColor = "255 0 0"},
						{Pos = Vector(28.9,-102, 43.2), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.4, DynLight = true, BrakeColor = "255 0 0"},

						{Pos = Vector(-25.6,-103, 43.2), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.35, DynLight = true, BrakeColor = "255 0 0"},
						{Pos = Vector(-31.3,-102, 43.2), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.35, DynLight = true, BrakeColor = "255 0 0"},
						{Pos = Vector(-28.9,-102, 43.2), Mat = "sprites/blueflare1.vmt", Alpha = 235, Size = 0.4, DynLight = true, BrakeColor = "255 0 0"},
						
						{Pos = Vector(24,-104.3, 41.1), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.15, DynLight = true, BlinkersColor = "255 0 0"},
						{Pos = Vector(25.5,-104, 41.1), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.15, DynLight = true, BlinkersColor = "255 0 0"},
						{Pos = Vector(27,-103.7, 41.1), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.15, DynLight = true, BlinkersColor = "255 0 0"},
						{Pos = Vector(28.5,-103.4, 41.1), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.15, DynLight = true, BlinkersColor = "255 0 0"},
						{Pos = Vector(30,-103, 41.1), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.15, DynLight = true, BlinkersColor = "255 0 0"},
						{Pos = Vector(31.5,-102.4, 41.1), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.15, DynLight = true, BlinkersColor = "255 0 0"},
						{Pos = Vector(33,-101.6, 41.1), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.15, DynLight = true, BlinkersColor = "255 0 0"},		

						{Pos = Vector(34.5,-100.5, 41.1), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.15, DynLight = true, BlinkersColor = "255 0 0", NormalColor = "255 0 0"},							
						{Pos = Vector(36,-99.3, 41.1), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.15, DynLight = true, BlinkersColor = "255 0 0", NormalColor = "255 0 0"},	
						{Pos = Vector(37.1,-98.3, 41), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.15, DynLight = true, BlinkersColor = "255 0 0", NormalColor = "255 0 0"},	
						{Pos = Vector(37.5,-97.2, 40.7), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.15, DynLight = true, BlinkersColor = "255 0 0", NormalColor = "255 0 0"},	
						{Pos = Vector(38.3,-95.8, 40.6), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.15, DynLight = true, BlinkersColor = "255 0 0", NormalColor = "255 0 0"},
						{Pos = Vector(37.3,-95.8, 42.6), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.2, DynLight = true, BlinkersColor = "255 0 0", NormalColor = "255 0 0"},		
				        {Pos = Vector(34.8,-98.5, 42.6), Mat = "sprites/blueflare1.vmt", Alpha = 200, Size = 0.27, DynLight = true, BlinkersColor = "255 0 0", NormalColor = "255 0 0"},	
						
						{Pos = Vector(-24,-104.3, 41.1), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.15, DynLight = true, BlinkersColor = "255 0 0"},
						{Pos = Vector(-25.5,-104, 41.1), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.15, DynLight = true, BlinkersColor = "255 0 0"},
						{Pos = Vector(-27,-103.7, 41.1), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.15, DynLight = true, BlinkersColor = "255 0 0"},
						{Pos = Vector(-28.5,-103.4, 41.1), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.15, DynLight = true, BlinkersColor = "255 0 0"},
						{Pos = Vector(-30,-103, 41.1), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.15, DynLight = true, BlinkersColor = "255 0 0"},
						{Pos = Vector(-31.5,-102.4, 41.1), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.15, DynLight = true, BlinkersColor = "255 0 0"},
						{Pos = Vector(-33,-101.6, 41.1), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.15, DynLight = true, BlinkersColor = "255 0 0"},		

						{Pos = Vector(-34.5,-100.5, 41.1), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.15, DynLight = true, BlinkersColor = "255 0 0", NormalColor = "255 0 0"},							
						{Pos = Vector(-36,-99.3, 41.1), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.15, DynLight = true, BlinkersColor = "255 0 0", NormalColor = "255 0 0"},	
						{Pos = Vector(-37.1,-98.3, 41), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.15, DynLight = true, BlinkersColor = "255 0 0", NormalColor = "255 0 0"},	
						{Pos = Vector(-37.5,-97.2, 40.7), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.15, DynLight = true, BlinkersColor = "255 0 0", NormalColor = "255 0 0"},	
						{Pos = Vector(-38.3,-95.8, 40.6), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.15, DynLight = true, BlinkersColor = "255 0 0", NormalColor = "255 0 0"},
						{Pos = Vector(-37.3,-95.8, 42.6), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.2, DynLight = true, BlinkersColor = "255 0 0", NormalColor = "255 0 0"},		
				        {Pos = Vector(-34.8,-98.5, 42.6), Mat = "sprites/blueflare1.vmt", Alpha = 200, Size = 0.27, DynLight = true, BlinkersColor = "255 0 0", NormalColor = "255 0 0"},

				        {Pos = Vector(24.5,-103.4, 38), Mat = "sprites/blueflare1.vmt", Alpha = 200, Size = 0.27, DynLight = true, ReverseColor = "230 230 230"},
				        {Pos = Vector(26.5,-103.4, 38), Mat = "sprites/blueflare1.vmt", Alpha = 200, Size = 0.27, DynLight = true, ReverseColor = "230 230 230"},

				        {Pos = Vector(-24.5,-103.4, 38), Mat = "sprites/blueflare1.vmt", Alpha = 200, Size = 0.27, DynLight = true, ReverseColor = "230 230 230"},
				        {Pos = Vector(-26.5,-103.4, 38), Mat = "sprites/blueflare1.vmt", Alpha = 200, Size = 0.27, DynLight = true, ReverseColor = "230 230 230"},	

				        {Pos = Vector(28.5,-102.6, 38), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.32, DynLight = true, BlinkersColor = "255 60 0"},
				        {Pos = Vector(31.5,-101.9, 38), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.32, DynLight = true, BlinkersColor = "255 60 0"},

				        {Pos = Vector(-28.5,-102.6, 38), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.32, DynLight = true, BlinkersColor = "255 60 0"},
				        {Pos = Vector(-31.5,-101.9, 38), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.32, DynLight = true, BlinkersColor = "255 60 0"},

						{Pos = Vector(0,-104.4, 51.5), Mat = "sprites/blueflare1.vmt", Alpha = 215, Size = 0.35, DynLight = true, BrakeColor = "255 0 0"},	

						{Pos = Vector(-30.0,93, 41.3), Mat = "sprites/blueflare1.vmt", Alpha = 230, Size = 0.4, DynLight = true, NormalColor = "230 230 255"},	
						{Pos = Vector(-37.0,89.2, 41.3), Mat = "sprites/blueflare1.vmt", Alpha = 230, Size = 0.45, DynLight = true, NormalColor = "230 230 255"},	
						
						{Pos = Vector(30.0,93, 41.3), Mat = "sprites/blueflare1.vmt", Alpha = 230, Size = 0.4, DynLight = true, NormalColor = "230 230 255"},	
						{Pos = Vector(37.0,89.2, 41.3), Mat = "sprites/blueflare1.vmt", Alpha = 230, Size = 0.45, DynLight = true, NormalColor = "230 230 255"},	
						
						{Pos = Vector(33.5,91.2,40.8), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.35, DynLight = true, BlinkersColor = "255 80 0"},	

						{Pos = Vector(-33.5,91.2,40.8), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.35, DynLight = true, BlinkersColor = "255 80 0"},	

						{Pos = Vector(43,88.9,32.7), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.3, DynLight = true, BlinkersColor = "255 80 0"},		

						{Pos = Vector(-43,88.9,32.7), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.3, DynLight = true, BlinkersColor = "255 80 0"},		

						{Pos = Vector(30.0,93, 41.3), Size = 0.3, GlowSize = 0.2, HeadLightAngle = Angle(-5, 100, 0)},
						{Pos = Vector(-30.0,93, 41.3), Size = 0.3, GlowSize = 0.2, HeadLightAngle = Angle(-5, 80, 0)}						
						
						},
			VC_Exhaust_Dissipate = true,
			VC_Exhaust = { //Exhaust effect, only active when engine is on, can be infinite amount.
						{Pos = Vector(3.4, -102, 22.2), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						{Pos = Vector(-3.4, -102, 22.2), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},

						},
			VC_ExtraSeats = { //Can be an infinite amount of seats, Pos and ExitPos can be a simple Vector() or an attachment name, other options are self explanatory.
						{Pos = Vector(21.1, -33.3, 25), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},

						},
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 110, Looping = false}, //Horn sound the car will use.
						
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/dod_viper.txt"
							}
			}
list.Set("Vehicles", "dodge_viper", V)

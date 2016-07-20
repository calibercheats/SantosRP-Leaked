
-----------------------------------------------------
local V = {
			Name = "Ford Country Squire", 
			Class = "prop_vehicle_jeep",
			Category = "LW Cars",
			Author = "LoneWolfie",
			Information = "Driveable Ford Country Squire by LoneWolfie",
			Model = "models/LoneWolfie/for_country_squire.mdl",
			//Vehicle Controller
			VC_Lights = { //Pos can be a simple Vector() relative to the vehicle or an attachment name, else is self explanatory, can be an infinite amount of these.

						{Pos = Vector(41.6,128.7, 30.8), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.6, DynLight = true, NormalColor = "255 231 167"},
						{Pos = Vector(-41.6,128.7, 30.8), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.6, DynLight = true, NormalColor = "255 231 167"},
						
						{Pos = Vector(33,128.7, 31.6), Mat = "sprites/blueflare1.vmt", Alpha = 220, Size = 0.45, DynLight = true, NormalColor = "255 231 167"},
						{Pos = Vector(-33,128.7, 31.6), Mat = "sprites/blueflare1.vmt", Alpha = 220, Size = 0.5, DynLight = true, NormalColor = "255 231 167"},
						
						{Pos = Vector(33,128.7, 38.5), Mat = "sprites/blueflare1.vmt", Alpha = 220, Size = 0.45, DynLight = true, BlinkersColor = "230 80 0"},
						{Pos = Vector(-33,128.7, 38.5), Mat = "sprites/blueflare1.vmt", Alpha = 220, Size = 0.5, DynLight = true, BlinkersColor = "230 80 0"},
						
						{Pos = Vector(-44.3,-130.8, 40.5), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.5, DynLight = true, BrakeColor = "255 0 0"},
						{Pos = Vector(44.3,-130.8, 40.5), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.5, DynLight = true, BrakeColor = "255 0 0"},
						
						{Pos = Vector(-44.3,-130.8, 32.4), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.5, DynLight = true, BlinkersColor = "255 0 0",NormalColor = "255 0 0"},
						{Pos = Vector(44.3,-130.8, 32.4), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.5, DynLight = true, BlinkersColor = "255 0 0", NormalColor = "255 0 0"},
						
						{Pos = Vector(-44.3,-130.8, 36.3), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.3, DynLight = true, ReverseColor = "235 235 235"},
						{Pos = Vector(44.3,-130.8, 36.3), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.3, DynLight = true, ReverseColor = "235 235 235"},
				
						{Pos = Vector(42.7,128.7, 39.8), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(-5, 90, 0)},
						{Pos = Vector(-42.7,128.7, 39.8), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(-5, 90, 0)}
						},
			VC_Exhaust_Dissipate = true,
			VC_Exhaust = { //Exhaust effect, only active when engine is on, can be infinite amount.
						{Pos = Vector(47.9, -114.8, 12.8), Ang = Angle(0,90,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						},
			VC_ExtraSeats = { //Can be an infinite amount of seats, Pos and ExitPos can be a simple Vector() or an attachment name, other options are self explanatory.
						{Pos = Vector(19.8, 1.7, 21.7), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
						{Pos = Vector(-19.8, -37.7, 21.7), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = false},
						{Pos = Vector(19.8, -37.7, 21.7), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = false},
						{Pos = Vector(0, -37.7, 21.7), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = false},
						{Pos = Vector(19.8, -87.7, 21.7), Ang = Angle(0,90, 8), EnterRange = 80, ExitAng = Angle(0,-90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = false},
						{Pos = Vector(-19.8, -87.7, 21.7), Ang = Angle(0,-90, 8), EnterRange = 80, ExitAng = Angle(0,-90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = false},
	
	
	
	
	
	},
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 110, Looping = false}, //Horn sound the car will use.
	
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/for_country_squire.txt"
							}
			}
list.Set("Vehicles", "fordcountry", V)

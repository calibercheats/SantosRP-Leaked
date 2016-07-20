
-----------------------------------------------------
local V = {
			Name = "MAZ-535", 
			Class = "prop_vehicle_jeep",
			Category = "LW Russian Vehicles",
			Author = "LoneWolfie",
			Information = "Driveable MA3-535 by LoneWolfie",
			Model = "models/LoneWolfie/maz.mdl",
			//Vehicle Controller
			VC_Lights = { //Pos can be a simple Vector() relative to the vehicle or an attachment name, else is self explanatory, can be an infinite amount of these.

						{Pos = Vector(39.681,196.11, 88.565), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.7, DynLight = true, NormalColor = "255 230 184"},
						{Pos = Vector(-39.681,196.11, 88.565), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.7, DynLight = true, NormalColor = "255 230 184"},
						
						{Pos = Vector(68.176,127.193, 87.414), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.3, DynLight = true, BlinkersColor = "235 80 0"},
						{Pos = Vector(-68.176,127.193, 87.414), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.3, DynLight = true, BlinkersColor = "235 80 0"},
						
						{Pos = Vector(41.165,-190.926, 64.341), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.3, DynLight = true, BlinkersColor = "235 80 0"},
						{Pos = Vector(-41.165,-190.926, 64.341), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.3, DynLight = true, BlinkersColor = "235 80 0"},
						
						{Pos = Vector(33.383,-191.869, 64.341), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.33, DynLight = true, BrakeColor = "255 0 0"},
						{Pos = Vector(-33.383,-191.869, 64.341), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.33, DynLight = true, BrakeColor = "255 0 0"},						
						

						{Pos = Vector(0.931,197.218, 88.565), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(5, 90, 0)},
						{Pos = Vector(-39.681,196.11, 88.565), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(5, 90, 0)},
						{Pos = Vector(39.681,196.11, 88.565), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(5, 90, 0)},
						{Pos = Vector(-4.796,175.368, 150.767), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(5, 90, 0)}
						},
			VC_Exhaust_Dissipate = true,
			VC_Exhaust = { //Exhaust effect, only active when engine is on, can be infinite amount.
						{Pos = Vector(57.048, 181.281, 141.081), Ang = Angle(0,0,0), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						{Pos = Vector(57.048, 181.281, 141.081), Ang = Angle(0,0,0), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						{Pos = Vector(66.568, 76.183, 79.948), Ang = Angle(0,90,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						{Pos = Vector(66.568, 76.183, 79.948), Ang = Angle(0,90,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						{Pos = Vector(66.568, 76.183, 79.948), Ang = Angle(0,90,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						{Pos = Vector(66.568, 76.183, 79.948), Ang = Angle(0,09,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						{Pos = Vector(-66.568, 76.183, 79.948), Ang = Angle(0,-90,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						{Pos = Vector(-66.568, 76.183, 79.948), Ang = Angle(0,-90,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						{Pos = Vector(-66.568, 76.183, 79.948), Ang = Angle(0,-90,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						{Pos = Vector(-66.568, 76.183, 79.948), Ang = Angle(0,-90,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						},
			VC_ExtraSeats = { //Can be an infinite amount of seats, Pos and ExitPos can be a simple Vector() or an attachment name, other options are self explanatory.
						{Pos = Vector(32.2, 134.2, 87.2), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
						{Pos = Vector(-7.2, 134.2, 87.2), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = false},
						{Pos = Vector(14.2, 134.2, 87.2), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = false},

	
	
	
	},
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 110, Looping = false}, //Horn sound the car will use.
	
										
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/maz.txt"
							}
			}
list.Set("Vehicles", "maz", V)

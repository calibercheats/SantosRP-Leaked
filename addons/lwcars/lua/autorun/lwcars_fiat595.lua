
-----------------------------------------------------
local V = {
			Name = "Fiat Abarth 595 SS", 
			Class = "prop_vehicle_jeep",
			Category = "LW Cars",
			Author = "LoneWolfie",
			Information = "Driveable Fiat Abarth 595 SS by LoneWolfie",
			Model = "models/LoneWolfie/fiat_595.mdl",
																							//Vehicle Controller
			VC_Lights = { //Pos can be a simple Vector() relative to the vehicle or an attachment name, else is self explanatory, can be an infinite amount of these.

						{Pos = Vector(-20.3,68.7, 29.2), Mat = "sprites/blueflare1.vmt", Alpha = 220, Size = 0.5, DynLight = true, NormalColor = "255 231 167"},
						{Pos = Vector(20.3,68.7, 29.2), Mat = "sprites/blueflare1.vmt", Alpha = 220, Size = 0.5, DynLight = true, NormalColor = "255 231 167"},

						{Pos = Vector(-23.3,69.5, 23.1), Mat = "sprites/blueflare1.vmt", Alpha = 230, Size = 0.35, DynLight = true, BlinkersColor = "230 80 0"},
						{Pos = Vector(23.3,69.5, 23.1), Mat = "sprites/blueflare1.vmt", Alpha = 230, Size = 0.35, DynLight = true, BlinkersColor = "230 80 0"},
						
						{Pos = Vector(-23.1,-64.3, 31), Mat = "sprites/blueflare1.vmt", Alpha = 230, Size = 0.35, DynLight = true, BlinkersColor = "230 80 0"},
						{Pos = Vector(23.1,-64.3, 31), Mat = "sprites/blueflare1.vmt", Alpha = 230, Size = 0.35, DynLight = true, BlinkersColor = "230 80 0"},

						{Pos = Vector(-23.1,-66.4, 27.8), Mat = "sprites/blueflare1.vmt", Alpha = 230, Size = 0.35, DynLight = true, NormalColor = "255 0 0"},
						{Pos = Vector(23.1,-66.4, 27.8), Mat = "sprites/blueflare1.vmt", Alpha = 230, Size = 0.35, DynLight = true, NormalColor = "255 0 0"},
						
						{Pos = Vector(-23.1,-68.5, 25.6), Mat = "sprites/blueflare1.vmt", Alpha = 230, Size = 0.35, DynLight = true, BrakeColor = "255 0 0"},
						{Pos = Vector(23.1,-68.5, 25.6), Mat = "sprites/blueflare1.vmt", Alpha = 230, Size = 0.35, DynLight = true, BrakeColor = "255 0 0"},
						
						{Pos = Vector(20.3,68.7, 29.2), Size = 0.2, GlowSize = 0.3, HeadLightAngle = Angle(-5, 100, 0)},
						{Pos = Vector(-20.3,68.7, 29.2), Size = 0.2, GlowSize = 0.3, HeadLightAngle = Angle(-5, 80, 0)}
						},
			VC_Exhaust_Dissipate = true,
			VC_Exhaust = { //Exhaust effect, only active when engine is on, can be infinite amount.
						{Pos = Vector(22.0, -70.7, 12.2), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						{Pos = Vector(18.6, -70.7, 12.2), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},

						},
			VC_ExtraSeats = { //Can be an infinite amount of seats, Pos and ExitPos can be a simple Vector() or an attachment name, other options are self explanatory.
						{Pos = Vector(-12.1, -6.4, 19.6), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
						{Pos = Vector(-12.1, -37, 19.6), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = false},
						{Pos = Vector(12.1, -37, 19.6), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = false},
	},
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 230, Looping = false}, //Horn sound the car will use.
		
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/fiat_595.txt"
							}
			}
list.Set("Vehicles", "fiat595", V)
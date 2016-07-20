
-----------------------------------------------------
local V = {
			Name = "Nissan Skyline 2000GT-R Mk.III", 
			Class = "prop_vehicle_jeep",
			Category = "LW Cars",
			Author = "LoneWolfie",
			Information = "Driveable Nissan Skyline 2000GT-R Mk.III by LoneWolfie",
			Model = "models/LoneWolfie/2000gtr_stock.mdl",
			//Vehicle Controller
			VC_Lights = { //Pos can be a simple Vector() relative to the vehicle or an attachment name, else is self explanatory, can be an infinite amount of these.

						{Pos = Vector(31.7,96.2, 32.2), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.6, DynLight = true, NormalColor = "245 245 255"},
						{Pos = Vector(-31.7,96.2, 32.2), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.6, DynLight = true, NormalColor = "245 245 255"},
						
						{Pos = Vector(38,87.5, 32.6), Mat = "sprites/blueflare1.vmt", Alpha = 250, Size = 0.35, DynLight = true, BlinkersColor = "230 80 0"},
						{Pos = Vector(-38,87.5, 32.6), Mat = "sprites/blueflare1.vmt", Alpha = 250, Size = 0.35, DynLight = true, BlinkersColor = "230 80 0"},
						
						{Pos = Vector(29.5,-115.6, 35.7), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.6, DynLight = true, BlinkersColor = "255 0 0 ", NormalColor = "255 0 0"},
						{Pos = Vector(-29.5,-115.6, 35.7), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.6, DynLight = true, BlinkersColor = "255 0 0 ", NormalColor = "255 0 0"},
						
						{Pos = Vector(21.8,-115.6, 35.7), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.6, DynLight = true, BrakeColor = "245 0 0", ReverseColor = "255 0 0"},
						{Pos = Vector(-21.8,-115.6, 35.7), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.6, DynLight = true, BrakeColor = "245 0 0", ReverseColor = "255 0 0"},
						
						{Pos = Vector(23.5,99, 32), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(0, 90, 0)},
						{Pos = Vector(-23.5,99, 32), Size = 0.3, GlowSize = 0.4, HeadLightAngle = Angle(0, 90, 0)}
						},
			VC_Exhaust_Dissipate = true,
			VC_Exhaust = { //Exhaust effect, only active when engine is on, can be infinite amount.
						{Pos = Vector(-18.4, -114, 16.1), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						{Pos = Vector(-15.9, -114, 16.1), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						},
			VC_ExtraSeats = { //Can be an infinite amount of seats, Pos and ExitPos can be a simple Vector() or an attachment name, other options are self explanatory.
						{Pos = Vector(-17.5, -23.2, 20.8), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
						{Pos = Vector(17.5, -49.2, 20.8), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = false},
						{Pos = Vector(-17.5, -49.2, 20.8), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = false},
	},
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 110, Looping = false}, //Horn sound the car will use.
						
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/2000gtr_stock.txt"
							}
			}
list.Set("Vehicles", "2000gtrstock", V)
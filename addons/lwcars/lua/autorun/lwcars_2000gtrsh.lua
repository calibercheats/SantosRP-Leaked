
-----------------------------------------------------
local V = {
			Name = "Nissan Skyline 2000GTR Speedhunters", 
			Class = "prop_vehicle_jeep",
			Category = "LW Cars",
			Author = "LoneWolfie",
			Information = "Driveable Nissan Skyline 2000GT-R C10 Speedhunters by LoneWolfie",
			Model = "models/LoneWolfie/2000gtr_speedhunters.mdl",
																							//Vehicle Controller
			VC_Lights = { //Pos can be a simple Vector() relative to the vehicle or an attachment name, else is self explanatory, can be an infinite amount of these.

						{Pos = Vector(32.3,95.3, 32.2), Mat = "sprites/blueflare1.vmt", Alpha = 230, Size = 0.6, DynLight = true, NormalColor = "245 245 255",BlinkersColor = "245 245 255"},
						{Pos = Vector(-32.3,95.3, 32.2), Mat = "sprites/blueflare1.vmt", Alpha = 230, Size = 0.6, DynLight = true, NormalColor = "245 245 255",BlinkersColor = "245 245 255"},

						{Pos = Vector(30.7,-115, 32.2), Mat = "sprites/blueflare1.vmt", Alpha = 230, Size = 0.6, DynLight = true, NormalColor = "235 0 0",BrakeColor = "235 0 0",BlinkersColor = "235 0 0"},
						{Pos = Vector(-30.7,-115, 32.2), Mat = "sprites/blueflare1.vmt", Alpha = 230, Size = 0.6, DynLight = true, NormalColor = "235 0 0",BrakeColor = "235 0 0",BlinkersColor = "235 0 0"},

						{Pos = Vector(22.7,-115, 32), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, ReverseColor = "255 255 255"},
						{Pos = Vector(-22.7,-115, 32), Mat = "sprites/blueflare1.vmt", Alpha = 245, Size = 0.4, DynLight = true, ReverseColor = "255 255 255"},		
						
						{Pos = Vector(24.8,95.3, 32.2), Size = 0.3, GlowSize = 0.3, HeadLightAngle = Angle(-5, 100, 0)},
						{Pos = Vector(-24.8,95.3, 32.2), Size = 0.3, GlowSize = 0.3, HeadLightAngle = Angle(-5, 80, 0)}
						},
			VC_Exhaust_Dissipate = true,
			VC_Exhaust = { //Exhaust effect, only active when engine is on, can be infinite amount.
						{Pos = Vector(-39.2, -31.8, 7.2), Ang = Angle(0,-45,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						{Pos = Vector(-39.2, -33.8, 7.2), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},

						},
			VC_ExtraSeats = { //Can be an infinite amount of seats, Pos and ExitPos can be a simple Vector() or an attachment name, other options are self explanatory.
						{Pos = Vector(17.7, -50.2, 20.6), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},
						{Pos = Vector(0, -50.2, 20.6), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = false},
						{Pos = Vector(-17.7, -50.2, 20.6), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = false},
	},
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 110, Looping = false}, //Horn sound the car will use.
			
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/2000gtr_speedhunters.txt"
							}
			}
list.Set("Vehicles", "2000gtr_sh", V)

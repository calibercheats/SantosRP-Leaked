
-----------------------------------------------------
local V = {
			Name = "BMW M5 E34", 
			Class = "prop_vehicle_jeep",
			Category = "TDM Cars",
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable BMW M5 E34 by TheDanishMaster",
			Model = "models/tdmcars/bmwm5e34.mdl",
			VC_Lights = { //Pos can be a simple Vector() relative to the vehicle or an attachment name, else is self explanatory, can be an infinite amount of these.
						{Pos = Vector(-36.32, -109.064, 40.764), Mat = "sprites/light_glow02.vmt", Alpha = 180, Size = 0.5, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0"},
						{Pos = Vector(-35.875, -109.064, 37.707), Mat = "sprites/light_glow02.vmt", Alpha = 180, Size = 0.5, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0"},
						{Pos = Vector(35.875, -109.064, 37.707), Mat = "sprites/light_glow02.vmt", Alpha = 180, Size = 0.5, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0"},
						{Pos = Vector(36.32, -109.064, 40.764), Mat = "sprites/light_glow02.vmt", Alpha = 180, Size = 0.5, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0"},
						{Pos = Vector(-24.232, -109.064, 37.779), Mat = "sprites/light_glow02.vmt", Alpha = 180, Size = 0.5, DynLight = true, NormalColor = "255 0 0"},
						{Pos = Vector(24.232, -109.064, 37.779), Mat = "sprites/light_glow02.vmt", Alpha = 180, Size = 0.5, DynLight = true, NormalColor = "255 0 0"},
						{Pos = Vector(-24.535, -109.146, 40.719), Mat = "sprites/light_glow02.vmt", Alpha = 180, Size = 0.4, DynLight = true, ReverseColor = "255 255 255"},
						{Pos = Vector(24.535, -109.146, 40.719), Mat = "sprites/light_glow02.vmt", Alpha = 180, Size = 0.4, DynLight = true, ReverseColor = "255 255 255"},
						{Pos = Vector(-34.24, 104.784, 31.75), Mat = "sprites/light_glow02.vmt", Alpha = 200, Size = 0.5, DynLight = true, BlinkersColor = "255 130 0"},						
						{Pos = Vector(34.24, 104.784, 31.75), Mat = "sprites/light_glow02.vmt", Alpha = 200, Size = 0.5, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(-33.955, -108.948, 44.076), Mat = "sprites/light_glow02.vmt", Alpha = 200, Size = 0.6, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(33.955, -108.948, 44.076), Mat = "sprites/light_glow02.vmt", Alpha = 200, Size = 0.6, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(-42.264, 52.586, 28.693), Mat = "sprites/light_glow02.vmt", Alpha = 200, Size = 0.3, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(42.264, 52.586, 28.693), Mat = "sprites/light_glow02.vmt", Alpha = 200, Size = 0.3, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(-28.0, 105.456, 16.235), Mat = "sprites/light_glow02.vmt", Alpha = 180, Size = 0.6, DynLight = true, NormalColor = "230 230 130"},
						{Pos = Vector(28.0, 105.456, 16.235), Mat = "sprites/light_glow02.vmt", Alpha = 180, Size = 0.6, DynLight = true, NormalColor = "230 230 130"},
						{Pos = Vector(-20.0, 107.679, 31.598), Mat = "sprites/light_glow02.vmt", Alpha = 180, Size = 0.8, DynLight = true, NormalColor = "230 240 180"},
						{Pos = Vector(20.0, 107.679, 31.598), Mat = "sprites/light_glow02.vmt", Alpha = 180, Size = 0.8, DynLight = true, NormalColor = "230 240 180"},
						{Pos = Vector(-28.526, 100, 31.75), Size = 1, GlowSize = 1, HeadLightAngle = Angle(-5, 95, 0)},
						{Pos = Vector(28.526, 100, 31.75), Size = 1, GlowSize = 1, HeadLightAngle = Angle(-5, 85, 0)}
						},
			VC_Exhaust_Dissipate = true,
			VC_Exhaust = { //Exhaust effect, only active when engine is on, can be infinite amount.
						{Pos = Vector(-30.6, -111.752, 17.782), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						{Pos = Vector(-26.713, -111.752, 17.782), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"}
						},
			VC_ExtraSeats = { //Can be an infinite amount of seats, Pos and ExitPos can be a simple Vector() or an attachment name, other options are self explanatory.
						{Pos = Vector(18.301, 1.9, 25.15), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(12, 0, 4), Hide = true, DoorSounds = true, RadioControl = true},
						{Pos = Vector(17.81, -35, 30.2), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(12, 0, 4), Hide = true, DoorSounds = true, RadioControl = false},
						{Pos = Vector(-17.81, -35, 30.2), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(12, 0, 4), Hide = true, DoorSounds = true, RadioControl = false},
						{Pos = Vector(0, -35, 30.2), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(12, 0, 4), Hide = true, DoorSounds = true, RadioControl = false}
						},
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 92, Looping = false}, //Horn sound the car will use.

			KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/bmwm5e34.txt"
						}
						}
list.Set("Vehicles", "m5e34tdm", V)
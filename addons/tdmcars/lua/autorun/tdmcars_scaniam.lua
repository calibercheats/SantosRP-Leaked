
-----------------------------------------------------
local V = {
			Name = "Scania Medium Cab", 
			Class = "prop_vehicle_jeep_old",
			Category = "TDM Trucks",
			Author = "TheDanishMaster, freemmaann, SCS Software",
			Information = "A drivable Scania high cab by TheDanishMaster",
				Model = "models/tdmcars/trucks/scania_med.mdl",
			//Vehicle Controller
			VC_Lights = { //Pos can be a simple Vector() relative to the vehicle or an attachment name, else is self explanatory, can be an infinite amount of these.
						{Pos = Vector(39.9, -120.9, 32.5), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.7, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0"},
						{Pos = Vector(-37.4, -120.9, 32.5), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.7, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0"},
						{Pos = Vector(-30.5, -120.9, 32.5), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.7, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0"},
						{Pos = Vector(33, -120.9, 32.5), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.7, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0"},
						{Pos = Vector(28.1, -120.9, 32.5), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.7, DynLight = true, ReverseColor = "255 255 255"},
						{Pos = Vector(-25.6, -120.9, 32.5), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.7, DynLight = true, ReverseColor = "255 255 255"},
						{Pos = Vector(43.5, -120.9, 32.5), Mat = "sprites/glow1.vmt", Alpha = 190, Size = 0.7, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(-41, -120.9, 32.5), Mat = "sprites/glow1.vmt", Alpha = 190, Size = 0.7, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(52, -62, 29.2), Mat = "sprites/glow1.vmt", Alpha = 190, Size = 0.4, DynLight = true, NormalColor = "255 130 0", BlinkersColor = "255 130 0"},
						{Pos = Vector(-50, -62, 29.2), Mat = "sprites/glow1.vmt", Alpha = 190, Size = 0.4, DynLight = true, NormalColor = "255 130 0", BlinkersColor = "255 130 0"},
						{Pos = Vector(52, -0.8, 29.2), Mat = "sprites/glow1.vmt", Alpha = 190, Size = 0.4, DynLight = true, NormalColor = "255 130 0", BlinkersColor = "255 130 0"},
						{Pos = Vector(-50, -0.8, 29.2), Mat = "sprites/glow1.vmt", Alpha = 190, Size = 0.4, DynLight = true, NormalColor = "255 130 0", BlinkersColor = "255 130 0"},
						{Pos = Vector(48.4, 108, 36.4), Mat = "sprites/glow1.vmt", Alpha = 210, Size = 0.8, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(-45.9, 108, 36.4), Mat = "sprites/glow1.vmt", Alpha = 210, Size = 0.8, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(43.8, 114.8, 36.4), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 1, DynLight = false, NormalColor = "255 255 255"},
						{Pos = Vector(-41.2, 114.8, 36.4), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 1, DynLight = false, NormalColor = "255 255 255"},
						{Pos = Vector(44, 112.8, 28.5), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.5, DynLight = false, NormalColor = "255 255 255"},
						{Pos = Vector(-41.5, 112.8, 28.5), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.5, DynLight = false, NormalColor = "255 255 255"},
						{Pos = Vector(-48.6, 96.9, 34.9), Mat = "sprites/glow1.vmt", Alpha = 190, Size = 0.4, DynLight = true, NormalColor = "255 130 0", BlinkersColor = "255 130 0"},
						{Pos = Vector(51.5, 97.1, 34.7), Mat = "sprites/glow1.vmt", Alpha = 190, Size = 0.4, DynLight = true, NormalColor = "255 130 0", BlinkersColor = "255 130 0"},
						{Pos = Vector(37, 116, 28.5), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.5, DynLight = false, NormalColor = "255 255 255"},
						{Pos = Vector(-34.5, 116, 28.5), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.5, DynLight = false, NormalColor = "255 255 255"},
						{Pos = Vector(37.3, 113.3, 122.7), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.2, DynLight = false, NormalColor = "255 255 255"},
						{Pos = Vector(-34.8, 113.3, 122.7), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.2, DynLight = false, NormalColor = "255 255 255"},
						{Pos = Vector(20.1, 114.6, 122.8), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 1, DynLight = false, NormalColor = "255 255 255"},
						{Pos = Vector(-17.6, 114.6, 122.8), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 1, DynLight = false, NormalColor = "255 255 255"},
						{Pos = Vector(37, 115.3, 36.5), Size = 1.2, GlowSize = 1, HeadLightAngle = Angle(5, 90, 0)},
						{Pos = Vector(-36.5, 115.3, 36.5), Size = 1.2, GlowSize = 1, HeadLightAngle = Angle(5, 90, 0)}
						},
			VC_AttachPos = Vector(1.3, -69.2, 44.3), //An attachment name or a simple Vector(0,-70,56), relative to the vehicle.
			VC_ExtraSeats = { //Can be an infinite amount of seats, Pos and ExitPos can be a simple Vector() or an attachment name, other options are self explanatory.
							{Pos = Vector(27.6, 73, 66), Ang = Angle(0, 0, 0), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/nova/jeep_seat.mdl", ModelOffset = Vector(0, 0, -0.5), Hide = true, DoorSounds = true},
							},
			VC_Horn = {Sound = "vehicles/vc_horn_heavy.wav", Pitch = 100, Looping = false}, //Horn sound the car will use.
			VC_Exhaust = { //Exhaust effect, only active when engine is on, can be infinite amount.
						{Pos = Vector(-48.5, 17.8, 26.2), Ang = Angle(0,-90,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"}, //Pos and Ang are relative to the vehicle, Pos - a simple vector or an attachment name, effect has to be a looping particle effect.
						},
			VC_Exhaust_Dissipate = true, //Remove the exhaust effect when car reaches certain velocity.
			//
				KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/scania_m.txt"
							}
			}
list.Set("Vehicles", "scaniamtdm", V)

-----------------------------------------------------
local V = {
			Name = "Citroen C4", 
			Class = "prop_vehicle_jeep",
			Category = "TDM Cars",
			Author = "TheDanishMaster, freemmaann, Turn 10",
			Information = "A drivable Citroen C4 by TheDanishMaster",
			Model = "models/tdmcars/cit_c4.mdl",
			//Vehicle Controller
			VC_Lights = { //Pos can be a simple Vector() relative to the vehicle or an attachment name, else is self explanatory, can be an infinite amount of these.
						{Pos = Vector(-31.4, -88.9, 40.2), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.7, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0"},
						{Pos = Vector(31.4, -88.9, 40.2), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.7, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0"},
						{Pos = Vector(-28.7, -88.2, 43.8), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.6, DynLight = true, ReverseColor = "255 255 255"},
						{Pos = Vector(28.7, -88.2, 43.8), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.6, DynLight = true, ReverseColor = "255 255 255"},
						{Pos = Vector(-26.3, -88.9, 48.7), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.5, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(26.3, -88.9, 48.7), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.5, DynLight = true, BlinkersColor = "255 130 0"},

						{Pos = Vector(-33.5, 74.9, 34.7), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.5, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(33.5, 74.9, 34.7), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.5, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(-22.9, 83.9, 31.9), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.7, DynLight = true, NormalColor = "255 255 255"},
						{Pos = Vector(22.9, 83.9, 31.9), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.7, DynLight = true, NormalColor = "255 255 255"},
						{Pos = Vector(-27.7, 75, 32.3), Size = 1, GlowSize = 1, HeadLightAngle = Angle(-5, 95, 0)},
						{Pos = Vector(27.7, 75, 32.3), Size = 1, GlowSize = 1, HeadLightAngle = Angle(-5, 85, 0)}
						},
			VC_Exhaust = { //Exhaust effect, only active when engine is on, can be infinite amount.
						{Pos = Vector(-16.2, -94.5, 11.8), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"}
						},
			VC_ExtraSeats = { //Can be an infinite amount of seats, Pos and ExitPos can be a simple Vector() or an attachment name, other options are self explanatory.
						{Pos = Vector(-17.8, -2.2, 24), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(12, 0, 4), Hide = true, DoorSounds = true, RadioControl = true},
						{Pos = Vector(-17.8, -35.4, 24), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(12, 0, 4), Hide = true, DoorSounds = true, RadioControl = true},
						{Pos = Vector(17.8, -35.4, 24), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(12, 0, 4), Hide = true, DoorSounds = true, RadioControl = true}
						},
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 100, Looping = false}, //Horn sound the car will use.
						
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/c4.txt"
							}
			}
list.Set("Vehicles", "c4tdm", V)
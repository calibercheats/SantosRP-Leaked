
-----------------------------------------------------
local V = {
			Name = "Hudson Hornet", 
			Class = "prop_vehicle_jeep",
			Category = "TDM Cars",
			Author = "TheDanishMaster, freemmaann, Turn 10",
			Information = "A drivable Hudson Hornet by TheDanishMaster",
			Model = "models/tdmcars/hud_hornet.mdl",
			//Vehicle Controller
			VC_Lights = { //Pos can be a simple Vector() relative to the vehicle or an attachment name, else is self explanatory, can be an infinite amount of these.
						{Pos = Vector(-37, -121, 30), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.5, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0", BlinkersColor = "255 0 0"},
						{Pos = Vector(37, -121, 30), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.5, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0", BlinkersColor = "255 0 0"},
						{Pos = Vector(-31.5, -121, 36.8), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.4, DynLight = true, ReverseColor = "255 255 255"},
						{Pos = Vector(31.5, -121, 36.8), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.4, DynLight = true, ReverseColor = "255 255 255"},
						{Pos = Vector(-39, 120, 28.2), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.3, DynLight = true, BlinkersColor = "242 239 173", NormalColor = "242 239 173"},
						{Pos = Vector(39, 120, 28.2), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.3, DynLight = true, BlinkersColor = "242 239 173", NormalColor = "242 239 173"},

						{Pos = Vector(-36, 112, 42), Size = 1, GlowSize = 1, HeadLightAngle = Angle(-5, 95, 0)},
						{Pos = Vector(36, 112, 42), Size = 1, GlowSize = 1, HeadLightAngle = Angle(-5, 85, 0)}
						},
			VC_Exhaust_Dissipate = true,
			VC_Exhaust = { //Exhaust effect, only active when engine is on, can be infinite amount.
						{Pos = Vector(22.5, -128, 16), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"}
						},
			VC_ExtraSeats = { //Can be an infinite amount of seats, Pos and ExitPos can be a simple Vector() or an attachment name, other options are self explanatory.
						{Pos = Vector(18, 5, 24), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(12, 0, 4), Hide = true, DoorSounds = true, RadioControl = true},
						{Pos = Vector(18, -40, 23), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(12, 0, 4), Hide = true, DoorSounds = true, RadioControl = false},
						{Pos = Vector(-18, -40, 23), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(12, 0, 4), Hide = true, DoorSounds = true, RadioControl = false}
						},
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 100, Looping = false}, //Horn sound the car will use.
						
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/hudhornet.txt"
							}
			}
list.Set("Vehicles", "hudhornettdm", V)
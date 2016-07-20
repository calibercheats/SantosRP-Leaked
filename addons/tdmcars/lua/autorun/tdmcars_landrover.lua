
-----------------------------------------------------
local V = {
			Name = "Land Rover Range Rover 08", 
			Class = "prop_vehicle_jeep",
			Category = "TDM Cars",
			Author = "TheDanishMaster, Turn 10",
			Information = "The Land Rover Range Rover 08, gmod-able by TDM",
			Model = "models/tdmcars/landrover.mdl",
			//Vehicle Controller
			VC_Lights = { //Pos can be a simple Vector() relative to the vehicle or an attachment name, else is self explanatory, can be an infinite amount of these.
						{Pos = Vector(-38.4, -110.9, 49.5), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.7, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0", BlinkersColor = "255 130 0"},
						{Pos = Vector(38.4, -110.9, 49.5), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.7, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0", BlinkersColor = "255 130 0"},
						{Pos = Vector(-38.3, -110.9, 42.3), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.7, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0"},
						{Pos = Vector(38.3, -110.9, 42.3), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.7, DynLight = true, NormalColor = "255 0 0", BrakeColor = "255 0 0"},

						{Pos = Vector(-15.6, -117.2, 47.6), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.3, DynLight = true, ReverseColor = "255 255 255"},
						{Pos = Vector(15.6, -117.2, 47.6), Mat = "sprites/glow1.vmt", Alpha = 180, Size = 0.3, DynLight = true, ReverseColor = "255 255 255"},

						{Pos = Vector(-40.3, 103.8, 43.4), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.5, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(40.3, 103.8, 43.4), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.5, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(-47.2, 54.6, 46), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.2, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(47.2, 54.6, 46), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.2, DynLight = true, BlinkersColor = "255 130 0"},
						{Pos = Vector(-40.3, 103.8, 38.5), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.5, DynLight = true, NormalColor = "255 255 255"},
						{Pos = Vector(40.3, 103.8, 38.5), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.5, DynLight = true, NormalColor = "255 255 255"},
						{Pos = Vector(-26.3, 107.6, 39.8), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.8, DynLight = true, NormalColor = "255 255 255"},
						{Pos = Vector(26.3, 107.6, 39.8), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.8, DynLight = true, NormalColor = "255 255 255"},
						{Pos = Vector(-30.5, 111.8, 27.1), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.7, DynLight = true, NormalColor = "255 255 255"},
						{Pos = Vector(30.5, 111.8, 27.1), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.7, DynLight = true, NormalColor = "255 255 255"},

						{Pos = Vector(-32.8, 100.1, 42.4), Size = 1, GlowSize = 1, HeadLightAngle = Angle(-5, 95, 0)},
						{Pos = Vector(32.8, 100.1, 42.4), Size = 1, GlowSize = 1, HeadLightAngle = Angle(-5, 85, 0)}
						},
			VC_ExtraSeats = { //Can be an infinite amount of seats, Pos and ExitPos can be a simple Vector() or an attachment name, other options are self explanatory.
						{Pos = Vector(20, 5, 39), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(12, 0, 4), Hide = true, DoorSounds = true, RadioControl = true},
						{Pos = Vector(20, -42, 39), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(12, 0, 4), Hide = true, DoorSounds = true, RadioControl = false},
						{Pos = Vector(-20, -42, 39), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(12, 0, 4), Hide = true, DoorSounds = true, RadioControl = false}
						},
			VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 90, Looping = false}, //Horn sound the car will use.
			KeyValues = {
						vehiclescript	=	"scripts/vehicles/TDMCars/landrover.txt"
						}
			}
list.Set("Vehicles", "landrovertdm", V)

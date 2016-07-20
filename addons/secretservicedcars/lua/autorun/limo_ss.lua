
-----------------------------------------------------
local Category = "SGM Cars (Static Servers)"

local V = {
				// Required information
				Name =	"2010 Lincoln Town Car Limo",
				Class = "prop_vehicle_jeep",
				Category = Category,

				// Optional information
				Author = "SentryGunMan, Criterion, Ubisoft",
				Information = "vroom vroom",
				Model =	"models/sentry/static/lincolntclimo.mdl",


				//Vehicle Controller
			VC_Lights = { //Pos can be a simple Vector() relative to the vehicle or an attachment name, else is self explanatory, can be an infinite amount of these.


						{Pos = Vector(-13.074,-165.884,36.828), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.4, DynLight = true, ReverseColor ="255 255 255"},
						{Pos = Vector(13.074,-165.884,36.828), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.4, DynLight = true, ReverseColor ="255 255 255"},

						{Pos = Vector(-32.786,-163.26,40.059), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 1.4, DynLight = true, NormalColor ="255 0 0", BrakeColor ="255 0 0", BlinkersColor ="255 0 0"},
						{Pos = Vector(32.786,-163.26,40.059), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 1.4, DynLight = true, NormalColor ="255 0 0", BrakeColor ="255 0 0", BlinkersColor ="255 0 0"},

						{Pos = Vector(-34.225,155.597,31.623), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.3, DynLight = true, BlinkersColor ="255 130 0"},
						{Pos = Vector(34.225,155.597,31.623), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.3, DynLight = true, BlinkersColor ="255 130 0"},

						{Pos = Vector(-30.282,155.866,32.237), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.4, DynLight = true, NormalColor ="255 255 255"},
						{Pos = Vector(30.282,155.866,32.237), Mat = "sprites/glow1.vmt", Alpha = 220, Size = 0.4, DynLight = true, NormalColor ="255 255 255"},



						{Pos = Vector(-23.677,158.59,32.237), Size = 0.1, GlowSize = 0.3, HeadLightAngle = Angle(0, 90, 0)},
						{Pos = Vector(23.677,158.59,32.237), Size = 0.1, GlowSize = 0.3, HeadLightAngle = Angle(0, 90, 0)}
						},
VC_ExtraSeats = { //Can be an infinite amount of seats, Pos and ExitPos can be a simple Vector() or an attachment name, other options are self explanatory.

							{Pos = Vector(-21.933,-87.458,12.073), Ang = Angle(0, 0, 0), EnterRange = 180, ExitAng = Angle(0, -90, 0), ExitPos = Vector(68,-34,15), Model = "models/nova/jeep_seat.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true},
							{Pos = Vector(0,-87.458,12.073), Ang = Angle(0, 0, 0), EnterRange = 180, ExitAng = Angle(0, -90, 0), ExitPos = Vector(68,-34,15), Model = "models/nova/jeep_seat.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true},
							{Pos = Vector(21.933,-87.458,12.073), Ang = Angle(0, 0, 0), EnterRange = 180, ExitAng = Angle(0, -90, 0), ExitPos = Vector(68,-34,15), Model = "models/nova/jeep_seat.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true},
							{Pos = Vector(18.642,53.619,12.073), Ang = Angle(0, 0, 0), EnterRange = 180, ExitAng = Angle(0, -90, 0), ExitPos = Vector(68,5,13), Model = "models/nova/jeep_seat.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true},

							{Pos = Vector(24.933,18.565,12.073), Ang = Angle(0, 90, 0), EnterRange = 180, ExitAng = Angle(0, -90, 0), ExitPos = Vector(68,-34,15), Model = "models/nova/jeep_seat.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true},
							{Pos = Vector(24.933,-6.443,12.073), Ang = Angle(0, 90, 0), EnterRange = 180, ExitAng = Angle(0, -90, 0), ExitPos = Vector(68,-34,15), Model = "models/nova/jeep_seat.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true},
							{Pos = Vector(24.933,-31.28,12.073), Ang = Angle(0, 90, 0), EnterRange = 180, ExitAng = Angle(0, -90, 0), ExitPos = Vector(68,-34,15), Model = "models/nova/jeep_seat.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true},
							{Pos = Vector(-24.933,18.565,12.073), Ang = Angle(0, -90, 0), EnterRange = 180, ExitAng = Angle(0, -90, 0), ExitPos = Vector(68,-34,15), Model = "models/nova/jeep_seat.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true},
							{Pos = Vector(-24.933,-6.443,12.073), Ang = Angle(0, -90, 0), EnterRange = 180, ExitAng = Angle(0, -90, 0), ExitPos = Vector(68,-34,15), Model = "models/nova/jeep_seat.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true},
							{Pos = Vector(-24.933,-31.28,12.073), Ang = Angle(0, -90, 0), EnterRange = 180, ExitAng = Angle(0, -90, 0), ExitPos = Vector(68,-34,15), Model = "models/nova/jeep_seat.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true},



							},
VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 120, Looping = false}, //Horn sound the car will use.
			VC_Exhaust = { //Exhaust effect, only active when engine is on, can be infinite amount.
						{Pos = Vector(33.6,-110,13.7), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"}, //Pos and Ang are relative to the vehicle, Pos - a simple vector or an attachment name, effect has to be a looping particle effect.



						{Pos = Vector(-33.6,-110,13.7), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"}, //Pos and Ang are relative to the vehicle, Pos - a simple vector or an attachment name, effect has to be a looping particle effect.
						},
			VC_Exhaust_Dissipate = true, //Remove the exhaust effect when car reaches certain velocity.
			//
				KeyValues = {				
								vehiclescript =	"scripts/vehicles/sentry/towncarlimo.txt"
					    }
}
list.Set( "Vehicles", "limo_ss", V )


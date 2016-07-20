
-----------------------------------------------------
local Category = "SGM Cars"

local V = {
				// Required information
				Name =	"2011 BMW X5M",
				Class = "prop_vehicle_jeep",
				Category = Category,

				// Optional information
				Author = "SentryGunMan, Turn 10, TheDanishMaster",
				Information = "vroom vroom",
				Model =	"models/sentry/x5m_pred.mdl",

				//Vehicle Controller
			VC_Lights = { //Pos can be a simple Vector() relative to the vehicle or an attachment name, else is self explanatory, can be an infinite amount of these.
						{Pos = Vector(0,-103.5,48), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.1, DynLight = true, BrakeColor ="255 10 10"},
						{Pos = Vector(2,-103.5,48), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.1, DynLight = true, BrakeColor ="255 10 10"},
						{Pos = Vector(4,-103.5,48), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.1, DynLight = true, BrakeColor ="255 10 10"},
						{Pos = Vector(-2,-103.5,48), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.1, DynLight = true, BrakeColor ="255 10 10"},
						{Pos = Vector(-4,-103.5,48), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.1, DynLight = true, BrakeColor ="255 10 10"},
						{Pos = Vector(6,-103.5,48), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.1, DynLight = true, BrakeColor ="255 10 10"},
						{Pos = Vector(8,-103.5,48), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.1, DynLight = true, BrakeColor ="255 10 10"},
						{Pos = Vector(-6,-103.5,48), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.1, DynLight = true, BrakeColor ="255 10 10"},
						{Pos = Vector(-8,-103.5,48), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.1, DynLight = true, BrakeColor ="255 10 10"  },


						{Pos = Vector(20,-103,39), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.2, DynLight = true, NormalColor ="255 10 10",  BrakeColor ="255 10 10" },
			
						{Pos = Vector(20,-102.5,40.5), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.2, DynLight = true, NormalColor ="255 10 10", BrakeColor ="255 10 10" },
						{Pos = Vector(20,-102,42), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.2, DynLight = true, NormalColor ="255 10 10",  BrakeColor ="255 10 10" },

						{Pos = Vector(26.4,-102,40), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.2, DynLight = true, NormalColor ="255 10 10", BrakeColor ="255 10 10", ReverseColor="255 255 255"},
			
						{Pos = Vector(26.4,-101.5,41.5), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.2, DynLight = true, NormalColor ="255 10 10", BrakeColor ="255 10 10", ReverseColor="255 255 255" },

						{Pos = Vector(32,-99,40), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.2, DynLight = true, NormalColor ="255 10 10", BlinkersColor= "255 100 10", BrakeColor ="255 10 10" },
			
						{Pos = Vector(32,-98.5,41.5), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.2, DynLight = true, NormalColor ="255 10 10", BlinkersColor= "255 100 10", BrakeColor ="255 10 10" },



						{Pos = Vector(-20,-103,39), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.2, DynLight = true, NormalColor ="255 10 10", BrakeColor ="255 10 10" },
			
						{Pos = Vector(-20,-102.5,40.5), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.2, DynLight = true, NormalColor ="255 10 10", BrakeColor ="255 10 10" },
						{Pos = Vector(-20,-102,42), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.2, DynLight = true, NormalColor ="255 10 10", BrakeColor ="255 10 10" },

						{Pos = Vector(-26.4,-102,40), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.2, DynLight = true, NormalColor ="255 10 10", BrakeColor ="255 10 10", ReverseColor="255 255 255"},
			
						{Pos = Vector(-26.4,-101.5,41.5), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.2, DynLight = true, NormalColor ="255 10 10", BrakeColor ="255 10 10", ReverseColor="255 255 255"},

						{Pos = Vector(-32,-99,40), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.2, DynLight = true, NormalColor ="255 10 10", BlinkersColor= "255 100 10", BrakeColor ="255 10 10" },
			
						{Pos = Vector(-32,-98.5,41.5), Mat = "sprites/blueflare1.vmt", Alpha = 210, Size = 0.2, DynLight = true, NormalColor ="255 10 10", BlinkersColor= "255 100 10", BrakeColor ="255 10 10" },




						{Pos = Vector(32.0, 94.5, 30.7), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.035, DynLight = true,   NormalColor ="255 245 255" },

						{Pos = Vector(33.0, 94.0, 30.7), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.035, DynLight = true,   NormalColor ="255 245 255" },
						{Pos = Vector(34.0, 93.5, 30.7), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.035, DynLight = true,   NormalColor ="255 245 255" },
						{Pos = Vector(35.0, 93.0, 30.7), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.035, DynLight = true,   NormalColor ="255 245 255" },
						{Pos = Vector(36.0, 92.5, 30.7), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.035, DynLight = true,   NormalColor ="255 245 255" },


						{Pos = Vector(32.0, 94.5, 28.7), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.035, DynLight = true,   NormalColor ="255 245 255" },
						{Pos = Vector(33.0, 94.0, 28.7), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.035, DynLight = true,   NormalColor ="255 245 255" },
						{Pos = Vector(34.0, 93.5, 28.7), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.035, DynLight = true,   NormalColor ="255 245 255" },
						{Pos = Vector(35.0, 93.0, 28.7), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.035, DynLight = true,   NormalColor ="255 245 255" },
						{Pos = Vector(36.0, 92.5, 28.7), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.035, DynLight = true,   NormalColor ="255 245 255" },
						{Pos = Vector(37.0, 92.0, 28.7), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.035, DynLight = true,   NormalColor ="255 245 255" },





						{Pos = Vector(-32.0, 94.5, 30.7), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.035, DynLight = true,   NormalColor ="255 245 255" },

						{Pos = Vector(-33.0, 94.0, 30.7), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.035, DynLight = true,   NormalColor ="255 245 255" },
						{Pos = Vector(-34.0, 93.5, 30.7), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.035, DynLight = true,   NormalColor ="255 245 255" },
						{Pos = Vector(-35.0, 93.0, 30.7), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.035, DynLight = true,   NormalColor ="255 245 255" },
						{Pos = Vector(-36.0, 92.5, 30.7), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.035, DynLight = true,   NormalColor ="255 245 255" },


						{Pos = Vector(-32.0, 94.5, 28.7), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.035, DynLight = true,   NormalColor ="255 245 255" },
						{Pos = Vector(-33.0, 94.0, 28.7), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.035, DynLight = true,   NormalColor ="255 245 255" },
						{Pos = Vector(-34.0, 93.5, 28.7), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.035, DynLight = true,   NormalColor ="255 245 255" },
						{Pos = Vector(-35.0, 93.0, 28.7), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.035, DynLight = true,   NormalColor ="255 245 255" },
						{Pos = Vector(-36.0, 92.5, 28.7), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.035, DynLight = true,   NormalColor ="255 245 255" },
						{Pos = Vector(-37.0, 92.0, 28.7), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.035, DynLight = true,   NormalColor ="255 245 255" },






						{Pos = Vector(28.5, 96.5, 29.4), Mat = "sprites/blueflare1.vmt", Alpha = 250, Size = 0.3, DynLight = true,   NormalColor ="255 245 255" },
						{Pos = Vector(-28.5, 96.5, 29.4), Mat = "sprites/blueflare1.vmt", Alpha = 250, Size = 0.3, DynLight = true,  NormalColor ="255 245 255"  },


						{Pos = Vector(34, 92, 29.4), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.3, DynLight = true,   BlinkersColor ="255 155 45" },
						{Pos = Vector(-34, 92, 29.4), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.3, DynLight = true, BlinkersColor ="255 155 45" },
						{Pos = Vector(36.5, 94, 18), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.1, DynLight = true,  BlinkersColor ="255 155 45" },
						{Pos = Vector(-36.5, 94, 18), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.1, DynLight = true,  BlinkersColor ="255 155 45" },



						{Pos = Vector(40.5, -86, 24.15), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.1, DynLight = true,  BlinkersColor ="255 0 0" },
						{Pos = Vector(41, -84, 24), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.1, DynLight = true,  BlinkersColor ="255 0 0" },
						{Pos = Vector(41.5, -82, 23.85), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.1, DynLight = true,  BlinkersColor ="255 0 0" },


						{Pos = Vector(-40.5, -86, 24.15), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.1, DynLight = true,   BlinkersColor ="255 0 0" },
						{Pos = Vector(-41, -84, 24), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.1, DynLight = true,    BlinkersColor ="255 0 0" },
						{Pos = Vector(-41.5, -82, 23.85), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.1, DynLight = true,  BlinkersColor ="255 0 0" },



						{Pos = Vector(38, 92, 18.2), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.1, DynLight = true,   BlinkersColor ="255 155 45" },
						{Pos = Vector(-38, 92, 18.2), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.1, DynLight = true,  BlinkersColor ="255 155 45" },

						{Pos = Vector(39.5, 90, 18.4), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.1, DynLight = true,    BlinkersColor ="255 155 45" },
						{Pos = Vector(-39.5, 90, 18.4), Mat = "sprites/blueflare1.vmt", Alpha = 240, Size = 0.1, DynLight = true, BlinkersColor ="255 155 45" },



						{Pos = Vector(28.5, 96.5, 29.4), Size = 0.1, GlowSize = 0.3, HeadLightAngle = Angle(0, 90, 0)},
						{Pos = Vector(-28.5, 96.5, 29.4), Size = 0.1, GlowSize = 0.3, HeadLightAngle = Angle(0, 90, 0)}
						},
VC_ExtraSeats = { //Can be an infinite amount of seats, Pos and ExitPos can be a simple Vector() or an attachment name, other options are self explanatory.
							{Pos = Vector(18,-3.5,12), Ang = Angle(0, 0, 5), EnterRange = 180, ExitAng = Angle(0, -90, 0), ExitPos = Vector(66.6, -3.5, 12), Model = "models/nova/jeep_seat.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true},
							{Pos = Vector(13.6,-40.5,12), Ang = Angle(0, 0, 5), EnterRange = 180, ExitAng = Angle(0, -90, 0), ExitPos = Vector(66.6, -40.5, 12), Model = "models/nova/jeep_seat.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true},
							{Pos = Vector(-13.6,-40.5,12), Ang = Angle(0, 0, 5), EnterRange = 180, ExitAng = Angle(0, -90, 0), ExitPos = Vector(66.6, -40.5, 12), Model = "models/nova/jeep_seat.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true},
							},
VC_Horn = {Sound = "vehicles/vc_horn_light.wav", Pitch = 120, Looping = false}, //Horn sound the car will use.
			VC_Exhaust = { //Exhaust effect, only active when engine is on, can be infinite amount.
						{Pos = Vector(27.1,-105,14.5), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"}, //Pos and Ang are relative to the vehicle, Pos - a simple vector or an attachment name, effect has to be a looping particle effect.

						{Pos = Vector(33.1,-33,7.3), Ang = Angle(0,90,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"}, //Pos and Ang are relative to the vehicle, Pos - a simple vector or an attachment name, effect has to be a looping particle effect.
						{Pos = Vector(33.1,-34,7.3), Ang = Angle(0,90,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"}, //Pos and Ang are relative to the vehicle, Pos - a simple vector or an attachment name, effect has to be a looping particle effect.
						{Pos = Vector(33.1,-35,7.3), Ang = Angle(0,90,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"}, //Pos and Ang are relative to the vehicle, Pos - a simple vector or an attachment name, effect has to be a looping particle effect.
						{Pos = Vector(33.1,-36,7.3), Ang = Angle(0,90,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"}, //Pos and Ang are relative to the vehicle, Pos - a simple vector or an attachment name, effect has to be a looping particle effect.

						{Pos = Vector(-33.1,-33,7.3), Ang = Angle(0,-90,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"}, //Pos and Ang are relative to the vehicle, Pos - a simple vector or an attachment name, effect has to be a looping particle effect.
						{Pos = Vector(-33.1,-34,7.3), Ang = Angle(0,-90,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"}, //Pos and Ang are relative to the vehicle, Pos - a simple vector or an attachment name, effect has to be a looping particle effect.
						{Pos = Vector(-33.1,-35,7.3), Ang = Angle(0,-90,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"}, //Pos and Ang are relative to the vehicle, Pos - a simple vector or an attachment name, effect has to be a looping particle effect.
						{Pos = Vector(-33.1,-36,7.3), Ang = Angle(0,-90,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"}, //Pos and Ang are relative to the vehicle, Pos - a simple vector or an attachment name, effect has to be a looping particle effect.


						{Pos = Vector(-27.1,-105,14.5), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"}, //Pos and Ang are relative to the vehicle, Pos - a simple vector or an attachment name, effect has to be a looping particle effect.
						},
			VC_Exhaust_Dissipate = true, //Remove the exhaust effect when car reaches certain velocity.
			//
				KeyValues = {				
								vehiclescript =	"scripts/vehicles/sentry/x5m.txt"
					    }
}

list.Set( "Vehicles", "x5m", V )


-----------------------------------------------------
local V = {
			Name = "Chevrolet Monte Carlo SS Stock Car", 
			Class = "prop_vehicle_jeep",
			Category = "LW Cars",
			Author = "LoneWolfie",
			Information = "Driveable Chevrolet #04 Chevrolet Racing Monte Carlo SS Stock Car Aileron by LoneWolfie",
			Model = "models/LoneWolfie/chev_nascar.mdl",
						VC_Exhaust = { //Exhaust effect, only active when engine is on, can be infinite amount.
						{Pos = Vector(53.8, -16.9, 12.8), Ang = Angle(0,45,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						{Pos = Vector(53.8, -18.9, 12.8), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						{Pos = Vector(53.8, -14.9, 12.8), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						{Pos = Vector(-53.8, -16.9, 12.8), Ang = Angle(0,45,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						{Pos = Vector(-53.8, -18.9, 12.8), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						{Pos = Vector(-53.8, -14.9, 12.8), Ang = Angle(0,0,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
						},
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/chev_nascar.txt"
							}
			}
list.Set("Vehicles", "chev_nascar", V)
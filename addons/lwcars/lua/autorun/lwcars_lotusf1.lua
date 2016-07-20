
-----------------------------------------------------
local V = {
			Name = "Lotus E21 Renault", 
			Class = "prop_vehicle_jeep",
			Category = "LW Cars",
			Author = "LoneWolfie",
			Information = "Driveable Lotus E21 Renault by LoneWolfie",
			Model = "models/LoneWolfie/lotus_f1.mdl",
			-- VCMod lights added by TheSenDest (STEAM_0:0:48138208) on May 5, 2014
			VC_Lights = {
				{Pos = Vector(-0.048, -129.286, 24.242), Mat = "sprites/blueflare1.vmt", Size = 0.03, DynLight = true, BlinkersColor = "255 0 0"},
				{Pos = Vector(-1.039, -129.286, 24.242), Mat = "sprites/blueflare1.vmt", Size = 0.03, DynLight = true, BlinkersColor = "255 0 0"},
				{Pos = Vector(0.884 , -129.286, 24.242), Mat = "sprites/blueflare1.vmt", Size = 0.03, DynLight = true, BlinkersColor = "255 0 0"},
				{Pos = Vector(-0.988, -129.133, 23.344), Mat = "sprites/blueflare1.vmt", Size = 0.03, DynLight = true, BlinkersColor = "255 0 0"},
				{Pos = Vector(-0.033, -129.133, 23.344), Mat = "sprites/blueflare1.vmt", Size = 0.03, DynLight = true, BlinkersColor = "255 0 0"},
				{Pos = Vector(0.903 , -129.133, 23.344), Mat = "sprites/blueflare1.vmt", Size = 0.03, DynLight = true, BlinkersColor = "255 0 0"},
				{Pos = Vector(-1.004, -129.133, 22.369), Mat = "sprites/blueflare1.vmt", Size = 0.03, DynLight = true, BlinkersColor = "255 0 0"},
				{Pos = Vector(-0.073, -129.133, 22.369), Mat = "sprites/blueflare1.vmt", Size = 0.03, DynLight = true, BlinkersColor = "255 0 0"},
				{Pos = Vector(0.883 , -129.133, 22.369), Mat = "sprites/blueflare1.vmt", Size = 0.03, DynLight = true, BlinkersColor = "255 0 0"},
				{Pos = Vector(-0.956, -129.133, 21.374), Mat = "sprites/blueflare1.vmt", Size = 0.03, DynLight = true, BlinkersColor = "255 0 0"},
				{Pos = Vector(-0.057, -129.133, 21.374), Mat = "sprites/blueflare1.vmt", Size = 0.03, DynLight = true, BlinkersColor = "255 0 0"},
				{Pos = Vector(0.866 , -129.133, 21.374), Mat = "sprites/blueflare1.vmt", Size = 0.03, DynLight = true, BlinkersColor = "255 0 0"},
				{Pos = Vector(-1.023, -129.133, 20.395), Mat = "sprites/blueflare1.vmt", Size = 0.03, DynLight = true, BlinkersColor = "255 0 0"},
				{Pos = Vector(-0.045, -129.133, 20.395), Mat = "sprites/blueflare1.vmt", Size = 0.03, DynLight = true, BlinkersColor = "255 0 0"},
				{Pos = Vector(0.88  , -129.133, 20.395), Mat = "sprites/blueflare1.vmt", Size = 0.03, DynLight = true, BlinkersColor = "255 0 0"},
				},
			
			VC_Exhaust_Dissipate = true,
			VC_Exhaust = { 
				{Pos = Vector(23.5, -49, 20.6), Ang = Angle(0,45,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},
				{Pos = Vector(-23.5, -49, 20.6), Ang = Angle(0,45,90), EffectIdle = "Exhaust", EffectStress = "Exhaust"},

						},
KeyValues = {
		vehiclescript	=	"scripts/vehicles/LWCars/lotus_f1.txt"
	}
}
list.Set("Vehicles", "lotus_f1", V)

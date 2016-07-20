
-----------------------------------------------------
local PrVeh = "prop_vehicle_jeep"
local Cat = "TDM Cars"

local V = {
			Name = "Nissan 350z",
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Turn 10",
			Information = "The Nissan 350z (Fairlady Z), gmod-able by TDM",
			Model = "models/tdmcars/350z.mdl",
			KeyValues = {
						vehiclescript	=	"scripts/vehicles/TDMCars/350z.txt"
						}
			}
list.Set("Vehicles", "350ztdm", V)

local V = {
			Name = "Nissan 370z",
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Turn 10",
			Information = "The Nissan 370z, gmod-able by TDM",
			Model = "models/tdmcars/nis_370z.mdl",
			KeyValues = {
						vehiclescript	=	"scripts/vehicles/TDMCars/370z.txt"
						}
			}
list.Set("Vehicles", "370ztdm", V)

local V = {
			Name = "Nissan GT-R Black Edition", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable Nissan GT-R Black Edition by TheDanishMaster",
			Model = "models/tdmcars/nissan_gtr.mdl",
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/gtr.txt"
							}
			}
list.Set("Vehicles", "gtrtdm", V)

local V = {
			Name = "Nissan Leaf", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable Nissan Leaf by TheDanishMaster",
			Model = "models/tdmcars/nis_leaf.mdl",
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/nis_leaf.txt"
							}
			}
list.Set("Vehicles", "nis_leaftdm", V)

local V = {
			Name = "Nissan Silvia S15", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable Nissan Silvia S15 by TheDanishMaster",
			Model = "models/tdmcars/nissan_silvias15.mdl",
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/nissilvs15.txt"
							}
			}
list.Set("Vehicles", "nissilvs15tdm", V)

local V = {
			Name = "Nissan Skyline R34", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable Nissan Skyline R34 by TheDanishMaster",
			Model = "models/tdmcars/skyline_r34.mdl",
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/skyline_r34.txt"
							}
			}
list.Set("Vehicles", "r34tdm", V)

 if SERVER then
	hook.Add("Think", "TDMBoost_SilviaS15", function()
		for _, ent in pairs(ents.FindByClass("prop_vehicle_jeep*")) do
			if ent:GetModel() == "models/tdmcars/nissan_silvias15.mdl" then
				local Pwr = -6.7
				if IsValid(ent:GetDriver()) then
					if ent:GetDriver():KeyDown(IN_FORWARD) then Pwr = -0.2 end
				end
				ent.Cars_Power = Lerp(0.2, ent.Cars_Power or -6.7, Pwr)
				ent:SetPoseParameter("boost_gauge", ent.Cars_Power)
			end
		end
	end)
	hook.Add("Think", "TDMBoost_GTR", function()
		for _, ent in pairs(ents.FindByClass("prop_vehicle_jeep*")) do
			if ent:GetModel() == "models/tdmcars/nissan_gtr.mdl" then
				local Pwr = 1.5
				if IsValid(ent:GetDriver()) then
					if ent:GetDriver():KeyDown(IN_FORWARD) then Pwr = 10 end
				end
				ent.Cars_Power = Lerp(0.2, ent.Cars_Power or 1.5, Pwr)
				ent:SetPoseParameter("boost_gauge", ent.Cars_Power)
			end
		end
	end)
	hook.Add("Think", "TDMLeaf", function()
		for _, ent in pairs(ents.FindByClass("prop_vehicle_jeep*")) do
			if ent:GetModel() == "models/tdmcars/nis_leaf.mdl" then
				local thrtl = 0
				local brk = 0
				if IsValid(ent:GetDriver()) then
					if ent:GetDriver():KeyDown(IN_FORWARD) then thrtl = 1 end
					if ent:GetDriver():KeyDown(IN_BACK) then brk = 1 end
				end
				ent.Leaf_thrtl = Lerp(0.03, ent.Leaf_thrtl or 1, thrtl)
				ent:SetPoseParameter("throttle_pose", ent.Leaf_thrtl)
				ent.Leaf_brk = Lerp(0.07, ent.Leaf_brk or 1, brk)
				ent:SetPoseParameter("brake_pose", ent.Leaf_brk)
			end
		end
	end)
end
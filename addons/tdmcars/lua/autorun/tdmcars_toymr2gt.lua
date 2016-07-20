
-----------------------------------------------------
local V = {
			Name = "Toyota MR2 GT", 
			Class = "prop_vehicle_jeep",
			Category = "TDM Cars",
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable Toyota MR2 GT by TheDanishMaster",
				Model = "models/tdmcars/toy_mr2gt.mdl",
				KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/mr2gt.txt"
							}
			}
list.Set("Vehicles", "mr2gttdm", V)
 if SERVER then
hook.Add("Think", "TDMBoost_MR2GT", function()
for _, ent in pairs(ents.FindByClass("prop_vehicle_jeep*")) do
if ent:GetModel() == "models/tdmcars/toy_mr2gt.mdl" then
local Pwr = 0
if IsValid(ent:GetDriver()) then
if ent:GetDriver():KeyDown(IN_FORWARD) then Pwr = 1 end
end
ent.Cars_Power = Lerp(0.2, ent.Cars_Power or 0, Pwr)
ent:SetPoseParameter("boost_gauge", ent.Cars_Power)
end
end
end)
end
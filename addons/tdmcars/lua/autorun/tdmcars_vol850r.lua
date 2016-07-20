
-----------------------------------------------------
local V = {
			Name = "Volvo 850 R", 
			Class = "prop_vehicle_jeep",
			Category = "TDM Cars",
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable Volvo 850 R by TheDanishMaster",
				Model = "models/tdmcars/vol_850r.mdl",
							KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/850r.txt"
							}
			}
list.Set("Vehicles", "vol850rtdm", V)
 if SERVER then
hook.Add("Think", "TDMBoost_850R", function()
for _, ent in pairs(ents.FindByClass("prop_vehicle_jeep*")) do
if ent:GetModel() == "models/tdmcars/vol_850r.mdl" then
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
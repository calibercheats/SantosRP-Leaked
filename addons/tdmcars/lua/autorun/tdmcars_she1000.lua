
-----------------------------------------------------
local V = {
			Name = "Shelby 1000", 
			Class = "prop_vehicle_jeep",
			Category = "TDM Cars",
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable Shelby 1000 by TheDanishMaster",
			Model = "models/tdmcars/she_1000.mdl",					
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/she1000.txt"
							}
			}
list.Set("Vehicles", "she1000tdm", V)
 if SERVER then
hook.Add("Think", "TDMBoost_Shelby1000", function()
for _, ent in pairs(ents.FindByClass("prop_vehicle_jeep*")) do
if ent:GetModel() == "models/tdmcars/she_1000.mdl" then
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
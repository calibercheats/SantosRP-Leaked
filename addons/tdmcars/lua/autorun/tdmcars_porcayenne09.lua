
-----------------------------------------------------
local V = {
			Name = "Porsche Cayenne Turbo S", 
			Class = "prop_vehicle_jeep",
			Category = "TDM Cars",
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable Porsche Cayenne Turbo S by TheDanishMaster",
			Model = "models/tdmcars/cayenne.mdl",
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/cayenne.txt"
							}
			}
list.Set("Vehicles", "cayennetdm", V)
 if SERVER then
hook.Add("Think", "TDMBoost_CAYENNE09", function()
for _, ent in pairs(ents.FindByClass("prop_vehicle_jeep")) do
if ent:GetModel() == "models/tdmcars/cayenne.mdl" then
local Pwr = 0.0
if IsValid(ent:GetDriver()) then
if ent:GetDriver():KeyDown(IN_FORWARD) then Pwr = 10 end
end
ent.Cars_Power = Lerp(0.2, ent.Cars_Power or 0.0, Pwr)
ent:SetPoseParameter("boost_gauge", ent.Cars_Power)
end
end
end)
end
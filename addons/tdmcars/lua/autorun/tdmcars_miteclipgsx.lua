
-----------------------------------------------------
local V = {
			Name = "Mitsubishi Eclipse GSX", 
			Class = "prop_vehicle_jeep",
			Category = "TDM Cars",
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable Mitsubishi Eclipse GSX by TheDanishMaster",
			Model = "models/tdmcars/mit_eclipsegsx.mdl",
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/mit_eclipsegsx.txt"
							}
			}
list.Set("Vehicles", "mit_eclipsegsxtdm", V)
 if SERVER then
hook.Add("Think", "TDMBoost_EclipseGSX", function()
for _, ent in pairs(ents.FindByClass("prop_vehicle_jeep*")) do
if ent:GetModel() == "models/tdmcars/mit_eclipsegsx.mdl" then
local Pwr = 0
if IsValid(ent:GetDriver()) then
if ent:GetDriver():KeyDown(IN_FORWARD) then Pwr = 10 end
end
ent.Cars_Power = Lerp(0.05, ent.Cars_Power or 0, Pwr)
ent:SetPoseParameter("boost_gauge", ent.Cars_Power)
end
end
end)
end
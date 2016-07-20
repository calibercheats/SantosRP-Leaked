
-----------------------------------------------------
local V = {
			Name = "Volvo 242 Turbo", 
			Class = "prop_vehicle_jeep",
			Category = "TDM Cars",
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable Volvo 242 Turbo by TheDanishMaster",
			Model = "models/tdmcars/242turbo.mdl",
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/tdmcars/242turbo.txt"
							}
			}
list.Set("Vehicles", "242turbotdm", V)
 if SERVER then
hook.Add("Think", "TDMBoost_242Turbo", function()
for _, ent in pairs(ents.FindByClass("prop_vehicle_jeep*")) do
if ent:GetModel() == "models/tdmcars/242turbo.mdl" then
local Pwr = 0
if IsValid(ent:GetDriver()) then
if ent:GetDriver():KeyDown(IN_FORWARD) then Pwr = 1 end
end
ent.Cars_Power = Lerp(0.07, ent.Cars_Power or 0, Pwr)
ent:SetPoseParameter("boost_gauge", ent.Cars_Power)
end
end
end)
end
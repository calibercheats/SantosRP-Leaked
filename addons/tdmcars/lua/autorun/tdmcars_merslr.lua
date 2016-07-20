
-----------------------------------------------------
local V = {
			Name = "Mercedes McLaren SLR", 
			Class = "prop_vehicle_jeep",
			Category = "TDM Cars",
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable Mercedes McLaren SLR by TheDanishMaster",
			Model = "models/tdmcars/mer_slr.mdl",
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/mer_slr.txt"
							}
			}
list.Set("Vehicles", "mer_slrtdm", V)
 if SERVER then
hook.Add("Think", "TDMAirbrake_MerSLR", function()
for _, ent in pairs(ents.FindByClass("prop_vehicle_jeep*")) do
if ent:GetModel() == "models/tdmcars/mer_slr.mdl" then
local AirBrk = 0
if IsValid(ent:GetDriver()) then
if ent:GetDriver():KeyDown(IN_BACK) and ent:GetVelocity():Length() > 800 then AirBrk = 1 end
end
ent.AirBrake = Lerp(0.2, ent.AirBrake or 1, AirBrk)
ent:SetPoseParameter("airbrake_pose", ent.AirBrake)
end
end
end)
end
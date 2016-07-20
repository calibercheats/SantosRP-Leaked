
-----------------------------------------------------
local V = {
			Name = "McLaren P1", 
			Class = "prop_vehicle_jeep",
			Category = "TDM Cars",
			Author = "TheDanishMaster, Criterion",
			Information = "A drivable McLaren P1 by TheDanishMaster",
				Model = "models/tdmcars/mclaren_p1.mdl",
							KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/mclarenp1.txt"
							}
			}
list.Set("Vehicles", "p1tdm", V)
 if SERVER then
hook.Add("Think", "TDMP1_Spoiler", function()
for _, ent in pairs(ents.FindByClass("prop_vehicle_jeep*")) do
if ent:GetModel() == "models/tdmcars/mclaren_p1.mdl" then
local Spoil = 0
if IsValid(ent:GetDriver()) then
Spoil = 1
end
ent.SpoilerPos = Lerp(0.02, ent.SpoilerPos or 0, Spoil)
ent:SetPoseParameter("spoiler", ent.SpoilerPos)
end
end
end)
hook.Add("Think", "TDMAirbrake_P1", function()
for _, ent in pairs(ents.FindByClass("prop_vehicle_jeep*")) do
if ent:GetModel() == "models/tdmcars/mclaren_p1.mdl" then
local AirBrk = 0
if IsValid(ent:GetDriver()) then
if ent:GetDriver():KeyDown(IN_BACK) and ent:GetVelocity():Length() > 850 then AirBrk = 1 end
end
ent.AirBrake = Lerp(0.13, ent.AirBrake or 1, AirBrk)
ent:SetPoseParameter("airbrake", ent.AirBrake)
end
end
end)
end
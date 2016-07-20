
-----------------------------------------------------
 if SERVER then
hook.Add("Think", "SGM_PowerLeaf_Think", function()
for _, ent in pairs(ents.FindByClass("prop_vehicle_jeep*")) do
if ent:GetModel() == "models/sentry/leaf.mdl" then
local Pwr = 5
if IsValid(ent:GetDriver()) then
if ent:GetDriver():KeyDown(IN_BACK) then Pwr = 0 end
if ent:GetDriver():KeyDown(IN_FORWARD) then Pwr = 14 end

if !ent:GetDriver():KeyDown(IN_BACK) and !ent:GetDriver():KeyDown(IN_FORWARD) then Pwr = 4.5 end

end
ent.Cars_Power = Lerp(0.1, ent.Cars_Power or 3, Pwr)
ent:SetBodygroup(2, ent.Cars_Power)
end
end
end)
end

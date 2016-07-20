
-----------------------------------------------------
local PrVeh = "prop_vehicle_jeep"
local Cat = "TDM Cars"

local V = {
			Name = "Pontiac Fiero GT", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable Pontiac Fiero GT by TheDanishMaster",
			Model = "models/tdmcars/pon_fierogt.mdl",
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/pon_fierogt.txt"
							}
			}
list.Set("Vehicles", "pon_fierogttdm", V)

local V = {
			Name = "Pontiac Firebird Trans Am", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable Pontiac Firebird Trans Am by TheDanishMaster",
			Model = "models/tdmcars/pon_firetransam.mdl",
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/pon_firetransam.txt",
							skin = "1",
							rendercolor = "0 0 0"
							}
			}
list.Set("Vehicles", "pon_firebirdtransamtdm", V)

if SERVER then
	hook.Add("Think", "TDMPonFiero_hlights", function()
		for _, ent in pairs(ents.FindByClass("prop_vehicle_jeep*")) do
			if ent:GetModel() == "models/tdmcars/pon_fierogt.mdl" then
				local HlightState = 0
					if IsValid(ent:GetDriver()) then
						HlightState = 1
					end
				ent.Car_Hlight = Lerp(0.07, ent.Car_Hlight or 0, HlightState)
				ent:SetPoseParameter("hlights", ent.Car_Hlight)
			end
		end
	end)
end
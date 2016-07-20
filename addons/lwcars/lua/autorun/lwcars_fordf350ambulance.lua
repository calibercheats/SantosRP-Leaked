
-----------------------------------------------------
local V = {
			Name = "Ford F350 Ambulance", 
			Class = "prop_vehicle_jeep",
			Category = "LW Emergency Vehicles",
			Author = "LoneWolfie",
			Information = "A f350 by Lonewolfie",
			Model = "models/lonewolfie/ford_f350_ambu.mdl",		
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/lwcars/ford_f350_ambu.txt"
							}
			}
list.Set("Vehicles", "ford_f350_ambu_lw", V)

if SERVER then
	i = 0
	hook.Add("KeyPress", "FordF350Doors", function()
		for _, car in pairs(ents.FindByClass("prop_vehicle_jeep*")) do
			if car:GetModel() == "models/lonewolfie/ford_f350_ambu.mdl" then
				if IsValid(car:GetDriver()) then
					if car:GetDriver():KeyDown(IN_ZOOM) then
						if toggle == 1 then toggle = 0 else toggle = 1 end
						car:SetPoseParameter("doors_opening", toggle)
					elseif car:GetDriver():KeyDown(IN_ZOOM) then
						if toggle == 1 then toggle = 0 

						end
					end
				end
			end
		end
	end) 	
	
end
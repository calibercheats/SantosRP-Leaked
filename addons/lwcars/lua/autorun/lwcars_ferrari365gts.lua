
-----------------------------------------------------
local V = {
			Name = "Ferrari 365 GTS/4", 
			Class = "prop_vehicle_jeep",
			Category = "LW Cars",
			Author = "LoneWolfie",
			Information = "Driveable fef by LoneWolfie",
			Model = "models/LoneWolfie/ferrari_365gts.mdl",
					
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/ferrari_365gts.txt"
							}
			}
list.Set("Vehicles", "ferrari_365gts_lw", V)

if SERVER then
        i = 0	
        hook.Add("KeyPress", "popups_365gts_lw", function(ply, key)
                if ply:InVehicle() then
                        car = ply:GetVehicle()
                        if car:GetModel() == "models/lonewolfie/ferrari_365gts.mdl" then
                                        if key == IN_SPEED then
                                                if toggle == 1 then toggle = 0
                                                        timer.Destroy("popuplightsdown" .. tostring(car:EntIndex()) )
														timer.Create("popuplightsup" .. tostring(car:EntIndex()) , 0.02, 0, function()

                                                                if car:GetPoseParameter("pop_ups") >= 1 then --Lights on
                                                                        car:SetPoseParameter("pop_ups", 1)
                                                                        timer.Destroy("popuplightsup" .. tostring(car:EntIndex()) )
                                                                else
                                                                        car:SetPoseParameter("pop_ups", car:GetPoseParameter("pop_ups") + 0.02)
                                                                end
                                                        end)
                                                else toggle = 1
                                                        timer.Destroy("popuplightsup" .. tostring(car:EntIndex()) )
														timer.Create("popuplightsdown" .. tostring(car:EntIndex()) , 0.02, 0, function()

                                                                if car:GetPoseParameter("pop_ups") <= 0 then --Lights off
                                                                        car:SetPoseParameter("pop_ups", 0)
                                                                        timer.Destroy("popuplightsdown" .. tostring(car:EntIndex()) )
                                                                else
                                                                        car:SetPoseParameter("pop_ups", car:GetPoseParameter("pop_ups") - 0.02)
                                                                end
                                                        end)
                                                end
                                        end
                        end
                end
        end)
end
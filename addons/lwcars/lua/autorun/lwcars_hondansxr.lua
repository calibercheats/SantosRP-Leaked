
-----------------------------------------------------
local V = {
			Name = "Honda NSX-R NA1", 
			Class = "prop_vehicle_jeep",
			Category = "LW Cars",
			Author = "LoneWolfie",
			Information = "Driveable fef by LoneWolfie",
			Model = "models/LoneWolfie/honda_nsxr.mdl",
					
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/honda_nsxr.txt"
							}
			}
list.Set("Vehicles", "honda_nsxr_lw", V)

if SERVER then
        i = 0
        hook.Add("KeyPress", "NSXPopupslw", function(ply, key)
                if ply:InVehicle() then
                        car = ply:GetVehicle()
                        if car:GetModel() == "models/lonewolfie/honda_nsxr.mdl" then
                                        if key == IN_SPEED then
                                                if toggle == 1 then toggle = 0
                                                        timer.Destroy("popuplightsdown" .. tostring(car:EntIndex()) )
														timer.Create("popuplightsup" .. tostring(car:EntIndex()) , 0.02, 0, function()

                                                                if car:GetPoseParameter("pop_up") >= 1 then --Lights on
                                                                        car:SetPoseParameter("pop_up", 1)
                                                                        timer.Destroy("popuplightsup" .. tostring(car:EntIndex()) )
                                                                else
                                                                        car:SetPoseParameter("pop_up", car:GetPoseParameter("pop_up") + 0.02)
                                                                end
                                                        end)
                                                else toggle = 1
                                                        timer.Destroy("popuplightsup" .. tostring(car:EntIndex()) )
														timer.Create("popuplightsdown" .. tostring(car:EntIndex()) , 0.02, 0, function()

                                                                if car:GetPoseParameter("pop_up") <= 0 then --Lights off
                                                                        car:SetPoseParameter("pop_up", 0)
                                                                        timer.Destroy("popuplightsdown" .. tostring(car:EntIndex()) )
                                                                else
                                                                        car:SetPoseParameter("pop_up", car:GetPoseParameter("pop_up") - 0.02)
                                                                end
                                                        end)
                                                end
                                        end
                        end
                end
        end)
end

-----------------------------------------------------
local V = {
			Name = "Ferrari F40", 
			Class = "prop_vehicle_jeep",
			Category = "LW Cars",
			Author = "LoneWolfie",
			Information = "Driveable Ferrari F40 by LoneWolfie",
			Model = "models/LoneWolfie/ferrari_f40.mdl",
			
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/ferrari_f40.txt"
							}
			}
list.Set("Vehicles", "ferrari_f40_lw", V)

if SERVER then
        i = 0		
        hook.Add("KeyPress", "footbrake_appl_f40_lw", function(ply, key)
                        if ply:InVehicle() then
                                car = ply:GetVehicle()
                if car:GetModel() == "models/lonewolfie/ferrari_f40.mdl" then
                    if key == IN_BACK then                
                        car:SetPoseParameter("footbrake", 1)
                    end
                end
            end
        end)
                hook.Add("KeyRelease", "footbrake_rel_f40_lw", function(ply, key)
            if ply:InVehicle() then
                                car = ply:GetVehicle()
                if car:GetModel() == "models/lonewolfie/ferrari_f40.mdl" then
                    if key == IN_BACK then                
                        car:SetPoseParameter("footbrake", 0)
                    end
                end
            end
        end)	

        hook.Add("KeyPress", "handbrake_app_f40_lw", function(ply, key)
                        if ply:InVehicle() then
                                car = ply:GetVehicle()
                if car:GetModel() == "models/lonewolfie/ferrari_f40.mdl" then
                    if key == IN_JUMP then                
                        car:SetPoseParameter("handbrake", 1)
                    end
                end
            end
        end)
                hook.Add("KeyRelease", "handbrake_rel_f40_lw", function(ply, key)
            if ply:InVehicle() then
                                car = ply:GetVehicle()
                if car:GetModel() == "models/lonewolfie/ferrari_f40.mdl" then
                    if key == IN_JUMP then                
                        car:SetPoseParameter("handbrake", 0)
                    end
                end
            end
        end)

        hook.Add("KeyPress", "popups_f40_lw", function(ply, key)
                if ply:InVehicle() then
                        car = ply:GetVehicle()
                        if car:GetModel() == "models/lonewolfie/ferrari_f40.mdl" then
                                        if key == IN_SPEED then
                                                if toggle == 1 then toggle = 0
                                                        timer.Destroy("popuplightsdown" .. tostring(car:EntIndex()) )
														timer.Create("popuplightsup" .. tostring(car:EntIndex()) , 0.02, 0, function()

                                                                if car:GetPoseParameter("headlights") >= 1 then --Lights on
                                                                        car:SetPoseParameter("headlights", 1)
                                                                        timer.Destroy("popuplightsup" .. tostring(car:EntIndex()) )
                                                                else
                                                                        car:SetPoseParameter("headlights", car:GetPoseParameter("headlights") + 0.02)
                                                                end
                                                        end)
                                                else toggle = 1
                                                        timer.Destroy("popuplightsup" .. tostring(car:EntIndex()) )
														timer.Create("popuplightsdown" .. tostring(car:EntIndex()) , 0.02, 0, function()

                                                                if car:GetPoseParameter("headlights") <= 0 then --Lights off
                                                                        car:SetPoseParameter("headlights", 0)
                                                                        timer.Destroy("popuplightsdown" .. tostring(car:EntIndex()) )
                                                                else
                                                                        car:SetPoseParameter("headlights", car:GetPoseParameter("headlights") - 0.02)
                                                                end
                                                        end)
                                                end
                                        end
                        end
                end
        end)
end
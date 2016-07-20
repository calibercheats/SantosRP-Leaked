
-----------------------------------------------------
local V = {
			Name = "Mercedes Benz SLK 55 AMG", 
			Class = "prop_vehicle_jeep",
			Category = "LW Cars",
			Author = "LoneWolfie",
			Information = "Driveable fef by LoneWolfie",
			Model = "models/LoneWolfie/mercedes_slk55_amg.mdl",
					
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/mercedes_slk55_amg.txt"
							}
			}
list.Set("Vehicles", "mercedes_slk55_lw", V)

if SERVER then
        i = 0
        hook.Add("KeyPress", "slkrooflw", function(ply, key)
                if ply:InVehicle() then
                        car = ply:GetVehicle()
                        if car:GetModel() == "models/lonewolfie/mercedes_slk55_amg.mdl" then
                                        if key == IN_SPEED then
                                                if toggle == 1 then toggle = 0
                                                        timer.Destroy("roofdown" .. tostring(car:EntIndex()) )
														timer.Create("roofup" .. tostring(car:EntIndex()) , 0.001, 0, function()

                                                                if car:GetPoseParameter("roof_ani") >= 1 then --Lights on
                                                                        car:SetPoseParameter("roof_ani", 1)
                                                                        timer.Destroy("roofup" .. tostring(car:EntIndex()) )
                                                                else
                                                                        car:SetPoseParameter("roof_ani", car:GetPoseParameter("roof_ani") + 0.001)
                                                                end
                                                        end)
                                                else toggle = 1
                                                        timer.Destroy("roofup" .. tostring(car:EntIndex()) )
														timer.Create("roofdown" .. tostring(car:EntIndex()) , 0.001, 0, function()

                                                                if car:GetPoseParameter("roof_ani") <= 0 then --Lights off
                                                                        car:SetPoseParameter("roof_ani", 0)
                                                                        timer.Destroy("roofdown" .. tostring(car:EntIndex()) )
                                                                else
                                                                        car:SetPoseParameter("roof_ani", car:GetPoseParameter("roof_ani") - 0.001)
                                                                end
                                                        end)
                                                end
                                        end
                        end
                end
        end)
		
        hook.Add("KeyPress", "slk55brakelw", function(ply, key)
                        if ply:InVehicle() then
                                car = ply:GetVehicle()
                if car:GetModel() == "models/lonewolfie/mercedes_slk55_amg.mdl" then
                    if key == IN_BACK then                
                        car:SetPoseParameter("brake", 1)
                    end
                end
            end
        end)
                hook.Add("KeyRelease", "slkbrakereleaselw", function(ply, key)
            if ply:InVehicle() then
                                car = ply:GetVehicle()
                if car:GetModel() == "models/lonewolfie/mercedes_slk55_amg.mdl" then
                    if key == IN_BACK then                
                        car:SetPoseParameter("brake", 0)
                    end
                end
            end
        end)		
		

		
        hook.Add("KeyPress", "slk55accellw", function(ply, key)
                        if ply:InVehicle() then
                                car = ply:GetVehicle()
                if car:GetModel() == "models/lonewolfie/mercedes_slk55_amg.mdl" then
                    if key == IN_FORWARD then                
                        car:SetPoseParameter("accel", 1)
                    end
                end
            end
        end)
                hook.Add("KeyRelease", "slkaccelreleaselw", function(ply, key)
            if ply:InVehicle() then
                                car = ply:GetVehicle()
                if car:GetModel() == "models/lonewolfie/mercedes_slk55_amg.mdl" then
                    if key == IN_FORWARD then                
                        car:SetPoseParameter("accel", 0)
                    end
                end
            end
        end)			
		
end
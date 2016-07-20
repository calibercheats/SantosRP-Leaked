
-----------------------------------------------------
local V = {
			Name = "Bentley 4 1/2 Liter Blower", 
			Class = "prop_vehicle_jeep",
			Category = "LW Cars",
			Author = "LoneWolfie",
			Information = "Driveable fef by LoneWolfie",
			Model = "models/LoneWolfie/bentley_blower.mdl",
					
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/bentley_blower.txt"
							}
			}
list.Set("Vehicles", "bentley_blower_lw", V)

        if SERVER then
        i = 0
        hook.Add("KeyPress", "BlowerHandbrakeP", function(ply, key)
                        if ply:InVehicle() then
                                car = ply:GetVehicle()
                if car:GetModel() == "models/lonewolfie/bentley_blower.mdl" then
                    if key == IN_JUMP then                
                        car:SetPoseParameter("handbrake", 1)
                    end
                end
            end
        end)
                hook.Add("KeyRelease", "BlowerHandbrakeR", function(ply, key)
            if ply:InVehicle() then
                                car = ply:GetVehicle()
                if car:GetModel() == "models/lonewolfie/bentley_blower.mdl" then
                    if key == IN_JUMP then                
                        car:SetPoseParameter("handbrake", 0)
                    end
                end
            end
        end)
               
        end
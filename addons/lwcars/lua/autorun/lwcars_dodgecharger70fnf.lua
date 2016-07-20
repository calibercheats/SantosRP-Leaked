
-----------------------------------------------------
local V = {
			Name = "Dodge Charger 70 Fast and Furious Edition", 
			Class = "prop_vehicle_jeep",
			Category = "LW Cars",
			Author = "LoneWolfie",
			Information = "Driveable fef by LoneWolfie",
			Model = "models/LoneWolfie/dod_charger_70_fnf.mdl",
					
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/dodge_charger_70_fnf.txt"
							}
			}
list.Set("Vehicles", "dodge_charger_70_fnf_lw", V)

if SERVER then
        i = 0
        hook.Add("KeyPress", "fnfchargerlw_throttleon", function(ply, key)
                        if ply:InVehicle() then
                            car = ply:GetVehicle()
								if car:GetModel() == "models/lonewolfie/dod_charger_70_fnf.mdl" then
									if key == IN_FORWARD then 
										car:SetPoseParameter("throttle", 1)
                    end
                end
            end
        end)      
        hook.Add("KeyRelease", "fnfchargerlw_throttleoff", function(ply, key)
						if ply:InVehicle() then
                            car = ply:GetVehicle()
								if car:GetModel() == "models/lonewolfie/dod_charger_70_fnf.mdl" then
									if key == IN_FORWARD then                
										car:SetPoseParameter("throttle", 0)										
                    end
                end
            end
        end)		
	 
		hook.Add("KeyPress", "fnfchargerlw_handbrakeon", function(ply, key)
                        if ply:InVehicle() then
                            car = ply:GetVehicle()
								if car:GetModel() == "models/lonewolfie/dod_charger_70_fnf.mdl" then
									if key == IN_JUMP then                
										car:SetPoseParameter("handbrake", 1)
                    end
                end
            end
        end)      
        hook.Add("KeyRelease", "fnfchargerlw_handbrakeoff", function(ply, key)
						if ply:InVehicle() then
                            car = ply:GetVehicle()
								if car:GetModel() == "models/lonewolfie/dod_charger_70_fnf.mdl" then
									if key == IN_JUMP then                
										car:SetPoseParameter("handbrake", 0)
                    end
                end
            end
        end)			
 end

-----------------------------------------------------
local PrVeh = "prop_vehicle_jeep"
local Cat = "TDM Cars"

local V = {
			Name = "Volkswagen Golf MKII", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Turn 10",
			Information = "The good old VW Golf MKII, gmod-able by TDM",
			Model = "models/tdmcars/golf_mk2.mdl",
			KeyValues = {
						vehiclescript	=	"scripts/vehicles/TDMCars/golfmk2.txt"
						}
			}
list.Set("Vehicles", "golfmk2tdm", V)

local V = {
			Name = "Volkswagen Golf VR6 GTi", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable VW Golf MK3 by TheDanishMaster",
			Model = "models/tdmcars/golfvr6_mk3.mdl",
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/golfvr6.txt"
							}
			}
list.Set("Vehicles", "golfvr6tdm", V)

local V = {
			Name = "Volkswagen Golf R32", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable VW Golf R32 by TheDanishMaster",
			Model = "models/tdmcars/vw_golfr32.mdl",
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/vw_golfr32.txt"
							}
			}
list.Set("Vehicles", "vw_golfr32tdm", V)

local V = {
			Name = "Volkswagen Golf GTI 2014", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Ubisoft",
			Information = "The Volkswagen Golf GTI 2014, gmod-able by TDM",
			Model = "models/tdmcars/vw_golfgti_14.mdl",
			KeyValues = {
						vehiclescript	=	"scripts/vehicles/TDMCars/vw_golfgti_14.txt"
						}
			}
list.Set("Vehicles", "vwgolfgti14tdm", V)

local V = {
			Name = "Volkswagen Camper 1965", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Ubisoft",
			Information = "The Volkswagen Camper 1965, gmod-able by TDM",
			Model = "models/tdmcars/vw_camper65.mdl",
			KeyValues = {
						vehiclescript	=	"scripts/vehicles/TDMCars/vwcamper.txt"
						}
			}
list.Set("Vehicles", "vwcampertdm", V)

local V = {
			Name = "Volkswagen Scirocco R", 
			Class = "prop_vehicle_jeep",
			Category = "TDM Cars",
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable Volkswagen Scirocco R by TheDanishMaster",
			Model = "models/tdmcars/vw_sciroccor.mdl",
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/sciroccor.txt"
							}
			}
list.Set("Vehicles", "vwsciroccortdm", V)

local V = {
			Name = "Volkswagen New Beetle Convertible", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Ubisoft",
			Information = "The Volkswagen New Beetle Convertible, gmod-able by TDM",
			Model = "models/tdmcars/vw_beetleconv.mdl",
			KeyValues = {
						vehiclescript	=	"scripts/vehicles/TDMCars/vwbeetleconv.txt"
						}
			}
list.Set("Vehicles", "vwbeetleconvtdm", V)




































if SERVER then
local i = 0
local ToggleIt = true
local function TDMBeetleRoof(ply,key)
        for k,v in pairs(ents.FindByClass("prop_vehicle_jeep*")) do
                        if v:GetModel() == "models/tdmcars/vw_beetleconv.mdl" then
                if IsValid(v:GetDriver()) then
                        if (key == IN_RIGHT) then
							if v:GetVelocity():Length() < 550 then
                                if ToggleIt then
                                                                timer.Create( "open", 0.01, 500, function()
                                                                        i = i + 0.02
                                                                        v:SetPoseParameter("roof_pose", i)
                                                                end)
                                                                timer.Destroy("close")
                                                                ToggleIt = false
                                                                else
                                                                timer.Create("close",0.01, 500, function()
                                                                        i = i - 0.02
                                                                        v:SetPoseParameter("roof_pose", i)
                                                                end)
                                                                ToggleIt = true
                                                                timer.Destroy("open")
																end
                              end
                        end
                end
                        end
                end
        end
hook.Add("KeyPress", "TDMBeetle_Roof", TDMBeetleRoof)
end
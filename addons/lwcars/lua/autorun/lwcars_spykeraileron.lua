
-----------------------------------------------------
local V = {
			Name = "Spyker C8 Aileron", 
			Class = "prop_vehicle_jeep",
			Category = "LW Cars",
			Author = "LoneWolfie",
			Information = "Driveable Spyker C8 Aileron by LoneWolfie",
			Model = "models/LoneWolfie/Spyker_Aileron.mdl",
					VC_ExtraSeats = { //Can be an infinite amount of seats, Pos and ExitPos can be a simple Vector() or an attachment name, other options are self explanatory.
						{Pos = Vector(16.4, -4.8, 18), Ang = Angle(0, 0, 8), EnterRange = 80, ExitAng = Angle(0, -90, 0), Model = "models/props_phx/carseat2.mdl", ModelOffset = Vector(0, 0, 0), Hide = true, DoorSounds = true, RadioControl = true},

	
	
	
	
	},	
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/LWCars/Spyker_Aileron.txt"
							}
			}
list.Set("Vehicles", "spyker_aileron", V)
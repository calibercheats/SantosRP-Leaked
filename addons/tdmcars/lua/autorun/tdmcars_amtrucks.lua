
-----------------------------------------------------
local V = {
			Name = "Freightliner Argosy", 
			Class = "prop_vehicle_jeep",
			Category = "TDM Trucks",
			Author = "TheDanishMaster, SCS Software",
			Information = "A drivable Freightliner Argosy by TheDanishMaster",
				Model = "models/tdmcars/trucks/freight_argosy.mdl",
							KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/frghtlnr_argosy.txt"
							}
			}
list.Set("Vehicles", "fgtargsytdm", V)

local V = {
			Name = "Peterbilt 579", 
			Class = "prop_vehicle_jeep",
			Category = "TDM Trucks",
			Author = "TheDanishMaster, SCS Software",
			Information = "A drivable Peterbilt 579 by TheDanishMaster",
				Model = "models/tdmcars/trucks/peterbilt_579.mdl",
							KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/peterbilt_579.txt"
							}
			}
list.Set("Vehicles", "peterbilt_579tdm", V)

local V = {
			Name = "Peterbilt 579 Medium cab", 
			Class = "prop_vehicle_jeep",
			Category = "TDM Trucks",
			Author = "TheDanishMaster, SCS Software",
			Information = "A drivable Peterbilt 579 by TheDanishMaster",
				Model = "models/tdmcars/trucks/peterbilt_579_med.mdl",
							KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/peterbilt_579.txt"
							}
			}
list.Set("Vehicles", "peterbilt_579medtdm", V)

local V = {
			Name = "Kenworth T800", 
			Class = "prop_vehicle_jeep",
			Category = "TDM Trucks",
			Author = "TheDanishMaster, SCS Software",
			Information = "A drivable Kenworth T800 by TheDanishMaster",
			Model = "models/tdmcars/trucks/kenworth_t800.mdl",		
			KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/kwt800.txt"
							}
			}
list.Set("Vehicles", "kwt800tdm", V)

sound.Add( 
{
    name = "tdm_truckdoor_open",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 90,
    sound = "vehicles/tdmcars/miscsounds/truck_open.wav"
} )
sound.Add( 
{
    name = "tdm_truckdoor_close",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 90,
    sound = "vehicles/tdmcars/miscsounds/truck_close.wav"
} )
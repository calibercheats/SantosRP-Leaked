
-----------------------------------------------------
AddCSLuaFile("autorun/sw_bus.lua")
--[[
Model("models/sligwolf/bus/bus.mdl")
Model("models/sligwolf/bus/bus_doors.mdl")
Model("models/sligwolf/bus_bendi/bus_back.mdl")
Model("models/sligwolf/bus_bendi/bus_bendi.mdl")
Model("models/sligwolf/bus_bendi/bus_doors.mdl")
Model("models/sligwolf/bus_bendi/bus_front.mdl")
]]--
sound.Add(
{
	name = "Sw_BusDoor.Start",
	channel = CHAN_STATIC,
	volume = 0.99,
	soundlevel = 90,
	sound = "vehicles/sligwolf/bus/door/open.wav"
} )

sound.Add(
{
	name = "Sw_BusDoor.End",
	channel = CHAN_WEAPON,
	volume = 0.99,
	soundlevel = 90,
	sound = "vehicles/sligwolf/bus/door/closed2.wav"
} )

sound.Add( 
{
    name = "BUS_engine_idle",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "vehicles/sligwolf/bus/BUS_idle_loop1.wav"
} )

sound.Add( 
{
    name = "BUS_engine_null",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "common/null.wav"
} )

sound.Add( 
{
    name = "BUS_engine_start",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "vehicles/sligwolf/bus/BUS_start_loop1.wav"
} )

sound.Add( 
{
    name = "BUS_engine_stop",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "vehicles/sligwolf/bus/BUS_stop1.wav"
} )

sound.Add( 
{
    name = "BUS_rev",
    channel = CHAN_STATIC,
    volume = 0.9,
    soundlevel = 80,
    pitchstart = 98,
	pitchend = 105,
    sound = "vehicles/sligwolf/bus/BUS_rev_short_loop1.wav"
} )

sound.Add( 
{
    name = "BUS_reverse",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    pitchstart = 100,
    sound = "vehicles/sligwolf/bus/BUS_firstgear_rev_loop1.wav"
} )

sound.Add( 
{
    name = "BUS_firstgear",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    pitchstart = 100,
    sound = "vehicles/sligwolf/bus/BUS_first.wav"
} )

sound.Add( 
{
    name = "BUS_secondgear",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    pitchstart = 90,
    pitchend = 105,
    sound = "vehicles/sligwolf/bus/BUS_second.wav"
} )

sound.Add( 
{
    name = "BUS_thirdgear",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    pitchstart = 90,
    pitchend = 105,
    sound = "vehicles/sligwolf/bus/BUS_third.wav"
} )

sound.Add( 
{
    name = "BUS_fourthgear",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    pitchstart = 105,
    pitchend = 105,
    sound = "vehicles/sligwolf/bus/BUS_fourth_cruise_loop2.wav"
} )

sound.Add( 
{
    name = "BUS_firstgear_noshift",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    pitchstart = 105,
    pitchend = 105,
    sound = "vehicles/sligwolf/bus/BUS_first.wav"
} )

sound.Add( 
{
    name = "BUS_secondgear_noshift",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    pitchstart = 105,
    pitchend = 105,
    sound = "vehicles/sligwolf/bus/BUS_first.wav"
} )

sound.Add( 
{
    name = "BUS_thirdgear_noshift",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    pitchstart = 105,
    pitchend = 105,
    sound = "vehicles/sligwolf/bus/BUS_first.wav"
} )

sound.Add( 
{
    name = "BUS_fourthgear_noshift",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    pitchstart = 105,
    pitchend = 105,
    sound = "vehicles/sligwolf/bus/BUS_fourth_cruise_loop2.wav"
} )

sound.Add( 
{
    name = "BUS_downshift_to_2nd",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    pitchstart = 90,
    pitchend = 105,
    sound = "vehicles/sligwolf/bus/BUS_first_rev.wav"
} )

sound.Add( 
{
    name = "BUS_downshift_to_1st",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    pitchstart = 90,
    pitchend = 105,
    sound = "vehicles/sligwolf/bus/BUS_first_rev.wav"
} )

sound.Add( 
{
    name = "BUS_throttleoff_slowspeed",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    pitchstart = 90,
    pitchend = 105,
    sound = "vehicles/sligwolf/bus/BUS_throttle_off_slow_loop2.wav"
} )

sound.Add( 
{
    name = "BUS_throttleoff_fastspeed",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    pitchstart = 90,
    pitchend = 105,
    sound = "vehicles/sligwolf/bus/BUS_throttle_off_fast_loop1.wav"
} )

sound.Add( 
{
    name = "BUS_skid_lowfriction",
    channel = CHAN_BODY,
    volume = 1.0,
    soundlevel = 80,
    pitchstart = 90,
    pitchend = 110,
    sound = "vehicles/v8/skid_lowfriction.wav"
} )

sound.Add( 
{
    name = "BUS_skid_normalfriction",
    channel = CHAN_BODY,
    volume = 1.0,
    soundlevel = 80,
    pitchstart = 90,
    pitchend = 110,
    sound = "vehicles/v8/skid_normalfriction.wav"
} )

sound.Add( 
{
    name = "BUS_skid_highfriction",
    channel = CHAN_BODY,
    volume = 1.0,
    soundlevel = 80,
    pitchstart = 90,
    pitchend = 110,
    sound = "vehicles/v8/skid_highfriction.wav"
} )

sound.Add( 
{
    name = "BUS_impact_heavy",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    pitchstart = 95,
    pitchend = 110,
    sound = {"vehicles/v8/vehicle_impact_heavy1.wav",
	        "vehicles/v8/vehicle_impact_heavy2.wav",
			"vehicles/v8/vehicle_impact_heavy3.wav",
			"vehicles/v8/vehicle_impact_heavy4.wav"}
} )

sound.Add( 
{
    name = "BUS_impact_medium",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    pitchstart = 95,
    pitchend = 110,
    sound = {"vehicles/v8/vehicle_impact_medium1.wav",
	        "vehicles/v8/vehicle_impact_medium2.wav",
			"vehicles/v8/vehicle_impact_medium3.wav",
			"vehicles/v8/vehicle_impact_medium4.wav"}
} )

sound.Add( 
{
    name = "BUS_rollover",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    pitchstart = 95,
    pitchend = 110,
    sound = {"vehicles/v8/vehicle_rollover1.wav",
	        "vehicles/v8/vehicle_rollover2.wav"}
} )

sound.Add( 
{
    name = "BUS_turbo_on",
    channel = CHAN_ITEM,
    volume = 1.0,
    soundlevel = 80,
    pitchstart = 90,
    pitchend = 110,
    sound = "vehicles/sligwolf/bus/BUS_turbo_on_loop1.wav"
} )

sound.Add( 
{
    name = "BUS_turbo_off",
    channel = CHAN_ITEM,
    volume = 1.0,
    soundlevel = 80,
    pitchstart = 90,
    pitchend = 110,
    sound = "vehicles/v8/v8_turbo_off.wav"
} )

sound.Add( 
{
    name = "BUS_start_in_water",
    channel = CHAN_VOICE,
    volume = 1.0,
    soundlevel = 80,
    pitchstart = 100,
    sound = "vehicles/jetski/jetski_no_gas_start.wav"
} )

sound.Add( 
{
    name = "BUS_stall_in_water",
    channel = CHAN_VOICE,
    volume = 1.0,
    soundlevel = 80,
    pitchstart = 100,
    sound = "vehicles/jetski/jetski_off.wav"
} )

local Category = "SligWolf's Vehicle's"

local V = { 	
	Name = "Bus", 
	Class = "prop_vehicle_jeep_old",
	Category = "SligWolf's Vehicle's",
	Author = "SligWolf",
	Information = "Bus made by SligWolf",
	Model = "models/sligwolf/bus/bus.mdl",
	
	SW_Bus_FLights	 = { L1 = { Pos = Vector(0,-124,35), Ang = Angle(0,90,0) } },
	SW_Bus_GlowW	 = { 
		G1 = { Pos = Vector(-31.3,-124.2,34.2), Ang = Angle(0,90,0) }, 
		G2 = { Pos = Vector(-41.5,-124.2,34.2), Ang = Angle(0,90,0) },
		G3 = { Pos = Vector(31.3,-124.2,34.2), Ang = Angle(0,90,0) }, 
		G4 = { Pos = Vector(41.5,-124.2,34.2), Ang = Angle(0,90,0) }
	},
	SW_Glass_Bus	 = { G1 = { Pos = Vector(0,0,0), Ang = Angle(0,0,0) } },
	SW_Bus_FDoor	 = { D1 = { Pos = Vector(0,0,0), Ang = Angle(0,0,0) } },
	SW_Seat_BUS1	 = { 	
		P1 = { Pos = Vector(34,-46,38), Ang = Angle(0,0,0) },
		P2 = { Pos = Vector(34,92,38), Ang = Angle(0,0,0) },
		P3 = { Pos = Vector(-34,95,38), Ang = Angle(0,180,0) },
		P4 = { Pos = Vector(34,166,38), Ang = Angle(0,0,0) },
		P5 = { Pos = Vector(0,166,38), Ang = Angle(0,0,0) },
		P6 = { Pos = Vector(-34,-44,38), Ang = Angle(0,180,0) },
		P7 = { Pos = Vector(-34,166,38), Ang = Angle(0,0,0) }	
	},
	SW_Bus_GlowR	 = { 
		G1 = { Pos = Vector(-42.5,185.4,46), Ang = Angle(0,-90,0) },
		G2 = { Pos = Vector(-37.5,185.4,46), Ang = Angle(0,-90,0) },
		G3 = { Pos = Vector(42.5,185.4,46), Ang = Angle(0,-90,0) },
		G4 = { Pos = Vector(37.5,185.4,46), Ang = Angle(0,-90,0) }
	},
	SW_Bus_Disp_Front = {
		N1 = { Pos = Vector(40.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N2 = { Pos = Vector(35.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N3 = { Pos = Vector(30.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N4 = { Pos = Vector(25.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N5 = { Pos = Vector(20.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N6 = { Pos = Vector(15.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N7 = { Pos = Vector(10.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N8 = { Pos = Vector(5.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N9 = { Pos = Vector(0.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N10 = { Pos = Vector(-4.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N11 = { Pos = Vector(-9.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N12 = { Pos = Vector(-14.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N13 = { Pos = Vector(-19.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N14 = { Pos = Vector(-24.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N15 = { Pos = Vector(-29.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N16 = { Pos = Vector(-34.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N17 = { Pos = Vector(-39.5,-120.5,110.4), Ang = Angle(82,90,0) }
	},
	SW_Bus_Disp_Back = {	
		N1 = { Pos = Vector(-5.5,179.9,110.4), Ang = Angle(80,-90,0) },
		N2 = { Pos = Vector(-0.5,179.9,110.4), Ang = Angle(80,-90,0) },
		N3 = { Pos = Vector(4.5,179.9,110.4), Ang = Angle(80,-90,0) },
	},
	
	KeyValues = {
		vehiclescript	=	"scripts/vehicles/sligwolf/sw_bus.txt",
	}
}
list.Set( "Vehicles", "sw_bus", V )

local V = { 	
	Name = "Bus - Bendi-Bus", 
	Class = "prop_vehicle_jeep_old",
	Category = "SligWolf's Vehicle's",
	Author = "SligWolf",
	Information = "Bus made by SligWolf",
	Model = "models/sligwolf/bus_bendi/bus_front.mdl",
	
	SW_Bus_FLights	 = { L1 = { Pos = Vector(0,-124,35), Ang = Angle(0,90,0) } },
	SW_Bus_GlowW	 = { 
		G1 = { Pos = Vector(-31.3,-124.2,34.2), Ang = Angle(0,90,0) }, 
		G2 = { Pos = Vector(-41.5,-124.2,34.2), Ang = Angle(0,90,0) },
		G3 = { Pos = Vector(31.3,-124.2,34.2), Ang = Angle(0,90,0) }, 
		G4 = { Pos = Vector(41.5,-124.2,34.2), Ang = Angle(0,90,0) }
	},
	SW_Glass_Bus	 = { G1 = { Pos = Vector(0,0,0), Ang = Angle(0,0,0) } },
	SW_Bus_FDoor 	 = { D1 = { Pos = Vector(0,0,0), Ang = Angle(0,0,0) } },
	SW_Seat_BUS1 	 = { 
		P1 = { Pos = Vector(34,-46,38), Ang = Angle(0,0,0) },
		P2 = { Pos = Vector(34,92,38), Ang = Angle(0,0,0) },
		P3 = { Pos = Vector(-34,95,38), Ang = Angle(0,180,0) },
		P4 = { Pos = Vector(-34,-44,38), Ang = Angle(0,180,0) }	
	},	
	SW_BusBack  	= { B1 = { Pos = Vector(0,222.95,0), Ang = Angle(0,0,0) } },
	SW_BusBendi 	= {	B1 = { Pos = Vector(0,176.5,0), Ang = Angle(0,90,0) } },	
	SW_Bus_Helper  	= { H1 = { Pos = Vector(0,322.95,15), Ang = Angle(0,0,0) } },
	SW_BackBusDoor  = { D1 = { Pos = Vector(0,222.95,0), Ang = Angle(0,0,0) } },
	SW_Glass_Bus_B 	= { G1 = { Pos = Vector(0,222.95,0), Ang = Angle(0,0,0) } },
	SW_Seat_BUS2  	= { 
		P5 = { Pos = Vector(34,310.5,38), Ang = Angle(0,0,0) },
		P6 = { Pos = Vector(-34,319.5,38), Ang = Angle(0,180,0) },
		P7 = { Pos = Vector(34,386.5,38), Ang = Angle(0,0,0) },
		P8 = { Pos = Vector(0,386.5,38), Ang = Angle(0,0,0) },
		P9 = { Pos = Vector(-34,386.5,38), Ang = Angle(0,0,0) }	
	},
	SW_BusB_GlowR	 = { 
		G1 = { Pos = Vector(-42.5,408.35,46), Ang = Angle(0,-90,0) },
		G2 = { Pos = Vector(-37.5,408.35,46), Ang = Angle(0,-90,0) },
		G3 = { Pos = Vector(42.5,408.35,46), Ang = Angle(0,-90,0) },
		G4 = { Pos = Vector(37.5,408.35,46), Ang = Angle(0,-90,0) }
	},
	SW_Bus_Disp_Front = {
		N1 = { Pos = Vector(40.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N2 = { Pos = Vector(35.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N3 = { Pos = Vector(30.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N4 = { Pos = Vector(25.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N5 = { Pos = Vector(20.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N6 = { Pos = Vector(15.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N7 = { Pos = Vector(10.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N8 = { Pos = Vector(5.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N9 = { Pos = Vector(0.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N10 = { Pos = Vector(-4.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N11 = { Pos = Vector(-9.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N12 = { Pos = Vector(-14.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N13 = { Pos = Vector(-19.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N14 = { Pos = Vector(-24.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N15 = { Pos = Vector(-29.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N16 = { Pos = Vector(-34.5,-120.5,110.4), Ang = Angle(82,90,0) },
		N17 = { Pos = Vector(-39.5,-120.5,110.4), Ang = Angle(82,90,0) }
	},
	SW_Bus_Disp_Back_B = {	
		N1 = { Pos = Vector(-5.5,403.2,110.4), Ang = Angle(80,-90,0) },
		N2 = { Pos = Vector(-0.5,403.2,110.4), Ang = Angle(80,-90,0) },
		N3 = { Pos = Vector(4.5,403.2,110.4), Ang = Angle(80,-90,0) }
	},

	KeyValues = {
		vehiclescript	=	"scripts/vehicles/sligwolf/sw_bus.txt"
	}
}
list.Set( "Vehicles", "sw_bendibus", V )

local V = {
	Name = "Bus Stop",
	Model = "models/sligwolf/bus_bendi/bus_stop_001.mdl",
	Class = "prop_vehicle_prisoner_pod",
	Category = "SligWolf's Vehicle's",
	Author = "SligWolf",
	Information = "Bus Stop made by SligWolf",
	
	SW_Seat_BUS1 	 = { 
		P1 = { Pos = Vector(16,-16,12.4), Ang = Angle(0,-90,0) },
		P2 = { Pos = Vector(16,-51,12.4), Ang = Angle(0,-90,0) },
		P3 = { Pos = Vector(16,-80,12.4), Ang = Angle(0,-90,0) },
		P4 = { Pos = Vector(16,16,12.4), Ang = Angle(0,-90,0) },
		P5 = { Pos = Vector(16,51,12.4), Ang = Angle(0,-90,0) },
		P6 = { Pos = Vector(16,80,12.4), Ang = Angle(0,-90,0) },
	},	

	KeyValues = {
		vehiclescript = "scripts/vehicles/prisoner_pod.txt"
	}
}
list.Set( "Vehicles", "sw_busstop", V )

local function MakeEnt(name, ply)
    if !IsValid(ply) then return end
    local ent = ents.Create(name)

    if !IsValid(ent) then return end
    if !ent.CPPISetOwner then return ent end

    ent:CPPISetOwner(ply)
    return ent
end

local function Check_Blocked_Parts_BUS( ent )
    if ent.__issw_is_blocked_buspart then return true end
    return false
end

local function CantTouchThis_BUS( ply, ent )
    if !IsValid(ent) then return end
    if Check_Blocked_Parts_BUS(ent) then return false end
end
hook.Add( "PhysgunPickup", "CantTouchThis_BUS", CantTouchThis_BUS )

local function SW_Bus_Display_Text( veh, ply, text )

	if !IsValid(veh) then return end
	if !IsValid(ply) then return end
	
	if veh.CPPIGetOwner then
		if veh:CPPIGetOwner() != ply then 
			ply:ChatPrint( "That's not your bus!" )
			return ""
		end
	end
	
	if !veh.VehicleTable or !veh.VehicleTable.SW_Bus_Disp_Front then return end
	if !veh.SW_Bus_Disp_Front then return end

	for k,v in pairs(veh.SW_Bus_Disp_Front) do
		if !IsValid(v) then return end
		for i = 1,17 do
			if k == "N"..i then
				v:SetMaterial("models/sligwolf/bus/display/disp_"..text[12+i])
			end
		end
	end
	if veh.VehicleTable and veh.VehicleTable.SW_Bus_Disp_Back then
		if !veh.SW_Bus_Disp_Back then return end
		for k,v in pairs(veh.SW_Bus_Disp_Back) do
			if !IsValid(v) then return end
			for i = 1,3 do
				if k == "N"..i then
					v:SetMaterial("models/sligwolf/bus/display/disp_"..text[12+i])
				end
			end
		end
	end
	if veh.VehicleTable and veh.VehicleTable.SW_Bus_Disp_Back_B then
		if !veh.SW_Bus_Disp_Back_B then return end
		for k,v in pairs(veh.SW_Bus_Disp_Back_B) do
			if !IsValid(v) then return end
			for i = 1,3 do
				if k == "N"..i then
					v:SetMaterial("models/sligwolf/bus/display/disp_"..text[12+i])
				end
			end
		end
	end
	
	return ""
end

local function SW_Bus_Display_On( veh, ply, text )

	if !IsValid(veh) then return end
	if !IsValid(ply) then return end
	
	if veh.CPPIGetOwner then
		if veh:CPPIGetOwner() != ply then 
			ply:ChatPrint( "That's not your bus!" )
			return ""
		end
	end
	
	if !veh.VehicleTable or !veh.VehicleTable.SW_Bus_Disp_Front then return end
	if !veh.SW_Bus_Disp_Front then return end
					
	veh:SetBodygroup(1,1)

	for k,v in pairs(veh.SW_Bus_Disp_Front) do
		if !IsValid(v) then return end
		v:SetMaterial("models/sligwolf/bus/display/disp__")
	end
	if veh.VehicleTable and veh.VehicleTable.SW_Bus_Disp_Back then
		if !veh.SW_Bus_Disp_Back then return end
		for k,v in pairs(veh.SW_Bus_Disp_Back) do
			if !IsValid(v) then return end
			v:SetMaterial("models/sligwolf/bus/display/disp__")
		end
	end
	if veh.VehicleTable and veh.VehicleTable.SW_Bus_Disp_Back_B then
		if !veh.SW_Bus_Disp_Back_B then return end
		for k,v in pairs(veh.SW_Bus_Disp_Back_B) do
			if !IsValid(v) then return end
			v:SetMaterial("models/sligwolf/bus/display/disp__")
		end
	end
	if veh.VehicleTable and veh.VehicleTable.SW_BusBack then
		if !veh.SW_BusBack then return end
		for k,v in pairs(veh.SW_BusBack) do
			if !IsValid(v) then return end
			v:SetBodygroup(1,1)
		end
	end
		
	return ""
end

local function SW_Bus_Display_Off( veh, ply, text )

	if !IsValid(veh) then return end
	if !IsValid(ply) then return end
	
	if veh.CPPIGetOwner then
		if veh:CPPIGetOwner() != ply then 
			ply:ChatPrint( "That's not your bus!" )
			return ""
		end
	end
	
	if !veh.VehicleTable or !veh.VehicleTable.SW_Bus_Disp_Front then return end
	if !veh.SW_Bus_Disp_Front then return end
					
	veh:SetBodygroup(1,0)

	for k,v in pairs(veh.SW_Bus_Disp_Front) do
		if !IsValid(v) then return end
		v:SetMaterial("models/sligwolf/bus/display/disp_+")
	end
	if veh.VehicleTable and veh.VehicleTable.SW_Bus_Disp_Back then
		if !veh.SW_Bus_Disp_Back then return end
		for k,v in pairs(veh.SW_Bus_Disp_Back) do
			if !IsValid(v) then return end
			v:SetMaterial("models/sligwolf/bus/display/disp_+")
		end
	end
	if veh.VehicleTable and veh.VehicleTable.SW_Bus_Disp_Back_B then
		if !veh.SW_Bus_Disp_Back_B then return end
		for k,v in pairs(veh.SW_Bus_Disp_Back_B) do
			if !IsValid(v) then return end
			v:SetMaterial("models/sligwolf/bus/display/disp_+")
		end
	end
	if veh.VehicleTable and veh.VehicleTable.SW_BusBack then
		if !veh.SW_BusBack then return end
		for k,v in pairs(veh.SW_BusBack) do
			if !IsValid(v) then return end
			v:SetBodygroup(1,0)
		end
	end
		
	return ""
end

local function SW_Spawn_Bus(ply, vehicle)

local localpos = vehicle:GetPos() 
local localang = vehicle:GetAngles()
local Forward = localang:Forward()
local Right = localang:Right()
local Up = localang:Up()
local Bus_Color01 = Color(22,69,45,255)

if vehicle.VehicleTable then
	
	if vehicle.VehicleTable.SW_Seat_BUS1 then	
		
		vehicle.SW_Seat_BUS1 = {}
		local Seats = vehicle.VehicleTable.SW_Seat_BUS1
		
		for k,v in pairs(Seats) do
			local pos = localpos + ( Forward * v.Pos.x) + ( Right * v.Pos.y) + ( Up * v.Pos.z)
			local Seat = MakeEnt( "prop_vehicle_prisoner_pod", ply )
			if !IsValid(Seat) then continue end
			
			if vehicle:GetModel() == "models/sligwolf/bus_bendi/bus_stop_001.mdl" then
				vehicle:SetColor(Bus_Color01)
				vehicle:Fire( "Lock" , "1", 0 )
			end
			
			Seat:SetModel( "models/sligwolf/unique_props/seat.mdl" )
			Seat:SetKeyValue( "vehiclescript" , "scripts/vehicles/prisoner_pod.txt" )
			Seat:SetKeyValue( "limitview" , "0" )
			Seat:SetAngles( localang + v.Ang )
			Seat:SetPos( pos )
			Seat:DrawShadow( false )
			Seat:Spawn()
			Seat:Activate()
			Seat:SetParent(vehicle)
			Seat:SetCollisionGroup( COLLISION_GROUP_WORLD )
			Seat:SetMoveType( MOVETYPE_NONE )
			Seat.__issw_is_blocked_buspart = true
			Seat.DoNotDuplicate = true
			vehicle:DeleteOnRemove( Seat )
			
			vehicle.SW_Seat_BUS1[k] = Seat
		end
	end
		
	if vehicle.VehicleTable.SW_Bus_FLights then
		vehicle.SW_Bus_FLights = {}
		local Flights = vehicle.VehicleTable.SW_Bus_FLights

		for k,v in pairs(Flights) do
		
			vehicle.__SW_BusLastHonkHorn = 0		
			vehicle.__SW_BusDoorOpenClose = 0
			vehicle.__SW_BusDoubleKey = 0
			vehicle.__SW_HandbrakeCheck = true
			vehicle:SetColor(Bus_Color01)
			vehicle:SetBodygroup(1,1)
			
			local pos = localpos + ( Forward * v.Pos.x ) + ( Right * v.Pos.y ) + ( Up * v.Pos.z )
			local Light = MakeEnt( "sw_light_cone", ply )
			if !IsValid(Light) then continue end
		
			Light:SetModel( "models/sligwolf/unique_props/placeholder001.mdl" )
			--Light:SetModel( "models/hunter/plates/plate.mdl" )
			Light:SetPos(pos)
			Light:SetAngles( localang + v.Ang )
			Light:SetParent(vehicle)
			Light:Spawn()
			Light:SetCollisionGroup( COLLISION_GROUP_IN_VEHICLE )
			Light:SetMoveType( MOVETYPE_NONE )
			Light.__issw_is_blocked_buspart = true
			Light.DoNotDuplicate = true
			vehicle:DeleteOnRemove( Light )
			
			vehicle.SW_Bus_FLights[k] = Light	
		end
	end
	
	if vehicle.VehicleTable.SW_Bus_GlowW then
		vehicle.SW_Bus_GlowW = {}
		local Lights = vehicle.VehicleTable.SW_Bus_GlowW
		
		for k,v in pairs(Lights) do
			local pos = localpos + ( Forward * v.Pos.x ) + ( Right * v.Pos.y ) + ( Up * v.Pos.z )
			local Glow = MakeEnt( "sw_glow_white", ply )
			if !IsValid(Glow) then continue end
		
			Glow:SetModel( "models/sligwolf/unique_props/placeholder001.mdl" )
			--Glow:SetModel( "models/hunter/plates/plate.mdl" )
			Glow:SetPos(pos)
			Glow:SetAngles( localang + v.Ang )
			Glow:SetParent(vehicle)
			Glow:Spawn()
			Glow:SetCollisionGroup( COLLISION_GROUP_WORLD )
			Glow:SetMoveType( MOVETYPE_NONE )
			Glow.__issw_is_blocked_buspart = true
			Glow.DoNotDuplicate = true
			vehicle:DeleteOnRemove( Glow )
			
			vehicle.SW_Bus_GlowW[k] = Glow
		end
	end
	
	if vehicle.VehicleTable.SW_Bus_GlowR then
		vehicle.SW_Bus_GlowR = {}
		local Blights = vehicle.VehicleTable.SW_Bus_GlowR

		for k,v in pairs(Blights) do
			local pos = localpos + ( Forward * v.Pos.x ) + ( Right * v.Pos.y ) + ( Up * v.Pos.z )
			local Glow = MakeEnt( "sw_glow_red", ply )
			if !IsValid(Glow) then continue end
		
			Glow:SetModel( "models/sligwolf/unique_props/placeholder001.mdl" )
			--Glow:SetModel( "models/hunter/plates/plate.mdl" )
			Glow:SetPos(pos)
			Glow:SetAngles( localang + v.Ang )
			Glow:SetParent(vehicle)
			Glow:Spawn()
			Glow:SetCollisionGroup( COLLISION_GROUP_WORLD )
			Glow:SetMoveType( MOVETYPE_NONE )
			Glow.__issw_is_blocked_buspart = true
			Glow.DoNotDuplicate = true
			vehicle:DeleteOnRemove( Glow )
			
			vehicle.SW_Bus_GlowR[k] = Glow
		end
	end
	
	if vehicle.VehicleTable.SW_Bus_FDoor then	
		vehicle.SW_Bus_FDoor = {}
		local FDoor = vehicle.VehicleTable.SW_Bus_FDoor

		for k,v in pairs(FDoor) do		
			local pos = localpos + ( Forward * v.Pos.x) + ( Right * v.Pos.y) + ( Up * v.Pos.z)
			local Door = MakeEnt( "prop_vehicle_prisoner_pod", ply )
			if !IsValid(Door) then continue end
			
			Door:SetModel( "models/sligwolf/bus/bus_doors.mdl" )
			Door:SetKeyValue( "vehiclescript" , "scripts/vehicles/prisoner_pod.txt" )
			Door:Fire( "Lock" , "1", 0 )
			Door:SetPos( pos )
			Door:SetAngles( localang + v.Ang )
			Door:DrawShadow( false )
			Door:SetParent(vehicle)
			Door:Spawn()
			Door:SetColor(Bus_Color01)
			Door:SetSolid( SOLID_VPHYSICS )
			Door:SetMoveType( MOVETYPE_NONE )
			Door.__issw_is_blocked_buspart = true
			Door.DoNotDuplicate = true
			vehicle:DeleteOnRemove( Door )
			
			vehicle.SW_Bus_FDoor[k] = Door
		end
	end
	
	if vehicle.VehicleTable.SW_Glass_Bus then	
		vehicle.SW_Glass_Bus = {}
		local Car_Glass = vehicle.VehicleTable.SW_Glass_Bus

		for k,v in pairs(Car_Glass) do	
			local pos = localpos + ( Forward * v.Pos.x ) + ( Right * v.Pos.y ) + ( Up * v.Pos.z )
			local Glass = MakeEnt( "prop_physics", ply )
			if !IsValid(Glass) then continue end
			
			if vehicle:GetModel() == "models/sligwolf/bus/bus.mdl" then
				Glass:SetModel( "models/sligwolf/unique_props/bus1_glass.mdl" )
			else
				Glass:SetModel( "models/sligwolf/unique_props/bus2_glass.mdl" )
			end
			Glass:SetPos( pos )
			Glass:SetAngles( localang + v.Ang )
			Glass:DrawShadow( false )
			Glass:Spawn()
			Glass:SetParent(vehicle)
			Glass:SetCollisionGroup( COLLISION_GROUP_IN_VEHICLE )
			Glass:SetMoveType( MOVETYPE_NONE )
			Glass.__issw_is_blocked_buspart = true
			Glass.DoNotDuplicate = true
			vehicle:DeleteOnRemove( Glass )
			
			vehicle.SW_Glass_Bus[k] = Glass
		end
	end
	
	if vehicle.VehicleTable.SW_Bus_Disp_Front then	
		vehicle.SW_Bus_Disp_Front = {}
		local Plate = vehicle.VehicleTable.SW_Bus_Disp_Front				
		
		for k,v in pairs(Plate) do			
			local pos = localpos + ( Forward * v.Pos.x) + ( Right * v.Pos.y) + ( Up * v.Pos.z)
			local Disp = MakeEnt( "prop_physics", ply )
			if !IsValid(Disp) then return end
			
			Disp:SetModel( "models/sligwolf/unique_props/bus_display.mdl" )
			Disp:SetPos( pos )
			Disp:SetAngles( localang + v.Ang )
			Disp:DrawShadow( false )
			Disp:Spawn()
			Disp:SetParent(vehicle)
			Disp:SetCollisionGroup( COLLISION_GROUP_IN_VEHICLE )
			Disp:SetMoveType( MOVETYPE_NONE )
			Disp.__issw_is_blocked_buspart = true
			Disp.DoNotDuplicate = true
			vehicle:DeleteOnRemove( Disp )
			
			vehicle.SW_Bus_Disp_Front[k] = Disp
		end
	end
	
	if vehicle.VehicleTable.SW_Bus_Disp_Back then	
		vehicle.SW_Bus_Disp_Back = {}
		local Plate = vehicle.VehicleTable.SW_Bus_Disp_Back				
		
		for k,v in pairs(Plate) do

			local pos = localpos + ( Forward * v.Pos.x) + ( Right * v.Pos.y) + ( Up * v.Pos.z)
			local Disp = MakeEnt( "prop_physics", ply )
			if !IsValid(Disp) then continue end
			
			Disp:SetModel( "models/sligwolf/unique_props/bus_display.mdl" )
			Disp:SetPos( pos )
			Disp:SetAngles( localang + v.Ang )
			Disp:DrawShadow( false )
			Disp:Spawn()
			Disp:SetParent(vehicle)
			Disp:SetCollisionGroup( COLLISION_GROUP_IN_VEHICLE )
			Disp:SetMoveType( MOVETYPE_NONE )
			Disp.__issw_is_blocked_buspart = true
			Disp.DoNotDuplicate = true
			vehicle:DeleteOnRemove( Disp )
			
			vehicle.SW_Bus_Disp_Back[k] = Disp
		end
	end
	
	if vehicle.VehicleTable.SW_BusBack then				
		vehicle.SW_BusBack = {}
		local BusBack1 = vehicle.VehicleTable.SW_BusBack
		
		for k,v in pairs(BusBack1) do
			local pos = localpos + ( Forward * v.Pos.x ) + ( Right * v.Pos.y ) + ( Up * v.Pos.z )
			local Rear = MakeEnt( "prop_vehicle_jeep_old", ply )
			if !IsValid(Rear) then continue end
			
			Rear:SetModel( "models/sligwolf/bus_bendi/bus_back.mdl" )
			Rear:SetKeyValue( "vehiclescript" , "scripts/vehicles/sligwolf/sw_bus_back.txt" )
			Rear:SetPos( pos )
			Rear:SetAngles( localang + v.Ang )
			Rear:Spawn()
			Rear:SetBodygroup(1,1)
			Rear:SetColor(Bus_Color01)
			Rear:Fire("HandBrakeOn")
			Rear:Fire( "Lock" , "1", 0 )
			Rear.DoNotDuplicate = true
			
			vehicle.SW_BusBack[k] = Rear 
			
			local ADVBallSocket = constraint.AdvBallsocket( Rear, vehicle, 0, 0, Vector(0,46.5,65), Vector(0,-176.5,65), 0, 0, -45, -45, -45, 45, 45, 45, 0, 0, 0, 0, 1 )
			if !IsValid(ADVBallSocket) then
				vehicle:Remove()
				return
			end
			ADVBallSocket.DoNotDuplicate = true
			
			if vehicle.VehicleTable.SW_BackBusDoor then			
				vehicle.SW_BackBusDoor = {}
				local BackDoor1 = vehicle.VehicleTable.SW_BackBusDoor

				for k,v in pairs(BackDoor1) do
					local pos = localpos + ( Forward * v.Pos.x) + ( Right * v.Pos.y) + ( Up * v.Pos.z)
					local Door = MakeEnt( "prop_vehicle_prisoner_pod", ply )
					if !IsValid(Door) then continue end
					
					Door:SetModel( "models/sligwolf/bus_bendi/bus_doors.mdl" )
					Door:SetKeyValue( "vehiclescript" , "scripts/vehicles/prisoner_pod.txt" )
					Door:Fire( "Lock" , "1", 0 )
					Door:SetPos( pos )
					Door:SetAngles( localang + v.Ang )
					Door:DrawShadow( false )
					Door:SetParent(Rear)
					Door:Spawn()
					Door:SetColor(Bus_Color01)
					Door:SetSolid( SOLID_VPHYSICS )
					Door:SetMoveType( MOVETYPE_NONE )
					Door.__issw_is_blocked_buspart = true
					Door.DoNotDuplicate = true
					vehicle:DeleteOnRemove( Door )
					
					vehicle.SW_BackBusDoor[k] = Door
				end
			end
					
			if vehicle.VehicleTable.SW_BusBendi then				
				vehicle.SW_BusBendi = {}
				local SWBusBendi = vehicle.VehicleTable.SW_BusBendi

				for k,v in pairs(SWBusBendi) do
					local pos = localpos + ( Forward * v.Pos.x ) + ( Right * v.Pos.y ) + ( Up * v.Pos.z )
					local Joint = MakeEnt( "prop_ragdoll", ply )
					if !IsValid(Joint) then continue end
			
					vehicle:CallOnRemove( "RemoveExtraParts", function( ent ) 
						if ent.VehicleTable.SW_BusBack and ent.SW_BusBack then
							for k,v in pairs(ent.SW_BusBack) do
								if !IsValid(v) then return end
								v:Remove() 
							end	
						end	
						if ent.VehicleTable.SW_BusBendi and ent.SW_BusBendi then
							for k,v in pairs(ent.SW_BusBendi) do
								if !IsValid(v) then return end
								v:Remove() 
							end	
						end	
					end )
					
					Joint:SetModel( "models/sligwolf/bus_bendi/bus_bendi.mdl" )
					Joint:SetPos( pos )
					Joint:SetAngles( localang + v.Ang )
					Joint:Spawn()	
					Joint:SetCollisionGroup( COLLISION_GROUP_DEBRIS )
					Joint.__issw_is_blocked_buspart = true
					Joint.DoNotDuplicate = true
			
					vehicle.SW_BusBendi[k] = Joint
					
					local phys = Joint:GetPhysicsObject()
					if IsValid(phys) then
						phys:Wake()
						phys:EnableMotion(true)
						phys:SetMass( 1 )
					end
						
					local weldA = constraint.Weld( Joint, vehicle, 1, 0, 0, 0, false ) 
					if !IsValid(weldA) then
						vehicle:Remove()
						return
					end
					weldA.DoNotDuplicate = true
					local weldB = constraint.Weld( Joint, Rear, 0, 0, 0, 0, false ) 
					if !IsValid(weldB) then
						vehicle:Remove()
						return
					end
					weldB.DoNotDuplicate = true
				end
			end

			if vehicle.VehicleTable.SW_Seat_BUS2 then	
				
				vehicle.SW_Seat_BUS2 = {}
				local Seats2 = vehicle.VehicleTable.SW_Seat_BUS2
				
				for k,v in pairs(Seats2) do
					local pos = localpos + ( Forward * v.Pos.x) + ( Right * v.Pos.y) + ( Up * v.Pos.z)
					local Seat = MakeEnt( "prop_vehicle_prisoner_pod", ply )
					if !IsValid(Seat) then continue end
					
					Seat:SetModel( "models/sligwolf/unique_props/seat.mdl" )
					Seat:SetKeyValue( "vehiclescript" , "scripts/vehicles/prisoner_pod.txt" )
					Seat:SetKeyValue( "limitview" , "0" )
					Seat:SetAngles( localang + v.Ang )
					Seat:SetPos( pos )
					Seat:DrawShadow( false )
					Seat:SetParent(Rear)
					Seat:Spawn()
					Seat:Activate()
					Seat:SetCollisionGroup( COLLISION_GROUP_WORLD )
					Seat:SetMoveType( MOVETYPE_NONE )
					Seat.__issw_is_blocked_buspart = true
					Seat.DoNotDuplicate = true
					vehicle:DeleteOnRemove( Seat )
					
					vehicle.SW_Seat_BUS2[k] = Seat
				end
			end

			if vehicle.VehicleTable.SW_Glass_Bus_B then	
				vehicle.SW_Glass_Bus_B = {}
				local Car_Glass = vehicle.VehicleTable.SW_Glass_Bus_B

				for k,v in pairs(Car_Glass) do	
					local pos = localpos + ( Forward * v.Pos.x ) + ( Right * v.Pos.y ) + ( Up * v.Pos.z )
					local Glass = MakeEnt( "prop_physics", ply )
					if !IsValid(Glass) then continue end
					
					Glass:SetModel( "models/sligwolf/unique_props/bus3_glass.mdl" )
					Glass:SetPos( pos )
					Glass:SetAngles( localang + v.Ang )
					Glass:DrawShadow( false )
					Glass:Spawn()
					Glass:SetParent(Rear)
					Glass:SetCollisionGroup( COLLISION_GROUP_IN_VEHICLE )
					Glass:SetMoveType( MOVETYPE_NONE )
					Glass.__issw_is_blocked_buspart = true
					Glass.DoNotDuplicate = true
					vehicle:DeleteOnRemove( Glass )
					
					vehicle.SW_Glass_Bus_B[k] = Glass
				end
			end
			
			if vehicle.VehicleTable.SW_Bus_Disp_Back_B then	
				vehicle.SW_Bus_Disp_Back_B = {}
				local Plate = vehicle.VehicleTable.SW_Bus_Disp_Back_B				
				
				for k,v in pairs(Plate) do

					local pos = localpos + ( Forward * v.Pos.x) + ( Right * v.Pos.y) + ( Up * v.Pos.z)
					local Disp = MakeEnt( "prop_physics", ply )
					if !IsValid(Disp) then continue end
					
					Disp:SetModel( "models/sligwolf/unique_props/bus_display.mdl" )
					Disp:SetPos( pos )
					Disp:SetAngles( localang + v.Ang )
					Disp:DrawShadow( false )
					Disp:Spawn()
					Disp:SetParent(Rear)
					Disp:SetCollisionGroup( COLLISION_GROUP_IN_VEHICLE )
					Disp:SetMoveType( MOVETYPE_NONE )
					Disp.__issw_is_blocked_buspart = true
					Disp.DoNotDuplicate = true
					vehicle:DeleteOnRemove( Disp )
					
					vehicle.SW_Bus_Disp_Back_B[k] = Disp
				end
			end
			
			if vehicle.VehicleTable.SW_BusB_GlowR then
				vehicle.SW_BusB_GlowR = {}
				local Lights = vehicle.VehicleTable.SW_BusB_GlowR
				
				for k,v in pairs(Lights) do
					local pos = localpos + ( Forward * v.Pos.x ) + ( Right * v.Pos.y ) + ( Up * v.Pos.z )
					local Glow = MakeEnt( "sw_glow_red", ply )
					if !IsValid(Glow) then continue end
				
					Glow:SetModel( "models/sligwolf/unique_props/placeholder001.mdl" )
					--Glow:SetModel( "models/hunter/plates/plate.mdl" )
					Glow:SetPos(pos)
					Glow:SetAngles( localang + v.Ang )
					Glow:SetParent(Rear)
					Glow:Spawn()
					Glow:SetCollisionGroup( COLLISION_GROUP_WORLD )
					Glow:SetMoveType( MOVETYPE_NONE )
					Glow.__issw_is_blocked_buspart = true
					Glow.DoNotDuplicate = true
					vehicle:DeleteOnRemove( Glow )
					
					vehicle.SW_BusB_GlowR[k] = Glow
				end
			end	
	
			if vehicle.VehicleTable.SW_Bus_Helper then	
				vehicle.SW_Bus_Helper = {}
				local Plate = vehicle.VehicleTable.SW_Bus_Helper				
				
				for k,v in pairs(Plate) do

					local pos = localpos + ( Forward * v.Pos.x) + ( Right * v.Pos.y) + ( Up * v.Pos.z)
					local Helper = MakeEnt( "prop_physics", ply )
					if !IsValid(Helper) then continue end
					
					Helper:SetModel( "models/sligwolf/unique_props/helper_gokart.mdl" )
					Helper:SetAngles( localang + v.Ang )
					Helper:SetPos( pos )
					Helper:Spawn()
					Helper:DrawShadow( false )
					Helper:SetSolid( SOLID_NONE )
					Helper.DoNotDuplicate = true
					
					vehicle.SW_Bus_Helper[k] = Helper
					
					local phys = Helper:GetPhysicsObject()
					if IsValid(phys) then
						phys:Wake()
						phys:EnableMotion(true)
						phys:SetMass( 1000 )
					end
					
					local weld = constraint.Weld( Helper, Rear, 0, 0, 0, 0, true )	
					if !IsValid(weld) then
						vehicle:Remove()
						return
					end
					weld.DoNotDuplicate = true	
					local KeepUp = constraint.Keepupright( Helper, Angle(0,0,0), 0, 60 )
					if !IsValid(KeepUp) then
						vehicle:Remove()
						return
					end
					KeepUp.DoNotDuplicate = true
				end
				
			end

		end
	end
	
	timer.Simple(0.01, function()
		local text = "!swbus-disp l13 -to nowhere-" 
		SW_Bus_Display_Text(vehicle, ply, text)
	end)
end

end
hook.Add( "PlayerSpawnedVehicle", "SW_Spawn_Bus", SW_Spawn_Bus )

if SERVER then

local function SW_Bus_Think(ent)

	local ply = ent:GetDriver()
	if !IsValid(ply) then return end
	if !ply:InVehicle() then return end
	
	if !ent.__SW_BusLastHonkHorn then return end	
	if !ent.__SW_BusDoorOpenClose then return end
			
    if !ent.VehicleTable or !ent.VehicleTable.SW_BusBack then return end
	if !ent.SW_BusBack then return end
	
	for k,v in pairs(ent.SW_BusBack) do
		if !IsValid(v) then return end
		
		if ply:KeyDown( IN_JUMP ) then
			v:Fire("HandBrakeOn")
			ent.__SW_buffer01 = nil
		end
		if !ply:KeyDown( IN_JUMP ) and !ent.__SW_buffer01 then
			v:Fire("HandBrakeOff")
			ent.__SW_buffer01 = true
		end	
	end
	
end

local function SW_Bus_Extra_Handbrake()	
	for _, ent in pairs(ents.FindByModel("models/sligwolf/bus_bendi/bus_front.mdl")) do
		if !ent.__SW_HandbrakeCheck == true then continue end
		SW_Bus_Think(ent)		
	end
end

local function SW_Bus_Keys( ply,key )

    if !IsValid( ply ) then return end
    local vehicle = ply:GetVehicle()
    if !IsValid( vehicle ) then return end
    if !vehicle.VehicleTable or !vehicle.VehicleTable.SW_Bus_FLights or !vehicle.VehicleTable.SW_Bus_GlowW or !vehicle.VehicleTable.SW_Bus_FDoor then return end
	if !vehicle.SW_Bus_FLights or !vehicle.SW_Bus_GlowW or !vehicle.SW_Bus_FDoor then return end
	
	if !vehicle.__SW_BusLastHonkHorn then return end	
	if !vehicle.__SW_BusDoorOpenClose then return end
	if !vehicle.__SW_BusDoubleKey then return end
	if !vehicle.__SW_HandbrakeCheck then return end
	
	if ply:KeyPressed( IN_RELOAD ) then
		vehicle.__SW_BusDoubleKey = vehicle.__SW_BusDoubleKey+1
		
		timer.Simple(0.25, function()
			if vehicle.__SW_BusDoubleKey == 1 then
				local LastHorn = vehicle.__SW_BusLastHonkHorn
				if (LastHorn + 1.5) <= CurTime() then
					vehicle.__SW_BusLastHonkHorn = CurTime()
					vehicle:EmitSound("vehicles/sligwolf/bus/bus_horn.wav", 100, 100)  
				end
			end
		end)
		timer.Simple(0.25, function()
			if vehicle.__SW_BusDoubleKey == 2 then
				for k,v in pairs(vehicle.SW_Bus_FDoor) do
					if !IsValid(v) then return end
					
					if vehicle.__SW_BusDoorOpenClose == 0 then
						local sequence = v:LookupSequence("open")
						v:ResetSequence(sequence)
						v:SetPlaybackRate(0.5)
						v:SetSolid( SOLID_NONE )
						timer.Simple(0.25,function() 
							if !IsValid(vehicle) then return end
							vehicle.__SW_BusDoorOpenClose = 1
						end)	
					end
						
					if vehicle.__SW_BusDoorOpenClose == 1 then
						local sequence = v:LookupSequence("close")
						v:ResetSequence(sequence)
						v:SetPlaybackRate(0.5)
						v:SetSolid( SOLID_VPHYSICS )
						timer.Simple(0.25,function() 
							if !IsValid(vehicle) then return end
							vehicle.__SW_BusDoorOpenClose = 0
						end)
					end
				end
			
				if !vehicle.VehicleTable or !vehicle.VehicleTable.SW_BackBusDoor then return end
				if !vehicle.SW_BackBusDoor then return end
		
				for k,v in pairs(vehicle.SW_BackBusDoor) do
					if !IsValid(v) then return end
				
					if vehicle.__SW_BusDoorOpenClose == 0 then
						local sequence = v:LookupSequence("open")
						v:ResetSequence(sequence)
						v:SetPlaybackRate(0.5)
						v:SetSolid( SOLID_NONE )
						timer.Simple(0.25,function() 
							if !IsValid(vehicle) then return end
							vehicle.__SW_BusDoorOpenClose = 1
						end)	
					end
					
					if vehicle.__SW_BusDoorOpenClose == 1 then
						local sequence = v:LookupSequence("close")
						v:ResetSequence(sequence)
						v:SetPlaybackRate(0.5)
						v:SetSolid( SOLID_VPHYSICS )
						timer.Simple(0.25,function() 
							if !IsValid(vehicle) then return end
							vehicle.__SW_BusDoorOpenClose = 0
						end)
					end
				end
			end
		end)
		
		timer.Simple(0.3, function()
			vehicle.__SW_BusDoubleKey = 0
		end)
	end	
	
	if ply:KeyPressed( IN_WALK ) then
		for k,v in pairs(vehicle.SW_Bus_FLights) do
			if !IsValid(v) then return end
			v:Toggle()
			vehicle:EmitSound("items/flashlight1.wav", 100, 100)  
		end
		for k,v in pairs(vehicle.SW_Bus_GlowW) do
			if !IsValid(v) then return end
			v:Toggle()
		end
		if vehicle.SW_Bus_GlowR and vehicle.VehicleTable.SW_Bus_GlowR then
			if !vehicle.SW_Bus_GlowR then return end
			for k,v in pairs(vehicle.SW_Bus_GlowR) do
				if !IsValid(v) then return end
				v:Toggle() 
			end	
		end	
		if vehicle.SW_BusB_GlowR and vehicle.VehicleTable.SW_BusB_GlowR then
			if !vehicle.SW_BusB_GlowR then return end
			for k,v in pairs(vehicle.SW_BusB_GlowR) do
				if !IsValid(v) then return end
				v:Toggle() 
			end
		end
	end
end

hook.Add( "KeyPress", "SW_Bus_Keys", SW_Bus_Keys )
--hook.Add( "Think", "SW_Bus_Extra_Handbrake", SW_Bus_Extra_Handbrake )

hook.Add( "PlayerSay", "SW_Bus_ChatCommands", function( ply, text )

	text = string.lower(text)
	
	if ( string.sub( text, 1, 11 ) == "!swbus-disp" ) then
		local tr = util.TraceLine( util.GetPlayerTrace( ply ) )
		local prop = tr.Entity

		return SW_Bus_Display_Text(prop, ply, text)
	end
	
	if ( string.sub( text, 1, 11 ) == "!swbus-off" ) then
		local tr = util.TraceLine( util.GetPlayerTrace( ply ) )
		local prop = tr.Entity

		return SW_Bus_Display_Off(prop, ply, text)
	end
	
	if ( string.sub( text, 1, 11 ) == "!swbus-on" ) then
		local tr = util.TraceLine( util.GetPlayerTrace( ply ) )
		local prop = tr.Entity

		return SW_Bus_Display_On(prop, ply, text)
	end
	
end )

end
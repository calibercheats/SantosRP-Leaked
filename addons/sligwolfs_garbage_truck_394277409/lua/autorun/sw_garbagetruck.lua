
-----------------------------------------------------
AddCSLuaFile("autorun/sw_garbagetruck.lua")

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

sound.Add(
{
	name = "SW_GbTruck_Fork_Up",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "vehicles/sligwolf/garbagetruck/ctc_move_a.wav"
} )

sound.Add(
{
	name = "SW_GbTruck_Fork_Down",
    channel = CHAN_STATIC,
    volume = 1.0,
    soundlevel = 80,
    sound = "vehicles/sligwolf/garbagetruck/ctc_move_b.wav"
} )

local Category = "SligWolf's Vehicle's"

local V = { 	
	Name = "Garbage Truck", 
	Class = "prop_vehicle_jeep_old",
	Category = "SligWolf's Vehicle's",
	Author = "SligWolf",
	Information = "Truck made by SligWolf",
	Model = "models/sligwolf/garbagetruck/sw_truck.mdl",	
	
	sw_gtruck_fLights = {
		Light1 = { Pos = Vector(-37,-175,27), Ang = Angle(20,90,0) } , 
		Light2 = { Pos = Vector(37,-175,27), Ang = Angle(20,90,0) } 
	},
	
	sw_gtruck_smoke = { smoke1 = { Pos = Vector(58,-39,25) } },
	GarbagetruckFork = { fork1 = { Pos = Vector(0,-65,60), Ang = Angle(0,0,0) } },
	GarbageTruckPassenger  = { passenger1 = { Pos = Vector(20,-135,54), Ang = Angle(0,0,0) } },
	
	KeyValues = {
		vehiclescript	=	"scripts/vehicles/sligwolf/sw_garbagetruck.txt"
	}
}

list.Set( "Vehicles", "sw_garbagetruck", V )


local function Check_SW_DieselTrain( ent )
	if ent.__isswgarbagetruck then return true end
	return false
end

local function MakeEnt(name, ply)
	if !IsValid(ply) then return end
	local ent = ents.Create(name)

	if !IsValid(ent) then return end
	if !ent.CPPISetOwner then return ent end

	ent:CPPISetOwner(ply)
	return ent
end

local function Check_Blocked_Parts_GARBAGETR( ent )
    if ent.__issw_is_blocked_garbagetrpart then return true end
    return false
end

local function CantTouchThis_GARBAGETR( ply, ent )
    if !IsValid(ent) then return end
    if Check_Blocked_Parts_GARBAGETR(ent) then return false end
end
hook.Add( "PhysgunPickup", "CantTouchThis_GARBAGETR", CantTouchThis_GARBAGETR )

local function SpawnSwGarbagetruck(ply, vehicle)
	local localpos = vehicle:GetPos() 
	local localang = vehicle:GetAngles()
	local Forward = vehicle:GetAngles():Forward()
	local Right = vehicle:GetAngles():Right()
	local Up = vehicle:GetAngles():Up()
	
	if vehicle.VehicleTable then
		if vehicle.VehicleTable.GarbageTruckPassenger then	
			vehicle.GarbageTruckPassenger = {}
			local Seats = vehicle.VehicleTable.GarbageTruckPassenger
			
			for k,v in pairs(Seats) do
				local pos = localpos + ( Forward * v.Pos.x) + ( Right * v.Pos.y) + ( Up * v.Pos.z)
				local Seat = MakeEnt( "prop_vehicle_prisoner_pod", ply )
				if !IsValid(Seat) then continue end
				
				Seat:SetModel( "models/nova/jeep_seat.mdl" )
				Seat:SetKeyValue( "vehiclescript" , "scripts/vehicles/prisoner_pod.txt" )
				Seat:SetKeyValue( "limitview" , "0" )
				Seat:SetAngles( localang + v.Ang )
				Seat:SetPos( pos )
				Seat:SetMaterial("models/sligwolf/unique_props/nodraw")
				Seat:DrawShadow( false )
				Seat:Spawn()
				Seat:Activate()
				Seat:SetParent(vehicle)
				Seat:SetCollisionGroup(20)
				Seat:SetMoveType( MOVETYPE_NONE )
				Seat.__issw_is_blocked_garbagetrpart = true
				vehicle:DeleteOnRemove( Seat )
				vehicle.GarbageTruckPassenger[k] = Seat
			end
		end
		
		if vehicle.VehicleTable.sw_gtruck_smoke then	
			vehicle.sw_gtruck_smoke = {}
			local SwGTSmoke = vehicle.VehicleTable.sw_gtruck_smoke
		
			for k,v in pairs(SwGTSmoke) do
				local pos = localpos + ( Forward * v.Pos.x) + ( Right * v.Pos.y) + ( Up * v.Pos.z)
				local GTruckSmoke = MakeEnt( "env_smoketrail", ply )
				if !IsValid(GTruckSmoke) then continue end
				
				GTruckSmoke:SetKeyValue("opacity", 50)
				GTruckSmoke:SetKeyValue("spawnrate", 50)
				GTruckSmoke:SetKeyValue("lifetime", 0)
				GTruckSmoke:SetKeyValue("startcolor", "180 180 180")
				GTruckSmoke:SetKeyValue("startsize", 10 )
				GTruckSmoke:SetKeyValue("endsize", vehicle:BoundingRadius() / 15 )
				GTruckSmoke:SetKeyValue("spawnradius", 0.25)
				GTruckSmoke:SetPos(pos)
				GTruckSmoke:SetParent(vehicle)
				vehicle.sw_gtruck_smoke[k] = GTruckSmoke
			end
		end

		--[[
	################# ## !! SANDBOX ONLY, GMOD LAMP AND NUMPAD LOL
		]]

		--[[if vehicle.VehicleTable.sw_gtruck_fLights then
			vehicle.sw_gtruck_fLights = {}
			local Flights = vehicle.VehicleTable.sw_gtruck_fLights
			
			for k,v in pairs(Flights) do
				local pos = localpos + ( Forward * v.Pos.x ) + ( Right * v.Pos.y ) + ( Up * v.Pos.z )
				local Headlight = MakeEnt( "gmod_lamp", ply )
				if !IsValid(Headlight) then continue end
						
				Headlight:SetColor( Color( 255, 255, 255, 255 ) )
				Headlight:SetFlashlightTexture( "effects/flashlight001" )
				Headlight:SetLightFOV( 90 )
				Headlight:SetDistance( 1024 )
				Headlight:SetBrightness( 1 )
				Headlight:SetToggle( 1 )
				Headlight:UpdateLight()
				Headlight.NumDown = numpad.OnDown( ply, "", "LampToggle", Headlight, 1 )
				Headlight.NumUp = numpad.OnUp( ply, "", "LampToggle", Headlight, 0 )
				Headlight:SetModel( "models/sligwolf/unique_props/placeholder001.mdl" )
				Headlight:SetPos(pos)
				Headlight:SetAngles( localang + v.Ang )
				Headlight:SetParent(vehicle)
				Headlight:Spawn()
				Headlight:SetCollisionGroup(10)
				Headlight:SetMoveType( MOVETYPE_NONE )
				vehicle:DeleteOnRemove( Headlight )
				
				vehicle.sw_gtruck_fLights[k] = Headlight
			end
		end]]--

		if vehicle.VehicleTable.GarbagetruckFork then	
			vehicle.GarbagetruckFork = {}
			local swtbd = vehicle.VehicleTable.GarbagetruckFork
			
			local Color01 = Color(190,65,0,255)
			vehicle:SetColor(Color01)
			vehicle.SWGbTruckLastHonkHorn = 0
			vehicle.SWGbTruckForkOpenClose = 0
			vehicle.SWGbTruckDumpsterWeldUnweld = 0
			vehicle.__isswgarbagetruck = true

			for k,v in pairs(swtbd) do
				local Pos = localpos + ( Forward * v.Pos.x ) + ( Right * v.Pos.y ) + ( Up * v.Pos.z )
				local GarbageFork =  MakeEnt( "prop_physics", ply ) --MakeEnt( "prop_vehicle_prisoner_pod", ply ) ---###############################!!!! WHAT
				if !IsValid(GarbageFork) then return end
				
				GarbageFork:SetModel( "models/sligwolf/garbagetruck/sw_fork.mdl" )
				--GarbageFork:SetKeyValue( "vehiclescript" , "scripts/vehicles/prisoner_pod.txt" )
				--GarbageFork:Fire( "Lock" , "1", 0 )
				GarbageFork:SetAngles( localang + v.Ang )
				GarbageFork:SetPos( Pos )
				GarbageFork:Spawn()
				GarbageFork:SetColor(Color01)
				GarbageFork.IsGarbageTruckFork = true
				GarbageFork:SetCollisionGroup( COLLISION_GROUP_IN_VEHICLE )
				vehicle:DeleteOnRemove( GarbageFork )
				
				vehicle.GarbagetruckFork[k] = GarbageFork
				
				local xmin, xmax = -180, 180
				local ymin, ymax = -90, 0
				local zmin, zmax = -180, 180
				local xfric, yfric, zfric = 0, 10, 0

				local weld = constraint.Weld( GarbageFork, vehicle, 0, 0, 0, 1, true ) 
				local axis = constraint.Axis( GarbageFork, vehicle, 0, 0, Vector(1,0,0), Vector(0,0,0), 0, 0, 10, 0, Vector(0,0,0) ) 
				local ballsocket = constraint.AdvBallsocket( GarbageFork, vehicle, 0, 0, Vector(1,0,0), Vector(0,0,0), 0, 0, xmin, ymin, zmin, xmax, ymax, zmax, xfric, yfric, zfric, 1, 1 )
				local phys = GarbageFork:GetPhysicsObject()
				if IsValid(phys) then
					phys:Wake()
					phys:EnableMotion(false)
					timer.Simple(0.25,function() 
						if !IsValid(vehicle) then return end
						if !IsValid(GarbageFork) then return end
						phys:EnableMotion(true)
						local sequence = GarbageFork:LookupSequence("close")
						GarbageFork:ResetSequence(sequence)
						GarbageFork:SetSolid(0)
					end)
				end
			end
		end
	end
end
hook.Add( "PlayerSpawnedVehicle", "SpawnSwGarbagetruck", SpawnSwGarbagetruck )

if SERVER then
	local function SwGarbagetruckThink(ent)	
		local localpos = ent:GetPos()
		local localang = ent:GetAngles()
		local Forward = localang:Forward()
		local Right = localang:Right()
		local Up = localang:Up()
		
		--[[
	################# ## !! REMOVE TRASH ITEMS IN THE TRUCK
		]]
		--[[for _, Trash in pairs(ents.FindByModel("models/sligwolf/garbagetruck/sw_trashbag.mdl")) do
			if Trash:GetPos():Distance(ent:GetAttachment(3).Pos) <= 50 then
				Trash:EmitSound("physics/metal/metal_box_break2.wav", 100, 100)
				Trash:Remove()
			end
		end]]--
		
		local ply = ent:GetDriver()
		if !IsValid(ply) then return end
		if !ply:InVehicle() then return end

		--if !ent.VehicleTable or !ent.VehicleTable.sw_gtruck_fLights or !ent.VehicleTable.GarbagetruckFork then return end
		--if !ent.sw_gtruck_fLights or !ent.GarbagetruckFork then return end	
		if !ent.VehicleTable or !ent.VehicleTable.GarbagetruckFork then return end
		if !ent.GarbagetruckFork then return end	

		--[[
	################# ## !! REMOVE TRASH ITEMS IN THE TRUCK
		]]	
		--[[for _, Trash in pairs(ents.FindByModel("models/sligwolf/garbagetruck/sw_trashbag.mdl")) do
			if Trash:GetPos():Distance(ent:GetAttachment(2).Pos) <= 50 then
				Trash:EmitSound("physics/metal/metal_box_break2.wav", 100, 100)
				Trash:Remove()
			end
		end]]--
		
		--[[if ent.VehicleTable.SWGbTruckDumpsterWeldUnweld == 1 then
			for _, Dumpster in pairs(ents.FindByModel("models/sligwolf/garbagetruck/sw_dumpster.mdl")) do
				
				if ply:KeyDown( IN_JUMP ) then 
					local phys = Dumpster:GetPhysicsObject()
					
					if Dumpster:GetPos():Distance(ent:GetPos()) <= 300 then
					
						if ply:KeyDown( IN_FORWARD ) then 
							local phys = Dumpster:GetPhysicsObject()
							if IsValid(phys) then
								phys:SetVelocity( Vector( 0, 0, 150 ) )
								ent.SoundGbTruckForkUp:Play()
								ent.__SW_buffer01 = nil
							end	
						end	
						if ply:KeyDown( IN_BACK ) then 
							local phys = Dumpster:GetPhysicsObject()
							if IsValid(phys) then
								phys:SetVelocity( Vector( 0, 0, -150 ) )
								ent.SoundGbTruckForkDown:Play()
								ent.__SW_buffer02 = nil
							end	
						end	
					end
				end
			end	
			
			if !ply:KeyDown( IN_FORWARD ) && !ent.__SW_buffer01 then 
				ent.SoundGbTruckForkUp:Stop()
				ent.__SW_buffer01 = true
			end
			
			if !ply:KeyDown( IN_BACK ) && !ent.__SW_buffer02 then 
				ent.SoundGbTruckForkDown:Stop()
				ent.__SW_buffer02 = true
			end
		
			if ply:KeyDown( IN_ATTACK2 ) then
				ent.SoundGbTruckForkUp:Stop()
				ent.SoundGbTruckForkDown:Stop()
			end
		end]]--
	end

	local function SwGarbagetruck_Functions()
		--for _, ent in pairs(ents.FindByModel("models/sligwolf/garbagetruck/sw_truck.mdl")) do
		--	if !ent.__isswgarbagetruck == true then continue end
		--	SwGarbagetruckThink(ent)
		--end
	end


	local function SwGarbagetruckKeys( ply,key )
	    if !IsValid( ply ) then return end

	   	--[[
	################# ## !! OPEN AND CLOSE A DUMPSTER
	   	]]
		--[[if ply:KeyPressed( IN_USE ) then
			local DumpsterTracer = util.TraceLine( util.GetPlayerTrace( ply ) )
			Dumpster = DumpsterTracer.Entity
			
			if Dumpster:IsValid() then
			
				if Dumpster.__AnimChange == nil then	
					if Dumpster:GetModel() == "models/sligwolf/garbagetruck/sw_dumpster.mdl" then
						if Dumpster:GetPos():Distance(ply:GetPos()) <= 70 then
							timer.Simple(0.1,function() 
								if !IsValid(Dumpster) then return end
								local sequence = Dumpster:LookupSequence("close")
								Dumpster:ResetSequence(sequence)
								Dumpster.__AnimChange = true	
								Dumpster:EmitSound("vehicles/sligwolf/truck/sw_truck_mechanic.wav", 80, 100) 
							end)
						end
					end
				end
				
				if Dumpster.__AnimChange == true then
					if Dumpster:GetModel() == "models/sligwolf/garbagetruck/sw_dumpster.mdl" then
						if Dumpster:GetPos():Distance(ply:GetPos()) <= 70 then
							timer.Simple(0.1,function()
								if !IsValid(Dumpster) then return end
								local sequence = Dumpster:LookupSequence("open")
								Dumpster:ResetSequence(sequence)
								Dumpster.__AnimChange = nil
								Dumpster:EmitSound("vehicles/sligwolf/truck/sw_truck_mechanic.wav", 80, 100)
							end)
						end
					end
				end
				
			end	
		end]]--

		local vehicle = ply:GetVehicle()
		if !IsValid( vehicle ) then return end

		--if !vehicle.VehicleTable or !vehicle.VehicleTable.sw_gtruck_fLights or !vehicle.VehicleTable.GarbagetruckFork then return end
		--if !vehicle.sw_gtruck_fLights or !vehicle.GarbagetruckFork then return end
		
		if !vehicle.VehicleTable or !vehicle.VehicleTable.GarbagetruckFork then return end
		if !vehicle.GarbagetruckFork then return end
		local localpos = vehicle:GetPos() 
		local localang = vehicle:GetAngles()
		local Forward = vehicle:GetAngles():Forward()
		local Right = vehicle:GetAngles():Right()
		local Up = vehicle:GetAngles():Up()

			--[[
	################# ## !! SANDBOX ONLY, GMOD LAMP AND NUMPAD LOL
		]]
		--[[for k,v in pairs(vehicle.sw_gtruck_fLights) do
			if !IsValid(v) then return end
			
			if ply:KeyPressed( IN_WALK ) then
				v:Toggle()
				vehicle:EmitSound("items/flashlight1.wav", 100, 100)  
			end
			
			if ply:KeyPressed( IN_RELOAD ) then
				local lastboost = vehicle.VehicleTable.SWGbTruckLastHonkHorn
				if (lastboost + 2.5) <= CurTime() then
					vehicle.VehicleTable.SWGbTruckLastHonkHorn = CurTime()
					vehicle:EmitSound("vehicles/sligwolf/truck/sw_truck_horn.wav", 80, 100)
				end
			end
			
		end]]--

		for k,v in pairs(vehicle.GarbagetruckFork) do
			if !IsValid(v) then return end	
			
			if vehicle.SWGbTruckForkOpenClose == 0 then
				if ply:KeyPressed( IN_ATTACK ) then
					if vehicle.SWGbTruckDumpsterWeldUnweld == 1 then return end
					vehicle:EmitSound("vehicles/sligwolf/garbagetruck/ct_legsfix.wav", 150, 70) 	
					local sequence = v:LookupSequence("open")
					v:ResetSequence(sequence)
					v:SetSolid(6)
					timer.Simple(0.25,function() 
						if !IsValid(vehicle) then return end
						vehicle.SWGbTruckForkOpenClose = 1
					end)
				end
			end
			
			if vehicle.SWGbTruckForkOpenClose == 1 then
				if ply:KeyPressed( IN_ATTACK ) then
					if vehicle.SWGbTruckDumpsterWeldUnweld == 1 then return end
					vehicle:EmitSound("vehicles/sligwolf/garbagetruck/ct_legsfix.wav", 150, 70) 	
					local sequence = v:LookupSequence("close")
					v:ResetSequence(sequence)
					v:SetSolid(0)
					timer.Simple(0.25,function() 
						if !IsValid(vehicle) then return end
						vehicle.SWGbTruckForkOpenClose = 0
					end)
				end	
			
				--[[
	################# ## !! GRAB AND UNGRAB A DUMPSTER
				]]
				--[[if ply:KeyPressed( IN_ATTACK2 ) then
					for _, Dumpster in pairs(ents.FindByModel("models/sligwolf/garbagetruck/sw_dumpster.mdl")) do
						if !IsValid(vehicle) then return end
						if !IsValid(Dumpster) then return end
						
						if Dumpster:GetAttachment(1).Pos:Distance(vehicle:GetAttachment(1).Pos) <= 20 then
						
							if vehicle.VehicleTable.SWGbTruckDumpsterWeldUnweld == 0 then
								vehicle:EmitSound("weapons/crowbar/crowbar_impact1.wav", 80, 40) 
								local phys = Dumpster:GetPhysicsObject()
								if (phys:IsValid()) then
									phys:Wake()
									phys:EnableMotion(true)
								end	
								constraint.RemoveConstraints( v, "Weld" ) 
								timer.Simple(0.05,function() 
									if !IsValid(vehicle) then return end
									if !IsValid(Dumpster) then return end
									local sequence = Dumpster:LookupSequence("close")
									Dumpster:ResetSequence(sequence)
									vehicle.VehicleTable.SWGbTruckDumpsterWeldUnweld = 1			
									local weld = constraint.Weld( Dumpster, v, 0, 0, 0, 0, false ) 
								end)
							end
							
							if vehicle.VehicleTable.SWGbTruckDumpsterWeldUnweld == 1 then
								vehicle:EmitSound("weapons/crowbar/crowbar_impact1.wav", 80, 60)
								constraint.RemoveConstraints( Dumpster, "Weld" )
								local phys = Dumpster:GetPhysicsObject()
								if (phys:IsValid()) then
									phys:Wake()
									phys:EnableMotion(false)
								end		
								timer.Simple(0.05,function() 
									if !IsValid(vehicle) then return end
									if !IsValid(Dumpster) then return end
									local sequence = Dumpster:LookupSequence("open")
									Dumpster:ResetSequence(sequence)
									vehicle.VehicleTable.SWGbTruckDumpsterWeldUnweld = 0
									v:SetPos(localpos + (Forward*0) - (Right*65) + (Up*60))
									v:SetAngles(localang + Angle(0,0,0))
									local weld = constraint.Weld( v, vehicle, 0, 0, 0, 0, true ) 
								end)
							end	
							
						end	
					end
				end]]--
			end	
		end
	end

	local function GoInSwGarbagetruck( ply,vehicle )	
		if !IsValid( ply ) then return end
		local vehicle = ply:GetVehicle()
		if !IsValid( vehicle ) then return end
		if !vehicle.VehicleTable or !vehicle.VehicleTable.sw_gtruck_smoke then return end
		if !vehicle.sw_gtruck_smoke then return end
		
		for k,v in pairs(vehicle.sw_gtruck_smoke) do
			if !IsValid(v) then return end
			v:SetKeyValue("lifetime", 1)
			v:SetKeyValue("opacity", 50)
			v:SetKeyValue("spawnrate", 50)
		end
	end

	local function GoOutSwGarbagetruck( ply,vehicle )
		if !IsValid( ply ) then return end
		local vehicle = ply:GetVehicle()
		if !IsValid( vehicle ) then return end
		if !vehicle.VehicleTable or !vehicle.VehicleTable.sw_gtruck_smoke then return end
		if !vehicle.sw_gtruck_smoke then return end
		
		for k,v in pairs(vehicle.sw_gtruck_smoke) do
			if !IsValid(v) then return end
			v:SetKeyValue("lifetime", 0)
			v:SetKeyValue("opacity", 0)
			v:SetKeyValue("spawnrate", 1)
		end
	end

	hook.Add( "PlayerLeaveVehicle", "GoOutSwGarbagetruck", GoOutSwGarbagetruck )
	hook.Add( "PlayerEnteredVehicle", "GoInSwGarbagetruck", GoInSwGarbagetruck )
	hook.Add( "KeyPress", "SwGarbagetruckKeys", SwGarbagetruckKeys )
	hook.Add( "Think", "SwGarbagetruck_Functions", SwGarbagetruck_Functions )
end
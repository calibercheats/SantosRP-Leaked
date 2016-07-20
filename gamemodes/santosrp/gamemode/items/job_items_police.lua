
-----------------------------------------------------
--[[
	Name: job_items_police.lua
	For: SantosRP
	By: Ultra
]]--

local Item = {}
Item.Name = "Police Issue Traffic Cone"
Item.Desc = "A traffic cone."
Item.Model = "models/props_junk/TrafficCone001a.mdl"
Item.Weight = 1
Item.Volume = 1
Item.CanDrop = true
Item.RemoveDropOnDeath = true
Item.CollidesWithCars = true
Item.JobItem = "JOB_POLICE" --This item can only be possessed by by players with this job
Item.LimitID = "traffic cone"
Item.SetupEntity = function( _, eEnt )
	eEnt.CanPlayerPickup = function( eEnt, pPlayer, bCanUse )
		return eEnt:GetPlayerOwner() == pPlayer
	end
end
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 10 )


local Item = {}
Item.Name = "Police Issue Traffic Board"
Item.Desc = "A traffic trailer board."
Item.Model = "models/noble/trailermessageboard/trailermessageboard.mdl"
Item.Weight = 2
Item.Volume = 8
Item.CanDrop = true
Item.RemoveDropOnDeath = true
Item.CollidesWithCars = true
Item.HealthOverride = 3000
Item.JobItem = "JOB_POLICE" --This item can only be possessed by by players with this job
Item.LimitID = "traffic board"
Item.SetupEntity = function( _, eEnt )
	local phys = eEnt:GetPhysicsObject()
	if IsValid( phys ) then
		phys:SetMass( 100 )
	end

	eEnt.CanPlayerPickup = function( eEnt, pPlayer, bCanUse )
		return eEnt:GetPlayerOwner() == pPlayer
	end
end
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 1 )


local Item = {}
Item.Name = "Police Issue Traffic Barrel"
Item.Desc = "A traffic trailer barrel."
Item.Model = "models/noble/trafficbarrel/traffic_barrel.mdl"
Item.Weight = 2
Item.Volume = 8
Item.HealthOverride = 1500
Item.CanDrop = true
Item.RemoveDropOnDeath = true
Item.CollidesWithCars = true
Item.JobItem = "JOB_POLICE" --This item can only be possessed by by players with this job
Item.LimitID = "traffic barrel"
Item.SetupEntity = function( _, eEnt )
	eEnt.CanPlayerPickup = function( eEnt, pPlayer, bCanUse )
		return eEnt:GetPlayerOwner() == pPlayer
	end
end
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 10 )


local Item = {}
Item.Name = "Police Issue Checkpoint"
Item.Desc = "A traffic checkpoint"
Item.Model = "models/noble/checkpoint.mdl"
Item.Weight = 2
Item.Volume = 8
Item.HealthOverride = 3000
Item.CanDrop = true
Item.RemoveDropOnDeath = true
Item.CollidesWithCars = true
Item.JobItem = "JOB_POLICE" --This item can only be possessed by by players with this job
Item.LimitID = "checkpoint"
Item.SetupEntity = function( _, eEnt )
	eEnt.CanPlayerPickup = function( eEnt, pPlayer, bCanUse )
		return eEnt:GetPlayerOwner() == pPlayer
	end
end
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 1 )


local Item = {}
Item.Name = "Police Issue Roadside Quick-Fix Kit"
Item.Desc = "A small set of parts and a few tools for fixing light damage to vehicles."
Item.Model = "models/props_c17/BriefCase001a.mdl"
Item.Weight = 30
Item.Volume = 10
Item.CanDrop = true
Item.JobItem = "JOB_POLICE" --This item can only be possessed by by players with this job
Item.LimitID = "car repair kit"
Item.DropClass = "ent_carfix_light"
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 2 )


local Item = {}
Item.Name = "Police Issue Spare Tire Kit"
Item.Desc = "A replacement set of tires for any vehicle."
Item.Model = "models/props_vehicles/carparts_wheel01a.mdl"
Item.Weight = 60
Item.Volume = 80
Item.CanDrop = true
Item.JobItem = "JOB_POLICE" --This item can only be possessed by by players with this job
Item.LimitID = "car repair kit"
Item.DropClass = "ent_carfix_wheels"
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 2 )


local Item = {}
Item.Name = "Police Issue Engine Overhaul"
Item.Desc = "A complete engine overhaul kit. Used on vehicles that have 0 health."
Item.Model = "models/props_c17/TrapPropeller_Engine.mdl"
Item.Weight = 100
Item.Volume = 80
Item.CanDrop = true
Item.JobItem = "JOB_POLICE" --This item can only be possessed by by players with this job
Item.LimitID = "car repair kit"
Item.DropClass = "ent_carfix_high"
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 2 )
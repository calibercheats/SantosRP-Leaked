
-----------------------------------------------------
--[[
	Name: job_items_city_worker.lua
	For: SantosRP
	By: Ultra
]]--

local Item = {}
Item.Name = "Lawn Mower"
Item.Desc = "Mows grass, pretty simple."
Item.Model = "models/props/de_overpass/lawn_mower.mdl"
Item.Weight = 35
Item.Volume = 50
Item.HealthOverride = 3000
Item.JobItem = "JOB_CITYWORKER"
Item.CanDrop = true
Item.RemoveDropOnDeath = true
Item.LimitID = "lawn mower"
Item.DropClass = "ent_mower"
Item.SetupEntity = function( _, entItem )
	--stuff
end
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 1 )

local Item = {}
Item.Name = "City Issue Traffic Cone"
Item.Desc = "A traffic cone."
Item.Model = "models/props_junk/TrafficCone001a.mdl"
Item.Weight = 1
Item.Volume = 1
Item.CanDrop = true
Item.RemoveDropOnDeath = true
Item.CollidesWithCars = true
Item.JobItem = "JOB_CITYWORKER"
Item.LimitID = "traffic cone"
Item.SetupEntity = function( _, eEnt )
	eEnt.CanPlayerPickup = function( eEnt, pPlayer, bCanUse )
		return eEnt:GetPlayerOwner() == pPlayer
	end
end
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 10 )

local Item = {}
Item.Name = "City Issue Traffic Barrel"
Item.Desc = "A traffic trailer barrel."
Item.Model = "models/noble/trafficbarrel/traffic_barrel.mdl"
Item.Weight = 2
Item.Volume = 8
Item.HealthOverride = 1500
Item.CanDrop = true
Item.RemoveDropOnDeath = true
Item.CollidesWithCars = true
Item.JobItem = "JOB_CITYWORKER" --This item can only be possessed by by players with this job
Item.LimitID = "traffic barrel"
Item.SetupEntity = function( _, eEnt )
	eEnt.CanPlayerPickup = function( eEnt, pPlayer, bCanUse )
		return eEnt:GetPlayerOwner() == pPlayer
	end
end
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 10 )

-----------------------------------------------------
--[[
	Name: job_items_ems.lua
	For: SantosRP
	By: Ultra
]]--

local Item = {}
Item.Name = "Government Issue Medical Supplies"
Item.Desc = "A vial of essential medical supplies, consumed by the first aid kit."
Item.Model = "models/healthvial.mdl"
Item.Type = "type_ammo"
Item.JobItem = "JOB_EMS" --This item can only be possessed by by players with this job
Item.Weight = 2
Item.Volume = 2
Item.CanDrop = false
GM.Inv:RegisterItem( Item )
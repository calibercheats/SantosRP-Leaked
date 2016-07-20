
-----------------------------------------------------
--[[
	Name: job_weapons_city_worker.lua
	For: SantosRP
	By: Ultra
]]--

local Item = {}
Item.Name = "Adjustable Wrench"
Item.Desc = "A wrench! Left click and hold to fix fire hydrants."
Item.Type = "type_weapon"
Item.Model = "models/props/de_vostok/monkeywrench01.mdl"
Item.Weight = 12
Item.Volume = 8
Item.CanDrop = false
Item.CanEquip = true
Item.JobItem = "JOB_CITYWORKER"
Item.EquipSlot = "PrimaryWeapon"
Item.EquipGiveClass = "weapon_wrench"
Item.DropClass = "weapon_wrench"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Shovel"
Item.Desc = "A shovel! Left click to clear road debris."
Item.Type = "type_weapon"
Item.Model = "models/props_junk/shovel01a.mdl"
Item.Weight = 15
Item.Volume = 18
Item.CanDrop = false
Item.CanEquip = true
Item.JobItem = "JOB_CITYWORKER"
Item.EquipSlot = "PrimaryWeapon"
Item.EquipGiveClass = "weapon_shovel"
Item.DropClass = "weapon_shovel"
GM.Inv:RegisterItem( Item )
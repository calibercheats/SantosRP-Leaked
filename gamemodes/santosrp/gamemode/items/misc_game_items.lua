
-----------------------------------------------------
--[[
	Name: misc_game_items.lua
	For: SantosRP
	By: Ultra
]]--

local Item = {}
Item.Name = "Casino Chips"
Item.Desc = "Chips for use in a casino."
Item.Model = "models/props_phx/games/chess/black_dama.mdl"
Item.Weight = 0
Item.Volume = 0
Item.CanDrop = true
Item.DropCombined = true --Make only 1 item when dropping many, allows for items to drop stacked
Item.UI_DropMany = true --Enable dropping many items in the item card ui
Item.LimitID = "casino chips"
Item.DropClass = "ent_money_chips"
Item.SetupEntity = function( _, eEnt, intAmount )
	eEnt:SetAmount( intAmount )
end
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 10 )


local Item = {}
Item.Name = "Medical Supplies"
Item.Desc = "A vial of essential medical supplies, consumed by the first aid kit."
Item.Model = "models/healthvial.mdl"
Item.Type = "type_ammo"
Item.Weight = 2
Item.Volume = 2
Item.CanDrop = true
Item.LimitID = "medical supplies"
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 20 )


local Item = {}
Item.Name = "Fuel Can"
Item.Desc = "A can of fuel."
Item.Model = "models/props_junk/gascan001a.mdl"
Item.Weight = 10
Item.Volume = 8
Item.CanDrop = true
Item.LimitID = "fuel can"
Item.DropClass = "ent_fuelcan"
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 2 )


local Item = {}
Item.Name = "Road Flare"
Item.Desc = "A road flare, drop and press E on to ignite."
Item.Model = "models/props_junk/flare.mdl"
Item.Weight = 2
Item.Volume = 1
Item.CanDrop = true
Item.LimitID = "road flare"
Item.DropClass = "ent_roadflare"
Item.DrugLab_BlenderVars = {
	BlendProgress = 10,
	BlendAmountPerTick = 0.15,
	GiveItem = "Red Phosphorous",
	GiveAmount = 4,
}
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 3 )


local Item = {}
Item.Name = "Engine Overhaul"
Item.Desc = "A complete engine overhaul kit. Used on vehicles that have 0 health."
Item.Model = "models/props_c17/TrapPropeller_Engine.mdl"
Item.Weight = 100
Item.Volume = 80
Item.CanDrop = true
Item.LimitID = "car repair kit"
Item.DropClass = "ent_carfix_high"

Item.CraftingEntClass = "ent_crafting_table"
Item.CraftSkill = "Crafting"
Item.CraftSkillLevel = 15
Item.CraftSkillXP = 5
Item.CraftRecipe = {
	["Engine Block"] = 1,
	["Car Battery"] = 1,
	["Metal Plate"] = 2,
	["Metal Pipe"] = 1,
}
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 2 )


local Item = {}
Item.Name = "Vehicle Repair Kit"
Item.Desc = "Tools and components for repairing general vehicle damage."
Item.Model = "models/props/cs_office/Cardboard_box01.mdl"
Item.Weight = 80
Item.Volume = 25
Item.CanDrop = true
Item.LimitID = "car repair kit"
Item.DropClass = "ent_carfix_medium"

Item.CraftingEntClass = "ent_crafting_table"
Item.CraftSkill = "Crafting"
Item.CraftSkillLevel = 1
Item.CraftSkillXP = 5
Item.CraftRecipe = {
	["Car Battery"] = 4,
	["Metal Plate"] = 5,
	["Metal Pipe"] = 4,
	["Crowbar"] = 5,
	["Wrench"] = 5,
	["Pliers"] = 1,
}
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 2 )


local Item = {}
Item.Name = "Roadside Quick-Fix Kit"
Item.Desc = "A small set of parts and a few tools for fixing light damage to vehicles."
Item.Model = "models/props_c17/BriefCase001a.mdl"
Item.Weight = 30
Item.Volume = 10
Item.CanDrop = true
Item.LimitID = "car repair kit"
Item.DropClass = "ent_carfix_light"

Item.CraftingEntClass = "ent_crafting_table"
Item.CraftSkill = "Crafting"
Item.CraftSkillLevel = 1
Item.CraftSkillXP = 5
Item.CraftRecipe = {
	["Metal Plate"] = 2,
	["Metal Pipe"] = 1,
	["Wrench"] = 1,
	["Pliers"] = 1,
}
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 2 )


local Item = {}
Item.Name = "Spare Tire Kit"
Item.Desc = "A replacement set of tires for any vehicle."
Item.Model = "models/props_vehicles/carparts_wheel01a.mdl"
Item.Weight = 60
Item.Volume = 80
Item.CanDrop = true
Item.LimitID = "car repair kit"
Item.DropClass = "ent_carfix_wheels"

Item.CraftingEntClass = "ent_crafting_table"
Item.CraftSkill = "Crafting"
Item.CraftSkillLevel = 1
Item.CraftSkillXP = 5
Item.CraftRecipe = {
	["Metal Plate"] = 2,
	["Metal Bracket"] = 4,
	["Wrench"] = 1,
	["Rubber Tire"] = 4,
}
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 2 )
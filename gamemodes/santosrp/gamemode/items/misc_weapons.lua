
-----------------------------------------------------
--[[
	Name: misc_weapons.lua
	For: SantosRP
	By: Ultra
]]--


local Item = {}
Item.Name = "Molotov Cocktail"
Item.Desc = "A molotov cocktail."
Item.Type = "type_weapon"
Item.Model = "models/props_junk/garbage_glassbottle003a.mdl"
Item.Weight = 3
Item.Volume = 3
Item.CanDrop = true
Item.CanEquip = true
Item.Illegal = true
Item.EquipSlot = "AltWeapon"
Item.EquipGiveClass = "weapon_molotov"
Item.DropClass = "weapon_molotov"

Item.CraftingEntClass = "ent_assembly_table"
Item.CraftingTab = "Weapons"
Item.CraftSkill = "Gun Smithing"
Item.CraftSkillLevel = 10
Item.CraftSkillXP = 2
Item.CraftRecipe = {
	["Moonshine"] = 10,
	["Cloth"] = 25,
	["Metal Bracket"] = 8,
	["Metal Plate"] = 12,
}
GM.Inv:RegisterItem( Item )


local Item = {}
Item.Name = "Flash Grenade"
Item.Desc = "A flash bang."
Item.Type = "type_weapon"
Item.Model = "models/weapons/w_eq_flashbang.mdl"
Item.Weight = 3
Item.Volume = 3
Item.CanDrop = true
Item.CanEquip = true
Item.Illegal = true
Item.EquipSlot = "AltWeapon"
Item.EquipGiveClass = "weapon_fas_grenadeflash"
Item.DropClass = "weapon_fas_grenadeflash"

Item.CraftingEntClass = "ent_assembly_table"
Item.CraftingTab = "Weapons"
Item.CraftSkill = "Gun Smithing"
Item.CraftSkillLevel = 23
Item.CraftSkillXP = 2
Item.CraftRecipe = {
	["Metal Bracket"] = 8,
	["Metal Plate"] = 12,
	["Smokeless Gunpowder"] = 8,
}
GM.Inv:RegisterItem( Item )


local Item = {}
Item.Name = "Lockpick"
Item.Desc = "A lockpick. Can unlock doors and free handcuffed players."
Item.Type = "type_weapon"
Item.Model = "models/weapons/w_crowbar.mdl"
Item.Weight = 1
Item.Volume = 1
Item.CanDrop = true
Item.CanEquip = true
Item.Illegal = true
Item.EquipSlot = "AltWeapon"
Item.EquipGiveClass = "weapon_lockpick"
Item.DropClass = "weapon_lockpick"

Item.CraftingEntClass = "ent_assembly_table"
Item.CraftingTab = "Weapons"
Item.CraftSkill = "Gun Smithing"
Item.CraftSkillLevel = 1
Item.CraftSkillXP = 2
Item.CraftRecipe = {
	["Metal Bracket"] = 2,
	["Metal Plate"] = 2,
	["Crowbar"] = 1,
}
GM.Inv:RegisterItem( Item )


local Item = {}
Item.Name = "Zip Tie"
Item.Desc = "A zip tie. Can restrain other players."
Item.Type = "type_weapon"
Item.Model = "models/katharsmodels/handcuffs/handcuffs-1.mdl"
Item.Weight = 1
Item.Volume = 1
Item.CanDrop = true
Item.CanEquip = true
Item.Illegal = true
Item.EquipSlot = "AltWeapon"
Item.EquipGiveClass = "weapon_ziptie"
Item.DropClass = "weapon_ziptie"

Item.CraftingEntClass = "ent_assembly_table"
Item.CraftingTab = "Weapons"
Item.CraftSkill = "Gun Smithing"
Item.CraftSkillLevel = 3
Item.CraftSkillXP = 2
Item.CraftRecipe = {
	["Chunk of Plastic"] = 8,
	["Metal Bracket"] = 2,
	["Pliers"] = 2,
}
GM.Inv:RegisterItem( Item )
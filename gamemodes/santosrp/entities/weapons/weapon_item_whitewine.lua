
-----------------------------------------------------
--[[
	Name: weapon_item_whitewine.lua
	For: SantosRP
	By: Ultra
]]--

if SERVER then
	AddCSLuaFile()
end

SWEP.PrintName		= "Bottle"
SWEP.Author			= "Ultra"
SWEP.Base 			= "weapon_sck_base_melee_bottle"
SWEP.Instructions	= ""

SWEP.ViewModel		= "models/weapons/c_crowbar.mdl"
SWEP.WorldModel		= "models/weapons/w_crowbar.mdl"
SWEP.ViewModelFOV	= 60
SWEP.Slot 			= 2
SWEP.UseHands 		= true

SWEP.HoldType 		= "melee"
SWEP.ShowWorldModel = false
SWEP.ShowViewModel 	= false

SWEP.AttackDelay = 1
SWEP.AttackRange = 80
SWEP.AttackDamagePlayers = 3
SWEP.AttackDamageCars = 3
SWEP.ItemID = "White Wine"

SWEP.WElements = {
	["element_name"] = { type = "Model", model = "models/foodnhouseholditems/wine_white3.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.374, 1.741, -6.94), angle = Angle(0, 0, 0), size = Vector(0.787, 0.787, 0.787), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/foodnhouseholditems/wine_white3.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.509, 1.319, -7.475), angle = Angle(-0.253, 104.76, 0), size = Vector(0.851, 0.851, 0.851), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
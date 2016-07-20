
-----------------------------------------------------
--[[
	Name: weapon_item_fishlobster.lua
	For: SantosRP
	By: Ultra
]]--

if SERVER then
	AddCSLuaFile()
end

SWEP.PrintName		= "Lobster"
SWEP.Author			= "Ultra"
SWEP.Base 			= "weapon_sck_base_melee"
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
SWEP.AttackDamagePlayers = 1
SWEP.AttackDamageCars = 1

SWEP.WElements = {
	["element_name"] = { type = "Model", model = "models/foodnhouseholditems/lobster.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.016, 1.134, -5.547), angle = Angle(179.996, -108.903, 104.277), size = Vector(0.984, 0.984, 0.984), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/foodnhouseholditems/lobster.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.042, 0.704, -6.974), angle = Angle(179.904, -21.989, 87.45), size = Vector(1.128, 1.128, 1.128), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

function SWEP:PlayHitSound()
	self:EmitSound( "physics/flesh/flesh_impact_bullet".. math.random(1, 5).. ".wav" )
end

function SWEP:PlayMissSound()
	self:EmitSound( "weapons/iceaxe/iceaxe_swing1.wav" )
end
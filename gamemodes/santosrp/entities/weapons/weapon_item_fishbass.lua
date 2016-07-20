
-----------------------------------------------------
--[[
	Name: weapon_item_fishbass.lua
	For: SantosRP
	By: Ultra
]]--

if SERVER then
	AddCSLuaFile()
end

SWEP.PrintName		= "Bass"
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
	["element_name"] = { type = "Model", model = "models/foodnhouseholditems/fishbass.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.987, 2.369, -4.407), angle = Angle(48.188, -120.395, 80.28), size = Vector(0.606, 0.606, 0.606), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/foodnhouseholditems/fishbass.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.429, 1.654, -6.725), angle = Angle(58.659, -12.757, 101.7), size = Vector(1.024, 1.024, 1.024), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

function SWEP:PlayHitSound()
	self:EmitSound( "physics/flesh/flesh_squishy_impact_hard".. math.random(2, 4).. ".wav" )
end

function SWEP:PlayMissSound()
	self:EmitSound( "weapons/iceaxe/iceaxe_swing1.wav" )
end
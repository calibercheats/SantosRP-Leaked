
-----------------------------------------------------
--[[
	Name: weapon_item_fishrainbow.lua
	For: SantosRP
	By: Ultra
]]--

if SERVER then
	AddCSLuaFile()
end

SWEP.PrintName		= "Rainbow Trout"
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
	["element_name"] = { type = "Model", model = "models/foodnhouseholditems/fishrainbow.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.016, 1.134, -6.928), angle = Angle(48.188, -120.395, 80.28), size = Vector(0.933, 0.933, 0.933), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/foodnhouseholditems/fishrainbow.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.752, 1.541, -6.974), angle = Angle(58.659, -12.757, 101.7), size = Vector(1.128, 1.128, 1.128), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

function SWEP:PlayHitSound()
	self:EmitSound( "physics/flesh/flesh_squishy_impact_hard".. math.random(2, 4).. ".wav" )
end

function SWEP:PlayMissSound()
	self:EmitSound( "weapons/iceaxe/iceaxe_swing1.wav" )
end
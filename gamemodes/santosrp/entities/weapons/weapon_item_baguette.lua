
-----------------------------------------------------
--[[
	Name: weapon_item_baguette.lua
	For: SantosRP
	By: Ultra
]]--

if SERVER then
	AddCSLuaFile()
end

SWEP.PrintName		= "Baguette"
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
	["element_name"] = { type = "Model", model = "models/foodnhouseholditems/bagette.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.529, 1.677, -4.169), angle = Angle(0, 0, 85.806), size = Vector(0.529, 0.529, 0.529), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/foodnhouseholditems/bagette.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.255, 1.506, -4.764), angle = Angle(1.003, 2.704, 87.825), size = Vector(0.528, 0.528, 0.528), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

function SWEP:PlayHitSound()
	self:EmitSound( "physics/flesh/flesh_impact_bullet".. math.random(1, 5).. ".wav" )
end

function SWEP:PlayMissSound()
	self:EmitSound( "weapons/iceaxe/iceaxe_swing1.wav" )
end
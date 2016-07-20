
-----------------------------------------------------
--[[
	Name: weapon_item_fishcatfish.lua
	For: SantosRP
	By: Ultra
]]--

if SERVER then
	AddCSLuaFile()
end

SWEP.PrintName		= "Catfish"
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
	["element_name"] = { type = "Model", model = "models/foodnhouseholditems/fishcatfish.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.52, 1.134, -6.928), angle = Angle(48.188, -120.395, 80.28), size = Vector(0.439, 0.439, 0.439), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/foodnhouseholditems/fishcatfish.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.482, -0.15, -8.377), angle = Angle(58.659, -12.757, 101.7), size = Vector(0.639, 0.639, 0.639), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

function SWEP:PlayHitSound()
	self:EmitSound( "physics/flesh/flesh_squishy_impact_hard".. math.random(2, 4).. ".wav" )
end

function SWEP:PlayMissSound()
	self:EmitSound( "weapons/iceaxe/iceaxe_swing1.wav" )
end
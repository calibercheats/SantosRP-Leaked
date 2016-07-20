
-----------------------------------------------------
--[[
	Name: weapon_item_wrench.lua
	For: SantosRP
	By: Ultra
]]--

if SERVER then
	AddCSLuaFile()
end

SWEP.PrintName		= "Wrench"
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
SWEP.AttackDamagePlayers = 5
SWEP.AttackDamageCars = 5

SWEP.WElements = {
	["element_name"] = { type = "Model", model = "models/props_c17/tools_wrench01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.986, 1.868, -1.099), angle = Angle(0, -31.879, -94.76), size = Vector(1.021, 1.021, 1.021), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/props_c17/tools_wrench01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.184, 1.537, -3.279), angle = Angle(0, 156.091, -88.274), size = Vector(1.021, 1.021, 1.021), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

function SWEP:PlayHitSound()
	self:EmitSound( "weapons/knife/knife_hit_0".. math.random(1, 5).. ".wav" )
end

function SWEP:PlayMissSound()
	self:EmitSound( "weapons/iceaxe/iceaxe_swing1.wav" )
end
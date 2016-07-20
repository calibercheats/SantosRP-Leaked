
-----------------------------------------------------
--[[
	Name: weapon_item_crowbar.lua
	For: SantosRP
	By: Ultra
]]--

if SERVER then
	AddCSLuaFile()
end

SWEP.PrintName		= "Crowbar"
SWEP.Author			= "Ultra"
SWEP.Base 			= "weapon_sck_base_melee"
SWEP.Instructions	= ""

SWEP.ViewModel		= "models/weapons/c_crowbar.mdl"
SWEP.WorldModel		= "models/weapons/w_crowbar.mdl"
SWEP.ViewModelFOV	= 60
SWEP.Slot 			= 2
SWEP.UseHands 		= true

SWEP.HoldType 		= "melee"
SWEP.ShowWorldModel = true
SWEP.ShowViewModel 	= true

SWEP.AttackDelay = 1
SWEP.AttackRange = 80
SWEP.AttackDamagePlayers = 5
SWEP.AttackDamageCars = 5

SWEP.WElements = {}
SWEP.VElements = {}

function SWEP:PlayHitSound()
	self:EmitSound( "weapons/knife/knife_hit_0".. math.random(1, 5).. ".wav" )
end

function SWEP:PlayMissSound()
	self:EmitSound( "weapons/iceaxe/iceaxe_swing1.wav" )
end
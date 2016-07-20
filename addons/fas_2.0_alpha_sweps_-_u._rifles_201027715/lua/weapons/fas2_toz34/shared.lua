
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 9
end

if CLIENT then
    SWEP.PrintName = "TOZ-34"
    SWEP.Slot = 3
    SWEP.SlotPos = 0
	SWEP.DrawAmmo = false
	SWEP.MagText = "TUBE "

    SWEP.AimPos = Vector(-2, -3.586, 1.682)
    SWEP.AimAng = Vector(0.763, -0.002, 0)
	
	SWEP.CompM4Pos = Vector(-2.2, -2.5, 0.1)
	SWEP.CompM4Ang = Vector(0, 0, 0)
	
	SWEP.EoTechPos = Vector(-2.2, -5, -0.1)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.ELCANPos = Vector(-2.21, -4, -0.05)
	SWEP.ELCANAng = Vector(-0.631, 0, 0)
	
	SWEP.MuzzleEffect = "muzzleflash_shotgun"
	SWEP.Shell = nil
		
	SWEP.WMAng = Vector(0, 0, 180)
	SWEP.WMPos = Vector(-4.25, -10, 7)
end

SWEP.NoProficiency = true

SWEP.BulletLength = 5.45
SWEP.CaseLength = 39
SWEP.EmptySound = Sound("weapons/empty_shotguns.wav")

SWEP.Anims = {}
SWEP.Anims.Draw_First = "draw"
SWEP.Anims.Draw = "draw"
SWEP.Anims.Draw_Empty = "draw_empty"
SWEP.Anims.Holster = "holster"
SWEP.Anims.Holster_Empty = "holster"
SWEP.Anims.Fire = "fire01"
SWEP.Anims.Fire_Aiming = "fire_iron"
SWEP.Anims.Idle = "idle"
SWEP.Anims.Idle_Aim = "idle_iron"
SWEP.Anims.Reload = "reload"
SWEP.Anims.Reload_Nomen = "reload"
SWEP.Anims.Reload_Empty = "reload_empty"
SWEP.Anims.Reload_Empty_Nomen = "reload_empty"

SWEP.Sounds = {}
SWEP.Sounds["draw"] = {[1] = {time = 0.2, sound = Sound("FAS2_M79.Close")}}
	
SWEP.Sounds["reload"] = {[1] = {time = 0.65, sound = Sound("FAS2_TOZ34.OpenStart")},
	[2] = {time = 1.15, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.5, sound = Sound("FAS2_M3S90.GetAmmo")},
	[4] = {time = 3.6, sound = Sound("FAS2_M3S90.LoadEjectorPort")},
	[5] = {time = 4.7, sound = Sound("FAS2_TOZ34.Close")}}
	
SWEP.Sounds["reload_empty"] = {[1] = {time = 0.65, sound = Sound("FAS2_TOZ34.OpenStart")},
	[2] = {time = 0.8, sound = Sound("FAS2_TOZ34.OpenFinish")},
	[3] = {time = 2.3, sound = Sound("FAS2_M3S90.LoadEjectorPort")},
	[4] = {time = 2.65, sound = Sound("FAS2_TOZ34.ShellIn")},
	[5] = {time = 2.9, sound = Sound("FAS2_SR25.MagSlap")},
	[6] = {time = 3.65, sound = Sound("FAS2_TOZ34.Close")}}
	
	--[[[2] = {time = 1.15, sound = Sound("MagPouch_AR")},
	[3] = {time = 2.3, sound = Sound("FAS2_M3S90.LoadEjectorPort")},
	[4] = {time = 2.6, sound = Sound("FAS2_M3S90.Load")},
	[5] = {time = 2.9, sound = Sound("FAS2_SR25.MagSlap")},
	[6] = {time = 3.65, sound = Sound("FAS2_M79.Close")}}]]--
	
SWEP.FireModes = {"break"}

SWEP.Category = "FA:S 2 Weapons"
SWEP.Base = "fas2_base"
SWEP.Author            = "Spy"
SWEP.Contact        = ""
SWEP.Purpose        = ""

SWEP.ViewModelFOV    = 60
SWEP.ViewModelFlip    = false

SWEP.Spawnable            = true
SWEP.AdminSpawnable        = true

SWEP.VM = "models/weapons/view/shotguns/toz34.mdl"
SWEP.WM = "models/weapons/world/rifles/ak12.mdl"
SWEP.WorldModel   = "models/weapons/world/rifles/ak12.mdl"

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = 2
SWEP.Primary.DefaultClip    = 0
SWEP.Primary.Automatic       = false    
SWEP.Primary.Ammo             = "12 Gauge"
 
-- Secondary Fire Attributes --
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic       = false
SWEP.Secondary.Ammo         = "none"

-- Deploy related
SWEP.FirstDeployTime = 1.5
SWEP.DeployTime = 1.5
SWEP.DeployAnimSpeed = 1

-- Firing related
SWEP.Shots = 12
SWEP.FireDelay = 0.15
SWEP.Damage = 11
SWEP.FireSound = Sound("FAS2_KS23")

-- Accuracy related
SWEP.HipCone = 0.06
SWEP.AimCone = 0.003
SWEP.SpreadPerShot = 0.03
SWEP.MaxSpreadInc = 0.04
SWEP.SpreadCooldown = 0.4
SWEP.VelocitySensitivity = 1.8
SWEP.AimFOV = 5
SWEP.ClumpSpread = 0.008

-- Recoil related
SWEP.ViewKick = 4
SWEP.Recoil = 3.5

-- Reload related
SWEP.ReloadTime = 5.6
SWEP.ReloadTime_Empty = 4.6
SWEP.CantChamber = true
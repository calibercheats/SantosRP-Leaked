
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 4
end

if CLIENT then
    SWEP.PrintName = "AK-74"
    SWEP.Slot = 3
    SWEP.SlotPos = 0
	SWEP.DrawAmmo = false
	
	SWEP.AimPos = Vector(-2.201, -4.646, 0.675)
	SWEP.AimAng = Vector(0.264, 0, 0)
	
	SWEP.CompM4Pos = Vector(-2.2, -2.5, -0.31)
	SWEP.CompM4Ang = Vector(0, 0, 0)
	
	SWEP.MuzzleEffect = "muzzleflash_ak74"
	SWEP.Shell = "5.45x39"
	SWEP.AttachmentBGs = {["compm4"] = {bg = 3, sbg = 1},
		["suppressor"] = {bg = 2, sbg = 1}}
		
	SWEP.WMAng = Vector(0, 180, 180)
	SWEP.WMPos = Vector(1, -3, 0.25)
end

SWEP.Attachments = {
	[1] = {header = "Sight", sight = true, x = 800, y = -50, atts = {"compm4"}},
	[2] = {header = "Barrel", y = -200, atts = {"suppressor"}}}

SWEP.BulletLength = 5.45
SWEP.CaseLength = 39
SWEP.EmptySound = Sound("weapons/empty_assaultrifles.wav")

SWEP.Anims = {}
SWEP.Anims.Draw_First = "deploy"
SWEP.Anims.Draw = "deploy"
SWEP.Anims.Holster = "holster"
SWEP.Anims.Fire = "fire"
SWEP.Anims.Fire_Aiming = "fire_scoped"
SWEP.Anims.Idle = "idle"
SWEP.Anims.Idle_Aim = "idle_scoped"
SWEP.Anims.Reload = "reload"
SWEP.Anims.Reload_Nomen = "reload_nomen"
SWEP.Anims.Reload_Empty = "reload_empty"
SWEP.Anims.Reload_Empty_Nomen = "reload_empty_nomen"

SWEP.Sounds = {}
SWEP.Sounds["reload"] = {[1] = {time = 1, sound = Sound("Weapon_ak74.MagOut")},
	[2] = {time = 1.5, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.9, sound = Sound("Weapon_ak74.MagIn")}}
	
SWEP.Sounds["reload_nomen"] = {[1] = {time = 0.6, sound = Sound("Weapon_ak74.MagOut")},
	[2] = {time = 1.2, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.8, sound = Sound("Weapon_ak74.MagIn")}}
	
SWEP.Sounds["reload_empty"] = {[1] = {time = 0.7, sound = Sound("Weapon_ak74.MagOutEmpty")},
	[2] = {time = 1.15, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.85, sound = Sound("Weapon_ak74.MagIn")},
	[4] = {time = 2.9, sound = Sound("Weapon_ak74.BoltPull")}}
	
SWEP.Sounds["reload_empty_nomen"] = {[1] = {time = 0.8, sound = Sound("MagPouch_AR")},
	[2] = {time = 1.5, sound = Sound("Weapon_ak74.MagOutEmptyNomen")},
	[3] = {time = 1.8, sound = Sound("Weapon_ak74.MagIn")},
	[4] = {time = 2.5, sound = Sound("Weapon_ak74.BoltPull")}}
	
SWEP.FireModes = {"auto", "semi"}

SWEP.Category = "FA:S 2 Weapons"
SWEP.Base = "fas2_base"
SWEP.Author            = "Spy"
SWEP.Contact        = ""
SWEP.Purpose        = ""

SWEP.ViewModelFOV    = 60
SWEP.ViewModelFlip    = false

SWEP.Spawnable            = true
SWEP.AdminSpawnable        = true

SWEP.VM = "models/weapons/view/rifles/ak74.mdl"
SWEP.WM = "models/weapons/w_ak47.mdl"
SWEP.WorldModel   = "models/weapons/w_rif_ak47.mdl"

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = 30
SWEP.Primary.DefaultClip    = 0
SWEP.Primary.Automatic       = true    
SWEP.Primary.Ammo             = "5.45x39MM"
 
-- Secondary Fire Attributes --
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic       = false
SWEP.Secondary.Ammo         = "none"

-- Deploy related
SWEP.FirstDeployTime = 0.45
SWEP.DeployTime = 0.8
SWEP.DeployAnimSpeed = 0.5

-- Firing related
SWEP.Shots = 1
SWEP.FireDelay = 0.1
SWEP.Damage = 32
SWEP.FireSound = Sound("FAS2_AK74")
SWEP.FireSound_Suppressed = Sound("FAS2_AK74_S")

-- Accuracy related
SWEP.HipCone = 0.05
SWEP.AimCone = 0.005
SWEP.SpreadPerShot = 0.007
SWEP.MaxSpreadInc = 0.03
SWEP.SpreadCooldown = 0.18
SWEP.VelocitySensitivity = 1.8
SWEP.AimFOV = 5

-- Recoil related
SWEP.ViewKick = 1.2
SWEP.Recoil = 0.85

-- Reload related
SWEP.ReloadTime = 2.6
SWEP.ReloadTime_Nomen = 2.2
SWEP.ReloadTime_Empty = 3.3
SWEP.ReloadTime_Empty_Nomen = 3
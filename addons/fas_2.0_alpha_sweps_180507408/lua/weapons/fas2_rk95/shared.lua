
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 4
end

if CLIENT then
    SWEP.PrintName = "Sako RK-95"
    SWEP.Slot = 3
    SWEP.SlotPos = 0
	
	SWEP.AimPos = Vector(-2.997, -4.053, 0.437)
	SWEP.AimAng = Vector(-0.084, 0, 0)
	
	SWEP.CompM4Pos = Vector(-2.997, -2, -0.01)
	SWEP.CompM4Ang = Vector(-0.084, 0, 0)
	SWEP.YawMod = 0.1
	
	SWEP.MuzzleEffect = "muzzleflash_ak47"
	SWEP.Shell = "7.62x39"
	SWEP.AttachmentBGs = {["compm4"] = {bg = 3, sbg = 1},
		["suppressor"] = {bg = 2, sbg = 1}}
		
	SWEP.WMAng = Vector(0, 0, 180)
	SWEP.WMPos = Vector(-1, 6.5, 2.5)
end

SWEP.Attachments = {
	[1] = {header = "Sight", sight = true, x = 800, y = -50, atts = {"compm4"}},
	[2] = {header = "Barrel", y = -200, atts = {"suppressor"}}}

SWEP.BulletLength = 5.56
SWEP.CaseLength = 45
SWEP.EmptySound = Sound("weapons/empty_assaultrifles.wav")

SWEP.Anims = {}
SWEP.Anims.Draw_First = "draw"
SWEP.Anims.Draw = "draw"
SWEP.Anims.Holster = "holster"
SWEP.Anims.Holster_Empty = "holster_empty"
SWEP.Anims.Fire = "fire"
SWEP.Anims.Fire_Last = "fire_last"
SWEP.Anims.Fire_Aiming = "fire_scoped"
SWEP.Anims.Fire_Aiming_Last = "fire_last_scoped"
SWEP.Anims.Idle = "idle"
SWEP.Anims.Idle_Aim = "idle_scoped"
SWEP.Anims.Reload = "reload"
SWEP.Anims.Reload_Nomen = "reload_nomen"
SWEP.Anims.Reload_Empty = "reload_empty"
SWEP.Anims.Reload_Empty_Nomen = "reload_empty_nomen"

SWEP.Sounds = {}
SWEP.Sounds["reload"] = {[1] = {time = 0.7, sound = Sound("Weapon_Sako95.MagOut")},
	[2] = {time = 1.5, sound = Sound("MagPouch_AR")},
	[3] = {time = 2, sound = Sound("Weapon_Sako95.MagIn")}}
	
SWEP.Sounds["reload_nomen"] = {[1] = {time = 0.6, sound = Sound("Weapon_Sako95.MagOut")},
	[2] = {time = 1.2, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.55, sound = Sound("Weapon_Sako95.MagIn")}}
	
SWEP.Sounds["reload_empty"] = {[1] = {time = 0.7, sound = Sound("Weapon_Sako95.MagOutEmpty")},
	[2] = {time = 1.15, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.9, sound = Sound("Weapon_Sako95.MagIn")},
	[4] = {time = 3.2, sound = Sound("Weapon_Sako95.BoltBack")},
	[5] = {time = 3.5, sound = Sound("Weapon_Sako95.BoltForward")}}
	
SWEP.Sounds["reload_empty_nomen"] = {[1] = {time = 0.6, sound = Sound("Weapon_Sako95.MagOutEmpty")},
	[2] = {time = 1.15, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.6, sound = Sound("Weapon_Sako95.MagIn")},
	[4] = {time = 2.6, sound = Sound("Weapon_Sako95.BoltBack")},
	[5] = {time = 2.8, sound = Sound("Weapon_Sako95.BoltForward")}}
	
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

SWEP.VM = "models/weapons/view/rifles/rk95.mdl"
SWEP.WM = "models/weapons/world/rifles/rk95.mdl"
SWEP.WorldModel   = "models/weapons/w_rif_ak47.mdl"

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = 30
SWEP.Primary.DefaultClip    = 0
SWEP.Primary.Automatic       = true    
SWEP.Primary.Ammo             = "7.62x39MM"
 
-- Secondary Fire Attributes --
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic       = false
SWEP.Secondary.Ammo         = "none"

-- Deploy related
SWEP.FirstDeployTime = 0.45
SWEP.DeployTime = 0.7
SWEP.DeployAnimSpeed = 0.5

-- Firing related
SWEP.Shots = 1
SWEP.FireDelay = 0.08
SWEP.Damage = 34
SWEP.FireSound = Sound("FAS2_RK95")
SWEP.FireSound_Suppressed = Sound("FAS2_RK95_S")

-- Accuracy related
SWEP.HipCone = 0.05
SWEP.AimCone = 0.0055
SWEP.SpreadPerShot = 0.007
SWEP.MaxSpreadInc = 0.03
SWEP.SpreadCooldown = 0.15
SWEP.VelocitySensitivity = 1.7
SWEP.AimFOV = 5

-- Recoil related
SWEP.ViewKick = 1.1
SWEP.Recoil = 0.75

-- Reload related
SWEP.ReloadTime = 2.6
SWEP.ReloadTime_Nomen = 2.2
SWEP.ReloadTime_Empty = 3.7
SWEP.ReloadTime_Empty_Nomen = 2.8
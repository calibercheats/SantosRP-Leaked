
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 4
end

if CLIENT then
    SWEP.PrintName = "G3A3"
    SWEP.Slot = 4
    SWEP.SlotPos = 0
	
	SWEP.AimPos = Vector(-2.004, -2.652, 0.18)
	SWEP.AimAng = Vector(0.814, 0, 0)
	
	SWEP.CompM4Pos = Vector(-2, -1.5, -0.477)
	SWEP.CompM4Ang = Vector(0, 0, 0)
	
	SWEP.EoTechPos = Vector(-2, -5.191, -0.447)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.MuzzleEffect = "muzzleflash_g3"
	SWEP.Shell = "7.62x51"
	
	SWEP.AttachmentBGs = {["compm4"] = {bg = 3, sbg = 1},
		["eotech"] = {bg = 3, sbg = 2},
		["suppressor"] = {bg = 2, sbg = 1}}
		
	SWEP.WMAng = Vector(0, 180, 180)
	SWEP.WMPos = Vector(1, -3, 0.25)
end

SWEP.Attachments = {
	[1] = {header = "Sight", sight = true, x = 900, y = -50, atts = {"compm4", "eotech"}},
	[2] = {header = "Barrel", x = 50, y = -200, atts = {"suppressor"}}}

SWEP.BulletLength = 7.62
SWEP.CaseLength = 51
SWEP.EmptySound = Sound("weapons/empty_battlerifles.wav")

SWEP.Anims = {}
SWEP.Anims.Draw_First = "deploy_first"
SWEP.Anims.Draw = "draw"
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

SWEP.Sounds["deploy_first"] = {[1] = {time = 0.8, sound = Sound("Weapon_G3.BoltBack")},
	[2] = {time = 1.7, sound = Sound("MagPouch_AR")},
	[3] = {time = 3.1, sound = Sound("Weapon_G3.MagIn")},
	[4] = {time = 4.1, sound = Sound("Weapon_G3.BoltForward")}}
	
SWEP.Sounds["deploy_first2"] = {[1] = {time = 0.2, sound = Sound("Generic_Cloth")},
	[2] = {time = 0.7, sound = Sound("Weapon_M4A1.Switch")},
	[3] = {time = 0.9, sound = Sound("Generic_Cloth")}}
	
SWEP.Sounds["reload"] = {[1] = {time = 0.85, sound = Sound("Weapon_G3.MagOut")},
	[2] = {time = 1.3, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.85, sound = Sound("Weapon_G3.MagIn")}}
	
SWEP.Sounds["reload_nomen"] = {[1] = {time = 0.7, sound = Sound("Weapon_G3.MagOut")},
	[2] = {time = 1.2, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.7, sound = Sound("Weapon_G3.MagIn")}}
	
SWEP.Sounds["reload_empty"] = {[1] = {time = 0.7, sound = Sound("Weapon_G3.BoltBack")},
	[2] = {time = 2.1, sound = Sound("Weapon_G3.MagOutEmpty")},
	[3] = {time = 2.6, sound = Sound("MagPouch_AR")},
	[4] = {time = 3.2, sound = Sound("Weapon_G3.MagIn")},
	[5] = {time = 4, sound = Sound("Weapon_G3.BoltForward")}}
	
SWEP.Sounds["reload_empty_nomen"] = {[1] = {time = 0.7, sound = Sound("Weapon_G3.MagOutEmpty")},
	[2] = {time = 1.5, sound = Sound("MagPouch_AR")},
	[3] = {time = 2, sound = Sound("Weapon_G3.MagIn")},
	[4] = {time = 2.6, sound = Sound("Weapon_G3.BoltPullNomen")}}
	
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

SWEP.VM = "models/weapons/view/rifles/g3.mdl"
SWEP.WM = "models/weapons/w_g3a3.mdl"
SWEP.WorldModel   = "models/weapons/w_rif_ak47.mdl"

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = 20
SWEP.Primary.DefaultClip    = 0
SWEP.Primary.Automatic       = true    
SWEP.Primary.Ammo             = "7.62x51MM"
 
-- Secondary Fire Attributes --
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic       = false
SWEP.Secondary.Ammo         = "none"

-- Deploy related
SWEP.FirstDeployTime = 5.3
SWEP.DeployTime = 0.8
SWEP.DeployAnimSpeed = 0.5
SWEP.HolsterTime = 0.25

-- Firing related
SWEP.Shots = 1
SWEP.FireDelay = 0.12
SWEP.Damage = 42
SWEP.FireSound = Sound("FAS2_G3")
SWEP.FireSound_Suppressed = Sound("FAS2_G3_S")

-- Accuracy related
SWEP.HipCone = 0.06
SWEP.AimCone = 0.002
SWEP.SpreadPerShot = 0.01
SWEP.MaxSpreadInc = 0.03
SWEP.SpreadCooldown = 0.2
SWEP.VelocitySensitivity = 2.2
SWEP.AimFOV = 5

-- Recoil related
SWEP.ViewKick = 1.4
SWEP.Recoil = 1.1

-- Reload related
SWEP.ReloadTime = 2.3
SWEP.ReloadTime_Nomen = 2.1
SWEP.ReloadTime_Empty = 4.2
SWEP.ReloadTime_Empty_Nomen = 3.2
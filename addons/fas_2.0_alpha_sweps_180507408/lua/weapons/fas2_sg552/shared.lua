
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 5
end

if CLIENT then
    SWEP.PrintName = "SG 552"
    SWEP.Slot = 3
    SWEP.SlotPos = 0
	
	SWEP.AimPos = Vector(-1.649, -2.757, 0.463)
	SWEP.AimAng = Vector(0.282, 0, 0)
	SWEP.YawMod = 0.1
	
	SWEP.CompM4Pos = Vector(-1.65, -1, -0.03)
	SWEP.CompM4Ang = Vector(0, 0, 0)
	
	SWEP.EoTechPos = Vector(-1.65, -2.727, -0.134)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.Shell = "5.56x45"
	SWEP.AttachmentBGs = {["compm4"] = {bg = 3, sbg = 1},
		["eotech"] = {bg = 3, sbg = 2},
		["suppressor"] = {bg = 2, sbg = 1},
		["sg55x30mag"] = {bg = 4, sbg = 1}}
		
	SWEP.CustomizePos = Vector(9, -3, -0.764)
	SWEP.CustomizeAng = Vector(18.049, 50.627, 14.295)
	
	SWEP.WMAng = Vector(0, 180, 180)
	SWEP.WMPos = Vector(1, -3, 0.25)
end

SWEP.Attachments = {
	[1] = {header = "Sight", sight = true, x = 600, y = -150, atts = {"compm4", "eotech"}},
	[2] = {header = "Barrel", x = 50, y = -200, atts = {"suppressor"}},
	[3] = {header = "Magazine", y = -100, x = 400, atts = {"sg55x30mag"}}}

SWEP.BulletLength = 5.56
SWEP.CaseLength = 45
SWEP.EmptySound = Sound("weapons/empty_assaultrifles.wav")

SWEP.Anims = {}
SWEP.Anims.Draw_First = "draw_first"
SWEP.Anims.Draw = "deploy"
SWEP.Anims.Draw_Empty = "deploy_empty"
SWEP.Anims.Holster = "holster"
SWEP.Anims.Holster_Empty = "holster_empty"
SWEP.Anims.Fire = {"fire", "fire2", "fire3"}
SWEP.Anims.Fire_Last = "fire_last"
SWEP.Anims.Fire_Aiming = {"fire_scoped", "fire_scoped2", "fire_scoped3"}
SWEP.Anims.Fire_Aiming_Last = "fire_scoped_last"
SWEP.Anims.Idle = "idle"
SWEP.Anims.Idle_Aim = "idle_scoped"
SWEP.Anims.Reload = "reload"
SWEP.Anims.Reload_Nomen = "reload_nomen"
SWEP.Anims.Reload_Empty = "reload_empty"
SWEP.Anims.Reload_Empty_Nomen = "reload_empty_nomen"

SWEP.Sounds = {}

SWEP.Sounds["draw_first"] = {[1] = {time = 0.7, sound = Sound("MagPouch_AR")},
	[2] = {time = 1.5, sound = Sound("Weapon_SG550.MagIn")},
	[3] = {time = 2.45, sound = Sound("Weapon_SG550.BoltBack")},
	[4] = {time = 2.8, sound = Sound("Weapon_SG550.BoltForward")}}
	
SWEP.Sounds["reload"] = {[1] = {time = 0.45, sound = Sound("Weapon_M4A1.Switch")},
	[2] = {time = 0.65, sound = Sound("Weapon_SG550.MagOut")},
	[3] = {time = 1.3, sound = Sound("MagPouch_AR")},
	[4] = {time = 1.8, sound = Sound("Weapon_SG550.Magin")}}
	
SWEP.Sounds["reload_nomen"] = {[1] = {time = 0.3, sound = Sound("MagPouch_AR")},
	[2] = {time = 0.6, sound = Sound("Grip_Heavy")},
	[3] = {time = 0.8, sound = Sound("Weapon_SG550.MagOut")},
	[4] = {time = 1.25, sound = Sound("Weapon_SG550.Magin")}}
	
SWEP.Sounds["reload_empty"] = {[1] = {time = 0.45, sound = Sound("Weapon_M4A1.Switch")},
	[2] = {time = 0.65, sound = Sound("Weapon_SG550.MagOutEmpty")},
	[3] = {time = 1.3, sound = Sound("MagPouch_AR")},
	[4] = {time = 2.1, sound = Sound("Weapon_SG550.Magin")},
	[5] = {time = 2.8, sound = Sound("Weapon_M4A1.Boltcatch")}}
	
SWEP.Sounds["reload_empty_nomen"] = {[1] = {time = 0.3, sound = Sound("MagPouch_AR")},
	[2] = {time = 0.6, sound = Sound("Grip_Heavy")},
	[3] = {time = 0.8, sound = Sound("Weapon_SG550.MagOutEmpty")},
	[4] = {time = 1.25, sound = Sound("Weapon_SG550.Magin")},
	[5] = {time = 1.8, sound = Sound("Weapon_M4A1.Boltcatch")}}
	
SWEP.FireModes = {"auto", "3burst", "semi"}

SWEP.Category = "FA:S 2 Weapons"
SWEP.Base = "fas2_base"
SWEP.Author            = "Spy"
SWEP.Contact        = ""
SWEP.Purpose        = ""

SWEP.ViewModelFOV    = 60
SWEP.ViewModelFlip    = false

SWEP.Spawnable            = true
SWEP.AdminSpawnable        = true

SWEP.VM = "models/weapons/view/rifles/sg552.mdl"
SWEP.WM = "models/weapons/w_sg550.mdl"
SWEP.WorldModel   = "models/weapons/w_rif_ak47.mdl"

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = 20
SWEP.Primary.DefaultClip    = 0
SWEP.Primary.Automatic       = true    
SWEP.Primary.Ammo             = "5.56x45MM"
 
-- Secondary Fire Attributes --
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic       = false
SWEP.Secondary.Ammo         = "none"

-- Deploy related
SWEP.FirstDeployTime = 4
SWEP.DeployTime = 0.7
SWEP.DeployAnimSpeed = 0.75

-- Firing related
SWEP.Shots = 1
SWEP.FireDelay = 0.0857
SWEP.Damage = 27
SWEP.FireSound = Sound("FAS2_SG552")
SWEP.FireSound_Suppressed = Sound("FAS2_SG552_S")

-- Accuracy related
SWEP.HipCone = 0.042
SWEP.AimCone = 0.008
SWEP.SpreadPerShot = 0.006
SWEP.MaxSpreadInc = 0.03
SWEP.SpreadCooldown = 0.15
SWEP.VelocitySensitivity = 1.55
SWEP.AimFOV = 5

-- Recoil related
SWEP.ViewKick = 0.9
SWEP.Recoil = 0.66

-- Reload related
SWEP.ReloadTime = 2.6
SWEP.ReloadTime_Nomen = 1.9
SWEP.ReloadTime_Empty = 3.4
SWEP.ReloadTime_Empty_Nomen = 2.3
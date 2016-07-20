
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 6
end

if CLIENT then
    SWEP.PrintName = "MP5K"
    SWEP.Slot = 2
    SWEP.SlotPos = 0
	
	SWEP.AimPos = Vector(-1.969, -3.449, 0.958)
	SWEP.AimAng = Vector(0, 0, 0)
		
	SWEP.CompM4Pos = Vector(-1.969, -3.449, 0.3)
	SWEP.CompM4Ang = Vector(0, 0, 0)
	
	SWEP.YawMod = 0.1
	
	SWEP.MuzzleEffect = "muzzleflash_smg"
	SWEP.Shell = "9x19"
	SWEP.AttachmentBGs = {["suppressor"] = {bg = 3, sbg = 1},
	["mp5k30mag"] = {bg = 4, sbg = 1}}
	
	SWEP.WMAng = Vector(0, 180, 180)
	SWEP.WMPos = Vector(1, -3, 0.25)
end

SWEP.Attachments = {[1] = {header = "Barrel", x = -10, y = -100, atts = {"suppressor"}},
	[2] = {header = "Magazine", x = 100, atts = {"mp5k30mag"}}}

SWEP.BulletLength = 9
SWEP.CaseLength = 17.3

SWEP.Anims = {}
SWEP.Anims.Draw_First = "deploy_first"
SWEP.Anims.Draw = "deploy"
SWEP.Anims.Draw_Empty = "deploy_empty"
SWEP.Anims.Holster = "holster"
SWEP.Anims.Holster_Empty = "holster_empty"
SWEP.Anims.Fire = {"shoot", "shoot2", "shoot3"}
SWEP.Anims.Fire_Last = "shoot_last"
SWEP.Anims.Fire_Aiming = "shoot_scoped"
SWEP.Anims.Fire_Aiming_Last = "shoot_last_scoped"
SWEP.Anims.Idle = "idle"
SWEP.Anims.Idle_Aim = "idle_scoped"
SWEP.Anims.Reload = "reload"
SWEP.Anims.Reload_Nomen = "reload_nomen"
SWEP.Anims.Reload_Empty = "reload_empty"
SWEP.Anims.Reload_Empty_Nomen = "reload_empty_nomen"

SWEP.Sounds = {}

SWEP.Sounds["deploy_first"] = {[1] = {time = 0.65, sound = Sound("FAS2_MP5A5.SelectorSwitch")}}
	
SWEP.Sounds["reload"] = {[1] = {time = 0.6, sound = Sound("FAS2_MP5A5.MagOut")},
	[2] = {time = 1.2, sound = Sound("MagPouch_SMG")},
	[3] = {time = 2.15, sound = Sound("FAS2_MP5A5.MagIn")}}
	
SWEP.Sounds["reload_nomen"] = {[1] = {time = 0.45, sound = Sound("FAS2_MP5A5.MagOut")},
	[2] = {time = 1, sound = Sound("MagPouch_SMG")},
	[3] = {time = 1.55, sound = Sound("FAS2_MP5A5.MagIn")}}
	
SWEP.Sounds["reload_empty"] = {[1] = {time = 0.4, sound = Sound("FAS2_MP5A5.BoltPull")},
	[2] = {time = 0.7, sound = Sound("MagPouch_SMG")},
	[3] = {time = 1, sound = Sound("FAS2_MP5A5.MagOutEmpty")},
	[4] = {time = 2.15, sound = Sound("FAS2_MP5A5.MagIn")},
	[5] = {time = 2.8, sound = Sound("FAS2_MP5A5.BoltCatch")}}
	
SWEP.Sounds["reload_empty_nomen"] = {[1] = {time = 0.5, sound = Sound("MagPouch_SMG")},
	[2] = {time = 0.7, sound = Sound("FAS2_MP5A5.MagOut")},
	[3] = {time = 1.1, sound = Sound("FAS2_MP5A5.MagIn")},
	[4] = {time = 1.7, sound = Sound("FAS2_MP5K.BoltBack")},
	[5] = {time = 1.85, sound = Sound("FAS2_MP5K.BoltForward")}}
	
SWEP.FireModes = {"auto", "3burst", "semi"}

SWEP.Category = "FA:S 2 Weapons"
SWEP.Base = "fas2_base"
SWEP.Author            = "Spy"
SWEP.Instructions    = ""
SWEP.Contact        = ""
SWEP.Purpose        = ""

SWEP.ViewModelFOV    = 60
SWEP.ViewModelFlip    = false

SWEP.Spawnable            = true
SWEP.AdminSpawnable        = true

SWEP.VM = "models/weapons/view/smgs/mp5k.mdl"
SWEP.WM = "models/weapons/w_mp5.mdl"
SWEP.WorldModel   = "models/weapons/w_smg_mp5.mdl"

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = 15
SWEP.Primary.DefaultClip    = 0
SWEP.Primary.Automatic       = true    
SWEP.Primary.Ammo             = "9x19MM"
 
-- Secondary Fire Attributes --
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic       = false
SWEP.Secondary.Ammo         = "none"

-- Deploy related
SWEP.FirstDeployTime = 1.1
SWEP.DeployTime = 0.6
SWEP.DeployAnimSpeed = 0.75

-- Firing related
SWEP.Shots = 1
SWEP.FireDelay = 0.0666
SWEP.Damage = 18
SWEP.FireSound = Sound("FAS2_MP5K")
SWEP.FireSound_Suppressed = Sound("FAS2_MP5K_S")

-- Accuracy related
SWEP.HipCone = 0.034
SWEP.AimCone = 0.013
SWEP.SpreadPerShot = 0.006
SWEP.MaxSpreadInc = 0.03
SWEP.SpreadCooldown = 0.15
SWEP.VelocitySensitivity = 1.4
SWEP.AimFOV = 5

-- Recoil related
SWEP.ViewKick = 0.7
SWEP.Recoil = 0.6

-- Reload related
SWEP.ReloadTime = 2.7
SWEP.ReloadTime_Nomen = 1.9
SWEP.ReloadTime_Empty = 3.2
SWEP.ReloadTime_Empty_Nomen = 2.3
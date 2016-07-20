
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 2
end

if CLIENT then
    SWEP.PrintName = "PP-19 Bizon"
    SWEP.Slot = 2
    SWEP.SlotPos = 0
	
	SWEP.AimPos = Vector(-1.742, -2, 0.386)
	SWEP.AimAng = Vector(0, 0, 0)
	
	SWEP.CompM4Pos = Vector(-1.742, 0, -0.33)
	SWEP.CompM4Ang = Vector(0, 0, 0)
	//SWEP.SprintPos = Vector(0, 0, 1)
	//SWEP.SprintAng = Vector(-20, 0, 0)
	
	//SWEP.MoveType = 3
	SWEP.YawMod = 0.1
	
	SWEP.MuzzleEffect = "muzzleflash_smg"
	SWEP.Shell = "9x18"
	SWEP.AttachmentBGs = {["suppressor"] = {bg = 2, sbg = 1},
	["compm4"] = {bg = 3, sbg = 1}}
	
	SWEP.WMAng = Vector(0, 0, 180)
	SWEP.WMPos = Vector(0, -6, -1.25)
end

SWEP.Attachments = {
	[1] = {header = "Sight", sight = true, x = 400, y = -50, atts = {"compm4"}},
	[2] = {header = "Barrel", y = -200, atts = {"suppressor"}}}

SWEP.BulletLength = 9
SWEP.CaseLength = 17.3

SWEP.Anims = {}
SWEP.Anims.Draw_First = "deploy"
SWEP.Anims.Draw = "deploy"
SWEP.Anims.Draw_Empty = "deploy_empty"
SWEP.Anims.Holster = "holster"
SWEP.Anims.Holster_Empty = "holster_empty"
SWEP.Anims.Fire = "fire"
SWEP.Anims.Fire_Aiming = "fire_ironsight"
SWEP.Anims.Idle = "idle"
SWEP.Anims.Idle_Aim = "idle_scoped"
SWEP.Anims.Reload = "reload"
SWEP.Anims.Reload_Nomen = "reload_nomen"
SWEP.Anims.Reload_Empty = "reload_empty"
SWEP.Anims.Reload_Empty_Nomen = "reload_empty_nomen"

SWEP.Sounds = {}
SWEP.Sounds["reload"] = {[1] = {time = 0.8, sound = Sound("FAS2_PP19.MagLatch")},
	[2] = {time = 1.1, sound = Sound("FAS2_PP19.MagOut")},
	[3] = {time = 1, sound = Sound("MagPouch_SMG")},
	[4] = {time = 2.2, sound = Sound("FAS2_PP19.MagLatch")},
	[5] = {time = 2.6, sound = Sound("FAS2_PP19.MagIn")}}
	
SWEP.Sounds["reload_nomen"] = {[1] = {time = 0.3, sound = Sound("FAS2_PP19.MagLatch")},
	[2] = {time = 0.5, sound = Sound("FAS2_PP19.MagOut")},
	[3] = {time = 1, sound = Sound("MagPouch_SMG")},
	[4] = {time = 1.6, sound = Sound("FAS2_PP19.MagLatch")},
	[5] = {time = 2, sound = Sound("FAS2_PP19.MagIn")}}
	
SWEP.Sounds["reload_empty"] = {[1] = {time = 1.2, sound = Sound("FAS2_PP19.MagLatch")},
	[2] = {time = 1.7, sound = Sound("FAS2_PP19.MagOutEmpty")},
	[3] = {time = 2, sound = Sound("MagPouch_SMG")},
	[4] = {time = 2.8, sound = Sound("FAS2_PP19.MagLatch")},
	[5] = {time = 3.2, sound = Sound("FAS2_PP19.MagIn")},
	[6] = {time = 4.1, sound = Sound("FAS2_PP19.BoltPull")}}
	
SWEP.Sounds["reload_empty_nomen"] = {[1] = {time = 0.3, sound = Sound("FAS2_PP19.MagLatch")},
	[2] = {time = 0.5, sound = Sound("FAS2_PP19.MagOutEmpty")},
	[3] = {time = 1, sound = Sound("MagPouch_SMG")},
	[4] = {time = 1.6, sound = Sound("FAS2_PP19.MagLatch")},
	[5] = {time = 2, sound = Sound("FAS2_PP19.MagIn")},
	[6] = {time = 2.7, sound = Sound("FAS2_PP19.BoltPull")}}
	
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

SWEP.VM = "models/weapons/view/smgs/bizon.mdl"
SWEP.WM = "models/weapons/w_smg_biz.mdl"
SWEP.WorldModel   = "models/weapons/w_smg_biz.mdl"

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = 64
SWEP.Primary.DefaultClip    = 0
SWEP.Primary.Automatic       = true    
SWEP.Primary.Ammo             = "9x18MM"
 
-- Secondary Fire Attributes --
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic       = false
SWEP.Secondary.Ammo         = "none"

-- Deploy related
SWEP.FirstDeployTime = 0.45
SWEP.DeployTime = 0.55
SWEP.DeployAnimSpeed = 0.5

-- Firing related
SWEP.Shots = 1
SWEP.FireDelay = 0.085
SWEP.Damage = 14
SWEP.FireSound = Sound("FAS2_PP19")
SWEP.FireSound_Suppressed = Sound("FAS2_PP19_S")

-- Accuracy related
SWEP.HipCone = 0.036
SWEP.AimCone = 0.013
SWEP.SpreadPerShot = 0.007
SWEP.MaxSpreadInc = 0.03
SWEP.SpreadCooldown = 0.2
SWEP.VelocitySensitivity = 1.6
SWEP.AimFOV = 5

-- Recoil related
SWEP.ViewKick = 0.6
SWEP.Recoil = 0.5

-- Reload related
SWEP.ReloadTime = 2.9
SWEP.ReloadTime_Nomen = 2.3
SWEP.ReloadTime_Empty = 4
SWEP.ReloadTime_Empty_Nomen = 3
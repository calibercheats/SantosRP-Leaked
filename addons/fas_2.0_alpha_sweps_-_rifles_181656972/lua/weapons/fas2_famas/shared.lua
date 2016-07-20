
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 5
end

if CLIENT then
    SWEP.PrintName = "FAMAS F1"
    SWEP.Slot = 3
    SWEP.SlotPos = 0
	
	SWEP.AimPos = Vector(-1.989, -5.487, 0.7)
	SWEP.AimAng = Vector(0, 0, 0)
	
	SWEP.CompM4Pos = Vector(-1.989, 0, -0.585)
	SWEP.CompM4Ang = Vector(0, 0, 0)
	
	SWEP.YawMod = 0.1
	SWEP.SuppressorBodygroup = 3
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.Shell = "5.56x45"
	SWEP.AttachmentBGs = {["compm4"] = {bg = 3, sbg = 1},
		["suppressor"] = {bg = 2, sbg = 1}}
		
	SWEP.WMAng = Vector(0, 180, 180)
	SWEP.WMPos = Vector(1, -3, 0.25)
end

SWEP.Attachments = {
	[1] = {header = "Sight", sight = true, x = 600, y = -50, atts = {"compm4"}},
	[2] = {header = "Barrel", x = 50, y = -200, atts = {"suppressor"}}}

SWEP.BulletLength = 5.56
SWEP.CaseLength = 45
SWEP.EmptySound = Sound("weapons/empty_assaultrifles.wav")

SWEP.Anims = {}
SWEP.Anims.Draw_First = "draw_first"
SWEP.Anims.Draw = "draw"
SWEP.Anims.Draw_Empty = "draw_empty"
SWEP.Anims.Holster = "holster"
SWEP.Anims.Holster_Empty = "holster_empty"
SWEP.Anims.Fire = "shoot1"
SWEP.Anims.Fire_Last = "shoot_last"
SWEP.Anims.Fire_Aiming = "shoot_ironsight"
SWEP.Anims.Fire_Aiming_Last = "shoot_last_ironsight"
SWEP.Anims.Idle = "idle"
SWEP.Anims.Idle_Aim = "idle_scoped"
SWEP.Anims.Reload = "reload"
SWEP.Anims.Reload_Nomen = "reload_nomen"
SWEP.Anims.Reload_Empty = "reload_empty"
SWEP.Anims.Reload_Empty_Nomen = "reload_empty_nomen"

SWEP.Sounds = {}

SWEP.Sounds["draw_first"] = {[1] = {time = 1.6, sound = Sound("FAS2_FAMAS.MagIn")},
	[2] = {time = 2.35, sound = Sound("FAS2_FAMAS.Cock")},
	[3] = {time = 3.4, sound = Sound("FAS2_FAMAS.SightFlip")},
	[4] = {time = 4.7, sound = Sound("FAS2_FAMAS.Selector")}}
	
SWEP.Sounds["reload"] = {[1] = {time = 0.7, sound = Sound("FAS2_FAMAS.MagOut")},
	[2] = {time = 1.2, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.65, sound = Sound("FAS2_FAMAS.MagIn")}}
	
SWEP.Sounds["reload_nomen"] = {[1] = {time = 0.5, sound = Sound("FAS2_FAMAS.MagOut")},
	[2] = {time = 1.2, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.5, sound = Sound("FAS2_FAMAS.MagIn")}}
	
SWEP.Sounds["reload_empty"] = {[1] = {time = 0.7, sound = Sound("FAS2_FAMAS.MagOutEmpty")},
	[2] = {time = 1.15, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.7, sound = Sound("FAS2_FAMAS.MagIn")},
	[4] = {time = 2.5, sound = Sound("FAS2_FAMAS.Cock")}}
	
SWEP.Sounds["reload_empty_nomen"] = {[1] = {time = 0.5, sound = Sound("FAS2_FAMAS.MagOutEmpty")},
	[2] = {time = 1.15, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.5, sound = Sound("FAS2_FAMAS.MagIn")},
	[4] = {time = 2.2, sound = Sound("FAS2_FAMAS.Cock")}}
	
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

SWEP.VM = "models/weapons/view/rifles/famas.mdl"
SWEP.WM = "models/weapons/w_famas.mdl"
SWEP.WorldModel   = "models/weapons/w_rif_famas.mdl"
SWEP.HoldType = "smg"

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = 25
SWEP.Primary.DefaultClip    = 0
SWEP.Primary.Automatic       = true    
SWEP.Primary.Ammo             = "5.56x45MM"
 
-- Secondary Fire Attributes --
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic       = false
SWEP.Secondary.Ammo         = "none"

-- Deploy related
SWEP.FirstDeployTime = 5.8
SWEP.DeployTime = 0.75
SWEP.HolsterTime = 0.2
SWEP.DeployAnimSpeed = 0.5

-- Firing related
SWEP.Shots = 1
SWEP.FireDelay = 0.06
SWEP.Damage = 27
SWEP.FireSound = Sound("FAS2_FAMAS")
SWEP.FireSound_Suppressed = Sound("FAS2_FAMAS_S")

-- Accuracy related
SWEP.HipCone = 0.047
SWEP.AimCone = 0.0035
SWEP.SpreadPerShot = 0.009
SWEP.MaxSpreadInc = 0.03
SWEP.SpreadCooldown = 0.15
SWEP.VelocitySensitivity = 1.55
SWEP.AimFOV = 5

-- Recoil related
SWEP.ViewKick = 1.15
SWEP.Recoil = 0.75

-- Reload related
SWEP.ReloadTime = 2.4
SWEP.ReloadTime_Nomen = 2
SWEP.ReloadTime_Empty = 3.3
SWEP.ReloadTime_Empty_Nomen = 2.7
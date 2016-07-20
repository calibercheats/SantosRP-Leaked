
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 6
end

if CLIENT then
    SWEP.PrintName = "IMI Desert Eagle"
    SWEP.Slot = 1
    SWEP.SlotPos = 0
	
	SWEP.AimPos = Vector(-2.42, -0.755, 0.715)
	SWEP.AimAng = Vector(0.7, 0, 0)
	
	SWEP.SprintPos = Vector(1, -7, -4.69)
	SWEP.SprintAng = Vector(58.433, 0, 0)
	
	SWEP.MoveType = 2
	SWEP.YawMod = 0.1
	
	SWEP.MuzzleEffect = "muzzleflash_pistol_deagle"
	SWEP.Shell = "50ae"
	SWEP.AttachmentBGs = {["tritiumsights"] = {bg = 2, sbg = 1}}
	
	SWEP.WMAng = Vector(0, 180, 180)
	SWEP.WMPos = Vector(1, -3, 0.75)
	SWEP.Text3DForward = -2.3
	SWEP.Text3DRight = -1
	SWEP.Text3DSize = 0.008
	SWEP.SafePosType = "pistol"
	SWEP.SwayInterpolation = "linear"
end

SWEP.Attachments = {[1] = {header = "Sight", x = 400, y = -50, atts = {"tritiumsights"}}}

SWEP.BulletLength = 12.7
SWEP.CaseLength = 32.6

SWEP.Anims = {}
SWEP.Anims.Draw_First = "deploy"
SWEP.Anims.Draw = "deploy"
SWEP.Anims.Draw_Empty = "deploy_empty"
SWEP.Anims.Holster = "holster"
SWEP.Anims.Holster_Empty = "holster_empty"
SWEP.Anims.Fire = {"fire1", "fire2", "fire3", "fire4"}
SWEP.Anims.Fire_Last = "fire_last"
SWEP.Anims.Fire_Aiming = "fire_iron"
SWEP.Anims.Fire_Aiming_Last = "fire_iron_last"
SWEP.Anims.Idle = "idle"
SWEP.Anims.Idle_Aim = "idle_scoped"
SWEP.Anims.Reload = "reload"
SWEP.Anims.Reload_Nomen = "reload_nomen"
SWEP.Anims.Reload_Empty = "reload_empty"
SWEP.Anims.Reload_Empty_Nomen = "reload_nomen_empty"

SWEP.Sounds = {}
SWEP.Sounds["reload"] = {[1] = {time = 0.5, sound = Sound("FAS2_DEAGLE.MagOut")},
	[2] = {time = 0.9, sound = Sound("MagPouch_Pistol")},
	[3] = {time = 1.4, sound = Sound("FAS2_DEAGLE.MagInPartial")},
	[4] = {time = 1.55, sound = Sound("FAS2_DEAGLE.MagIn")}}
	
SWEP.Sounds["reload_nomen"] = {[1] = {time = 0.3, sound = Sound("FAS2_DEAGLE.MagOut")},
	[2] = {time = 0.5, sound = Sound("MagPouch_Pistol")},
	[3] = {time = 0.95, sound = Sound("FAS2_DEAGLE.MagInPartial")},
	[4] = {time = 1.1, sound = Sound("FAS2_DEAGLE.MagInNomen")}}
	
SWEP.Sounds["reload_empty"] = {[1] = {time = 0.6, sound = Sound("FAS2_DEAGLE.MagOutEmpty")},
	[2] = {time = 0.9, sound = Sound("MagPouch_Pistol")},
	[3] = {time = 1.4, sound = Sound("FAS2_DEAGLE.MagInPartial")},
	[4] = {time = 1.55, sound = Sound("FAS2_DEAGLE.MagIn")},
	[5] = {time = 2.3, sound = Sound("FAS2_DEAGLE.SlideStop")}}
	
SWEP.Sounds["reload_nomen_empty"] = {[1] = {time = 0.3, sound = Sound("FAS2_DEAGLE.MagOut")},
	[2] = {time = 0.5, sound = Sound("MagPouch_Pistol")},
	[3] = {time = 0.95, sound = Sound("FAS2_DEAGLE.MagInPartial")},
	[4] = {time = 1.1, sound = Sound("FAS2_DEAGLE.MagInNomen")},
	[5] = {time = 1.6, sound = Sound("FAS2_DEAGLE.SlideStop")}}
	
SWEP.FireModes = {"semi"}

SWEP.Category = "FA:S 2 Weapons"
SWEP.Base = "fas2_base"
SWEP.Author            = "Spy"
SWEP.Contact        = ""
SWEP.Purpose        = ""
SWEP.HoldType = "pistol"
SWEP.RunHoldType = "normal"

SWEP.ViewModelFOV    = 60
SWEP.ViewModelFlip    = false

SWEP.Spawnable            = true
SWEP.AdminSpawnable        = true

SWEP.VM = "models/weapons/view/pistols/deagle.mdl"
SWEP.WM = "models/weapons/w_deserteagle.mdl"
SWEP.WorldModel = "models/weapons/w_pist_deagle.mdl"

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = 7
SWEP.Primary.DefaultClip    = 0
SWEP.Primary.Automatic       = false    
SWEP.Primary.Ammo             = ".50 AE"
 
-- Secondary Fire Attributes --
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic       = false
SWEP.Secondary.Ammo         = "none"

-- Deploy related
SWEP.FirstDeployTime = 0.45
SWEP.DeployTime = 0.45

-- Firing related
SWEP.Shots = 1
SWEP.FireDelay = 0.25
SWEP.Damage = 55
SWEP.FireSound = Sound("FAS2_DEAGLE")

-- Accuracy related
SWEP.HipCone = 0.04
SWEP.AimCone = 0.009
SWEP.SpreadPerShot = 0.02
SWEP.MaxSpreadInc = 0.055
SWEP.SpreadCooldown = 0.4
SWEP.VelocitySensitivity = 1.5
SWEP.AimFOV = 0

-- Recoil related
SWEP.ViewKick = 3.7
SWEP.Recoil = 3.2

-- Reload related
SWEP.ReloadTime = 2.1
SWEP.ReloadTime_Nomen = 1.3
SWEP.ReloadTime_Empty = 2.7
SWEP.ReloadTime_Empty_Nomen = 1.7
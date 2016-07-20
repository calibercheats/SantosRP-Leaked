
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 4
end

if CLIENT then
    SWEP.PrintName = "IMI Uzi"
    SWEP.Slot = 2
    SWEP.SlotPos = 0
	
	SWEP.AimPos = Vector(-2.316, -4.906, 1.026)
	SWEP.AimAng = Vector(0.955, 0.101, 0)

	SWEP.CompM4Pos = Vector(-2.32, -2, 0.28)
	SWEP.CompM4Ang = Vector(0, 0, 0)
	
	SWEP.MoveType = 1
	SWEP.YawMod = 0.1
	
	SWEP.MuzzleEffect = "muzzleflash_smg"
	SWEP.Shell = "9x19"
	SWEP.AttachmentBGs = {["suppressor"] = {bg = 2, sbg = 1},
	["compm4"] = {bg = 3, sbg = 1},
	["uziwoodenstock"] = {bg = 4, sbg = 1}}
	
	SWEP.WMAng = Vector(0, 180, 180)
	SWEP.WMPos = Vector(1, -3, 0.25)
end

SWEP.Attachments = {//[1] = {header = "Sight", x = 400, y = -75, atts = {"compm4"}},
	[1] = {header = "Barrel", x = 25, y = -200, atts = {"suppressor"}},
	[2] = {header = "Stock", x = 600, y = -200, atts = {"uziwoodenstock"}}}
	
SWEP.BulletLength = 9
SWEP.CaseLength = 17.3

SWEP.Anims = {}
SWEP.Anims.Draw_First = "draw_first"
SWEP.Anims.Draw = "draw"
SWEP.Anims.Draw_Empty = "draw_empty"
SWEP.Anims.Holster = "holster"
SWEP.Anims.Holster_Empty = "holster_empty"
SWEP.Anims.Fire = "shoot1"
SWEP.Anims.Fire_Aiming = "shoot_iron"
SWEP.Anims.Idle = "idle"
SWEP.Anims.Idle_Aim = "idle_scoped"
SWEP.Anims.Reload = "reload"
SWEP.Anims.Reload_Nomen = "reload_nomen"
SWEP.Anims.Reload_Empty = "reload_empty"
SWEP.Anims.Reload_Empty_Nomen = "reload_empty_nomen"

SWEP.Sounds = {}

SWEP.Sounds["draw_first"] = {[1] = {time = 0.6, sound = Sound("FAS2_UZI.StockUnfold")}}
	
SWEP.Sounds["reload"] = {[1] = {time = 0.9, sound = Sound("FAS2_UZI.MagRelease")},
	[2] = {time = 1.25, sound = Sound("FAS2_UZI.MagOut")},
	[3] = {time = 1, sound = Sound("MagPouch_SMG")},
	[4] = {time = 2.3, sound = Sound("FAS2_UZI.MagInPartial")},
	[5] = {time = 2.55, sound = Sound("FAS2_UZI.MagIn")}}
	
SWEP.Sounds["reload_nomen"] = {[1] = {time = 0.4, sound = Sound("FAS2_UZI.MagRelease")},
	[2] = {time = 0.65, sound = Sound("FAS2_UZI.MagOut")},
	[3] = {time = 1, sound = Sound("MagPouch_SMG")},
	[4] = {time = 1.2, sound = Sound("FAS2_UZI.MagInPartial")},
	[5] = {time = 1.37, sound = Sound("FAS2_UZI.MagIn")}}
	
SWEP.Sounds["reload_empty"] = {[1] = {time = 0.5, sound = Sound("FAS2_UZI.BoltBack")},
	[2] = {time = 0.8, sound = Sound("FAS2_UZI.BoltForward")},
	[3] = {time = 1.6, sound = Sound("FAS2_UZI.MagRelease")},
	[4] = {time = 2, sound = Sound("FAS2_UZI.MagOutEmpty")},
	[5] = {time = 2.2, sound = Sound("MagPouch_SMG")},
	[6] = {time = 2.7, sound = Sound("FAS2_UZI.MagInPartial")},
	[7] = {time = 3.15, sound = Sound("FAS2_UZI.MagIn")}}
	
SWEP.Sounds["reload_empty_nomen"] = {[1] = {time = 0.3, sound = Sound("FAS2_UZI.BoltBack")},
	[2] = {time = 0.5, sound = Sound("FAS2_UZI.BoltForward")},
	[3] = {time = 1.1, sound = Sound("FAS2_UZI.MagRelease")},
	[4] = {time = 1.3, sound = Sound("FAS2_UZI.MagOutEmpty")},
	[5] = {time = 1.7, sound = Sound("MagPouch_SMG")},
	[6] = {time = 1.95, sound = Sound("FAS2_UZI.MagInPartial")},
	[7] = {time = 2.1, sound = Sound("FAS2_UZI.MagIn")}}
	
SWEP.FireModes = {"auto", "semi"}

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

SWEP.VM = "models/weapons/view/smgs/uzi.mdl"
SWEP.WM = "models/weapons/w_mp5.mdl"
SWEP.WorldModel   = "models/weapons/w_smg_mp5.mdl"

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = 32
SWEP.Primary.DefaultClip    = 0
SWEP.Primary.Automatic       = true    
SWEP.Primary.Ammo             = "9x19MM"
 
-- Secondary Fire Attributes --
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic       = false
SWEP.Secondary.Ammo         = "none"

-- Deploy related
SWEP.FirstDeployTime = 3.35
SWEP.DeployTime = 0.45

-- Firing related
SWEP.Shots = 1
SWEP.FireDelay = 0.1
SWEP.Damage = 18
SWEP.FireSound = Sound("FAS2_UZI")
SWEP.FireSound_Suppressed = Sound("FAS2_UZI_S")

-- Accuracy related
SWEP.HipCone = 0.036
SWEP.AimCone = 0.011
SWEP.SpreadPerShot = 0.005
SWEP.MaxSpreadInc = 0.04
SWEP.SpreadCooldown = 0.2
SWEP.VelocitySensitivity = 1.4
SWEP.AimFOV = 0

-- Recoil related
SWEP.ViewKick = 0.5
SWEP.Recoil = 0.5

-- Reload related
SWEP.ReloadTime = 3.3
SWEP.ReloadTime_Nomen = 1.9
SWEP.ReloadTime_Empty = 3.8
SWEP.ReloadTime_Empty_Nomen = 2.25
SWEP.CantChamber = true
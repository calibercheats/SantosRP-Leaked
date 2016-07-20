
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 4
end

if CLIENT then
    SWEP.PrintName = "M11A1"
    SWEP.Slot = 2
    SWEP.SlotPos = 0
	
	SWEP.AimPos = Vector(-2.031, -5.177, 0.294)
	SWEP.AimAng = Vector(2.391, 0, 0)
	
	SWEP.SprintPos = Vector(0, -2, 2.5)
	SWEP.SprintAng = Vector(-30.433, 0, 0)
	
	SWEP.MoveType = 3
	SWEP.YawMod = 0.1
	
	SWEP.MuzzleEffect = "muzzleflash_smg"
	SWEP.Shell = "380acp"
	SWEP.AttachmentBGs = {["suppressor"] = {bg = 2, sbg = 1}}
	SWEP.Text3DForward = -3.4
	SWEP.Text3DRight = -1.4
	SWEP.Text3DSize = 0.01
	SWEP.SafePosType = "pistol"
end

SWEP.Attachments = {[1] = {header = "Barrel", x = -25, y = -75, atts = {"suppressor"}}}

SWEP.BulletLength = 9
SWEP.CaseLength = 17.3

SWEP.Anims = {}
SWEP.Anims.Draw_First = "draw"
SWEP.Anims.Draw = "draw"
SWEP.Anims.Draw_Empty = "draw_empty"
SWEP.Anims.Holster = "holster"
SWEP.Anims.Holster_Empty = "holster_empty"
SWEP.Anims.Fire = {"fire", "fire2"}
SWEP.Anims.Fire_Last = "fire_last"
SWEP.Anims.Fire_Aiming = "fire_iron"
SWEP.Anims.Fire_Aiming_Last = "fire_iron_last"
SWEP.Anims.Idle = "idle"
SWEP.Anims.Idle_Aim = "idle_scoped"
SWEP.Anims.Reload = "reload"
SWEP.Anims.Reload_Nomen = "reload_nomen"
SWEP.Anims.Reload_Empty = "reload_empty"
SWEP.Anims.Reload_Empty_Nomen = "reload_empty_nomen"

SWEP.Sounds = {}
SWEP.Sounds["reload"] = {[1] = {time = 0.9, sound = Sound("FAS2_MAC11.MagOut")},
	[2] = {time = 1, sound = Sound("MagPouch_SMG")},
	[3] = {time = 2.1, sound = Sound("FAS2_MAC11.MagIn")}}
	
SWEP.Sounds["reload_nomen"] = {[1] = {time = 0.6, sound = Sound("FAS2_MAC11.MagOut")},
	[2] = {time = 0.7, sound = Sound("MagPouch_SMG")},
	[3] = {time = 1.35, sound = Sound("FAS2_MAC11.MagIn")}}
	
SWEP.Sounds["reload_empty"] = {[1] = {time = 0.9, sound = Sound("FAS2_MAC11.MagOut")},
	[2] = {time = 1, sound = Sound("MagPouch_SMG")},
	[3] = {time = 2.1, sound = Sound("FAS2_MAC11.MagIn")},
	[4] = {time = 3, sound = Sound("FAS2_MAC11.BoltBack")},
	[5] = {time = 3.5, sound = Sound("FAS2_MAC11.BoltForward")}}
	
SWEP.Sounds["reload_empty_nomen"] = {[1] = {time = 0.6, sound = Sound("FAS2_MAC11.MagOut")},
	[2] = {time = 0.7, sound = Sound("MagPouch_SMG")},
	[3] = {time = 1.35, sound = Sound("FAS2_MAC11.MagIn")},
	[4] = {time = 2, sound = Sound("FAS2_MAC11.BoltBack")},
	[5] = {time = 2.35, sound = Sound("FAS2_MAC11.BoltForward")}}
	
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

SWEP.VM = "models/weapons/view/smgs/mac11.mdl"
SWEP.WorldModel   = "models/weapons/w_smg_mac10.mdl"

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = 32
SWEP.Primary.DefaultClip    = 0
SWEP.Primary.Automatic       = true    
SWEP.Primary.Ammo             = ".380 ACP"
 
-- Secondary Fire Attributes --
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic       = false
SWEP.Secondary.Ammo         = "none"

-- Deploy related
SWEP.FirstDeployTime = 0.6
SWEP.DeployTime = 0.6

-- Firing related
SWEP.Shots = 1
SWEP.FireDelay = 0.0375
SWEP.Damage = 16
SWEP.FireSound = Sound("FAS2_MAC11")
SWEP.FireSound_Suppressed = Sound("FAS2_MAC11_S")

-- Accuracy related
SWEP.HipCone = 0.03
SWEP.AimCone = 0.017
SWEP.SpreadPerShot = 0.005
SWEP.MaxSpreadInc = 0.05
SWEP.SpreadCooldown = 0.15
SWEP.VelocitySensitivity = 1.4
SWEP.SpreadToRecoil = 30 -- 30x additional recoil from continuous fire
SWEP.AimFOV = 0

-- Recoil related
SWEP.ViewKick = 0.5
SWEP.Recoil = 0.5

-- Reload related
SWEP.ReloadTime = 2.9
SWEP.ReloadTime_Nomen = 1.8
SWEP.ReloadTime_Empty = 4
SWEP.ReloadTime_Empty_Nomen = 2.6
SWEP.CantChamber = true
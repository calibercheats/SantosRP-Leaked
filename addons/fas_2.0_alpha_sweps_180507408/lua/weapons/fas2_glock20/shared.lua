
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 4
end

if CLIENT then
    SWEP.PrintName = "Glock-20"
    SWEP.Slot = 1
    SWEP.SlotPos = 0
	
	SWEP.AimPos = Vector(-1.43, -0.755, 0.54)
	SWEP.AimAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(1.735, -7, -4.69)
	SWEP.SprintAng = Vector(58.433, 0, 0)
	
	SWEP.MoveType = 2
	SWEP.YawMod = 0.1
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.Shell = "10x25"
	SWEP.AttachmentBGs = {["suppressor"] = {bg = 2, sbg = 1},
	["tritiumsights"] = {bg = 3, sbg = 1}}
	
	SWEP.WMAng = Vector(0, 0, 180)
	SWEP.WMPos = Vector(-1.5, 3.5, -2)
	SWEP.Text3DForward = -2
	SWEP.Text3DRight = -1
	SWEP.Text3DSize = 0.007
	SWEP.SafePosType = "pistol"
	SWEP.SwayInterpolation = "linear"
end

SWEP.Attachments = {[1] = {header = "Barrel", x = 50, y = -100, atts = {"suppressor"}},
	[2] = {header = "Sight", x = 400, y = -250, atts = {"tritiumsights"}}}

SWEP.BulletLength = 10
SWEP.CaseLength = 25

SWEP.Anims = {}
SWEP.Anims.Draw_First = "draw"
SWEP.Anims.Draw = "draw"
SWEP.Anims.Draw_Empty = "draw_Empty"
SWEP.Anims.Holster = "holster"
SWEP.Anims.Holster_Empty = "holster_empty"
SWEP.Anims.Fire = {"fire_1", "fire_2"}
SWEP.Anims.Fire_Last = "fire_last"
SWEP.Anims.Fire_Aiming = "iron_fire"
SWEP.Anims.Fire_Aiming_Last = "iron_fire_last"
SWEP.Anims.Idle = "idle"
SWEP.Anims.Idle_Aim = "idle_scoped"
SWEP.Anims.Reload = "reload"
SWEP.Anims.Reload_Nomen = "reload_nomen"
SWEP.Anims.Reload_Empty = "reload_empty"
SWEP.Anims.Reload_Empty_Nomen = "reload_empty_nomen"

SWEP.Sounds = {}
SWEP.Sounds["reload"] = {[1] = {time = 0.4, sound = Sound("FAS2_GLOCK20.MagOut")},
	[2] = {time = 0.9, sound = Sound("MagPouch_Pistol")},
	[3] = {time = 1.7, sound = Sound("FAS2_GLOCK20.MagIn")}}
	
SWEP.Sounds["reload_nomen"] = {[1] = {time = 0.2, sound = Sound("MagPouch_Pistol")},
	[2] = {time = 0.6, sound = Sound("FAS2_GLOCK20.MagOut")},
	[3] = {time = 1.05, sound = Sound("FAS2_GLOCK20.MagIn")}}
	
SWEP.Sounds["reload_empty"] = {[1] = {time = 0.4, sound = Sound("FAS2_GLOCK20.MagOut")},
	[2] = {time = 0.9, sound = Sound("MagPouch_Pistol")},
	[3] = {time = 1.55, sound = Sound("FAS2_GLOCK20.MagIn")},
	[4] = {time = 1.85, sound = Sound("FAS2_GLOCK20.SlideRelease")}}
	
SWEP.Sounds["reload_empty_nomen"] = {[1] = {time = 0.2, sound = Sound("MagPouch_Pistol")},
	[2] = {time = 0.6, sound = Sound("FAS2_GLOCK20.MagOut")},
	[3] = {time = 1.05, sound = Sound("FAS2_GLOCK20.MagIn")},
	[4] = {time = 1.2, sound = Sound("FAS2_GLOCK20.SlideRelease")}}
	
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

SWEP.VM = "models/weapons/view/pistols/glock20.mdl"
SWEP.WM = "models/weapons/w_pist_glock18.mdl"
SWEP.WorldModel   = "models/weapons/w_pist_glock18.mdl"

-- Deploy related
SWEP.FirstDeployTime = 0.45
SWEP.DeployTime = 0.45

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = 15
SWEP.Primary.DefaultClip    = 0
SWEP.Primary.Automatic       = false    
SWEP.Primary.Ammo             = "10x25MM"
 
-- Secondary Fire Attributes --
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic       = false
SWEP.Secondary.Ammo         = "none"

-- Firing related
SWEP.Shots = 1
SWEP.FireDelay = 0.13
SWEP.Damage = 20
SWEP.FireSound = Sound("FAS2_GLOCK20")
SWEP.FireSound_Suppressed = Sound("FAS2_GLOCK20_S")

-- Accuracy related
SWEP.HipCone = 0.034
SWEP.AimCone = 0.016
SWEP.SpreadPerShot = 0.008
SWEP.MaxSpreadInc = 0.03
SWEP.SpreadCooldown = 0.2
SWEP.VelocitySensitivity = 1.4
SWEP.AimFOV = 0

-- Recoil related
SWEP.ViewKick = 0.75
SWEP.Recoil = 0.6

-- Reload related
SWEP.ReloadTime = 2.3
SWEP.ReloadTime_Nomen = 1.9
SWEP.ReloadTime_Empty = 2.6
SWEP.ReloadTime_Empty_Nomen = 2.2

-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 4
end

if CLIENT then
    SWEP.PrintName = "P226"
    SWEP.Slot = 1
    SWEP.SlotPos = 0
	
	SWEP.AimPos = Vector(-1.899, -0.78, 0.915)
	SWEP.AimAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(1, -7, -4.69)
	SWEP.SprintAng = Vector(58.433, 0, 0)
	
	SWEP.MoveType = 2
	SWEP.YawMod = 0.1
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.Shell = "357sig"
	SWEP.AttachmentBGs = {["suppressor"] = {bg = 2, sbg = 1}}
	SWEP.HideWorldModel = true
	
	SWEP.WMAng = Vector(0, 0, 180)
	SWEP.WMPos = Vector(-1, 0, 0)
	SWEP.Text3DForward = -2
	SWEP.Text3DRight = -1
	SWEP.Text3DSize = 0.007
	SWEP.SafePosType = "pistol"
	SWEP.SwayInterpolation = "linear"
end

SWEP.Attachments = {[1] = {header = "Barrel", x = 50, y = -100, atts = {"suppressor"}}}

SWEP.BulletLength = 9.02
SWEP.CaseLength = 21.97

SWEP.Anims = {}
SWEP.Anims.Draw_First = "draw"
SWEP.Anims.Draw = "draw"
SWEP.Anims.Draw_Empty = "draw_empty"
SWEP.Anims.Holster = "holster"
SWEP.Anims.Holster_Empty = "holster_empty"
SWEP.Anims.Fire = {"fire1", "fire2"}
SWEP.Anims.Fire_Last = "fire_last"
SWEP.Anims.Fire_Aiming = "fire_scoped2"
SWEP.Anims.Fire_Aiming_Last = "fire_last_iron"
SWEP.Anims.Idle = "idle"
SWEP.Anims.Idle_Aim = "idle_scoped"
SWEP.Anims.Reload = "reload"
SWEP.Anims.Reload_Nomen = "reload_nomen"
SWEP.Anims.Reload_Empty = "reload_empty"
SWEP.Anims.Reload_Empty_Nomen = "reload_empty_nomen"

SWEP.Sounds = {}
SWEP.Sounds["reload"] = {[1] = {time = 0.5, sound = Sound("Weapon_p226.MagOut")},
	[2] = {time = 0.9, sound = Sound("MagPouch_Pistol")},
	[3] = {time = 1.45, sound = Sound("Weapon_p226.MagInPartial")},
	[4] = {time = 1.65, sound = Sound("Weapon_p226.MagIn")}}
	
SWEP.Sounds["reload_nomen"] = {[1] = {time = 0.5, sound = Sound("Weapon_p226.MagOut")},
	[2] = {time = 0.7, sound = Sound("MagPouch_Pistol")},
	[3] = {time = 1.15, sound = Sound("Weapon_p226.MagInPartial")},
	[4] = {time = 1.35, sound = Sound("Weapon_p226.MagIn")}}
	
SWEP.Sounds["reload_empty"] = {[1] = {time = 0.3, sound = Sound("Weapon_p226.MagOutEmpty")},
	[2] = {time = 0.5, sound = Sound("MagPouch_Pistol")},
	[3] = {time = 0.9, sound = Sound("Weapon_p226.MagInPartial")},
	[4] = {time = 1, sound = Sound("Weapon_p226.MagIn")},
	[5] = {time = 1.8, sound = Sound("Weapon_p226.SlideBack")},
	[6] = {time = 1.95, sound = Sound("Weapon_p226.SlideForward")},
	[7] = {time = 2, sound = Sound("Weapon_p226.SlideStop")}}
	
SWEP.Sounds["reload_empty_nomen"] = {[1] = {time = 0.5, sound = Sound("Weapon_p226.MagOutEmpty")},
	[2] = {time = 0.7, sound = Sound("MagPouch_Pistol")},
	[3] = {time = 1.15, sound = Sound("Weapon_p226.MagInPartial")},
	[4] = {time = 1.35, sound = Sound("Weapon_p226.MagIn")},
	[5] = {time = 1.6, sound = Sound("Weapon_p226.SlideForward")},
	[6] = {time = 1.65, sound = Sound("Weapon_p226.SlideStop")}}
	
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

SWEP.VM = "models/weapons/view/pistols/p226.mdl"
SWEP.WM   = "models/weapons/w_pist_p228.mdl"
SWEP.WorldModel   = "models/weapons/w_pist_p228.mdl"

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = 13
SWEP.Primary.DefaultClip    = 0
SWEP.Primary.Automatic       = false    
SWEP.Primary.Ammo             = ".357 SIG"
 
-- Secondary Fire Attributes --
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic       = false
SWEP.Secondary.Ammo         = "none"

-- Deploy related
SWEP.FirstDeployTime = 0.45
SWEP.DeployTime = 0.45
SWEP.DeployAnimSpeed = 0.5

-- Firing related
SWEP.Shots = 1
SWEP.FireDelay = 0.135
SWEP.Damage = 19
SWEP.FireSound = Sound("FAS2_P226")
SWEP.FireSound_Suppressed = Sound("FAS2_P226_S")

-- Accuracy related
SWEP.HipCone = 0.033
SWEP.AimCone = 0.017
SWEP.SpreadPerShot = 0.006
SWEP.MaxSpreadInc = 0.03
SWEP.SpreadCooldown = 0.2
SWEP.VelocitySensitivity = 1.2
SWEP.AimFOV = 0

-- Recoil related
SWEP.ViewKick = 0.7
SWEP.Recoil = 0.55

-- Reload related
SWEP.ReloadTime = 1.95
SWEP.ReloadTime_Nomen = 1.5
SWEP.ReloadTime_Empty = 2.2
SWEP.ReloadTime_Empty_Nomen = 1.7
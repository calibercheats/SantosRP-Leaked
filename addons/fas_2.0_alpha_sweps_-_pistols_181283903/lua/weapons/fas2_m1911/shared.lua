
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 6
end

if CLIENT then
    SWEP.PrintName = "M1911"
    SWEP.Slot = 1
    SWEP.SlotPos = 0
		
	SWEP.AimPos = Vector(-1.862, -1.555, 1.034)
	SWEP.AimAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(1.735, -6.5, -4.69)
	SWEP.SprintAng = Vector(58.433, 0, 0)
	
	SWEP.MoveType = 2
	SWEP.YawMod = 0.1
	
	SWEP.MuzzleEffect = "muzzleflash_pistol"
	SWEP.Shell = "45acp"
	SWEP.AttachmentBGs = {["suppressor"] = {bg = 2, sbg = 1}}
	
	SWEP.WMAng = Vector(0, 180, 180)
	SWEP.WMPos = Vector(1, -3, 0.75)
	SWEP.Text3DForward = -2
	SWEP.Text3DRight = -1
	SWEP.Text3DSize = 0.007
	SWEP.SafePosType = "pistol"
	SWEP.SwayInterpolation = "linear"
end

SWEP.Attachments = {[1] = {header = "Barrel", x = 20, y = -60, atts = {"suppressor"}}}

SWEP.BulletLength = 11.5
SWEP.CaseLength = 22.8

SWEP.Anims = {}
SWEP.Anims.Draw_First = "Draw"
SWEP.Anims.Draw = "Draw"
SWEP.Anims.Draw_Empty = "Draw_Empty"
SWEP.Anims.Holster = "Holster"
SWEP.Anims.Holster_Empty = "Holster_Empty"
SWEP.Anims.Fire = {"Fire1", "Fire2", "Fire3"}
SWEP.Anims.Fire_Last = "Fire_Last"
SWEP.Anims.Fire_Aiming = "Fire_Iron"
SWEP.Anims.Fire_Aiming_Last = "Fire_Last_Iron"
SWEP.Anims.Idle = "idle"
SWEP.Anims.Idle_Aim = "idle_scoped"
SWEP.Anims.Reload = "Reload"
SWEP.Anims.Reload_Nomen = "Reload_Nomen"
SWEP.Anims.Reload_Empty = "Reload_Empty"
SWEP.Anims.Reload_Empty_Nomen = "Reload_Empty_Nomen"

SWEP.Sounds = {}
SWEP.Sounds["Reload"] = {[1] = {time = 0.4, sound = Sound("Weapon_M1911.MagOut")},
	[2] = {time = 0.6, sound = Sound("MagPouch_Pistol")},
	[3] = {time = 1, sound = Sound("Weapon_M1911.MagInPartial")},
	[4] = {time = 1.15, sound = Sound("Weapon_M1911.MagIn")}}
	
SWEP.Sounds["Reload_Nomen"] = {[1] = {time = 0.2, sound = Sound("Weapon_M1911.MagOut")},
	[2] = {time = 0.4, sound = Sound("MagPouch_Pistol")},
	[3] = {time = 0.65, sound = Sound("Weapon_M1911.MagInPartial")},
	[4] = {time = 0.8, sound = Sound("Weapon_M1911.MagIn")}}
	
SWEP.Sounds["Reload_Empty"] = {[1] = {time = 0.4, sound = Sound("Weapon_M1911.MagOut")},
	[2] = {time = 0.6, sound = Sound("MagPouch_Pistol")},
	[3] = {time = 1, sound = Sound("Weapon_M1911.MagInPartial")},
	[4] = {time = 1.15, sound = Sound("Weapon_M1911.MagIn")},
	[5] = {time = 1.45, sound = Sound("Weapon_M1911.SlideRelease")}}
	
SWEP.Sounds["Reload_Empty_Nomen"] = {[1] = {time = 0.2, sound = Sound("Weapon_M1911.MagOut")},
	[2] = {time = 0.4, sound = Sound("MagPouch_Pistol")},
	[3] = {time = 0.65, sound = Sound("Weapon_M1911.MagInPartial")},
	[4] = {time = 0.8, sound = Sound("Weapon_M1911.MagIn")},
	[5] = {time = 1, sound = Sound("Weapon_M1911.SlideRelease")}}
	
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

SWEP.VM = "models/weapons/view/pistols/m1911.mdl"
SWEP.WM = "models/weapons/w_1911.mdl"
SWEP.WorldModel   = "models/weapons/w_pist_p228.mdl"

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = 7
SWEP.Primary.DefaultClip    = 0
SWEP.Primary.Automatic       = false    
SWEP.Primary.Ammo             = ".45 ACP"
 
-- Secondary Fire Attributes --
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic       = false
SWEP.Secondary.Ammo         = "none"

-- Deploy related
SWEP.FirstDeployTime = 0.45
SWEP.DeployTime = 0.45
SWEP.HolsterTime = 0.35
SWEP.DeployAnimSpeed = 0.35

-- Firing related
SWEP.Shots = 1
SWEP.FireDelay = 0.2
SWEP.Damage = 27
SWEP.FireSound = Sound("FAS2_M1911")
SWEP.FireSound_Suppressed = Sound("FAS2_M1911_S")

-- Accuracy related
SWEP.HipCone = 0.034
SWEP.AimCone = 0.015
SWEP.SpreadPerShot = 0.01
SWEP.MaxSpreadInc = 0.03
SWEP.SpreadCooldown = 0.3
SWEP.VelocitySensitivity = 1.2
SWEP.AimFOV = 0

-- Recoil related
SWEP.ViewKick = 1.45
SWEP.Recoil = 0.93

-- Reload related
SWEP.ReloadTime = 1.35
SWEP.ReloadTime_Nomen = 0.95
SWEP.ReloadTime_Empty = 1.7
SWEP.ReloadTime_Empty_Nomen = 1.1
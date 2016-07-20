
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 4
end

if CLIENT then
    SWEP.PrintName = "OTs-33 Pernach"
    SWEP.Slot = 1
    SWEP.SlotPos = 0
	
	SWEP.AimPos = Vector(-1.65, -0.786, 0.63)
	SWEP.AimAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(1, -7, -4.69)
	SWEP.SprintAng = Vector(58.433, 0, 0)
	
	SWEP.MoveType = 2
	SWEP.YawMod = 0.1
	
	SWEP.MuzzleEffect = "muzzleflash_OTS"
	SWEP.Shell = "9x18"
	
	SWEP.WMAng = Vector(0, 0, 180)
	SWEP.WMPos = Vector(-1, 7, 2.75)
	SWEP.Text3DForward = -2
	SWEP.Text3DRight = -1
	SWEP.Text3DSize = 0.007
	SWEP.SafePosType = "pistol"
	SWEP.SwayInterpolation = "linear"
end

SWEP.BulletLength = 9
SWEP.CaseLength = 18

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
SWEP.Anims.Reload = "Reload_Wet" -- WOW!!!
SWEP.Anims.Reload_Nomen = "Fast_Reload_Wet" -- HOLY SHIT
SWEP.Anims.Reload_Empty = "Reload_Dry"
SWEP.Anims.Reload_Empty_Nomen = "Fast_Reload_Dry"

SWEP.Sounds = {}
SWEP.Sounds["Reload_Wet"] = {[1] = {time = 0.4, sound = Sound("FAS2_OTS33.MagOut")},
	[2] = {time = 0.6, sound = Sound("MagPouch_Pistol")},
	[3] = {time = 1, sound = Sound("FAS2_OTS33.MagInPartial")},
	[4] = {time = 1.25, sound = Sound("FAS2_OTS33.MagIn")}}
	
SWEP.Sounds["Fast_Reload_Wet"] = {[1] = {time = 0.4, sound = Sound("FAS2_OTS33.MagOut")},
	[2] = {time = 0.6, sound = Sound("MagPouch_Pistol")},
	[3] = {time = 0.7, sound = Sound("FAS2_OTS33.MagInPartial")},
	[4] = {time = 0.9, sound = Sound("FAS2_OTS33.MagIn")}}
	
SWEP.Sounds["Reload_Dry"] = {[1] = {time = 0.4, sound = Sound("FAS2_OTS33.MagOut")},
	[2] = {time = 0.6, sound = Sound("MagPouch_Pistol")},
	[3] = {time = 1, sound = Sound("FAS2_OTS33.MagInPartial")},
	[4] = {time = 1.25, sound = Sound("FAS2_OTS33.MagIn")},
	[5] = {time = 1.9, sound = Sound("FAS2_OTS33.SlideRelease")}}
	
SWEP.Sounds["Fast_Reload_Dry"] = {[1] = {time = 0.4, sound = Sound("FAS2_OTS33.MagOut")},
	[2] = {time = 0.6, sound = Sound("MagPouch_Pistol")},
	[3] = {time = 0.7, sound = Sound("FAS2_OTS33.MagInPartial")},
	[4] = {time = 0.9, sound = Sound("FAS2_OTS33.MagIn")},
	[5] = {time = 1.2, sound = Sound("FAS2_OTS33.SlideRelease")}}
	
SWEP.FireModes = {"auto", "semi"}

SWEP.Category = "FA:S 2 Weapons"
SWEP.Base = "fas2_base"
SWEP.Author            = "Spy"
SWEP.Instructions    = ""
SWEP.Contact        = ""
SWEP.Purpose        = ""
SWEP.HoldType = "pistol"
SWEP.RunHoldType = "normal"

SWEP.ViewModelFOV    = 60
SWEP.ViewModelFlip    = false

SWEP.Spawnable            = true
SWEP.AdminSpawnable        = true

SWEP.VM = "models/weapons/view/pistols/ots33.mdl"
SWEP.WM = "models/weapons/world/pistols/ots33.mdl"
SWEP.WorldModel   = "models/weapons/world/pistols/ots33.mdl"

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = 18
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
SWEP.DeployTime = 0.45
SWEP.DeployAnimSpeed = 0.5

-- Firing related
SWEP.Shots = 1
SWEP.FireDelay = 0.0666
SWEP.Damage = 15
SWEP.FireSound = Sound("FAS2_OTS33")

-- Accuracy related
SWEP.HipCone = 0.032
SWEP.AimCone = 0.018
SWEP.SpreadPerShot = 0.005
SWEP.MaxSpreadInc = 0.04
SWEP.SpreadCooldown = 0.15
SWEP.VelocitySensitivity = 1.2
SWEP.SpreadToRecoil = 25 -- 25x additional recoil from continuous fire
SWEP.AimFOV = 0

-- Recoil related
SWEP.ViewKick = 0.6
SWEP.Recoil = 0.4

-- Reload related
SWEP.ReloadTime = 1.8
SWEP.ReloadTime_Nomen = 1.2
SWEP.ReloadTime_Empty = 2
SWEP.ReloadTime_Empty_Nomen = 1.4
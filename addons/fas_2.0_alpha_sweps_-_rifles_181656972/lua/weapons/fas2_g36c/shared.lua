
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 4
end

if CLIENT then
    SWEP.PrintName = "G36C"
    SWEP.Slot = 3
    SWEP.SlotPos = 0
	
	SWEP.AimPos = Vector(-2.474, -5.693, 1.143)
	SWEP.AimAng = Vector(0, 0, 0)
	
	SWEP.CompM4Pos = Vector(-2.474, -2, 0.7)
	SWEP.CompM4Ang = Vector(0, 0, 0)
	
	SWEP.YawMod = 0.1
	SWEP.SuppressorBodygroup = 3
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.Shell = "5.56x45"
	SWEP.AttachmentBGs = {["compm4"] = {bg = 2, sbg = 1},
		["suppressor"] = {bg = 3, sbg = 1}}
		
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
SWEP.Anims.Draw_First = "deploy_first"
SWEP.Anims.Draw = "deploy"
SWEP.Anims.Draw_Empty = "deploy_empty"
SWEP.Anims.Holster = "holster"
SWEP.Anims.Holster_Empty = "holster_empty"
SWEP.Anims.Fire = {"fire1", "fire2", "fire3"}
SWEP.Anims.Fire_Last = "fire_last"
SWEP.Anims.Fire_Aiming = {"fire1_scoped", "fire2_scoped", "fire3_scoped"}
SWEP.Anims.Fire_Aiming_Last = "fire_last_scoped"
SWEP.Anims.Idle = "idle"
SWEP.Anims.Idle_Aim = "idle_scoped"
SWEP.Anims.Reload = "reload"
SWEP.Anims.Reload_Nomen = "reload_nomen"
SWEP.Anims.Reload_Empty = "reload_empty"
SWEP.Anims.Reload_Empty_Nomen = "reload_empty_nomen"

SWEP.Sounds = {}

SWEP.Sounds["deploy_first"] = {[1] = {time = 0.9, sound = Sound("FAS2_G36C.BoltBack")},
	[2] = {time = 1.2, sound = Sound("FAS2_G36C.BoltForward")},
	[3] = {time = 1.6, sound = Sound("FAS2_G36C.Stock")},
	[4] = {time = 2.7, sound = Sound("Weapon_M4A1.Switch")}}
	
SWEP.Sounds["reload"] = {[1] = {time = 0.5, sound = Sound("FAS2_G36C.Magout")},
	[2] = {time = 1.2, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.55, sound = Sound("FAS2_G36C.MagIn")}}
	
SWEP.Sounds["reload_nomen"] = {[1] = {time = 0.45, sound = Sound("FAS2_G36C.Magout")},
	[2] = {time = 0.75, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.25, sound = Sound("FAS2_G36C.MagIn")}}
	
SWEP.Sounds["reload_empty"] = {[1] = {time = 0.5, sound = Sound("FAS2_G36C.MagOutEmpty")},
	[2] = {time = 1.15, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.55, sound = Sound("FAS2_G36C.MagIn")},
	[4] = {time = 2.1, sound = Sound("FAS2_G36C.BoltBack")},
	[5] = {time = 2.3, sound = Sound("FAS2_G36C.BoltForward")}}
	
SWEP.Sounds["reload_empty_nomen"] = {[1] = {time = 0.5, sound = Sound("FAS2_G36C.MagOutEmpty")},
	[2] = {time = 1, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.3, sound = Sound("FAS2_G36C.MagIn")},
	[4] = {time = 1.65, sound = Sound("FAS2_G36C.BoltBack")},
	[5] = {time = 1.85, sound = Sound("FAS2_G36C.BoltForward")}}
	
SWEP.FireModes = {"auto", "2burst", "semi"}

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

SWEP.VM = "models/weapons/view/rifles/g36c.mdl"
SWEP.WM = "models/weapons/w_g36e.mdl"
SWEP.WorldModel   = "models/weapons/w_rif_m4a1.mdl"

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = 30
SWEP.Primary.DefaultClip    = 0
SWEP.Primary.Automatic       = true    
SWEP.Primary.Ammo             = "5.56x45MM"
 
-- Secondary Fire Attributes --
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic       = false
SWEP.Secondary.Ammo         = "none"

-- Deploy related
SWEP.FirstDeployTime = 2.8
SWEP.DeployTime = 0.6
SWEP.DeployAnimSpeed = 0.75
SWEP.HolsterTime = 0.35

-- Firing related
SWEP.Shots = 1
SWEP.FireDelay = 0.08
SWEP.Damage = 27
SWEP.FireSound = Sound("FAS2_G36C")
SWEP.FireSound_Suppressed = Sound("FAS2_G36C_S")

-- Accuracy related
SWEP.HipCone = 0.042
SWEP.AimCone = 0.007
SWEP.SpreadPerShot = 0.009
SWEP.MaxSpreadInc = 0.03
SWEP.SpreadCooldown = 0.15
SWEP.VelocitySensitivity = 1.45
SWEP.AimFOV = 5

-- Recoil related
SWEP.ViewKick = 1.05
SWEP.Recoil = 0.65

-- Reload related
SWEP.ReloadTime = 1.8
SWEP.ReloadTime_Nomen = 1.35
SWEP.ReloadTime_Empty = 2.6
SWEP.ReloadTime_Empty_Nomen = 1.9
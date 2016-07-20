
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 8
end

if CLIENT then
    SWEP.PrintName = "M24"
    SWEP.Slot = 4
    SWEP.SlotPos = 0
	SWEP.YawMod = 0.1

	SWEP.AimPos = Vector(-2.759, -5.731, 1.443)
	SWEP.AimAng = Vector(0, 0, 0)
	
	SWEP.AimPos_Bipod = Vector(-2.664, -6, 0.953)
	SWEP.AimAng_Bipodd = Vector(0, 0, 0)
		
	SWEP.MuzzleEffect = "muzzleflash_m14"
	SWEP.AttachmentBGs = {["suppressor"] = {bg = 3, sbg = 1},
	["harrisbipod"] = {bg = 5, sbg = 1}}
	SWEP.AimSens = 0.15
	
	SWEP.WMAng = Vector(0, 0, 180)
	SWEP.WMPos = Vector(-1, 12.5, 1.5)
	SWEP.CanPeek = true
	SWEP.BlurOnAim = true
end

SWEP.Attachments = {[1] = {header = "Barrel", x = 50, y = -25, atts = {"suppressor"}},
	[2] = {header = "Forearm", x = 50, y = 75, atts = {"harrisbipod"}}}

SWEP.BulletLength = 7.62
SWEP.CaseLength = 51
SWEP.EmptySound = Sound("weapons/empty_sniperrifles.wav")

SWEP.Anims = {}
SWEP.Anims.Draw_First = "draw_first1"
SWEP.Anims.Draw = "draw"
SWEP.Anims.Draw_Empty = "draw"
SWEP.Anims.Holster = "holster"
SWEP.Anims.Holster_Empty = "holster_empty"
SWEP.Anims.Fire = "fire"
SWEP.Anims.Fire_Aiming = "fire_scoped"
SWEP.Anims.Fire_Bipod = "bipod_fire"
SWEP.Anims.Fire_Bipod_Aiming = "bipod_fire_scoped"
SWEP.Anims.Idle = "idle"
SWEP.Anims.Idle_Aim = "idle_scoped"
SWEP.Anims.Reload_Empty = "reload_empty"
SWEP.Anims.Reload_Empty_Nomen = "reload_empty_nomen"

SWEP.Anims.Reload_1 = "reload_1"
SWEP.Anims.Reload_2 = "reload_2"
SWEP.Anims.Reload_3 = "reload_3"
SWEP.Anims.Reload_4 = "reload_4"

SWEP.Anims.Reload_Empty_1 = "reload_empty_1"
SWEP.Anims.Reload_Empty_2 = "reload_empty_2"
SWEP.Anims.Reload_Empty_3 = "reload_empty_3"
SWEP.Anims.Reload_Empty_4 = "reload_empty_4"

SWEP.Anims.Reload_Nomen_1 = "Reload_1_Nomen"
SWEP.Anims.Reload_Nomen_2 = "Reload_2_Nomen"
SWEP.Anims.Reload_Nomen_3 = "reload_3_nomen"
SWEP.Anims.Reload_Nomen_4 = "Reload_4_Nomen"

SWEP.Anims.Reload_Nomen_Empty_1 = "reload_empty_1_nomen"
SWEP.Anims.Reload_Nomen_Empty_2 = "reload_empty_2_nomen"
SWEP.Anims.Reload_Nomen_Empty_3 = "reload_empty_3_nomen"
SWEP.Anims.Reload_Nomen_Empty_4 = "reload_empty_4_nomen"

SWEP.Anims.Cock = {"cock01", "cock02", "cock03"}
SWEP.Anims.Cock_Aim = {"cock01_scoped", "cock02_scoped", "cock03_scoped"}

SWEP.Anims.Cock_Bipod = {"bipod_cock01", "bipod_cock02", "bipod_cock03"}
SWEP.Anims.Cock_Bipod_Aim = {"bipod_cock01_scoped", "bipod_cock02_scoped", "bipod_cock03_scoped"}

SWEP.Anims.Cock_Nomen = {"cock_nmc_01", "cock_nmc_01", "cock_nmc_01"}
SWEP.Anims.Cock_Aim_Nomen = {"cock_nmc_01_scoped", "cock_nmc_02_scoped", "cock_nmc_03_scoped"}

SWEP.Anims.Cock_Bipod_Nomen = {"bipod_cock_nmc_01", "bipod_cock_nmc_02", "bipod_cock_nmc_03"}
SWEP.Anims.Cock_Bipod_Aim_Nomen = {"bipod_cock_nmc_01_scoped", "bipod_cock_nmc_02_scoped", "bipod_cock_nmc_03_scoped"}

SWEP.Anims.Bipod_Deploy = "bipod_down"
SWEP.Anims.Bipod_Deploy_Empty = "bipod_down_empty"
SWEP.Anims.Bipod_UnDeploy = "bipod_up"
SWEP.Anims.Bipod_UnDeploy_Empty = "bipod_up_empty"

SWEP.Sounds = {}

SWEP.Sounds["bipod_down"] = {[1] = {time = 0.2, sound = Sound("Bipod_Down")},
	[2] = {time = 0.85, sound = Sound("Grip_Medium")}}
	
SWEP.Sounds["bipod_down_empty"] = {[1] = {time = 0.2, sound = Sound("Bipod_Down")},
	[2] = {time = 0.85, sound = Sound("Grip_Medium")}}
	
SWEP.Sounds["bipod_up"] = {[1] = {time = 0.3, sound = Sound("Bipod_Up")}}
SWEP.Sounds["bipod_up_empty"] = {[1] = {time = 0.3, sound = Sound("Bipod_Up")}}

SWEP.Sounds["cock01"] = {[1] = {time = 0.25, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.45, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 0.65, sound = Sound("FAS2_M24.BoltForward")},
	[4] = {time = 0.85, sound = Sound("FAS2_M24.BoltDown")}}

SWEP.Sounds["cock02"] = {[1] = {time = 0.25, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.45, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 0.65, sound = Sound("FAS2_M24.BoltForward")},
	[4] = {time = 0.85, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["cock03"] = {[1] = {time = 0.25, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.45, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 0.65, sound = Sound("FAS2_M24.BoltForward")},
	[4] = {time = 0.85, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["bipod_cock01"] = {[1] = {time = 0.2, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.35, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 0.55, sound = Sound("FAS2_M24.BoltForward")},
	[4] = {time = 0.7, sound = Sound("FAS2_M24.BoltDown")}}

SWEP.Sounds["bipod_cock02"] = {[1] = {time = 0.2, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.35, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 0.55, sound = Sound("FAS2_M24.BoltForward")},
	[4] = {time = 0.7, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["bipod_cock03"] = {[1] = {time = 0.2, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.35, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 0.55, sound = Sound("FAS2_M24.BoltForward")},
	[4] = {time = 0.7, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["bipod_cock01_scoped"] = {[1] = {time = 0.2, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.35, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 0.55, sound = Sound("FAS2_M24.BoltForward")},
	[4] = {time = 0.7, sound = Sound("FAS2_M24.BoltDown")}}

SWEP.Sounds["bipod_cock02_scoped"] = {[1] = {time = 0.2, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.35, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 0.55, sound = Sound("FAS2_M24.BoltForward")},
	[4] = {time = 0.7, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["bipod_cock03_scoped"] = {[1] = {time = 0.2, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.35, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 0.55, sound = Sound("FAS2_M24.BoltForward")},
	[4] = {time = 0.7, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["cock01_scoped"] = {[1] = {time = 0.25, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.45, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 0.65, sound = Sound("FAS2_M24.BoltForward")},
	[4] = {time = 0.85, sound = Sound("FAS2_M24.BoltDown")}}

SWEP.Sounds["cock02_scoped"] = {[1] = {time = 0.25, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.45, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 0.65, sound = Sound("FAS2_M24.BoltForward")},
	[4] = {time = 0.85, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["cock03_scoped"] = {[1] = {time = 0.25, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.45, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 0.65, sound = Sound("FAS2_M24.BoltForward")},
	[4] = {time = 0.85, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["bipod_cock_nmc_01"] = {[1] = {time = 0.15, sound = Sound("FAS2_M24.BoltUpNomen")},
	[2] = {time = 0.25, sound = Sound("FAS2_M24.BoltBackNomen")},
	[3] = {time = 0.4, sound = Sound("FAS2_M24.BoltForwardNomen")},
	[4] = {time = 0.5, sound = Sound("FAS2_M24.BoltDownNomen")}}	
	
SWEP.Sounds["bipod_cock_nmc_02"] = {[1] = {time = 0.15, sound = Sound("FAS2_M24.BoltUpNomen")},
	[2] = {time = 0.25, sound = Sound("FAS2_M24.BoltBackNomen")},
	[3] = {time = 0.4, sound = Sound("FAS2_M24.BoltForwardNomen")},
	[4] = {time = 0.5, sound = Sound("FAS2_M24.BoltDownNomen")}}	

SWEP.Sounds["bipod_cock_nmc_03"] = {[1] = {time = 0.15, sound = Sound("FAS2_M24.BoltUpNomen")},
	[2] = {time = 0.25, sound = Sound("FAS2_M24.BoltBackNomen")},
	[3] = {time = 0.4, sound = Sound("FAS2_M24.BoltForwardNomen")},
	[4] = {time = 0.5, sound = Sound("FAS2_M24.BoltDownNomen")}}	
	
SWEP.Sounds["bipod_cock_nmc_01_scoped"] = {[1] = {time = 0.15, sound = Sound("FAS2_M24.BoltUpNomen")},
	[2] = {time = 0.25, sound = Sound("FAS2_M24.BoltBackNomen")},
	[3] = {time = 0.4, sound = Sound("FAS2_M24.BoltForwardNomen")},
	[4] = {time = 0.55, sound = Sound("FAS2_M24.BoltDownNomen")}}	
	
SWEP.Sounds["bipod_cock_nmc_02_scoped"] = {[1] = {time = 0.15, sound = Sound("FAS2_M24.BoltUpNomen")},
	[2] = {time = 0.25, sound = Sound("FAS2_M24.BoltBackNomen")},
	[3] = {time = 0.4, sound = Sound("FAS2_M24.BoltForwardNomen")},
	[4] = {time = 0.55, sound = Sound("FAS2_M24.BoltDownNomen")}}	

SWEP.Sounds["bipod_cock_nmc_03_scoped"] = {[1] = {time = 0.15, sound = Sound("FAS2_M24.BoltUpNomen")},
	[2] = {time = 0.25, sound = Sound("FAS2_M24.BoltBackNomen")},
	[3] = {time = 0.4, sound = Sound("FAS2_M24.BoltForwardNomen")},
	[4] = {time = 0.55, sound = Sound("FAS2_M24.BoltDownNomen")}}	
	
SWEP.Sounds["cock_nmc_01"] = {[1] = {time = 0.15, sound = Sound("FAS2_M24.BoltUpNomen")},
	[2] = {time = 0.3, sound = Sound("FAS2_M24.BoltBackNomen")},
	[3] = {time = 0.45, sound = Sound("FAS2_M24.BoltForwardNomen")},
	[4] = {time = 0.6, sound = Sound("FAS2_M24.BoltDownNomen")}}
	
SWEP.Sounds["cock_nmc_02"] = {[1] = {time = 0.15, sound = Sound("FAS2_M24.BoltUpNomen")},
	[2] = {time = 0.3, sound = Sound("FAS2_M24.BoltBackNomen")},
	[3] = {time = 0.45, sound = Sound("FAS2_M24.BoltForwardNomen")},
	[4] = {time = 0.6, sound = Sound("FAS2_M24.BoltDownNomen")}}	

SWEP.Sounds["cock_nmc_03"] = {[1] = {time = 0.15, sound = Sound("FAS2_M24.BoltUpNomen")},
	[2] = {time = 0.3, sound = Sound("FAS2_M24.BoltBackNomen")},
	[3] = {time = 0.45, sound = Sound("FAS2_M24.BoltForwardNomen")},
	[4] = {time = 0.6, sound = Sound("FAS2_M24.BoltDownNomen")}}	
	
SWEP.Sounds["cock_nmc_01_scoped"] = {[1] = {time = 0.15, sound = Sound("FAS2_M24.BoltUpNomen")},
	[2] = {time = 0.3, sound = Sound("FAS2_M24.BoltBackNomen")},
	[3] = {time = 0.45, sound = Sound("FAS2_M24.BoltForwardNomen")},
	[4] = {time = 0.6, sound = Sound("FAS2_M24.BoltDownNomen")}}
	
SWEP.Sounds["cock_nmc_02_scoped"] = {[1] = {time = 0.15, sound = Sound("FAS2_M24.BoltUpNomen")},
	[2] = {time = 0.3, sound = Sound("FAS2_M24.BoltBackNomen")},
	[3] = {time = 0.45, sound = Sound("FAS2_M24.BoltForwardNomen")},
	[4] = {time = 0.6, sound = Sound("FAS2_M24.BoltDownNomen")}}	

SWEP.Sounds["cock_nmc_03_scoped"] = {[1] = {time = 0.15, sound = Sound("FAS2_M24.BoltUpNomen")},
	[2] = {time = 0.3, sound = Sound("FAS2_M24.BoltBackNomen")},
	[3] = {time = 0.45, sound = Sound("FAS2_M24.BoltForwardNomen")},
	[4] = {time = 0.6, sound = Sound("FAS2_M24.BoltDownNomen")}}	
	
SWEP.Sounds["reload_empty"] = {[1] = {time = 0.4, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.5, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 1.5, sound = Sound("FAS2_M24.Insert1")},
	[4] = {time = 1.9, sound = Sound("FAS2_M24.Insert2")},
	[5] = {time = 2.3, sound = Sound("FAS2_M24.Insert3")},
	[6] = {time = 2.7, sound = Sound("FAS2_M24.Insert4")},
	[7] = {time = 3.1, sound = Sound("FAS2_M24.Insert5")},
	[8] = {time = 3.7, sound = Sound("FAS2_M24.BoltForward")},
	[9] = {time = 3.9, sound = Sound("FAS2_M24.BoltDown")}}
	
-- Bipod reloads

SWEP.Sounds["bipod_reload_4"] = {[1] = {time = 0.45, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.6, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 1, sound = Sound("FAS2_M24.Insert5")},
	[4] = {time = 2.35, sound = Sound("FAS2_M24.Insert1")},
	[5] = {time = 3, sound = Sound("FAS2_M24.BoltForward")},
	[6] = {time = 3.25, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["bipod_reload_3"] = {[1] = {time = 0.45, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.6, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 1, sound = Sound("FAS2_M24.Insert5")},
	[4] = {time = 2.35, sound = Sound("FAS2_M24.Insert1")},
	[5] = {time = 2.75, sound = Sound("FAS2_M24.Insert2")},
	[6] = {time = 3.4, sound = Sound("FAS2_M24.BoltForward")},
	[7] = {time = 3.65, sound = Sound("FAS2_M24.BoltDown")}}

SWEP.Sounds["bipod_reload_2"] = {[1] = {time = 0.45, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.6, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 1, sound = Sound("FAS2_M24.Insert5")},
	[4] = {time = 2.35, sound = Sound("FAS2_M24.Insert1")},
	[5] = {time = 2.75, sound = Sound("FAS2_M24.Insert2")},
	[6] = {time = 3.15, sound = Sound("FAS2_M24.Insert3")},
	[7] = {time = 3.8, sound = Sound("FAS2_M24.BoltForward")},
	[8] = {time = 4.05, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["bipod_reload_1"] = {[1] = {time = 0.45, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.6, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 1, sound = Sound("FAS2_M24.Insert5")},
	[4] = {time = 2.35, sound = Sound("FAS2_M24.Insert1")},
	[5] = {time = 2.75, sound = Sound("FAS2_M24.Insert2")},
	[6] = {time = 3.15, sound = Sound("FAS2_M24.Insert3")},
	[7] = {time = 3.55, sound = Sound("FAS2_M24.Insert4")},
	[8] = {time = 4.2, sound = Sound("FAS2_M24.BoltForward")},
	[9] = {time = 4.45, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["bipod_reload_empty"] = {[1] = {time = 0.35, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.5, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 1.6, sound = Sound("FAS2_M24.Insert1")},
	[4] = {time = 2, sound = Sound("FAS2_M24.Insert2")},
	[5] = {time = 2.4, sound = Sound("FAS2_M24.Insert3")},
	[6] = {time = 2.8, sound = Sound("FAS2_M24.Insert4")},
	[7] = {time = 3.2, sound = Sound("FAS2_M24.Insert5")},
	[8] = {time = 3.85, sound = Sound("FAS2_M24.BoltForward")},
	[9] = {time = 4.05, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["bipod_reload_empty_4"] = {[1] = {time = 0.35, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.5, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 1.6, sound = Sound("FAS2_M24.Insert1")},
	[4] = {time = 2, sound = Sound("FAS2_M24.Insert2")},
	[5] = {time = 2.4, sound = Sound("FAS2_M24.Insert3")},
	[6] = {time = 2.8, sound = Sound("FAS2_M24.Insert4")},
	[7] = {time = 3.45, sound = Sound("FAS2_M24.BoltForward")},
	[8] = {time = 3.65, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["bipod_reload_empty_3"] = {[1] = {time = 0.35, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.5, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 1.6, sound = Sound("FAS2_M24.Insert1")},
	[4] = {time = 2, sound = Sound("FAS2_M24.Insert2")},
	[5] = {time = 2.4, sound = Sound("FAS2_M24.Insert3")},
	[6] = {time = 3.05, sound = Sound("FAS2_M24.BoltForward")},
	[7] = {time = 3.25, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["bipod_reload_empty_2"] = {[1] = {time = 0.35, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.5, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 1.6, sound = Sound("FAS2_M24.Insert1")},
	[4] = {time = 2, sound = Sound("FAS2_M24.Insert2")},
	[5] = {time = 2.65, sound = Sound("FAS2_M24.BoltForward")},
	[6] = {time = 2.85, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["bipod_reload_empty_1"] = {[1] = {time = 0.35, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.5, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 1.6, sound = Sound("FAS2_M24.Insert1")},
	[4] = {time = 2.25, sound = Sound("FAS2_M24.BoltForward")},
	[5] = {time = 2.45, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["bipod_reload_empty_nomen"] = {[1] = {time = 0.3, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.45, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 1.25, sound = Sound("FAS2_M24.Insert1")},
	[4] = {time = 1.55, sound = Sound("FAS2_M24.Insert2")},
	[5] = {time = 1.85, sound = Sound("FAS2_M24.Insert3")},
	[6] = {time = 2.15, sound = Sound("FAS2_M24.Insert4")},
	[7] = {time = 2.45, sound = Sound("FAS2_M24.Insert5")},
	[8] = {time = 3, sound = Sound("FAS2_M24.BoltForward")},
	[9] = {time = 3.15, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["bipod_reload_empty_4_nomen"] = {[1] = {time = 0.3, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.45, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 1.25, sound = Sound("FAS2_M24.Insert1")},
	[4] = {time = 1.55, sound = Sound("FAS2_M24.Insert2")},
	[5] = {time = 1.85, sound = Sound("FAS2_M24.Insert3")},
	[6] = {time = 2.15, sound = Sound("FAS2_M24.Insert4")},
	[7] = {time = 2.7, sound = Sound("FAS2_M24.BoltForward")},
	[8] = {time = 2.85, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["bipod_reload_empty_3_nomen"] = {[1] = {time = 0.3, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.45, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 1.25, sound = Sound("FAS2_M24.Insert1")},
	[4] = {time = 1.55, sound = Sound("FAS2_M24.Insert2")},
	[5] = {time = 1.85, sound = Sound("FAS2_M24.Insert3")},
	[6] = {time = 2.4, sound = Sound("FAS2_M24.BoltForward")},
	[7] = {time = 2.55, sound = Sound("FAS2_M24.BoltDown")}}

SWEP.Sounds["bipod_reload_empty_2_nomen"] = {[1] = {time = 0.3, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.45, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 1.25, sound = Sound("FAS2_M24.Insert1")},
	[4] = {time = 1.55, sound = Sound("FAS2_M24.Insert2")},
	[5] = {time = 2.1, sound = Sound("FAS2_M24.BoltForward")},
	[6] = {time = 2.25, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["bipod_reload_empty_1_nomen"] = {[1] = {time = 0.3, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.45, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 1.25, sound = Sound("FAS2_M24.Insert1")},
	[4] = {time = 1.85, sound = Sound("FAS2_M24.BoltForward")},
	[5] = {time = 2, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["bipod_reload_4_nomen"] = {[1] = {time = 0.3, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.45, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 0.75, sound = Sound("FAS2_M24.Insert5")},
	[4] = {time = 1.9, sound = Sound("FAS2_M24.Insert1")},
	[5] = {time = 2.5, sound = Sound("FAS2_M24.BoltForward")},
	[6] = {time = 2.65, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["bipod_reload_3_nomen"] = {[1] = {time = 0.3, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.45, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 0.75, sound = Sound("FAS2_M24.Insert5")},
	[4] = {time = 1.9, sound = Sound("FAS2_M24.Insert1")},
	[5] = {time = 2.2, sound = Sound("FAS2_M24.Insert2")},
	[6] = {time = 2.8, sound = Sound("FAS2_M24.BoltForward")},
	[7] = {time = 2.95, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["bipod_reload_2_nomen"] = {[1] = {time = 0.3, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.45, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 0.75, sound = Sound("FAS2_M24.Insert5")},
	[4] = {time = 1.9, sound = Sound("FAS2_M24.Insert1")},
	[5] = {time = 2.2, sound = Sound("FAS2_M24.Insert2")},
	[6] = {time = 2.5, sound = Sound("FAS2_M24.Insert3")},
	[7] = {time = 3.1, sound = Sound("FAS2_M24.BoltForward")},
	[8] = {time = 3.25, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["bipod_reload_1_nomen"] = {[1] = {time = 0.3, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.45, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 0.75, sound = Sound("FAS2_M24.Insert5")},
	[4] = {time = 1.9, sound = Sound("FAS2_M24.Insert1")},
	[5] = {time = 2.2, sound = Sound("FAS2_M24.Insert2")},
	[6] = {time = 2.5, sound = Sound("FAS2_M24.Insert3")},
	[7] = {time = 2.8, sound = Sound("FAS2_M24.Insert4")},
	[8] = {time = 3.4, sound = Sound("FAS2_M24.BoltForward")},
	[9] = {time = 3.55, sound = Sound("FAS2_M24.BoltDown")}}
	
-- Normal reloads
	
SWEP.Sounds["reload_1"] = {[1] = {time = 0.45, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.6, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 1, sound = Sound("FAS2_M24.Insert5")},
	[4] = {time = 2.6, sound = Sound("FAS2_M24.Insert1")},
	[5] = {time = 3.3, sound = Sound("FAS2_M24.BoltForward")},
	[6] = {time = 3.55, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["reload_2"] = {[1] = {time = 0.45, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.6, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 1, sound = Sound("FAS2_M24.Insert5")},
	[4] = {time = 2.6, sound = Sound("FAS2_M24.Insert1")},
	[5] = {time = 3, sound = Sound("FAS2_M24.Insert2")},
	[6] = {time = 3.7, sound = Sound("FAS2_M24.BoltForward")},
	[7] = {time = 3.95, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["reload_3"] = {[1] = {time = 0.45, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.6, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 1, sound = Sound("FAS2_M24.Insert5")},
	[4] = {time = 2.6, sound = Sound("FAS2_M24.Insert1")},
	[5] = {time = 3, sound = Sound("FAS2_M24.Insert2")},
	[6] = {time = 3.4, sound = Sound("FAS2_M24.Insert3")},
	[7] = {time = 4.1, sound = Sound("FAS2_M24.BoltForward")},
	[8] = {time = 4.35, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["reload_4"] = {[1] = {time = 0.45, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.6, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 1, sound = Sound("FAS2_M24.Insert5")},
	[4] = {time = 2.6, sound = Sound("FAS2_M24.Insert1")},
	[5] = {time = 3, sound = Sound("FAS2_M24.Insert2")},
	[6] = {time = 3.4, sound = Sound("FAS2_M24.Insert3")},
	[7] = {time = 3.8, sound = Sound("FAS2_M24.Insert4")},
	[8] = {time = 4.5, sound = Sound("FAS2_M24.BoltForward")},
	[9] = {time = 4.75, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["reload_empty_4"] = {[1] = {time = 0.4, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.5, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 1.5, sound = Sound("FAS2_M24.Insert1")},
	[4] = {time = 1.9, sound = Sound("FAS2_M24.Insert2")},
	[5] = {time = 2.3, sound = Sound("FAS2_M24.Insert3")},
	[6] = {time = 2.7, sound = Sound("FAS2_M24.Insert4")},
	[7] = {time = 3.4, sound = Sound("FAS2_M24.BoltForward")},
	[8] = {time = 3.6, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["reload_empty_3"] = {[1] = {time = 0.4, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.5, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 1.5, sound = Sound("FAS2_M24.Insert1")},
	[4] = {time = 1.9, sound = Sound("FAS2_M24.Insert2")},
	[5] = {time = 2.3, sound = Sound("FAS2_M24.Insert3")},
	[6] = {time = 3, sound = Sound("FAS2_M24.BoltForward")},
	[7] = {time = 3.2, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["reload_empty_2"] = {[1] = {time = 0.4, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.5, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 1.5, sound = Sound("FAS2_M24.Insert1")},
	[4] = {time = 1.9, sound = Sound("FAS2_M24.Insert2")},
	[5] = {time = 2.6, sound = Sound("FAS2_M24.BoltForward")},
	[6] = {time = 2.8, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["reload_empty_1"] = {[1] = {time = 0.4, sound = Sound("FAS2_M24.BoltUp")},
	[2] = {time = 0.5, sound = Sound("FAS2_M24.BoltBack")},
	[3] = {time = 1.5, sound = Sound("FAS2_M24.Insert1")},
	[4] = {time = 2.3, sound = Sound("FAS2_M24.BoltForward")},
	[5] = {time = 2.5, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.Sounds["reload_empty_nomen"] = {[1] = {time = 0.3, sound = Sound("FAS2_M24.BoltUpNomen")},
	[2] = {time = 0.4, sound = Sound("FAS2_M24.BoltBackNomen")},
	[3] = {time = 1.2, sound = Sound("FAS2_M24.Insert1")},
	[4] = {time = 1.5, sound = Sound("FAS2_M24.Insert2")},
	[5] = {time = 1.8, sound = Sound("FAS2_M24.Insert3")},
	[6] = {time = 2.1, sound = Sound("FAS2_M24.Insert4")},
	[7] = {time = 2.4, sound = Sound("FAS2_M24.Insert5")},
	[8] = {time = 3, sound = Sound("FAS2_M24.BoltForwardNomen")},
	[9] = {time = 3.15, sound = Sound("FAS2_M24.BoltDownNomen")}}
	
SWEP.Sounds["reload_empty_1_nomen"] = {[1] = {time = 0.3, sound = Sound("FAS2_M24.BoltUpNomen")},
	[2] = {time = 0.4, sound = Sound("FAS2_M24.BoltBackNomen")},
	[3] = {time = 1.2, sound = Sound("FAS2_M24.Insert1")},
	[4] = {time = 1.8, sound = Sound("FAS2_M24.BoltForwardNomen")},
	[5] = {time = 1.95, sound = Sound("FAS2_M24.BoltDownNomen")}}
	
SWEP.Sounds["reload_empty_2_nomen"] = {[1] = {time = 0.3, sound = Sound("FAS2_M24.BoltUpNomen")},
	[2] = {time = 0.4, sound = Sound("FAS2_M24.BoltBackNomen")},
	[3] = {time = 1.2, sound = Sound("FAS2_M24.Insert1")},
	[4] = {time = 1.5, sound = Sound("FAS2_M24.Insert2")},
	[5] = {time = 2.1, sound = Sound("FAS2_M24.BoltForwardNomen")},
	[6] = {time = 2.25, sound = Sound("FAS2_M24.BoltDownNomen")}}
	
SWEP.Sounds["reload_empty_3_nomen"] = {[1] = {time = 0.3, sound = Sound("FAS2_M24.BoltUpNomen")},
	[2] = {time = 0.4, sound = Sound("FAS2_M24.BoltBackNomen")},
	[3] = {time = 1.2, sound = Sound("FAS2_M24.Insert1")},
	[4] = {time = 1.5, sound = Sound("FAS2_M24.Insert2")},
	[5] = {time = 1.8, sound = Sound("FAS2_M24.Insert3")},
	[6] = {time = 2.4, sound = Sound("FAS2_M24.BoltForwardNomen")},
	[7] = {time = 2.55, sound = Sound("FAS2_M24.BoltDownNomen")}}
	
SWEP.Sounds["reload_empty_4_nomen"] = {[1] = {time = 0.3, sound = Sound("FAS2_M24.BoltUpNomen")},
	[2] = {time = 0.4, sound = Sound("FAS2_M24.BoltBackNomen")},
	[3] = {time = 1.2, sound = Sound("FAS2_M24.Insert1")},
	[4] = {time = 1.5, sound = Sound("FAS2_M24.Insert2")},
	[5] = {time = 1.8, sound = Sound("FAS2_M24.Insert3")},
	[6] = {time = 2.1, sound = Sound("FAS2_M24.Insert4")},
	[7] = {time = 2.7, sound = Sound("FAS2_M24.BoltForwardNomen")},
	[8] = {time = 2.85, sound = Sound("FAS2_M24.BoltDownNomen")}}
	
SWEP.Sounds["reload_1_nomen"] = {[1] = {time = 0.3, sound = Sound("FAS2_M24.BoltUpNomen")},
	[2] = {time = 0.4, sound = Sound("FAS2_M24.BoltBackNomen")},
	[3] = {time = 0.75, sound = Sound("FAS2_M24.Insert5")},
	[4] = {time = 2.1, sound = Sound("FAS2_M24.Insert1")},
	[5] = {time = 2.7, sound = Sound("FAS2_M24.BoltForwardNomen")},
	[6] = {time = 2.85, sound = Sound("FAS2_M24.BoltDownNomen")}}
	
SWEP.Sounds["reload_2_nomen"] = {[1] = {time = 0.3, sound = Sound("FAS2_M24.BoltUpNomen")},
	[2] = {time = 0.4, sound = Sound("FAS2_M24.BoltBackNomen")},
	[3] = {time = 0.75, sound = Sound("FAS2_M24.Insert5")},
	[4] = {time = 2.1, sound = Sound("FAS2_M24.Insert1")},
	[5] = {time = 2.4, sound = Sound("FAS2_M24.Insert2")},
	[6] = {time = 3, sound = Sound("FAS2_M24.BoltForwardNomen")},
	[7] = {time = 3.15, sound = Sound("FAS2_M24.BoltDownNomen")}}
	
SWEP.Sounds["reload_3_nomen"] = {[1] = {time = 0.3, sound = Sound("FAS2_M24.BoltUpNomen")},
	[2] = {time = 0.4, sound = Sound("FAS2_M24.BoltBackNomen")},
	[3] = {time = 0.75, sound = Sound("FAS2_M24.Insert5")},
	[4] = {time = 2.1, sound = Sound("FAS2_M24.Insert1")},
	[5] = {time = 2.4, sound = Sound("FAS2_M24.Insert2")},
	[6] = {time = 2.7, sound = Sound("FAS2_M24.Insert2")},
	[7] = {time = 3.3, sound = Sound("FAS2_M24.BoltForwardNomen")},
	[8] = {time = 3.45, sound = Sound("FAS2_M24.BoltDownNomen")}}
	
SWEP.Sounds["reload_4_nomen"] = {[1] = {time = 0.3, sound = Sound("FAS2_M24.BoltUpNomen")},
	[2] = {time = 0.4, sound = Sound("FAS2_M24.BoltBackNomen")},
	[3] = {time = 0.75, sound = Sound("FAS2_M24.Insert5")},
	[4] = {time = 2.1, sound = Sound("FAS2_M24.Insert1")},
	[5] = {time = 2.4, sound = Sound("FAS2_M24.Insert2")},
	[6] = {time = 2.7, sound = Sound("FAS2_M24.Insert3")},
	[7] = {time = 3, sound = Sound("FAS2_M24.Insert4")},
	[8] = {time = 3.6, sound = Sound("FAS2_M24.BoltForwardNomen")},
	[9] = {time = 3.75, sound = Sound("FAS2_M24.BoltDownNomen")}}
	
SWEP.Sounds["draw_first1"] = {[1] = {time = 0.7, sound = Sound("FAS2_M24.Butt")},
	[2] = {time = 1.2, sound = Sound("FAS2_M24.Butt")},
	[3] = {time = 1.6, sound = Sound("FAS2_M24.Butt")},
	[4] = {time = 3.4, sound = Sound("FAS2_M24.BoltDown")}}
	
SWEP.FireModes = {"bolt"}

SWEP.Category = "FA:S 2 Weapons"
SWEP.Base = "fas2_base"
SWEP.Author            = "Spy"
SWEP.Contact        = ""
SWEP.Purpose        = ""

SWEP.ViewModelFOV    = 60
SWEP.ViewModelFlip    = false

SWEP.Spawnable            = true
SWEP.AdminSpawnable        = true

SWEP.VM = "models/weapons/view/support/m24.mdl"
SWEP.WM = "models/weapons/w_m24.mdl"
SWEP.WorldModel   = "models/weapons/w_snip_awp.mdl"

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = 5
SWEP.Primary.DefaultClip    = 0
SWEP.Primary.Automatic       = false    
SWEP.Primary.Ammo             = "7.62x51MM"
 
-- Secondary Fire Attributes --
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic       = false
SWEP.Secondary.Ammo         = "none"

-- Deploy related
SWEP.FirstDeployTime = 4
SWEP.DeployTime = 0.7
SWEP.DeployAnimSpeed = 0.75

-- Firing related
SWEP.Shots = 1
SWEP.FireDelay = 0.2
SWEP.Damage = 55
SWEP.FireSound = Sound("FAS2_M24")
SWEP.FireSound_Suppressed = Sound("FAS2_M24_S")

-- Accuracy related
SWEP.HipCone = 0.06
SWEP.AimCone = 0.0005
SWEP.SpreadPerShot = 0.015
SWEP.MaxSpreadInc = 0.045
SWEP.SpreadCooldown = 0.5
SWEP.VelocitySensitivity = 2.2
SWEP.AimFOV = 5

-- Recoil related
SWEP.ViewKick = 1.8
SWEP.Recoil = 2

-- Reload related
SWEP.ReloadTime_1 = 5
SWEP.ReloadTime_2 = 4.6
SWEP.ReloadTime_3 = 4.2
SWEP.ReloadTime_4 = 3.8
SWEP.ReloadTime_Empty_1 = 2.8
SWEP.ReloadTime_Empty_2 = 3.1
SWEP.ReloadTime_Empty_3 = 3.5
SWEP.ReloadTime_Empty_4 = 3.9
SWEP.ReloadTime_Empty = 5
SWEP.ReloadTime_Nomen_1 = 2.6
SWEP.ReloadTime_Nomen_2 = 2.9
SWEP.ReloadTime_Nomen_3 = 3.2
SWEP.ReloadTime_Nomen_4 = 3.5
SWEP.ReloadTime_Empty_Nomen_1 = 2.1
SWEP.ReloadTime_Empty_Nomen_2 = 2.4
SWEP.ReloadTime_Empty_Nomen_3 = 2.7
SWEP.ReloadTime_Empty_Nomen_4 = 3
SWEP.ReloadTime_Empty_Nomen = 3.35

-- Bipod reload related
SWEP.ReloadTime_Bipod_Empty = 4.2
SWEP.ReloadTime_Bipod_1 = 5
SWEP.ReloadTime_Bipod_2 = 4.6
SWEP.ReloadTime_Bipod_3 = 4.2
SWEP.ReloadTime_Bipod_4 = 3.8

SWEP.ReloadTime_Bipod_Empty_1 = 2.8
SWEP.ReloadTime_Bipod_Empty_2 = 3.1
SWEP.ReloadTime_Bipod_Empty_3 = 3.5
SWEP.ReloadTime_Bipod_Empty_4 = 3.9

SWEP.ReloadTime_Bipod_Nomen_1 = 3.9
SWEP.ReloadTime_Bipod_Nomen_2 = 3.6
SWEP.ReloadTime_Bipod_Nomen_3 = 3.3
SWEP.ReloadTime_Bipod_Nomen_4 = 3

SWEP.ReloadTime_Bipod_Empty_Nomen = 3.35
SWEP.ReloadTime_Bipod_Empty_Nomen_1 = 2.1
SWEP.ReloadTime_Bipod_Empty_Nomen_2 = 2.4
SWEP.ReloadTime_Bipod_Empty_Nomen_3 = 2.7
SWEP.ReloadTime_Bipod_Empty_Nomen_4 = 3

SWEP.CantChamber = true
SWEP.CockAfterShot = true
SWEP.Cocked = true
SWEP.CockTime = 1.25
SWEP.CockTime_Nomen = 1

SWEP.CockTime_Bipod = 1
SWEP.CockTime_Bipod_Nomen = 0.75

-- Misc
SWEP.BipodAngleLimitYaw = 30
SWEP.BipodAngleLimitPitch = 10
SWEP.BipodDeployTime = 1.2
SWEP.BipodUndeployTime = 1

local CT, mag, ammo

function SWEP:Reload()
	CT = CurTime()
	
	if CT < self.ReloadWait then
		return
	end
	
	if self.ReloadDelay and CT < self.ReloadDelay then
		return
	end

	if self.Owner:KeyDown(IN_USE) then
		self:CycleFiremodes()
		return
	end
	
	if self.CockAfterShot and not self.Cocked then
		if self.Owner.FAS_FamiliarWeapons[self.Class] then
			if self.dt.Status == FAS_STAT_ADS then
				if self.dt.Bipod then
					FAS2_PlayAnim(self, self.Anims.Cock_Bipod_Aim_Nomen)
				else
					FAS2_PlayAnim(self, self.Anims.Cock_Aim_Nomen)
				end
				
				self.Cocked = true
			else
				if self.dt.Bipod then
					FAS2_PlayAnim(self, self.Anims.Cock_Bipod_Nomen)
				else
					FAS2_PlayAnim(self, self.Anims.Cock_Nomen)
				end
				
				self.Cocked = true
			end
			
			if CLIENT then
				self:BoltShellEject()
			end
			
			if SERVER and game.SinglePlayer() then
				SendUserMessage("FAS2_M24BOLTSHELLEJECT", self.Owner)
			end
			
			if self.dt.Bipod then
				self:SetNextPrimaryFire(CT + self.CockTime_Bipod_Nomen)
				self:SetNextSecondaryFire(CT + self.CockTime_Bipod_Nomen)
				self.SprintWait = CT + self.CockTime_Bipod_Nomen
				self.ReloadWait = CT + self.CockTime_Bipod_Nomen
				self.BipodDelay = CT + self.CockTime_Bipod_Nomen
			else
				self:SetNextPrimaryFire(CT + self.CockTime_Nomen)
				self:SetNextSecondaryFire(CT + self.CockTime_Nomen)
				self.SprintWait = CT + self.CockTime_Nomen
				self.ReloadWait = CT + self.CockTime_Nomen
				self.BipodDelay = CT + self.CockTime_Nomen
			end
		else
			if self.dt.Status == FAS_STAT_ADS then
				if self.dt.Bipod then
					FAS2_PlayAnim(self, self.Anims.Cock_Bipod_Aim)
				else
					FAS2_PlayAnim(self, self.Anims.Cock_Aim)
				end
				
				self.Cocked = true
			else
				if self.dt.Bipod then
					FAS2_PlayAnim(self, self.Anims.Cock_Bipod)
				else
					FAS2_PlayAnim(self, self.Anims.Cock)
				end
				
				self.Cocked = true
			end
			
			if CLIENT then
				self:BoltShellEject()
			end
			
			if SERVER and game.SinglePlayer() then
				SendUserMessage("FAS2_M24BOLTSHELLEJECT", self.Owner)
			end
			
			if self.dt.Bipod then
				self:SetNextPrimaryFire(CT + self.CockTime_Bipod)
				self:SetNextSecondaryFire(CT + self.CockTime_Bipod)
				self.SprintWait = CT + self.CockTime_Bipod
				self.ReloadWait = CT + self.CockTime_Bipod
				self.BipodDelay = CT + self.CockTime_Bipod
			else
				self:SetNextPrimaryFire(CT + self.CockTime)
				self:SetNextSecondaryFire(CT + self.CockTime)
				self.SprintWait = CT + self.CockTime
				self.ReloadWait = CT + self.CockTime
				self.BipodDelay = CT + self.CockTime
			end
		end
		
		return
	end
	
	mag = self:Clip1()
	
	if mag >= self.Primary.ClipSize or self.Owner:GetAmmoCount(self.Primary.Ammo) == 0 then
		if SERVER and game.SinglePlayer() then
			SendUserMessage("FAS2_CHECKWEAPON", self.Owner)
		end
		
		if CLIENT then
			self.CheckTime = CT + 0.5
		end
		
		return
	end
	
	self.dt.Status = FAS_STAT_IDLE
	ammo = self.Owner:GetAmmoCount(self.Primary.Ammo)
	
	if self.Owner.FAS_FamiliarWeapons[self.Class] then
		if mag == 0 then
			if ammo >= 5 then
				if self.dt.Bipod then
					FAS2_PlayAnim(self, "bipod_reload_empty_nomen")
					self.ReloadDelay = CT + self.ReloadTime_Bipod_Empty_Nomen + 0.3
					self:SetNextPrimaryFire(CT + self.ReloadTime_Bipod_Empty_Nomen + 0.3)
					self:SetNextSecondaryFire(CT + self.ReloadTime_Bipod_Empty_Nomen + 0.3)
				else
					FAS2_PlayAnim(self, "reload_empty_nomen")
					self.ReloadDelay = CT + self.ReloadTime_Empty_Nomen + 0.3
					self:SetNextPrimaryFire(CT + self.ReloadTime_Empty_Nomen + 0.3)
					self:SetNextSecondaryFire(CT + self.ReloadTime_Empty_Nomen + 0.3)
				end
			else
				if self.dt.Bipod then
					FAS2_PlayAnim(self, "bipod_reload_empty_" .. ammo .. "_nomen")
					self.ReloadDelay = CT + self["ReloadTime_Bipod_Empty_Nomen_" .. ammo] + 0.3
					self:SetNextPrimaryFire(CT + self["ReloadTime_Bipod_Empty_Nomen_" .. ammo] + 0.3)
					self:SetNextSecondaryFire(CT + self["ReloadTime_Bipod_Empty_Nomen_" .. ammo] + 0.3)
				else
					FAS2_PlayAnim(self, "reload_empty_" .. ammo .. "_nomen")
					self.ReloadDelay = CT + self["ReloadTime_Empty_Nomen_" .. ammo] + 0.3
					self:SetNextPrimaryFire(CT + self["ReloadTime_Empty_Nomen_" .. ammo] + 0.3)
					self:SetNextSecondaryFire(CT + self["ReloadTime_Empty_Nomen_" .. ammo] + 0.3)
				end
			end
		else
			if ammo >= 5 - mag then
				if self.dt.Bipod then
					FAS2_PlayAnim(self, "bipod_reload_" .. mag .. "_nomen")
					self.ReloadDelay = CT + self["ReloadTime_Bipod_Nomen_" .. mag] + 0.3
					self:SetNextPrimaryFire(CT + self["ReloadTime_Bipod_Nomen_" .. mag] + 0.3)
					self:SetNextSecondaryFire(CT + self["ReloadTime_Bipod_Nomen_" .. mag] + 0.3)
				else
					FAS2_PlayAnim(self, "reload_" .. 5 - mag .. "_nomen")
					self.ReloadDelay = CT + self["ReloadTime_Nomen_" .. 5 - mag] + 0.3
					self:SetNextPrimaryFire(CT + self["ReloadTime_Nomen_" .. 5 - mag] + 0.3)
					self:SetNextSecondaryFire(CT + self["ReloadTime_Nomen_" .. 5 - mag] + 0.3)
				end
			else
				if self.dt.Bipod then
					FAS2_PlayAnim(self, "bipod_reload_" .. 5 - ammo .. "_nomen")
					self.ReloadDelay = CT + self["ReloadTime_Bipod_Nomen_" .. 5 - ammo] + 0.3
					self:SetNextPrimaryFire(CT + self["ReloadTime_Bipod_Nomen_" .. 5 - ammo] + 0.3)
					self:SetNextSecondaryFire(CT + self["ReloadTime_Bipod_Nomen_" .. 5 - ammo] + 0.3)
				else
					FAS2_PlayAnim(self, "reload_" .. ammo .. "_nomen")
					self.ReloadDelay = CT + self["ReloadTime_Nomen_" .. ammo] + 0.3
					self:SetNextPrimaryFire(CT + self["ReloadTime_Nomen_" .. ammo] + 0.3)
					self:SetNextSecondaryFire(CT + self["ReloadTime_Nomen_" .. ammo] + 0.3)
				end
			end
		end
	else
		if mag == 0 then
			if ammo >= 5 then
				if self.dt.Bipod then
					FAS2_PlayAnim(self, "bipod_reload_empty")
					self.ReloadDelay = CT + self.ReloadTime_Bipod_Empty + 0.3
					self:SetNextPrimaryFire(CT + self.ReloadTime_Bipod_Empty + 0.3)
					self:SetNextSecondaryFire(CT + self.ReloadTime_Bipod_Empty + 0.3)
				else
					FAS2_PlayAnim(self, "reload_empty")
					self.ReloadDelay = CT + self.ReloadTime_Empty + 0.3
					self:SetNextPrimaryFire(CT + self.ReloadTime_Empty + 0.3)
					self:SetNextSecondaryFire(CT + self.ReloadTime_Empty + 0.3)
				end
			else
				if self.dt.Bipod then
					FAS2_PlayAnim(self, "bipod_reload_empty_" .. ammo)
					self.ReloadDelay = CT + self["ReloadTime_Bipod_Empty_" .. ammo] + 0.3
					self:SetNextPrimaryFire(CT + self["ReloadTime_Bipod_Empty_" .. ammo] + 0.3)
					self:SetNextSecondaryFire(CT + self["ReloadTime_Bipod_Empty_" .. ammo] + 0.3)
				else
					FAS2_PlayAnim(self, "reload_empty_" .. ammo)
					self.ReloadDelay = CT + self["ReloadTime_Empty_" .. ammo] + 0.3
					self:SetNextPrimaryFire(CT + self["ReloadTime_Empty_" .. ammo] + 0.3)
					self:SetNextSecondaryFire(CT + self["ReloadTime_Empty_" .. ammo] + 0.3)
				end
			end
		else
			if ammo >= 5 - mag then
				if self.dt.Bipod then
					FAS2_PlayAnim(self, "bipod_reload_" .. mag)
					self.ReloadDelay = CT + self["ReloadTime_Bipod_" .. mag] + 0.3
					self:SetNextPrimaryFire(CT + self["ReloadTime_Bipod_" .. mag] + 0.3)
					self:SetNextSecondaryFire(CT + self["ReloadTime_Bipod_" .. mag] + 0.3)
				else
					FAS2_PlayAnim(self, "reload_" .. 5 - mag)
					self.ReloadDelay = CT + self["ReloadTime_" .. mag] + 0.3
					self:SetNextPrimaryFire(CT + self["ReloadTime_" .. mag] + 0.3)
					self:SetNextSecondaryFire(CT + self["ReloadTime_" .. mag] + 0.3)
				end
			else
				if self.dt.Bipod then
					FAS2_PlayAnim(self, "bipod_reload_" .. 5 - ammo)
					self.ReloadDelay = CT + self["ReloadTime_Bipod_" .. 5 - ammo] + 0.3
					self:SetNextPrimaryFire(CT + self["ReloadTime_Bipod_" .. 5 - ammo] + 0.3)
					self:SetNextSecondaryFire(CT + self["ReloadTime_Bipod_" .. 5 - ammo] + 0.3)
				else
					FAS2_PlayAnim(self, "reload_" .. ammo)
					self.ReloadDelay = CT + self["ReloadTime_" .. ammo] + 0.3
					self:SetNextPrimaryFire(CT + self["ReloadTime_" .. ammo] + 0.3)
					self:SetNextSecondaryFire(CT + self["ReloadTime_" .. ammo] + 0.3)
				end
			end
		end
	end
	
	self.Owner:SetAnimation(PLAYER_RELOAD)
end

if CLIENT then
	function SWEP:BoltShellEject()
		timer.Simple(0.25, function()
			if IsValid(self) then
				att = self.Wep:GetAttachment(self.Wep:LookupAttachment("ejector"))
				dir = att.Ang:Forward()
				att.Pos = att.Pos - dir * 3
				ang = EyeAngles()
	
				FAS2_MakeFakeShell("7.62x51", att.Pos + dir * 3, ang, dir * 100 + self.Owner:GetVelocity(), 0.5, 5)
			end
		end)
	end
	
	local old, x, y, ang
	local sight = surface.GetTextureID("sprites/scope_leo")
	local lens = surface.GetTextureID("VGUI/fas2/lense")
	local lensring = surface.GetTextureID("VGUI/fas2/lensring")
	local cd, alpha = {}, 0.5
	local Ini = true
	function SWEP:DrawRenderTarget()
		if self.dt.Status == FAS_STAT_ADS and not self.Peeking then
			alpha = math.Approach(alpha, 0, FrameTime() * 5)
		else
			alpha = math.Approach(alpha, 1, FrameTime() * 5)
		end
		
		x, y = ScrW(), ScrH()
		old = render.GetRenderTarget()
	
		ang = self.Wep:GetAttachment(self.Wep:LookupAttachment("muzzle")).Ang
		ang:RotateAroundAxis(ang:Forward(), -90)
		
		cd.angles = ang
		cd.origin = self.Owner:GetShootPos()
		cd.x = 0
		cd.y = 0
		cd.w = 512
		cd.h = 512
		cd.fov = 2.5
		cd.drawviewmodel = false
		cd.drawhud = false
		render.SetRenderTarget(self.ScopeRT)
		render.SetViewPort(0, 0, 512, 512)
		
			if alpha < 1 or Ini then
				render.RenderView(cd)
				Ini = false
			end
			
			ang = self.Owner:EyeAngles()
			ang.p = ang.p + self.BlendAng.x
			ang.y = ang.y + self.BlendAng.y
			ang.r = ang.r + self.BlendAng.z
			ang = -ang:Forward()
			local light = render.ComputeLighting(self.Owner:GetShootPos(), ang)
			
			cam.Start2D()
				surface.SetDrawColor(255, 255, 255, 255)
				surface.SetTexture(lensring)
				surface.DrawTexturedRect(0, 0, 512, 512)
				surface.SetDrawColor(255, 255, 255, 255)
				surface.SetTexture(sight)
				surface.DrawTexturedRect(0, 0, 512, 512)
				surface.SetDrawColor(150 * light[1], 150 * light[2], 150 * light[3], 255 * alpha)
				surface.SetTexture(lens)
				surface.DrawTexturedRect(0, 0, 512, 512)
			cam.End2D()
		
		render.SetViewPort(0, 0, x, y)
		render.SetRenderTarget(old)
		
		if self.PSO1Glass then
			self.PSO1Glass:SetTexture("$basetexture", self.ScopeRT)
		end
	end
end
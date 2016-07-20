
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 6
end

if CLIENT then
    SWEP.PrintName = "SR-25"
    SWEP.Slot = 3
    SWEP.SlotPos = 0
	SWEP.YawMod = 0.1
	
	SWEP.AimPos = Vector(-2.034, -3.651, 0.598)
	SWEP.AimAng = Vector(0, 0, 0)
	
	SWEP.AimPos_Bipod = Vector(-2.034, -4.4, 0.598)
	SWEP.AimAng_Bipod = Vector(0, 0, 0)
	SWEP.AimSens = 0.15

	SWEP.MuzzleEffect = "muzzleflash_SR25"
	SWEP.Shell = "7.62x51"
	SWEP.AttachmentBGs = {["suppressor"] = {bg = 2, sbg = 2}}
	
	SWEP.WMAng = Vector(0, 180, 180)
	SWEP.WMPos = Vector(1, -3, 0.25)
	SWEP.TargetViewModelFOV = 50
	SWEP.CanPeek = true
	SWEP.BlurOnAim = true
end

SWEP.Attachments = {[1] = {header = "Barrel", x = 50, atts = {"suppressor"}}}

SWEP.BulletLength = 7.62
SWEP.CaseLength = 51
SWEP.EmptySound = Sound("weapons/empty_sniperrifles.wav")

SWEP.Anims = {}
SWEP.Anims.Draw_First = "deploy"
SWEP.Anims.Draw = "deploy"
SWEP.Anims.Draw_Empty = "deploy_empty"
SWEP.Anims.Holster = "holster"
SWEP.Anims.Holster_Empty = "holster_empty"
SWEP.Anims.Fire = {"fire1", "fire2", "fire3"}
SWEP.Anims.Fire_Last = "fire_last"
SWEP.Anims.Fire_Bipod = {"bipod_fire1", "bipod_fire2", "bipod_fire3"}
SWEP.Anims.Fire_Bipod_Aiming = "bipod_fire3_scoped"
SWEP.Anims.Fire_Bipod_Last = "bipod_fire_last"
SWEP.Anims.Fire_Bipod_Aiming_Last = "bipod_fire_last_scoped"
SWEP.Anims.Idle = "idle"
SWEP.Anims.Idle_Aim = "idle_scoped"
SWEP.Anims.Reload = "reload"
SWEP.Anims.Reload_Nomen = "reload_nomen"
SWEP.Anims.Reload_Empty = "reload_empty"
SWEP.Anims.Reload_Empty_Nomen = "reload_empty_nomen"
SWEP.Anims.Reload_Bipod = "bipod_reload"
SWEP.Anims.Reload_Bipod_Nomen = "bipod_reload_nomen"
SWEP.Anims.Reload_Bipod_Empty = "bipod_reload_empty"
SWEP.Anims.Reload_Bipod_Empty_Nomen = "bipod_reload_empty_nomen"
SWEP.Anims.Bipod_Deploy = "bipod_down"
SWEP.Anims.Bipod_Deploy_Empty = "bipod_down_empty"
SWEP.Anims.Bipod_UnDeploy = "bipod_up"
SWEP.Anims.Bipod_UnDeploy_Empty = "bipod_up_empty"

SWEP.Sounds = {}
SWEP.Sounds["deploy_first2"] = {[1] = {time = 1.05, sound = Sound("FAS2_M14.BoltRelease")}}

SWEP.Sounds["reload"] = {[1] = {time = 0.45, sound = Sound("FAS2_SR25.MagOut")},
	[2] = {time = 1, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.7, sound = Sound("FAS2_SR25.MagIn")},
	[4] = {time = 2.2, sound = Sound("FAS2_SR25.MagSlap")}}
	
SWEP.Sounds["bipod_reload"] = {[1] = {time = 0.55, sound = Sound("FAS2_SR25.MagOut")},
	[2] = {time = 1, sound = Sound("MagPouch_AR")},
	[3] = {time = 2.1, sound = Sound("FAS2_SR25.MagIn")}}

SWEP.Sounds["bipod_reload_nomen"] = {[1] = {time = 0.55, sound = Sound("FAS2_SR25.MagOut")},
	[2] = {time = 1, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.5, sound = Sound("FAS2_SR25.MagIn")}}
	
SWEP.Sounds["bipod_reload_empty"] = {[1] = {time = 0.35, sound = Sound("FAS2_SR25.MagOut_Empty")},
	[2] = {time = 0.6, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.3, sound = Sound("FAS2_SR25.MagIn")},
	[4] = {time = 2, sound = Sound("FAS2_SR25.ChargingHandle_Back")},
	[5] = {time = 2.2, sound = Sound("FAS2_SR25.ChargingHandle_Forward")}}
	
SWEP.Sounds["bipod_reload_empty_nomen"] = {[1] = {time = 0.35, sound = Sound("FAS2_SR25.MagOut_Empty")},
	[2] = {time = 0.8, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.3, sound = Sound("FAS2_SR25.MagIn")},
	[4] = {time = 1.6, sound = Sound("FAS2_SR25.BoltCatch")}}
	
SWEP.Sounds["reload_nomen"] = {[1] = {time = 0.3, sound = Sound("FAS2_SR25.MagOut")},
	[2] = {time = 1, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.5, sound = Sound("FAS2_SR25.MagIn")}}
	
SWEP.Sounds["reload_empty"] = {[1] = {time = 0.45, sound = Sound("FAS2_SR25.MagOut_Empty")},
	[2] = {time = 1, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.7, sound = Sound("FAS2_SR25.MagIn")},
	[4] = {time = 2.2, sound = Sound("FAS2_SR25.BoltCatchSlap")}}
	
SWEP.Sounds["reload_empty_nomen"] = {[1] = {time = 0.35, sound = Sound("FAS2_SR25.MagOut_Empty")},
	[2] = {time = 1, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.5, sound = Sound("FAS2_SR25.MagIn")},
	[4] = {time = 1.75, sound = Sound("FAS2_SR25.BoltCatch")}}
	
SWEP.Sounds["bipod_down"] = {[1] = {time = 0.15, sound = Sound("Bipod_Down")},
	[2] = {time = 0.75, sound = Sound("Grip_Medium")}}
	
SWEP.Sounds["bipod_down_empty"] = {[1] = {time = 0.15, sound = Sound("Bipod_Down")},
	[2] = {time = 0.75, sound = Sound("Grip_Medium")}}
	
SWEP.Sounds["bipod_up"] = {[1] = {time = 0.6, sound = Sound("Bipod_Up")}}
SWEP.Sounds["bipod_up_empty"] = {[1] = {time = 0.6, sound = Sound("Bipod_Up")}}
SWEP.FireModes = {"semi"}

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

SWEP.VM = "models/weapons/view/support/sr25.mdl"
SWEP.WM = "models/weapons/w_sr25.mdl"
SWEP.WorldModel   = "models/weapons/w_snip_sg550.mdl"

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = 10
SWEP.Primary.DefaultClip    = 0
SWEP.Primary.Automatic       = false    
SWEP.Primary.Ammo             = "7.62x51MM"
 
-- Secondary Fire Attributes --
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic       = false
SWEP.Secondary.Ammo         = "none"

-- Deploy related
SWEP.FirstDeployTime = 0.45
SWEP.DeployTime = 0.7
SWEP.DeployAnimSpeed = 0.75

-- Firing related
SWEP.Shots = 1
SWEP.FireDelay = 0.16
SWEP.Damage = 55
SWEP.FireSound = Sound("FAS2_SR25")
SWEP.FireSound_Suppressed = Sound("FAS2_SR25_S")

-- Accuracy related
SWEP.HipCone = 0.055
SWEP.AimCone = 0.0005
SWEP.SpreadPerShot = 0.015
SWEP.MaxSpreadInc = 0.045
SWEP.SpreadCooldown = 0.3
SWEP.VelocitySensitivity = 2.2
SWEP.AimFOV = 5

-- Recoil related
SWEP.ViewKick = 1.5
SWEP.Recoil = 1.2

-- Reload related
SWEP.ReloadTime = 2.6
SWEP.ReloadTime_Nomen = 1.9
SWEP.ReloadTime_Empty = 2.6
SWEP.ReloadTime_Empty_Nomen = 1.9

SWEP.ReloadTime_Bipod = 2.55
SWEP.ReloadTime_Bipod_Nomen = 1.9
SWEP.ReloadTime_Bipod_Empty = 2.5
SWEP.ReloadTime_Bipod_Empty_Nomen = 2.1

-- Misc
SWEP.InstalledBipod = true
SWEP.BipodAngleLimitYaw = 30
SWEP.BipodAngleLimitPitch = 10
SWEP.BipodDeployTime = 0.9
SWEP.BipodUndeployTime = 1

if CLIENT then
	local old, x, y, ang
	local sight = surface.GetTextureID("sprites/scope_leo")
	local lens = surface.GetTextureID("VGUI/fas2/lense")
	local lensring = surface.GetTextureID("VGUI/fas2/lensring")
	local cd, alpha = {}, 0.5
	local Ini = true
	
	function SWEP:DrawRenderTarget()
		if self.dt.Status == FAS_STAT_ADS then
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
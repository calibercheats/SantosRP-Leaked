
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 6
end

if CLIENT then
    SWEP.PrintName = "M82"
    SWEP.Slot = 3
    SWEP.SlotPos = 0
	SWEP.YawMod = 0.1
	
	SWEP.AimPos = Vector(-2.126, -4, 0.72)
	SWEP.AimAng = Vector(0, 0, 0)

	SWEP.AimSens = 0.1

	SWEP.MuzzleEffect = "muzzle_center_M82"
	SWEP.Shell = "50bmg"
	SWEP.TargetViewModelFOV = 40
	
	SWEP.WMAng = Vector(0, 180, 180)
	SWEP.WMPos = Vector(1, -3, 0.25)
	SWEP.CanPeek = true
	SWEP.BlurOnAim = true
end

SWEP.BulletLength = 12.95
SWEP.CaseLength = 99
SWEP.EmptySound = Sound("weapons/empty_sniperrifles.wav")

SWEP.Anims = {}
SWEP.Anims.Draw_First = "deploy"
SWEP.Anims.Draw = "deploy"
SWEP.Anims.Holster = "holster"
SWEP.Anims.Fire = {"fire", "fire_2", "fire_3"}
SWEP.Anims.Fire_Bipod = "bipod_fire"
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
SWEP.Anims.Bipod_Deploy = "bipod_dn"
SWEP.Anims.Bipod_UnDeploy = "bipod_up"

SWEP.Sounds = {}
SWEP.Sounds["deploy_first2"] = {[1] = {time = 1.05, sound = Sound("FAS2_M14.BoltRelease")}}

SWEP.Sounds["reload"] = {[1] = {time = 1.3, sound = Sound("FAS2_M82.MagRelease")},
	[2] = {time = 1.8, sound = Sound("FAS2_M82.MagOut")},
	[3] = {time = 1.7, sound = Sound("MagPouch_AR")},
	[4] = {time = 3.1, sound = Sound("FAS2_M82.MagIn")}}
	
SWEP.Sounds["bipod_reload"] = {[1] = {time = 0.8, sound = Sound("FAS2_M82.MagRelease")},
	[2] = {time = 0.9, sound = Sound("FAS2_M82.MagOut")},
	[3] = {time = 1.2, sound = Sound("MagPouch_AR")},
	[4] = {time = 2.4, sound = Sound("FAS2_M82.MagIn")}}
	
SWEP.Sounds["bipod_reload_empty"] = {[1] = {time = 0.8, sound = Sound("FAS2_M82.MagRelease")},
	[2] = {time = 0.9, sound = Sound("FAS2_M82.MagOutEmpty")},
	[3] = {time = 1.2, sound = Sound("MagPouch_AR")},
	[4] = {time = 2.4, sound = Sound("FAS2_M82.MagIn")},
	[5] = {time = 3.8, sound = Sound("FAS2_M82.BoltBack")},
	[6] = {time = 4.1, sound = Sound("FAS2_M82.BoltForward")}}
	
SWEP.Sounds["reload_nomen"] = {[1] = {time = 0.5, sound = Sound("MagPouch_AR")},
	[2] = {time = 1.1, sound = Sound("FAS2_M82.MagRelease")},
	[3] = {time = 1.2, sound = Sound("FAS2_M82.MagOut")},
	[4] = {time = 1.75, sound = Sound("FAS2_M82.MagIn")}}
	
SWEP.Sounds["reload_empty"] = {[1] = {time = 1.3, sound = Sound("FAS2_M82.MagRelease")},
	[2] = {time = 1.8, sound = Sound("FAS2_M82.MagOutEmpty")},
	[3] = {time = 1.7, sound = Sound("MagPouch_AR")},
	[4] = {time = 3.1, sound = Sound("FAS2_M82.MagIn")},
	[5] = {time = 4.8, sound = Sound("FAS2_M82.BoltBack")},
	[6] = {time = 5.15, sound = Sound("FAS2_M82.BoltForward")}}
	
SWEP.Sounds["reload_empty_nomen"] = {[1] = {time = 0.5, sound = Sound("MagPouch_AR")},
	[2] = {time = 1.1, sound = Sound("FAS2_M82.MagRelease")},
	[3] = {time = 1.2, sound = Sound("FAS2_M82.MagOutEmpty")},
	[4] = {time = 1.75, sound = Sound("FAS2_M82.MagIn")},
	[5] = {time = 2.8, sound = Sound("FAS2_M82.BoltBack")},
	[6] = {time = 3.1, sound = Sound("FAS2_M82.BoltForward")}}
	
SWEP.Sounds["bipod_reload_nomen"] = {[1] = {time = 0.5, sound = Sound("FAS2_M82.MagRelease")},
	[2] = {time = 0.6, sound = Sound("FAS2_M82.MagOut")},
	[3] = {time = 1, sound = Sound("MagPouch_AR")},
	[4] = {time = 1.5, sound = Sound("FAS2_M82.MagIn")}}
	
SWEP.Sounds["bipod_reload_empty_nomen"] = {[1] = {time = 0.5, sound = Sound("FAS2_M82.MagRelease")},
	[2] = {time = 0.6, sound = Sound("FAS2_M82.MagOutEmpty")},
	[3] = {time = 1.2, sound = Sound("MagPouch_AR")},
	[4] = {time = 1.5, sound = Sound("FAS2_M82.MagIn")},
	[5] = {time = 2.5, sound = Sound("FAS2_M82.BoltBack")},
	[6] = {time = 2.6, sound = Sound("FAS2_M82.BoltForward")}}
	
SWEP.Sounds["bipod_dn"] = {[1] = {time = 0.8, sound = Sound("Bipod_Down")},
	[2] = {time = 1.65, sound = Sound("Bipod_Down")}}
	
SWEP.Sounds["bipod_up"] = {[1] = {time = 1.2, sound = Sound("FAS2_M82.BoltForward")}}
	
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

SWEP.VM = "models/weapons/view/support/m82.mdl"
SWEP.WM = "models/weapons/w_m82.mdl"
SWEP.WorldModel   = "models/weapons/w_snip_sg550.mdl"

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = 10
SWEP.Primary.DefaultClip    = 0
SWEP.Primary.Automatic       = false    
SWEP.Primary.Ammo             = ".50 BMG"
 
-- Secondary Fire Attributes --
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic       = false
SWEP.Secondary.Ammo         = "none"

-- Deploy related
SWEP.FirstDeployTime = 0.45
SWEP.DeployTime = 1.15
SWEP.DeployAnimSpeed = 0.75

-- Firing related
SWEP.Shots = 1
SWEP.FireDelay = 0.35
SWEP.Damage = 150
SWEP.FireSound = Sound("FAS2_M82")

-- Accuracy related
SWEP.HipCone = 0.08
SWEP.AimCone = 0.00005
SWEP.SpreadPerShot = 0.05
SWEP.MaxSpreadInc = 0.1
SWEP.SpreadCooldown = 0.5
SWEP.VelocitySensitivity = 2.5
SWEP.AimFOV = 5

-- Recoil related
SWEP.ViewKick = 7.5
SWEP.Recoil = 5

-- Reload related
SWEP.ReloadTime = 4
SWEP.ReloadTime_Nomen = 1.9
SWEP.ReloadTime_Empty = 5.8
SWEP.ReloadTime_Empty_Nomen = 2.65

SWEP.ReloadTime_Bipod = 3.3
SWEP.ReloadTime_Bipod_Nomen = 1.5
SWEP.ReloadTime_Bipod_Empty = 4.5
SWEP.ReloadTime_Bipod_Empty_Nomen = 2.45

-- Misc
SWEP.InstalledBipod = true
SWEP.BipodAngleLimitYaw = 30
SWEP.BipodAngleLimitPitch = 10
SWEP.BipodDeployTime = 3.3
SWEP.BipodUndeployTime = 2.65

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
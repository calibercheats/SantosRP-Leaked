
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 4
end

if CLIENT then
    SWEP.PrintName = "AK-12"
    SWEP.Slot = 3
    SWEP.SlotPos = 0
	SWEP.DrawAmmo = false

	SWEP.AimPos = Vector(-2.208, -4.375, 0.595)
	SWEP.AimAng = Vector(0.149, -0.015, 0)
	
	SWEP.CompM4Pos = Vector(-2.2, -2.5, 0.1)
	SWEP.CompM4Ang = Vector(0, 0, 0)
	
	SWEP.EoTechPos = Vector(-2.2, -5, -0.1)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.ELCANPos = Vector(-2.21, -4, -0.05)
	SWEP.ELCANAng = Vector(-0.631, 0, 0)
	
	SWEP.MuzzleEffect = "muzzleflash_ak74"
	SWEP.Shell = "5.45x39"
	SWEP.AttachmentBGs = {["compm4"] = {bg = 3, sbg = 1},
		["c79"] = {bg = 3, sbg = 2},
		["eotech"] = {bg = 3, sbg = 3},
		["suppressor"] = {bg = 2, sbg = 1}}
		
	SWEP.WMAng = Vector(0, 0, 180)
	SWEP.WMPos = Vector(-4.25, -10, 7)
end

SWEP.Attachments = {
	[1] = {header = "Sight", sight = true, x = 900, y = -50, atts = {"c79", "compm4", "eotech"}},
	[2] = {header = "Barrel", y = -200, atts = {"suppressor"}}}

SWEP.BulletLength = 5.45
SWEP.CaseLength = 39
SWEP.EmptySound = Sound("weapons/empty_assaultrifles.wav")

SWEP.Anims = {}
SWEP.Anims.Draw_First = "deploy"
SWEP.Anims.Draw = "deploy"
SWEP.Anims.Holster = "holster"
SWEP.Anims.Fire = "fire"
SWEP.Anims.Fire_Aiming = "fire_scoped"
SWEP.Anims.Idle = "idle"
SWEP.Anims.Idle_Aim = "idle_scoped"
SWEP.Anims.Reload = "reload"
SWEP.Anims.Reload_Nomen = "reload_nomen"
SWEP.Anims.Reload_Empty = "reload_empty"
SWEP.Anims.Reload_Empty_Nomen = "reload_empty_nomen"

SWEP.Sounds = {}
SWEP.Sounds["reload"] = {[1] = {time = 1, sound = Sound("Weapon_ak74.MagOut")},
	[2] = {time = 1.5, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.9, sound = Sound("Weapon_ak74.MagIn")}}
	
SWEP.Sounds["reload_nomen"] = {[1] = {time = 0.6, sound = Sound("Weapon_ak74.MagOut")},
	[2] = {time = 1.2, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.8, sound = Sound("Weapon_ak74.MagIn")}}
	
SWEP.Sounds["reload_empty"] = {[1] = {time = 0.7, sound = Sound("Weapon_ak74.MagOutEmpty")},
	[2] = {time = 1.15, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.85, sound = Sound("Weapon_ak74.MagIn")},
	[4] = {time = 2.9, sound = Sound("Weapon_ak74.BoltPull")}}
	
SWEP.Sounds["reload_empty_nomen"] = {[1] = {time = 0.8, sound = Sound("MagPouch_AR")},
	[2] = {time = 1.5, sound = Sound("Weapon_ak74.MagOutEmptyNomen")},
	[3] = {time = 1.8, sound = Sound("Weapon_ak74.MagIn")},
	[4] = {time = 2.5, sound = Sound("Weapon_ak74.BoltPull")}}
	
SWEP.FireModes = {"auto", "3burst", "semi"}

SWEP.Category = "FA:S 2 Weapons"
SWEP.Base = "fas2_base"
SWEP.Author            = "Spy"
SWEP.Contact        = ""
SWEP.Purpose        = ""

SWEP.ViewModelFOV    = 60
SWEP.ViewModelFlip    = false

SWEP.Spawnable            = true
SWEP.AdminSpawnable        = true

SWEP.VM = "models/weapons/view/rifles/ak12.mdl"
SWEP.WM = "models/weapons/world/rifles/ak12.mdl"
SWEP.WorldModel   = "models/weapons/world/rifles/ak12.mdl"

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = 30
SWEP.Primary.DefaultClip    = 0
SWEP.Primary.Automatic       = true    
SWEP.Primary.Ammo             = "5.45x39MM"
 
-- Secondary Fire Attributes --
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic       = false
SWEP.Secondary.Ammo         = "none"

-- Deploy related
SWEP.FirstDeployTime = 0.45
SWEP.DeployTime = 0.8
SWEP.DeployAnimSpeed = 0.5

-- Firing related
SWEP.Shots = 1
SWEP.FireDelay = 0.092307
SWEP.Damage = 32
SWEP.FireSound = Sound("FAS2_AK12")
SWEP.FireSound_Suppressed = Sound("FAS2_AK74_S")
SWEP.BurstFireDelayMod = 0.65

-- Accuracy related
SWEP.HipCone = 0.052
SWEP.AimCone = 0.003
SWEP.SpreadPerShot = 0.008
SWEP.MaxSpreadInc = 0.035
SWEP.SpreadCooldown = 0.18
SWEP.VelocitySensitivity = 1.8
SWEP.AimFOV = 5

-- Recoil related
SWEP.ViewKick = 1
SWEP.Recoil = 0.6

-- Reload related
SWEP.ReloadTime = 2.6
SWEP.ReloadTime_Nomen = 2.2
SWEP.ReloadTime_Empty = 3.3
SWEP.ReloadTime_Empty_Nomen = 3

if CLIENT then
	local x, y, old, ang
	local sight = surface.GetTextureID("models/weapons/view/accessories/elcan_reticle")
	local lens = surface.GetTextureID("VGUI/fas2/lense")
	local lensring = surface.GetTextureID("VGUI/fas2/lensring")
	local cd, alpha = {}, 0.5
	local Ini = true
	
	function SWEP:DrawRenderTarget()
		if self.AimPos != self.ELCANPos then
			return
		end
		
		if self.dt.Status == FAS_STAT_ADS then
			alpha = math.Approach(alpha, 0, FrameTime() * 5)
		else
			alpha = math.Approach(alpha, 1, FrameTime() * 5)
		end
			
		x, y = ScrW(), ScrH()
		old = render.GetRenderTarget()
		
		ang = self.Wep:GetAttachment(self.Wep:LookupAttachment("muzzle")).Ang
		ang:RotateAroundAxis(ang:Forward(), -0)
		ang:RotateAroundAxis(ang:Right(), 0.55)
		
		cd.angles = ang
		cd.origin = self.Owner:GetShootPos()
		cd.x = 0
		cd.y = 0
		cd.w = 512 
		cd.h = 512
		cd.fov = 5
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
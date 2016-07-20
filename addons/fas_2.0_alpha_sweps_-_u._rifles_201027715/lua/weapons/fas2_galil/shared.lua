
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 4
end

if CLIENT then
    SWEP.PrintName = "IMI Galil"
    SWEP.Slot = 3
    SWEP.SlotPos = 0
	
	SWEP.AimPos = Vector(-2.99, -4.053, 0.47)
	SWEP.AimAng = Vector(-0.1, 0.01, 0)
	
	SWEP.CompM4Pos = Vector(-2.91, -2, -0.42)
	SWEP.CompM4Ang = Vector(-0.084, 0, 0)
	SWEP.YawMod = 0.1
	
	SWEP.EoTechPos = Vector(-2.935, -4, -0.56)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.PSO1Pos = Vector(-2.7925, -2.5, 0)
	SWEP.PSO1Ang = Vector(0, 0, 0)
	
	SWEP.ELCANPos = Vector(-2.935, -3, -0.57)
	SWEP.ELCANAng = Vector(-0.631, 0, 0)
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.Shell = "5.56x45"
	SWEP.AttachmentBGs = {["compm4"] = {bg = 3, sbg = 1},
	["c79"] = {bg = 3, sbg = 2},
	["eotech"] = {bg = 3, sbg = 3},
	["pso1"] = {bg = 3, sbg = 4},
	["suppressor"] = {bg = 2, sbg = 1}}
		
	SWEP.WMAng = Vector(0, 0, 180)
	SWEP.WMPos = Vector(-1, 6.5, 2.5)
	SWEP.HideWorldModel = false
end

SWEP.Attachments = {
	[1] = {header = "Sight", sight = true, x = 700, y = -50, atts = {"pso1", "c79", "compm4", "eotech"}},
	[2] = {header = "Barrel", y = -225, atts = {"suppressor"}}}

SWEP.BulletLength = 5.56
SWEP.CaseLength = 45
SWEP.EmptySound = Sound("weapons/empty_assaultrifles.wav")

SWEP.Anims = {}
SWEP.Anims.Draw_First = "draw"
SWEP.Anims.Draw = "draw"
SWEP.Anims.Holster = "holster"
SWEP.Anims.Holster_Empty = "holster_empty"
SWEP.Anims.Fire = "fire"
SWEP.Anims.Fire_Last = "fire_last"
SWEP.Anims.Fire_Aiming = "fire_scoped"
SWEP.Anims.Fire_Aiming_Last = "fire_last_scoped"
SWEP.Anims.Idle = "idle"
SWEP.Anims.Idle_Aim = "idle_scoped"
SWEP.Anims.Reload = "reload"
SWEP.Anims.Reload_Nomen = "reload_nomen"
SWEP.Anims.Reload_Empty = "reload_empty"
SWEP.Anims.Reload_Empty_Nomen = "reload_empty_nomen"

SWEP.Sounds = {}
SWEP.Sounds["reload"] = {[1] = {time = 0.7, sound = Sound("Weapon_Sako95.MagOut")},
	[2] = {time = 1.5, sound = Sound("MagPouch_AR")},
	[3] = {time = 2, sound = Sound("Weapon_Sako95.MagIn")}}
	
SWEP.Sounds["reload_nomen"] = {[1] = {time = 0.6, sound = Sound("Weapon_Sako95.MagOut")},
	[2] = {time = 1.2, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.55, sound = Sound("Weapon_Sako95.MagIn")}}
	
SWEP.Sounds["reload_empty"] = {[1] = {time = 0.7, sound = Sound("Weapon_Sako95.MagOutEmpty")},
	[2] = {time = 1.15, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.9, sound = Sound("Weapon_Sako95.MagIn")},
	[4] = {time = 3.2, sound = Sound("Weapon_Sako95.BoltBack")},
	[5] = {time = 3.5, sound = Sound("Weapon_Sako95.BoltForward")}}
	
SWEP.Sounds["reload_empty_nomen"] = {[1] = {time = 0.6, sound = Sound("Weapon_Sako95.MagOutEmpty")},
	[2] = {time = 1.15, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.6, sound = Sound("Weapon_Sako95.MagIn")},
	[4] = {time = 2.6, sound = Sound("Weapon_Sako95.BoltBack")},
	[5] = {time = 2.8, sound = Sound("Weapon_Sako95.BoltForward")}}
	
SWEP.FireModes = {"auto", "semi"}

SWEP.Category = "FA:S 2 Weapons"
SWEP.Base = "fas2_base"
SWEP.Author            = "Spy"
SWEP.Contact        = ""
SWEP.Purpose        = ""

SWEP.ViewModelFOV    = 60
SWEP.ViewModelFlip    = false

SWEP.Spawnable            = true
SWEP.AdminSpawnable        = true

SWEP.VM = "models/weapons/view/rifles/galil.mdl"
SWEP.WorldModel   = "models/weapons/w_rif_galil.mdl"

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = 35
SWEP.Primary.DefaultClip    = 0
SWEP.Primary.Automatic       = true    
SWEP.Primary.Ammo             = "5.56x45MM"
 
-- Secondary Fire Attributes --
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic       = false
SWEP.Secondary.Ammo         = "none"

-- Deploy related
SWEP.FirstDeployTime = 0.45
SWEP.DeployTime = 0.7
SWEP.DeployAnimSpeed = 0.5

-- Firing related
SWEP.Shots = 1
SWEP.FireDelay = 0.08
SWEP.Damage = 27
SWEP.FireSound = Sound("FAS2_GALIL")
SWEP.FireSound_Suppressed = Sound("FAS2_RK95_S")

-- Accuracy related
SWEP.HipCone = 0.05
SWEP.AimCone = 0.004
SWEP.SpreadPerShot = 0.007
SWEP.MaxSpreadInc = 0.03
SWEP.SpreadCooldown = 0.15
SWEP.VelocitySensitivity = 1.7
SWEP.AimFOV = 5

-- Recoil related
SWEP.ViewKick = 1.1
SWEP.Recoil = 0.75

-- Reload related
SWEP.ReloadTime = 2.6
SWEP.ReloadTime_Nomen = 2.2
SWEP.ReloadTime_Empty = 3.7
SWEP.ReloadTime_Empty_Nomen = 2.8

if CLIENT then
	local x, y, old, ang
	local sightELCAN = surface.GetTextureID("models/weapons/view/accessories/elcan_reticle")
	local sightPSO = surface.GetTextureID("sprites/scope_pso_illum")
	local sightPSO2 = surface.GetTextureID("sprites/scope_pso")
	local lens = surface.GetTextureID("VGUI/fas2/lense")
	local lensring = surface.GetTextureID("VGUI/fas2/lensring")
	local cd, alpha = {}, 0.5
	local Ini = true
	
	function SWEP:DrawRenderTarget()
		if self.AimPos != self.PSO1Pos and self.AimPos != self.ELCANPos then
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
		ang:RotateAroundAxis(ang:Forward(), -90)
		
		cd.angles = ang
		cd.origin = self.Owner:GetShootPos()
		cd.x = 0
		cd.y = 0
		cd.w = 512 
		cd.h = 512
		
		if self.AimPos == self.PSO1Pos then
			cd.fov = 4
		else
			cd.fov = 5
		end
		
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
				
				if self.AimPos == self.PSO1Pos then
					surface.SetTexture(sightPSO2)
					surface.DrawTexturedRect(1, 1, 512, 512)
					surface.SetDrawColor(255, 255, 255, 255)
					surface.SetTexture(sightPSO)
					surface.DrawTexturedRect(0, 0, 512, 512)
				else
					surface.SetTexture(sightELCAN)
					surface.DrawTexturedRect(0, 0, 512, 512)
				end
				
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
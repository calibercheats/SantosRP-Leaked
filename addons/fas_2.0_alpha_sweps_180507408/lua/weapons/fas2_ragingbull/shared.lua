
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 8
end

if CLIENT then
    SWEP.PrintName = "Raging Bull"
    SWEP.Slot = 1
    SWEP.SlotPos = 0
	SWEP.DrawAmmo = false
	
	SWEP.AimPos = Vector(-1.219, 1, 0.7)
	SWEP.AimAng = Vector(0.37, 0, 0)
	
	SWEP.CompM4Pos = Vector(-1.222, -2, 0.17)
	SWEP.CompM4Ang = Vector(0, 0, 0)
	
	SWEP.LeupoldPos = Vector(-1.216, -3, 0.285)
	SWEP.LeupoldAng = Vector(0, 0, 0)
	
	SWEP.SprintPos = Vector(1.735, -4.87, -4.69)
	SWEP.SprintAng = Vector(58.433, 0, 0)
	
	SWEP.CustomizePos = Vector(5.901, -3.872, -1.696)
	SWEP.CustomizeAng = Vector(29.231, 44.895, 22.747)
	SWEP.YawMod = 0.1
	SWEP.MoveType = 2
	SWEP.MagText = "CYLINDER "
	
	SWEP.MuzzleEffect = "muzzleflash_pistol_rbull"
	SWEP.AttachmentBGs = {["compm4"] = {bg = 2, sbg = 1},
		["leupold"] = {bg = 2, sbg = 2}}
	
	SWEP.EjectTime_1 = 1
	SWEP.EjectTime_2 = 0.9
	SWEP.EjectTime_3 = 0.9
	SWEP.EjectTime_4 = 0.9
	SWEP.EjectTime_5 = 0.9
	
	SWEP.EjectTime_1_Nomen = 0.75
	SWEP.EjectTime_2_Nomen = 0.65
	SWEP.EjectTime_3_Nomen = 0.65
	SWEP.EjectTime_4_Nomen = 0.65
	SWEP.EjectTime_5_Nomen = 0.65
	SWEP.HideWorldModel = false
	
	SWEP.Text3DForward = -2
	SWEP.Text3DRight = -1
	SWEP.Text3DSize = 0.007
	SWEP.SafePosType = "pistol"
	SWEP.SwayInterpolation = "linear"
end

SWEP.Attachments = {
	[1] = {header = "Sight", sight = true, x = 100, y = -100, atts = {"leupold", "compm4"}}}

SWEP.BulletLength = 10.9
SWEP.CaseLength = 32.6

SWEP.Anims = {}
SWEP.Anims.Draw_First = "Draw"
SWEP.Anims.Draw = "Draw"
SWEP.Anims.Draw = "Draw_Empty"
SWEP.Anims.Holster = "Holster"
SWEP.Anims.Holster_Empty = "Holster_Empty"
SWEP.Anims.Fire = {"Fire01", "Fire02", "Fire03"}
SWEP.Anims.Fire_Aiming = "Fire_Scoped01"
SWEP.Anims.Idle = "idle"
SWEP.Anims.Idle_Aim = "idle_scoped"
SWEP.Anims.Reload1 = "Reload1"
SWEP.Anims.Reload2 = "Reload2"
SWEP.Anims.Reload3 = "Reload3"
SWEP.Anims.Reload4 = "Reload4"
SWEP.Anims.Reload5 = "Reload5"
SWEP.Anims.Reload1_Nomen = "Reload1_nomen"
SWEP.Anims.Reload2_Nomen = "Reload2_nomen"
SWEP.Anims.Reload3_Nomen = "Reload3_nomen"
SWEP.Anims.Reload4_Nomen = "Reload4_nomen"
SWEP.Anims.Reload5_Nomen = "Reload5_nomen"
SWEP.Anims.Reload_Empty = "reload_empty"
SWEP.Anims.Reload_Empty_Nomen = "reload_empty_nomen"

SWEP.Sounds = {}
SWEP.Sounds["Reload1"] = {[1] = {time = 0.4, sound = Sound("Weapon_RBULL.CylinderOpen")},
	[2] = {time = 1.1, sound = Sound("Weapon_RBULL.Remove")},
	[3] = {time = 1.65, sound = Sound("Weapon_RBULL.Jiggle")},
	[4] = {time = 1.85, sound = Sound("Weapon_RBULL.Insert")},
	[5] = {time = 2.3, sound = Sound("Weapon_RBULL.CylinderClose")}}
	
SWEP.Sounds["Reload2"] = {[1] = {time = 0.4, sound = Sound("Weapon_RBULL.CylinderOpen")},
	[2] = {time = 1, sound = Sound("Weapon_RBULL.Remove")},
	[3] = {time = 1.5, sound = Sound("Weapon_RBULL.Jiggle")},
	[4] = {time = 1.75, sound = Sound("Weapon_RBULL.Insert")},
	[5] = {time = 1.9, sound = Sound("Weapon_RBULL.Jiggle")},
	[6] = {time = 2.2, sound = Sound("Weapon_RBULL.Insert")},
	[7] = {time = 2.9, sound = Sound("Weapon_RBULL.CylinderClose")}}
	
SWEP.Sounds["Reload3"] = {[1] = {time = 0.4, sound = Sound("Weapon_RBULL.CylinderOpen")},
	[2] = {time = 0.9, sound = Sound("Weapon_RBULL.Remove")},
	[4] = {time = 1.5, sound = Sound("Weapon_RBULL.Jiggle")},
	[3] = {time = 1.75, sound = Sound("Weapon_RBULL.Insert")},
	[4] = {time = 1.9, sound = Sound("Weapon_RBULL.Jiggle")},
	[5] = {time = 2.2, sound = Sound("Weapon_RBULL.Insert")},
	[6] = {time = 2.4, sound = Sound("Weapon_RBULL.Jiggle")},
	[7] = {time = 2.7, sound = Sound("Weapon_RBULL.Insert")},
	[8] = {time = 3.4, sound = Sound("Weapon_RBULL.CylinderClose")}}
	
SWEP.Sounds["Reload4"] = {[1] = {time = 0.4, sound = Sound("Weapon_RBULL.CylinderOpen")},
	[2] = {time = 0.9, sound = Sound("Weapon_RBULL.Remove")},
	[4] = {time = 1.5, sound = Sound("Weapon_RBULL.Jiggle")},
	[3] = {time = 1.75, sound = Sound("Weapon_RBULL.Insert")},
	[4] = {time = 1.9, sound = Sound("Weapon_RBULL.Jiggle")},
	[5] = {time = 2.2, sound = Sound("Weapon_RBULL.Insert")},
	[6] = {time = 2.4, sound = Sound("Weapon_RBULL.Jiggle")},
	[7] = {time = 2.7, sound = Sound("Weapon_RBULL.Insert")},
	[8] = {time = 2.9, sound = Sound("Weapon_RBULL.Jiggle")},
	[9] = {time = 3.2, sound = Sound("Weapon_RBULL.Insert")},
	[10] = {time = 3.8, sound = Sound("Weapon_RBULL.CylinderClose")}}
	
SWEP.Sounds["Reload5"] = {[1] = {time = 0.4, sound = Sound("Weapon_RBULL.CylinderOpen")},
	[2] = {time = 0.85, sound = Sound("Weapon_RBULL.Extractor")},
	[3] = {time = 0.8, sound = Sound("Weapon_RBULL.Remove")},
	[4] = {time = 1.2, sound = Sound("Weapon_RBULL.Extractor")},
	[5] = {time = 1.5, sound = Sound("Weapon_RBULL.Jiggle")},
	[6] = {time = 1.75, sound = Sound("Weapon_RBULL.Insert")},
	[7] = {time = 1.9, sound = Sound("Weapon_RBULL.Jiggle")},
	[8] = {time = 2.2, sound = Sound("Weapon_RBULL.Insert")},
	[9] = {time = 2.4, sound = Sound("Weapon_RBULL.Jiggle")},
	[10] = {time = 2.7, sound = Sound("Weapon_RBULL.Insert")},
	[11] = {time = 2.9, sound = Sound("Weapon_RBULL.Jiggle")},
	[12] = {time = 3.2, sound = Sound("Weapon_RBULL.Insert")},
	[13] = {time = 3.4, sound = Sound("Weapon_RBULL.Jiggle")},
	[14] = {time = 3.6, sound = Sound("Weapon_RBULL.Insert")},
	[15] = {time = 4.4, sound = Sound("Weapon_RBULL.CylinderClose")}}
	
SWEP.Sounds["Reload1_nomen"] = {[1] = {time = 0.2, sound = Sound("Weapon_RBULL.CylinderOpen")},
	[2] = {time = 0.8, sound = Sound("Weapon_RBULL.Remove")},
	[3] = {time = 1.35, sound = Sound("Weapon_RBULL.Jiggle")},
	[4] = {time = 1.55, sound = Sound("Weapon_RBULL.Insert")},
	[5] = {time = 1.8, sound = Sound("Weapon_RBULL.CylinderClose")}}
	
SWEP.Sounds["Reload2_nomen"] = {[1] = {time = 0.2, sound = Sound("Weapon_RBULL.CylinderOpen")},
	[2] = {time = 0.6, sound = Sound("Weapon_RBULL.Remove")},
	[3] = {time = 1.25, sound = Sound("Weapon_RBULL.Jiggle")},
	[4] = {time = 1.45, sound = Sound("Weapon_RBULL.Insert")},
	[5] = {time = 1.55, sound = Sound("Weapon_RBULL.Jiggle")},
	[6] = {time = 1.65, sound = Sound("Weapon_RBULL.Insert")},
	[7] = {time = 2.1, sound = Sound("Weapon_RBULL.CylinderClose")}}
	
SWEP.Sounds["Reload3_nomen"] = {[1] = {time = 0.2, sound = Sound("Weapon_RBULL.CylinderOpen")},
	[2] = {time = 0.6, sound = Sound("Weapon_RBULL.Remove")},
	[3] = {time = 1.35, sound = Sound("Weapon_RBULL.Jiggle")},
	[4] = {time = 1.55, sound = Sound("Weapon_RBULL.Insert")},
	[5] = {time = 1.65, sound = Sound("Weapon_RBULL.Jiggle")},
	[6] = {time = 1.75, sound = Sound("Weapon_RBULL.Insert")},
	[7] = {time = 1.85, sound = Sound("Weapon_RBULL.Jiggle")},
	[8] = {time = 1.95, sound = Sound("Weapon_RBULL.Insert")},
	[9] = {time = 2.5, sound = Sound("Weapon_RBULL.CylinderClose")}}
	
SWEP.Sounds["Reload4_nomen"] = {[1] = {time = 0.2, sound = Sound("Weapon_RBULL.CylinderOpen")},
	[2] = {time = 0.6, sound = Sound("Weapon_RBULL.Remove")},
	[3] = {time = 1.35, sound = Sound("Weapon_RBULL.Jiggle")},
	[4] = {time = 1.55, sound = Sound("Weapon_RBULL.Insert")},
	[5] = {time = 1.7, sound = Sound("Weapon_RBULL.Jiggle")},
	[6] = {time = 1.8, sound = Sound("Weapon_RBULL.Insert")},
	[7] = {time = 2, sound = Sound("Weapon_RBULL.Jiggle")},
	[8] = {time = 2.1, sound = Sound("Weapon_RBULL.Insert")},
	[9] = {time = 2.3, sound = Sound("Weapon_RBULL.Jiggle")},
	[10] = {time = 2.4, sound = Sound("Weapon_RBULL.Insert")},
	[11] = {time = 2.85, sound = Sound("Weapon_RBULL.CylinderClose")}}
	
SWEP.Sounds["Reload5_nomen"] = {[1] = {time = 0.2, sound = Sound("Weapon_RBULL.CylinderOpen")},
	[2] = {time = 0.6, sound = Sound("Weapon_RBULL.Extractor")},
	[3] = {time = 0.6, sound = Sound("Weapon_RBULL.Remove")},
	[4] = {time = 1.2, sound = Sound("Weapon_RBULL.Jiggle")},
	[5] = {time = 1.4, sound = Sound("Weapon_RBULL.Insert")},
	[6] = {time = 1.5, sound = Sound("Weapon_RBULL.Jiggle")},
	[7] = {time = 1.6, sound = Sound("Weapon_RBULL.Insert")},
	[8] = {time = 1.8, sound = Sound("Weapon_RBULL.Jiggle")},
	[9] = {time = 2, sound = Sound("Weapon_RBULL.Insert")},
	[10] = {time = 2.2, sound = Sound("Weapon_RBULL.Jiggle")},
	[11] = {time = 2.3, sound = Sound("Weapon_RBULL.Insert")},
	[12] = {time = 2.5, sound = Sound("Weapon_RBULL.Jiggle")},
	[13] = {time = 2.6, sound = Sound("Weapon_RBULL.Insert")},
	[14] = {time = 3.4, sound = Sound("Weapon_RBULL.CylinderClose")}}
	
SWEP.FireModes = {"double"}

SWEP.Category = "FA:S 2 Weapons"
SWEP.Base = "fas2_base"
SWEP.Author            = "Spy"
SWEP.Contact        = ""
SWEP.Purpose        = ""
SWEP.HoldType = "revolver"
SWEP.RunHoldType = "normal"

SWEP.ViewModelFOV    = 57
SWEP.ViewModelFlip    = false

SWEP.Spawnable            = true
SWEP.AdminSpawnable        = true

SWEP.VM = "models/weapons/view/pistols/ragingbull.mdl"
SWEP.WorldModel   = "models/weapons/w_357.mdl"

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = 5
SWEP.Primary.DefaultClip    = 0
SWEP.Primary.Automatic       = false    
SWEP.Primary.Ammo             = ".454 Casull"
 
-- Secondary Fire Attributes --
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic       = false
SWEP.Secondary.Ammo         = "none"

-- Deploy related
SWEP.FirstDeployTime = 0.45
SWEP.DeployTime = 0.45
SWEP.HolsterTime = 0.3
SWEP.DeployAnimSpeed = 0.65

-- Firing related
SWEP.Shots = 1
SWEP.FireDelay = 0.25
SWEP.Damage = 58
SWEP.FireSound = Sound("FAS2_RAGINGBULL")
SWEP.CantSuppress = true

-- Accuracy related
SWEP.HipCone = 0.035
SWEP.AimCone = 0.01
SWEP.SpreadPerShot = 0.015
SWEP.MaxSpreadInc = 0.045
SWEP.SpreadCooldown = 0.4
SWEP.VelocitySensitivity = 1.4
SWEP.AimFOV = 0

-- Recoil related
SWEP.ViewKick = 3.8
SWEP.Recoil = 3

-- Reload related
SWEP.ReloadTime_1 = 2.5
SWEP.ReloadTime_2 = 3.2
SWEP.ReloadTime_3 = 3.7
SWEP.ReloadTime_4 = 4
SWEP.ReloadTime_5 = 4.7
SWEP.ReloadTime_Nomen_1 = 2.2
SWEP.ReloadTime_Nomen_2 = 2.2
SWEP.ReloadTime_Nomen_3 = 2.2
SWEP.ReloadTime_Nomen_4 = 2.2
SWEP.ReloadTime_Nomen_5 = 2.2
SWEP.CantChamber = true
SWEP.FirstDeploy = true -- override some anim stuff

local mag, ammo, CT

function SWEP:Reload()
	CT = CurTime()
	
	if CT < self.ReloadWait then
		return
	end
	
	if self.Owner:KeyDown(IN_USE) then
		self:CycleFiremodes()
		self:SetNextPrimaryFire(CT + 0.25)
		self:SetNextSecondaryFire(CT + 0.25)
		self.ReloadWait = CT + 0.25
	
		return
	end
	
	if self.ReloadDelay and CT < self.ReloadDelay then
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
		if ammo >= 5 - mag then
			FAS2_PlayAnim(self, "Reload" .. 5 - mag .. "_nomen")
			self.ReloadDelay = CT + self["ReloadTime_Nomen_" .. 5 - mag] + 0.3
			self:SetNextPrimaryFire(CT + self["ReloadTime_Nomen_" .. 5 - mag] + 0.3)
			self:SetNextSecondaryFire(CT + self["ReloadTime_Nomen_" .. 5 - mag] + 0.3)
		else
			FAS2_PlayAnim(self, "Reload" .. ammo .. "_nomen")
			self.ReloadDelay = CT + self["ReloadTime_Nomen_" .. ammo] + 0.3
			self:SetNextPrimaryFire(CT + self["ReloadTime_Nomen_" .. ammo] + 0.3)
			self:SetNextSecondaryFire(CT + self["ReloadTime_Nomen_" .. ammo] + 0.3)
		end
		
		if CLIENT then
			self:EjectFromCylinder(5 - mag, self["EjectTime_" .. 5 - mag .. "_Nomen"])
		end
		
		if SERVER and game.SinglePlayer() then
			SendUserMessage("FAS2_EJECTFROMCYLINDERNOMEN", self.Owner)
		end
	else
		if ammo >= 5 - mag then
			FAS2_PlayAnim(self, "Reload" .. 5 - mag)
			self.ReloadDelay = CT + self["ReloadTime_" .. 5 - mag] + 0.3
			self:SetNextPrimaryFire(CT + self["ReloadTime_" .. 5 - mag] + 0.3)
			self:SetNextSecondaryFire(CT + self["ReloadTime_" .. 5 - mag] + 0.3)
		else
			FAS2_PlayAnim(self, "Reload" .. ammo)
			self.ReloadDelay = CT + self["ReloadTime_" .. ammo] + 0.3
			self:SetNextPrimaryFire(CT + self["ReloadTime_" .. ammo] + 0.3)
			self:SetNextSecondaryFire(CT + self["ReloadTime_" .. ammo] + 0.3)
		end
		
		if CLIENT then
			self:EjectFromCylinder(5 - mag, self["EjectTime_" .. 5 - mag])
		end
		
		if SERVER and game.SinglePlayer() then
			SendUserMessage("FAS2_EJECTFROMCYLINDER", self.Owner)
		end
	end
	
	self.Owner:SetAnimation(PLAYER_RELOAD)
end

if CLIENT then
	local grad = surface.GetTextureID("VGUI/fas2/gradient")
	local compm4_reticle = Material("models/weapons/view/accessories/aimpoint_reticle")
	local eotech_reticle = Material("sprites/fas2/eotech_reddot")
	local seq, cyc, att, t, tex, x, y, y2, diff, dir, dist, vel, vm
	local YOff, XOff = 0
	local White, Black, Grey, Red, Green = Color(255, 255, 255, 255), Color(0, 0, 0, 255), Color(200, 200, 200, 255), Color(255, 137, 119, 255), Color(202, 255, 163, 255)
	
	function SWEP:EjectFromCylinder(amt, t)
		for i = 1, amt do
			local attachment = self.Wep:GetAttachment(self.Wep:LookupAttachment("ejector" .. amt))
			attachment.Pos.z = attachment.Pos.z - 3
			
			timer.Simple(t, function()
				if IsValid(self) and IsValid(self.Owner) and self.Owner:Alive() then
					vel = self.Owner:GetVelocity()
					
					if amt == 5 then
						FAS2_MakeFakeShell("454casull", attachment.Pos, attachment.Ang, Vector(0, 0, 50) + vel, 0.6 + i / 100, 5)
					else
						FAS2_MakeFakeShell("454casull", attachment.Pos, attachment.Ang, attachment.Ang:Forward() * 50 + vel, 0.6 + i / 100, 5)
					end
				end
			end)
		end
	end
	
	local vm

	local old, ang
	local sight = surface.GetTextureID("sprites/scope_leo")
	local lens = surface.GetTextureID("VGUI/fas2/lense")
	local lensring = surface.GetTextureID("VGUI/fas2/lensring")
	local cd, alpha = {}, 0.5
	local Ini = true
	function SWEP:DrawRenderTarget()
		if self.AimPos == self.LeupoldPos then
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
end
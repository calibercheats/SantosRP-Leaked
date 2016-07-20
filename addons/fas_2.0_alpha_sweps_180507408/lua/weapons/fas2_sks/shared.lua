
-----------------------------------------------------

if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 8
end

if CLIENT then
    SWEP.PrintName = "SKS"
    SWEP.Slot = 3
    SWEP.SlotPos = 0
	
	SWEP.AimPos = Vector(-2.11, -2.652, 1.5)
	SWEP.AimAng = Vector(0, 0, 0)
	
	SWEP.CompM4Pos = Vector(-2.12, -1, 0.78)
	SWEP.CompM4Ang = Vector(0, 0, 0)
	
	SWEP.EoTechPos = Vector(-2.12, -4, 0.48)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.PSO1Pos = Vector(-1.898, -3.65, 0.807)
	SWEP.PSO1Ang = Vector(0, 0, 0)
	
	SWEP.MuzzleEffect = "muzzleflash_ak47"
	SWEP.Shell = "7.62x39"
	SWEP.YawMod = 0.1
	
	SWEP.AttachmentBGs = {["compm4"] = {bg = 2, sbg = 1},
		["eotech"] = {bg = 2, sbg = 2},
		["pso1"] = {bg = 2, sbg = 3},
		["suppressor"] = {bg = 3, sbg = 2},
		["sks20mag"] = {bg = 4, sbg = 1},
		["sks30mag"] = {bg = 4, sbg = 2}}
		
	SWEP.WMAng = Vector(0, 180, 180)
	SWEP.WMPos = Vector(1, -2, 1)
end

SWEP.Attachments = {
	[1] = {header = "Sight", sight = true, x = 900, y = -50, atts = {"pso1", "compm4", "eotech"}},
	[2] = {header = "Barrel", x = 50, y = -200, atts = {"suppressor"}},
	[3] = {header = "Magazine", x = 300, y = 100, atts = {"sks20mag", "sks30mag"}}}

SWEP.BulletLength = 7.62
SWEP.CaseLength = 39
SWEP.EmptySound = Sound("weapons/empty_assaultrifles.wav")

SWEP.Anims = {}
SWEP.Anims.Draw_First = "Draw"
SWEP.Anims.Draw_Empty = "Draw_Empty"
SWEP.Anims.Holster = "Holster"
SWEP.Anims.Holster_Empty = "Holster_Empty"
SWEP.Anims.Draw = "Draw"
SWEP.Anims.Fire = "Fire1"
SWEP.Anims.Fire_Last = "Fire_last"
SWEP.Anims.Fire_Aiming = "fire_scoped"
SWEP.Anims.Fire_Aiming_Last = "Fire_last_scoped"
SWEP.Anims.Idle = "Idle01"
SWEP.Anims.Idle_Aim = "idle_scoped"
SWEP.Anims.Idle_Empty = "Idle01_Empty"
SWEP.Anims.Reload_10 = "Reload5"
SWEP.Anims.Reload_10_Nomen = "Reload5_nmc"
SWEP.Anims.Reload_Empty_10 = "Reload_empty"
SWEP.Anims.Reload_Empty_10_Nomen = "Reload_empty_nmc"
SWEP.Anims.Reload_20 = "Reload_20_add"
SWEP.Anims.Reload_20_Nomen = "Reload_20_add_nmc"
SWEP.Anims.Reload_Empty_20 = "Reload_20_empty"
SWEP.Anims.Reload_Empty_20_Nomen = "Reload_20_empty_nmc"
SWEP.Anims.Reload_30 = "Reload_30"
SWEP.Anims.Reload_30_Nomen = "Reload_30_nmc"
SWEP.Anims.Reload_Empty_30 = "Reload_30_empty"
SWEP.Anims.Reload_Empty_30_Nomen = "Reload_30_empty_nmc"

SWEP.Sounds = {}

SWEP.Sounds["Reload5"] = {[1] = {time = 0.5, sound = Sound("FAS2_SKS.LatchOpen")},
	[2] = {time = 1.3, sound = Sound("FAS2_SKS.LatchClose")},
	[3] = {time = 2.2, sound = Sound("FAS2_SKS.BoltBack")},
	[4] = {time = 2.25, sound = Sound("MagPouch_AR")},
	[5] = {time = 3.2, sound = Sound("FAS2_SKS.ClipIn")},
	[6] = {time = 3.8, sound = Sound("FAS2_SKS.Insert1")},
	[7] = {time = 4.2, sound = Sound("FAS2_SKS.Insert2")},
	[8] = {time = 4.6, sound = Sound("FAS2_SKS.Insert3")},
	[9] = {time = 5.15, sound = Sound("FAS2_SKS.RemoveClip")},
	[10] = {time = 5.55, sound = Sound("FAS2_SKS.BoltBack")},
	[11] = {time = 5.75, sound = Sound("FAS2_SKS.BoltForward")}}
	
SWEP.Sounds["Reload5_nmc"] = {[1] = {time = 0.5, sound = Sound("FAS2_SKS.LatchOpen")},
	[2] = {time = 1, sound = Sound("FAS2_SKS.LatchClose")},
	[3] = {time = 1.6, sound = Sound("MagPouch_AR")},
	[4] = {time = 2.05, sound = Sound("FAS2_SKS.BoltBack")},
	[5] = {time = 2.5, sound = Sound("FAS2_SKS.ClipIn")},
	[6] = {time = 3, sound = Sound("FAS2_SKS.InsertNomen")},
	[7] = {time = 3.55, sound = Sound("FAS2_SKS.RemoveClip")},
	[8] = {time = 3.9, sound = Sound("FAS2_SKS.BoltBack")},
	[9] = {time = 4, sound = Sound("FAS2_SKS.BoltForward")}}
	
SWEP.Sounds["Reload_empty"] = {[1] = {time = 0.5, sound = Sound("MagPouch_AR")},
	[2] = {time = 1, sound = Sound("FAS2_SKS.ClipIn")},
	[3] = {time = 1.6, sound = Sound("FAS2_SKS.Insert1")},
	[4] = {time = 2, sound = Sound("FAS2_SKS.Insert2")},
	[5] = {time = 2.4, sound = Sound("FAS2_SKS.Insert3")},
	[6] = {time = 2.8, sound = Sound("FAS2_SKS.RemoveClip")},
	[7] = {time = 3.2, sound = Sound("FAS2_SKS.LatchClose")},
	[8] = {time = 3.4, sound = Sound("FAS2_SKS.BoltForward")}}
	
SWEP.Sounds["Reload_empty_nmc"] = {[1] = {time = 0.4, sound = Sound("MagPouch_AR")},
	[2] = {time = 0.85, sound = Sound("FAS2_SKS.ClipIn")},
	[3] = {time = 1.4, sound = Sound("FAS2_SKS.InsertNomen")},
	[4] = {time = 2, sound = Sound("FAS2_SKS.RemoveClip")},
	[5] = {time = 2.35, sound = Sound("FAS2_SKS.BoltBack")},
	[6] = {time = 2.45, sound = Sound("FAS2_SKS.BoltForward")}}
	
SWEP.Sounds["Reload_20_add"] = {[1] = {time = 0.5, sound = Sound("FAS2_SKS.BoltBack")},
	[2] = {time = 1, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.6, sound = Sound("FAS2_SKS.ClipIn")},
	[4] = {time = 2.1, sound = Sound("FAS2_SKS.Insert1")},
	[5] = {time = 2.5, sound = Sound("FAS2_SKS.Insert3")},
	[6] = {time = 2.9, sound = Sound("FAS2_SKS.RemoveClip")},
	[7] = {time = 3.15, sound = Sound("FAS2_SKS.BoltForward")}}
	
SWEP.Sounds["Reload_20_add_nmc"] = {[1] = {time = 0.4, sound = Sound("MagPouch_AR")},
	[2] = {time = 0.75, sound = Sound("FAS2_SKS.BoltBack")},
	[3] = {time = 1.1, sound = Sound("FAS2_SKS.ClipIn")},
	[4] = {time = 1.6, sound = Sound("FAS2_SKS.InsertNomen")},
	[5] = {time = 2.05, sound = Sound("FAS2_SKS.BoltForward")},
	[6] = {time = 2.35, sound = Sound("FAS2_SKS.RemoveClip")}}
	
SWEP.Sounds["Reload_20_empty"] = {[1] = {time = 0.5, sound = Sound("MagPouch_AR")},
	[2] = {time = 1, sound = Sound("FAS2_SKS.ClipIn")},
	[3] = {time = 1.6, sound = Sound("FAS2_SKS.Insert1")},
	[4] = {time = 2, sound = Sound("FAS2_SKS.Insert2")},
	[5] = {time = 2.4, sound = Sound("FAS2_SKS.Insert3")},
	[6] = {time = 2.8, sound = Sound("FAS2_SKS.RemoveClip")},
	[7] = {time = 3.3, sound = Sound("MagPouch_AR")},
	[8] = {time = 4, sound = Sound("FAS2_SKS.ClipIn")},
	[9] = {time = 4.5, sound = Sound("FAS2_SKS.Insert1")},
	[10] = {time = 4.9, sound = Sound("FAS2_SKS.Insert2")},
	[11] = {time = 5.3, sound = Sound("FAS2_SKS.Insert3")},
	[12] = {time = 5.8, sound = Sound("FAS2_SKS.RemoveClip")},
	[13] = {time = 6.2, sound = Sound("FAS2_SKS.LatchClose")},
	[14] = {time = 6.4, sound = Sound("FAS2_SKS.BoltForward")}}
	
SWEP.Sounds["Reload_20_empty_nmc"] = {[1] = {time = 0.4, sound = Sound("MagPouch_AR")},
	[2] = {time = 0.85, sound = Sound("FAS2_SKS.ClipIn")},
	[3] = {time = 1.4, sound = Sound("FAS2_SKS.InsertNomen")},
	[4] = {time = 2.05, sound = Sound("FAS2_SKS.RemoveClip")},
	[5] = {time = 3, sound = Sound("FAS2_SKS.ClipIn")},
	[6] = {time = 3.6, sound = Sound("FAS2_SKS.InsertNomen")},
	[7] = {time = 4.2, sound = Sound("FAS2_SKS.RemoveClip")},
	[8] = {time = 4.65, sound = Sound("FAS2_SKS.BoltBack")},
	[9] = {time = 4.75, sound = Sound("FAS2_SKS.BoltForward")}}
	
SWEP.Sounds["Reload_30"] = {[1] = {time = 0.7, sound = Sound("FAS2_SKS.BoltBack")},
	[2] = {time = 1.15, sound = Sound("FAS2_SKS.MagOut")},
	[3] = {time = 1.7, sound = Sound("MagPouch_AR")},
	[4] = {time = 2.5, sound = Sound("FAS2_SKS.MagIn")},
	[5] = {time = 2.8, sound = Sound("FAS2_SKS.BoltForward")}}
	
SWEP.Sounds["Reload_30_nmc"] = {[1] = {time = 0.4, sound = Sound("FAS2_SKS.BoltBack")},
	[2] = {time = 0.9, sound = Sound("FAS2_SKS.MagOut")},
	[3] = {time = 1.4, sound = Sound("MagPouch_AR")},
	[4] = {time = 2, sound = Sound("FAS2_SKS.MagIn")},
	[5] = {time = 2.47, sound = Sound("FAS2_SKS.BoltForward")}}
	
SWEP.Sounds["Reload_30_empty"] = {[1] = {time = 0.9, sound = Sound("FAS2_SKS.MagOut")},
	[2] = {time = 1.7, sound = Sound("MagPouch_AR")},
	[3] = {time = 2.35, sound = Sound("FAS2_SKS.MagIn")},
	[4] = {time = 3.3, sound = Sound("FAS2_SKS.BoltBack")},
	[5] = {time = 3.5, sound = Sound("FAS2_SKS.BoltForward")}}
	
SWEP.Sounds["Reload_30_empty_nmc"] = {[1] = {time = 0.6, sound = Sound("FAS2_SKS.MagOut")},
	[2] = {time = 1.4, sound = Sound("MagPouch_AR")},
	[3] = {time = 1.8, sound = Sound("FAS2_SKS.MagIn")},
	[4] = {time = 2.4, sound = Sound("FAS2_SKS.BoltBack")},
	[5] = {time = 2.55, sound = Sound("FAS2_SKS.BoltForward")}}
	
SWEP.Sounds["deploy_first2"] = {[1] = {time = 0.2, sound = Sound("Generic_Cloth")},
	[2] = {time = 0.7, sound = Sound("Weapon_M4A1.Switch")},
	[3] = {time = 0.9, sound = Sound("Generic_Cloth")}}
	
SWEP.FireModes = {"semi"}

SWEP.Category = "FA:S 2 Weapons"
SWEP.Base = "fas2_base"
SWEP.Author            = "Spy"
SWEP.Contact        = ""
SWEP.Purpose        = ""

SWEP.ViewModelFOV    = 60
SWEP.ViewModelFlip    = false

SWEP.Spawnable            = true
SWEP.AdminSpawnable        = true

SWEP.VM = "models/weapons/view/rifles/sks.mdl"
SWEP.WM = "models/weapons/world/rifles/sks.mdl"
SWEP.WorldModel   = "models/weapons/w_snip_awp.mdl"

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = 10
SWEP.Primary.DefaultClip    = 0
SWEP.Primary.Automatic       = false    
SWEP.Primary.Ammo             = "7.62x39MM"
 
-- Secondary Fire Attributes --
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic       = false
SWEP.Secondary.Ammo         = "none"

-- Deploy related
SWEP.FirstDeployTime = 0.45
SWEP.DeployTime = 0.6
SWEP.DeployAnimSpeed = 0.75

-- Firing related
SWEP.Shots = 1
SWEP.FireDelay = 0.15
SWEP.Damage = 34
SWEP.FireSound = Sound("FAS2_SKS")
SWEP.FireSound_Suppressed = Sound("FAS2_SKS_S")

-- Accuracy related
SWEP.HipCone = 0.054
SWEP.AimCone = 0.006
SWEP.SpreadPerShot = 0.007
SWEP.MaxSpreadInc = 0.03
SWEP.SpreadCooldown = 0.2
SWEP.VelocitySensitivity = 2.2
SWEP.AimFOV = 5

-- Recoil related
SWEP.ViewKick = 1.55
SWEP.Recoil = 1.35

-- Reload related
SWEP.ReloadTime_10 = 6
SWEP.ReloadTime_Nomen_10 = 4.2
SWEP.ReloadTime_Empty_10 = 3.5
SWEP.ReloadTime_Empty_Nomen_10 = 2.75

SWEP.ReloadTime_20 = 3.8
SWEP.ReloadTime_Nomen_20 = 2.8
SWEP.ReloadTime_Empty_20 = 6.7
SWEP.ReloadTime_Empty_Nomen_20 = 5

SWEP.ReloadTime_30 = 3.8
SWEP.ReloadTime_Nomen_30 = 2.8
SWEP.ReloadTime_Empty_30 = 3.8
SWEP.ReloadTime_Empty_Nomen_30 = 2.8

SWEP.CantChamber = true

local mag, ammo
local SP = game.SinglePlayer()

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
	
	if self.FireMode == "safe" then
		if SERVER and SP then
			SendUserMessage("FAS2_CHECKWEAPON", self.Owner)
		end
		
		if CLIENT then
			self.CheckTime = CT + 0.5
		end
		
		return
	end
	
	mag = self:Clip1()
	ammo = self.Owner:GetAmmoCount(self.Primary.Ammo)
	
	if mag >= self.Primary.ClipSize or (self.Primary.ClipSize < 30 and ammo < 10) or ammo == 0 then
		if SERVER and game.SinglePlayer() then
			SendUserMessage("FAS2_CHECKWEAPON", self.Owner)
		end
		
		if CLIENT then
			self.CheckTime = CT + 0.5
		end
		
		return
	end
	
	self.ReloadAmount = nil
	
	if self.Primary.ClipSize == 20 then
		if mag > 10 then
			if SERVER and game.SinglePlayer() then
				SendUserMessage("FAS2_CHECKWEAPON", self.Owner)
			end
			
			if CLIENT then
				self.CheckTime = CT + 0.5
			end
		
			return
		elseif mag < 10 and mag > 0 then
			self.ReloadAmount = 10
		elseif mag == 0 and ammo < 20 then
			self.dt.Status = FAS_STAT_IDLE
			
			if self.Owner.FAS_FamiliarWeapons[self.Class] then
				FAS2_PlayAnim(self, self.Anims["Reload_Empty_10_Nomen"])
				self.ReloadDelay = CT + self.ReloadTime_Empty_Nomen_10 + 0.3
				self:SetNextPrimaryFire(CT + self.ReloadTime_Empty_Nomen_10 + 0.3)
				self:SetNextSecondaryFire(CT + self.ReloadTime_Empty_Nomen_10 + 0.3)
				
				if CLIENT then
					self:MakeSKSStripper(2)
				end
				
				umsg.Start("FAS2_SKSSTRIPPER", self.Owner)
					umsg.Float(2)
				umsg.End()
			else
				FAS2_PlayAnim(self, self.Anims["Reload_Empty_10"])
				self.ReloadDelay = CT + self.ReloadTime_Empty_10 + 0.3
				self:SetNextPrimaryFire(CT + CT + self.ReloadTime_Empty_10 + 0.3)
				self:SetNextSecondaryFire(CT + CT + self.ReloadTime_Empty_10 + 0.3)
				
				if CLIENT then
					self:MakeSKSStripper(2.8)
				end
				
				umsg.Start("FAS2_SKSSTRIPPER", self.Owner)
					umsg.Float(2.8)
				umsg.End()
			end
	
			self.ReloadAmount = 10
			
			return
		end
	elseif self.Primary.ClipSize == 10 then
		self:SetClip1(0)
	end
	
	self.dt.Status = FAS_STAT_IDLE
	
	if self.Owner.FAS_FamiliarWeapons[self.Class] then
		if mag > 0 then
			FAS2_PlayAnim(self, self.Anims["Reload_" .. self.Primary.ClipSize .. "_Nomen"])
			self.ReloadDelay = CT + self["ReloadTime_Nomen_" .. self.Primary.ClipSize] + 0.3
			self:SetNextPrimaryFire(CT + self["ReloadTime_Nomen_" .. self.Primary.ClipSize] + 0.3)
			self:SetNextSecondaryFire(CT + self["ReloadTime_Nomen_" .. self.Primary.ClipSize] + 0.3)
			
			if CLIENT then
				if self.Primary.ClipSize == 10 then
					self:MakeLiveSKSRounds(0.5, mag - 1)
					self:MakeSKSStripper(3.62)
				elseif self.Primary.ClipSize == 20 then
					self:MakeSKSStripper(2.4)
				end
			end
			
			if SERVER and game.SinglePlayer() then
				if self.Primary.ClipSize == 10 then
					umsg.Start("FAS2_MAKELIVESKSROUNDS", self.Owner)
						umsg.Float(0.5)
						umsg.Short(mag - 1)
					umsg.End()
					
					umsg.Start("FAS2_SKSSTRIPPER", self.Owner)
						umsg.Float(3.62)
					umsg.End()
				elseif self.Primary.ClipSize == 20 then
					umsg.Start("FAS2_SKSSTRIPPER", self.Owner)
						umsg.Float(2.4)
					umsg.End()
				end
			end
		else
			FAS2_PlayAnim(self, self.Anims["Reload_Empty_" .. self.Primary.ClipSize .. "_Nomen"])
			self.ReloadDelay = CT + self["ReloadTime_Empty_Nomen_" .. self.Primary.ClipSize] + 0.3
			self:SetNextPrimaryFire(CT + self["ReloadTime_Empty_Nomen_" .. self.Primary.ClipSize] + 0.3)
			self:SetNextSecondaryFire(CT + self["ReloadTime_Empty_Nomen_" .. self.Primary.ClipSize] + 0.3)
			
			if CLIENT then
				if self.Primary.ClipSize == 10 then
					self:MakeSKSStripper(2)
				elseif self.Primary.ClipSize == 20 then
					self:MakeSKSStripper(2.1)
					self:MakeSKSStripper(4.25)
				end
			end
			
			if SERVER and game.SinglePlayer() then
				if self.Primary.ClipSize == 10 then
					umsg.Start("FAS2_SKSSTRIPPER", self.Owner)
						umsg.Float(2)
					umsg.End()
					
				elseif self.Primary.ClipSize == 20 then
					umsg.Start("FAS2_SKSSTRIPPER", self.Owner)
						umsg.Float(2.1)
					umsg.End()
					
					umsg.Start("FAS2_SKSSTRIPPER", self.Owner)
						umsg.Float(4.25)
					umsg.End()
				end
			end
		end
	else
		if mag > 0 then
			FAS2_PlayAnim(self, self.Anims["Reload_" .. self.Primary.ClipSize])
			self.ReloadDelay = CT + self["ReloadTime_" .. self.Primary.ClipSize] + 0.3
			self:SetNextPrimaryFire(CT + self["ReloadTime_" .. self.Primary.ClipSize] + 0.3)
			self:SetNextSecondaryFire(CT + self["ReloadTime_" .. self.Primary.ClipSize] + 0.3)
			
			if CLIENT then
				if self.Primary.ClipSize == 10 then
					self:MakeLiveSKSRounds(0.55, mag - 1)
					self:MakeSKSStripper(5.15)
				elseif self.Primary.ClipSize == 20 then
					self:MakeSKSStripper(2.95)
				end
			end
			
			if SERVER and game.SinglePlayer() then
				if self.Primary.ClipSize == 10 then
					umsg.Start("FAS2_MAKELIVESKSROUNDS", self.Owner)
						umsg.Float(0.55)
						umsg.Short(mag - 1)
					umsg.End()
					
					umsg.Start("FAS2_SKSSTRIPPER", self.Owner)
						umsg.Float(5.15)
					umsg.End()
				elseif self.Primary.ClipSize == 20 then
					umsg.Start("FAS2_SKSSTRIPPER", self.Owner)
						umsg.Float(2.95)
					umsg.End()
				end
			end
		else
			if CLIENT then
				if self.Primary.ClipSize == 10 then
					self:MakeSKSStripper(2.8)
				elseif self.Primary.ClipSize == 20 then
					self:MakeSKSStripper(2.8)
					self:MakeSKSStripper(5.8)
				end
			end
			
			if SERVER and game.SinglePlayer() then
				if self.Primary.ClipSize == 10 then
					umsg.Start("FAS2_SKSSTRIPPER", self.Owner)
						umsg.Float(2.8)
					umsg.End()
				elseif self.Primary.ClipSize == 20 then
					umsg.Start("FAS2_SKSSTRIPPER", self.Owner)
						umsg.Float(2.8)
					umsg.End()
					
					umsg.Start("FAS2_SKSSTRIPPER", self.Owner)
						umsg.Float(5.8)
					umsg.End()
				end
			end
			
			FAS2_PlayAnim(self, self.Anims["Reload_Empty_" .. self.Primary.ClipSize])
			self.ReloadDelay = CT + self["ReloadTime_Empty_" .. self.Primary.ClipSize] + 0.3
			self:SetNextPrimaryFire(CT + self["ReloadTime_Empty_" .. self.Primary.ClipSize] + 0.3)
			self:SetNextSecondaryFire(CT + self["ReloadTime_Empty_" .. self.Primary.ClipSize] + 0.3)
		end
	end
	
	self.Owner:SetAnimation(PLAYER_RELOAD)
end

if CLIENT then
	local att, dir, ang, vel
	
	function SWEP:MakeSKSStripper(t)
		//timer.Simple(t, function()
		self:AddEvent(t, function()
			if IsValid(self) then
				att = self.Wep:GetAttachment(self.Wep:LookupAttachment("ejector3"))
				dir = att.Ang:Forward()
				att.Pos = att.Pos - dir * 6
				att.Ang:RotateAroundAxis(att.Ang:Forward(), 90)
				FAS2_MakeFakeShell("stripper", att.Pos + dir, att.Ang, dir * 150 + self.Owner:GetVelocity(), 0, 5)
			end
		end)
		//end)
	end
	
	function SWEP:MakeLiveSKSRounds(t, amt)
		//timer.Simple(t, function()
		self:AddEvent(t, function()
			if IsValid(self) then
				att = self.Wep:GetAttachment(self.Wep:LookupAttachment("ejector2"))
				dir = att.Ang:Forward()
				att.Pos = att.Pos - dir * 2
				ang = EyeAngles()
				vel = self.Owner:GetVelocity()
				
				for i = 1, amt do
					FAS2_MakeFakeShell("7.62x39_live", att.Pos + dir * (i * 0.75), ang, dir * 100 + vel, 0.4 + i / 10, 5)
				end
			end
		end)
		//end)
	end
	
	local x, y, old, ang
	local sight = surface.GetTextureID("sprites/scope_pso_illum")
	local sight2 = surface.GetTextureID("sprites/scope_pso")
	local lens = surface.GetTextureID("VGUI/fas2/lense")
	local lensring = surface.GetTextureID("VGUI/fas2/lensring")
	local cd, alpha = {}, 0.5
	local Ini = true
	
	function SWEP:DrawRenderTarget()
		if self.AimPos != self.PSO1Pos then
			return
		end
		
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
		cd.fov = 4
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
				surface.SetTexture(sight2)
				surface.DrawTexturedRect(1, 1, 512, 512)
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
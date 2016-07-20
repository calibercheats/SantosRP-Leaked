
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 4
	SWEP.AttOnPickUp = {"slugrounds"}
end

if CLIENT then
    SWEP.PrintName = "M3 Super 90"
    SWEP.Slot = 4
    SWEP.SlotPos = 0
	
	SWEP.AimPos = Vector(-2.26, -4, 1.7)
	SWEP.AimAng = Vector(0, 0, 0)
	
	SWEP.CompM4Pos = Vector(-2.26, -2, 1.09)
	SWEP.CompM4Ang = Vector(0, 0, 0)
	
	SWEP.YawMod = 0.1
	
	SWEP.MuzzleEffect = "muzzleflash_M3"
	SWEP.Shell = "12g_buck"
	SWEP.AttachmentBGs = {["compm4"] = {bg = 2, sbg = 1},
		["slugrounds"] = {bg = 3, sbg = 1}}
	
	SWEP.WMAng = Vector(0, 180, 180)
	SWEP.WMPos = Vector(1, -3.2, 0.25)
	SWEP.MagText = "TUBE "
	SWEP.NoBlurOnPump = true
end

SWEP.Attachments = {[1] = {header = "Sight", sight = true, x = 600, y = -50, atts = {"compm4"}},
	[2] = {header = "Ammo", x = 500, y = 100, atts = {"slugrounds"}}}

SWEP.BulletLength = 5
SWEP.CaseLength = 5.2
SWEP.EmptySound = Sound("weapons/empty_shotguns.wav")

SWEP.Anims = {}
SWEP.Anims.Draw_First = "deploy_first"
SWEP.Anims.Draw = "deploy"
SWEP.Anims.Draw_Empty = "deploy_empty"
SWEP.Anims.Holster = "holster"
SWEP.Anims.Holster_Empty = "holster_empty"
SWEP.Anims.Fire = {"fire1", "fire2", "fire3"}
SWEP.Anims.Fire_Last = "fire_last"
SWEP.Anims.Fire_Aiming = "fire_iron"
SWEP.Anims.Fire_Aiming_Last = "fire_last_iron"
SWEP.Anims.Idle = "idle"
SWEP.Anims.Idle_Aim = "idle_scoped"
SWEP.Anims.Reload_Start = "reload_start"
SWEP.Anims.Reload_Start_Empty = "reload_start_empty"
SWEP.Anims.Reload_End = "reload_abort"
SWEP.Anims.Load1 = "reload_load1"
SWEP.Anims.Load2 = "reload_load2"
SWEP.Anims.Load3 = "reload_load3"
SWEP.Anims.Load4 = "reload_load4"

SWEP.Sounds = {}
SWEP.Sounds["deploy_first"] = {[1] = {time = 1.2, sound = Sound("FAS2_M3S90.Restock")},
	[2] = {time = 1.9, sound = Sound("FAS2_M3S90.Restock")}}
	
SWEP.Sounds["reload_load1"] = {[1] = {time = 0.05, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 0.35, sound = Sound("FAS2_M3S90.Load")}}
	
SWEP.Sounds["reload_load2"] = {[1] = {time = 0.05, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 0.45, sound = Sound("FAS2_M3S90.Load")},
	[3] = {time = 0.8, sound = Sound("FAS2_M3S90.Load")}}
	
SWEP.Sounds["reload_load3"] = {[1] = {time = 0.05, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 0.45, sound = Sound("FAS2_M3S90.Load")},
	[3] = {time = 0.8, sound = Sound("FAS2_M3S90.Load")},
	[4] = {time = 1.2, sound = Sound("FAS2_M3S90.Load")}}
	
SWEP.Sounds["reload_load4"] = {[1] = {time = 0.05, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 0.3, sound = Sound("FAS2_M3S90.Load")},
	[3] = {time = 0.6, sound = Sound("FAS2_M3S90.Load")},
	[4] = {time = 0.9, sound = Sound("FAS2_M3S90.Load")},
	[5] = {time = 1.2, sound = Sound("FAS2_M3S90.Load")}}
	
SWEP.Sounds["reload_start_empty"] = {[1] = {time = 0.05, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 0.75, sound = Sound("FAS2_M3S90.LoadEjectorPort")},
	[3] = {time = 1.25, sound = Sound("FAS2_M3S90.BoltCatch")}}
	
SWEP.Sounds["last6_reload_insert"] = {[1] = {time = 0.1, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 0.4, sound = Sound("FAS2_M3S90.Load")}}
	
SWEP.Sounds["last5_reload_insert"] = {[1] = {time = 0.1, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 0.4, sound = Sound("FAS2_M3S90.Load")}}
	
SWEP.Sounds["last4_reload_insert"] = {[1] = {time = 0.1, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 0.4, sound = Sound("FAS2_M3S90.Load")}}
	
SWEP.Sounds["last3_reload_insert"] = {[1] = {time = 0.1, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 0.4, sound = Sound("FAS2_M3S90.Load")}}
	
SWEP.Sounds["last2_reload_insert"] = {[1] = {time = 0.1, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 0.4, sound = Sound("FAS2_M3S90.Load")}}
	
SWEP.Sounds["last1_reload_insert"] = {[1] = {time = 0.1, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 0.4, sound = Sound("FAS2_M3S90.Load")}}
	
SWEP.Sounds["last6_reload_end"] = {[1] = {time = 0.1, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 0.4, sound = Sound("FAS2_M3S90.Load")}}
	
SWEP.Sounds["last5_reload_end"] = {[1] = {time = 0.1, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 0.4, sound = Sound("FAS2_M3S90.Load")}}
	
SWEP.Sounds["last4_reload_end"] = {[1] = {time = 0.1, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 0.4, sound = Sound("FAS2_M3S90.Load")}}
	
SWEP.Sounds["last3_reload_end"] = {[1] = {time = 0.1, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 0.4, sound = Sound("FAS2_M3S90.Load")}}
	
SWEP.Sounds["last2_reload_end"] = {[1] = {time = 0.1, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 0.4, sound = Sound("FAS2_M3S90.Load")}}
	
SWEP.Sounds["last1_reload_end"] = {[1] = {time = 0.1, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 0.4, sound = Sound("FAS2_M3S90.Load")}}

SWEP.Sounds["last1_reload_end"] = {[1] = {time = 0.1, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 0.4, sound = Sound("FAS2_M3S90.Load")}}
	
SWEP.Sounds["last6_reload_start"] = {[1] = {time = 0.3, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 0.8, sound = Sound("FAS2_M3S90.Load")}}
	
SWEP.Sounds["last5_reload_start"] = {[1] = {time = 0.3, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 0.8, sound = Sound("FAS2_M3S90.Load")}}
	
SWEP.Sounds["last4_reload_start"] = {[1] = {time = 0.3, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 0.8, sound = Sound("FAS2_M3S90.Load")}}
	
SWEP.Sounds["last3_reload_start"] = {[1] = {time = 0.3, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 0.8, sound = Sound("FAS2_M3S90.Load")}}
	
SWEP.Sounds["last2_reload_start"] = {[1] = {time = 0.3, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 0.8, sound = Sound("FAS2_M3S90.Load")}}
	
SWEP.Sounds["last1_reload_start"] = {[1] = {time = 0.3, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 0.8, sound = Sound("FAS2_M3S90.Load")}}
	
SWEP.Sounds["last6_reload_start_empty"] = {[1] = {time = 0.3, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 1, sound = Sound("FAS2_M3S90.LoadEjectorPort")},
	[3] = {time = 1.52, sound = Sound("FAS2_M3S90.BoltCatch")}}
	
SWEP.Sounds["last5_reload_start_empty"] = {[1] = {time = 0.3, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 1, sound = Sound("FAS2_M3S90.LoadEjectorPort")},
	[3] = {time = 1.52, sound = Sound("FAS2_M3S90.BoltCatch")}}

SWEP.Sounds["last4_reload_start_empty"] = {[1] = {time = 0.3, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 1, sound = Sound("FAS2_M3S90.LoadEjectorPort")},
	[3] = {time = 1.52, sound = Sound("FAS2_M3S90.BoltCatch")}}
	
SWEP.Sounds["last3_reload_start_empty"] = {[1] = {time = 0.3, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 1, sound = Sound("FAS2_M3S90.LoadEjectorPort")},
	[3] = {time = 1.52, sound = Sound("FAS2_M3S90.BoltCatch")}}
	
SWEP.Sounds["last2_reload_start_empty"] = {[1] = {time = 0.3, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 1, sound = Sound("FAS2_M3S90.LoadEjectorPort")},
	[3] = {time = 1.52, sound = Sound("FAS2_M3S90.BoltCatch")}}
	
SWEP.Sounds["last1_reload_start_empty"] = {[1] = {time = 0.3, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 1, sound = Sound("FAS2_M3S90.LoadEjectorPort")},
	[3] = {time = 1.52, sound = Sound("FAS2_M3S90.BoltCatch")}}
	
SWEP.Sounds["last5_restock"] = {[1] = {time = 0.7, sound = Sound("FAS2_M3S90.Restock")}}
SWEP.Sounds["last4_restock"] = {[1] = {time = 0.7, sound = Sound("FAS2_M3S90.Restock")}}
SWEP.Sounds["last3_restock"] = {[1] = {time = 0.7, sound = Sound("FAS2_M3S90.Restock")}}
SWEP.Sounds["last2_restock"] = {[1] = {time = 0.7, sound = Sound("FAS2_M3S90.Restock")}}
SWEP.Sounds["last1_restock"] = {[1] = {time = 0.7, sound = Sound("FAS2_M3S90.Restock")},
	[2] = {time = 1.45, sound = Sound("FAS2_M3S90.Restock")}}
	
SWEP.Sounds["last0_restock"] = {[1] = {time = 0.7, sound = Sound("FAS2_M3S90.Restock")},
	[2] = {time = 1.45, sound = Sound("FAS2_M3S90.Restock")}}
	
SWEP.Sounds["last5_restock_empty"] = {[1] = {time = 0.7, sound = Sound("FAS2_M3S90.Restock")}}
SWEP.Sounds["last4_restock_empty"] = {[1] = {time = 0.7, sound = Sound("FAS2_M3S90.Restock")}}
SWEP.Sounds["last3_restock_empty"] = {[1] = {time = 0.7, sound = Sound("FAS2_M3S90.Restock")}}
SWEP.Sounds["last2_restock_empty"] = {[1] = {time = 0.7, sound = Sound("FAS2_M3S90.Restock")}}
SWEP.Sounds["last1_restock_empty"] = {[1] = {time = 0.7, sound = Sound("FAS2_M3S90.Restock")},
	[2] = {time = 1.45, sound = Sound("FAS2_M3S90.Restock")}}
	
SWEP.Sounds["last0_restock_empty"] = {[1] = {time = 0.7, sound = Sound("FAS2_M3S90.Restock")},
	[2] = {time = 1.45, sound = Sound("FAS2_M3S90.Restock")}}
	
SWEP.Sounds["reload_insert"] = {[1] = {time = 0.1, sound = Sound("FAS2_M3S90.GetAmmo")},
	[2] = {time = 0.4, sound = Sound("FAS2_M3S90.Load")}}
SWEP.Sounds["reload_nomen"] = {[1] = {time = 0.3, sound = Sound("FAS2_DEAGLE.MagOut")},
	[2] = {time = 0.5, sound = Sound("MagPouch_Pistol")},
	[3] = {time = 0.95, sound = Sound("FAS2_DEAGLE.MagInPartial")},
	[4] = {time = 1.1, sound = Sound("FAS2_DEAGLE.MagInNomen")}}
	
SWEP.Sounds["reload_empty"] = {[1] = {time = 0.6, sound = Sound("FAS2_DEAGLE.MagOutEmpty")},
	[2] = {time = 0.9, sound = Sound("MagPouch_Pistol")},
	[3] = {time = 1.4, sound = Sound("FAS2_DEAGLE.MagInPartial")},
	[4] = {time = 1.55, sound = Sound("FAS2_DEAGLE.MagIn")},
	[5] = {time = 2.3, sound = Sound("FAS2_DEAGLE.SlideStop")}}
	
SWEP.Sounds["reload_nomen_empty"] = {[1] = {time = 0.3, sound = Sound("FAS2_DEAGLE.MagOut")},
	[2] = {time = 0.5, sound = Sound("MagPouch_Pistol")},
	[3] = {time = 0.95, sound = Sound("FAS2_DEAGLE.MagInPartial")},
	[4] = {time = 1.1, sound = Sound("FAS2_DEAGLE.MagInNomen")},
	[5] = {time = 1.6, sound = Sound("FAS2_DEAGLE.SlideStop")}}
	
SWEP.FireModes = {"semi"}

SWEP.Category = "FA:S 2 Weapons"
SWEP.Base = "fas2_base_shotgun"
SWEP.Author            = "Spy"
SWEP.Contact        = ""
SWEP.Purpose        = ""

SWEP.ViewModelFOV    = 58
SWEP.ViewModelFlip    = false

SWEP.Spawnable            = true
SWEP.AdminSpawnable        = true

SWEP.VM = "models/weapons/view/shotguns/m3s90.mdl"
SWEP.WM = "models/weapons/w_m3.mdl"
SWEP.WorldModel   = "models/weapons/w_shot_m3super90.mdl"

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = 8
SWEP.Primary.DefaultClip    = 0
SWEP.Primary.Automatic       = false    
SWEP.Primary.Ammo             = "12 Gauge"
 
-- Secondary Fire Attributes --
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic       = false
SWEP.Secondary.Ammo         = "none"

-- Deploy related
SWEP.FirstDeployTime = 2.3
SWEP.DeployTime = 0.45

-- Firing related
SWEP.Shots = 12
SWEP.FireDelay = 0.25
SWEP.Damage = 10
SWEP.FireSound = Sound("FAS2_M3S90")

-- Accuracy related
SWEP.HipCone = 0.05
SWEP.AimCone = 0.005
SWEP.ClumpSpread = 0.01
SWEP.SpreadPerShot = 0.02
SWEP.MaxSpreadInc = 0.055
SWEP.SpreadCooldown = 0.4
SWEP.VelocitySensitivity = 1.5
SWEP.AimFOV = 5

-- Recoil related
SWEP.ViewKick = 3.7
SWEP.Recoil = 3

-- Reload related
SWEP.InsertEmpty = 2
SWEP.InsertEmpty_Bandolier = 1.75
SWEP.InsertTime1 = 0.75
SWEP.InsertTime2 = 1.15
SWEP.InsertTime3 = 1.55
SWEP.InsertTime4 = 1.6
SWEP.InsertTime_Bandolier = 0.6
SWEP.ReloadStartTime = 0.6
SWEP.ReloadStartTime_Bandolier = 1.1
SWEP.InsertTimeStartEnd_Bandolier = 1.6
SWEP.ReloadEndTime = 0.5
SWEP.ReloadEndTime_Bandolier = 1
SWEP.ReloadAbortTime = 0.7
SWEP.Bandolier = 6
SWEP.BandolierRestock_1 = 1.25
SWEP.BandolierRestock_2 = 1.25
SWEP.BandolierRestock_3 = 1.25
SWEP.BandolierRestock_4 = 2
SWEP.BandolierRestock_5 = 2.5

local mag, CT, ammo, amt

function SWEP:PlayFireAnim(mag)
	if self.Bandolier == 6 then
		FAS2_PlayAnim(self, self.Anims.Fire)
	else
		if mag == 1 then
			FAS2_PlayAnim(self, "last" .. math.Clamp(self.Bandolier, 0, 6) .. "_fire_last")
		else
			FAS2_PlayAnim(self, "last" .. math.Clamp(self.Bandolier, 0, 6) .. "_fire1")
		end
	end
end

function SWEP:PlayDeployAnim()
	if self.Bandolier == 6 then
		if self:Clip1() == 0 and self.Anims.Draw_Empty then
			FAS2_PlayAnim(self, self.Anims.Draw_Empty, 1)
		else
			FAS2_PlayAnim(self, self.Anims.Draw, 1)
		end
	else
		if self:Clip1() == 0 then
			FAS2_PlayAnim(self, "last" .. self.Bandolier .. "_deploy_empty")
		else
			FAS2_PlayAnim(self, "last" .. self.Bandolier .. "_deploy")
		end
	end
end

function SWEP:Reload()
	CT = CurTime()
	
	if CT < self.ReloadWait then
		return
	end
	
	if self.ReloadDelay and CT < self.ReloadDelay then
		return
	end
	
	if self.ReloadState != 0 then
		return
	end
	
	if self.Owner:KeyDown(IN_USE) then
		self:CycleFiremodes()
		return
	end
	
	ammo = self.Owner:GetAmmoCount(self.Primary.Ammo)
	
	if self.Bandolier == 0 and ammo >= 6 then
		amt = math.Clamp(6, 0, ammo)
		
		if mag == 0 then
			FAS2_PlayAnim(self, "last" .. self.Bandolier .. "_restock_empty")
		else
			FAS2_PlayAnim(self, "last" .. self.Bandolier .. "_restock")
		end
		
		self.Owner:RemoveAmmo(amt, self.Primary.Ammo)
		self.Bandolier = amt
		self:SetNextPrimaryFire(CT + 2)
		self:SetNextSecondaryFire(CT + 2)
		self.SprintWait = CT + 2
		self.ReloadWait = CT + 2
		self.dt.Status = FAS_STAT_IDLE
		
		return
	end
	
	if self.CockAfterShot and not self.Cocked then
		if self.Owner.FAS_FamiliarWeapons[self.Class] then
			if self.dt.Status == FAS_STAT_ADS then
				FAS2_PlayAnim(self, self.Anims.Cock_Aim_Nomen)
				self.Cocked = true
			else
				FAS2_PlayAnim(self, self.Anims.Cock_Nomen)
				self.Cocked = true
			end
			
			self:SetNextPrimaryFire(CT + self.CockTime_Nomen)
			self:SetNextSecondaryFire(CT + self.CockTime_Nomen)
			self.SprintWait = CT + self.CockTime_Nomen
			self.ReloadWait = CT + self.CockTime_Nomen
		else
			if self.dt.Status == FAS_STAT_ADS then
				FAS2_PlayAnim(self, self.Anims.Cock_Aim)
				self.Cocked = true
			else
				FAS2_PlayAnim(self, self.Anims.Cock)
				self.Cocked = true
			end
			
			self:SetNextPrimaryFire(CT + self.CockTime)
			self:SetNextSecondaryFire(CT + self.CockTime)
			self.SprintWait = CT + self.CockTime
			self.ReloadWait = CT + self.CockTime
		end
	end
	
	mag = self:Clip1()
	
	if self.Bandolier < 6 and ammo >= 6 - self.Bandolier then
		amt = math.Clamp(6 - self.Bandolier, 0, ammo)
			
		if mag == 0 then
			FAS2_PlayAnim(self, "last" .. self.Bandolier .. "_restock_empty")
		else
			FAS2_PlayAnim(self, "last" .. self.Bandolier .. "_restock")
		end
		
		self:SetNextPrimaryFire(CT + self["BandolierRestock_".. amt])
		self:SetNextSecondaryFire(CT + self["BandolierRestock_".. amt])
		self.SprintWait = CT + self["BandolierRestock_".. amt]
		self.ReloadWait = CT + self["BandolierRestock_".. amt]
		self.Owner:RemoveAmmo(amt, self.Primary.Ammo)
		self.Bandolier = self.Bandolier + amt
		self.dt.Status = FAS_STAT_IDLE
	
		if SERVER and game.SinglePlayer() then
			SendUserMessage("FAS2_CHECKWEAPON", self.Owner)
		end
		
		if CLIENT then
			self.CheckTime = CT + 0.5
		end
		
		return
	end
	
	if mag >= self.Primary.ClipSize then
		if SERVER and game.SinglePlayer() then
			SendUserMessage("FAS2_CHECKWEAPON", self.Owner)
		end
		
		if CLIENT then
			self.CheckTime = CT + 0.5
		end
		
		return
	end
	
	if self.Bandolier > 0 or ammo > 0 then
		self.dt.Status = FAS_STAT_IDLE
		self:ReloadStartLogic()
	end
end

function SWEP:ReloadStartLogic()
	mag = self:Clip1()
	ammo = self.Owner:GetAmmoCount(self.Primary.Ammo)
	
	if mag < self.Primary.ClipSize then
		if ammo > 0 then
			CT = CurTime()
			self.dt.Status = FAS_STAT_IDLE
			
			if mag == 0 then
				FAS2_PlayAnim(self, self.Anims.Reload_Start_Empty, 1, 0)
				self:DelayMe(CT + self.InsertEmpty)
				self.ReloadStateWait = CT + self.InsertEmpty
			
				self:InsertAmmo()
				self.Owner:SetAnimation(PLAYER_RELOAD)
				
				if ammo > 1 then
					self.ReloadState = 2
				else
					if self.Bandolier == 0 then
						self.ReloadState = 3 -- damn you lack of anims!
					else
						self.ReloadState = 2
					end
				end
			else
				FAS2_PlayAnim(self, self.Anims.Reload_Start, 1, 0)
				self:DelayMe(CT + self.ReloadStartTime)
				self.ReloadStateWait = CT + self.ReloadStartTime
				self.ReloadState = 2
			end
		else
			if self.Bandolier > 0 then
				CT = CurTime()
				self.dt.Status = FAS_STAT_IDLE

				if self.Bandolier == 1 then
					FAS2_PlayAnim(self, "last1_reload_start_end", 1, 0)
					self:DelayMe(CT + self.InsertEmpty_Bandolier)
					self.ReloadStateWait = CT + self.InsertEmpty_Bandolier
				
					self:InsertAmmoFromBandolier()
					self.Owner:SetAnimation(PLAYER_RELOAD)
					self.ReloadState = 0
				else
					if mag == 0 then
						FAS2_PlayAnim(self, "last" .. self.Bandolier .. "_reload_start_empty", 1, 0)
						self:DelayMe(CT + self.InsertEmpty_Bandolier)
						self.ReloadStateWait = CT + self.InsertEmpty_Bandolier
					
						self:InsertAmmoFromBandolier()
						self.Owner:SetAnimation(PLAYER_RELOAD)
						self.ReloadState = 2
					else
						if mag == self.Primary.ClipSize - 1 then
							FAS2_PlayAnim(self, "last" .. self.Bandolier .. "_reload_start_end", 1, 0)
							self:DelayMe(CT + self.InsertTimeStartEnd_Bandolier)
								
							self:InsertAmmoFromBandolier()
							self.Owner:RestartGesture(PLAYER_RELOAD)
							self.ReloadState = 0
						else	
							FAS2_PlayAnim(self, "last" .. self.Bandolier .. "_reload_start", 1, 0)
							self:InsertAmmoFromBandolier()
							self:DelayMe(CT + self.ReloadStartTime_Bandolier)
							self.ReloadStateWait = CT + self.ReloadStartTime_Bandolier
							self.ReloadState = 2
						end
					end
				end
			end
		end
	end
end

function SWEP:InsertAmmoFromBandolier()
	self.Bandolier = self.Bandolier - 1
	self:SetClip1(self:Clip1() + 1)
end

local amt

function SWEP:ShotgunThink()
	if IsFirstTimePredicted() then
		CT = CurTime()

		if CT > self.ReloadStateWait then
			ammo = self.Owner:GetAmmoCount(self.Primary.Ammo)
			
			if ammo > 0 then
				if self.ReloadState == 2 then
					mag = self:Clip1()
					
					if mag < self.Primary.ClipSize and ammo > 0 then
						amt = math.Clamp(math.Clamp(self.Primary.ClipSize - mag, 0, 4), 0, ammo)
						
						FAS2_PlayAnim(self, "reload_load" .. amt, 1, 0)
						--self:DelayMe(CT + self.InsertTime)
						self.ReloadStateWait = CT + self["InsertTime" .. amt]
						
						self:InsertAmmo(amt)
						if IsValid( self.Owner ) and self.Owner.RestartGesture then
							self.Owner:RestartGesture(PLAYER_RELOAD)
						end
					else
						self.ReloadState = 3
					end
				elseif self.ReloadState == 3 then
					FAS2_PlayAnim(self, self.Anims.Reload_End, 1, 0)
					self:DelayMe(CT + self.ReloadEndTime)
					self.ReloadStateWait = CT + self.ReloadEndTime
					
					self.ReloadState = 0
				elseif self.ReloadState == 4 then
					FAS2_PlayAnim(self, self.Anims.Reload_Start, 1, 0)
					--self:DelayMe(CT + self.ReloadStartTime)
					self.ReloadStateWait = CT + self.ReloadStartTime
					
					self.ReloadState = 2
				end
			else
				if self.ReloadState == 2 then
					mag = self:Clip1()
					
					if self.Bandolier > 1 then
						if mag < self.Primary.ClipSize - 1 then
							FAS2_PlayAnim(self, "last" .. self.Bandolier .. "_reload_insert", 1, 0)
							self:DelayMe(CT + self.InsertTime_Bandolier)
							self.ReloadStateWait = CT + self.InsertTime_Bandolier
							self:InsertAmmoFromBandolier()
						else
							self.ReloadState = 3
						end
					else
						self.ReloadState = 3
					end
				elseif self.ReloadState == 3 then
					FAS2_PlayAnim(self, "last" .. self.Bandolier .. "_reload_end", 1, 0)
					self:DelayMe(CT + self.ReloadEndTime_Bandolier)
					self.ReloadStateWait = CT + self.ReloadEndTime_Bandolier
					self:InsertAmmoFromBandolier()
					print('wat de fok')
					self.ReloadState = 0
				elseif self.ReloadState == 4 then
					FAS2_PlayAnim(self, self.Anims.Reload_Start, 1, 0)
					--self:DelayMe(CT + self.ReloadStartTime)
					self.ReloadStateWait = CT + self.ReloadStartTime
					
					self.ReloadState = 2
				end
			end
		end
	end
end

--[[function SWEP:ShotgunThink()
	CT = CurTime()
	ammo = self.Owner:GetAmmoCount(self.Primary.Ammo)
	
	if IsFirstTimePredicted() then
		if ammo > 0 then
			if CT > self.ReloadStateWait then
				if self.ReloadState == 2 then
					
					mag = self:Clip1()
					ammo = self.Owner:GetAmmoCount(self.Primary.Ammo)
					
					if mag < self.Primary.ClipSize and ammo > 0 then
						if self.Owner.FAS_FamiliarWeapons[self.Class] then
							FAS2_PlayAnim(self, self.Anims.Reload_Insert_Nomen, 1, 0)
							--self:DelayMe(CT + self.InsertTime_Nomen)
							self.ReloadStateWait = CT + self.InsertTime_Nomen
						else
							FAS2_PlayAnim(self, self.Anims.Reload_Insert, 1, 0)
							--self:DelayMe(CT + self.InsertTime)
							self.ReloadStateWait = CT + self.InsertTime
						end
						
						self:InsertAmmo()
						self.Owner:RestartGesture(PLAYER_RELOAD)
						
						if SERVER then
							if not self.Owner.FAS_FamiliarWeapons[self.Class] then
								if not self.Owner.FAS_FamiliarWeaponsProgress[self.Class] then
									self.Owner.FAS_FamiliarWeaponsProgress[self.Class] = 0
								end
								
								self.Owner.FAS_FamiliarWeaponsProgress[self.Class] = self.Owner.FAS_FamiliarWeaponsProgress[self.Class] + GetConVarNumber("fas2_profgain_shotguns")
								
								if self.Owner.FAS_FamiliarWeaponsProgress[self.Class] >= 1 then
									self:FamiliariseWithWeapon()
								end
							end
						end
					else
						self.ReloadState = 3
					end
				elseif self.ReloadState == 3 then
					if self.Owner.FAS_FamiliarWeapons[self.Class] then
						FAS2_PlayAnim(self, self.Anims.Reload_End_Nomen, 1, 0)
						self:DelayMe(CT + self.ReloadEndTime_Nomen)
						self.ReloadStateWait = CT + self.ReloadEndTime_Nomen
					else
						FAS2_PlayAnim(self, self.Anims.Reload_End, 1, 0)
						self:DelayMe(CT + self.ReloadEndTime)
						self.ReloadStateWait = CT + self.ReloadEndTime
					end
					
					self.ReloadState = 0
				elseif self.ReloadState == 1 then
					if self.Owner.FAS_FamiliarWeapons[self.Class] then
						FAS2_PlayAnim(self, self.Anims.Reload_Start_Nomen, 1, 0)
						--self:DelayMe(CT + self.ReloadStartTime_Nomen)
						self.ReloadStateWait = CT + self.ReloadStartTime_Nomen
					else
						FAS2_PlayAnim(self, self.Anims.Reload_Start, 1, 0)
						--self:DelayMe(CT + self.ReloadStartTime)
						self.ReloadStateWait = CT + self.ReloadStartTime
					end
					
					self.ReloadState = 2
				end
			end
		else
			if CT > self.ReloadStateWait then
				if self.ReloadState == 1 then
					mag = self:Clip1()
					
					if mag == 5 or self.Bandolier == 1 then
						FAS2_PlayAnim(self, "last" .. self.Bandolier .. "_reload_end", 1, 0)
						self:InsertAmmoFromBandolier()
						self.ReloadState = 0
						self:DelayMe(CT + self.ReloadEndTime)
						self.ReloadStateWait = CT + self.ReloadEndTime
					elseif mag == 0 then
						FAS2_PlayAnim(self, "last" .. self.Bandolier .. "_reload_start_empty", 1, 0)
						self:InsertAmmoFromBandolier()
						self:DelayMe(CT + self.InsertEmpty)
						self.ReloadStateWait = CT + self.InsertEmpty
						self.ReloadState = 2
					else
						FAS2_PlayAnim(self, "last" .. self.Bandolier .. "_reload_start", 1, 0)
						self:InsertAmmoFromBandolier()
						self:DelayMe(CT + self.ReloadStartTime)
						self.ReloadStateWait = CT + self.ReloadStartTime
						self.ReloadState = 2
					end
				elseif self.ReloadState == 2 then
					mag = self:Clip1()
					
					if mag + 1 < self.Primary.ClipSize and self.Bandolier > 1 then
						FAS2_PlayAnim(self, "last" .. self.Bandolier .. "_reload_insert", 1, 0)
						self:DelayMe(CT + self.InsertTime)
						self.ReloadStateWait = CT + self.InsertTime
						self:InsertAmmoFromBandolier()
					else
						self.ReloadState = 3
					end
				elseif self.ReloadState == 3 then
					FAS2_PlayAnim(self, "last" .. self.Bandolier .. "_reload_end", 1, 0)
					self:DelayMe(CT + self.ReloadEndTime)
					self.ReloadStateWait = CT + self.ReloadEndTime
					self:InsertAmmoFromBandolier()
					self.ReloadState = 0
				elseif self.ReloadState == 4 then
					FAS2_PlayAnim(self, "last" .. self.Bandolier .. "_idle", 0, 0)
					self.ReloadState = 0
					self:DelayMe(CT + 0.3)
				end
			end
		end
	end
end]]--
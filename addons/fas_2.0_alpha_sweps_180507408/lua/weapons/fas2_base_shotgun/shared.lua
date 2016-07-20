
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	umsg.PoolString("FAS2_SUPPRESSMODEL")
	umsg.PoolString("FAS2_UNSUPPRESSMODEL")
end

SWEP.Base = "fas2_base"

if CLIENT then
    SWEP.PrintName = ""
    SWEP.Slot = 3
    SWEP.SlotPos = 3
    SWEP.DrawAmmo = false
    SWEP.DrawCrosshair = false
	
	surface.CreateFont("FAS2_HUD72", {font = "Default", size = 72, weight = 700, blursize = 0, antialias = true, shadow = false})
	surface.CreateFont("FAS2_HUD48", {font = "Default", size = 48, weight = 700, blursize = 0, antialias = true, shadow = false})
	surface.CreateFont("FAS2_HUD36", {font = "Default", size = 36, weight = 700, blursize = 0, antialias = true, shadow = false})
	surface.CreateFont("FAS2_HUD24", {font = "Default", size = 24, weight = 700, blursize = 0, antialias = true, shadow = false})
	
	SWEP.CurSoundTable = nil
	SWEP.CurSoundEntry = nil
	
	SWEP.CustomizePos = Vector(5.657, -1.688, -2.027)
	SWEP.CustomizeAng = Vector(14.647, 30.319, 15.295)
end

SWEP.SpreadWait = 0
SWEP.AddSpread = 0
SWEP.AddSpreadSpeed = 1
SWEP.IsFAS2Weapon = true

SWEP.SprintDelay = 0
SWEP.ReloadWait = 0
SWEP.MagCheckAlpha = 0
SWEP.ReloadProgress = 0
SWEP.Suppressed = false
SWEP.PenMod = 1
SWEP.ReloadState = 0
SWEP.ReloadStateWait = 0

FAS_STAT_IDLE = 0
FAS_STAT_ADS = 1
FAS_STAT_SPRINT = 2
FAS_STAT_HOLSTER = 3
FAS_STAT_CUSTOMIZE = 4

SWEP.Author            = "Spy"
SWEP.Instructions    = "CONTEXT MENU KEY - Open customization menu\nUSE + RELOAD KEY - Change firemode"
SWEP.Contact        = ""
SWEP.Purpose        = ""
SWEP.HoldType = "ar2"
SWEP.FirstDeploy = true

SWEP.ViewModelFOV    = 55
SWEP.ViewModelFlip    = false

SWEP.Spawnable            = false
SWEP.AdminSpawnable        = false

SWEP.ViewModel      = "models/Items/AR2_Grenade.mdl"
SWEP.WorldModel   = ""

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = -1
SWEP.Primary.DefaultClip    = -1
SWEP.Primary.Automatic       = false    
SWEP.Primary.Ammo             = "none"
 
-- Secondary Fire Attributes --
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic       = false
SWEP.Secondary.Ammo         = "none"

SWEP.FireModeNames = {["auto"] = {display = "FULL-AUTO", auto = true, burstamt = 0},
	["semi"] = {display = "SEMI-AUTO", auto = false, burstamt = 0},
	["double"] = {display = "DOUBLE-ACTION", auto = false, burstamt = 0},
	["2burst"] = {display = "2-ROUND BURST", auto = true, burstamt = 2},
	["3burst"] = {display = "3-ROUND BURST", auto = true, burstamt = 3}}	

local mag, CT, ammo
local gs = game.SinglePlayer()

function SWEP:CockLogic()
	if self.Owner.FAS_FamiliarWeapons[self.Class] then
		if self.dt.Status == FAS_STAT_ADS then
			FAS2_PlayAnim(self, self.Anims.Cock_Aim_Nomen)
			self.Cocked = true
		else
			FAS2_PlayAnim(self, self.Anims.Cock_Nomen)
			self.Cocked = true
		end
		
		if CLIENT then
			self:MakePumpShell()
		end
		
		if SERVER and gs then
			SendUserMessage("FAS2_MAKEPUMPSHELL", self.Owner)
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
		
		if CLIENT then
			self:MakePumpShell()
		end
		
		if SERVER and gs then
			SendUserMessage("FAS2_MAKEPUMPSHELL", self.Owner)
		end
		
		self:SetNextPrimaryFire(CT + self.CockTime)
		self:SetNextSecondaryFire(CT + self.CockTime)
		self.SprintWait = CT + self.CockTime
		self.ReloadWait = CT + self.CockTime
		
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
	end
end

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
	
	if self.ReloadState != 0 then
		return
	end
	
	if self.FireMode == "safe" then
		return
	end
	
	if self.CockAfterShot and not self.Cocked then
		self:CockLogic()
		
		return
	end
	
	mag = self:Clip1()
	ammo = self.Owner:GetAmmoCount(self.Primary.Ammo)
	
	if mag >= self.Primary.ClipSize or ammo == 0 then
		if SERVER and game.SinglePlayer() then
			SendUserMessage("FAS2_CHECKWEAPON", self.Owner)
		end
		
		if CLIENT then
			self.CheckTime = CT + 0.5
		end
		
		return
	end
	
	self.dt.Status = FAS_STAT_IDLE
	self.ReloadState = 1
	self.ReloadStateWait = CT + self.ReloadStartTime
	
	self:ReloadStartLogic()
end

local a

function SWEP:Deploy()
	if not IsValid(self.Owner) then
		return
	end
	
	if not self.FirstDeploy then
		CT = CurTime()
		
		if (CLIENT and not IsFirstTimePredicted()) then
			self:SetNextPrimaryFire(CT + (self.DeployTime and self.DeployTime or 1))
			self:SetNextSecondaryFire(CT + (self.DeployTime and self.DeployTime or 1))
			self.ReloadWait = CT + (self.DeployTime and self.DeployTime or 1)
			self.SprintDelay = CT + (self.DeployTime and self.DeployTime or 1)
		else
			self:SetNextPrimaryFire(CT + (self.DeployTime and self.DeployTime or 1))
			self:SetNextSecondaryFire(CT + (self.DeployTime and self.DeployTime or 1))
			self.ReloadWait = CT + (self.DeployTime and self.DeployTime or 1)
			self.SprintDelay = CT + (self.DeployTime and self.DeployTime or 1)
		end
		
		self:PlayDeployAnim()
	else
		if SP and SERVER then
			a = self.Anims.Draw_First
			
			if type(a) == "table" then
				a = table.Random(a)
			end
			
			FAS2_PlayAnim(self, a, 1, 0, self.Owner:Ping() / 1000)
		end
		
		CT = CurTime()
		
		self:SetNextPrimaryFire(CT + (self.FirstDeployTime and self.FirstDeployTime or 1))
		self:SetNextSecondaryFire(CT + (self.FirstDeployTime and self.FirstDeployTime or 1))
		self.ReloadWait = CT + (self.FirstDeployTime and self.FirstDeployTime or 1)
		self.SprintDelay = CT + (self.FirstDeployTime and self.FirstDeployTime or 1)
		self.FirstDeploy = false
	end
	
	if CLIENT then
		self.Peeking = false
	end
	
	if not self.Owner.FAS_FamiliarWeapons then
		self.Owner.FAS_FamiliarWeapons = {}
	end
		
	if SERVER then
		if not self.Owner.FAS_FamiliarWeaponsProgress then
			self.Owner.FAS_FamiliarWeaponsProgress = {}
		end
	end
	
	self.dt.Status = FAS_STAT_IDLE
	self:EmitSound("weapons/weapon_deploy" .. math.random(1, 3) .. ".wav", 50, 100)
	
	return true
end

function SWEP:InsertAmmo(amt)
	amt = amt or 1
	self:SetClip1(self:Clip1() + amt)
	self.Owner:RemoveAmmo(amt, self.Primary.Ammo)
end

function SWEP:ShotgunThink()
	if IsFirstTimePredicted() then
		CT = CurTime()
		
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
			elseif self.ReloadState == 4 then
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
	end
end
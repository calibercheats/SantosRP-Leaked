
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 4
end

if CLIENT then
    SWEP.PrintName = "MP5A5"
    SWEP.Slot = 2
    SWEP.SlotPos = 0
	
	SWEP.AimPos = Vector(-1.969, -3.449, 0.958)
	SWEP.AimAng = Vector(0, 0, 0)
		
	SWEP.CompM4Pos = Vector(-1.969, -2, 0.28)
	SWEP.CompM4Ang = Vector(0, 0, 0)
	
	//SWEP.SprintPos = Vector(0, 0, 1)
	//SWEP.SprintAng = Vector(-20, 0, 0)
	
	//SWEP.MoveType = 3
	SWEP.YawMod = 0.1
	
	SWEP.MuzzleEffect = "muzzleflash_smg"
	SWEP.Shell = "9x19"
	SWEP.AttachmentBGs = {["suppressor"] = {bg = 3, sbg = 1},
	["compm4"] = {bg = 2, sbg = 1},
	["foregrip"] = {bg = 4, sbg = 1}}
	
	SWEP.WMAng = Vector(0, 180, 180)
	SWEP.WMPos = Vector(1, -3, 0.25)
end

SWEP.Attachments = {[1] = {header = "Sight", sight = true, x = 400, y = -50, atts = {"compm4"}},
	[2] = {header = "Barrel", x = 25, y = -250, atts = {"suppressor"}},
	[3] = {header = "Forearm", x = 25, y = -125, atts = {"foregrip"}}}

SWEP.BulletLength = 9
SWEP.CaseLength = 19

SWEP.Anims = {}
SWEP.Anims.Draw_First = "deploy_first"
SWEP.Anims.Draw = "deploy"
SWEP.Anims.Draw_Empty = "deploy_empty"
SWEP.Anims.Holster = "holster"
SWEP.Anims.Holster_Empty = "holster_empty"
SWEP.Anims.Fire = "shoot"
SWEP.Anims.Fire_Last = "shoot_last"
SWEP.Anims.Fire_Aiming = "shoot_scoped"
SWEP.Anims.Fire_Aiming_Last = "shoot_last_scoped"
SWEP.Anims.Idle = "idle1"
SWEP.Anims.Idle_Grip = "idle1_grip"
SWEP.Anims.Idle_Aim = "idle_scoped"
SWEP.Anims.Reload = "reload"
SWEP.Anims.Reload_Nomen = "reload_nomen"
SWEP.Anims.Reload_Empty = "reload_empty"
SWEP.Anims.Reload_Empty_Nomen = "reload_empty_nomen"

SWEP.Sounds = {}

SWEP.Sounds["deploy_first"] = {[1] = {time = 0.85, sound = Sound("FAS2_MP5A5.SelectorSwitch")}}
	
SWEP.Sounds["reload"] = {[1] = {time = 0.6, sound = Sound("FAS2_MP5A5.MagOut")},
	[2] = {time = 1.2, sound = Sound("MagPouch_SMG")},
	[3] = {time = 2.15, sound = Sound("FAS2_MP5A5.MagIn")}}
	
SWEP.Sounds["reload_nomen"] = {[1] = {time = 0.45, sound = Sound("FAS2_MP5A5.MagOut")},
	[2] = {time = 1, sound = Sound("MagPouch_SMG")},
	[3] = {time = 1.55, sound = Sound("FAS2_MP5A5.MagIn")}}
	
SWEP.Sounds["reload_empty"] = {[1] = {time = 0.3, sound = Sound("FAS2_MP5A5.BoltPull")},
	[2] = {time = 0.7, sound = Sound("MagPouch_SMG")},
	[3] = {time = 1, sound = Sound("FAS2_MP5A5.MagOutEmpty")},
	[4] = {time = 2.15, sound = Sound("FAS2_MP5A5.MagIn")},
	[5] = {time = 2.8, sound = Sound("FAS2_MP5A5.BoltCatch")}}
	
SWEP.Sounds["reload_empty_nomen"] = {[1] = {time = 0.5, sound = Sound("MagPouch_SMG")},
	[2] = {time = 0.7, sound = Sound("FAS2_MP5A5.MagOut")},
	[3] = {time = 1.1, sound = Sound("FAS2_MP5A5.MagIn")},
	[4] = {time = 1.7, sound = Sound("FAS2_MP5A5.BoltBack")},
	[5] = {time = 2, sound = Sound("FAS2_MP5A5.BoltForward")}}
	
SWEP.Sounds["reload_grip"] = {[1] = {time = 0.6, sound = Sound("FAS2_MP5A5.MagOut")},
	[2] = {time = 1.2, sound = Sound("MagPouch_SMG")},
	[3] = {time = 2.15, sound = Sound("FAS2_MP5A5.MagIn")}}
	
SWEP.Sounds["reload_nomen_grip"] = {[1] = {time = 0.45, sound = Sound("FAS2_MP5A5.MagOut")},
	[2] = {time = 1, sound = Sound("MagPouch_SMG")},
	[3] = {time = 1.55, sound = Sound("FAS2_MP5A5.MagIn")}}
	
SWEP.Sounds["reload_empty_grip"] = {[1] = {time = 0.3, sound = Sound("FAS2_MP5A5.BoltPull")},
	[2] = {time = 0.7, sound = Sound("MagPouch_SMG")},
	[3] = {time = 1, sound = Sound("FAS2_MP5A5.MagOutEmpty")},
	[4] = {time = 2.15, sound = Sound("FAS2_MP5A5.MagIn")},
	[5] = {time = 2.8, sound = Sound("FAS2_MP5A5.BoltCatch")}}
	
SWEP.Sounds["reload_empty_nomen_grip"] = {[1] = {time = 0.5, sound = Sound("MagPouch_SMG")},
	[2] = {time = 0.7, sound = Sound("FAS2_MP5A5.MagOut")},
	[3] = {time = 1.1, sound = Sound("FAS2_MP5A5.MagIn")},
	[4] = {time = 1.7, sound = Sound("FAS2_MP5A5.BoltBack")},
	[5] = {time = 2, sound = Sound("FAS2_MP5A5.BoltForward")}}
	
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

SWEP.VM = "models/weapons/view/smgs/mp5a5.mdl"
SWEP.WM = "models/weapons/w_mp5.mdl"
SWEP.WorldModel   = "models/weapons/w_smg_mp5.mdl"

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = 30
SWEP.Primary.DefaultClip    = 0
SWEP.Primary.Automatic       = true    
SWEP.Primary.Ammo             = "9x19MM"
 
-- Secondary Fire Attributes --
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic       = false
SWEP.Secondary.Ammo         = "none"

-- Deploy related
SWEP.FirstDeployTime = 1.75
SWEP.DeployTime = 0.5
SWEP.HolsterTime = 0.35
SWEP.DeployAnimSpeed = 0.75

-- Firing related
SWEP.Shots = 1
SWEP.FireDelay = 0.075
SWEP.Damage = 18
SWEP.FireSound = Sound("FAS2_MP5A5")
SWEP.FireSound_Suppressed = Sound("FAS2_MP5A5_S")

-- Accuracy related
SWEP.HipCone = 0.036
SWEP.AimCone = 0.0105
SWEP.SpreadPerShot = 0.007
SWEP.MaxSpreadInc = 0.03
SWEP.SpreadCooldown = 0.2
SWEP.VelocitySensitivity = 1.6
SWEP.AimFOV = 5

-- Recoil related
SWEP.ViewKick = 0.7
SWEP.Recoil = 0.7

-- Reload related
SWEP.ReloadTime = 2.7
SWEP.ReloadTime_Nomen = 1.9
SWEP.ReloadTime_Empty = 3.2
SWEP.ReloadTime_Empty_Nomen = 2.3

local anim, CT, ammo, mag
 
function SWEP:PlayFireAnim(mag)
	anim = self.Grip and "_grip" or ""
	
	if self.dt.Status == FAS_STAT_ADS then
		if mag == 1 and self.Anims.Fire_Aiming_Last then
			FAS2_PlayAnim(self, self.Anims.Fire_Aiming_Last .. anim)
		else
			FAS2_PlayAnim(self, self.Anims.Fire_Aiming .. anim)
		end
	else
		if mag == 1 and self.Anims.Fire_Last then
			FAS2_PlayAnim(self, self.Anims.Fire_Last .. anim)
		else
			FAS2_PlayAnim(self, self.Anims.Fire .. anim)
		end
	end
end

function SWEP:PlayHolsterAnim()
	anim = self.Grip and "_grip" or ""
	
	if self:Clip1() == 0 and self.Anims.Holster_Empty then
		FAS2_PlayAnim(self, self.Anims.Holster_Empty .. anim)
	else
		FAS2_PlayAnim(self, self.Anims.Holster .. anim)
	end
end

function SWEP:PlayDeployAnim()
	anim = self.Grip and "_grip" or ""
	
	if self:Clip1() == 0 and self.Anims.Draw_Empty then
		FAS2_PlayAnim(self, self.Anims.Draw_Empty .. anim, self.DeployAnimSpeed)
	else
		FAS2_PlayAnim(self, self.Anims.Draw .. anim, self.DeployAnimSpeed)
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

	if self.Owner:KeyDown(IN_USE) then
		self:CycleFiremodes()
		return
	end
	
	mag = self:Clip1()
	
	if mag >= self.Primary.ClipSize + 1 or self.Owner:GetAmmoCount(self.Primary.Ammo) == 0 then
		if SERVER and game.SinglePlayer() then
			SendUserMessage("FAS2_CHECKWEAPON", self.Owner)
		end
		
		if CLIENT then
			self.CheckTime = CT + 0.5
		end
		
		return
	end
	
	if SERVER then
		self.dt.Status = FAS_STAT_IDLE
	end
	
	anim = self.Grip and "_grip" or ""
	
	if mag == 0 then
		if self.Owner.FAS_FamiliarWeapons[self.Class] then
			FAS2_PlayAnim(self, self.Anims.Reload_Empty_Nomen .. anim)
			self.ReloadDelay = CT + self.ReloadTime_Empty_Nomen + 0.3
			self:SetNextPrimaryFire(CT + self.ReloadTime_Empty_Nomen + 0.3)
			self:SetNextSecondaryFire(CT + self.ReloadTime_Empty_Nomen + 0.3)
		else
			FAS2_PlayAnim(self, self.Anims.Reload_Empty .. anim)
			self.ReloadDelay = CT + self.ReloadTime_Empty + 0.3
			self:SetNextPrimaryFire(CT + self.ReloadTime_Empty + 0.3)
			self:SetNextSecondaryFire(CT + self.ReloadTime_Empty + 0.3)
		end
	else
		if self.Owner.FAS_FamiliarWeapons[self.Class] then
			FAS2_PlayAnim(self, self.Anims.Reload_Nomen .. anim)
			self.ReloadDelay = CT + self.ReloadTime_Nomen + 0.3
			self:SetNextPrimaryFire(CT + self.ReloadTime_Nomen + 0.3)
			self:SetNextSecondaryFire(CT + self.ReloadTime_Nomen + 0.3)
		else
			FAS2_PlayAnim(self, self.Anims.Reload .. anim)
			self.ReloadDelay = CT + self.ReloadTime + 0.3
			self:SetNextPrimaryFire(CT + self.ReloadTime + 0.3)
			self:SetNextSecondaryFire(CT + self.ReloadTime + 0.3)
		end
	end
end
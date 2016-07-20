
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 10
end

if CLIENT then
    SWEP.PrintName = "M79"
    SWEP.Slot = 4
    SWEP.SlotPos = 0
	
	SWEP.AimPos = Vector(-3.412, -6.4, -2.238)
	SWEP.AimAng = Vector(7.353, 0, 0)
		
	SWEP.WMAng = Vector(-15, 180, 180)
	SWEP.WMPos = Vector(1, -3, -2)
	SWEP.MuzzleName = "1"
	SWEP.YawMod = 0.1
	SWEP.MagText = "CYLINDER "
	SWEP.MuzzleEffect = "muzzleflash_m79"
end

SWEP.NoProficiency = true
SWEP.BulletLength = 7.62
SWEP.CaseLength = 39
SWEP.EmptySound = Sound("weapons/empty_assaultrifles.wav")
SWEP.NoAttachmentMenu = true
SWEP.NoDistance = true

SWEP.Anims = {}
SWEP.Anims.Draw_First = "deploy"
SWEP.Anims.Draw = "deploy"
SWEP.Anims.Holster = "holster"
SWEP.Anims.Fire = "shoot"
SWEP.Anims.Fire_Aiming = {"shoot_iron", "shoot_iron2"}
SWEP.Anims.Idle = "idle"
SWEP.Anims.Idle_Aim = "idle_scoped"
SWEP.Anims.Reload = "reload"
SWEP.Anims.Reload_Nomen = "reload"
SWEP.Anims.Reload_Empty = "reload"
SWEP.Anims.Reload_Empty_Nomen = "reload_empty_nomen"

SWEP.Sounds = {}
SWEP.Sounds["reload"] = {[1] = {time = 0.8, sound = Sound("FAS2_M79.Open")},
	[2] = {time = 1.5, sound = Sound("FAS2_M79.Remove")},
	[3] = {time = 2.7, sound = Sound("FAS2_M79.Insert")},
	[4] = {time = 3.5, sound = Sound("FAS2_M79.Close")}}
	
SWEP.FireModes = {"break"}

SWEP.Category = "FA:S 2 Weapons"
SWEP.Base = "fas2_base"
SWEP.Author            = "Spy"

SWEP.Contact        = ""
SWEP.Purpose        = ""

SWEP.ViewModelFOV    = 60
SWEP.ViewModelFlip    = false

SWEP.Spawnable            = true
SWEP.AdminSpawnable        = true

SWEP.VM = "models/weapons/view/explosives/m79.mdl"
SWEP.WM = "models/weapons/w_m79.mdl"
SWEP.WorldModel   = "models/weapons/w_rif_ak47.mdl"

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = 1
SWEP.Primary.DefaultClip    = 2
SWEP.Primary.Automatic       = false    
SWEP.Primary.Ammo             = "40MM HE"
 
-- Secondary Fire Attributes --
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic       = false
SWEP.Secondary.Ammo         = "none"

-- Deploy related
SWEP.FirstDeployTime = 1.25
SWEP.DeployTime = 1.25
SWEP.HolsterTime = 1.25
SWEP.DeployAnimSpeed = 1

-- Firing related
SWEP.Shots = 1
SWEP.FireDelay = 0.1
SWEP.Damage = 34
SWEP.FireSound = Sound("FAS2_M79")
SWEP.FireSound_Suppressed = Sound("FAS2_AK47_S")

-- Accuracy related
SWEP.HipCone = 0.048
SWEP.AimCone = 0.007
SWEP.SpreadPerShot = 0.008
SWEP.MaxSpreadInc = 0.03
SWEP.SpreadCooldown = 0.18
SWEP.VelocitySensitivity = 1.8
SWEP.AimFOV = 5

-- Recoil related
SWEP.ViewKick = 4.5
SWEP.Recoil = 3

-- Reload related
SWEP.ReloadTime = 4
SWEP.ReloadTime_Empty = 4
SWEP.CantChamber = true

local nade, EA, pos, mag, CT, tr
local td = {}

local SP = game.SinglePlayer()

function SWEP:PrimaryAttack()	
	if not IsFirstTimePredicted() then
		return
	end
	
	if self.dt.Status == FAS_STAT_CUSTOMIZE then
		return
	end
	
	if self.Cooking or self.FuseTime then
		return
	end
	
	if self.Owner:KeyDown(IN_USE) then
		if self:CanThrowGrenade() then
			self:InitialiseGrenadeThrow()
			return
		end
	end
	
	if self.dt.Status == FAS_STAT_SPRINT or self.dt.Status == FAS_STAT_QUICKGRENADE then
		return
	end
	
	td.start = self.Owner:GetShootPos()
	td.endpos = td.start + self.Owner:GetAimVector() * 30
	td.filter = self.Owner
		
	tr = util.TraceLine(td)
	
	if tr.Hit then
		return
	end
	
	mag = self:Clip1()
	CT = CurTime()
	
	if mag <= 0 or self.Owner:WaterLevel() >= 3 then
		self:EmitSound(self.EmptySound, 60, 100)
		self:SetNextPrimaryFire(CT + 0.2)
		return
	end
	
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	self:TakePrimaryAmmo(1)
	self:EmitSound(self.FireSound, 105, 100)
	self.ReloadWait = CurTime() + 0.5
	
	if SERVER then
		nade = ents.Create("fas2_40mm_frag")
		EA =  self.Owner:EyeAngles()
		pos = self.Owner:GetShootPos()
		pos = pos + EA:Right() * 5 - EA:Up() * 4 + EA:Forward() * 8
					
		nade:SetPos(pos)
		nade:SetAngles(EA)
		nade:Spawn()
		nade:SetOwner(self.Owner)
		nade.BlastRadius = 1024
		nade.BlastDamage = 175
		nade:GetPhysicsObject():SetVelocity((EA + Angle(self.CurCone * math.Rand(-25, 25), self.CurCone * math.Rand(-25, 25), 0)):Forward() * 3000)
		
		if SP then
			SendUserMessage("FAS2MUZZLE", self.Owner)
		end
	end
	
	if CLIENT then
		self:CreateMuzzle()
	end
	
	self:PlayFireAnim()
	
	if self.dt.Status == FAS_STAT_ADS then
		self:AimRecoil()
	else
		self:HipRecoil()
	end
end
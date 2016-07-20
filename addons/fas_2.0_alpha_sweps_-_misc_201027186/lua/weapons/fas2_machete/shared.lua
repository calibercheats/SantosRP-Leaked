
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 10
end

if CLIENT then
    SWEP.PrintName = "Machete"
    SWEP.Slot = 0
    SWEP.SlotPos = 0
	
	SWEP.AimPos = Vector(-3.412, -6.4, -2.238)
	SWEP.AimAng = Vector(7.353, 0, 0)
		
	SWEP.WMAng = Vector(0, 180, 180)
	SWEP.WMPos = Vector(1.4, -2.5, 0.5)
	SWEP.WMScale = 2
	
	SWEP.SprintPos = Vector(0, 0, 0)
	SWEP.SprintAng = Vector(0, 0, 0)
	SWEP.MoveType = 3
	SWEP.MuzzleName = "2"
	SWEP.NoNearWall = true
end

SWEP.HoldType = "knife"
SWEP.NoProficiency = true
SWEP.BulletLength = 7.62
SWEP.CaseLength = 39
SWEP.EmptySound = Sound("weapons/empty_assaultrifles.wav")
SWEP.NoAttachmentMenu = true

SWEP.Anims = {}
SWEP.Anims.Draw_First = "draw"
SWEP.Anims.Draw = "draw"
SWEP.Anims.Holster = "holster"
SWEP.Anims.Slash = {"slash1", "slash2"}
SWEP.Anims.Stab = {"overhead"}
SWEP.Anims.Idle = "idle"
SWEP.Anims.Idle_Aim = "idle_scoped"
SWEP.Anims.PrepBackstab = "backstab_draw"
SWEP.Anims.UnPrepBackstab = "backstab_holster"
SWEP.Anims.Backstab = "backstab_stab"

SWEP.Sounds = {}
SWEP.FireModes = {"semi"}

SWEP.Category = "FA:S 2 Weapons"
SWEP.Base = "fas2_base"
SWEP.Author            = "Spy"

SWEP.Contact        = ""
SWEP.Purpose        = ""
SWEP.Instructions    = "PRIMARY ATTACK KEY - Slash\nSECONDARY ATTACK KEY - Overhead slash"

SWEP.ViewModelFOV    = 55
SWEP.ViewModelFlip    = false

SWEP.Spawnable            = true
SWEP.AdminSpawnable        = true

SWEP.VM = "models/weapons/view/misc/machete.mdl"
SWEP.WM = "models/weapons/w_machete.mdl"
SWEP.WorldModel   = "models/weapons/w_machete.mdl"

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = -1
SWEP.Primary.DefaultClip    = -1
SWEP.Primary.Automatic       = false    
SWEP.Primary.Ammo             = ""
 
-- Secondary Fire Attributes --
SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic       = false
SWEP.Secondary.Ammo         = "none"

-- Deploy related
SWEP.FirstDeployTime = 1
SWEP.DeployTime = 1
SWEP.HolsterTime = 0.7
SWEP.DeployAnimSpeed = 1

SWEP.BackstabWait = 0
SWEP.DamageWait = 0 
local nade, EA, pos, mag, CT, tr, force, phys, pos, vel, ent, dmg, tr2
local td = {}

local SP = game.SinglePlayer()

function SWEP:Initialize()
	self:SetWeaponHoldType(self.HoldType)
	self.Class = self:GetClass()
	
	if CLIENT then
		self.BlendPos = Vector(0, 0, 0)
		self.BlendAng = Vector(0, 0, 0)
		
		self.NadeBlendPos = Vector(0, 0, 0)
		self.NadeBlendAng = Vector(0, 0, 0)
		self.ViewModelFOV_Orig = self.ViewModelFOV
		
		if not self.Wep then
			self.Wep = ClientsideModel(self.VM, RENDERGROUP_BOTH)
			self.Wep:SetNoDraw(true)
			
			RunConsoleCommand("fas2_handrig_applynow")
		end
		
		if not self.W_Wep and self.WM then
			self.W_Wep = ClientsideModel(self.WM, RENDERGROUP_BOTH)
			self.W_Wep:SetNoDraw(true)
		end
		
		if not self.Nade then
			self.Nade = ClientsideModel("models/weapons/v_m67.mdl", RENDERGROUP_BOTH)
			self.Nade:SetNoDraw(true)
			self.Nade.LifeTime = 0
		end

		self:Deploy()
	end
end

function SWEP:Reload()
	return
end

local BackStabExclusions = {["npc_antlionguard"] = true,
	["npc_antlion"] = true,
	["npc_antlionguardian"] = true,
	["npc_antlion_worker"] = true,
	["npc_barnacle"] = true,
	["npc_fastzombie_torso"] = true,
	["npc_headcrab"] = true,
	["npc_headcrab_black"] = true,
	["npc_headcrab_fast"] = true,
	["npc_zombie_torso"] = true,
	["npc_cscanner"] = true,
	["npc_clawscanner"] = true,
	["npc_combinegunship"] = true,
	["npc_combine_camera"] = true,
	["npc_manhack"] = true,
	["npc_hunter"] = true,
	["npc_helicopter"] = true,
	["npc_combinedropship"] = true,
	["npc_rollermine"] = true,
	["npc_strider"] = true,
	["npc_turret_floor"] = true,
	["npc_crow"] = true,
	["npc_pigeon"] = true,
	["npc_seagull"] = true}
	
local Mins, Maxs = Vector(-4, -4, -4), Vector(4, 4, 4)

local isply, isnpc, ang

function SWEP:CanBackstab()
	force = self.Owner:EyeAngles():Forward()
	
	td.start = self.Owner:GetShootPos()
	td.endpos = td.start + force * 45
	td.filter = self.Owner
	td.mins = Mins
	td.maxs = Maxs
		
	tr = util.TraceHull(td)
	
	ent = tr.Entity
		
	if IsValid(ent) then
		isply, isnpc = ent:IsPlayer(), ent:IsNPC()
		
		if isply or isnpc then
			if not BackStabExclusions[ent:GetClass()] then
				force = self.Owner:EyeAngles()
				force.p = 0
				force = force:Forward()

				if isnpc then
					if ent:GetAngles():Forward():DotProduct(force) >= 0.7 then
						return true
					end
				elseif isply then
					ang = ent:EyeAngles()
					ang.p = 0
					ang = ang:Forward()
					
					if ang:DotProduct(force) >= 0.7 then
						return true
					end
				end
			end
		end
	end
	
	return false
end

--[[
blood_impact_antlion_01
blood_impact_antlion_worker
blood_impact_green_01
blood_impact_red_01
blood_impact_synth_01
blood_impact_yellow_01
blood_impact_zombie_01
]]--

local ClassToParticle = {["npc_antlionguard"] = "blood_impact_antlion_01",
	["npc_antlionguardian"] = "blood_impact_green_01",
	["npc_antlion"] = "blood_impact_antlion_01",
	["npc_antlion_worker"] = "blood_impact_antlion_worker",
	["npc_zombie"] = "blood_impact_zombie_01",
	["npc_zombine"] = "blood_impact_zombie_01",
	["npc_poisonzombie"] = "blood_impact_zombie_01",
	["npc_fastzombie_torso"] = "blood_impact_zombie_01",
	["npc_zombie_torso"] = "blood_impact_zombie_01",
	["npc_fastzombie"] = "blood_impact_zombie_01",
	["npc_headcrab"] = "blood_impact_green_01",
	["npc_headcrab_black"] = "blood_impact_green_01",
	["npc_headcrab_fast"] = "blood_impact_green_01",
	["npc_vortigaunt"] = "blood_impact_zombie_01"}
	
for k, v in pairs(ClassToParticle) do
	PrecacheParticleSystem(v)
end
	
local cl, hit, ef

function SWEP:Think()
	CT = CurTime()
	
	vel = self.Owner:GetVelocity():Length()
	
	if self.dt.Status != FAS_STAT_HOLSTER_START and self.dt.Status != FAS_STAT_HOLSTER_END and self.dt.Status != FAS_STAT_QUICKGRENADE then
		if self.Owner:OnGround() then
			if self.Owner:KeyDown(IN_SPEED) and vel >= self.Owner:GetWalkSpeed() * 1.3 then
				if self.dt.Status != FAS_STAT_SPRINT then
					self.dt.Status = FAS_STAT_SPRINT
				end
			else
				if self.dt.Status == FAS_STAT_SPRINT then
					self.dt.Status = FAS_STAT_IDLE
				end
			end
		else
			if self.dt.Status != FAS_STAT_IDLE then
				self.dt.Status = FAS_STAT_IDLE
			end
		end
	end
	
	if self.CurSoundTable then
		t = self.CurSoundTable[self.CurSoundEntry]
		
		if CT >= self.SoundTime + t.time / self.SoundSpeed then
			self:EmitSound(t.sound, 70, 100)
			
			if self.CurSoundTable[self.CurSoundEntry + 1] then
				self.CurSoundEntry = self.CurSoundEntry + 1
			else
				self.CurSoundTable = nil
				self.CurSoundEntry = nil
				self.SoundTime = nil
			end
		end
	end
	
	if CT > self.DamageWait then
		if self.DamageTime and CT < self.DamageTime then
			force = self.Owner:EyeAngles():Forward()
			
			td.start = self.Owner:GetShootPos()
			td.endpos = td.start + force * 53
			td.filter = self.Owner
			td.mins = Mins
			td.maxs = Maxs
			
			tr = util.TraceHull(td)

			if tr.Hit then
				hit = false
				
				ent = tr.Entity
				
				if IsValid(ent) then
					if ent:Health() > 0 then
						if ent:IsNPC() or ent:IsPlayer() then
							if SERVER then
								dmg = DamageInfo()
								dmg:SetDamageType(DMG_SLASH)
								
								if self.PrepBackstab then
									dmg:SetDamage(200)
									self.BackstabWait = CT + 0.4
								else
									dmg:SetDamage(self.DamageAmount)
								end
								
								dmg:SetAttacker(self.Owner)
								dmg:SetInflictor(self)
								dmg:SetDamageForce(force * 20000)
								ent:TakeDamageInfo(dmg)
							end
							
							if self.PrepBackstab then
								self:EmitSound("weapons/melee/knife_hit" .. math.random(1, 3) .. ".wav", 70, 100)
							else
								self:EmitSound("weapons/melee/knife_hit" .. math.random(1, 3) .. ".wav", 70, 100)
							end
							
							hit = true
							
							if tr.MatType == MAT_FLESH or tr.MatType == MAT_ANTLION or tr.MatType == MAT_ALIENFLESH or tr.MatType == MAT_BLOODYFLESH then
								cl = ClassToParticle[ent:GetClass()]
								ParticleEffect((cl and cl or "blood_impact_red_01"), tr.HitPos, tr.HitNormal:Angle(), ent)
							end
						else
							hit = true
								
							tr2 = self.Owner:GetEyeTrace() -- separate trace for the decal, because decals don't like util.TraceHull :(
								
							util.Decal("ManhackCut", tr2.HitPos + tr2.HitNormal, tr2.HitPos - tr2.HitNormal)
							
							if SERVER then
								dmg = DamageInfo()
								dmg:SetDamageType(DMG_SLASH)
								dmg:SetDamage(self.DamageAmount * 0.5)
									
								dmg:SetAttacker(self.Owner)
								dmg:SetInflictor(self)
								dmg:SetDamageForce(force * 500)
								ent:TakeDamageInfo(dmg)
							end
							
							self:EmitSound("weapons/knife/knife_hitwall1.wav", 70, 100)
						end
					end
				end
				
				if not hit then
					self:EmitSound("weapons/melee/melee_hitworld1.wav", 70, 100)
					tr2 = self.Owner:GetEyeTrace() -- separate trace for the decal, because decals don't like util.TraceHull :(
					
					util.Decal("ManhackCut", tr2.HitPos + tr2.HitNormal, tr2.HitPos - tr2.HitNormal)
				end
				
				self.DamageTime = nil
			end
		end
	end
	
	if SP and SERVER or not SP then
		if IsFirstTimePredicted() then
			if CT > self.BackstabWait then
				if self:CanBackstab() then
					if not self.PrepBackstab then
						FAS2_PlayAnim(self, self.Anims.PrepBackstab, 1)
						self.PrepBackstab = true
						self:SetNextPrimaryFire(CT + 0.3)
						self:SetNextSecondaryFire(CT + 0.3)
					end
				else
					if self.PrepBackstab then
						FAS2_PlayAnim(self, self.Anims.UnPrepBackstab, 1)
						self.PrepBackstab = false
						self:SetNextPrimaryFire(CT + 0.3)
						self:SetNextSecondaryFire(CT + 0.3)
					end
				end
			end
		end
	end
	
	for k, v in pairs(self.Events) do
		if CT > v.time then
			v.func()
			table.remove(self.Events, k)
		end
	end
	
	if self.TimeToAdvance and CT > self.TimeToAdvance then
		if self.AdvanceStage == "draw" then
			self:DrawGrenade()
		elseif self.AdvanceStage == "prepare" then
			self:AdvanceGrenadeThrow()
		end
	end
	
	if self.Cooking then
		if self.FuseTime then
			if not self.Owner:KeyDown(IN_ATTACK) then
				if CT > self.TimeToThrow then
					self:ThrowGrenade()
				end
			else
				if CT > self.TimeToThrow then
					self.ThrowPower = math.Approach(self.ThrowPower, 1, FrameTime())
				end
			
				if SERVER then
					if CT >= self.FuseTime then
						self.Cooking = false
						self.FuseTime = nil
						util.BlastDamage(self.Owner, self.Owner, self:GetPos(), 384, 100)
						self.Owner:Kill()
						
						ef = EffectData()
						ef:SetOrigin(self.Owner:GetPos())
						ef:SetMagnitude(1)
						
						util.Effect("Explosion", ef)
					end
				end
			end
		end
	end
end

function SWEP:PrimaryAttack()	
	if not IsFirstTimePredicted() then
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
	
	CT = CurTime()
	
	if self.PrepBackstab then
		FAS2_PlayAnim(self, self.Anims.Backstab, 1)
		self:SetNextPrimaryFire(CT + 1)
		self:SetNextSecondaryFire(CT + 1)
		self.DamageWait = CT + 0.125
		self.DamageTime = CT + 0.225
		self.BackstabWait = CT + 0.5
		self.Owner:ViewPunch(Angle(math.Rand(-2, 0), math.Rand(-1, 0), math.Rand(-3, 3)))
	else
		FAS2_PlayAnim(self, self.Anims.Slash, 1)
		self:SetNextPrimaryFire(CT + 0.8)
		self:SetNextSecondaryFire(CT + 0.8)
		self.DrawTime = CT + 0.5
		self.DamageWait = CT + 0.1
		self.DamageTime = CT + 0.2
		self.Owner:ViewPunch(Angle(math.Rand(-2, 0), 5, math.Rand(-2, 2)))
	end
	
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	self.AttackType = "slash"
	
	self.DamageAmount = math.random(30, 35)
	self:EmitSound("weapons/melee/melee_slash" .. math.random(1, 3) .. ".wav", 60, math.random(95, 105))
end

function SWEP:SecondaryAttack()	
	if not IsFirstTimePredicted() then
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
	
	CT = CurTime()
	
	if self.PrepBackstab then
		FAS2_PlayAnim(self, self.Anims.Backstab, 1)
		self:SetNextPrimaryFire(CT + 0.7)
		self:SetNextSecondaryFire(CT + 0.7)
		self.DamageWait = CT + 0.125
		self.DamageTime = CT + 0.225
		self.BackstabWait = CT + 0.5
		self.Owner:ViewPunch(Angle(math.Rand(-2, 0), math.Rand(-1, 0), math.Rand(-3, 3)))
	else
		FAS2_PlayAnim(self, self.Anims.Stab, 1)
		self:SetNextPrimaryFire(CT + 1)
		self:SetNextSecondaryFire(CT + 1)
		self.DrawTime = CT + 0.7
		self.DamageWait = CT + 0.05
		self.DamageTime = CT + 0.15
		self.Owner:ViewPunch(Angle(math.Rand(0, 4), math.Rand(-1, 0), math.Rand(-3, 3)))
	end
	
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	self.AttackType = "stab"
	self.DamageWait = CT + 0.1
	self.DamageTime = CT + 0.2
	
	self.DamageAmount = math.random(40, 45)
	self:EmitSound("weapons/melee/melee_slash" .. math.random(1, 3) .. ".wav", 60, math.random(95, 105))
end

if CLIENT then
	local x, y, x2, y2
	local ClumpSpread = surface.GetTextureID("VGUI/clumpspread_ring")

	function SWEP:DrawHUD()
		if GetConVarNumber("fas2_nohud") > 0 then
			return
		end
		
		FT, CT, x, y = FrameTime(), CurTime(), ScrW(), ScrH()
		
		if self.Vehicle or self.dt.Status == FAS_STAT_QUICKGRENADE then
			self.CrossAlpha = Lerp(FT * 10, self.CrossAlpha, 0)
		else
			self.CrossAlpha = Lerp(FT * 10, self.CrossAlpha, 255)
		end
		
		if self.dt.Status == FAS_STAT_QUICKGRENADE then
			surface.SetDrawColor(0, 0, 0, 255 - self.CrossAlpha)
			surface.SetTexture(ClumpSpread)
			surface.DrawTexturedRect(x2 - 20, y2 - 20, 40, 40)
			
			surface.SetDrawColor(255, 255, 255, 255 - self.CrossAlpha)
			surface.DrawTexturedRect(x2 - 19, y2 - 19, 38, 38)
			
			draw.ShadowText(self.Owner:GetAmmoCount("M67 Grenades") .. "x M67", "FAS2_HUD24", x / 2, y / 2 + 200, Color(255, 255, 255, 255 - self.CrossAlpha), Color(0, 0, 0, 255 - self.CrossAlpha), 2, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		
		x2, y2 = math.Round(x * 0.5), math.Round(y * 0.5)
		
		surface.SetDrawColor(0, 0, 0, self.CrossAlpha)
		surface.SetTexture(ClumpSpread)
		surface.DrawTexturedRect(x2 - 20, y2 - 20, 40, 40)
		
		surface.SetDrawColor(255, 255, 255, self.CrossAlpha)
		surface.DrawTexturedRect(x2 - 19, y2 - 19, 38, 38)
	end
end

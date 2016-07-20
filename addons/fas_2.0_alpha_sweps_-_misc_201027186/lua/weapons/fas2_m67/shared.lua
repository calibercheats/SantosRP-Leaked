
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 10
end

if CLIENT then
    SWEP.PrintName = "M67"
    SWEP.Slot = 4
    SWEP.SlotPos = 0
	
	SWEP.AimPos = Vector(-3.412, -6.4, -2.238)
	SWEP.AimAng = Vector(7.353, 0, 0)
		
	SWEP.WMAng = Vector(0, 180, 180)
	SWEP.WMPos = Vector(2, -3, 0.25)
	
	SWEP.SprintPos = Vector(0, 0, 0)
	SWEP.SprintAng = Vector(0, 0, 0)
	SWEP.MoveType = 3
	SWEP.MuzzleName = "2"
end

SWEP.HoldType = "grenade"
SWEP.NoProficiency = true
SWEP.BulletLength = 7.62
SWEP.CaseLength = 39
SWEP.EmptySound = Sound("weapons/empty_assaultrifles.wav")
SWEP.NoAttachmentMenu = true

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
SWEP.Sounds["deploy"] = {[1] = {time = 0.5, sound = Sound("FAS2_M67.Safety")}}
SWEP.Sounds["prime"] = {[1] = {time = 0.2, sound = Sound("FAS2_M67.Ring")}}
SWEP.Sounds["cook"] = {[1] = {time = 0.2, sound = Sound("FAS2_M67.Ring")},
	[2] = {time = 0.3, sound = Sound("FAS2_M67.Spoon")}}

SWEP.FireModes = {"semi"}

SWEP.Category = "FA:S 2 Weapons"
SWEP.Base = "fas2_base"
SWEP.Author            = "Spy"

SWEP.Contact        = ""
SWEP.Purpose        = ""
SWEP.Instructions    = "PRIMARY ATTACK KEY - Prime grenade\nSECONDARY ATTACK KEY - Cook grenade"

SWEP.ViewModelFOV    = 55
SWEP.ViewModelFlip    = false

SWEP.Spawnable            = true
SWEP.AdminSpawnable        = true

SWEP.VM = "models/weapons/v_m67.mdl"
SWEP.WM = "models/weapons/w_eq_fraggrenade_thrown.mdl"
SWEP.WorldModel   = "models/weapons/w_eq_fraggrenade_thrown.mdl"

-- Primary Fire Attributes --
SWEP.Primary.ClipSize        = -1
SWEP.Primary.DefaultClip    = 12
SWEP.Primary.Automatic       = false    
SWEP.Primary.Ammo             = "M67 Grenades"
 
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

local nade, EA, pos, mag, CT, tr, force, phys, pos, vel
local td = {}

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

function SWEP:Holster(wep)
	if self.ThrowInitiated or self.FuseTime then
		return
	end
	
	if self == wep then
		return
	end
	
	if self.dt.Status == FAS_STAT_HOLSTER_END then
		self.dt.Status = FAS_STAT_IDLE
		self.ReloadDelay = nil
		return true
	end
	
	if self.ReloadDelay or CurTime() < self.ReloadWait then
		return false
	end
	
	if IsValid(wep) and self.dt.Status != FAS_STAT_HOLSTER_START then
		CT = CurTime()

		self:SetNextPrimaryFire(CT + (self.HolsterTime and self.HolsterTime * 2 or 0.75))
		self:SetNextSecondaryFire(CT + (self.HolsterTime and self.HolsterTime * 2 or 0.75))
		self.ReloadWait = CT + (self.HolsterTime and self.HolsterTime * 2 or 0.75)
		self.SprintDelay = CT + (self.HolsterTime and self.HolsterTime * 2 or 0.75)
		
		self.ChosenWeapon = wep:GetClass()
		
		if self.dt.Status != FAS_STAT_HOLSTER_END then
			timer.Simple((self.HolsterTime and self.HolsterTime or 0.45), function()
				if IsValid(self) and IsValid(self.Owner) and self.Owner:Alive() then
					self.dt.Status = FAS_STAT_HOLSTER_END
					
					self.Owner:ConCommand("use " .. self.ChosenWeapon)
				end
			end)
		end
		
		self.dt.Status = FAS_STAT_HOLSTER_START
		self:PlayHolsterAnim()
	end
	
	if CLIENT then
		self.CurSoundTable = nil
		self.CurSoundEntry = nil
		self.SoundTime = nil
		self.SoundSpeed = 1
	end
	
	if SERVER and SP then
		SendUserMessage("FAS2_ENDSOUNDS", self.Owner)
	end
	
	self:EmitSound("weapons/weapon_holster" .. math.random(1, 3) .. ".wav", 50, 100)
	return false
end

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
	
	if self.ThrowInitiated then
		if not self.Owner:KeyDown(IN_ATTACK) and not self.Owner:KeyDown(IN_ATTACK2) then
			if CT > self.TimeToThrow then
				FAS2_PlayAnim(self, "throw", 1)
				self.Owner:SetAnimation(PLAYER_ATTACK1)
				
				self:EmitSound("weapons/handling/generic_cloth_fast" .. math.random(1, 2) .. ".wav", 50, math.random(95, 105))
				
				timer.Simple(0.15, function()
					if IsValid(self) and IsValid(self.Owner) and self.Owner:Alive() then
						if SERVER then
							local nade = ents.Create("fas2_thrown_m67")
							EA =  self.Owner:EyeAngles()
							pos = self.Owner:GetShootPos()
							pos = pos + EA:Right() * 5 - EA:Up() * 4 + EA:Forward() * 8
							
							nade:SetPos(pos)
							nade:SetAngles(Angle(math.random(0, 360), math.random(0, 360), math.random(0, 360)))
							nade:Spawn()
							nade:SetOwner(self.Owner)
								
							if self.ThrowType == "cook" then
								nade:Fuse(self.FuseTime - CT)
							else
								nade:Fuse(3)
							end
							
							phys = nade:GetPhysicsObject()
							
							if IsValid(phys) then
								force = 1000
									
								if self.Owner:KeyDown(IN_FORWARD) and ong then
									force = force + self.Owner:GetVelocity():Length()
								end
								
								phys:SetVelocity(EA:Forward() * force * self.ThrowPower + Vector(0, 0, 100))
								phys:AddAngleVelocity(Vector(math.random(-500, 500), math.random(-500, 500), math.random(-500, 500)))
							end
						end
						
						self.FuseTime = nil
					end
				end)
				
				timer.Simple(0.6, function()
					if IsValid(self) and IsValid(self.Owner) and self.Owner:Alive() then
						--Inventory item HAX
						local count = 0
						for itemID, num in pairs( self.Owner:GetInventory() or {} ) do
							if GAMEMODE.Inv:GetItem( itemID ).EquipGiveClass == "fas2_m67" then
								count = count +num
							end
						end

						for slotName, itemID in pairs( self.Owner:GetEquipment() or {} ) do
							if GAMEMODE.Inv:GetItem( itemID or "" ).EquipGiveClass == "fas2_m67" then
								count = count +1
							end
						end

						if count > 1 then
							GAMEMODE.Inv:TakePlayerItem( self.Owner, "M67", 1 )
						else
							if count > 0 then
								if GAMEMODE.Inv:PlayerHasItemEquipped( self.Owner, "M67" ) then
									for slotName, itemID in pairs( self.Owner:GetEquipment() or {} ) do
										if itemID ~= "M67" then continue end
										GAMEMODE.Inv:DeletePlayerEquipItem( self.Owner, slotName )
									end
								end
							end
						end

						if count > 1 then
							FAS2_PlayAnim(self, "deploy", 1)
						else
							self.MonitorGrenades = true
						end
					end
				end)
				
				--self:TakePrimaryAmmo(1)

				self.ThrowInitiated = false
				self:SetNextPrimaryFire(CT + 1)
				self:SetNextSecondaryFire(CT + 1)
			end
		else
			if CT > self.TimeToThrow then
				self.ThrowPower = math.Approach(self.ThrowPower, 1, FrameTime())
			end
			
			if self.FuseTime and CT >= self.FuseTime then
				self.Cooking = false
				self.FuseTime = nil
				
				if SERVER then
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
	
	if self.MonitorGrenades then
		if self.Owner:GetAmmoCount("M67 Grenades") > 0 then
			FAS2_PlayAnim(self, "deploy", 1)
			self.MonitorGrenades = false
			self:SetNextPrimaryFire(CT + 0.6)
			self:SetNextSecondaryFire(CT + 0.6)
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
end

function SWEP:PrimaryAttack()	
	if not IsFirstTimePredicted() then
		return
	end
	
	if self.ThrowInitiated or self.FuseTime then
		return
	end
	
	if self.Owner:GetAmmoCount("M67 Grenades") == 0 then
		return
	end

	td.start = self.Owner:GetShootPos()
	td.endpos = td.start + self.Owner:GetAimVector() * 30
	td.filter = self.Owner
		
	tr = util.TraceLine(td)
	
	if tr.Hit then
		return
	end
	
	CT = CurTime()
	
	self.ThrowInitiated = true
	self.ThrowType = "prime"
	self.ThrowPower = 0.5
	FAS2_PlayAnim(self, "prime", 1)
	self.TimeToThrow = CT + 0.6
end

function SWEP:SecondaryAttack()	
	if not IsFirstTimePredicted() then
		return
	end
	
	if self.ThrowInitiated or self.FuseTime then
		return
	end
	
	if self.Owner:GetAmmoCount("M67 Grenades") == 0 then
		return
	end

	td.start = self.Owner:GetShootPos()
	td.endpos = td.start + self.Owner:GetAimVector() * 30
	td.filter = self.Owner
		
	tr = util.TraceLine(td)
	
	if tr.Hit then
		return
	end
	
	CT = CurTime()
	
	self.ThrowInitiated = true
	self.ThrowType = "cook"
	self.ThrowPower = 0.5
	FAS2_PlayAnim(self, "cook", 1)
	self.FuseTime = CT + 3.5
	self.TimeToThrow = CT + 0.6
end

if CLIENT then
	local x, y, x2, y2
	local ClumpSpread = surface.GetTextureID("VGUI/clumpspread_ring")

	function SWEP:DrawHUD()
		if GetConVarNumber("fas2_nohud") > 0 then
			return
		end
		
		FT, CT, x, y = FrameTime(), CurTime(), ScrW(), ScrH()
		
		if self.MagCheck or self.Vehicle then
			self.CrossAlpha = Lerp(FT * 10, self.CrossAlpha, 0)
		else
			self.CrossAlpha = Lerp(FT * 10, self.CrossAlpha, 255)
		end
		
		x2, y2 = math.Round(x * 0.5), math.Round(y * 0.5)
		
		surface.SetDrawColor(0, 0, 0, self.CrossAlpha)
		surface.SetTexture(ClumpSpread)
		surface.DrawTexturedRect(x2 - 20, y2 - 20, 40, 40)
		
		surface.SetDrawColor(255, 255, 255, self.CrossAlpha)
		surface.DrawTexturedRect(x2 - 19, y2 - 19, 38, 38)
		
		draw.ShadowText(self.Owner:GetAmmoCount("M67 Grenades") .. "x M67", "FAS2_HUD24", x / 2, y / 2 + 200, Color(255, 255, 255, 255), Color(0, 0, 0, 255), 2, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

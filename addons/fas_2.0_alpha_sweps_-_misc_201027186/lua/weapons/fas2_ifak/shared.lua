
-----------------------------------------------------
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.ExtraMags = 10
end

if CLIENT then
    SWEP.PrintName = "Infantry First Aid Kit"
    SWEP.Slot = 0
    SWEP.SlotPos = 0
	
	SWEP.AimPos = Vector(-3.412, -6.4, -2.238)
	SWEP.AimAng = Vector(7.353, 0, 0)
		
	SWEP.WMAng = Vector(0, 180, 180)
	SWEP.WMPos = Vector(5, -4, 0.25)
	
	SWEP.SprintPos = Vector(0, 0, 0)
	SWEP.SprintAng = Vector(0, 0, 0)
	SWEP.MoveType = 3
	SWEP.MuzzleName = "2"
	SWEP.NoNearWall = true
end

SWEP.HoldType = "slam"
SWEP.NoProficiency = true
SWEP.NoAttachmentMenu = true

SWEP.Anims = {}
SWEP.Anims.Draw_First = "deploy"
SWEP.Anims.Draw = "deploy"
SWEP.Anims.Holster = "holster"
SWEP.Anims.Slash = {"slash_1", "slash_2"}
SWEP.Anims.Stab = {"stab_1", "stab_1"}
SWEP.Anims.Idle = "idle"
SWEP.Anims.Idle_Aim = "idle_scoped"
SWEP.Anims.PrepBackstab = "backstab_draw"
SWEP.Anims.UnPrepBackstab = "backstab_holster"
SWEP.Anims.Backstab = "backstab_stab"

SWEP.Sounds = {}
SWEP.Sounds["bandage"] = {[1] = {time = 0.4, sound = Sound("FAS2_Bandage.Retrieve")},
	[2] = {time = 1.25, sound = Sound("FAS2_Bandage.Open")},
	[3] = {time = 2.15, sound = Sound("FAS2_Hemostat.Retrieve")}}
	
SWEP.Sounds["quikclot"] = {[1] = {time = 0.3, sound = Sound("FAS2_QuikClot.Retrieve")},
	[2] = {time = 1.45, sound = Sound("FAS2_QuikClot.Loosen")},
	[3] = {time = 2.55, sound = Sound("FAS2_QuikClot.Open")}}

SWEP.Sounds["suture"] = {[1] = {time = 0.3, sound = Sound("FAS2_Hemostat.Retrieve")},
	[2] = {time = 3.5, sound = Sound("FAS2_Hemostat.Close")}}
	
SWEP.FireModes = {"semi"}

SWEP.Category = "FA:S 2 Weapons"
SWEP.Base = "fas2_base"
SWEP.Author            = "Spy"

SWEP.Contact        = ""
SWEP.Purpose        = ""
SWEP.Instructions    = "PRIMARY ATTACK KEY - Use bandage\nSECONDARY ATTACK KEY - Use hemostat/quikclot"

SWEP.ViewModelFOV    = 53
SWEP.ViewModelFlip    = false

SWEP.Spawnable            = true
SWEP.AdminSpawnable        = true

SWEP.VM = "models/weapons/v_ifak.mdl"
SWEP.WM = "models/weapons/w_ifak.mdl"
SWEP.WorldModel   = "models/Items/HealthKit.mdl"

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

-- Deploy related
SWEP.FirstDeployTime = 0.5
SWEP.DeployTime = 0.5
SWEP.HolsterTime = 0.7
SWEP.DeployAnimSpeed = 1

SWEP.EasterWait = 0

local nade, EA, pos, mag, CT, tr, force, phys, pos, vel, ent, dmg, tr2, am
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

function SWEP:Holster(wep)
	if not IsFirstTimePredicted() then
		return
	end
	
	if self == wep then
		return
	end
	
	if self.dt.Status == FAS_STAT_HOLSTER_END then
		self.dt.Status = FAS_STAT_IDLE
		return true
	end
	
	if self.HealTime and CurTime() < self.HealTime then
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
					self.dt.Bipod = false
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

function SWEP:Equip(own)
	own:GiveAmmo(4, "Bandages")
	own:GiveAmmo(3, "Quikclots")
	own:GiveAmmo(2, "Hemostats")
end

local p

function SWEP:Reload()
	if self.Owner:KeyDown(IN_USE) then
		CT = CurTime()
		
		if CT > self.EasterWait then
			p = math.Rand(0.85, 1.2)
			
			self:EmitSound("heghe/voice_battlecry.wav", 80, 100 * p)
			self.EasterWait = CT + SoundDuration("heghe/voice_battlecry.wav") / p + 0.4
		end
	end
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
	
	if not self.CurrentHeal then
		if CLIENT then
			self:SetUpBodygroups()
		end
	else
		if CT >= self.HealTime then
			if self.OwnHeal then
				self:EndSelfHealingProcess()
			else
				self:EndHealingProcess()
			end
		end
	end
end

function SWEP:EndSelfHealingProcess()
	if self.CurrentHeal == "suture" and self.Owner:GetAmmoCount("Hemostats") == 1 then
		FAS2_PlayAnim(self, "bandage_end", 1)
	else
		FAS2_PlayAnim(self, self.CurrentHeal .. "_end", 1)
	end
	
	self.Owner:RemoveAmmo(1, self.AmmoType)
	
	if CLIENT then
		self:SetUpBodygroups()
	end
	
	if SERVER then
		self.Owner:SetHealth(math.Clamp(self.Owner:Health() + self.HealAmount, 0, self.Owner:GetMaxHealth()))
	end
	
	self.CurrentHeal = nil
	self.HealTime = nil
	self.HealAmount = nil
end

function SWEP:EndHealingProcess()
	if self.CurrentHeal == "suture" and self.Owner:GetAmmoCount("Hemostats") == 1 then
		FAS2_PlayAnim(self, "bandage_end", 1)
	else
		FAS2_PlayAnim(self, self.CurrentHeal .. "_end", 1)
	end
	
	self.Owner:RemoveAmmo(1, self.AmmoType)
	
	if CLIENT then
		self:SetUpBodygroups()
	end
	
	self.CurrentHeal = nil
	self.HealTime = nil
	self.OwnHeal = false
end

function SWEP:HealTarget(amt)
	self.Target:SetHealth(math.Clamp(self.Target:Health() + amt, 0, self.Target:GetMaxHealth()))
end


function SWEP:SetUpBodygroups()
	vm = self.Wep
	vm:SetBodygroup(2, math.Clamp(self.Owner:GetAmmoCount("Bandages"), 0, 2))
	
	am = self.Owner:GetAmmoCount("Hemostats")
	
	if am > 0 then
		if am == 1 then
			vm:SetBodygroup(3, 2)
		elseif am >= 2 then
			vm:SetBodygroup(3, 3)
		end
	else
		am = self.Owner:GetAmmoCount("Quikclots")
		
		if am > 0 then
			vm:SetBodygroup(3, 1)
		else
			vm:SetBodygroup(3, 0)
		end
	end
end

local Mins, Maxs = Vector(-8, -8, -8), Vector(8, 8, 8)

function SWEP:FindHealTarget()
	td.start = self.Owner:GetShootPos()
	td.endpos = td.start + self.Owner:GetAimVector() * 50
	td.filter = self.Owner
	td.mins = Mins
	td.maxs = Maxs
	
	tr = util.TraceHull(td)
	
	if tr.Hit then
		ent = tr.Entity
		
		if IsValid(ent) and ent:IsPlayer() then
			return ent
		end
	end
	
	return self.Owner
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

	am = self.Owner:GetAmmoCount("Bandages")
	
	if am <= 0 then
		return
	end
	
	CT = CurTime()
	
	self.Target = self:FindHealTarget()
	
	if CLIENT then
		-- since the function GetMaxHealth is non existant on the client, we're going to have to do some hacky shit on the client and assume that everyone has a max health of 100
		
		if self.Target:Health() >= 100 then
			return
		end
	else
		-- ... and we'll use GetMaxHealth on the server, this is going to cause prediction issues on the client
		-- but garry said GetMaxHealth is not needed on the client and I'm too fucking lazy to make a brand new system to network maximum health of every player
		-- so you'll just have to live with what you have ;)
		
		if self.Target:Health() >= self.Target:GetMaxHealth() then
			return
		end
	end
	
	self:SetNextPrimaryFire(CT + 2.95)
	self:SetNextSecondaryFire(CT + 2.95)
	self.HealTime = CT + 2.5
	self.CurrentHeal = "bandage"
	self.AmmoType = "Bandages"
	
	if SERVER and SP then
		self.Owner:SendLua("LocalPlayer():GetActiveWeapon().HealTime = CurTime() + 2.5")
	end
	
	if self.Target != self.Owner then
		if SERVER then
			self:HealTarget(10)
		end
		
		self.OwnHeal = false
	else
		self.HealAmount = 10
		self.OwnHeal = true
	end
	
	FAS2_PlayAnim(self, "bandage", 1)
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
	
	am = self.Owner:GetAmmoCount("Hemostats")
	
	if am > 0 then
		self.Target = self:FindHealTarget()
		
		if CLIENT then
			if self.Target:Health() >= 100 then
				return
			end
		else
			if self.Target:Health() >= self.Target:GetMaxHealth() then
				return
			end
		end
		
		CT = CurTime()
		self:SetNextPrimaryFire(CT + 5.5)
		self:SetNextSecondaryFire(CT + 5.5)
		self.HealTime = CT + 4.5
		self.CurrentHeal = "suture"
		self.AmmoType = "Hemostats"
		
		if SERVER and SP then
			self.Owner:SendLua("LocalPlayer():GetActiveWeapon().HealTime = CurTime() + 4.5")
		end
		
		if self.Target != self.Owner then
			if SERVER then
				self:HealTarget(30)
			end
			
			self.OwnHeal = false
		else
			self.HealAmount = 30
			self.OwnHeal = true
		end
		
		FAS2_PlayAnim(self, "suture", 1)
	else
		am = self.Owner:GetAmmoCount("Quikclots")
		
		if am > 0 then
			self.Target = self:FindHealTarget()
			
			if CLIENT then
				if self.Target:Health() >= 100 then
					return
				end
			else
				if self.Target:Health() >= self.Target:GetMaxHealth() then
					return
				end
			end
			
			CT = CurTime()
			self:SetNextPrimaryFire(CT + 4.65)
			self:SetNextSecondaryFire(CT + 4.65)
			self.HealTime = CT + 4.2
			self.CurrentHeal = "quikclot"
			self.AmmoType = "Quikclots"
			
			if SERVER and SP then
				self.Owner:SendLua("LocalPlayer():GetActiveWeapon().HealTime = CurTime() + 4.2")
			end
	
			self.Target = self:FindHealTarget()
			
			if self.Target != self.Owner then
				if SERVER then
					self:HealTarget(20)
				end
		
				self.OwnHeal = false
			else
				self.HealAmount = 20
				self.OwnHeal = true
			end
			
			FAS2_PlayAnim(self, "quikclot", 1)
		end
	end
end

if CLIENT then
	local x, y, x2, y2, pos, ang
	local ClumpSpread = surface.GetTextureID("VGUI/clumpspread_ring")
	local White, Black, Grey, Red, Green = Color(255, 255, 255, 255), Color(0, 0, 0, 255), Color(200, 200, 200, 255), Color(255, 137, 119, 255), Color(202, 255, 163, 255)
	
	function SWEP:Draw3D2DCamera()
		if GetConVarNumber("fas2_nohud") > 0 or GetConVarNumber("fas2_customhud") <= 0 then
			return
		end
		
		vm = self.Wep
		
		pos, ang = vm:GetBonePosition(vm:LookupBone("Dummy97"))
		ang:RotateAroundAxis(ang:Up(), 90)
		ang:RotateAroundAxis(ang:Right(), 5)
		
		cam.Start3D2D(pos + ang:Right() * -3.8 - ang:Forward() * 3.5, ang, 0.015 * GetConVarNumber("fas2_textsize"))
			am = self.Owner:GetAmmoCount("Bandages")
			draw.ShadowText("BANDAGES: " .. am, "FAS2_HUD48", -40, 0, White, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
			
			if am > 0 then
				draw.ShadowText("LMB - APPLY BANDAGE", "FAS2_HUD36", -40, -40, Green, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
				draw.ShadowText("+10 HP", "FAS2_HUD24", -40, -60, Green, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
			end
		cam.End3D2D()
		
		pos, ang = vm:GetBonePosition(vm:LookupBone("Dummy98"))
		ang:RotateAroundAxis(ang:Up(), 90)
		
		cam.Start3D2D(pos + ang:Right() * -3.5 + ang:Forward(), ang, 0.015 * GetConVarNumber("fas2_textsize"))
			am = self.Owner:GetAmmoCount("Hemostats")
			
			if am > 0 then
				draw.ShadowText("HEMOSTATS: " .. am, "FAS2_HUD48", -20, 0, White, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
				draw.ShadowText("RMB - APPLY HEMOSTAT", "FAS2_HUD36", -20, -40, Green, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
				draw.ShadowText("+30 HP", "FAS2_HUD24", -20, -60, Green, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
			else
				am = self.Owner:GetAmmoCount("Quikclots")
				
				draw.ShadowText("QUIKCLOTS: " .. am, "FAS2_HUD48", -20, 0, White, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
				
				if am > 0 then
					draw.ShadowText("RMB - APPLY QUIKCLOT", "FAS2_HUD36", -20, -40, Green, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
					draw.ShadowText("+20 HP", "FAS2_HUD24", -20, -60, Green, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
				end
			end
		cam.End3D2D()
	end

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
		
		x2, y2 = math.Round(x * 0.5), math.Round(y * 0.5)
		
		if self.dt.Status == FAS_STAT_QUICKGRENADE then
			surface.SetDrawColor(0, 0, 0, 255 - self.CrossAlpha)
			surface.SetTexture(ClumpSpread)
			surface.DrawTexturedRect(x2 - 20, y2 - 20, 40, 40)
			
			surface.SetDrawColor(255, 255, 255, 255 - self.CrossAlpha)
			surface.DrawTexturedRect(x2 - 19, y2 - 19, 38, 38)
			
			draw.ShadowText(self.Owner:GetAmmoCount("M67 Grenades") .. "x M67", "FAS2_HUD24", x / 2, y / 2 + 200, Color(255, 255, 255, 255 - self.CrossAlpha), Color(0, 0, 0, 255 - self.CrossAlpha), 2, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		
		self.Target = self:FindHealTarget()
		
		if self.Target then
			draw.ShadowText("HEAL TARGET: " .. (self.Target != self.Owner and self.Target:Nick() or " SELF"), "FAS2_HUD24", x / 2, y / 2 + 200, Color(255, 255, 255, self.CrossAlpha), Color(0, 0, 0, self.CrossAlpha), 2, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		else
			draw.ShadowText("HEAL TARGET: SELF", "FAS2_HUD24", x / 2, y / 2 + 200, Color(255, 255, 255, self.CrossAlpha), Color(0, 0, 0, self.CrossAlpha), 2, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		
		if GetConVarNumber("fas2_customhud") <= 0 or self.Owner:ShouldDrawLocalPlayer() then
			am = self.Owner:GetAmmoCount("Bandages")
			
			draw.ShadowText("BANDAGES: " .. am, "FAS2_HUD36", x2 - 100, y2 + 125, White, Black, 2, TEXT_ALIGN_RIGHT, TEXT_ALIGN_LEFT)
			
			if am > 0 then
				draw.ShadowText("LMB - APPLY BANDAGE", "FAS2_HUD24", x2 - 100, y2 + 100, Green, Black, 2, TEXT_ALIGN_RIGHT, TEXT_ALIGN_LEFT)
				draw.ShadowText("+10 HP", "FAS2_HUD24", x2 - 100, y2 + 75, Green, Black, 2, TEXT_ALIGN_RIGHT, TEXT_ALIGN_LEFT)
			end
			
			am = self.Owner:GetAmmoCount("Hemostats")
			
			if am > 0 then
				draw.ShadowText("HEMOSTATS: " .. am, "FAS2_HUD36", x2 + 100, y2 + 125, White, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
				draw.ShadowText("RMB - APPLY HEMOSTAT", "FAS2_HUD24", x2 + 100, y2 + 100, Green, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
				draw.ShadowText("+30 HP", "FAS2_HUD24", x2 + 100, y2 + 75, Green, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
			else
				am = self.Owner:GetAmmoCount("Quikclots")
				
				draw.ShadowText("QUIKCLOTS: " .. am, "FAS2_HUD36", x2 + 100, y2 + 125, White, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
				
				if am > 0 then
					draw.ShadowText("RMB - APPLY QUIKCLOT", "FAS2_HUD24", x2 + 100, y2 + 100, Green, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
					draw.ShadowText("+20 HP", "FAS2_HUD24", x2 + 100, y2 + 75, Green, Black, 2, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
				end
			end
		end
	end
end

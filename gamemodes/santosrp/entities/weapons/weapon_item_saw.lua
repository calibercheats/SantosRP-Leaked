
-----------------------------------------------------
--[[
	Name: weapon_item_saw.lua
	For: SantosRP
	By: Ultra
]]--

if SERVER then
	AddCSLuaFile()
end

local REV_PITCH = 170
local baseClass = baseclass.Get( "weapon_sck_base" )

SWEP.PrintName		= "Circular Saw"
SWEP.Author			= "Ultra"
SWEP.Base 			= "weapon_sck_base"
SWEP.Instructions	= ""

SWEP.ViewModel		= "models/weapons/c_crowbar.mdl"
SWEP.WorldModel		= "models/weapons/w_crowbar.mdl"
SWEP.ViewModelFOV	= 60
SWEP.Slot 			= 2
SWEP.UseHands 		= true

SWEP.HoldType 		= "physgun"
SWEP.ShowWorldModel = false
SWEP.ShowViewModel 	= false

SWEP.AttackDelay = 0.33
SWEP.AttackRange = 48
SWEP.AttackDamagePlayers = 2
SWEP.AttackDamageItems = 3
SWEP.AttackDamageCars = 1

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "none"

SWEP.WElements = {
	["element_name2"] = { type = "Model", model = "models/gibs/metal_gib3.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(10.048, 6.474, -5.494), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["element_name"] = { type = "Model", model = "models/props/CS_militia/circularsaw01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(12.819, 1.123, -2.701), angle = Angle(15.119, -62.215, 120.435), size = Vector(0.838, 0.838, 0.838), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/props/CS_militia/circularsaw01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.861, 0.735, -7.7), angle = Angle(173.281, 109.267, -66.792), size = Vector(0.82, 0.82, 0.82), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

function SWEP:SetupDataTables()
	self:NetworkVar( "Bool", 0, "Running" )
	self:NetworkVar( "Bool", 1, "Revving" )
end

function SWEP:PrimaryAttack()
	if self:GetNextPrimaryFire() > CurTime() then return end
	self:SetNextPrimaryFire( CurTime() +self.AttackDelay )

	local fx = "StunstickImpact"
	local tr = util.TraceLine{
		start = self.Owner:GetShootPos(),
		endpos = self.Owner:GetShootPos() +self.Owner:GetAimVector() *self.AttackRange,
		filter = { self, self.Owner }
	}
	local hit = tr.Hit and IsValid( tr.Entity )

	if hit then
		if tr.Entity.IsItem or tr.Entity:IsPlayer() or tr.Entity:IsNPC() then
			if SERVER and IsFirstTimePredicted() then
				local dmg = DamageInfo()
				dmg:SetDamage( tr.Entity.IsItem and self.AttackDamageItems or self.AttackDamagePlayers )
				dmg:SetDamageType( DMG_CLUB )
				dmg:SetAttacker( self.Owner )
				dmg:SetInflictor( self )
				tr.Entity:TakeDamageInfo( dmg )
			end
			
			if tr.Entity:IsPlayer() or tr.Entity:IsNPC() then
				self:EmitSound( "npc/manhack/grind_flesh".. math.random(1, 3).. ".wav", 60, 100, 0.28 )
				fx = "BloodImpact"
			else
				self:EmitSound( "npc/manhack/grind".. math.random(1, 5).. ".wav", 60, 100, 0.28 )
			end
		elseif tr.Entity:IsVehicle() then
			if SERVER and IsFirstTimePredicted() then
				local dmg = DamageInfo()
				dmg:SetDamage( self.AttackDamageCars )
				dmg:SetDamageType( DMG_CLUB )
				dmg:SetAttacker( self.Owner )
				dmg:SetInflictor( self )
				tr.Entity:TakeDamageInfo( dmg )
			end
			
			self:EmitSound( "npc/manhack/grind".. math.random(1, 5).. ".wav", 60, 100, 0.28 )
		else
			self:EmitSound( "npc/manhack/grind".. math.random(1, 5).. ".wav", 60, 100, 0.28 )
		end

		if IsFirstTimePredicted() then
			local effectData = EffectData()
			effectData:SetOrigin( tr.HitPos )
			effectData:SetNormal( tr.HitNormal )
			util.Effect( fx, effectData )
		end
	elseif tr.Hit then
		self:EmitSound( "npc/manhack/grind".. math.random(1, 5).. ".wav", 60, 100, 0.28 )

		if IsFirstTimePredicted() then
			local effectData = EffectData()
			effectData:SetOrigin( tr.HitPos )
			effectData:SetNormal( tr.HitNormal )
			util.Effect( fx, effectData )
		end
	end
end

function SWEP:SecondaryAttack()
end

function SWEP:Think()
	if SERVER then
		if not IsValid( self.Owner ) then return end
		self.m_bWasRunning = true
		self:SetRevving( self.Owner:KeyDown(IN_ATTACK) )
	else
		if self:GetRunning() then
			if not self.m_sndRunning or not self.m_sndRunning:IsPlaying() then
				self.m_sndRunning = self.m_sndRunning or CreateSound( self, "ambient/machines/spin_loop.wav" )
				self.m_sndRunning:SetSoundLevel( 68 )
				self.m_sndRunning:PlayEx( 0.28, 100 )

				self.m_sndRunning2 = self.m_sndRunning2 or CreateSound( self, "npc/manhack/mh_blade_loop1.wav" )
				self.m_sndRunning:SetSoundLevel( 60 )
				self.m_sndRunning2:PlayEx( 0.28, 100 )
			end
		else
			if self.m_sndRunning then
				self.m_sndRunning:Stop()
				self.m_sndRunning = nil
			end
			if self.m_sndRunning2 then
				self.m_sndRunning2:Stop()
				self.m_sndRunning2 = nil
			end
		end

		if self:GetRevving() then
			if self.m_sndRunning and self.m_sndRunning:IsPlaying() then
				if not self.m_intCurPitch or self.m_intCurPitch ~= REV_PITCH then
					self.m_sndRunning:ChangePitch( REV_PITCH, 0.5 )
					self.m_sndRunning2:ChangePitch( REV_PITCH, 0.5 )
					self.m_intCurPitch = REV_PITCH
				end
			end
		else
			if self.m_sndRunning and self.m_sndRunning:IsPlaying() then
				if not self.m_intCurPitch or self.m_intCurPitch == REV_PITCH then
					self.m_sndRunning:ChangePitch( 100, 0.5 )
					self.m_sndRunning2:ChangePitch( 100, 0.5 )
					self.m_intCurPitch = 100
				end
			end
		end
	end
end

function SWEP:Deploy()
	baseClass.Deploy( self )
	if CLIENT then return true  end
	self:EmitSound( "ambient/machines/sputter1.wav", 60, 100, 0.28 )
	
	self:SetRunning( true )
	self:SetRevving( false )
	return true
end

function SWEP:Holster()
	baseClass.Holster( self )

	if CLIENT then
		if self.m_sndRunning and self.m_sndRunning:IsPlaying() then
			self.m_sndRunning:Stop()
			self.m_sndRunning = nil
		end
		if self.m_sndRunning2 and self.m_sndRunning2:IsPlaying() then
			self.m_sndRunning2:Stop()
			self.m_sndRunning2 = nil
		end

		return true
	end

	if self.m_bWasRunning then
		self:EmitSound( "ambient/machines/spinup.wav", 60, 100, 0.28 )
		self.m_bWasRunning = nil
	end
	
	self:SetRunning( false )
	self:SetRevving( false )

	return true
end

function SWEP:OnRemove()
	baseClass.OnRemove( self )

	if CLIENT then
		if self.m_sndRunning and self.m_sndRunning:IsPlaying() then
			self.m_sndRunning:Stop()
			self.m_sndRunning = nil
		end
		if self.m_sndRunning2 and self.m_sndRunning2:IsPlaying() then
			self.m_sndRunning2:Stop()
			self.m_sndRunning2 = nil
		end
	end
end
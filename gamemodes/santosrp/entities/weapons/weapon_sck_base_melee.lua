
-----------------------------------------------------
--[[
	Name: weapon_base_sck_melee.lua
	For: SantosRP
	By: Ultra
]]--

if SERVER then
	AddCSLuaFile()
end

SWEP.PrintName		= ""
SWEP.Author			= "Ultra"
SWEP.Instructions	= ""
SWEP.Base 			= "weapon_sck_base"
SWEP.ViewModel		= ""
SWEP.WorldModel		= ""
SWEP.ViewModelFOV	= 60

SWEP.ViewModel		= "models/weapons/c_crowbar.mdl"
SWEP.WorldModel		= "models/weapons/w_crowbar.mdl"
SWEP.Spawnable		= false
SWEP.Slot 			= 2
SWEP.UseHands 		= true

SWEP.HoldType 		= "melee"

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"
SWEP.ShowWorldModel 		= false
SWEP.ShowViewModel 			= false

SWEP.AttackDelay = 1
SWEP.AttackRange = 80
SWEP.AttackDamagePlayers = 5
SWEP.AttackDamageCars = 5

function SWEP:PrimaryAttack()
	if self:GetNextPrimaryFire() > CurTime() then return end
	self:SetNextPrimaryFire( CurTime() +self.AttackDelay )
	self:SendWeaponAnim( ACT_VM_MISSCENTER )
	
	if IsFirstTimePredicted() then
		self.Owner:SetAnimation( PLAYER_ATTACK1 )

		local tr = util.TraceLine{
			start = self.Owner:GetShootPos(),
			endpos = self.Owner:GetShootPos() +self.Owner:GetAimVector() *self.AttackRange,
			filter = { self, self.Owner }
		}
		local hit = tr.Hit and IsValid( tr.Entity )
		
		if not hit then
			if SERVER then
				self.Owner:ViewPunch( Angle(8, 0, 0) )
			end
			self:PlayMissSound()
		else
			if SERVER then
				if tr.Entity.IsItem or tr.Entity:IsPlayer() then
					local dmg = DamageInfo()
					dmg:SetDamage( self.AttackDamagePlayers )
					dmg:SetDamageType( DMG_CLUB )
					dmg:SetAttacker( self.Owner )
					dmg:SetInflictor( self )
					tr.Entity:TakeDamageInfo( dmg )
				elseif tr.Entity:IsVehicle() then
					local dmg = DamageInfo()
					dmg:SetDamage( self.AttackDamageCars )
					dmg:SetDamageType( DMG_CLUB )
					dmg:SetAttacker( self.Owner )
					dmg:SetInflictor( self )
					tr.Entity:TakeDamageInfo( dmg )
				end

				self.Owner:ViewPunch( Angle(-10, 0, 0) )
			end
			self:PlayHitSound()
		end
	end
end

function SWEP:SecondaryAttack()
end

function SWEP:PlayHitSound()
	self:EmitSound( "weapons/knife/knife_hit_0".. math.random(1, 5).. ".wav" )
end

function SWEP:PlayMissSound()
	self:EmitSound( "weapons/iceaxe/iceaxe_swing1.wav" )
end
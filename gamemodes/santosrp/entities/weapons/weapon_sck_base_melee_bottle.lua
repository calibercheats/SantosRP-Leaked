
-----------------------------------------------------
--[[
	Name: weapon_sck_base_melee_bottle.lua
	For: SantosRP
	By: Ultra
]]--

if SERVER then
	AddCSLuaFile()
end

SWEP.PrintName		= ""
SWEP.Author			= "Ultra"
SWEP.Base 			= "weapon_sck_base_melee"
SWEP.Instructions	= ""

SWEP.ViewModel		= "models/weapons/c_crowbar.mdl"
SWEP.WorldModel		= "models/weapons/w_crowbar.mdl"
SWEP.ViewModelFOV	= 60
SWEP.Slot 			= 2
SWEP.UseHands 		= true

SWEP.HoldType 		= "melee"
SWEP.ShowWorldModel = false
SWEP.ShowViewModel 	= false

SWEP.AttackDelay = 1
SWEP.AttackRange = 80
SWEP.AttackDamagePlayers = 5
SWEP.AttackDamageCars = 5
SWEP.ItemID = ""

SWEP.Sounds = {
	Break = {
		"physics/glass/glass_bottle_break1.wav",
		"physics/glass/glass_bottle_break2.wav",
		"physics/glass/glass_cup_break1.wav",
		"physics/glass/glass_cup_break2.wav",
	},
	Hit = {
		"physics/glass/glass_impact_bullet1.wav",
		"physics/glass/glass_impact_bullet2.wav",
		"physics/glass/glass_impact_bullet3.wav",
	}
}

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

function SWEP:PlayHitSound()
	if SERVER then
		if math.random(1, 3) == 1 then
			if GAMEMODE.Inv:PlayerHasItemEquipped( self.Owner, self.ItemID ) then
				for slotName, itemID in pairs( self.Owner:GetEquipment() or {} ) do
					if itemID ~= self.ItemID then continue end
					GAMEMODE.Inv:DeletePlayerEquipItem( self.Owner, slotName )
				end
			end

			local snd, _ = table.Random( self.Sounds.Break )
			self:EmitSound( snd )
			self:Remove()
		else
			local snd, _ = table.Random( self.Sounds.Hit )
			self:EmitSound( snd )
		end
	else
		local snd, _ = table.Random( self.Sounds.Hit )
		self:EmitSound( snd )
	end
end

function SWEP:PlayMissSound()
	self:EmitSound( "weapons/iceaxe/iceaxe_swing1.wav" )
end
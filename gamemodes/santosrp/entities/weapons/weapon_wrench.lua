
-----------------------------------------------------
--[[
	Name: weapon_wrench.lua
	For: SantosRP
	By: Ultra
]]--

if SERVER then
	AddCSLuaFile()
end

SWEP.PrintName		= "Wrench"
SWEP.Author			= "Ultra"
SWEP.Instructions	= "Left click and hold on interactive items to repair them."
SWEP.Base 			= "weapon_sck_base"
SWEP.ViewModel 		= "models/weapons/v_pistol.mdl"
SWEP.WorldModel 	= "models/weapons/w_pistol.mdl"
SWEP.ViewModelFOV	= 55

SWEP.Spawnable		= false
SWEP.Slot 			= 5
SWEP.UseHands 		= true

SWEP.HoldType 		= "slam"

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

SWEP.WElements = {
	["element_name"] = { type = "Model", model = "models/props/de_vostok/monkeywrench01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.046, 2.236, -4.248), angle = Angle(-1.494, 179.091, 89.139), size = Vector(0.939, 0.939, 0.939), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/props/de_vostok/monkeywrench01.mdl", bone = "ValveBiped.muzzle", rel = "", pos = Vector(-8.065, -1.31, -1.142), angle = Angle(164.804, -1.17, 180), size = Vector(0.619, 0.619, 0.619), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

function SWEP:SetupDataTables()
	self:NetworkVar( "Bool", 0, "Attached" )
	self:NetworkVar( "Float", 0, "AttachTime" )
	self:NetworkVar( "Float", 1, "AttachDuration" )
end

function SWEP:PrimaryAttack()
	if self:GetAttached() then return end
	self:SetNextPrimaryFire( CurTime() +1 )

	if SERVER then
		local ent = util.TraceLine{
			start = self.Owner:GetShootPos(),
			endpos = self.Owner:GetShootPos() +self.Owner:GetAimVector() *100,
			filter = { self, self.Owner }
		}.Entity

		if not IsValid( ent ) or not ent.AttachWrench then return end
		--self:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
		ent:AttachWrench( self )
	end
end

function SWEP:SecondaryAttack()
end

function SWEP:OnWrenchAttached( eEnt )
	if IsValid( eEnt ) then
		self:SetAttached( true )
		self.m_entAttached = eEnt
		self:SetAttachTime( CurTime() )
	end
end

function SWEP:OnWrenchRemoved( eEnt )
	self:SetAttached( false )
	self.m_entAttached = nil
	self:SetAttachDuration( 0 )
end

function SWEP:FireAnimationEvent( _, _, intEvent )
	if intEvent == 5001 or intEvent == 6001 then return true end
end

local box_w = 200
local box_h = 40
function SWEP:DrawHUD()
	if self:GetAttachDuration() <= 0 then return end
	
	local time = self:GetAttachTime() +self:GetAttachDuration()
	if time > CurTime() then
		local perc = 1 -((time -CurTime()) /self:GetAttachDuration())
		
		local x = (ScrW() /2) -(box_w /2)
		local y = ScrH() -box_h *2
		
		draw.RoundedBox( 6, x, y, box_w, box_h, Color(0, 0, 0, 200) )
		draw.RoundedBox( 6, x +2, y +2, (box_w -4) *perc, box_h -4, Color(230, 60, 60) )
		draw.SimpleText( "Repairing...", "handcuffTextSmall", (box_w /2) +x, (box_h/ 2) +y, color_white, 1, 1 )
	end
end

function SWEP:Think()
	if SERVER then
		if self:GetAttached() then
			if not IsValid( self.m_entAttached ) then
				self:OnWrenchRemoved()
			else
				if not self.Owner:KeyDown( IN_ATTACK ) then
					if IsValid( self.m_entAttached ) and self.m_entAttached.m_entAttached == self then
						self.m_entAttached:RemoveWrench()
					end
				end
			end
		end
	else
		self.NoDrawParts_VM = self:GetAttached()
		self.NoDrawParts_WM = self:GetAttached()
	end
end
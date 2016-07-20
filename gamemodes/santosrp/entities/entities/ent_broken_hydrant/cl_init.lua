
-----------------------------------------------------
--[[
	Name: cl_init.lua
	For: SantosRP
	By: Ultra
]]--

include "shared.lua"

function ENT:Initialize()
	self.m_pSound = CreateSound( self, "ambient/water/water_flow_loop1.wav" )
	self.m_vecOffset = Vector( 0, 0, -5 )
	if self.m_pSound then
		self.m_pSound:PlayEx( 0.2, 190 )
	end
end

function ENT:Draw()
	if self.m_entWrench and self:GetAttachTime() > 0 then
		local len = math.Clamp( (CurTime() -self:GetAttachTime()) /self.FixDuration, 0, 1 )
		local phi = (math.pi *2) *len
		local dist = 10.8
		local pos = GAMEMODE.Util:SphericalToCartesian( dist, math.pi /2, phi /4 )

		local rpos = self:GetPos()
		self.m_entWrench:SetPos( rpos +pos )
		self.m_entWrench:SetAngles( (rpos -self.m_entWrench:GetPos()):Angle() +Angle(0, 90, 0) )

		self.m_entWrench:DrawModel()
	end
end

function ENT:CreateWrenchModel()
	self.m_entWrench = ClientsideModel( "models/props/de_vostok/monkeywrench01.mdl", RENDERGROUP_BOTH )
	if not self.m_entWrench then return end
	self.m_entWrench:SetNoDraw( true )
end

function ENT:Think()
	if self:GetWrenchAttached() and not self.m_entWrench then
		self:CreateWrenchModel()
	end

	if not self.m_intLastThink then
		self.m_intLastThink = 0
	end

	if CurTime() < self.m_intLastThink then return end
	self.m_intLastThink = CurTime() +0.1

	local effectData = EffectData()
	effectData:SetOrigin( self:GetPos() -Vector(0, 0, 2) )
	effectData:SetNormal( ((self:GetAngles():Forward() *0.5) +(self:GetAngles():Up() *0.5)):GetNormalized() )
	effectData:SetStart( Vector(255, 255, 255) ) --hax
	util.Effect( "hydrantFx", effectData )
end

function ENT:OnRemove()
	if self.m_pSound then
		self.m_pSound:Stop()
	end

	if self.m_entWrench then
		self.m_entWrench:Remove()
	end
end
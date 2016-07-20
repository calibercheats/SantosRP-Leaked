
-----------------------------------------------------
--[[
	Name: cl_init.lua
	For: SantosRP
	By: Ultra
]]--

include "shared.lua"

function ENT:Initialize()
	if self:WaterLevel() > 0 then self.m_bRemoved = true end
	self.m_pSound = CreateSound( self, "interior_fire01_stereo.wav" )
	if self.m_pSound then
		self.m_pSound:Play()
		self.m_pSound:ChangeVolume( 0.15, 0 )
	end
end

function ENT:OnRemove()
	if self.m_pSound then
		self.m_pSound:Stop()
	end
end

function ENT:Draw()
end

function ENT:Think()
	if not self.m_intLastThink then
		self.m_intLastThink = 0
	end

	if CurTime() < self.m_intLastThink then return end
	self.m_intLastThink = CurTime() +0.5

	if self.m_bRemoved then return end
	local effectdata = EffectData()
	effectdata:SetOrigin( self:GetPos() )
	util.Effect( "fireFx", effectdata )
end
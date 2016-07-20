
-----------------------------------------------------
--[[
	Name: cl_init.lua
	For: SantosRP
	By: Ultra
]]--

include "shared.lua"

ENT.RenderGroup = RENDERGROUP_BOTH
local grassFxPos = Vector( -23.027344, 0.085938, 6.391894 )
local smokeFxPos = Vector( 0.526123, -0.171875, 19.031250 )

function ENT:Initialize()
	self.m_pSnd = CreateSound( self, "ambient/machines/spin_loop.wav" )
	self.m_pSnd:SetSoundLevel( 60 )

	self.m_pSndCut = CreateSound( self, "ambient/machines/machine6.wav" )
	self.m_pSndCut:SetSoundLevel( 60 )
end

function ENT:OnRemove()
	if self.m_pSnd then
		if self.m_pSnd:IsPlaying() then self.m_pSnd:Stop() end
		self.m_pSnd = nil
	end

	if self.m_pSndCut then
		if self.m_pSndCut:IsPlaying() then self.m_pSndCut:Stop() end
		self.m_pSndCut = nil
	end
end

function ENT:Think()
	if self:GetOn() then
		if self.m_pSnd and not self.m_pSnd:IsPlaying() then
			self.m_pSnd:PlayEx( 0.5, 140 )
		end

		if self:GetOverGrass() then
			if self.m_pSndCut and not self.m_pSndCut:IsPlaying() then
				self.m_pSndCut:PlayEx( 0.75, 160 )
			end
		else
			if self.m_pSndCut and self.m_pSndCut:IsPlaying() then
				self.m_pSndCut:Stop()
			end
		end
	else
		if self.m_pSnd and self.m_pSnd:IsPlaying() then
			self.m_pSnd:Stop()
		end

		if self.m_pSndCut and self.m_pSndCut:IsPlaying() then
			self.m_pSndCut:Stop()
		end
	end

	if CurTime() < (self.m_intLastThink or 0) then return end
	self.m_intLastThink = CurTime() +0.1

	if self:GetOn() then
		local effectData = EffectData()
		effectData:SetOrigin( self:LocalToWorld(smokeFxPos) )
		effectData:SetNormal( self:GetAngles():Up() )
		util.Effect( "mowerSmokeFx", effectData )

		if not self:GetOverGrass() then return end
		local effectData = EffectData()
		effectData:SetOrigin( self:LocalToWorld(grassFxPos) )
		local ang = self:LocalToWorldAngles( Angle(0, 0, 0) )
		effectData:SetNormal( ((ang:Forward() *-1) +(ang:Up() *1.2)):GetNormal() )
		util.Effect( "grassClippingFx", effectData )
	end
end
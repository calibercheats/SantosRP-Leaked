
-----------------------------------------------------
--[[
	Name: cl_init.lua
	For: SantosRP
	By: Ultra
]]--

include "shared.lua"

function ENT:Initialize()
	self.m_sndFanHum = CreateSound( self, "ambient/tones/fan2_loop.wav" )
end

function ENT:OnRemove()
	if self.m_sndFanHum then
		self.m_sndFanHum:Stop()
	end
end

function ENT:Think()
	if self:GetOn() then
		if not self.m_sndFanHum:IsPlaying() then
			self.m_sndFanHum:SetSoundLevel( 52 )
			self.m_sndFanHum:PlayEx( 0.8, 130 )
		end
	else
		if self.m_sndFanHum:IsPlaying() then
			self.m_sndFanHum:Stop()
		end
	end
end

function ENT:Draw()
	self:DrawModel()
end
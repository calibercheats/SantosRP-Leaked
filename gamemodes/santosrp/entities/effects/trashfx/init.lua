
-----------------------------------------------------
--[[
	Name: init.lua
	For: SantosRP
	By: Ultra
]]--

local dirtEmitter = ParticleEmitter( Vector(0) )
local dirtMats = {
	{ "particle/particle_debris_01", Color(255, 255, 255, 255) },
	{ "particle/particle_debris_02", Color(255, 255, 255, 255) },
	{ "particle/particle_smokegrenade", Color(80, 60, 40, 255) },
	{ "particle/particle_smokegrenade", Color(80, 60, 40, 255) },
	{ "particle/particle_smokegrenade", Color(80, 60, 40, 255) },
}

function EFFECT:Init( data )
	for i = 1, 16 do
		local pos = data:GetOrigin() +VectorRand() *16
		local mat = table.Random( dirtMats )
		local particle = dirtEmitter:Add( mat[1], pos )

		particle:SetColor( mat[2].r, mat[2].g, mat[2].b )
		particle:SetDieTime( 1 )
		particle:SetStartAlpha( 255 )
		particle:SetEndAlpha( 255 )
		particle:SetStartSize( math.random(12, 16) )
		particle:SetEndSize( math.random(17, 20) )
		--particle:SetRoll( math.Rand(0, 10) )
		--particle:SetRollDelta( math.Rand(-0.2, 0.2) )
		particle:SetVelocity( Vector(data:GetNormal().x, data:GetNormal().y, 0) *math.random(100, 128) )
		particle:SetGravity( Vector(0, 0, -210) )
		particle:SetCollide( true )
	end
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end
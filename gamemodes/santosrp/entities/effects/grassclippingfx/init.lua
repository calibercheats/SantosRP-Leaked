
-----------------------------------------------------
--[[
	Name: init.lua
	For: SantosRP
	By: Ultra
]]--

local grassFxEmitter = ParticleEmitter( Vector(0) )
local grassFx = {
	"effects/fleck_wood1",
	"effects/fleck_wood2"
}

function EFFECT:Init( data )
	for i = 1, 9 do
		local pos = data:GetOrigin() +(VectorRand() *6)
		local mat = table.Random( grassFx )
		local particle = grassFxEmitter:Add( mat, pos )

		particle:SetDieTime( math.Rand(0.8, 1.2) )
		particle:SetStartAlpha( 230 )
		particle:SetEndAlpha( 0 )
		particle:SetStartSize( math.Rand(1.6, 1.9) )
		particle:SetEndSize( math.Rand(3.3, 4) )
		particle:SetRoll( math.Rand(0, 10) )
		particle:SetRollDelta( math.Rand(-0.2, 0.2) )
		particle:SetVelocity( data:GetNormal() *math.random(48, 86) )
		particle:SetGravity( Vector(0, 0, -200) )
		particle:SetCollide( true )
		particle:SetColor( 66, math.random(66, 130), 20, 255 )
	end
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end
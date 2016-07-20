
-----------------------------------------------------
--[[
	Name: init.lua
	For: SantosRP
	By: Ultra
]]--

local smokeFxEmitter = ParticleEmitter( Vector(0) )
local smokeFx = {
	"particles/smokey",
}

function EFFECT:Init( data )
	local pos = data:GetOrigin() +(VectorRand() *4)
	local mat = table.Random( smokeFx )
	local particle = smokeFxEmitter:Add( mat, pos )

	particle:SetDieTime( math.Rand(1.4, 4) )
	particle:SetStartAlpha( 40 )
	particle:SetEndAlpha( 0 )
	particle:SetStartSize( math.Rand(2.4, 2.8) )
	particle:SetEndSize( math.Rand(7, 9) )
	particle:SetRoll( math.Rand(0, 10) )
	particle:SetRollDelta( math.Rand(-0.2, 0.2) )
	particle:SetVelocity( data:GetNormal() *math.random(1, 4) )
	particle:SetGravity( Vector(0, 0, 1) )

	local shade = math.random( 90, 120 )
	local add = math.random( 3, 8 )
	particle:SetColor( shade +add, shade, shade -add, 255 )
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end
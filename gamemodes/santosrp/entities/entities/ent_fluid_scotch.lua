
-----------------------------------------------------
--[[
	Name: init.lua
	For: SantosRP
	By: Ultra
]]--

if SERVER then
	AddCSLuaFile()
end

ENT.Base = "ent_base_fluid"

function ENT:ConfigInit()
	if SERVER then
		self:SetModel( "models/props_junk/garbage_glassbottle003a.mdl" )
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:SetUseType( SIMPLE_USE )
		self:PhysWake()

		self:SetFluidID( "Scotch" )
		self:SetEffect( "waterFx", Vector(-0.088151, -0.650788, 8.061775), Color(125, 110, 50, 255) )
		self:SetCarryAngles( Angle(0, 180, 0), Angle(80, 180, 0) )
	end
	
	if CLIENT then self:SetPourSound( "ambient/water/leak_1.wav" ) end
end
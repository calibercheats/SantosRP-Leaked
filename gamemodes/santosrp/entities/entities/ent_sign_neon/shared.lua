
-----------------------------------------------------
--[[
	Name: shared.lua
	For: SantosRP
	By: Ultra
]]--

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= ""
ENT.Author			= ""
ENT.Purpose			= ""
ENT.m_intMaxTextLen = 30

function ENT:SetupDataTables()
	self:NetworkVar( "Int", 0, "ColR" )
	self:NetworkVar( "Int", 1, "ColG" )
	self:NetworkVar( "Int", 2, "ColB" )

	self:NetworkVar( "Int", 3, "FontID" )
	self:NetworkVar( "String", 0, "Text" )

	self:NetworkVar( "Bool", 0, "On" )
end
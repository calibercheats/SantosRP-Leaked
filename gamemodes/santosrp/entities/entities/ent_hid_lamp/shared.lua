
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

function ENT:SetupDataTables()
	self:NetworkVar( "Bool", 0, "On" )
end
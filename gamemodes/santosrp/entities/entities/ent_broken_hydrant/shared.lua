
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
ENT.FixDuration		= 12

function ENT:SetupDataTables()
	self:NetworkVar( "Bool", 0, "WrenchAttached" )
	self:NetworkVar( "Float", 0, "AttachTime" )
end
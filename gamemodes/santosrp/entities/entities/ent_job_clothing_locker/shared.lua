
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
ENT.Purpose			= "Clothing Locker"
ENT.BlockDrag 		= true

function ENT:SetupDataTables()
	self:NetworkVar( "Int", 0, "JobID" )
end
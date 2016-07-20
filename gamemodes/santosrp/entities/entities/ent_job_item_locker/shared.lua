
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
ENT.Purpose			= "Job Item Locker"
ENT.BlockDrag 		= true

function ENT:SetupDataTables()
	self:NetworkVar( "Int", 0, "JobID" )
end

function ENT:GetItems()
	return GAMEMODE.Config.JobLockerItems[self:GetJobID()]
end
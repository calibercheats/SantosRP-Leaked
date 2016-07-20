
-----------------------------------------------------
--[[
	Name: cl_init.lua
	For: SantosRP
	By: Ultra
]]--

include "shared.lua"
local tagPos = Vector( '16.178223 1 -2.229042' )
local tagAng = Angle( 0, 90, 90 )

function ENT:Initialize()
end

function ENT:Think()
end

function ENT:Draw()
	self:DrawModel()

	if self:GetOwnerName() ~= "" then
		if self:GetPos():Distance( LocalPlayer():GetPos() ) > 1024 then return end
		cam.Start3D2D( self:LocalToWorld(tagPos), self:LocalToWorldAngles(tagAng), 0.025 )
			draw.SimpleText(
				"EVIDENCE:",
				"SRP_DoorFont",
				0,
				-64,
				color_white,
				TEXT_ALIGN_CENTER,
				TEXT_ALIGN_CENTER
			)
			draw.SimpleText(
				self:GetOwnerName(),
				"SRP_DoorFont",
				0,
				64,
				color_white,
				TEXT_ALIGN_CENTER,
				TEXT_ALIGN_CENTER
			)
		cam.End3D2D()
	end
end

net.Receive( "ItemBox", function( intMsgLen )
	GAMEMODE.Gui:ShowItemBoxMenu( net.ReadEntity(), net.ReadTable() )
end )
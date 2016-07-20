
-----------------------------------------------------
--[[
	Name: cl_init.lua
	For: SantosRP
	By: Ultra
]]--

include "shared.lua"
ENT.RenderGroup = RENDERGROUP_BOTH

local modelPos = {
	["models/props_lab/box01a.mdl"] = { pos = Vector(0, 0, 2.6), ang = Angle(0, -90, 12), scale = 0.015 },
	["models/props_junk/cardboard_box004a.mdl"] = { pos = Vector(0, 0, 4.3), ang = Angle(0, 0, 0), scale = 0.0175 },
	["models/props_junk/cardboard_box003a.mdl"] = { pos = Vector(2, 2, 4.5), ang = Angle(0, 90, 0), scale = 0.02 },
}
g_ModelPos = modelPos

function ENT:Initialize()
end

local colText = Color( 120, 230, 110, 255 )
function ENT:Draw()
	self:DrawModel()

	local posData = modelPos[self:GetModel():lower()]
	if not posData then return end
	cam.Start3D2D( self:LocalToWorld(posData.pos), self:LocalToWorldAngles(posData.ang), posData.scale )
		draw.SimpleText(
			string.Comma(self:GetMoney()).. " Chips",
			"SRP_DoorFont",
			0,
			0,
			colText,
			TEXT_ALIGN_CENTER,
			TEXT_ALIGN_CENTER
		)
	cam.End3D2D()
end
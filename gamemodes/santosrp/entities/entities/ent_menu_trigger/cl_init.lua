
-----------------------------------------------------
--[[
	Name: cl_init.lua
	For: SantosRP
	By: Ultra
]]--

include "shared.lua"
ENT.RenderGroup = RENDERGROUP_BOTH
surface.CreateFont( "MenuTriggerFont", {size = 128, weight = 425, font = "Trebuchet18"} )

function ENT:Initialize()
end

function ENT:Draw()
end

function ENT:DrawTranslucent()
	--Draw only in range
	if self:GetPos():DistToSqr( LocalPlayer():EyePos() ) > self.m_intMaxRenderRange ^2 then
		return
	end

	local old = render.GetToneMappingScaleLinear()
	render.SetToneMappingScaleLinear( Vector(1, 1, 1) )
	render.SuppressEngineLighting( true )
		local angs = self:LocalToWorldAngles( Angle(180, -90, -90) )
		local pos = self:LocalToWorld( Vector(0, 0, 0) )

		cam.Start3D2D( pos, angs, 0.03 )
			surface.SetFont( "MenuTriggerFont" )
			local w, h = surface.GetTextSize( self:GetText() )
			w = w +35
			h = h +13
			surface.SetDrawColor( 50, 50, 50, 150 )
			surface.DrawRect( -(w /2), 0, w, h )
			draw.SimpleText(
				self:GetText(),
				"MenuTriggerFont",
				0,
				0,
				color_white,
				TEXT_ALIGN_CENTER
			)
		cam.End3D2D()
	render.SuppressEngineLighting( false )
	render.SetToneMappingScaleLinear( old ) 
end
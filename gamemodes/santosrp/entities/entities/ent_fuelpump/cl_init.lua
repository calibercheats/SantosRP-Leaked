
-----------------------------------------------------
--[[
	Name: cl_init.lua
	For: SantosRP
	By: Ultra
]]--

include "shared.lua"

function ENT:Initialize()
end

function ENT:Draw()
	local normal = self:GetAngles():Forward() *-1
	local distance = normal:Dot( self:GetPos() -normal )

	local normal2 = self:GetAngles():Forward()
	local distance2 = normal2:Dot( self:GetPos() +normal2 )

	local normalUp = self:GetAngles():Up() *1
	local distanceUp = normalUp:Dot( self:GetPos() -normalUp )

	render.EnableClipping( true )
		render.PushCustomClipPlane( normal2, distance2 -24.75 ) 
		render.PushCustomClipPlane( normal, distance -0.75 )
			self:DrawModel()
		render.PopCustomClipPlane()
		render.PopCustomClipPlane()

		render.PushCustomClipPlane( normalUp, distanceUp +90 )
			self:DrawModel()
		render.PopCustomClipPlane()
	render.EnableClipping( false )

	self:DrawScreen()
end

local tierscale = { 1, 2, 2.4, 2.8 }
function ENT:DrawScreen() --830 256
	local hose = self:GetHose()
	if not IsValid( hose ) then return end
	local car = hose:GetAttached()
	if not IsValid( car ) then return end

	local tier = GAMEMODE.Cars:GetCarByUID( car:GetNWString("UID", "") )
	if tier then
		tier = tier.Tier or 1
	else
		tier = 1
	end
	
	local pos, ang = self:LocalToWorld( Vector(-2.75, -26, 75) ), self:LocalToWorldAngles( Angle(180, 270, -90) )

	cam.Start3D2D( pos, ang, 0.065 )
		surface.SetTextColor( 50, 255, 50, 255 )
		surface.SetFont( "DermaLarge" )
		surface.SetTextPos( 70, 45 )
		surface.DrawText( "Fuel: $".. GAMEMODE.Econ:ApplyTaxToSum("fuel", math.ceil(GAMEMODE.Config.BaseFuelCost *tierscale[tier])).. "/liter" )
	cam.End3D2D()
end
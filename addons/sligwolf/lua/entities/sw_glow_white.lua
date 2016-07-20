
-----------------------------------------------------
AddCSLuaFile()
local BaseClass = baseclass.Get( "base_gmodentity" )

ENT.Spawnable			= false
ENT.RenderGroup 		= RENDERGROUP_BOTH

local matLight 			= Material( "sprites/light_ignorez" )

function ENT:TurnOn( set )
	self:SetNetworkedBool( "Enabled", set )
end

function ENT:IsOn()
	return self:GetNetworkedVar( "Enabled", true )
end

function ENT:Initialize()
	self:TurnOn( false )
	
	if CLIENT then
		self.PixVis = util.GetPixelVisibleHandle()
	end
end

function ENT:Toggle()
	if self:IsOn() then
		self:TurnOn( false )
		return
	end
	self:TurnOn( true )
end

function ENT:DrawTranslucent()
	BaseClass.DrawTranslucent( self )
	if ( !self:IsOn() ) then return end
	
	local L_Pos = self:GetPos()
	local Col_1 = Color(255, 255, 255, 100)
	local Col_2 = Color(255, 255, 255, 200)
	
	local L_Nrm = self:GetAngles():Forward()
	local View_Nrm = self:GetPos() - EyePos()
	View_Nrm:Normalize()
	local ViewDot = View_Nrm:Dot( L_Nrm * -1 )

	if ( ViewDot >= 0 ) then
		render.SetMaterial( matLight )
		local Visibile	= util.PixelVisible( L_Pos, 4, self.PixVis )
		if ( !Visibile || Visibile < 0.1 ) then return end
			
		render.DrawSprite( L_Pos, 70, 70, Col_1, Visibile )
		render.DrawSprite( L_Pos, 50, 50, Col_2, Visibile )
	end
end
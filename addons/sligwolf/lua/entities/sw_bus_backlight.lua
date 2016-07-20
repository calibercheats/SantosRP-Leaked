
-----------------------------------------------------
AddCSLuaFile()

ENT.Type				= "anim"
ENT.Base 				= "base_anim"
ENT.Spawnable			= false
ENT.AdminSpawnable		= false
ENT.RenderGroup 		= RENDERGROUP_BOTH

local matLight 		= Material( "sprites/light_ignorez" )

function ENT:TurnOn( set )
	self:SetNetworkedBool( "Enabled", set )
end

function ENT:IsOn()
	return self:GetNetworkedVar( "Enabled", true )
end

function ENT:Initialize()
	self:TurnOn( false )
end

function ENT:Toggle()
	if self.__SW_On == true then
		self.__SW_On = nil
		self:TurnOn( false )
		return
	end
	
	self:TurnOn( true )
	self.__SW_On = true
end

if CLIENT then

function ENT:Initialize()
	self.PixVis = util.GetPixelVisibleHandle()
end

function ENT:DrawTranslucent()
	self.BaseClass.DrawTranslucent( self )
	if ( !self:IsOn() ) then return end

	local LightAng = self.Entity:GetAngles()
	local LightForward = LightAng:Forward()
	local LightRight = LightAng:Right()
	local LightUp = LightAng:Up()
	
	local ViewNormal = self.Entity:GetPos() - EyePos()
	local Distance = ViewNormal:Length()
	
	ViewNormal:Normalize()
	local ViewDot = ViewNormal:Dot( LightUp )
	local LightPos = self.Entity:GetPos()

	if ( ViewDot >= 0 ) then
		render.SetMaterial( matLight )

		local Visibile	= util.PixelVisible( LightPos, 16, self.PixVis )	
		if (!Visibile) then return end
		
		local Size = math.Clamp( Distance * Visibile * ViewDot * 2, 64, 512 )
		Distance = math.Clamp( Distance, 32, 512 )
				
		render.DrawSprite( LightPos - LightForward*0 - LightRight*36 + LightUp*0, 50, 50, Color(255, 0, 0, 150), Visibile * ViewDot )
		render.DrawSprite( LightPos - LightForward*0 + LightRight*36 + LightUp*0, 50, 50, Color(255, 0, 0, 150), Visibile * ViewDot )
		render.DrawSprite( LightPos - LightForward*0 - LightRight*44 + LightUp*0, 50, 50, Color(255, 0, 0, 150), Visibile * ViewDot )
		render.DrawSprite( LightPos - LightForward*0 + LightRight*44 + LightUp*0, 50, 50, Color(255, 0, 0, 150), Visibile * ViewDot )
	end
	
end

end


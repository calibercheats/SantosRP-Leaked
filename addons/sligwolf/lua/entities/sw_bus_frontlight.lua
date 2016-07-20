
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
	if ( self.flashlight ) then
		SafeRemoveEntity( self.flashlight )
		self.flashlight = nil
		self:TurnOn( false )
		return
	end
	
	self:TurnOn( true )
	
	self.flashlight = ents.Create( "env_projectedtexture" )
	self.flashlight:SetParent( self.Entity )	
	self.flashlight:SetLocalPos( Vector( 0,0,0 ) )
	self.flashlight:SetLocalAngles( Angle( 90,0,0 ) )
	self.flashlight:SetKeyValue( "enableshadows", 1 )
	self.flashlight:SetKeyValue( "farz", 1024 )
	self.flashlight:SetKeyValue( "nearz", 8 )
	self.flashlight:SetKeyValue( "lightfov", 120 )
	self.flashlight:SetKeyValue( "lightcolor", "255 255 255" )
	self.flashlight:Spawn()
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
			
		render.DrawSprite( LightPos + LightForward*0 - LightRight*40 - LightUp*3, Size*0.8, Size*0.8, Color(255, 255, 255, 100), Visibile * ViewDot )
		render.DrawSprite( LightPos + LightForward*0 + LightRight*40 - LightUp*3, Size*0.8, Size*0.8, Color(255, 255, 255, 100), Visibile * ViewDot )
		render.DrawSprite( LightPos - LightForward*0 - LightRight*30 - LightUp*3, Size*0.4, Size*0.4, Color(255, 255, 255, 100), Visibile * ViewDot )
		render.DrawSprite( LightPos - LightForward*0 + LightRight*30 - LightUp*3, Size*0.4, Size*0.4, Color(255, 255, 255, 100), Visibile * ViewDot )
	end
	
end

end



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
	self:SetRenderMode( RENDERMODE_NORMAL )
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
	self.flashlight:SetLocalPos( Vector(0,0, 0 ) )
	self.flashlight:SetLocalAngles( Angle(0,0,0) )
	self.flashlight:SetKeyValue( "enableshadows", 1 )
	self.flashlight:SetKeyValue( "farz", 2048 )
	self.flashlight:SetKeyValue( "nearz", 12 )
	self.flashlight:SetKeyValue( "lightfov", 120 )
	self.flashlight:SetKeyValue( "lightcolor", "255 255 255" )
	self.flashlight:Spawn()

end
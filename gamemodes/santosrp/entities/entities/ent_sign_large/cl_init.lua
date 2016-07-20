
-----------------------------------------------------
--[[
	Name: cl_init.lua
	For: SantosRP
	By: Ultra
]]--

include "shared.lua"

surface.CreateFont( "SignLargeFont", {
	size = 82,
	font = "Chawp",
	weight = 500,
} )

function ENT:Initialize()
	self:DestroyShadow()
	self.m_vecCamPos = Vector( 11.5, 12.5, 47.75 )
	self.m_angCamAng = Angle( 0, -90, 74.5 )

	if g_LargeSignEntCache[self:EntIndex()] then
		self:SetText( g_LargeSignEntCache[self:EntIndex()] or "" )
	end
end

function ENT:WrapString( strText, intLimit, strIndent, indent1 )
	strIndent = strIndent or ""
	indent1 = indent1 or strIndent
	intLimit = intLimit or 72

	local here = 1 -#indent1
	return indent1.. strText:gsub( "(%s+)()(%S+)()", function( sp, st, word, fi )
		if fi -here > intLimit then
			here = st -#strIndent
			return "\n".. strIndent.. word
		end
	end )
end

function ENT:SetText( strText )
	if strText:len() > self.m_intMaxTextLen then return end
	self.m_strText = strText
	self.m_tblExplodedText = string.Explode( "\n", self.m_strText )
	self.m_tblExplodedPreviewText = nil

	if ValidPanel( g_LargeSignMenu ) then
		g_LargeSignMenu:Close()
	end

	if #self.m_tblExplodedText > self.m_intMaxLines then
		self.m_tblExplodedText = nil
		self.m_strDrawText = nil
		return
	end
end

function ENT:GetText()
	return self.m_strText or ""
end

local MAT_BG = Material( "santosrp/large_sign_bkg.png", "noclamp smooth" )
function ENT:RenderText()
	if self:GetPos():Distance( LocalPlayer():GetPos() ) > GAMEMODE.Config.RenderDist_Level2 then return end

	render.PushFilterMag( TEXFILTER.POINT )
	render.PushFilterMin( TEXFILTER.POINT ) 
		cam.Start3D2D( self:LocalToWorld(self.m_vecCamPos), self:LocalToWorldAngles(self.m_angCamAng), 0.0296 )
			render.ClearStencil()
			render.SetStencilEnable( true )
			render.SetStencilReferenceValue( 1 )
			render.SetStencilTestMask( 1 )
			render.SetStencilWriteMask( 1 )

			render.SetStencilCompareFunction( STENCILCOMPARISONFUNCTION_NEVER )
			render.SetStencilFailOperation( STENCILOPERATION_REPLACE )
			render.SetStencilPassOperation( STENCILOPERATION_REPLACE )
			render.SetStencilZFailOperation( STENCILOPERATION_REPLACE )

			surface.SetDrawColor( 30, 30, 30, 255 )
			surface.DrawRect( 0, 0, 845, 1480 )

			render.SetStencilCompareFunction( STENCILCOMPARISONFUNCTION_EQUAL )
			render.SetStencilFailOperation( STENCILOPERATION_KEEP )
			render.SetStencilPassOperation( STENCILOPERATION_KEEP )
			render.SetStencilZFailOperation( STENCILOPERATION_KEEP )
				surface.SetDrawColor( 255, 255, 255, 255 )
				surface.SetMaterial( MAT_BG )
				surface.DrawTexturedRect( 0, 0, 845, 1480 )

				local yPos, w, h = 0, nil, nil
				for k, v in pairs( self.m_tblExplodedPreviewText or (self.m_tblExplodedText or {}) ) do
					draw.SimpleText(
						v,
						"SignLargeFont",
						15,
						yPos,
						self.m_colTextColor,
						TEXT_ALIGN_LEFT,
						TEXT_ALIGN_LEFT
					)

					surface.SetFont( "SignLargeFont" )
					w, h = surface.GetTextSize( v )
					yPos = yPos +h
				end
			render.SetStencilEnable( false )
		cam.End3D2D()
	render.PopFilterMin()
	render.PopFilterMag()
end

function ENT:Draw()
	self:DrawModel()
	self:RenderText()
end

function ENT:RequestSetText( strText )
	GAMEMODE.Net:RequestSetLargeSignText( self, strText )
end

g_LargeSignEntCache = g_LargeSignEntCache or {}
GAMEMODE.Net:RegisterEventHandle( "ent", "lsgn_sndt", function( intMsgLen, pPlayer )
	local entIndex = net.ReadUInt( 16 )
	local text = net.ReadString()
	g_LargeSignEntCache[entIndex] = text

	local ent = ents.GetByIndex( entIndex )
	if IsValid( ent ) and ent:GetClass() == "ent_sign_large" and ent.SetText then
		ent:SetText( text )
	end
end )

GAMEMODE.Net:RegisterEventHandle( "ent", "lsgn_sm", function( intMsgLen, pPlayer )
	if ValidPanel( g_LargeSignMenu ) then
		g_LargeSignMenu:Remove()
	end

	g_LargeSignMenu = vgui.Create( "SRPLargeSignMenu" )
	g_LargeSignMenu:SetTitle( "Sign Menu" )
	g_LargeSignMenu:SetSize( 450, 480 )
	g_LargeSignMenu:SetPos( ScrW() *0.1, (ScrH() /2) -(g_LargeSignMenu:GetTall() /2) )
	g_LargeSignMenu:SetEntity( net.ReadEntity() )
	g_LargeSignMenu:SetVisible( true )
	g_LargeSignMenu:MakePopup()
end )

function GAMEMODE.Net:RequestSetLargeSignText( entSign, strText )
	self:NewEvent( "ent", "lsgn_st" )
		net.WriteEntity( entSign )
		net.WriteString( strText )
	self:FireEvent( pPlayer )
end
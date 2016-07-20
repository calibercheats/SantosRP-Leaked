
-----------------------------------------------------
--[[
	Name: cl_menu_neon_sign.lua
	For: SantosRP
	By: Ultra
]]--

local fonts = {
	[0] = { Name = "Clip", blur = "NeonSignFont_Clip_Blur_128px", text = "NeonSignFont_Clip_128px", preview = "NeonSignFont_Clip_26px" },
	[1] = { Name = "Beon", blur = "NeonSignFont_Beon_Blur_128px", text = "NeonSignFont_Beon_128px", preview = "NeonSignFont_Beon_26px" },
	[2] = { Name = "Mexcellent", blur = "NeonSignFont_Mexcellent_Blur_128px", text = "NeonSignFont_Mexcellent_128px", preview = "NeonSignFont_Mexcellent_26px" },
}

local Panel = {}
function Panel:Init()
	self:SetTitle( "Sign Menu" )
	self.m_intFontID = 0

	self.m_pnlApplyBtn = vgui.Create( "SRP_Button", self )
	self.m_pnlApplyBtn:SetFont( "CarMenuFont" )
	self.m_pnlApplyBtn:SetText( "Apply" )
	self.m_pnlApplyBtn:SetAlpha( 150 )
	self.m_pnlApplyBtn.DoClick = function()
		self.m_entSign:RequestSetText( self.m_pnlText:GetValue(), self.m_intFontID )
	end

	self.m_pnlFontBtn = vgui.Create( "SRP_Button", self )
	self.m_pnlFontBtn:SetFont( "CarMenuFont" )
	self.m_pnlFontBtn:SetText( "Pick Font" )
	self.m_pnlFontBtn:SetAlpha( 150 )
	self.m_pnlFontBtn.DoClick = function()
		local context = DermaMenu( self )
		for i = 0, #fonts do
			context:AddOption( fonts[i].Name, function()
				self.m_pnlText:SetFontInternal( fonts[i].preview )
				self.m_intFontID = i
			end )
		end

		context:Open()
	end

	self.m_pnlText = vgui.Create( "DTextEntry", self )
	self.m_pnlText:SetMultiline( false )
	self.m_pnlText:SetFont( "DermaLarge" )
	self.m_pnlText:SetFont( fonts[self.m_intFontID or 0].preview )
	self.m_pnlText:SetTextColor( Color(0, 0, 0, 255) )

	function self.m_pnlText.ApplySchemeSettings( pnl )
		pnl:SetFontInternal( fonts[self.m_intFontID or 0].preview )
	end

	function self.m_pnlText:AllowInput( intKey )
		if string.len( self:GetValue() or "" ) >= 30 then
			return true
		end
	end
end

function Panel:SetEntity( eEnt )
	if not eEnt.GetText then return end
	self.m_entSign = eEnt
	self.m_pnlText:SetValue( eEnt:GetText() )
	self.m_pnlText:SetFont( fonts[eEnt:GetFontID()].preview )
	self.m_intFontID = eEnt:GetFontID()
end

function Panel:Think()
	if not IsValid( self.m_entSign ) then
		self:Remove()
	end
end

function Panel:PerformLayout( intW, intH )
	DFrame.PerformLayout( self, intW, intH )

	self.m_pnlApplyBtn:SetSize( intW /2, 32 )
	self.m_pnlApplyBtn:SetPos( 0, intH -self.m_pnlApplyBtn:GetTall() )

	self.m_pnlFontBtn:SetSize( intW /2, 32 )
	self.m_pnlFontBtn:SetPos( intW /2, intH -self.m_pnlFontBtn:GetTall() )

	self.m_pnlText:SetPos( 0, 24 )
	self.m_pnlText:SetSize( intW, intH -24 -self.m_pnlApplyBtn:GetTall() )
end
vgui.Register( "SRPNeonSignMenu", Panel, "SRP_Frame" )
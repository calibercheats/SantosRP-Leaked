
-----------------------------------------------------
--[[
	Name: cl_menu_citywork_van.lua
	For: SantosRP
	By: Ultra
]]--

local Panel = {}
function Panel:Init()
	self:SetTitle( "City Van" )
	self:SetDeleteOnClose( false )

	self.m_pnlInvLabel = vgui.Create( "DLabel", self )
	self.m_pnlInvLabel:SetExpensiveShadow( 2, Color(0, 0, 0, 255) )
	self.m_pnlInvLabel:SetTextColor( Color(255, 255, 255, 255) )
	self.m_pnlInvLabel:SetFont( "Trebuchet24" )
	self.m_pnlInvLabel:SetText( "Inventory" )
	self.m_pnlInvLabel:SizeToContents()

	self.m_pnlLockerLabel = vgui.Create( "DLabel", self )
	self.m_pnlLockerLabel:SetExpensiveShadow( 2, Color(0, 0, 0, 255) )
	self.m_pnlLockerLabel:SetTextColor( Color(255, 255, 255, 255) )
	self.m_pnlLockerLabel:SetFont( "Trebuchet24" )
	self.m_pnlLockerLabel:SetText( "Van" )
	self.m_pnlLockerLabel:SizeToContents()

	self.m_pnlInventoryList = vgui.Create( "SRP_ScrollPanel", self )
	self.m_pnlInventoryList.Paint = function( _, intW, intH )
		surface.SetDrawColor( 50, 50, 50, 100 )
		surface.DrawRect( 0, 0, intW, intH )
	end

	self.m_pnlLockerList = vgui.Create( "SRP_ScrollPanel", self )
	self.m_pnlLockerList.Paint = function( _, intW, intH )
		surface.SetDrawColor( 50, 50, 50, 100 )
		surface.DrawRect( 0, 0, intW, intH )
	end

	self.m_tblInvItems = {}
	self.m_tblLockerItems = {}

	hook.Add( "GamemodeRefreshCityWorkVanMenu", "UpdateLockerMenu", function()
		if not ValidPanel( self ) then return end
		if not self:IsVisible() then return end
		self:Refresh()
	end )
end

function Panel:SetEntity( eEnt )
	self.m_entTarget = eEnt
end

function Panel:Refresh()
	local van = LocalPlayer():GetEyeTrace().Entity
	if not IsValid( van ) or van:GetClass() ~= "prop_vehicle_jeep" then return end
	self:SetEntity( van )

	local items = {}
	for k, v in pairs( GAMEMODE.Jobs:GetJobByID(JOB_CITYWORKER).VanItems ) do
		if GAMEMODE.Inv:PlayerHasItem( k, v ) then continue end
		if GAMEMODE.Inv:PlayerHasItemEquipped( LocalPlayer(), k ) then continue end
		local diff = math.max( v -(LocalPlayer():GetInventory()[k] or 0), 0 )
		if diff <= 0 then continue end
		items[k] = diff
	end

	self:Populate( items )
end

function Panel:Populate( tblItems )
	for k, v in pairs( self.m_tblInvItems ) do
		if ValidPanel( v ) then v:Remove() end
	end
	for k, v in pairs( self.m_tblLockerItems ) do
		if ValidPanel( v ) then v:Remove() end
	end

	self.m_tblInvItems = {}
	self.m_tblLockerItems = {}	
	self.m_tblCurContents = tblItems

	for k, v in SortedPairs( LocalPlayer():GetInventory() ) do
		if not GAMEMODE.Inv:ValidItem( k ) then continue end
		if not GAMEMODE.Jobs:GetJobByID(JOB_CITYWORKER).VanItems[k] then continue end
		
		local pnl = vgui.Create( "SRPQMenuItemCard", self.m_pnlInventoryList )
		pnl.BuildTrayButtons = function( pnl )
			pnl.m_pnlBtnTray:Clear()
			if not pnl.m_tblItem then return end
			
			local takeBtn = vgui.Create( "SRP_Button", pnl.m_pnlBtnTray )
			takeBtn:SetText( "Move To Locker" )
			takeBtn.DoClick = function()
				GAMEMODE.Net:CityWorker_RequestMoveJobItemToVan( self.m_entTarget, k, 1 )
			end
			takeBtn.DoRightClick = function()
				local dMenu = DermaMenu()
				dMenu:AddOption( "Move 5", function() GAMEMODE.Net:CityWorker_RequestMoveJobItemToVan( self.m_entTarget, k, 5 ) end )
				dMenu:AddOption( "Move 10", function() GAMEMODE.Net:CityWorker_RequestMoveJobItemToVan( self.m_entTarget, k, 10 ) end )
				dMenu:AddOption( "Move 15", function() GAMEMODE.Net:CityWorker_RequestMoveJobItemToVan( self.m_entTarget, k, 15 ) end )
				dMenu:AddOption( "Move 25", function() GAMEMODE.Net:CityWorker_RequestMoveJobItemToVan( self.m_entTarget, k, 25 ) end )
				dMenu:AddOption( "Move 50", function() GAMEMODE.Net:CityWorker_RequestMoveJobItemToVan( self.m_entTarget, k, 50 ) end )
				dMenu:Open()
			end
			table.insert( pnl.m_tblTrayBtns, takeBtn )

			pnl.m_pnlBtnTray:InvalidateLayout()
		end
		pnl:SetItemID( k )
		pnl:SetItemAmount( v )

		table.insert( self.m_tblInvItems, pnl )
	end

	for k, v in SortedPairs( tblItems or {} ) do
		if not GAMEMODE.Inv:ValidItem( k ) then continue end
		
		local pnl = vgui.Create( "SRPQMenuItemCard", self.m_pnlLockerList )
		pnl.BuildTrayButtons = function( pnl )
			pnl.m_pnlBtnTray:Clear()
			if not pnl.m_tblItem then return end
			
			local takeBtn = vgui.Create( "SRP_Button", pnl.m_pnlBtnTray )
			takeBtn:SetText( "Move To Inventory" )
			takeBtn.DoClick = function()
				GAMEMODE.Net:CityWorker_RequestMoveJobItemFromVan( self.m_entTarget, k, 1 )
			end
			takeBtn.DoRightClick = function()
				local dMenu = DermaMenu()
				dMenu:AddOption( "Move 5", function() GAMEMODE.Net:CityWorker_RequestMoveJobItemFromVan( self.m_entTarget, k, 5 ) end )
				dMenu:AddOption( "Move 10", function() GAMEMODE.Net:CityWorker_RequestMoveJobItemFromVan( self.m_entTarget, k, 10 ) end )
				dMenu:AddOption( "Move 15", function() GAMEMODE.Net:CityWorker_RequestMoveJobItemFromVan( self.m_entTarget, k, 15 ) end )
				dMenu:AddOption( "Move 25", function() GAMEMODE.Net:CityWorker_RequestMoveJobItemFromVan( self.m_entTarget, k, 25 ) end )
				dMenu:AddOption( "Move 50", function() GAMEMODE.Net:CityWorker_RequestMoveJobItemFromVan( self.m_entTarget, k, 50 ) end )
				dMenu:Open()
			end
			table.insert( pnl.m_tblTrayBtns, takeBtn )

			pnl.m_pnlBtnTray:InvalidateLayout()
		end
		pnl:SetItemID( k )
		pnl:SetItemAmount( v )

		table.insert( self.m_tblLockerItems, pnl )
	end

	self:InvalidateLayout()
end

function Panel:PerformLayout( intW, intH )
	DFrame.PerformLayout( self, intW, intH )
	local padding = 0
	local half = intW /2

	self.m_pnlInvLabel:SetPos( 5, 28 )
	self.m_pnlLockerLabel:SetPos( intW -self.m_pnlLockerLabel:GetWide() -5, 28 )

	self.m_pnlInventoryList:SetSize( half -(padding *2), intH -28 -self.m_pnlInvLabel:GetTall() -padding )
	self.m_pnlInventoryList:SetPos( padding, 28 +self.m_pnlInvLabel:GetTall() +padding )

	self.m_pnlLockerList:SetSize( half -(padding *2), intH -28 -self.m_pnlInvLabel:GetTall() -padding -padding )
	self.m_pnlLockerList:SetPos( padding +half, 28 +self.m_pnlInvLabel:GetTall() +padding )

	for _, pnl in pairs( self.m_tblInvItems ) do
		pnl:DockMargin( 0, 0, 0, 5 )
		pnl:SetTall( 48 )
		pnl:Dock( TOP )
	end

	for _, pnl in pairs( self.m_tblLockerItems ) do
		pnl:DockMargin( 0, 0, 0, 5 )
		pnl:SetTall( 48 )
		pnl:Dock( TOP )
	end
end

function Panel:Open()
	self:Refresh()
	self:SetVisible( true )
	self:MakePopup()
end
vgui.Register( "SRPCityWorkerVanMenu", Panel, "SRP_Frame" )
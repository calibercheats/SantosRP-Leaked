
-----------------------------------------------------
local function LoadSkin()

	local CKSKIN = {}

	CKSKIN.DermaVersion	= 1
	CKSKIN.GwenTexture	= Material( "gwenskin/GModDefault.png" )

	-- credits: http://lua.2524044.n2.nabble.com/COW-lazy-copying-of-lua-tables-tp7305645p7305793.html
	local function makeRecursiveCOW(o)
	    return setmetatable({}, {
	        __index = function(t, key)
				local v = o[key]
				if type(v) == "table" then
					v = makeRecursiveCOW(v)
				end
				rawset(t, key, v)
				return v
			end,
	        __newindex =
	            function(t, k, v)
	                setmetatable(t, nil)
	                for ck, cv in pairs(o) do t[ck] = cv end
	                t[k] = v
	            end,
	    })
	end

	-- default skin table (or darkrp skin table) is global
	local defaultColors = SKIN and SKIN.Colours

	CKSKIN.Colours = makeRecursiveCOW(defaultColors)
	CKSKIN.Colours.Label.Default = Color(0, 0, 0)

	CKSKIN.Colours.Button.Normal = Color(230, 230, 230)
	CKSKIN.Colours.Button.Hover = Color(230, 230, 230)
	CKSKIN.Colours.Button.Down = Color(230, 230, 230)

	function CKSKIN:PaintFrame(panel, w, h)
		surface.SetDrawColor(255, 255, 255)
		surface.DrawRect(0, 0, w, h)

		surface.SetDrawColor(127, 127, 127)
		surface.DrawOutlinedRect(0, 0, w, h)

		surface.SetDrawColor(50, 50, 50)
		surface.DrawRect(0, 0, w, 25)
	end

	function CKSKIN:PaintButtonBg(panel, w, h)
		if panel.Depressed or panel:IsSelected() or panel:GetToggle() then
			-- TODO
		elseif ( panel:GetDisabled() ) then
			surface.SetDrawColor(170, 170, 170)
		elseif ( panel.Hovered ) then
			surface.SetDrawColor(100, 100, 100)
		else
			surface.SetDrawColor(50, 50, 50)
		end
		surface.DrawRect(0, 0, w, h)
	end

	function CKSKIN:PaintButton(panel, w, h)
		-- dont draw image buttons
		if panel:GetText() == "" then return end

		self:PaintButtonBg(panel, w, h)

		surface.SetDrawColor(0, 0, 0)
		surface.DrawOutlinedRect(0, 0, w, h)
	end

	function CKSKIN:PaintPropertySheet(panel, w, h)
		local activeTab = panel:GetActiveTab()

		local yOffset = 0
		local xSegment0s, xSegment0e = 0, w
		local xSegment1s, xSegment1e = 0, 0
		if activeTab then
			yOffset = activeTab:GetTall() - 6
			xSegment0s, xSegment0e = 0, activeTab:GetPos()
			xSegment1s, xSegment1e = activeTab:GetPos() + activeTab:GetWide() - 2, w
		end

		surface.SetDrawColor(127, 127, 127)

		-- draw bottom, left, right
		surface.DrawLine(0, h-1, w, h-1)
		surface.DrawLine(0, yOffset, 0, h)
		surface.DrawLine(w-1, yOffset, w-1, h)

		-- draw top segments
		surface.DrawLine(xSegment0s, yOffset, xSegment0e, yOffset)
		surface.DrawLine(xSegment1s, yOffset, xSegment1e, yOffset)
	end

	function CKSKIN:PaintTab(panel, w, some_h)
		local isActive = panel:GetPropertySheet():GetActiveTab() == panel

		local h = some_h + (isActive and -5 or 3)
		
		self:PaintButtonBg(panel, w, h)

		if isActive then
			surface.SetDrawColor(127, 127, 127)
			surface.DrawLine(0, 0, w, 0)
			surface.DrawLine(0, 0, 0, h)
			surface.DrawLine(w-1, 0, w-1, h)
		end
	end

	derma.DefineSkin("CasinoKit", "cool skin", CKSKIN)
end

concommand.Add("casinokit_reloadskin", LoadSkin)

-- hack because default derma skin isn't loaded on file load
hook.Add("InitPostEntity", "CasinoKit_InitDermaSkin", LoadSkin)

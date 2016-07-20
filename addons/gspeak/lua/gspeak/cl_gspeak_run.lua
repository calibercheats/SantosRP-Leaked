
-----------------------------------------------------
surface.CreateFont("CaptureItBug", {font = "Capture it", size= 100 } )
surface.CreateFont("CaptureItSmall", {font = "Capture it", size= 40 } )
surface.CreateFont("CaptureItTiny", {font = "Capture it", size= 20 } )
local gspeak_off = Material( "gspeak/gspeak_off.png", "noclamp unlitgeneric" )
local gspeak_error = Material( "gspeak/gspeak_error.png", "noclamp unlitgeneric" )
local gspeak_loading = Material( "gspeak/gspeak_loading.png", "noclamp unlitgeneric" )
local gspeak_talk_1 = Material( "gspeak/gspeak_talk_1.png", "noclamp unlitgeneric" )
local gspeak_talk_2 = Material( "gspeak/gspeak_talk_2.png", "noclamp unlitgeneric" )
local gspeak_talk_3 = Material( "gspeak/gspeak_talk_3.png", "noclamp unlitgeneric" )
local gspeak_talk_ui_1 = Material( "gspeak/gspeak_talk_ui_1.png", "noclamp unlitgeneric" )
local gspeak_talk_ui_2 = Material( "gspeak/gspeak_talk_ui_2.png", "noclamp unlitgeneric" )
local gspeak_talk_ui_3 = Material( "gspeak/gspeak_talk_ui_3.png", "noclamp unlitgeneric" )
local gspeak_logo = Material( "gspeak/gspeak_logo.png", "noclamp unlitgeneric" )
gspeak_radio_back = Material( "gspeak/gspeak_radio_back.png", "noclamp unlitgeneric" )
local white = Color(255,255,255,255)
local thendonid = "STEAM_0:1:17812103"

gspeak.players = {}
gspeak.radios = {}
gspeak.cl_settings = {}
gspeak.running = false
gspeak.failed = false
gspeak.start_talking = false
gspeak.tm_tab = 0
gspeak.tslib = { version = 0, req = 1500, max = 1600, wrongVersion = false }
gspeak.TS = { version = 0, req = 1500,  max = 1600, connected = false, inChannel = false, failed = false }
gspeak.loadanim = { last = 0, state = {0, 0, 0, 0}, dir = 0.1, active = 1 }
gspeak.player = { standing = Vector(0,0,60), crouching = Vector(0,0,40), dead = Vector(0,0,0) }
gspeak.dead_muted = false

sound.Add( {
	name = "radio_1337",
	channel = CHAN_ITEM,
	volume = 1.0,
	level = 60,
	pitch = 100,
	sound = "gspeak/radio_1337.wav"
} )

//********************************************
//								FUNCTIONS
//********************************************

function gspeak:save_settings()
	file.Write("gspeak/settings.txt", util.TableToJSON(gspeak.cl_settings))
end

function gspeak:read_server_settings()
	gspeak.settings = net.ReadTable()
	if gspeak.TS.connected then
		tslib.sendSettings(gspeak.settings["distance"][1], gspeak.settings["distance"][2], gspeak.settings["distance"][3], gspeak.settings["radio_start"], gspeak.settings["radio_stop"], gspeak.settings["password"])
	end
	local cl_change = false
	if !gspeak.cl_settings["talkmode"] then
		cl_change = true
		gspeak.cl_settings["talkmode"] = gspeak.settings["def_mode"]
	end
	if !gspeak.cl_settings["key"] then
		cl_change = true
		gspeak.cl_settings["key"] = gspeak.settings["def_key"]
	end
	if !gspeak.cl_settings["radio_key"] then
		cl_change = true
		gspeak.cl_settings["radio_key"] = gspeak.settings["def_radio_key"]
	end
	if cl_change then
		gspeak:save_settings()
	end
end

function gspeak:change_talkmode( talkmode )
	if talkmode <= 3 then
		gspeak.cl_settings["talkmode"] = talkmode
	else
		gspeak.cl_settings["talkmode"] = 1
	end
	net.Start( "ts_talkmode" )
		net.WriteInt( gspeak.cl_settings["talkmode"], 4 )
	net.SendToServer()
	--tslib.sendClientTalkmode(gspeak.cl_settings["talkmode"]) No Reason yet
	chat.AddText( Color( 255, 0, 0 ), "[Gspeak]",  Color( 0, 0, 0 ), " mode: ", Color( 0, 255, 0 ), gspeak.settings["distance_n"][gspeak.cl_settings["talkmode"]] )
end

function gspeak:ts_talking( trigger )
	LocalPlayer().talking = trigger
	gspeak.start_talking = trigger
	net.Start("ts_talking")
		net.WriteBool( trigger )
	net.SendToServer()
end

function gspeak:get_talkmode( ply )
	if ply == LocalPlayer() then return gspeak.cl_settings["talkmode"] end
	if !ply:Alive() then return 2	end
	if ply.talkmode != nil then	return ply.talkmode	end
	return gspeak.settings["def_mode"]
end

function gspeak:get_max_distance( ply )
	local talkmode = gspeak:get_talkmode( ply )
	return gspeak.settings["distance"][talkmode]
end

function gspeak:set_tsid( ts_id )
	if ts_id < 0 then
		gspeak.TS.connected = false
	end
	net.Start("ts_id")
		net.WriteInt(ts_id, 32)
	net.SendToServer()
end

function gspeak:get_tsid(ply)
    local ts_id = ply.ts_id or -1
    ply.req_it = ply.req_it or 1
    if ts_id == -1 then ply.req_it = ply.req_it + 1 end
    if ply.req_it > 1000 then
        gspeak:request_ts_id( ply, ts_id )
        ply.req_it = 1
    end
    return ply.ts_id or -1
end

function gspeak:checkConnection()
	if gspeak.TS.connected then
		gspeak.TS.version = tslib.getGspeakVersion()
		if gspeak.TS.version == -1 then	gspeak.TS.connected = false end --closed Teamspeak3
		return
	elseif tslib.connectTS() == true then
		if !IsValid(LocalPlayer()) then return end
		gspeak.TS.version = tslib.getGspeakVersion()
		if gspeak.TS.version == -1 or gspeak.TS.version == 0 then return end
		if gspeak.TS.version < gspeak.TS.req or gspeak.TS.version > gspeak.TS.max then gspeak.TS.failed = true return end

		net.Start( "ts_talkmode" )
			net.WriteInt( gspeak.cl_settings["talkmode"], 4 )
		net.SendToServer()

		tslib.delAll()
		tslib.sendClientPos( 0, 0, 0, 0, 0, 0)
		tslib.sendSettings(gspeak.settings["distance"][1], gspeak.settings["distance"][2], gspeak.settings["distance"][3], gspeak.settings["radio_start"], gspeak.settings["radio_stop"], gspeak.settings["password"])

		gspeak.TS.failed = false
		gspeak.TS.connected = true
	end
end

function gspeak:request_init()
	net.Start("gspeak_request_init")
	net.SendToServer()
end

function gspeak:DrawText(text, x, y, ColorTable)
	local text_l = string.len(text)*23+64
	draw.RoundedBox(8, x-text_l, y-10, text_l, 60, Color(50, 50, 50, 155))
	draw.DrawText( text, "CaptureItSmall", x+15-text_l, y, ColorTable, TEXT_ALIGN_LEFT )
end

function gspeak:DrawLoading(x, y, offset, size, color)
	local now = CurTime()
	if gspeak.loadanim.last < now - 0.01 then
		gspeak.loadanim.last = now
		if gspeak.loadanim.state[gspeak.loadanim.active] > 0.9 then
			gspeak.loadanim.dir = -0.1
		elseif gspeak.loadanim.state[gspeak.loadanim.active] < 0.1 then
			gspeak.loadanim.dir = 0.1
			gspeak.loadanim.active = gspeak.loadanim.active + 1
			if gspeak.loadanim.active > 4 then gspeak.loadanim.active = 1 end
		end
		gspeak.loadanim.state[gspeak.loadanim.active] =	gspeak.loadanim.state[gspeak.loadanim.active] + gspeak.loadanim.dir
	end

	surface.SetDrawColor( color )
	surface.SetMaterial( gspeak_loading )
	surface.DrawTexturedRect( x, y+gspeak.loadanim.state[1]*offset*(-1), size, size)
	surface.SetMaterial( gspeak_loading )
	surface.DrawTexturedRect( x+offset, y+gspeak.loadanim.state[2]*offset*(-1), size, size)
	surface.SetMaterial( gspeak_loading )
	surface.DrawTexturedRect( x+offset*2, y+gspeak.loadanim.state[3]*offset*(-1), size, size)
end

function gspeak:VersionWord( plugin )
	if plugin.version >= plugin.max then
		return "downgrade to"
	elseif plugin.version < plugin.req then
		print(plugin.version..plugin.req)
		return "update to"
	end
	return "install"
end

function gspeak:DrawStatus()
	if gspeak.TS.inChannel then return end

	local red = Color(255,0,0,255)
	local yellow = Color(255,255,0,255)
	local green = Color(0,255,0,255)
	local diffY = 40
	local sizeX = 320
	local sizeY = 200
	local posX = ScrW() * gspeak.settings["HUDx_s"]
	local posY = ScrH() * gspeak.settings["HUDy_s"]

	if gspeak.settings["HUDa_s"] == "tr" then
		posX = ScrW() - posX - sizeX
	elseif gspeak.settings["HUDa_s"] == "bl" then
		posY = ScrH() - posY - sizeY
	elseif gspeak.settings["HUDa_s"] == "br" then
		posX = ScrW() - posX - sizeX
		posY = ScrH() - posY - sizeY
	end

	local textX = posX+10
	local loadingX = posX+sizeX-100
	local errorY = 0
	draw.RoundedBox(8, posX, posY, sizeX, sizeY, Color(50, 50, 50, 155))

	posY = posY + 35
	color = yellow
	local loadingY = posY
	local header = "TsLib: Scanning"
	local text = "Searching for gmcl_tslib_win32.dll!"
	if gspeak.failed then
		color = red
		errorY = posY - 10
		if gspeak.tslib.wrongVersion then
			header = "TsLib: Wrong Version"
			text = "Your gmcl_tslib_win32.dll file is on\nversion "..tostring(gspeak.tslib.version/1000).."! Please "..gspeak:VersionWord(gspeak.tslib).." version "..tostring(gspeak.tslib.req/1000).."!"
		else
			header = "TsLib: Failed"
			text = "Could not find gmcl_tslib_win32.dll! Please\ndownload & install TsLib version "..tostring(gspeak.tslib.req/1000).."!"
		end
	elseif gspeak.running then
		color = green
	end
	draw.DrawText( "TSlib", "CaptureItSmall", textX, posY, color, TEXT_ALIGN_LEFT )
	draw.DrawText( tostring(gspeak.tslib.req/1000), "Trebuchet24", posX+97, posY+13, color, TEXT_ALIGN_LEFT )

	posY = posY + diffY
	color = white
	if gspeak.TS.failed then
		color = red
		errorY = posY - 10
		header = "Gspeak: Wrong Version"
		text = "Your Gspeak Teamspeak3 plugin is on\nversion "..tostring(gspeak.TS.version/1000).."! Please "..gspeak:VersionWord(gspeak.TS).." version "..tostring(gspeak.TS.req/1000).."!"
	elseif gspeak.running and !gspeak.TS.connected then
		color = yellow
		loadingY = posY
		header = "Scanning for Teamspeak3"
		text = "Please start Teamspeak3 and/or enable the\nGspeak plugin! (Settings->Plugins)"
	elseif gspeak.TS.connected then
		color = green
	end
	draw.DrawText( "Gspeak", "CaptureItSmall", textX, posY, color, TEXT_ALIGN_LEFT )
	draw.DrawText( tostring(gspeak.TS.req/1000), "Trebuchet24", posX+145, posY+13, color, TEXT_ALIGN_LEFT )

	posY = posY + diffY
	color = white
	if gspeak.TS.connected and !gspeak.TS.inChannel then
		color = yellow
		loadingY = posY
		header = "Scanning for Teamspeak3"
		text = "Join our Teamspeak3 Server: "..gspeak.settings["ts_ip"].."\nand enter the Gspeak Channel!"
	elseif gspeak.TS.inChannel then
		color = green
	end
	draw.DrawText( "Channel", "CaptureItSmall", textX, posY, color, TEXT_ALIGN_LEFT )

	if !gspeak.failed and !gspeak.TS.failed then
		gspeak:DrawLoading(loadingX, loadingY, 28, 28, white)
	else
		surface.SetDrawColor( white )
		surface.SetMaterial( gspeak_error )
		surface.DrawTexturedRect( loadingX, errorY, 64, 64)
	end

	posY = posY + diffY
	draw.DrawText( header, "Trebuchet24", posX+10, posY-140, white, TEXT_ALIGN_LEFT )
	draw.DrawText( text, "HudHintTextLarge", posX+10, posY, white, TEXT_ALIGN_LEFT )
end

function gspeak:DeadChat()
	if gspeak.settings["dead_chat"] == "true" then
		if gspeak.dead_muted then
			gspeak.dead_muted = false
			chat.AddText( Color( 255, 0, 0 ), "[Gspeak]",  Color( 0, 0, 0 ), " unmuted dead players ")
		else
			gspeak.dead_muted = true
			chat.AddText( Color( 255, 0, 0 ), "[Gspeak]",  Color( 0, 0, 0 ), " muted dead players ")
		end
	end
end

function gspeak:PlayerBindPress( ply, bind, pressed )
	if gspeak.terrortown and ( bind == "+voicerecord" or bind == "+speed" ) and gspeak.settings["overrideV"] == "true" then
		return true
	elseif gspeak.settings["dead_chat"] == "true" and bind == "gm_showteam" and pressed and !gspeak:player_alive(LocalPlayer()) then
		gspeak:DeadChat()
		return true
	elseif gspeak.terrortown and gspeak.settings["dead_chat"] == "false" and bind == "gm_showteam" then
		return true
	end
end

function gspeak:MouthMoveAnimation( ply )
	if !gspeak.running then return end
	local FlexNum = ply:GetFlexNum() - 1
	if ( FlexNum <= 0 ) then return end

	ply.volume = ply.volume or 0
	local volume = tslib.getVolumeOf(ply:EntIndex())

	if volume != 0 then
  	volume = math.Approach(ply.volume,math.Clamp( 1+math.log(volume, 10), 0, 1 ),FrameTime()*7)
	end

	for i = 0, FlexNum - 1 do
		local Name = ply:GetFlexName( i )
		if ( Name == "jaw_drop" or Name == "right_part" or Name == "left_part" or Name == "right_mouth_drop" or Name == "left_mouth_drop" ) then
			ply:SetFlexWeight( i, volume )
		end
	end
	ply.volume = volume
end

function gspeak:GrabEarAnimation( ply )
	ply.ChatGestureWeight = ply.ChatGestureWeight or 0
	local update = false
	if ply.ChatGesture then
		if ply.ChatStation then
			ply.ChatGestureWeight = math.Approach( ply.ChatGestureWeight, 0.5, FrameTime() * 10.0 );
		else
			ply.ChatGestureWeight = math.Approach( ply.ChatGestureWeight, 1, FrameTime() * 10.0 );
		end
		update = true
	elseif ply.ChatGestureWeight > 0 then
		ply.ChatGestureWeight = math.Approach( ply.ChatGestureWeight, 0, FrameTime()  * 10.0 );
		update = true
	end

	if update then
		ply:AnimRestartGesture( GESTURE_SLOT_CUSTOM, ACT_GMOD_IN_CHAT )
		ply:AnimSetGestureWeight( GESTURE_SLOT_CUSTOM, ply.ChatGestureWeight )
		ply.ChatGesture = false
	end
end

function gspeak:get_distances( ent, talkmode )
	local distance_max = gspeak.settings["distance"][talkmode]
	local ent_pos = ent:GetPos()
	if ent:IsPlayer() then ent_pos = ent_pos + gspeak:get_offset(ent)	end
	local pos = gspeak.clientPos or LocalPlayer():GetPos()
	ent_pos:Sub(pos)
	ent_pos = ent_pos * Vector(1,1,gspeak.settings["distance_height_mult"][talkmode])
	local distance = Vector(0,0,0):Distance(ent_pos)

	return distance, distance_max, ent_pos
end

function gspeak:get_offset(ply)
	if !gspeak:player_alive(ply) then return gspeak.player.dead end
	if ply:Crouching() then	return gspeak.player.crouching end
	return gspeak.player.standing
end

function gspeak:player_alive(ply)
	if !ply:Alive() then return false end
	if gspeak.terrortown and ( ply:IsSpec() or GetRoundState() == ROUND_POST ) then return false end
	return true
end

//********************************************
//								INITIALIZE
//********************************************

if (!file.Exists("gspeak/settings.txt", "DATA")) then
	file.CreateDir("gspeak")
	file.Write("gspeak/settings.txt", util.TableToJSON(gspeak.cl_settings))
else
	local loaded_settings = util.JSONToTable(file.Read( "gspeak/settings.txt" ))
	for k, v in pairs( loaded_settings ) do
		gspeak.cl_settings[k] = v
	end
	file.Write("gspeak/settings.txt", util.TableToJSON(gspeak.cl_settings))
end

for k, v in pairs(ents.GetAll()) do
	if !IsValid(v) then continue end
	if v:IsPlayer() then
		table.insert(gspeak.players, v)
	elseif string.match(v:GetClass(), "radio_ent*") then
		table.insert(gspeak.radios, v)
	end
end

--in development!
local dead_dist = 150
local dead_angl = Angle(0,22.5,0)
local dead_circle = {}
local dead_vec = Vector(dead_dist, 0, 0)
local dead_slot = 1
table.insert(dead_circle, Vector(dead_vec.x, dead_vec.y, dead_vec.z))
dead_vec:Rotate(dead_angl*8)
table.insert(dead_circle, Vector(dead_vec.x, dead_vec.y, dead_vec.z))
dead_vec:Rotate(dead_angl*4)
table.insert(dead_circle, Vector(dead_vec.x, dead_vec.y, dead_vec.z))
dead_vec:Rotate(dead_angl*8)
table.insert(dead_circle, Vector(dead_vec.x, dead_vec.y, dead_vec.z))
dead_vec:Rotate(dead_angl*2)
table.insert(dead_circle, Vector(dead_vec.x, dead_vec.y, dead_vec.z))
dead_vec:Rotate(dead_angl*8)
table.insert(dead_circle, Vector(dead_vec.x, dead_vec.y, dead_vec.z))
dead_vec:Rotate(dead_angl*4)
table.insert(dead_circle, Vector(dead_vec.x, dead_vec.y, dead_vec.z))
dead_vec:Rotate(dead_angl*8)
table.insert(dead_circle, Vector(dead_vec.x, dead_vec.y, dead_vec.z))
dead_vec:Rotate(dead_angl)
table.insert(dead_circle, Vector(dead_vec.x, dead_vec.y, dead_vec.z))
dead_vec:Rotate(dead_angl*8)
table.insert(dead_circle, Vector(dead_vec.x, dead_vec.y, dead_vec.z))
dead_vec:Rotate(dead_angl*4)
table.insert(dead_circle, Vector(dead_vec.x, dead_vec.y, dead_vec.z))
dead_vec:Rotate(dead_angl*8)
table.insert(dead_circle, Vector(dead_vec.x, dead_vec.y, dead_vec.z))
dead_vec:Rotate(dead_angl*2)
table.insert(dead_circle, Vector(dead_vec.x, dead_vec.y, dead_vec.z))
dead_vec:Rotate(dead_angl*8)
table.insert(dead_circle, Vector(dead_vec.x, dead_vec.y, dead_vec.z))
dead_vec:Rotate(dead_angl*4)
table.insert(dead_circle, Vector(dead_vec.x, dead_vec.y, dead_vec.z))
dead_vec:Rotate(dead_angl*8)
table.insert(dead_circle, Vector(dead_vec.x, dead_vec.y, dead_vec.z))

//********************************************
//								NETCODE
//********************************************

net.Receive("ts_ply_id", function( len )
local ply = net.ReadEntity()
ply.ts_id = net.ReadInt( 32 )
end)

net.Receive("ts_ply_talking", function( len )
	ply = net.ReadEntity()
	if ply == LocalPlayer() then return end
	ply.talking = net.ReadBool()
end)

net.Receive("ts_ply_talkmode", function ( len )
	ply = net.ReadEntity()
	if LocalPlayer() == ply then return end
	ply.talkmode = net.ReadInt( 4 )
end)

net.Receive("gspeak_ply_disc", function ( len )
	index = net.ReadInt(32)
	if gspeak.TS.connected then tslib.delPos(index, false, -1) end
end)

net.Receive("gspeak_server_settings", gspeak.read_server_settings)

net.Receive("gspeak_failed_broadcast", function(len)
	local ply = net.ReadEntity()
	ply.failed = true
end)

net.Receive("gspeak_init", function( len )
	if gmod.GetGamemode().Name == "Trouble in Terrorist Town" then
	 gspeak.terrortown = true
	end

	local ply_variables_table = net.ReadTable()
	for k, v in pairs(ply_variables_table) do
		v[1].talkmode = v[2]
		v[1].ts_id = v[3]
		v[1].talking = v[4]
	end
	gspeak:read_server_settings()

	if pcall(function() require("tslib") end) then
		if pcall(function() tslib.getVersion() end) then
			gspeak.tslib.version = tslib.getVersion()
			MsgC( Color( 255, 0, 0 ), "TSlib included - ", white, "Version ", tostring(gspeak.tslib.version), "\n")
			if gspeak.tslib.version >= gspeak.tslib.req and gspeak.tslib.version < gspeak.tslib.max then
				gspeak.running = true
				gspeak:set_tsid(-1) --loading mode
				return
			else
				gspeak.tslib.wrongVersion = true
				MsgC( Color( 255, 0, 0 ), "TSlib Wrong Version! - ", white, "Version ", tostring(gspeak.tslib.version), "\n")
			end
		else
			gspeak.tslib.wrongVersion = true
			MsgC( Color( 255, 0, 0 ), "TSlib - ", white, "No Version function!\n")
		end
	else
		MsgC( Color( 255, 0, 0 ), "TSlib - ", white, "No TSlib DLL found / require failed!\n")
	end
	gspeak.failed = true
end)

//********************************************
//								HOOKS
//********************************************

hook.Add("OnEntityCreated", "player_array", function( ent )
	if (ent:IsPlayer()) then
		table.insert(gspeak.players, ent)
	elseif string.match(ent:GetClass(), "radio_ent*") then
		table.insert(gspeak.radios, ent)
	end
end)

hook.Add("InitPostEntity", "gspeak_ply_fully_loaded", function()
	gspeak:request_init()

	function GAMEMODE:MouthMoveAnimation( ply )
		gspeak:MouthMoveAnimation( ply )
	end

	function GAMEMODE:GrabEarAnimation( ply )
		gspeak:GrabEarAnimation( ply )
	end

	local old_voice = GAMEMODE.PlayerStartVoice
	function GAMEMODE.PlayerStartVoice( _, ply )
		if gspeak.settings["overrideV"] == "true" then return false end
		return old_voice( ply )
	end

  original_bind = GAMEMODE.PlayerBindPress
	function GAMEMODE.PlayerBindPress( _, ply, bind, pressed )
		if gspeak:PlayerBindPress( ply, bind, pressed ) then return true end
		return original_bind( _, ply, bind, pressed )
	end
end)

hook.Add( "RenderScreenspaceEffects", "gspeak_icon", function()
	local eye = EyeAngles()
	local ang = Angle (eye.p, eye.y, eye.r)
	local offset = Vector(0, 0, 80)
	ang:RotateAroundAxis(ang:Forward(), -90)
	ang:RotateAroundAxis(ang:Right(), 90)
	ang:RotateAroundAxis(ang:Up(), 180)
	cam.Start3D(EyePos(), eye)
	local client_alive = gspeak:player_alive(LocalPlayer())

		for k, ply in pairs(player.GetAll()) do
		if !IsValid( ply ) or !ply:IsPlayer() or ply == LocalPlayer() then
			continue
		end
		local ply_pos = ply:GetPos()
		local ply_alive = gspeak:player_alive(ply)
		if gspeak.viewranges and ply_alive then
			local blue = Color(0,0,255,255)
			local green = Color(0,255,0,255)
			local red = Color(255,0,0,255)
			local pos = ply_pos + gspeak:get_offset(ply)
			local normal = Vector(0,0,1)
			render.DrawWireframeSphere(pos,gspeak.settings["distance"][1],8,8,blue)
			render.DrawWireframeSphere(pos,gspeak.settings["distance"][2],8,8,green)
			render.DrawWireframeSphere(pos,gspeak.settings["distance"][3],8,8,red)
			render.DrawWireframeSphere(pos,gspeak.settings["distance"][4],8,8,white)
			render.DrawQuadEasy(pos+Vector(0,0,gspeak.settings["distance"][1])/gspeak.settings["distance_height_mult"][1], normal, 64, 64, blue, 0)
			render.DrawQuadEasy(pos+Vector(0,0,gspeak.settings["distance"][2])/gspeak.settings["distance_height_mult"][2], normal, 64, 64, green, 0)
			render.DrawQuadEasy(pos+Vector(0,0,gspeak.settings["distance"][3])/gspeak.settings["distance_height_mult"][3], normal, 64, 64, red, 0)
		end
		if ( LocalPlayer():GetPos():Distance(ply_pos) < gspeak.settings["distance"][4] and ply_alive ) or ( !client_alive and !ply_alive and gspeak.settings["dead_chat"] == "true" and !gspeak.dead_muted) then
			if !client_alive and !ply_alive then
				local slot = ply.dead_slot or 1
				ply_pos = gspeak.clientPos + dead_circle[slot]
			end
			local talkmode = gspeak:get_talkmode( ply )
			local ts_id = gspeak:get_tsid( ply )
			if ply.talking or ts_id < 0 or ply.failed then
				local pos = ply_pos + offset
				local pos_y = -15
				if gspeak.settings["head_icon"] == "true" then
					if gspeak.settings["head_name"] == "false" then
						pos_y = -8
					end
					local size = 16
					local pos_x = -3
					cam.Start3D2D(pos, ang, 1)
						surface.SetDrawColor( white )
						if ply.failed then
							surface.SetMaterial( gspeak_off )
							surface.DrawTexturedRect( pos_x, pos_y, size, size )
						elseif ts_id < 0 then --loading
							gspeak:DrawLoading(pos_x-2, pos_y+7, 4, 4, white)
						else
							surface.SetMaterial( gspeak_talk_1 )
							surface.DrawTexturedRect( pos_x, pos_y, size, size )
							if talkmode >= 2 then
								surface.SetMaterial( gspeak_talk_2 )
								surface.DrawTexturedRect( pos_x, pos_y, size, size )
								if talkmode == 3 then
									surface.SetMaterial( gspeak_talk_3 )
									surface.DrawTexturedRect( pos_x, pos_y, size, size )
								end
							end
						end
					cam.End3D2D()
				end
				if gspeak.settings["head_name"] == "true" and talkmode != 4 then
					local ply_name = ply:GetName()
					if gspeak.settings["head_icon"] == "false" and ts_id < 0 then
						if ply.failed then
							ply_name = "(error)"
						elseif ts_id < 0 then
							ply_name = "(connecting)"
						end
					end
					local ply_name_l = string.len(ply_name)
					cam.Start3D2D(pos, ang, 0.1)
						draw.DrawText( ply_name, "CaptureItBug", ply_name_l*28, pos_y, team.GetColor( ply:Team() ), TEXT_ALIGN_RIGHT )
					cam.End3D2D()
				end
			end
		end
	end

	if gspeak.rangeEditing then
		render.SetColorMaterial()
	end
	cam.End3D()
end)

hook.Add( "HUDPaint", "gspeak_hud", function()
	gspeak:DrawStatus()
	if !gspeak.TS.inChannel then return end

	if LocalPlayer().talking then
		local x = ScrW() * gspeak.settings["HUDx_c"]
		local y = ScrH() * gspeak.settings["HUDy_c"]
		local sizeX = 55
		local sizeY = 20

		if gspeak.settings["HUDa_c"] == "tr" then
			x = ScrW() - x - sizeX
		elseif gspeak.settings["HUDa_c"] == "bl" then
			y = ScrH() - y - sizeY
		elseif gspeak.settings["HUDa_c"] == "br" then
			x = ScrW() - x - sizeX
			y = ScrH() - y - sizeY
		end

		gspeak:DrawText(gspeak.settings["distance_n"][gspeak.cl_settings["talkmode"]].."ing", x, y, Color(0,255,0,255))
		local talkmode = gspeak:get_talkmode( LocalPlayer() )
		x = x - 75
		y = y - 45
		local size = 128
		surface.SetDrawColor( white )
		surface.SetMaterial( gspeak_talk_ui_1 )
		surface.DrawTexturedRect( x, y, size, size)
		if talkmode >= 2 then
				surface.SetMaterial( gspeak_talk_ui_2 )
				surface.DrawTexturedRect( x, y, size, size)
			if talkmode == 3 then
				surface.SetMaterial( gspeak_talk_ui_3 )
				surface.DrawTexturedRect( x, y, size, size)
			end
		end
	end

	if !gspeak:player_alive(LocalPlayer()) and gspeak.dead_muted then
		local posX = ScrW() * gspeak.settings["HUDx_s"] + 120
		local posY = ScrH() * gspeak.settings["HUDy_s"] + 150
		draw.RoundedBox(8, posX, posY, 200, 50, Color(50, 50, 50, 155))
		draw.DrawText( "Dead muted", "Trebuchet24", posX+45, posY+12, Color(255,0,0,255), TEXT_ALIGN_LEFT )
	end
end)

hook.Add("Think", "Gspeak", function()
	gspeak.clientPos = LocalPlayer():GetPos() + gspeak:get_offset(LocalPlayer())
	if gspeak.failed then return end
	local now = CurTime()
	gspeak.chill = gspeak.chill or now + 10
	if !gspeak.running then
		if gspeak.chill > now then return end
		gspeak:request_init()
		gspeak.chill = now + 10
		return
	end

	gspeak:checkConnection()
	if !gspeak.TS.connected then return end

	local ts_id = tslib.getTsID()
	if ts_id != LocalPlayer().ts_id and gspeak.chill < now then
		gspeak:set_tsid( ts_id )
		gspeak.chill = now + 10
	end
	gspeak.TS.inChannel = tslib.getInChannel()
	if !gspeak.TS.inChannel then return end

	gspeak.hearable = tslib.getAllID()
	--Add player entitys to C++ Struct of hearable Players
	local client_alive = gspeak:player_alive(LocalPlayer())
	for k, v in pairs(player.GetAll()) do
		if !IsValid(v) then
			table.remove(gspeak.players, k)
			continue
		end
		local v_index = v:EntIndex()
		if v == LocalPlayer() then
			local playerFor = v:GetForward()
			local playerUp = v:GetUp()
			tslib.sendClientPos(playerFor.x, playerFor.y, playerFor.z, playerUp.x, playerUp.y, playerUp.z)
		else
			local ts_id_v = gspeak:get_tsid(v)
			local v_alive = gspeak:player_alive(v)
			if v.alive != v_alive then
				v.alive = v_alive
				if !v_alive then
					v.dead_slot = dead_slot
					dead_slot = dead_slot + 1
					if dead_slot > 16 then
						dead_slot = 1
					end
				end
			end
			if ts_id_v == -1 then continue end
			local distance, distance_max, playerPos
			local talkmode = gspeak:get_talkmode( v )

			if gspeak.settings["dead_chat"] == "true" and !client_alive and !v_alive and !gspeak.dead_muted then
				distance = 0
				distance_max = gspeak.settings["distance"][2]
				playerPos = dead_circle[v.dead_slot]
			elseif ( client_alive or gspeak.settings["dead_alive"] == "true" ) and v_alive then
				distance, distance_max, playerPos = gspeak:get_distances(v, talkmode)
			else
				continue
			end
			if distance < distance_max then
				tslib.sendPos(ts_id_v, talkmode, v_index, playerPos.x, playerPos.y, playerPos.z, false)
			end
		end
	end
	--Check C++ Struct if hearable player must be removed
	for k, v in pairs(gspeak.hearable) do
		local v_radio = v["radio"]
		local v_ent_id = v["ent_id"]

		if IsValid(Entity(v_ent_id)) then
			if v_radio then
				local v_radio_id = v["radio_id"]
				if !client_alive and gspeak.settings["dead_alive"] == "false" then
					tslib.delPos(v_ent_id, true, v_radio_id)
				elseif IsValid(Entity(v_radio_id)) and string.match(Entity(v_ent_id):GetClass() ,"radio_ent*") and string.match(Entity(v_radio_id):GetClass(), "radio_ent*") then
					local distance, distance_max = gspeak:get_distances(Entity(v_radio_id), 2)
					if distance > distance_max then
						tslib.delPos(v_ent_id, true, v_radio_id)
					end
				else
					tslib.delPos(v_ent_id, true, v_radio_id)
				end
			elseif Entity(v_ent_id):IsPlayer() then
				if gspeak:player_alive(Entity(v_ent_id)) then
					if !client_alive and gspeak.settings["dead_alive"] == "false" then
						tslib.delPos(v_ent_id, false)
					else
						local distance, distance_max = gspeak:get_distances(Entity(v_ent_id), gspeak:get_talkmode( Entity(v_ent_id) ))
						if distance > distance_max then
							tslib.delPos(v_ent_id, false)
						end
					end
				else
					if gspeak.settings["dead_chat"] == "true" and !client_alive and !gspeak.dead_muted then continue end
					tslib.delPos(v_ent_id, false)
				end
			else
				tslib.delPos(v_ent_id, false)
			end
		else
			if v_radio then
				tslib.delPos(v_ent_id, true, v["radio_id"])
			else
			tslib.delPos(v_ent_id, false)
			end
		end
	end

	if tslib.talkCheck() and !gspeak.start_talking then
		gspeak:ts_talking( true )
	elseif !tslib.talkCheck() and gspeak.start_talking then
		gspeak:ts_talking( false )
	end

	if input.IsKeyDown( gspeak.cl_settings["key"] ) and gspeak.tm_tab <  now - 0.2 then
		gspeak.tm_tab = now
		gspeak:change_talkmode( gspeak.cl_settings["talkmode"] + 1 )
	end
end)

function gspeak:request_ts_id( ply, ts_id )
    net.Start("request_ts_id")
        net.WriteEntity( ply )
        net.WriteInt( ts_id, 32 )
    net.SendToServer()
end
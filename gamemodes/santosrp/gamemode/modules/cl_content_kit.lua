
-----------------------------------------------------
--[[
	Name: cl_content_kit.lua
	For: SantosRP
	By: Ultra
]]--

if not (SANTOS_CONTENT_DEV_SERVER or DEV_SERVER) then return end

local Module = {}
Module.Name = "Content Creator Kit"

local hooks = {}
local efunc = function() end
concommand.Add( "srp_cc_toggle_hud", function( pPlayer, strCmd, tblArgs )
	Module.OldPaintFunc = Module.OldPaintFunc or GAMEMODE.HUD.Paint
	GAMEMODE.HUD.Paint = GAMEMODE.HUD.Paint == Module.OldPaintFunc and efunc or Module.OldPaintFunc

	if GAMEMODE.HUD.Paint == efunc then
		hooks = hook.GetTable()["HUDPaint"]
		hook.GetTable()["HUDPaint"] = {}
	else
		if hooks then
			hook.GetTable()["HUDPaint"] = hooks
		end
	end

	Module.OldNoteFunc = Module.OldNoteFunc or GAMEMODE.HUD.AddNote
	GAMEMODE.HUD.AddNote = GAMEMODE.HUD.AddNote == Module.OldNoteFunc and efunc or Module.OldNoteFunc
end )

concommand.Add( "srp_cc_toggle_moviemode", function( pPlayer, strCmd, tblArgs )
	GAMEMODE.Camera:ToggleMovieMode() 
end )

concommand.Add( "srp_cc_set_moviemode_smoothing", function( pPlayer, strCmd, tblArgs )
	GAMEMODE.Camera:SetMovieModeSmoothing( tonumber(tblArgs[1]) )
end )

function Module:OnLoad()
end

return Module
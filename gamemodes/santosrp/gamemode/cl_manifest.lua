
-----------------------------------------------------
--[[
	Name: cl_manifest.lua
	For: SantosRP
	By: Ultra
]]--

include "santosrp/gamemode/sh_config.lua"
include "santosrp/gamemode/sh_propprotect.lua"
include "santosrp/gamemode/sh_economy.lua"
include "santosrp/gamemode/sh_npcdialog.lua"
include "santosrp/gamemode/sh_chatbox.lua"
include "santosrp/gamemode/sh_util.lua"
include "santosrp/gamemode/sh_unconscious.lua"
include "santosrp/gamemode/sh_santos_customs.lua"
include "santosrp/gamemode/sh_pacmodels.lua"
include "santosrp/gamemode/sh_chat.lua"
include "santosrp/gamemode/sh_player_anims.lua"

include "santosrp/gamemode/cl_networking.lua"
include "santosrp/gamemode/cl_player.lua"
include "santosrp/gamemode/cl_player_damage.lua"
include "santosrp/gamemode/cl_characters.lua"
include "santosrp/gamemode/cl_inventory.lua"
include "santosrp/gamemode/cl_gui.lua"
include "santosrp/gamemode/cl_npcs.lua"
include "santosrp/gamemode/cl_properties.lua"
include "santosrp/gamemode/cl_calcview.lua"
include "santosrp/gamemode/cl_cinicam.lua"
include "santosrp/gamemode/cl_cars.lua"
include "santosrp/gamemode/cl_chatradios.lua"
include "santosrp/gamemode/cl_jobs.lua"
include "santosrp/gamemode/cl_jail.lua"
include "santosrp/gamemode/cl_map.lua"
include "santosrp/gamemode/cl_hud.lua"
include "santosrp/gamemode/cl_hud_car.lua"
include "santosrp/gamemode/cl_license.lua"
include "santosrp/gamemode/cl_skills.lua"
include "santosrp/gamemode/cl_drugs.lua"
include "santosrp/gamemode/cl_needs.lua"
include "santosrp/gamemode/cl_buddies.lua"
include "santosrp/gamemode/cl_apps.lua"
include "santosrp/gamemode/cl_module.lua"

--Load vgui
local foundFiles, foundFolders = file.Find( GM.Config.GAMEMODE_PATH.. "vgui/*.lua", "LUA" )
for k, v in pairs( foundFiles ) do
	include( GM.Config.GAMEMODE_PATH.. "vgui/".. v )
end
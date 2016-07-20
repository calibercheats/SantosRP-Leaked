
-----------------------------------------------------
CasinoKit = CasinoKit or {}

local function cl(file)
	if SERVER then AddCSLuaFile(file) end
	if CLIENT then
		return include(file)
	end
end
local function sv(file)
	if SERVER then
		return include(file)
	end
end
local function sh(file)
	cl(file)
	sv(file)
end

local function includeFiles(folder)
	for _,fil in pairs(file.Find("casinokit/" .. folder .. "/*.lua", "LUA"), nil) do
		if fil:match("^sh_") then sh(string.format("%s/%s", folder, fil)) end
		if fil:match("^cl_") then cl(string.format("%s/%s", folder, fil)) end
		if fil:match("^sv_") then sv(string.format("%s/%s", folder, fil)) end
	end
end

cl("cl/util/bgworkshop.lua")
cl("cl/util/materialfetcher.lua")
cl("cl/util/soundfetcher.lua")

sv("custom/dealers.lua")
includeFiles("custom/dealers")
sh("custom/carddecks.lua")
includeFiles("custom/carddecks")
sh("custom/currencies.lua")
includeFiles("custom/currencies")
sh("custom/langs.lua")
includeFiles("custom/langs")

sh("util/_middleclass.lua")
sh("util/oop.lua")
sh("util/fn.lua")
sh("util/buffer.lua")
sh("util/timer.lua")
sh("util/mixins/events.lua")
sv("util/rand.lua")

sh("game/card/suit.lua")
sh("game/card/rank.lua")
sh("game/card/card.lua")
sh("game/card/cardset.lua")
sv("game/card/deck.lua")
sh("game/card/handeval/handeval.lua")
sh("game/card/handeval/pokerhandeval.lua")

sh("economy/chip_ext.lua")
sv("economy/chip_xchange.lua")
sv("economy/econ_admin.lua")

sv("game/player.lua")
cl("game/player_cl.lua")
sv("game/game.lua")
cl("game/game_cl.lua")
sv("game/table.lua")

includeFiles("game/state")
includeFiles("game/impl")

sv("gmod/persist.lua")
sh("gmod/persist_prop.lua")

cl("cl/util/nstable.lua")
cl("cl/chipmesh.lua")
cl("cl/dicemesh.lua")
CasinoKit.tdui = cl("cl/tdui.lua")
cl("cl/tdui_skin.lua")
cl("cl/chipexchange.lua")
cl("cl/derma_skin.lua")

sv("tester.lua")

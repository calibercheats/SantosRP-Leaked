
-----------------------------------------------------
--[[
	© 2016 Thriving Ventures Ltd do not share, re-distribute or modify
	without permission of its author (gustaf@thrivingventures.com).
]]

--
-- Ban lengths, in seconds.
--

serverguard.banLengths = {
	{"1 Minute",		1},
	{"10 Minutes",		10},
	{"30 Minutes",		30},
	{"1 Hour",			60},
	{"6 Hours",			360},
	{"1 Day",			1440},
	{"1 Week",			10080},
	{"1 Month",			43829.1},
	{"Indefinite",		0}
};

--
-- Simple kick reason list.
--

serverguard.kickReasons = {
	"Spammer",
	"Crashed server",
	"Mingebag",
	"Griefer",
	"Foul language",
	"Disobeying the rules",
	"DDoS Threats"
};

--
-- The menu command.
--

local command = {};

command.help		= "Open the menu.";
command.command 	= "menu";
command.bDisallowConsole = true;

function command:Execute(player, silent, arguments)
	player:ConCommand("+serverguard_menu");
end;

serverguard.command:Add(command);

--
-- The ban command.
--

local command = {};

command.help				= "Ban a player.";
command.command 			= "ban";
command.arguments 			= {"player", "length"};
command.optionalArguments	= {"reason"};
command.permissions 		= {"Ban", "Permaban"};

function command:Execute(player, silent, arguments)
	local target, length = arguments[1], arguments[2];

	if (target and length) then
		serverguard:BanPlayer(player, arguments[1], arguments[2], table.concat(arguments, " ", 3));
	end;
end;

function command:ContextMenu(player, menu, rankData)
	local banMenu, menuOption = menu:AddSubMenu("Ban Player");
	
	banMenu:SetSkin("serverguard");
	menuOption:SetImage("icon16/delete.png");
	
	for k, v in pairs(serverguard.banLengths) do
		local option = banMenu:AddOption(v[1], function()
			Derma_StringRequest("Ban Reason", "Specify ban reason.", "", function(text)
				serverguard.command.Run("ban", false, player:Name(), v[2], text);
			end, function(text) end, "Accept", "Cancel");
		end);
		
		option:SetImage("icon16/clock.png");
	end;

	local option = banMenu:AddOption("Custom", function()
		Derma_StringRequest("Ban Length", "Specify ban length in minutes.", "", function(length)
			Derma_StringRequest("Ban Reason", "Specify ban reason.", "", function(text)
				serverguard.command.Run("ban", false, player:Name(), tonumber(length), text);
			end);
		end, function(text) end, "Accept", "Cancel");
	end);
		
	option:SetImage("icon16/clock.png");
end;

serverguard.command:Add(command);

--
-- The unban command.
--

local command = {};

command.help				= "Unban a player.";
command.command 			= "unban";
command.arguments 			= {"steamid"};
command.permissions 		= {"Unban"};

function command:Execute(player, silent, arguments)
	local steamID = arguments[1];
	
	if (serverguard.banTable[steamID]) then
		if (!silent) then
			serverguard.Notify(nil, SGPF("command_unban", serverguard.player:GetName(player), serverguard.banTable[steamID].player));
		end;

		serverguard:UnbanPlayer(steamID, player);
	elseif (!util.IsConsole(player)) then
		serverguard.Notify(player, SGPF("command_no_entry"));
	end;
end;

serverguard.command:Add(command);

--
-- The kick command.
--

local command = {};

command.help				= "Kick a player.";
command.command 			= "kick";
command.arguments			= {"player"};
command.optionalArguments	= {"reason"};
command.permissions			= {"Kick"};

function command:Execute(player, silent, arguments)
	local target = util.FindPlayer(arguments[1], player);
	
	if (IsValid(target)) then
		if (serverguard.player:GetImmunity(target) < serverguard.player:GetImmunity(player)) then
			local reason = table.concat(arguments, " ", 2);
			
			if (string.Trim(reason) == "") then
				reason = "No Reason";
			end;

			if (!silent) then
				serverguard.Notify(nil, SERVERGUARD.NOTIFY.GREEN, serverguard.player:GetName(player), SERVERGUARD.NOTIFY.WHITE, " has kicked ", SERVERGUARD.NOTIFY.RED, target:Name(), SERVERGUARD.NOTIFY.WHITE, ". Reason: " .. reason);
			end;
			
			game.ConsoleCommand("kickid " .. target:UserID() .. " " .. reason .. "\n");
		else
			serverguard.Notify(player, SERVERGUARD.NOTIFY.RED, "This player has a higher immunity than you.");
		end;
	end;
end;

function command:ContextMenu(player, menu, rankData)
	local kickMenu, menuOption = menu:AddSubMenu("Kick Player")
	
	kickMenu:SetSkin("serverguard");
	menuOption:SetImage("icon16/delete.png");
	
	for k, v in pairs(serverguard.kickReasons) do
		local option = kickMenu:AddOption(v, function()
			serverguard.command.Run("kick", false, player:Name(), v);
		end);
		
		option:SetImage("icon16/page_paste.png");
	end;
	
	kickMenu:AddOption("Custom Reason", function()
		Derma_StringRequest("Kick Reason", "Specify kick reason.", "", function(text)
			serverguard.command.Run("kick", false, player:Name(), text);
		end, function(text) end, "Accept", "Cancel");
	end);
end;

serverguard.command:Add(command);

--
-- The rank command.
--

local command = {};

command.help		= "Set a player's rank.";
command.command 	= "rank";
command.arguments	= {"player", "rank"};
command.permissions = "Manage Ranks";
command.aliases		= {"setrank", "setgroup", "group"};

function command:Execute(player, silent, arguments)
	local target = util.FindPlayer(arguments[1], player, true);
	local rankData = serverguard.ranks:GetRank(arguments[2]);

	if (rankData) then
		if (serverguard.player:GetImmunity(player) >= rankData.immunity) then				
			if (IsValid(target)) then
				if (player != target) then
					if (serverguard.player:HasBetterImmunity(player, serverguard.player:GetImmunity(target))) then
						serverguard.player:SetRank(target, rankData.unique);
						serverguard.player:SetImmunity(target, rankData.immunity);

						if (!silent) then
							serverguard.Notify(nil, SGPF("command_rank", serverguard.player:GetName(player), serverguard.player:GetName(target), string.Ownership(serverguard.player:GetName(target), true), rankData.name));
						end;
					else
						serverguard.Notify(player, SGPF("player_higher_immunity"));
					end;
				else
					serverguard.Notify(player, SGPF("command_rank_cannot_set_own"));
				end;
			elseif (string.SteamID(arguments[1])) then
				local queryObj = serverguard.mysql:Select("serverguard_users");
					queryObj:Where("steam_id", arguments[1]);
					queryObj:Limit(1);
					queryObj:Callback(function(result, status, lastID)
						if (type(result) == "table" and #result > 0) then
							target = result[1];

							if (!util.IsConsole(player) and target.steam_id == player:SteamID()) then
								serverguard.Notify(player, SGPF("command_rank_cannot_set_own"));
								return;
							end;

							local playerRankData = serverguard.ranks:GetRank(target.rank);

							if (!playerRankData or serverguard.player:HasBetterImmunity(player, playerRankData.immunity)) then
								local updateObj = serverguard.mysql:Update("serverguard_users");
									updateObj:Update("rank", rankData.unique);
									updateObj:Where("steam_id", target.steam_id);
									updateObj:Limit(1);
									updateObj:Callback(function(result, status, lastID)
										if (!silent) then
											serverguard.Notify(nil, SGPF("command_rank", serverguard.player:GetName(player), target.name, string.Ownership(target.name, true), rankData.name));
										end;
									end);
								updateObj:Execute();
							else
								serverguard.Notify(player, SGPF("player_higher_immunity"));
							end;
						else
							local insertObj = serverguard.mysql:Insert("serverguard_users");
								insertObj:Insert("name", arguments[1]);
								insertObj:Insert("rank", rankData.unique);
								insertObj:Insert("steam_id", arguments[1]);
								insertObj:Insert("last_played", os.time());
								insertObj:Callback(function(result, status, lastID)
									if (!silent) then
										serverguard.Notify(nil, SGPF("command_rank", serverguard.player:GetName(player), arguments[1], string.Ownership(arguments[1], true), rankData.name));
									end;
								end);
							insertObj:Execute();
						end;
					end);
				queryObj:Execute();
			else
				serverguard.Notify(player, SGPF("cant_find_player_with_identifier"));
			end;
		else
			serverguard.Notify(player, SGPF("command_rank_invalid_immunity"));
		end;
	else
		serverguard.Notify(player, SGPF("command_rank_invalid_unique", arguments[2]));

		local rankList = {};

		for k, v in pairs(serverguard.ranks:GetRanks()) do
			rankList[#rankList + 1] = k;
		end;

		serverguard.Notify(player, SERVERGUARD.NOTIFY.RED, SGPF("command_rank_valid_list", table.concat(rankList, ", ")));
	end;
end;

function command:ContextMenu(player, menu, rankData)
	local rankMenu, menuOption = menu:AddSubMenu("Set Rank");
	
	rankMenu:SetSkin("serverguard");
	menuOption:SetImage("icon16/award_star_add.png");
	
	local sorted = {};
	
	for k, v in pairs(serverguard.ranks:GetTable()) do
		table.insert(sorted, v);
	end;
	
	table.sort(sorted, function(a, b) return  a.immunity > b.immunity end);
	
	for _, data in pairs(sorted) do
		local option = rankMenu:AddOption(data.name, function()
			serverguard.command.Run("rank", false, player:Name(), data.unique);
		end);
		
		if (data.texture and data.texture != "") then
			option:SetImage(data.texture);
		end;
	end;
end;

serverguard.command:Add(command);

--
-- The toggle plugin command.
--

local command = {};

command.help		= "Toggle a plugin.";
command.command 	= "plugintoggle";
command.arguments	= {"name"};
command.permissions	= "Manage Plugins";
command.aliases		= {"toggleplugin"};

function command:Execute(player, silent, arguments)
	local pluginTable = serverguard.plugin.Get(arguments[1]);

	if (pluginTable) then
		local uniqueID = pluginTable.unique;
		local bWhitelisted = true

		if (pluginTable.gamemodes and #pluginTable.gamemodes > 0) then
			if (!table.HasValue(pluginTable.gamemodes, engine.ActiveGamemode())) then
				bWhitelisted = false;
			end;
		end;

		serverguard.netstream.Start(nil, "sgGetPluginStatus", {
			uniqueID, !pluginTable.toggled
		});

		serverguard.plugin:Toggle(uniqueID, !pluginTable.toggled);
		if !bWhitelisted then
			serverguard.plugin:SaveData(true,uniqueID);
		else
			serverguard.plugin:SaveData();
		end;
	end;		
end;

serverguard.command:Add(command);

--
-- The bring command.
--

local command = {};

command.help				= "Bring a player to you.";
command.command 			= "bring";
command.arguments			= {"player"};
command.permissions			= "Bring";
command.bDisallowConsole	= true;
command.immunity 			= SERVERGUARD.IMMUNITY.LESSOREQUAL;

function command:OnPlayerExecute(player, target)
	local position = serverguard:playerSend(target, player, false);
	
	if (position) then
		target.sg_LastPosition = target:GetPos();
		target.sg_LastAngles = target:EyeAngles();
		target:SetPos(position);

		return true;
	end;
end;

function command:OnNotify(player, targets)
	return SGPF("command_bring", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets));
end;

serverguard.command:Add(command);

--
-- The send command.
--

local command = {};

command.help				= "Send a player to where you're looking, or to another player.";
command.command 			= "send";
command.arguments			= {"player"};
command.optionalArguments	= {"to player"};
command.permissions			= "Send";
command.bDisallowConsole	= true;

function command:Execute(player, silent, arguments)
	local target = util.FindPlayer(arguments[1], player)

	if (IsValid(target)) then
		if (serverguard.player:GetImmunity(target) > serverguard.player:GetImmunity(player)) then
			serverguard.Notify(player, SERVERGUARD.NOTIFY.RED, "This player has a higher immunity than you.");
			return;
		end;

		if (arguments[2] != nil) then
			local sendTarget = util.FindPlayer(arguments[2], player);

			if (IsValid(sendTarget)) then
				local position = serverguard:playerSend(target, sendTarget, target:GetMoveType() == MOVETYPE_NOCLIP);

				if (position) then
					target.sg_LastPosition = target:GetPos();
					target.sg_LastAngles = target:EyeAngles();

					target:SetPos(position);

					if (!silent) then
						serverguard.Notify(nil, SERVERGUARD.NOTIFY.GREEN, serverguard.player:GetName(player), SERVERGUARD.NOTIFY.WHITE, " has sent ", SERVERGUARD.NOTIFY.RED, target:Name(), SERVERGUARD.NOTIFY.WHITE, " to ", SERVERGUARD.NOTIFY.RED, string.Ownership(sendTarget:Name()), SERVERGUARD.NOTIFY.WHITE, " location.");
					end;
				else
					serverguard.Notify(player, SERVERGUARD.NOTIFY.RED, "Could not find any proper location to place the player.");
				end;

				return;
			end;
		end;

		target.sg_LastPosition = target:GetPos();
		target.sg_LastAngles = target:EyeAngles();

		local trace = player:GetEyeTrace();
			trace = trace.HitPos +trace.HitNormal *1.25;
		target:SetPos(trace);
		
		if (!silent) then
			serverguard.Notify(nil, SERVERGUARD.NOTIFY.GREEN, serverguard.player:GetName(player), SERVERGUARD.NOTIFY.WHITE, " has sent ", SERVERGUARD.NOTIFY.RED, target:Name(), SERVERGUARD.NOTIFY.WHITE, " to their location.");
		end;
	end;
end;

function command:ContextMenu(player, menu, rankData)
	local option = menu:AddOption("Send Player", function()
		serverguard.command.Run("send", false, player:Name());
	end);
	
	option:SetImage("icon16/wand.png");
end;

serverguard.command:Add(command);

--
-- The goto command.
--

local command = {};

command.help				= "Go to a player.";
command.command 			= "goto";
command.arguments			= {"player"};
command.permissions			= "Goto";
command.bDisallowConsole	= true;
command.bSingleTarget		= true;
command.immunity 			= SERVERGUARD.IMMUNITY.ANY;
command.aliases				= {"tp", "teleport"};

function command:OnPlayerExecute(player, target)
	local position = serverguard:playerSend(player, target, player:GetMoveType() == MOVETYPE_NOCLIP);

	if (position) then
		player:SetPos(position);
		player:SetEyeAngles(Angle(target:EyeAngles().pitch, target:EyeAngles().yaw, 0));
		
		return true;
	else
		if (serverguard.player:HasPermission(player, "Noclip")) then
			player:SetMoveType(MOVETYPE_NOCLIP);
			position = serverguard:playerSend(player, target, true);

			player:SetPos(position);
			player:SetEyeAngles(Angle(target:EyeAngles().pitch, target:EyeAngles().yaw, 0));

			return true;
		end;
	end;
end;

function command:OnNotify(player, targets)
	return SGPF("command_goto", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets));
end;

function command:ContextMenu(player, menu, rankData)
	local option = menu:AddOption("Go To Player", function()
		serverguard.command.Run("goto", false, player:Name());
	end);

	option:SetImage("icon16/wand.png");
end;

serverguard.command:Add(command);

--
-- The return command.
--

local command = {};

command.help				= "Return a player to their previous location.";
command.command 			= "return";
command.arguments			= {"player"};
command.permissions			= "Return";
command.bDisallowConsole	= true;

function command:Execute(player, bSilent, arguments)
	local target = util.FindPlayer(arguments[1], player);

	if (IsValid(target)) then
		if (target.sg_LastPosition and target.sg_LastAngles) then
			if (target.sg_jail) then
				serverguard:UnjailPlayer(target);
			end;

			target:SetPos(target.sg_LastPosition);
			target:SetEyeAngles(Angle(target.sg_LastAngles.pitch, target.sg_LastAngles.yaw, 0));

			target.sg_LastPosition = nil;
			target.sg_LastAngles = nil;

			if (!bSilent) then
				serverguard.Notify(nil, SERVERGUARD.NOTIFY.GREEN, serverguard.player:GetName(player), SERVERGUARD.NOTIFY.WHITE, " has returned ", SERVERGUARD.NOTIFY.RED, serverguard.player:GetName(target), SERVERGUARD.NOTIFY.WHITE, " to their previous location.");
			end;
		else
			serverguard.Notify(player, SERVERGUARD.NOTIFY.RED, "This player has not been previously teleported.");
		end;
	end;
end;

serverguard.command:Add(command);

--
-- The change map command.
--

local command = {};

command.help		= "Change the map.";
command.command 	= "map";
command.arguments	= {"map"};
command.permissions	= "Map";
command.aliases		= {"changemap", "changelevel"};

function command:Execute(player, silent, arguments)
	local map = string.lower(arguments[1]);
	
	game.ConsoleCommand("changelevel " .. map .. "\n");
	
	-- If the server has not changed map by this time, the map does not exist.
	timer.Simple(0.2, function()
		if (IsValid(player)) then
			serverguard.Notify(player, SERVERGUARD.NOTIFY.RED, "\"" .. map .. "\" is not installed on this server.");
		end;
	end);
end;

serverguard.command:Add(command);


--
-- The "admin chat" command.
--

local command = {};

command.help		= "Talk to admins.";
command.command 	= "a";
command.quotes		= true;
command.arguments	= {"text"};

function command:Execute(player, silent, arguments)
	local text = table.concat(arguments, " ");
	local recipients = {};

	for k, v in pairs(util.GetPlayers()) do
		if (v:IsAdmin()) then
			recipients[#recipients + 1] = v;
		end;
	end;

	if (#recipients > 0) then
		serverguard.netstream.Start(recipients, "sgTalkToAdmins", {player, text});
	end;

	if (util.IsConsole(player)) then
		return;
	end;

	if (!player:IsAdmin()) then
		if (#recipients > 0) then
			serverguard.Notify(player, SERVERGUARD.NOTIFY.WHITE, "Sent the message to the admin chat.");
		else
			serverguard.Notify(player, SERVERGUARD.NOTIFY.WHITE, "There are currently no admins online.");
		end;
	end;
end;

if (CLIENT) then
	serverguard.netstream.Hook("sgTalkToAdmins", function(data)
		local player = data[1];
		local text = data[2];

		if (util.IsConsole(player)) then
			chat.AddText(Color(255, 0, 0), "[Admins] ", color_white, "Console: " .. text .. "\n");
			return;
		end;

		if (player:Name() != player:Nick()) then
			chat.AddText(Color(255, 0, 0), "[Admins] ", team.GetColor(player:Team()), "(" .. player:Name() .. ") " .. player:Nick(), color_white, ": " .. text .. "\n");
			serverguard.PrintConsole("[Admins] (" .. player:Name() .. ") " .. player:Nick() .. ": " .. text);
		else
			chat.AddText(Color(255, 0, 0), "[Admins] ", team.GetColor(player:Team()), player:Nick(), color_white, ": " .. text .. "\n");
			serverguard.PrintConsole("[Admins] " .. player:Nick() .. ": " .. text);
		end;
	end);
end;

serverguard.command:Add(command);

--
-- The "clear decals" command.
--

local command = {};

command.help		= "Clear decals for everyone.";
command.command 	= "cleardecals";
command.permissions	= "Clear Decals";

function command:Execute(player, silent, arguments)
	serverguard.netstream.Start(nil, "sgClearDecals", 1);
	
	if (!silent) then
		serverguard.Notify(nil, SERVERGUARD.NOTIFY.GREEN, serverguard.player:GetName(player), SERVERGUARD.NOTIFY.WHITE, " has cleared all decals.");
	end;
end;

if (CLIENT) then
	serverguard.netstream.Hook("sgClearDecals", function(data)
		LocalPlayer():ConCommand("r_cleardecals", true);
	end);
end;

serverguard.command:Add(command);

--
-- The rcon command.
--

if (serverguard.RconEnabled) then
	local command = {}

	command.help		= "Run a command on the server.";
	command.command 	= "rcon";
	command.arguments	= {"text"};
	command.permissions	= "Rcon";

	function command:Execute(player, silent, arguments)
		game.ConsoleCommand(table.concat(arguments, " ") .. "\n");
	end;

	serverguard.command:Add(command);
end;

--
-- The god command.
--

local command = {}

command.help		= "Enable god mode for a player.";
command.command 	= "god";
command.arguments	= {"player"};
command.permissions	= "God mode";
command.immunity 	= SERVERGUARD.IMMUNITY.LESSOREQUAL;

function command:OnPlayerExecute(player, target)
	if (!target.sg_godEnabled) then
		target:GodEnable();
		target.sg_godEnabled = true;
		target:SetNetworkedBool("serverguard_godEnabled", true);
		
		return true;
	end;
end;

function command:OnNotify(player, targets)
	return SGPF("command_god", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets));
end;

function command:ContextMenu(player, menu, rankData)
	local option = menu:AddOption("Toggle God Mode", function() 
		if (!player:GetNetworkedBool("serverguard_godEnabled")) then
			serverguard.command.Run("god", false, player:Name());
		else
			serverguard.command.Run("ungod", false, player:Name());
		end;
	end);

	option:SetImage("icon16/shield.png");
end;

serverguard.command:Add(command);

--
-- The ungod command.
--

local command = {}

command.help		= "Disable god mode for a player.";
command.command 	= "ungod";
command.arguments	= {"player"};
command.permissions	= "God mode";
command.immunity 	= SERVERGUARD.IMMUNITY.LESSOREQUAL;

function command:OnPlayerExecute(player, target)
	if (target.sg_godEnabled) then
		target:GodDisable();
		target.sg_godEnabled = false;
		target:SetNetworkedBool("serverguard_godEnabled", false);
		
		return true;
	end;
end;

function command:OnNotify(player, targets)
	return SGPF("command_god_disable", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets));
end;

serverguard.command:Add(command);

--
-- The "set armor" command.
--

local command = {}

command.help		= "Set a player's armor.";
command.command 	= "armor";
command.arguments	= {"player", "armor"};
command.permissions	= "Set Armor";
command.immunity 	= SERVERGUARD.IMMUNITY.LESSOREQUAL;
command.aliases		= {"setarmor"};

function command:OnPlayerExecute(player, target, arguments)
	local amount = util.ToNumber(arguments[2]);
	target:SetArmor(amount);

	return true;
end;

function command:OnNotify(player, targets, arguments)
	local amount = util.ToNumber(arguments[2]);

	return SGPF("command_armor", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets, true), amount);
end;

function command:ContextMenu(player, menu, rankData)
	local option = menu:AddOption("Set Armor", function() 
		Derma_StringRequest("Set Armor", "Specify armor amount.", "", function(text) 
			serverguard.command.Run("armor", false, player:Name(), text);
		end, function(text) end, "Accept", "Cancel") end);

	option:SetImage("icon16/heart.png");
end;

serverguard.command:Add(command);

--
-- The "set health" command.
--

local command = {};

command.help		= "Set a player's health.";
command.command 	= "hp";
command.arguments	= {"player", "hp"};
command.permissions	= "Set Health";
command.immunity 	= SERVERGUARD.IMMUNITY.LESSOREQUAL;
command.aliases		= {"sethp", "sethealth"};

function command:OnPlayerExecute(player, target, arguments)
	local amount = util.ToNumber(arguments[2]);
	target:SetHealth(amount);

	return true;
end;

function command:OnNotify(player, targets, arguments)
	local amount = util.ToNumber(arguments[2]);

	return SGPF("command_hp", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets, true), amount);
end;

function command:ContextMenu(player, menu, rankData)
	local option = menu:AddOption("Set Health", function() 
		Derma_StringRequest("Set Health", "Specify health amount.", "", function(text)
			serverguard.command.Run("hp", false, player:Name(), text);
		end, function(text) end, "Accept", "Cancel") end);

	option:SetImage("icon16/heart.png");
end;

serverguard.command:Add(command);

--
-- The respawn command.
--

local command = {};

command.help		= "Respawn a player.";
command.command 	= "respawn";
command.arguments	= {"player"};
command.permissions	= "Respawn";
command.immunity 	= SERVERGUARD.IMMUNITY.LESSOREQUAL;

function command:OnPlayerExecute(player, target, arguments)
	target:Spawn();

	-- Needed for TTT.
	if (target.SpawnForRound) then
		target:SpawnForRound();

		-- Remove their corpse.
		if (IsValid(target.server_ragdoll)) then
			target.server_ragdoll:Remove();
		end;
	end;

	return true;
end;

function command:OnNotify(player, targets, arguments)
	local amount = util.ToNumber(arguments[2]);

	return SGPF("command_respawn", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets), amount);
end;

function command:ContextMenu(player, menu, rankData)
	local option = menu:AddOption("Respawn", function()
		serverguard.command.Run("respawn", false, player:Name());
	end);
	
	option:SetImage("icon16/user_go.png");
end;

serverguard.command:Add(command);

--
-- The full ammo command.
--

local command = {}

command.help		= "Give a player infinite ammo.";
command.command 	= "ammo";
command.arguments	= {"player"};
command.permissions	= "Give Ammo";
command.immunity 	= SERVERGUARD.IMMUNITY.LESSOREQUAL;

function command:OnPlayerExecute(player, target, arguments)
	target:GiveAmmo(999999, "AR2");
	target:GiveAmmo(999999, "AlyxGun");
	target:GiveAmmo(999999, "Pistol");
	target:GiveAmmo(999999, "SMG1");
	target:GiveAmmo(999999, "357");
	target:GiveAmmo(999999, "XBowBolt");
	target:GiveAmmo(999999, "Buckshot");
	target:GiveAmmo(999999, "RPG_Round");
	target:GiveAmmo(999999, "SMG1_Grenade");
	target:GiveAmmo(999999, "SniperRound");
	target:GiveAmmo(999999, "SniperPenetratedRound");
	target:GiveAmmo(999999, "Grenade");
	target:GiveAmmo(999999, "Thumper");
	target:GiveAmmo(999999, "Gravity");
	target:GiveAmmo(999999, "Battery");
	target:GiveAmmo(999999, "GaussEnergy");
	target:GiveAmmo(999999, "CombineCannon");
	target:GiveAmmo(999999, "AirboatGun");
	target:GiveAmmo(999999, "StriderMinigun");
	target:GiveAmmo(999999, "HelicopterGun");
	target:GiveAmmo(999999, "AR2AltFire");
	target:GiveAmmo(999999, "slam");

	return true;
end;

function command:OnNotify(player, targets, arguments)
	local amount = util.ToNumber(arguments[2]);

	return SGPF("command_ammo", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets), amount);
end;

function command:ContextMenu(player, menu, rankData)
	local option = menu:AddOption("Give Infinite Ammo", function()
		serverguard.command.Run("ammo", false, player:Name());
	end);
	
	option:SetImage("icon16/tab_add.png");
end;

serverguard.command:Add(command);

--
-- The slap command.
--

local slapSounds = {
	Sound("physics/body/body_medium_impact_hard1.wav"),
	Sound("physics/body/body_medium_impact_hard2.wav"),
	Sound("physics/body/body_medium_impact_hard3.wav"),
	Sound("physics/body/body_medium_impact_hard5.wav"),
	Sound("physics/body/body_medium_impact_hard6.wav"),
	Sound("physics/body/body_medium_impact_soft5.wav"),
	Sound("physics/body/body_medium_impact_soft6.wav"),
	Sound("physics/body/body_medium_impact_soft7.wav")
};

local command = {};

command.help		= "Slap a player.";
command.command 	= "slap";
command.arguments	= {"player"};
command.permissions	= "Slap";
command.immunity 	= SERVERGUARD.IMMUNITY.LESSOREQUAL;

function command:OnPlayerExecute(player, target, arguments)
	target:SetHealth(target:Health() -math.random(2, 6));
	target:SetVelocity(Vector(math.random(-225, 225), math.random(-225, 225), 10));
	target:EmitSound(slapSounds[math.random(1, #slapSounds)]);

	return true;
end;

function command:OnNotify(player, targets, arguments)
	local amount = util.ToNumber(arguments[2]);

	return SGPF("command_slap", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets), amount);
end;

function command:ContextMenu(player, menu, rankData)
	local option = menu:AddOption("Slap", function()
		serverguard.command.Run("slap", false, player:Name());
	end);

	option:SetImage("icon16/transmit_error.png");
end;
	
serverguard.command:Add(command);

--
-- The "toggle npc target" command.
--

local command = {};

command.help		= "Toggle NPC targeting for a player.";
command.command 	= "npctarget";
command.arguments	= {"player"};
command.permissions	= "NPC Target";
command.immunity 	= SERVERGUARD.IMMUNITY.LESSOREQUAL;

function command:OnPlayerExecute(player, target, arguments)
	if (target.sg_notarget == nil) then
		target.sg_notarget = false;
	end;
	
	target:SetNoTarget(!target.sg_notarget);
	target.sg_notarget = !target.sg_notarget;

	return true;
end;

function command:OnNotify(player, targets, arguments)
	local amount = util.ToNumber(arguments[2]);

	return SGPF("command_npctarget", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets), amount);
end;

function command:ContextMenu(player, menu, rankData)
	local option = menu:AddOption("Toggle NPC Target", function() 
		serverguard.command.Run("npctarget", false, player:Name());
	end);

	option:SetImage("icon16/transmit.png");
end;

serverguard.command:Add(command);

--
-- The slay command.
--

local command = {};

command.help		= "Slay a player.";
command.command 	= "slay";
command.arguments	= {"player"};
command.permissions	= "Slay";
command.immunity 	= SERVERGUARD.IMMUNITY.LESSOREQUAL;
command.aliases		= {"kill"};

function command:OnPlayerExecute(player, target, arguments)
	target:Kill();

	return true;
end;

function command:OnNotify(player, targets)
	return SGPF("command_slay", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets));
end;

function command:ContextMenu(player, menu, rankData)
	local option = menu:AddOption("Slay", function() 
		serverguard.command.Run("slay", false, player:Name());
	end);

	option:SetImage("icon16/user_delete.png");
end;

serverguard.command:Add(command);

--
-- The "give weapon" command.
--

local command = {};

command.help		= "Give a weapon to a player.";
command.command 	= "giveweapon";
command.arguments	= {"player", "weapon"};
command.permissions	= "Give Weapon";
command.immunity 	= SERVERGUARD.IMMUNITY.LESSOREQUAL;
command.aliases		= {"give"};

function command:OnPlayerExecute(player, target, arguments)
	local weapon = arguments[2];
	target:Give(weapon);

	return true;
end;

function command:OnNotify(player, targets, arguments)
	local weapon = arguments[2];

	return SGPF("command_giveweapon", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets), weapon);
end;

serverguard.command:Add(command);

--
-- The ragdoll command.
--

local command = {};

command.help		= "Ragdoll a player.";
command.command 	= "ragdoll";
command.arguments	= {"player"};
command.permissions	= "Ragdoll";
command.immunity 	= SERVERGUARD.IMMUNITY.LESSOREQUAL;

local function MakeInvisible(player, invisible)
	player:SetNoDraw(invisible);
	player:SetNotSolid(invisible);
	
	player:DrawViewModel(!invisible);
	player:DrawWorldModel(!invisible);

	if (invisible) then
		player:GodEnable();
	else
		player:GodDisable();
	end;
end;

function command:OnPlayerExecute(player, target, arguments)
	if (IsValid(target.sgRagdoll)) then
		MakeInvisible(target, false);
		
		local position = target.sgRagdoll:GetPos();
		
		target.sgRagdoll:Remove();
		
		target:SetParent(NULL);
		target:Spawn();
		target:SetPos(position +Vector(0, 0, 5));
		
		for k, weapon in pairs(target.sg_weapons) do
			target:Give(weapon);
		end;
		
		target.sg_weapons = nil;
	else
		target.sg_weapons = {};
		
		for k, weapon in pairs(target:GetWeapons()) do
			if (IsValid(weapon)) then
				table.insert(target.sg_weapons, weapon:GetClass());
			end;
		end;
		
		target.sgRagdoll = ents.Create("prop_ragdoll");
		target.sgRagdoll:SetPos(target:GetPos());
		target.sgRagdoll:SetModel(target:GetModel());
		target.sgRagdoll:SetAngles(target:GetAngles());
		target.sgRagdoll:SetSkin(target:GetSkin());
		target.sgRagdoll:SetMaterial(target:GetMaterial());
		target.sgRagdoll:Spawn();

		target.sgRagdoll:CallOnRemove("UnragdollPlayer", function(ragdoll)
			if (IsValid(target)) then
				MakeInvisible(target, false);

				local position = ragdoll:GetPos();
								
				target:SetParent(NULL);
				target:Spawn();
				target:SetPos(position +Vector(0, 0, 5));
				
				for k, weapon in pairs(target.sg_weapons) do
					target:Give(weapon);
				end;
				
				target.sg_weapons = nil;
			end;
		end);

		target.sgRagdoll:SetCollisionGroup(COLLISION_GROUP_WEAPON);
		
		local velocity = target:GetVelocity();
		local physObjects = target.sgRagdoll:GetPhysicsObjectCount() - 1;
		
		for i = 0, physObjects do
			local bone = target.sgRagdoll:GetPhysicsObjectNum(i);
			
			if (IsValid(bone)) then
				local position, angle = target:GetBonePosition(target.sgRagdoll:TranslatePhysBoneToBone(i));
				
				if (position and angle) then
					bone:SetPos(position);
					bone:SetAngles(angle);
				end;
				
				bone:AddVelocity(velocity);
			end;
		end;
		
		target:StripWeapons();
		target:SetMoveType(MOVETYPE_OBSERVER);
		target:Spectate(OBS_MODE_CHASE);
		target:SpectateEntity(target.sgRagdoll);
		target:SetParent(target.sgRagdoll);
		
		MakeInvisible(target, true);
	end;

	return true;
end;

function command:OnNotify(player, targets)
	return SGPF("command_ragdoll", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets));
end;

function command:ContextMenu(player, menu, rankData)
	local option = menu:AddOption("Toggle ragdoll", function() 
		serverguard.command.Run("ragdoll", false, player:Name());
	end);

	option:SetImage("icon16/television.png");
end;

serverguard.command:Add(command);

--
-- The ignite command.
--

local command = {};

command.help		= "Ignite a player.";
command.command 	= "ignite";
command.arguments	= {"player"};
command.permissions	= "Ignite";
command.immunity 	= SERVERGUARD.IMMUNITY.LESSOREQUAL;

function command:OnPlayerExecute(player, target, arguments)
	target:Ignite(99999999);

	return true;
end;

function command:OnNotify(player, targets, arguments)
	return SGPF("command_ignite", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets));
end;

function command:ContextMenu(player, menu, rankData)
	local option = menu:AddOption("Ignite", function() 
		serverguard.command.Run("ignite", false, player:Name());
	end);

	option:SetImage("icon16/bomb.png");
end;

serverguard.command:Add(command);

--
-- The extinguish command.
--

local command = {}

command.help		= "Extinguish a player.";
command.command 	= "extinguish";
command.arguments	= {"player"};
command.permissions	= "Extinguish";
command.immunity 	= SERVERGUARD.IMMUNITY.LESSOREQUAL;
command.aliases		= {"unignite"};

function command:OnPlayerExecute(player, target, arguments)
	target:Extinguish();

	return true;
end;

function command:OnNotify(player, targets, arguments)
	return SGPF("command_extinguish", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets));
end;

function command:ContextMenu(player, menu, rankData)
	local option = menu:AddOption("Extinguish", function() 
		serverguard.command.Run("extinguish", false, player:Name());
	end);

	option:SetImage("icon16/user_delete.png");
end;

serverguard.command:Add(command);

--
-- The mute command.
--

local command = {};

command.help		= "Mute a player.";
command.command 	= "mute";
command.arguments	= {"player"};
command.permissions	= "Mute";
command.immunity 	= SERVERGUARD.IMMUNITY.LESS;

function command:OnPlayerExecute(player, target, arguments)
	target.sgMuted = true;
	target:SetNetworkedBool("serverguard_muted", true);

	return true;
end;

function command:OnNotify(player, targets, arguments)
	return SGPF("command_mute", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets));
end;

function command:ContextMenu(player, menu, rankData)
	local option = menu:AddOption("Mute/Unmute", function() 
		if (player:GetNetworkedBool("serverguard_muted")) then
			serverguard.command.Run("unmute", false, player:Name());
		else
			serverguard.command.Run("mute", false, player:Name());
		end;
	end);

	option:SetImage("icon16/comment.png");
end;

serverguard.command:Add(command);

--
-- The unmute command.
--

local command = {};

command.help		= "Unmute a player.";
command.command 	= "unmute";
command.arguments	= {"player"};
command.permissions	= "Unmute";
command.immunity 	= SERVERGUARD.IMMUNITY.LESS;

function command:OnPlayerExecute(player, target, arguments)
	target.sgMuted = false;
	target:SetNetworkedBool("serverguard_muted", false);

	return true;
end;

function command:OnNotify(player, targets, arguments)
	return SGPF("command_unmute", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets));
end;

serverguard.command:Add(command);

--
-- The gag command.
--

local command = {};

command.help		= "Gag a player.";
command.command 	= "gag";
command.arguments	= {"player"};
command.permissions	= "Gag";
command.immunity 	= SERVERGUARD.IMMUNITY.LESS;

function command:OnPlayerExecute(player, target, arguments)
	target.sgGagged = true;
	target:SetNetworkedBool("serverguard_gagged", true);

	return true;
end;

function command:OnNotify(player, targets, arguments)
	return SGPF("command_gag", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets));
end;

function command:ContextMenu(player, menu, rankData)
	local option = menu:AddOption("Gag/Ungag", function() 
		if (player:GetNetworkedBool("serverguard_gagged")) then
			serverguard.command.Run("ungag", false, player:Name());
		else
			serverguard.command.Run("gag", false, player:Name());
		end;
	end);

	option:SetImage("icon16/sound.png");
end;

serverguard.command:Add(command);

--
-- The ungag command.
--

local command = {};

command.help		= "Ungag a player.";
command.command 	= "ungag";
command.arguments	= {"player"};
command.permissions	= "Ungag";
command.immunity 	= SERVERGUARD.IMMUNITY.LESS;

function command:OnPlayerExecute(player, target, arguments)
	target.sgGagged = false;
	target:SetNetworkedBool("serverguard_gagged", false);

	return true;
end;

function command:OnNotify(player, targets, arguments)
	return SGPF("command_ungag", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets));
end;

serverguard.command:Add(command);

if (SERVER) then
	hook.Add("PlayerCanHearPlayersVoice", "serverguard.PlayerCanHearPlayersVoice", function(listener, speaker)
		if (speaker.sgGagged) then
			return false;
		end;
	end);
end;

--
-- The invisible command.
--

local command = {};

command.help		= "Toggle a player's invisibility.";
command.command 	= "invisible";
command.arguments	= {"player"};
command.permissions	= "Invisible";
command.immunity 	= SERVERGUARD.IMMUNITY.LESSOREQUAL;
command.aliases		= {"cloak"};

function command:OnPlayerExecute(player, target, arguments)
	if (target.sg_invisible) then
		target:SetNoDraw(false);
		target:SetNotSolid(false);
		target:GodDisable();
		target:DrawWorldModel(true);

		target.sg_invisible = false;
	else
		target:SetNoDraw(true);
		target:SetNotSolid(true);
		target:GodEnable();
		target:DrawWorldModel(false);
		
		target.sg_invisible = true;
	end;

	return true;
end;

function command:OnNotify(player, targets)
	return SGPF("command_invisible", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets));
end;

function command:ContextMenu(player, menu, rankData)
	local option = menu:AddOption("Toggle Invisibility", function()
		serverguard.command.Run("invisible", false, player:Name());
	end);

	option:SetImage("icon16/user_edit.png");
end;

serverguard.command:Add(command);

--
-- The freeze command.
--

local command = {};

command.help		= "Freeze or unfreeze a player.";
command.command 	= "freeze";
command.arguments	= {"player"};
command.permissions	= "Freeze";
command.immunity 	= SERVERGUARD.IMMUNITY.LESSOREQUAL;

function command:OnPlayerExecute(player, target, arguments)
	if (target.sg_isFrozen) then
		target:Freeze(false);
		target.sg_isFrozen = false;

		if (target:GetMoveType() == MOVETYPE_NONE) then
			target:SetMoveType(MOVETYPE_WALK);
		end;
	else
		target:Freeze(true);
		target.sg_isFrozen = true;
	end;

	return true;
end;

function command:OnNotify(player, targets)
	return SGPF("command_freeze", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets));
end;

function command:ContextMenu(player, menu, rankData)
	local option = menu:AddOption("Freeze/Unfreeze", function() 
		serverguard.command.Run("freeze", false, player:Name());
	end);

	option:SetImage("icon16/joystick_error.png");
end;

serverguard.command:Add(command);

--
-- The "strip weapons" command.
--

local command = {};

command.help		= "Remove all weapons from a player.";
command.command 	= "stripweapons";
command.arguments	= {"player"};
command.permissions	= "Strip Weapons";
command.immunity 	= SERVERGUARD.IMMUNITY.LESSOREQUAL;
command.aliases		= {"strip"};

function command:OnPlayerExecute(player, target, arguments)
	target:StripWeapons();

	return true;
end;

function command:OnNotify(player, targets)
	return SGPF("command_stripweapons", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets));
end;

function command:ContextMenu(player, menu, rankData)
	local option = menu:AddOption("Strip Weapons", function() 
		serverguard.command.Run("stripweapons", false, player:Name());
	end);

	option:SetImage("icon16/gun.png");
end;

serverguard.command:Add(command);

--
-- The announce command.
--

local command = {};

command.help		= "Announce something to the server.";
command.command 	= "announce";
command.arguments	= {"text"};
command.permissions	= "Announce";

function command:Execute(player, silent, arguments)
	local text = table.concat(arguments, " ");
	
	serverguard.Notify(nil, SERVERGUARD.NOTIFY.RED, text);
end;

serverguard.command:Add(command);

--
-- The help command.
--

local command = {};

command.help		= "Ask admins for help.";
command.command 	= "help";
command.arguments	= {"text"};

function command:Execute(player, silent, arguments)
	local text = table.concat(arguments, " ");
	
	for k, v in pairs(util.GetPlayers()) do
		if (serverguard.player:HasPermission(v, "See Help Requests") or v == player) then
			serverguard.Notify(v, SERVERGUARD.NOTIFY.RED, "[HELP] ", SERVERGUARD.NOTIFY.WHITE, serverguard.player:GetName(player), SERVERGUARD.NOTIFY.WHITE, ": " .. text);

			player.sg_pendingHelpRequest = true;
		end;
	end;
end;

serverguard.command:Add(command);

local command = {};

command.help		= "Respond to a help request.";
command.command 	= "respond";
command.arguments	= {"player", "text"};
command.permissions = "Respond to Help Requests";

function command:Execute(player, silent, arguments)
	local target = util.FindPlayer(arguments[1], player);

	if (IsValid(target)) then
		if (target.sg_pendingHelpRequest) then
			local text = table.concat(arguments, " ", 2);

			for k, v in pairs(util.GetPlayers()) do
				if (serverguard.player:HasPermission(v, "See Help Requests") or v == target) then
					serverguard.Notify(v, SERVERGUARD.NOTIFY.RED, "[RESPONSE] ", SERVERGUARD.NOTIFY.WHITE, serverguard.player:GetName(player), SERVERGUARD.NOTIFY.WHITE, ": " .. text);

					player.sg_pendingHelpRequest = nil;
				end;
			end;
		else
			serverguard.Notify(player, SERVERGUARD.NOTIFY.RED, "That player doesn't have a pending help request.");
		end;
	end;
end;

serverguard.command:Add(command);

--
-- The spectate command.
--

local command = {};

command.help				= "Start spectating someone.";
command.command 			= "spectate";
command.arguments			= {"player"};
command.permissions			= "Spectate";
command.bDisallowConsole	= true;
command.bSingleTarget 		= true;
command.immunity 			= SERVERGUARD.IMMUNITY.LESSOREQUAL;

function command:OnPlayerExecute(player, target, arguments)
	if (player != target) then
		serverguard.player:SpectateTarget(player, target);
		serverguard.player:SetupSpectate(player, OBS_MODE_IN_EYE);

		serverguard.Notify(player, SGPF("command_spectate_hint"));
		return true;
	end;
end;

function command:OnNotify(player, targets)
	return SGPF("command_spectate", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets));
end;

function command:ContextMenu(player, menu, rankData)
	local option = menu:AddOption("Spectate", function() 
		serverguard.command.Run("spectate", false, player:Name());
	end);

	option:SetImage("icon16/camera.png");
end;

serverguard.command:Add(command);

--
-- The noclip command.
--

local command = {}

command.help 				= "Toggle noclip mode."
command.command 			= "noclip"
command.permissions			= "Noclip";
command.arguments 			= {"player"};
command.immunity 			= SERVERGUARD.IMMUNITY.LESSOREQUAL;
command.bDisallowConsole 	= true;

function command:OnPlayerExecute(player, target, arguments)
	if (target:GetMoveType() != MOVETYPE_NOCLIP) then
		target:SetMoveType(MOVETYPE_NOCLIP);
	else
		target:SetMoveType(MOVETYPE_WALK);
	end;

	return true;
end;

function command:OnNotify(player, targets)
	return SGPF("command_noclip", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets));
end;

hook.Add("PlayerNoClip", "serverguard.PlayerNoClip", function(player)
	if (player.sg_jail or player:GetNetworkedBool("serverguard_jailed", false)) then
		return false;
	end;

	if (serverguard.player:HasPermission(player, "Noclip")) then
		return true;
	end;
end);

function command:ContextMenu(player, menu, rankData)
	local option = menu:AddOption("Toggle Noclip", function() 
		serverguard.command.Run("noclip", false, player:Name());
	end);

	option:SetImage("icon16/arrow_up.png");
end;

serverguard.command:Add(command);

--
-- Restart the current map.
--

local command = {};

command.help		= "Restart the current map.";
command.command 	= "maprestart";
command.arguments	= {"delay seconds"};
command.permissions	= "Map Restart";
command.aliases		= {"restartmap"};

function command:Execute(player, silent, arguments)
	local delay = tonumber(arguments[1]);

	timer.Simple(delay, function()
		RunConsoleCommand("changelevel", game.GetMap());
	end);

	if (!silent) then
		serverguard.Notify(nil, SERVERGUARD.NOTIFY.GREEN, serverguard.player:GetName(player), SERVERGUARD.NOTIFY.WHITE, " is restarting the map in ", SERVERGUARD.NOTIFY.RED, tostring(delay), SERVERGUARD.NOTIFY.WHITE, " seconds!")
	end;
end;

serverguard.command:Add(command);

--
-- Freeze all props on the server.
--

local command = {};

command.help 		= "Freeze all props in the server.";
command.command 	= "freezeprops";
command.permissions = "Freeze Props";

function command:Execute(player, silent, arguments)
	for k, v in pairs(ents.FindByClass("prop_physics")) do
		local physicsObject = v:GetPhysicsObject();

		if (IsValid(physicsObject)) then
			physicsObject:EnableMotion(false);
		end;
	end;

	if (!silent) then
		serverguard.Notify(nil, SERVERGUARD.NOTIFY.GREEN, serverguard.player:GetName(player), SERVERGUARD.NOTIFY.WHITE, " has frozen all props.");
	end;
end;

serverguard.command:Add(command);

--
-- Jail a player.
--

local command = {};

command.help		= "Jail a player.";
command.command 	= "jail";
command.arguments	= {"player"};
command.permissions	= "Jail";
command.immunity 	= SERVERGUARD.IMMUNITY.LESSOREQUAL;

function command:OnPlayerExecute(player, target)
	if (!target.sg_jail) then
		serverguard:JailPlayer(target);

		return true;
	end;
end;

function command:OnNotify(player, targets)
	return SGPF("command_jail", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets));
end;

function command:ContextMenu(player, menu, rankData)
	local option = menu:AddOption("Jail/Unjail", function()
		if (!player:GetNetworkedBool("serverguard_jailed")) then
			serverguard.command.Run("jail", false, player:Name());
		else
			serverguard.command.Run("unjail", false, player:Name());
		end;
	end);

	option:SetImage("icon16/lock.png");
end;

serverguard.command:Add(command);

--
-- Teleport and jail a player.
--

local command = {};

command.help		= "Teleport and jail a player.";
command.command 	= "jailtp";
command.arguments	= {"player"};
command.permissions	= "Jail";
command.bDisallowConsole = true;

function command:OnPlayerExecute(player, target)
	if (!target.sg_jail) then
		target.sg_LastPosition = target:GetPos();
		target.sg_LastAngles = target:EyeAngles();

		target:SetPos(player:GetEyeTraceNoCursor().HitPos + Vector(0, 0, 5));
		serverguard:JailPlayer(target);

		return true;
	end;
end;

function command:OnNotify(player, targets)
	return SGPF("command_jailtp", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets));
end;

serverguard.command:Add(command);

--
-- Unjail a player.
--

local command = {};

command.help		= "Unjail a player.";
command.command 	= "unjail";
command.arguments	= {"player"};
command.permissions	= "Jail";
command.aliases		= {"release"};

function command:OnPlayerExecute(player, target)
	if (target.sg_jail) then
		serverguard:UnjailPlayer(target);

		return true;
	end;
end;

function command:OnNotify(player, targets)
	return SGPF("command_unjail", serverguard.player:GetName(player), util.GetNotifyListForTargets(targets));
end;

serverguard.command:Add(command);

-----------------------------------------------------
--[[
	© 2016 Thriving Ventures Ltd do not share, re-distribute or modify
	without permission of its author (gustaf@thrivingventures.com).
]]

local plugin = plugin;

plugin.name = "Restrictions";
plugin.author = "`impulse";
plugin.version = "1.2";
plugin.description = "Provides restrictions for each player, like how many props you can spawn or if you're allowed to noclip.";
plugin.permissions = {"Manage Restrictions"};

plugin:Hook("CanTool", "restrictions.CanTool", function(player, trace, tool)
	local uniqueID = serverguard.player:GetRank(player);

	if (uniqueID == "founder") then
		return true;
	end;

	local restrictionData = serverguard.ranks:GetData(uniqueID, "Restrictions", {});
	local toolList = {};

	if (restrictionData.Tools) then
		toolList = restrictionData.Tools;
	end;

	for k, v in pairs(toolList) do
		if (v.Command == tool) then
			if (!v.Value) then
				if (SERVER) then
					serverguard.Notify(player, SERVERGUARD.NOTIFY.RED, "You are not permitted to use this tool!");
				end;
				
				return false;
			end;
		end;
	end;
end);

-----------------------------------------------------
--[[
	© 2016 Thriving Ventures Ltd do not share, re-distribute or modify
	without permission of its author (gustaf@thrivingventures.com).
]]

local plugin = plugin;

plugin.name = "Reports";
plugin.author = "`impulse";
plugin.version = "1.0";
plugin.description = "A system to let players report something to admins.";
plugin.permissions = {"Manage Reports", "Delete All Reports"};

serverguard.phrase:Add("english", "report_received", {
	SERVERGUARD.NOTIFY.RED, "[REPORT] ", SERVERGUARD.NOTIFY.GREEN, "%s", SERVERGUARD.NOTIFY.WHITE, ": %s"
});
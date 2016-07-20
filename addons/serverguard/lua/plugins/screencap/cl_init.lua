
-----------------------------------------------------
--[[
	© 2016 Thriving Ventures Ltd do not share, re-distribute or modify
	without permission of its author (gustaf@thrivingventures.com).
]]

local plugin = plugin;

plugin:IncludeFile("shared.lua", SERVERGUARD.STATE.CLIENT)
plugin:IncludeFile("cl_panel.lua", SERVERGUARD.STATE.CLIENT)

local function split(str, d)
	local t = {};
	local len = str:len();
	local i = 0;
	
	while i *d < len do
		t[i +1] = str:sub(i *d +1, (i +1) *d);
		
		i = i +1;
	end;
	
	return t;
end;

serverguard.netstream.Hook("sgScreencapRequest", function(data)
	local util = util;
	local id = data[1];
	local quality = data[2];
	local binaryData = render.Capture({format = "jpeg", x = 0, y = 0, w = ScrW(), h = ScrH(), quality = quality});

	if (!binaryData) then
		serverguard.netstream.Start("sgScreencapFailed", {id});
	else
		local data = split(util.Base64Encode(binaryData), 61440);

		serverguard.netstream.Start("sgScreencapGetDataParts", {id, #data});

		for k, v in pairs(data) do
			timer.Simple(k * 0.4, function()
				local compressed = util.Compress(v);
				
				serverguard.netstream.Start("sgScreencapGetData", {
					id, compressed:len(), compressed
				});
			end);
		end;
	end;
end);

serverguard.netstream.Hook("sgScreencapGetDataParts", function(data)
	local uniqueID = data[1];
	local parts = data[2];

	g_ScreenCapData[uniqueID].parts = parts;
end);

serverguard.netstream.Hook("sgScreencapGetData", function(data)
	local uniqueID = data[1];
	local length = data[2];
	local captureData = util.Decompress(data[3]);
	
	table.insert(g_ScreenCapData[uniqueID].data, captureData);
end);

-----------------------------------------------------
--[[
	NetStream - 1.0.2

	Alexander Grist-Hucker
	http://www.revotech.org
	
	Credits to:
		Alexandru-Mihai Maftei aka Vercas for vON.
		https://github.com/vercas/vON
--]]

--- ## Shared
-- Networking helper library that provides easier access to networking with chunking support.
-- @module serverguard.netstream

local type, error, pcall, pairs, AddCSLuaFile, _player = type, error, pcall, pairs, AddCSLuaFile, player;

--[[
	AddCSLuaFile("includes/modules/von.lua");
	require("von");
--]]

if (!serverguard.von) then
	error("NetStream: Unable to find vON!");
end;

AddCSLuaFile();

serverguard.netstream = serverguard.netstream or {};

local stored = {};
local chunks = {};

--- Splits a table into a series of strings for easier networking.
-- @see serverguard.netstream.Build
-- @table data The data to split.
-- @treturn table A table of strings representing the split data.
function serverguard.netstream.Split(data)
	if (type(data) != "string") then
		data = serverguard.von.serialize(data);
	end;

	local index = 1;
	local result = {};
	local buffer = {};

	for i = 0, string.len(data) do
		buffer[#buffer + 1] = string.sub(data, i, i);
				
		if (#buffer == 32768) then
			result[#result + 1] = table.concat(buffer);
				index = index + 1;
			buffer = {};
		end;
	end;

	result[#result + 1] = table.concat(buffer);
	
	return result;
end;

--- Reconstructs a table of split strings.
-- @see serverguard.netstream.Split
-- @table data The data to reconstruct.
-- @treturn table The reconstructed data.
function serverguard.netstream.Build(data)
	return serverguard.von.deserialize(table.concat(data));
end;

--- Adds a hook to a data stream.
-- @see serverguard.netstream.Start
-- @string name Name of the data stream.
-- @func callback Function to execute when the data stream has been received.
function serverguard.netstream.Hook(name, Callback)
	if (!stored[name]) then
		stored[name] = {};
	end;

	table.insert(stored[name], Callback);
end;

function serverguard.netstream.GetStored()
	return stored;
end;

if (SERVER) then
	local chunkQueue = {};

	util.AddNetworkString("ServerGuardDS");
	util.AddNetworkString("ServerGuardChunkedDS");

	--- Sends a data stream to the target. Will send to client as server and vice versa.
	-- @see serverguard.netstream.Hook
	-- @player player The player to send the data to. You should **not** pass this argument clientside.
	-- @string name The name of the data stream to send.
	-- @table data The data to send.
	function serverguard.netstream.Start(player, name, data)
		local recipients = {};
		local bShouldSend = false;
	
		if (type(player) != "table") then
			if (!player) then
				player = _player.GetAll();
			else
				player = {player};
			end;
		end;
		
		for k, v in pairs(player) do
			if (type(v) == "Player") then
				recipients[#recipients + 1] = v;
				
				bShouldSend = true;
			elseif (type(k) == "Player") then
				recipients[#recipients + 1] = k;
			
				bShouldSend = true;
			end;
		end;
		
		local dataTable = {data = (data or 0)};
		local vonData = serverguard.von.serialize(dataTable);
			
		if (vonData and #vonData > 0 and bShouldSend) then
			net.Start("ServerGuardDS");
				net.WriteString(name);
				net.WriteUInt(#vonData, 32);
				net.WriteData(vonData, #vonData);
			net.Send(recipients);
		end;
	end;

	--- Sends a data stream to the target. This is used for larger data sets that may exceed the 64kb networking limit.
	-- @see serverguard.netstream.Hook
	-- @player player The player to send the data to. You should **not** pass this argument clientside.
	-- @string name The name of the data stream to send.
	-- @table data The data to send.
	function serverguard.netstream.StartChunked(player, name, data)
		local recipients = {};
		local bShouldSend = false;

		if (type(player) != "table") then
			if (!player) then
				player = _player.GetAll();
			else
				player = {player};
			end;
		end;
		
		for k, v in pairs(player) do
			if (type(v) == "Player") then
				recipients[#recipients + 1] = v;
				
				bShouldSend = true;
			elseif (type(k) == "Player") then
				recipients[#recipients + 1] = k;
			
				bShouldSend = true;
			end;
		end;
		
		local dataTable = {data = (data or 0)};
		local splitData = serverguard.netstream.Split(dataTable);

		if (splitData and #splitData > 0 and bShouldSend) then
			chunkQueue[name] = {
				recipients = recipients,
				data = splitData;
			};

			net.Start("ServerGuardChunkedDS");
				net.WriteString(name);
				net.WriteUInt(1, 32);
				net.WriteUInt(#splitData, 32);

				net.WriteUInt(#splitData[1], 32);
				net.WriteData(splitData[1], #splitData[1]);
			net.Send(recipients);
		end;
	end;
	
	net.Receive("ServerGuardDS", function(length, player)
		local NS_DS_NAME = net.ReadString();
		local NS_DS_LENGTH = net.ReadUInt(32);
		local NS_DS_DATA = net.ReadData(NS_DS_LENGTH);
		
		if (NS_DS_NAME and NS_DS_DATA and NS_DS_LENGTH) then
			player.nsDataStreamName = NS_DS_NAME;
			player.nsDataStreamData = "";
			
			if (player.nsDataStreamName and player.nsDataStreamData) then
				player.nsDataStreamData = NS_DS_DATA;
								
				if (stored[player.nsDataStreamName]) then
					local bStatus, value = pcall(serverguard.von.deserialize, player.nsDataStreamData);
					
					if (bStatus) then
						for k, v in pairs(stored[player.nsDataStreamName]) do
							v(player, value.data);
						end;
					else
						ErrorNoHalt("NetStream: '"..NS_DS_NAME.."'\n"..value.."\n");
					end;
				end;
				
				player.nsDataStreamName = nil;
				player.nsDataStreamData = nil;
			end;
		end;
		
		NS_DS_NAME, NS_DS_DATA, NS_DS_LENGTH = nil, nil, nil;
	end);

	net.Receive("ServerGuardChunkedDS", function(length, player)
		local NS_DS_NAME = net.ReadString();
		local NS_DS_NEXT = net.ReadUInt(32);

		if (!chunkQueue[NS_DS_NAME] or !chunkQueue[NS_DS_NAME].data[NS_DS_NEXT] or !table.HasValue(chunkQueue[NS_DS_NAME].recipients, player)) then
			return;
		end;

		if (NS_DS_NEXT >= #chunkQueue[NS_DS_NAME].data) then
			for k, v in pairs(chunkQueue[NS_DS_NAME].recipients) do
				if (v == player) then
					chunkQueue[NS_DS_NAME].recipients[k] = nil;
				end;
			end;
		end;

		net.Start("ServerGuardChunkedDS");
			net.WriteString(NS_DS_NAME);
			net.WriteUInt(NS_DS_NEXT, 32);
			net.WriteUInt(#chunkQueue[NS_DS_NAME].data, 32);

			net.WriteUInt(#chunkQueue[NS_DS_NAME].data[NS_DS_NEXT], 32);
			net.WriteData(chunkQueue[NS_DS_NAME].data[NS_DS_NEXT], #chunkQueue[NS_DS_NAME].data[NS_DS_NEXT]);
		net.Send(player);
	end);
else
	function serverguard.netstream.Start(name, data)
		local dataTable = {data = (data or 0)};
		local vonData = serverguard.von.serialize(dataTable);
		
		if (vonData and #vonData > 0) then
			net.Start("ServerGuardDS");
				net.WriteString(name);
				net.WriteUInt(#vonData, 32);
				net.WriteData(vonData, #vonData);
			net.SendToServer();
		end;
	end;
	
	net.Receive("ServerGuardDS", function(length)
		local NS_DS_NAME = net.ReadString();
		local NS_DS_LENGTH = net.ReadUInt(32);
		local NS_DS_DATA = net.ReadData(NS_DS_LENGTH);
		
		if (NS_DS_NAME and NS_DS_DATA and NS_DS_LENGTH) then
			if (stored[NS_DS_NAME]) then
				local bStatus, value = pcall(serverguard.von.deserialize, NS_DS_DATA);
			
				if (bStatus) then
					for k, v in pairs(stored[NS_DS_NAME]) do
						v(value.data);
					end;
				else
					ErrorNoHalt("NetStream: '"..NS_DS_NAME.."'\n"..value.."\n");
				end;
			end;
		end;
		
		NS_DS_NAME, NS_DS_DATA, NS_DS_LENGTH = nil, nil, nil;
	end);

	net.Receive("ServerGuardChunkedDS", function(length)
		local NS_DS_NAME = net.ReadString();
		local NS_DS_CURRENT = net.ReadUInt(32);
		local NS_DS_TOTAL = net.ReadUInt(32);

		local NS_DS_LENGTH = net.ReadUInt(32);
		local NS_DS_DATA = net.ReadData(NS_DS_LENGTH);
		
		if (!NS_DS_NAME or !NS_DS_CURRENT or !NS_DS_TOTAL or !NS_DS_LENGTH or !NS_DS_DATA) then
			return;
		end;

		if (!chunks[NS_DS_NAME]) then
			chunks[NS_DS_NAME] = {};
		end;

		if (NS_DS_CURRENT > 0 and NS_DS_DATA) then
			table.insert(chunks[NS_DS_NAME], NS_DS_DATA);
		end;

		if (NS_DS_CURRENT >= NS_DS_TOTAL) then
			if (chunks[NS_DS_NAME] and stored[NS_DS_NAME]) then
				local bStatus, value = pcall(serverguard.netstream.Build, chunks[NS_DS_NAME]);
			
				if (bStatus) then
					for k, v in pairs(stored[NS_DS_NAME]) do
						v(value.data);
					end;

					chunks[NS_DS_NAME] = nil;
				else
					ErrorNoHalt("NetStream: '"..NS_DS_NAME.."'\n"..value.."\n");
				end;
			end;
		else
			net.Start("ServerGuardChunkedDS");
				net.WriteString(NS_DS_NAME);
				net.WriteUInt(NS_DS_CURRENT + 1, 32);
			net.SendToServer();
		end;
		
		NS_DS_NAME, NS_DS_CURRENT, NS_DS_TOTAL, NS_DS_LENGTH, NS_DS_DATA = nil, nil, nil, nil, nil;
	end);
end;
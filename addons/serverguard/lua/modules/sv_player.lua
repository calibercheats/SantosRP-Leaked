
-----------------------------------------------------
--[[
	© 2016 Thriving Ventures Ltd do not share, re-distribute or modify
	without permission of its author (gustaf@thrivingventures.com).
]]

function serverguard.player:Load(player)
	local queryObj = serverguard.mysql:Select("serverguard_users");
		queryObj:Where("steam_id", player:SteamID());
		queryObj:Callback(function(result, status, lastID)
			if (type(result) == "table" and #result > 0) then
				if (result[1].rank) then
					local rankData = serverguard.ranks:GetRank(result[1].rank);
					
					if (rankData) then
						serverguard.player:SetRank(player, rankData.unique, true);
						serverguard.player:SetImmunity(player, rankData.immunity);
					end;
				end;

				serverguard.player:Save(player);
			else
				serverguard.player:Save(player, true);
			end;
		end);
	queryObj:Execute();
end;

function serverguard.player:Save(player, bNew)
	if (bNew) then
		local insertObj = serverguard.mysql:Insert("serverguard_users");
			insertObj:Insert("name", player:Nick());
			insertObj:Insert("rank", "user");
			insertObj:Insert("steam_id", player:SteamID());
			insertObj:Insert("last_played", os.time());
		insertObj:Execute();
	else
		local updateObj = serverguard.mysql:Update("serverguard_users");
			updateObj:Update("name", player:Nick());
			updateObj:Update("rank", serverguard.player:GetRank(player));
			updateObj:Update("last_played", os.time());
			updateObj:Where("steam_id", player:SteamID());
		updateObj:Execute();
	end;
end;

function serverguard.player:SaveField(player, field, value)
	local updateObj = serverguard.mysql:Update("serverguard_users");
		updateObj:Update(string.lower(field), value);
		updateObj:Where("steam_id", player:SteamID());
	updateObj:Execute();
end;
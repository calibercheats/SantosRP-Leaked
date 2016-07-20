
-----------------------------------------------------
--[[
	© 2016 Thriving Ventures Ltd do not share, re-distribute or modify
	without permission of its author (gustaf@thrivingventures.com).
]]

local category = {}

category.name = "Rank list"
category.material = "serverguard/menuicons/icon_rank_list.png"
category.permissions = "Manage Ranks"

function category:Create(base)
	base.panel = base:Add("tiger.panel")
	base.panel:SetTitle("Rank list")
	base.panel:Dock(FILL)
	base.panel:DockPadding(24, 24, 24, 48)
	
	base.panel.list = base.panel:Add("tiger.list")
	base.panel.list:Dock(FILL)
	base.panel.list.sortColumn = 3
	
	base.panel.list:AddColumn("PLAYER", 250)
	base.panel.list:AddColumn("STEAMID", 250)
	base.panel.list:AddColumn("RANK", 75)

	hook.Call("serverguard.panel.RankList", nil, base.panel.list);
	
	local refresh = base.panel:Add("tiger.button")
	refresh:SetPos(4, 4)
	refresh:SetText("Refresh")
	refresh:SizeToContents()
	
	function refresh:DoClick()
		base.panel.list:Clear()
		
		serverguard.netstream.Start("sgRequestPlayerRanks", true);
	end
	
	function base.panel.list:Think()
		if (self.nextUpdate and self.nextUpdate <= CurTime()) then
			refresh:DoClick()
			
			self.nextUpdate = nil
		end
	end
	
	function base.panel:PerformLayout()
		local w, h = self:GetSize()
		
		refresh:SetPos(w -(refresh:GetWide() +24), h -(refresh:GetTall() +14))
	end
	
	category.list = base.panel.list
end

function category:Update(base)
end

serverguard.menu.AddCategory(category)

serverguard.netstream.Hook("sgGetRankList", function(data)
	local steamid = data[1];
	local rank = data[2];
	local name = data[3];

	if (rank and rank == "user") then return; end;

	local rankData = serverguard.ranks:GetRank(rank);
	
	local rankName = "";
	
	if (!rankData) then
		rankName = "Unknown rank (REMOVED)";
	else
		rankName = rankData.name;
	end;
	
	local panel = category.list:AddItem(name, steamid, rankName);
	panel.steamid = steamid;
	
	function panel:OnMousePressed()
		local menu = DermaMenu();
			menu:SetSkin("serverguard");
			
			local rankMenu, menuOption = menu:AddSubMenu("Change Rank");
			
			rankMenu:SetSkin("serverguard");
			menuOption:SetImage("icon16/award_star_add.png");
			
			local sorted = {};
			
			for k, v in pairs(serverguard.ranks:GetTable()) do
				table.insert(sorted, v);
			end;
			
			table.sort(sorted, function(a, b)
				return a.immunity > b.immunity;
			end);
			
			for _, data in pairs(sorted) do
				local option = rankMenu:AddOption(data.name, function()
					serverguard.netstream.Start("sgChangePlayerRank", {
						self.steamid, data.unique
					});
					
					category.list.nextUpdate = CurTime() +1;
				end);
				
				if (data.texture and data.texture != "") then
					option:SetImage(data.texture);
				end;
			end;
		menu:Open();
	end;
	
	if (rankData) then
		local rankLabel = panel:GetLabel(3);
			rankLabel:SetColor(rankData.color);
			rankLabel:SetSort(rankData.immunity);
		rankLabel.oldColor = rankData.color;
	end;
end);

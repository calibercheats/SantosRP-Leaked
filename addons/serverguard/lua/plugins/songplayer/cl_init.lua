
-----------------------------------------------------
--[[
	© 2016 Thriving Ventures Ltd do not share, re-distribute or modify
	without permission of its author (gustaf@thrivingventures.com).
]]

local plugin = plugin;

plugin.player = plugin.player or {};

plugin:IncludeFile("cl_player.lua", SERVERGUARD.STATE.CLIENT);
plugin:IncludeFile("shared.lua", SERVERGUARD.STATE.CLIENT);
plugin:IncludeFile("sh_commands.lua", SERVERGUARD.STATE.CLIENT);
plugin:IncludeFile("cl_panel.lua", SERVERGUARD.STATE.CLIENT);

-- HTML player methods.
AccessorFunc(plugin.player, "m_bPlaying", "Playing", FORCE_BOOL);
AccessorFunc(plugin.player, "m_Volume", "Volume", FORCE_NUMBER);

AccessorFunc(plugin.player, "m_Duration", "Duration", FORCE_NUMBER);
AccessorFunc(plugin.player, "m_StartTime", "StartTime", FORCE_NUMBER);

function plugin.player:Create()
	if (!IsValid(self.player)) then
		local panel = vgui.Create("DHTML");
			panel:SetSize(480, 300);
			panel:SetPos(50, 50);
			panel:SetHTML(plugin.playerHTML);
			panel:SetAllowLua(true);
			panel:SetMouseInputEnabled(false);

			panel.oldConsoleMessage = panel.ConsoleMessage;
			panel.ConsoleMessage = function(_panel, text)
				if (string.sub(text, 1, 3) != "sg:") then
					return;
				end;

				if (text == "sg:playerStarted") then
					serverguard.songplayer:PlayerStarted();
				end;
			end;
		panel:SetPaintedManually(true);

		self.panel = panel;
		self:SetPlaying(false);
		self:SetDuration(0);
		self:SetStartTime(CurTime());
		self.m_Volume = 50;

		panel = vgui.Create("serverguard.songplayer");
		plugin.ui.panel = panel;

		timer.Simple(2, function() -- might take a second for the youtube frame to load
			self:SetVolume(50);
		end);
	else
		self:Stop();
	end;
end;

function plugin.player:SetVolume(volume)
	volume = math.Clamp(volume, 0, 100);

	self.panel:RunJavascript(string.format("setVolume(\"%s\");", volume));
	self.m_Volume = volume;
end;

function plugin.player:GetPanel()
	return self.panel;
end;

function plugin.player:Resume()
	self.panel:RunJavascript("resume();");
	self:SetPlaying(true);
end;

function plugin.player:Pause()
	self.panel:RunJavascript("pause();");
	self:SetPlaying(false);
end;

function plugin.player:Stop()
	self.panel:RunJavascript("stop();");
	self:SetPlaying(false);
end;

function plugin.player:PlayID(id, offsetTime)
	self.panel:RunJavascript(string.format("play(\"%s\", \"%s\");", id, offsetTime));
end;

function plugin.player:GetDeltaTime()
	return CurTime() - self:GetStartTime();
end;

-- Plugin methods.
function plugin:FetchVideoInfo(id, callback)
	HTTP({
		url = string.format(SERVERGUARD.ENDPOINT .. "playerinfo/%s", id),
		success = function(code, body, headers)
			local data = util.JSONToTable(body);
			callback(data);
		end,
		failed = function(error)
			if (IsValid(plugin.ui.panel)) then
				plugin.player:Stop();
				plugin.ui.panel:SetTitle("Error loading song!");
				plugin.ui.panel:FadeOut();

				serverguard.PrintConsole("There was a problem loading the YouTube video!\n");
			end;
		end
	});
end;

function plugin:Play(id, offsetTime)
	offsetTime = offsetTime or 0;

	self.player:Stop();
	self.ui.panel:SetLoading(true);
	self.ui.panel:SetTitle("Loading song...");

	if (!self.ui.panel:IsVisible()) then
		self.ui.panel:FadeIn();
	end;

	self:FetchVideoInfo(id, function(data)
		if (data != nil and data.embeddable) then
			self.player:PlayID(id, offsetTime);
			self.player:Pause();

			local duration = util.IsoDurationToSeconds(data.duration);
			plugin.currentTitle = data.title;
			plugin.offsetTime = offsetTime;

			if (duration != -1) then
				self.player:SetDuration(duration);
			else
				self.player:SetDuration(60); -- this should be better accounted for
			end;

			self.player:SetStartTime(CurTime() - plugin.offsetTime);
			self.player:Resume();
		else
			plugin.player:Stop();
			plugin.ui.panel:SetTitle("Error loading song!");
			plugin.ui.panel:FadeOut();

			serverguard.PrintConsole("There was a problem loading the YouTube video!\n");
		end;
	end);
end;

serverguard.songplayer = {};

function serverguard.songplayer:PlayerStarted()
	plugin.ui.panel:SetLoading(false);
	plugin.ui.panel:SetTitle(plugin.currentTitle);

	plugin.player:SetStartTime(CurTime() - plugin.offsetTime);
end;

plugin:Hook("Think", "serverguard.songplayer.Think", function()
	if (plugin.player:GetPlaying()) then
		if (plugin.player:GetDeltaTime() > plugin.player:GetDuration()) then
			plugin.player:Stop();
			plugin.ui.panel:FadeOut();
		end;
	end;
end);

plugin:Hook("OnContextMenuOpen", "serverguard.songplayer.OnContextMenuOpen", function()
	if (IsValid(plugin.ui.panel) and plugin.ui.panel:IsVisible()) then
		-- some gamemodes like clockwork like to arbitrarily control the context menu, so we
		-- have to delay the panel update by a bit to make sure we've got the final result
		timer.Simple(0.1, function()
			local x, y = plugin.ui.panel:GetPos();
			local parentPanel = vgui.GetWorldPanel();

			if (IsValid(g_ContextMenu) and g_ContextMenu:IsVisible()) then
				parentPanel = g_ContextMenu;

				if (IsValid(menubar.Control) and menubar.Control:IsVisible()) then
					plugin.ui.panel:SetPos(x, 30);
				else
					plugin.ui.panel:SetPos(x, 0);
				end;
			end;

			plugin.ui.panel:SetParent(parentPanel);
			plugin.ui.panel:MoveToFront();
		end);
	end;
end);

plugin:Hook("OnContextMenuClose", "serverguard.songplayer.OnContextMenuClose", function()
	if (IsValid(plugin.ui.panel) and plugin.ui.panel:IsVisible()) then
		local x, y = plugin.ui.panel:GetPos();

		plugin.ui.panel:SetPos(x, 0);
		plugin.ui.panel:SetParent(vgui.GetWorldPanel());
		plugin.ui.panel:MoveToFront();
	end;
end);

plugin:Hook("serverguard.LoadPlayerData", "serverguard.songplayer.LoadPlayerData", function()
	plugin.player:Create();
end);

serverguard.netstream.Hook("sgSongPlayerPlay", function(data)
	plugin:Play(data[1], data[2]);
end);

serverguard.netstream.Hook("sgSongPlayerStop", function(data)
	plugin.player:Stop();
	plugin.ui.panel:FadeOut();
end);
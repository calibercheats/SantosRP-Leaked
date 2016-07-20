
-----------------------------------------------------
--[[
	© 2016 Thriving Ventures Ltd do not share, re-distribute or modify
	without permission of its author (gustaf@thrivingventures.com).
]]

--
-- Common Prop Protection Interface Support
-- http://ulyssesmod.net/archive/CPPI_v1-1.pdf
--

local randomNumber = math.Round(math.random() *50000)

CPPI = CPPI or {}
CPPI.CPPI_DEFER = randomNumber
CPPI.CPPI_NOTIMPLEMENTED = randomNumber +1

--
--
--

function CPPI:GetName()
	return "ServerGuard"
end

--
--
--

function CPPI:GetVersion()
	return "1.1"
end

--
--
--

function CPPI:GetInterfaceVersion()
	return 1.1
end

--
--
--

function CPPI:GetNameFromUID(uniqueID)
	local target = util.FindPlayer(tostring(uniqueID))
	
	if (IsValid(target)) then
		return target:Nick()
	end
end

local meta = FindMetaTable("Player")

--
--
--

function meta:CPPIGetFriends()
	local serverguard = SERVER and self.serverguard or CLIENT and g_serverGuard
	
	return serverguard and serverguard.prop_protection.friends
end

local meta = FindMetaTable("Entity")

--
--
--

function meta:CPPIGetOwner()
	if (self.serverguard) then
		if (!IsValid(self.serverguard.owner) and self.serverguard.owner != game.GetWorld()) then
			for k, v in pairs(player.GetAll()) do
				if (v:SteamID() == self.serverguard.steamID) then
					self.serverguard.owner = v;
				end;
			end;
		end;
		
		if (self.serverguard.owner) then
			if (IsValid(self.serverguard.owner) or self.serverguard.owner == game.GetWorld()) then
				return self.serverguard.owner, self.serverguard.uniqueID;
			end;
		end;
	else
		if (self.GetPlayer) then
			local player = self:GetPlayer();

			if (IsValid(player)) then
				self:CPPISetOwner(player);

				return player, player:UniqueID();
			end;
		end;
	end;

	return CPPI.CPPI_DEFER, CPPI.CPPI_DEFER;
end;

if (SERVER) then
	local plugin = plugin
	
	--
	--
	--

	function meta:CPPISetOwner(player)
		self.serverguard = self.serverguard or {}
		
		local name
		local steamID
		local uniqueID
		
		if (player == game.GetWorld()) then
			name = "World"
			steamID = "World"
			uniqueID = "World"
		else
			name = serverguard.player:GetName(player)
			steamID = player:SteamID()
			uniqueID = player:UniqueID()
		end
		
		self.serverguard.owner = player
		self.serverguard.name = name
		self.serverguard.steamID = steamID
		self.serverguard.uniqueID = uniqueID
		
		serverguard.netstream.Start(nil, "sgPropProtectionClearEntityData", self);

		hook.Call("CPPIAssignOwnership", nil, player, self, uniqueID);
	end
	
	--
	--
	--

	function meta:CPPISetOwnerUID(uniqueID)
		self.serverguard.uniqueID = uniqueID
	end
	
	--
	--
	--

	function meta:CPPICanTool(player, toolMode)
		return plugin.CanTool(player, nil, toolMode)
	end
	
	--
	--
	--

	function meta:CPPICanPhysgun(player)
		return plugin.PhysgunPickup(player, self)
	end
	
	--
	--
	--

	function meta:CPPICanPickup(player)
		return plugin.GravGunPickupAllowed(player, self)
	end
end
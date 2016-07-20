
-----------------------------------------------------
if not serverguard then return end

local Module = {}
Module.Name = "ServerGuard Integration: Shared Component"
Module.AllowedCMDs = {
	["freeze"] = true,
	["send"] = true,
	["spectate"] = true,
	["kick"] = true,
	["ungod"] = true,
	["report"] = true,
	["cleardecals"] = true,
	["noclip"] = true,
	["unmute"] = true,
	["announce"] = true,
	["pm"] = true,
	["invisible"] = true,
	["ungag"] = true,
	["gag"] = true,
	["help"] = true,
	["ignite"] = true,
	["menu"] = true,
	["bring"] = true,
	["return"] = true,
	["extinguish"] = true,
	["ban"] = true,
	["slay"] = true,
	["plugintoggle"] = true,
	["mute"] = true,
	["unban"] = true,
	["respond"] = true,
	["rank"] = true,
	["goto"] = true,
	["a"] = true,
	["god"] = true,
}

function Module:OnLoad()
	self:RequireHook( "Initialize" )
end

function Module:Initialize()
	--Some of these commands could cause issues with the gamemode (mainly weapon/armor/ammo/spawning/jailing commands)
	--so only whitelist what we want and remove the rest
	local cmds = serverguard.permission:GetAll()
	for k, v in pairs( serverguard.command:GetTable() ) do
		if not self.AllowedCMDs[k] then
			if v.permissions then --Clean these up!
				if type( v.permissions ) == "string" then
					serverguard.permission:Remove( v.permissions )
				else
					for k2, v2 in pairs( v.permissions ) do
						serverguard.permission:Remove( v2 )
					end
				end
			end

			--Remove the command
			serverguard.command:Remove( k )
		end
	end

	--Suppress global notify - silent mode
	g_ServerGuardNotif = g_ServerGuardNotif or serverguard.Notify

	serverguard.Notify = function( pPlayer, ... )
		if not IsValid( pPlayer ) then return end
		return g_ServerGuardNotif( pPlayer, ... )
	end

	self:RegisterGamemodeCommands()
end

function Module:RegisterGamemodeCommands()
	--Unragdoll
	local command = {}
	command.help = "Un-ragdoll/revive another player."
	command.command = "unrag"
	command.arguments = { "player" }
	command.optionalArguments = {}
	command.bDisallowConsole = true
	command.permissions = { "Un-Ragdoll" }

	function command:OnPlayerExecute( pPlayer, pTarget, tblArgs )
		if pTarget then
			if pTarget:IsUncon() then
				pTarget:WakeUp()
				return true
			elseif pTarget:IsRagdolled() then
				pTarget:UnRagdoll()
				return true
			end
		end
	end
	function command:ContextMenu( player, menu, rankData )
		local option = menu:AddOption( "Un-Ragdoll", function()
			serverguard.command.Run( "unrag", false, player:SteamID64() )
		end )
		option:SetImage( "icon16/heart.png" )
	end
	serverguard.command:Add( command )

	--Change RP Name
	local command = {}
	command.help = "Changes a player's rp name and saves to sql."
	command.command = "setrpname"
	command.arguments = { "player", "name_first", "name_last" }
	command.optionalArguments = {}
	command.bDisallowConsole = true
	command.permissions = { "Set RP Name" }

	function command:OnPlayerExecute( pPlayer, pTarget, tblArgs )
		local first, last = tblArgs[2], tblArgs[3]
		if not first or not last then return end
		
		if first:len() <= 0 or last:len() <= 0 then
			return
		end

		local id = GAMEMODE.SQL:GetPlayerPoolID( pTarget:SteamID64() )
		GAMEMODE.SQL:UpdateCharacterFirstName( id, pTarget:GetCharacterID(), first )
		GAMEMODE.SQL:UpdateCharacterLastName( id, pTarget:GetCharacterID(), last )
		GAMEMODE.Player:SetSharedGameVar( pTarget, "name_first", first )
		GAMEMODE.Player:SetSharedGameVar( pTarget, "name_last", last )	
		pTarget:GetCharacter().Name.First = first 
		pTarget:GetCharacter().Name.Last = last
		return true
	end
	function command:ContextMenu( player, menu, rankData )
		local option = menu:AddOption( "Set RP Name", function()
			Derma_StringRequest(
				"Set RP Name",
				"Enter new first name",
				"",
				function( strNameFirst )
					if not strNameFirst or strNameFirst:Trim():len() <= 0 then return end
					Derma_StringRequest(
						"Set RP Name",
						"Enter new last name",
						"",
						function( strNameLast )
							if not strNameLast or strNameLast:Trim():len() <= 0 then return end
							serverguard.command.Run( "setrpname", false, player:SteamID64(), strNameFirst, strNameLast )
						end,
						function( str )
						end,
						"Change Name",
						"Cancel"
					)
				end,
				function( str )
				end,
				"Continue",
				"Cancel"
			)
		end )

		option:SetImage( "icon16/overlays.png" )
	end
	serverguard.command:Add( command )

	--Uncuff
	local command = {}
	command.help = "Frees a player from handcuffs or zipties."
	command.command = "uncuff"
	command.arguments = { "player" }
	command.optionalArguments = {}
	command.bDisallowConsole = true
	command.permissions = { "Uncuff" }

	function command:OnPlayerExecute( pPlayer, pTarget, tblArgs )
		pTarget:StripWeapon( "weapon_handcuffed" )
		pTarget:StripWeapon( "weapon_ziptied" )
		return true
	end
	function command:ContextMenu( player, menu, rankData )
		local option = menu:AddOption( "Uncuff", function()
			serverguard.command.Run( "uncuff", false, player:SteamID64() )
		end )
		option:SetImage( "icon16/lock_break.png" )
	end
	serverguard.command:Add( command )

	--Heal
	local command = {}
	command.help = "Fully restores a player's health and limb status."
	command.command = "heal"
	command.arguments = { "player" }
	command.optionalArguments = {}
	command.bDisallowConsole = true
	command.permissions = { "Heal" }

	function command:OnPlayerExecute( pPlayer, pTarget, tblArgs )
		if pTarget then
			if pTarget:IsUncon() then
				pTarget:WakeUp()
				return true
			elseif pTarget:IsRagdolled() then
				pTarget:UnRagdoll()
				return true
			end
		end

		GAMEMODE.PlayerDamage:HealPlayerLimbs( pTarget )
		pTarget:SetHealth( pTarget:GetMaxHealth() )
		return true
	end
	function command:ContextMenu( player, menu, rankData )
		local option = menu:AddOption( "Heal", function()
			serverguard.command.Run( "heal", false, player:SteamID64() )
		end )
		option:SetImage( "icon16/heart.png" )
	end
	serverguard.command:Add( command )

	--MakeCiv
	local command = {}
	command.help = "Set the job of a player to civilian."
	command.command = "makeciv"
	command.arguments = { "player" }
	command.optionalArguments = {}
	command.bDisallowConsole = true
	command.permissions = { "Make Civilian" }

	function command:OnPlayerExecute( pPlayer, pTarget, tblArgs )
		GAMEMODE.Jobs:SetPlayerJob( pTarget, JOB_CIVILIAN )
		return true
	end
	function command:ContextMenu( player, menu, rankData )
		local option = menu:AddOption( "Make Civilian", function()
			serverguard.command.Run( "makeciv", false, player:SteamID64() )
		end )
		option:SetImage( "icon16/user_go.png" )
	end
	serverguard.command:Add( command )

	--Set Job
	local command = {}
	command.help = "Set the job of a player."
	command.command = "setjob"
	command.arguments = { "player", "jobid" }
	command.optionalArguments = {}
	command.bDisallowConsole = true
	command.permissions = { "Set Job" }

	function command:Execute( pPlayer, bSilent, tblArgs )
		if not GAMEMODE.Jobs:GetJobs()[tblArgs[2] or ""] then return end
		local target = player.GetBySteamID64( tblArgs[1] )
		if not IsValid( target ) then return end
		
		GAMEMODE.Jobs:SetPlayerJob( target, GAMEMODE.Jobs:GetJobs()[tblArgs[2] or ""].ID )
		return true
	end
	function command:ContextMenu( player, menu, rankData )
		local jobmenu, option = menu:AddSubMenu( "Set Job" )

		jobmenu:SetSkin( "serverguard" )
		option:SetImage( "icon16/user_go.png" )

		for k, v in pairs( GAMEMODE.Jobs:GetJobs() ) do
			jobmenu:AddOption( v.Name, function()
				serverguard.command.Run( "setjob", false, player:SteamID64(), v.ID )
			end )
		end
	end
	serverguard.command:Add( command )
end

return Module
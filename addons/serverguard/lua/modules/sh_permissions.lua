
-----------------------------------------------------
--[[
	© 2016 Thriving Ventures Ltd do not share, re-distribute or modify
	without permission of its author (gustaf@thrivingventures.com).
]]

--- ## Shared
-- Library to store and retrieve what permissions are available.
-- @module serverguard.permission

serverguard.permission = serverguard.permission or {};
serverguard.permission.stored = serverguard.permission.stored or {};

--- Check whether or not a permission exists.
-- @string identifier The name of the permission.
-- @treturn boolean Whether or not the permission exists.
function serverguard.permission:Exists(identifier)
	if (type(identifier) == "string") then
		return self.stored[identifier];
	end;
end;

--- Adds a permission.
-- @string identifier The name of the permission.
function serverguard.permission:Add(identifier)
	if (type(identifier) == "string") then
		if (!self.stored[identifier]) then
			self.stored[identifier] = true;
		end;
	elseif (type(identifier) == "table") then
		for k, v in pairs(identifier) do
			if (type(v) == "string") then
				self:Add(v);
			end;
		end;
	end;
end;

--- Removes a permission.
-- @string identifier The name of the permission.
function serverguard.permission:Remove(identifier)
	if (type(identifier) == "string") then
		if (self.stored[identifier]) then
			self.stored[identifier] = nil;
		end;
	end;
end;

--- Gets a table of all permissions.
-- @treturn table Table of all permissions.
function serverguard.permission:GetAll()
	return self.stored;
end;

serverguard.permission:Add("Quick Menu");
serverguard.permission:Add("Manage Players");
serverguard.permission:Add("Manage Plugins");
serverguard.permission:Add("Admin");
serverguard.permission:Add("Superadmin");
serverguard.permission:Add("Physgun Player");
serverguard.permission:Add("See Help Requests");
serverguard.permission:Add("Unban");

if (SERVER) then
	hook.Add("PhysgunPickup", "serverguard.PhysgunPickup", function(player, entity)
		if (IsValid(entity) and entity:IsPlayer()) then
			if (serverguard.player:HasPermission(player, "Physgun Player") and (serverguard.player:GetImmunity(player) > serverguard.player:GetImmunity(entity))) then
				player.sg_physgunPlayer = entity;
				entity.sg_playerPhysgunned = true;

				entity:SetLocalVelocity(Vector(0, 0, 0));
				entity:SetMoveType(MOVETYPE_NONE);
				entity:SetCollisionGroup(COLLISION_GROUP_WORLD);

				return true;
			end;
		end;
	end);

	hook.Add("KeyPress", "serverguard.KeyPress", function(player, key)
		if (key == IN_ATTACK2 and IsValid(player:GetActiveWeapon()) and player:GetActiveWeapon():GetClass() == "weapon_physgun") then
			local target = player.sg_physgunPlayer;

			if (IsValid(target) and target:IsPlayer()) then
				if (serverguard.player:HasPermission(player, "Physgun Player") and (serverguard.player:GetImmunity(player) > serverguard.player:GetImmunity(target))) then
					player.sg_physgunPlayer = nil;
					target.sg_playerPhysgunned = false;

					target:SetLocalVelocity(Vector(0, 0, 0));
					target:SetMoveType(MOVETYPE_NONE);
					target:SetCollisionGroup(COLLISION_GROUP_PLAYER);
				end;
			end;
		end;
	end);

	hook.Add("PhysgunDrop", "serverguard.PhysgunDrop", function(player, entity)
		if (IsValid(entity) and entity:IsPlayer()) then
			if (entity.sg_playerPhysgunned) then
				player.sg_physgunPlayer = nil;

				entity:SetMoveType(MOVETYPE_WALK);
				entity:SetCollisionGroup(COLLISION_GROUP_PLAYER);
				
				entity.sg_playerPhysgunned = nil;
			end;
		end;
	end);

	hook.Add("CanPlayerSuicide", "serverguard.CanPlayerSuicide", function(player)
		if (player.sg_playerPhysgunned) then
			return false;
		end;
	end);
	
	hook.Add("PostGamemodeLoaded", "serverguard.permissions.PostGamemodeLoaded", function()
		hook.Remove("PhysgunDrop", "FAdmin_PickUpPlayers");
	end);
end;
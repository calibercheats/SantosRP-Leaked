
-----------------------------------------------------
local GameCl = CasinoKit.class("GameCl")
GameCl:prop("tableEntity")

function GameCl:handleGameMessage(id, buf)
	if id == "state" then
		self.state = buf:getString()
		self:onStateChanged(self.state)
	elseif id == "pkick" then
		local kickedSeatIndex = buf:get()
		self:cleanupSeat(kickedSeatIndex)
	elseif id == "gpmsg" then
		self:onGameplayMessageReceived(buf:getString())
	else
		print("[CasinoKit] Warning! Unhandled gamemsg: " .. id)
	end
end

function GameCl:sendInput(buf)
	local ent = self:getTableEntity()

	net.Start("casinokit_gameinput")
	net.WriteEntity(ent)
	net.WriteUInt(ent:GetMySeatIndex(), 8)

	local data = buf:build()
	net.WriteUInt(#data, 16)
	net.WriteData(data, #data)

	net.SendToServer()
end

function GameCl:playTableSound(path, origin)
	local tableEnt = self:getTableEntity()

	local function SoundCallback(chan, e, i)
		if e then
			MsgN("[CasinoKit] Sound error! (", path, ") ", soundu, " ", e, " ", i)
			return
		end

		chan:Set3DFadeDistance(100, 300)
		chan:SetPos(origin or tableEnt:LocalToWorld(tableEnt.TableLocalOrigin))
	end

	local url = path:match("^url:(.*)")
	if url then
		CasinoKit.playRemoteSound(url, "3d", SoundCallback)
	end

	local file = path:match("^file:(.*)")
	sound.PlayFile(file or path, "3d", SoundCallback)
end

-- Returns a name that is shown above the table or in game listings.
function GameCl:getGameFriendlyName()
	return "Game"
end
-- Returns a name that is shown above table below friendly name or in game listings.
-- This should return table-specific parameters (eg. blinds/limits in hold 'em)
-- Can contain newlines.
function GameCl:getGameFriendlySubtext()
	return "good games here"
end

-- called when player sitting here gets kicked/something else.
-- should eg. clear cards or other game related objects from table in this seat
function GameCl:cleanupSeat(seatIndex)
end

function GameCl:onStateChanged(newState)
end

function GameCl:onGameplayMessageReceived(gpmsg)
	MsgN("[CasinoKit gameplay] ", gpmsg)
end

function GameCl:drawUI(ent, p)
end

function GameCl:infoString(ent)
	return string.format("done: %s state: %s", ent:GetNWBool("isGameDone"), self.state)
end

function GameCl:drawTable(ent, localOrigin)
end

-- Should return the world position of activity happening.
-- Activity could be turn player, card shuffling or anything like that
-- Should return nil if there is nothing interesting happening
function GameCl:getActivityPosition(ent, localOrigin)
end

function GameCl:addGameSettings(settings)
end

GameCl.htmlHelp = [[
<p>
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
</p>
]]

local function netReadDeferredEntity()
	local eid = net.ReadUInt(16)
	local e = Entity(eid)
	if not IsValid(e) then
		local hookId = "CasinoKit_DeferredReadEnt_" .. CurTime() .. "_" .. eid

		local resolvedEnt
		local rcb

		hook.Add("NetworkEntityCreated", hookId, function(e)
			if e:EntIndex() == eid then
				resolvedEnt = e
				timer.Simple(0.1, function() if rcb then rcb(resolvedEnt) end end)
				hook.Remove("NetworkEntityCreated", hookId)
			end
		end)
		return {
			onResolve = function(cb)
				if resolvedEnt then
					cb(resolvedEnt)
				else
					rcb = cb
				end
			end
		}
	else
		return {
			onResolve = function(cb)
				cb(e)
			end
		}
	end
end

net.Receive("casinokit_gamemsg", function()
	local dent = netReadDeferredEntity()

	local id = net.ReadData(5)

	local dataLen = net.ReadUInt(16)
	local data = net.ReadData(dataLen)
	local buffer = CasinoKit.classes.Buffer(data)

	dent.onResolve(function(ent)
		ent:HandleGameMessage(id, buffer)
	end)
end)

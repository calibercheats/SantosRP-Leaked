
-----------------------------------------------------
local Module = {}
Module.Name = "lprof"

local scope
local function applyDebugHook()
	debug.sethook( function()
		if not scope then return end
		scope.ops = scope.ops +1
	end, "", 1 )
end

local function pushScope()
	scope = { start = SysTime(), ops = 0 }
	applyDebugHook()
end

local function popScope( strMsg )
	debug.sethook()
	Msg( strMsg.. "\n" )
	print( ("Time = %f, OpCount = %d"):format(SysTime() -scope.start, scope.ops) )
	scope = nil
end

function Module:OnLoad()
	lprof = {
		PushScope = pushScope,
		PopScope = popScope
	}
end

return Module
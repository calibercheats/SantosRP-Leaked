
-----------------------------------------------------
CasinoKit.fn = {}
local fn = CasinoKit.fn

function fn.curry(fn, ...)
	local vars = {...}
	return function(...)
		local fargs = {}
		table.Add(fargs, vargs)
		table.Add(fargs, {...})
		return fn(unpack(fargs))
	end
end

function fn.map(tbl, fn)
	local ntbl = {}
	for k,v in pairs(tbl) do
		ntbl[k] = fn(v)
	end
	return ntbl
end
function fn.filter(tbl, fn)
	local ntbl = {}
	for k,v in pairs(tbl) do
		if fn(v) then table.insert(ntbl, v) end
	end
	return ntbl
end
function fn.forall(tbl, fn)
	for _,v in pairs(tbl) do
		if not fn(v) then return false end
	end
	return true
end
function fn.take(tbl, n)
	local ntbl = {}
	for i=1,math.min(n, #tbl) do
		ntbl[i] = tbl[i]
	end
	return ntbl
end

local EOS_OBJECT = {}
local stream_meta = {}
stream_meta.__index = stream_meta

function stream_meta:takeWhile(fn)
	self._chain[#self._chain+1] = function(_in, out)
		if fn(_in) then
			out(_in)
		else
			out(EOS_OBJECT)
		end
	end
	return self
end
function stream_meta:filter(fn)
	self._chain[#self._chain+1] = function(_in, out) if fn(_in) then out(_in) end end
	return self
end
function stream_meta:map(fn)
	self._chain[#self._chain+1] = function(_in, out) out(fn(_in)) end
	return self
end

function stream_meta:_collect(_collector)
	local terminateCollection = false

	local collector = function(_in)
		if _in == EOS_OBJECT then terminateCollection = true return end
		local r = _collector(_in)
		if r == EOS_OBJECT then terminateCollection = true end
	end

	local streamFunc = collector
	for i=#self._chain, 1, -1 do
		local fn = self._chain[i]
		local oldStreamFunc = streamFunc

		streamFunc = function(_in)
			if _in == EOS_OBJECT then terminateCollection = true return end
			return fn(_in, oldStreamFunc)
		end
	end

	while true do
		local _in = self._infunc()
		if _in == EOS_OBJECT then break end

		local processed = streamFunc(_in)
		if terminateCollection then break end
	end
end
function stream_meta:collect()
	local res = {}

	local k = 1
	self:_collect(function(x)
		res[k] = x
		k = k + 1
	end)

	return res
end
function stream_meta:getFirst()
	local res
	self:_collect(function(x)
		res = x
		return EOS_OBJECT
	end)
	return res
end
function stream_meta:size()
	local size = 0
	self:_collect(function(x)
		size = size + 1
	end)
	return size
end
function stream_meta:fold(start, fn)
	local x = start
	self:_collect(function(val)
		x = fn(x, val)
	end)
	return x
end
function stream_meta:forall(fn)
	return self:fold(true, function(x, y)
		return x and fn(y)
	end)
end
function stream_meta:count(fn)
	return self:fold(0, function(x, y)
		return fn(y) and (x + 1) or x
	end)
end
function stream_meta:foreach(fn)
	for _,v in pairs(self:collect()) do fn(v) end
end
function stream_meta:sortedBy(sortfn)
	local t = self:collect()
	table.sort(t, sortfn)
	return fn.stream(t)
end

function stream_meta:groupBy(fn)
	local groups = {}

	self:foreach(function(val)
		local group = fn(val)
		groups[group] = groups[group] or {}
		table.insert(groups[group], val)
	end)

	return groups
end

function fn.stream(source)
	local in_func

	if type(source) == "table" then
		local lastk
		in_func = function()
			local k, v = next(source, lastk)
			if not k then return EOS_OBJECT end
			lastk = k
			return v
		end
	elseif type(source) == "function" then
		in_func = function()
			local val = source()
			if val == nil then return EOS_OBJECT end
			return val
		end
	else
		error("You must pass a source to fn.stream()")
	end

	return setmetatable({_infunc = in_func, _chain = {}}, stream_meta)
end

function fn.zippedStream(tbl)
	local zipped = {}
	for k,v in pairs(tbl) do
		table.insert(zipped, {k, v})
	end
	return fn.stream(zipped)
end

function fn.seq(start, _end)
	if not _end then
		_end = start
		start = 1
	end

	local c = start - 1
	return function()
		c = c + 1
		if _end and c > _end then return end

		return c
	end
end


-----------------------------------------------------
CasinoKit.classes = CasinoKit.classes or {}

-- Add some useful things to Object
local Object = CasinoKit.middleclass.Object
Object.static.prop = function(cls, name, immutable)
	if type(immutable) == "table" then
		error("Calling cls:prop() improperly. Table must be outside parenthesis")
	end

	local propname = "__prop_" .. name
	local uppercased = name:sub(1, 1):upper() .. name:sub(2)

	local _type
	local function checkType(val)
		if not _type then return true end

		if type(_type) == "table" then
			return Object.isInstanceOf(val, _type)
		elseif type(_type) == "string" then
			return type(val) == _type
		end

		print("TODO: casinokit oop type check")
		return true
	end

	local _defValue

	cls["get" .. uppercased] = function(self)
		local v = self[propname]
		if v == nil then return _defValue end
		return v
	end
	if immutable ~= true then
		cls["set" .. uppercased] = function(self, val)
			if not checkType(val) then
				error("Attempted to set property " .. self.class.name .. "." .. name .. " to invalid value " .. tostring(val))
			end
			self[propname] = val
			return self
		end
	end

	return setmetatable({}, {
		__call = function(_, tbl)
			if tbl.type then
				_type = tbl.type
			end
			if tbl.default then
				_defValue = tbl.default
			end
		end
	})
end
Object.static.includeMixin = function(self, mixin)
	if type(mixin) == "string" then mixin = CasinoKit.classes[mixin] end
	self:include(mixin)
end

function CasinoKit.class(nm, superClass, noGlobalEntry)
	local classes = CasinoKit.classes

	if type(superClass) == "string" then
		local scn = superClass
		superClass = classes[superClass]
		if not superClass then error("could not find superclass named '" .. scn .. "'") end
	end

	local cls = classes[nm] or CasinoKit.middleclass(nm, superClass)
	if not noGlobalEntry then classes[nm] = cls end
	return cls
end

function CasinoKit.delegatingClass(nm, delegate, noGlobalEntry)
	if type(delegate) == "string" then delegate = CasinoKit.classes[delegate] end

	local cls = CasinoKit.class(nm, delegate, noGlobalEntry)

	function cls:initialize(delegateObj)
		-- cant initialize delegate object; we consider it an interface
		Object.initialize(self)

		assert(not not delegateObj and delegateObj:isInstanceOf(delegate))
		self._delegateObj = delegateObj

		if self.initializeDelegating then self:initializeDelegating() end
	end

	for name, value in pairs(delegate.__instanceDict) do
		if name ~= "initialize" and type(value) == "function" then
			cls[name] = function(self, ...)
				return self._delegateObj[name](self._delegateObj, ...)
			end
		end
	end

	return cls
end

function CasinoKit.mixin(nm)
	return CasinoKit.class(nm)
end

local Enum = CasinoKit.class("Enum")
function Enum:initialize(name, ordinal)
	Enum.super.initialize(self)

	self.name = name
	self.ordinal = ordinal
end
function Enum:__tostring()
	return self.name
end

function CasinoKit.enum(nm)
	local enumClass = CasinoKit.class(nm, Enum)
	enumClass.static.valueList = {}

	return setmetatable({enumClass}, {
		__call = function(_, tbl)
			for k,el in pairs(tbl) do
				enumClass.static[el] = enumClass(el, k)
				table.insert(enumClass.static.valueList, enumClass.static[el])
			end
			return enumClass
		end
	})
end

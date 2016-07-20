
-----------------------------------------------------
local Events = CasinoKit.mixin("EventsMixin")

function Events:on(name, fn)
	self.__eventhooks = self.__eventhooks or {}
	self.__eventhooks[name] = self.__eventhooks[name] or {}
	table.insert(self.__eventhooks[name], fn)
end

function Events:emit(name, ...)
	local hooks = self.__eventhooks and self.__eventhooks[name]
	if hooks then
		for _,hook in pairs(hooks) do
			hook(...)
		end
	end
end

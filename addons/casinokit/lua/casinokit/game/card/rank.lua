
-----------------------------------------------------
local Rank = CasinoKit.enum("Rank") {
	"Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"
}

function Rank:getLetter() -- DEPRECATED
	return self:getByte()
end
function Rank:getByte()
	return self.name:sub(1, 1)
end

function Rank:getValue()
	if self:isAce() then
		return Rank.King:getValue() + 1
	end
	return self.ordinal
end

function Rank:isAce()
	return self == Rank.Ace
end

function Rank:isNumbered()
	return self >= Rank["2"] and self <= Rank["10"]
end
function Rank:isFace()
	return self >= Rank.Jack and self <= Rank.King
end

-- Note: Ace is considered the smallest card according to following methods
function Rank:__lt(other)
	return self:getValue() < other:getValue()
end
function Rank:__le(other)
	return self:getValue() <= other:getValue()
end

function Rank.static.fromByte(byte)
	-- TODO optimize
	for _,value in pairs(Rank.valueList) do
		if value:getByte() == byte then return value end
	end
end
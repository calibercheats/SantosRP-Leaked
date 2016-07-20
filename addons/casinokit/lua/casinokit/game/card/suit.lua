
-----------------------------------------------------
local Suit = CasinoKit.enum("Suit") {
	"Hearts", "Spades", "Diamonds", "Clubs"
}

function Suit:getLetter() -- DEPRECATED
	return self:getByte()
end

function Suit:getByte()
	return self.name:sub(1, 1)
end

function Suit.static.fromByte(byte)
	-- TODO optimize/memoize
	for _,value in pairs(Suit.valueList) do
		if value:getByte() == byte then return value end
	end
end
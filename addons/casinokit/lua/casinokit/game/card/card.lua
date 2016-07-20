
-----------------------------------------------------
local Card = CasinoKit.class("Card")

Card:prop("suit") {
	type = CasinoKit.classes.Suit
}
Card:prop("rank") {
	type = CasinoKit.classes.Rank
}

function Card:initialize(suit, rank)
	Card.super.initialize(self)

	if type(suit) == "string" then suit = CasinoKit.classes.Suit[suit] end
	self:setSuit(suit)

	if type(rank) == "string" then rank = CasinoKit.classes.Rank[rank] end
	self:setRank(rank)
end

function Card:toTwoByteString()
	return string.format("%s%s", self:getSuit():getLetter(), self:getRank():getLetter())
end

function Card:__eq(other)
	return other:getSuit() == self:getSuit() and other:getRank() == self:getRank()
end

function Card:__tostring()
	return string.format("Card(%s of %s)", self:getRank(), self:getSuit())
end

function Card.static.fromTwoByteString(str)
	assert(#str == 2)
	local suitByte, rankByte = string.sub(str, 1, 1), string.sub(str, 2, 2)
	return Card(CasinoKit.classes.Suit.fromByte(suitByte), CasinoKit.classes.Rank.fromByte(rankByte))
end

function Card.static.fromStrings(suitStr, rankStr)
	return Card(CasinoKit.classes.Suit[suitStr], CasinoKit.classes.Rank[rankStr])
end

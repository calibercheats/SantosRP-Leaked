
-----------------------------------------------------
local CardSet = CasinoKit.class("CardSet")

function CardSet:initialize(cards)
	CardSet.super.initialize(self)

	local withoutDupes = {}
	for k,v in pairs(cards) do
		local alreadyExists = false
		for _,dv in pairs(withoutDupes) do
			if dv == v then alreadyExists = true break end
		end

		if not alreadyExists then table.insert(withoutDupes, v) end
	end
	self.cards = withoutDupes
end

function CardSet:contains(card)
	return table.HasValue(self.cards, card)
end
function CardSet:containsAllOf(other)
	for _,card in pairs(self.cards) do
		if not other:contains(card) then return false end
	end
	return true
end

-- Returns cards as a sorted list in descending order
-- Suit order is arbitrary. Ace is assumed to be highest rank
function CardSet:toSortedList()
	local sorted = {}
	table.Add(sorted, self.cards)

	table.sort(sorted, function(a, b)
		return a:getRank() > b:getRank()
	end)

	return sorted
end

function CardSet:size()
	return #self.cards
end
function CardSet:__len()
	return self:size()
end

function CardSet:__add(other)
	if other:isInstanceOf(CasinoKit.classes.Card) then
		local newCards = {}
		table.Add(newCards, self.cards)
		table.insert(newCards, other)
		return CardSet(newCards)
	elseif other:isInstanceOf(CardSet) then
		local newCards = {}
		table.Add(newCards, self.cards)
		table.Add(newCards, other.cards)
		return CardSet(newCards)
	end
end

function CardSet:__sub(other)
	if other:isInstanceOf(CasinoKit.classes.Card) then
		local newCards = {}
		table.Add(newCards, self.cards)
		table.RemoveByValue(newCards, other)
		return CardSet(newCards)
	elseif other:isInstanceOf(CardSet) then
		local newCards = {}
		table.Add(newCards, self.cards)
		for _,c in pairs(other.cards) do
			table.RemoveByValue(newCards, c)
		end
		return CardSet(newCards)
	end
end

function CardSet:__eq(other)
	return self:containsAllOf(other) and other:containsAllOf(self)
end

function CardSet:__tostring()
	local cs = {}
	for _,card in pairs(self.cards) do
		cs[#cs+1] = tostring(card)
	end
	return "CardSet[" .. table.concat(cs, ", ") .. "]"
end

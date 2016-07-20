
-----------------------------------------------------
local HandEval = CasinoKit.class("HandEvaluator")

function HandEval:initialize()
	HandEval.super.initialize(self)

	self.hands = {}
end

function HandEval:addHand(tbl)
	table.insert(self.hands, tbl)
end

function HandEval:filterKickers(kickerRanks, handCards)
	return kickerRanks
end

function HandEval:evaluateAll(set)
	local list = set:toSortedList()

	local matches = {}

	-- workspace is a table sent to all hands which can be used to speed up computation
	-- of things that many hands need
	local workspace = {}

	for _,hand in pairs(self.hands) do
		local r, cards = hand.check(list, workspace)
		if r then
			-- cards contains all cards part of the 'main' hand
			-- thus we can get kickers by set subtraction
			local kickerSet = set - CasinoKit.classes.CardSet(cards)

			local kickerRanks = CasinoKit.fn.map(kickerSet:toSortedList(), function(c) return c:getRank() end)

			kickerRanks = self:filterKickers(kickerRanks, cards)

			local handValue = hand.value(cards, kickerRanks)
			table.insert(matches, handValue)
		end
	end

	return matches
end
function HandEval:evaluate(set)
	local matches = self:evaluateAll(set)

	table.sort(matches, function(a, b)
		return a > b
	end)

	return matches[1]
end

local HandValue = CasinoKit.class("HandValue")

-- name: String            name of this hand
-- mainValue: Int          the numerical value of this hand (eg fullHouse.mainVal > pairs.mainVal)
-- mainRanks: List<Rank>   ranks in descending order that are part of the hand (eg fullHouse.mainRanks = [higherRank, lowerRank] )
-- kickerRanks: List<Rank> ranks of the rest of the hand in descending order
function HandValue:initialize(name, mainValue, mainRanks, kickerRanks)
	HandValue.super.initialize(self)

	self.name = name
	self.mainValue = mainValue
	self.mainRanks = mainRanks
	self.kickerRanks = kickerRanks
end

function HandValue:genericLt(ranks0, ranks1)
	for i=1, math.max(#ranks0, #ranks1) do
		if not ranks0[i] and ranks1[i] then
			return true
		elseif ranks0[i] and not ranks1[i] then
			return false
		elseif ranks0[i] < ranks1[i] then
			return true
		elseif ranks1[i] < ranks0[i] then
			return false
		end
	end

	-- ALL ranks were equal so ranks0 is still not technically less than ranks1
	return false
end
function HandValue:genericEq(ranks0, ranks1)
	if #ranks0 ~= #ranks1 then
		return false
	end
	for i=1, #ranks0 do
		if ranks0[i] ~= ranks1[i] then
			return false
		end
	end
	return true
end

function HandValue:__lt(other)
	if self.mainValue == other.mainValue then
		if self:genericEq(self.mainRanks, other.mainRanks) then
			return self:genericLt(self.kickerRanks, other.kickerRanks)
		end
		return self:genericLt(self.mainRanks, other.mainRanks)
	end
	return self.mainValue < other.mainValue
end
function HandValue:__eq(other)
	return self.mainValue == other.mainValue and self:genericEq(self.mainRanks, other.mainRanks) and self:genericEq(self.kickerRanks, other.kickerRanks)
end

local function ranksToString(ranks)
	local t = {}
	for _,r in pairs(ranks) do t[#t+1] = tostring(r) end
	return table.concat(t, ", ")
end
function HandValue:__tostring()
	return string.format("HandValue(name: %s, main: %d; mainRanks: %s; kickerRanks: %s)", self.name, self.mainValue, ranksToString(self.mainRanks), ranksToString(self.kickerRanks))
end

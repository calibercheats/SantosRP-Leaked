
-----------------------------------------------------
local PokerHandEval = CasinoKit.class("PokerHandEvaluator", "HandEvaluator")

local VAL_STRAIGHT_FLUSH = 9
local VAL_FOUROFAKIND = 8
local VAL_FULL_HOUSE = 7
local VAL_FLUSH = 6
local VAL_STRAIGHT = 5
local VAL_THREEOFAKIND = 4
local VAL_TWOPAIR = 3
local VAL_PAIR = 2
local VAL_HIGHCARD = 1

function PokerHandEval:initialize()
	PokerHandEval.super.initialize(self)

	self:addHighCard()
	self:addTuples()
	self:addTwoPair()
	self:addFullHouse()
	self:addFlush()
	self:addStraight()
	self:addStraightFlush()
end

function PokerHandEval:filterKickers(kickerRanks, handCards)
	return CasinoKit.fn.take(kickerRanks, 5 - #handCards)
end

function PokerHandEval:getRankGroups(cardList)
	return CasinoKit.fn.zippedStream(
		CasinoKit.fn.stream(cardList)
			:groupBy(function(card) return card:getRank() end))
		:sortedBy(function(a, b) return #a[2] > #b[2] end)
		:collect()
end
function PokerHandEval:getSuitGroups(cardList)
	return CasinoKit.fn.zippedStream(
		CasinoKit.fn.stream(cardList)
			:groupBy(function(card) return card:getSuit() end))
		:sortedBy(function(a, b) return #a[2] > #b[2] end)
		:collect()
end

function PokerHandEval:addHighCard()
	-- This method ALWAYS passes if there's at least one card
	-- also it considers all cards to be kickers which is kind of weird but works
	self:addHand {
		check = function(cardList, workspace)
			if #cardList > 0 then
				return true, {}
			end
		end,
		value = function(cards, kickerRanks)
			return CasinoKit.classes.HandValue("Highest Card", VAL_HIGHCARD, {}, kickerRanks)
		end,
	}
end

function PokerHandEval:addTuples()
	for n,data in pairs{{"Pair", VAL_PAIR}, {"Trips", VAL_THREEOFAKIND}, {"Quads", VAL_FOUROFAKIND}} do
		self:addHand {
			check = function(cardList, workspace)
				workspace.rankGroups = workspace.rankGroups or self:getRankGroups(cardList)

				local biggest = workspace.rankGroups[1]
				if biggest and #biggest[2] >= (n+1) then
					return true, biggest[2]
				end
			end,
			value = function(cards, kickerRanks)
				return CasinoKit.classes.HandValue(data[1], data[2], {cards[1]:getRank()}, kickerRanks)
			end,
		}
	end
end

function PokerHandEval:addTwoPair()
	self:addHand {
		name = "Two Pairs",
		check = function(cardList, workspace)
			workspace.rankGroups = workspace.rankGroups or self:getRankGroups(cardList)

			local biggest, sbiggest = unpack(workspace.rankGroups, 1, 2)
			if biggest and sbiggest and #biggest[2] == 2 and #sbiggest[2] == 2 then
				local cardz = {}
				table.Add(cardz, biggest[2])
				table.Add(cardz, sbiggest[2])
				-- sort cards because rankGrounds is sorted based on amount of occurrences
				-- so pair occurrences might've been mixed up
				table.sort(cardz, function(a, b) return a:getRank() > b:getRank() end)
				return true, cardz
			end
		end,
		value = function(cards, kickerRanks)
			return CasinoKit.classes.HandValue("Two Pairs", VAL_TWOPAIR, {cards[1]:getRank(), cards[3]:getRank()}, kickerRanks)
		end,
	}
end
function PokerHandEval:addFullHouse()
	self:addHand {
		name = "Full House",
		check = function(cardList, workspace)
			workspace.rankGroups = workspace.rankGroups or self:getRankGroups(cardList)

			local biggest, sbiggest = unpack(workspace.rankGroups, 1, 2)
			if biggest and sbiggest and #biggest[2] == 3 and #sbiggest[2] == 2 then
				local cardz = {}
				table.Add(cardz, biggest[2])
				table.Add(cardz, sbiggest[2])
				-- no need to sort cards: biggest is 3-tuple and sbiggest is 2-tuple
				return true, cardz
			end
		end,
		value = function(cards, kickerRanks)
			return CasinoKit.classes.HandValue("Full House", VAL_FULL_HOUSE, {cards[1]:getRank(), cards[4]:getRank()}, kickerRanks)
		end,
	}
end

function PokerHandEval:addFlush()
	self:addHand {
		name = "Flush",
		check = function(cardList, workspace)
			workspace.suitGroups = workspace.suitGroups or self:getSuitGroups(cardList)

			local biggest = workspace.suitGroups[1]
			if biggest and #biggest[2] >= 5 then
				return true, biggest[2]
			end
		end,
		value = function(cards, kickerRanks)
			return CasinoKit.classes.HandValue("Flush", VAL_FLUSH, {
				cards[1]:getRank(), cards[2]:getRank(), cards[3]:getRank(), cards[4]:getRank(), cards[5]:getRank()
			}, kickerRanks)
		end,
	}
end

local function findStraight(cardList)
	local scards = {}
	local theAce = nil
	for _,card in pairs(cardList) do
		if card:getRank():isAce() then theAce = card end

		local lcard = scards[#scards]
		if lcard and lcard:getRank():getValue(true) == card:getRank():getValue(true)+1 then
			scards[#scards+1] = card

		-- same rank multiple times; we should nop
		elseif lcard and lcard:getRank():getValue(true) == card:getRank():getValue(true) then
		else
			scards = {card}
		end

		if #scards >= 5 then return true, scards end
	end

	-- check for low-ace-straight
	if #scards >= 4 and scards[#scards]:getRank().name == "2" and theAce then
		scards[#scards+1] = theAce
		return true, scards
	end
end

function PokerHandEval:addStraight()
	self:addHand {
		name = "Straight",
		check = function(cardList, workspace)
			return findStraight(cardList)
		end,
		value = function(cards, kickerRanks)
			return CasinoKit.classes.HandValue("Straight", VAL_STRAIGHT, {cards[1]:getRank()}, kickerRanks)
		end,
	}
end

function PokerHandEval:addStraightFlush()
	self:addHand {
		name = "Straight Flush",
		check = function(cardList, workspace)
			workspace.suitGroups = workspace.suitGroups or self:getSuitGroups(cardList)

			for _,suitgroup in pairs(workspace.suitGroups) do
				local suitCards = suitgroup[2]

				local x, y = findStraight(suitCards)
				if x and y then return x, y end
			end
		end,
		value = function(cards, kickerRanks)
			return CasinoKit.classes.HandValue("Straight Flush", VAL_STRAIGHT_FLUSH, {cards[1]:getRank()}, kickerRanks)
		end,
	}
end

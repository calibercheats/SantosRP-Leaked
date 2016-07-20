
-----------------------------------------------------
local carddecks = {}

function CasinoKit.getCardDeck(name)
	return carddecks[name]
end

function CasinoKit.registerCardDeck(name, tbl)
	carddecks[name] = tbl
end


-----------------------------------------------------
local currencies = {}

function CasinoKit.getCurrencies()
	return currencies
end
function CasinoKit.getCurrency(id)
	return currencies[id]
end

function CasinoKit.registerCurrency(name, tbl)
	currencies[name] = tbl
end

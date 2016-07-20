
-----------------------------------------------------
local CURRENCY = {}

-- dont archive on client
local fflags = SERVER and bit.bor(FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY) or FCVAR_REPLICATED

local cvar_clockwork_to = CreateConVar("casinokit_chiprate_clockwork_money2chips", "0.1", fflags, "how many tokens per clockwork money player gets. This gets rounded down")
local cvar_clockwork_fee = CreateConVar("casinokit_chiprate_clockwork_exchangefee", "0.01", fflags, "the percentage taken from player when they exchange from chips to money")

CURRENCY.NiceName = "Clockwork"
CURRENCY.UnitName = "money"
CURRENCY.UnitPluralName = "money"

function CURRENCY:isEnabled()
	return Clockwork ~= nil
end

function CURRENCY:getExchangeRateFromCurrencyToChips(ply)
	return cvar_clockwork_to:GetFloat(), 0
end

function CURRENCY:getExchangeRateFromChipsToCurrency(ply)
	local feeFrac = cvar_clockwork_fee:GetFloat()
	local baseRate = (1 / cvar_clockwork_to:GetFloat())

	return baseRate * (1 - feeFrac), baseRate * feeFrac
end

function CURRENCY:addPlayerCurrency(ply, amount, desc)
	Clockwork.player:GiveCash(ply, amount, desc)
end
function CURRENCY:canPlayerAfford(ply, amount)
	return Clockwork.player:CanAfford(ply, amount)
end

CasinoKit.registerCurrency("clockwork", CURRENCY)


-----------------------------------------------------
local CURRENCY = {}

-- dont archive on client
local fflags = SERVER and bit.bor(FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY) or FCVAR_REPLICATED

local cvar_ps2_to = CreateConVar("casinokit_chiprate_ps2_money2chips", "1", fflags, "how many tokens per ps2 points player gets. This gets rounded down")
local cvar_ps2_fee = CreateConVar("casinokit_chiprate_ps2_exchangefee", "0.01", fflags, "the percentage taken from player when they exchange from chips to points")

CURRENCY.NiceName = "Pointshop 2"
CURRENCY.UnitName = "point"
CURRENCY.UnitPluralName = "points"

function CURRENCY:isEnabled()
	return not not Pointshop2
end

function CURRENCY:getExchangeRateFromCurrencyToChips(ply)
	return cvar_ps2_to:GetFloat()
end

function CURRENCY:getExchangeRateFromChipsToCurrency(ply)
	return (1 / cvar_ps2_to:GetFloat()) * (1 - cvar_ps2_fee:GetFloat())
end

function CURRENCY:addPlayerCurrency(ply, amount, desc)
	ply:PS2_AddStandardPoints(amount, desc)
end
function CURRENCY:canPlayerAfford(ply, amount)
	return ply.PS2_Wallet.points >= amount
end

CasinoKit.registerCurrency("ps2", CURRENCY)

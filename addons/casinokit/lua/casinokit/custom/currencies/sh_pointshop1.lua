
-----------------------------------------------------
local CURRENCY = {}

-- dont archive on client
local fflags = SERVER and bit.bor(FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY) or FCVAR_REPLICATED

local cvar_ps1_to = CreateConVar("casinokit_chiprate_ps1_money2chips", "1", fflags, "how many tokens per ps1 points player gets. This gets rounded down")
local cvar_ps1_fee = CreateConVar("casinokit_chiprate_ps1_exchangefee", "0.01", fflags, "the percentage taken from player when they exchange from chips to points")

CURRENCY.NiceName = "Pointshop"
CURRENCY.UnitName = "point"
CURRENCY.UnitPluralName = "points"

function CURRENCY:isEnabled()
	return PS ~= nil and PS.Items ~= nil
end

function CURRENCY:getExchangeRateFromCurrencyToChips(ply)
	return cvar_ps1_to:GetFloat()
end

function CURRENCY:getExchangeRateFromChipsToCurrency(ply)
	return (1 / cvar_ps1_to:GetFloat()) * (1 - cvar_ps1_fee:GetFloat())
end

function CURRENCY:addPlayerCurrency(ply, amount)
	if amount < 0 then
		ply:PS_TakePoints(-amount)
	else
		ply:PS_GivePoints(amount)
	end
end
function CURRENCY:canPlayerAfford(ply, amount)
	return ply:PS_HasPoints(amount)
end

CasinoKit.registerCurrency("ps1", CURRENCY)

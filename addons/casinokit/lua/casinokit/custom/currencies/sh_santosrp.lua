
-----------------------------------------------------
local CURRENCY = {}
-- dont archive on client
local fflags = SERVER and bit.bor(FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY) or FCVAR_REPLICATED
local cvar_srp_to = CreateConVar("casinokit_chiprate_srp_money2chips", "0.1", fflags, "how many tokens per santosrp money player gets. This gets rounded down")
local cvar_srp_fee = CreateConVar("casinokit_chiprate_srp_exchangefee", "0.01", fflags, "the percentage taken from player when they exchange from chips to money")

CURRENCY.NiceName = "SantosRP"
CURRENCY.UnitName = "money"
CURRENCY.UnitPluralName = "money"

function CURRENCY:isEnabled()
	return GAMEMODE.Name == "SantosRP"
end

function CURRENCY:getExchangeRateFromCurrencyToChips(ply)
	return cvar_srp_to:GetFloat(), 0
end

function CURRENCY:getExchangeRateFromChipsToCurrency(ply)
	local feeFrac = cvar_srp_fee:GetFloat()
	local baseRate = (1 / cvar_srp_to:GetFloat())

	return baseRate * (1 - feeFrac), baseRate * feeFrac
end

function CURRENCY:addPlayerCurrency(ply, amount, desc)
	ply:AddMoney( amount )
	--ply:AddNote( desc )
end
function CURRENCY:canPlayerAfford(ply, amount)
	return ply:CanAfford( amount )
end

CasinoKit.registerCurrency("santosrp", CURRENCY)
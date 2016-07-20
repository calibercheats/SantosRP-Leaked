
-----------------------------------------------------
local CURRENCY = {}

-- dont archive on client
local fflags = SERVER and bit.bor(FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY) or FCVAR_REPLICATED

local cvar_dayz_to = CreateConVar("casinokit_chiprate_dayz_money2chips", "1", fflags, "how many tokens per dayz money player gets. This gets rounded down")
local cvar_dayz_fee = CreateConVar("casinokit_chiprate_dayz_exchangefee", "0.01", fflags, "the percentage taken from player when they exchange from chips to money")

CURRENCY.NiceName = "DayZ"
CURRENCY.UnitName = "money"
CURRENCY.UnitPluralName = "money"

function CURRENCY:isEnabled()
	-- tbh dont even care
	return GAMEMODE.Name and string.find(GAMEMODE.Name:lower(), "dayz")
end

function CURRENCY:getExchangeRateFromCurrencyToChips(ply)
	return cvar_dayz_to:GetFloat()
end

function CURRENCY:getExchangeRateFromChipsToCurrency(ply)
	return (1 / cvar_dayz_to:GetFloat()) * (1 - cvar_dayz_fee:GetFloat())
end

function CURRENCY:addPlayerCurrency(ply, amount, desc)
	if amount > 0 then
		ply:GiveItem("item_money", amount)
	else
		ply:TakeItem("item_money", -amount)
	end
end
function CURRENCY:canPlayerAfford(ply, amount)
	return ply:HasItem("item_money") and ply:GetItemAmount("item_money") >= amount
end

CasinoKit.registerCurrency("dayz", CURRENCY)

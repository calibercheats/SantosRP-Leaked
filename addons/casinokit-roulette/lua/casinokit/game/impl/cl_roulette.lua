
-----------------------------------------------------

local RouletteCl = CasinoKit.class("RouletteCl", "CardGameCl")

function RouletteCl:getGameFriendlyName()
	return ""
end

function RouletteCl:getGameFriendlySubtext()
	return L("Minimum bet %d", self:getMinBet())
end

function RouletteCl:getMinBet()
	local te = self:getTableEntity()
	return  IsValid(te) and te:GetMinBet() or 1
end

function RouletteCl:addGameSettings(settings)
	settings:integer("Minimum bet", "minbet", self:getMinBet(), 1, 10000)

	RouletteCl.super.addGameSettings(self, settings)
end
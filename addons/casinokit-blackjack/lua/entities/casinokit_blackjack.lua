
-----------------------------------------------------
AddCSLuaFile()

local a=0;
local b=1;
ENT.Spawnable=true;
ENT.Category="Casino Kit"
ENT.PrintName="Blackjack table"

local BaseClass = baseclass.Get("casinokit_table")
ENT.Base="casinokit_table"
ENT.GameClass="Blackjack"

function ENT:SetupDataTables()
	BaseClass.SetupDataTables(self)
	self:NetworkVar("Int",4,"MinBet")
	self:NetworkVar("Int",5,"MaxBet")
	self:NetworkVar("Int",6,"TimeoutDelay")
	self:NetworkVar("Int",7,"StopAt")
end

function ENT:Initialize()
	if self:GetMinBet()==0 then
		self:SetMinBet(5)
		self:SetMaxBet(1e4)
		self:SetTimeoutDelay(15)
		self:SetStopAt(b)
	end

	BaseClass.Initialize(self)
end

function ENT:OnGameConfigReceived(c,d)
	if c=="minbet"then
		assert(type(d)=="number"and d>0)
		self:SetMinBet(d)
	elseif c=="maxbet"then
		assert(type(d)=="number"and d>0)
		self:SetMaxBet(d)
	elseif c=="timeoutdelay"then
		assert(type(d)=="number"and d>0)
		self:SetTimeoutDelay(d)
	elseif c=="stopat"then
		assert(type(d)=="number"and(d>=0 or d<=1))
		self:SetStopAt(d)
	end
end
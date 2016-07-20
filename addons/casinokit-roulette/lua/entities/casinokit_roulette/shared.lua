
-----------------------------------------------------
AddCSLuaFile()

local BaseClass = baseclass.Get("casinokit_table")
ENT.Base = "casinokit_table"

ENT.SeatCount = 0

ENT.Model = "models/casinokit/roulette.mdl"

ENT.Spawnable = true
ENT.Category = "Casino Kit"
ENT.PrintName = "Roulette table"

ENT.GameClass = "Roulette"

--SantosRP EDIT
ENT.BlockDrag = true

function ENT:OnGameConfigReceived(key, value)
	if key == "minbet" then
		assert(type(value) == "number" and value > 0)
		self:SetMinBet(value)
	end
end

function ENT:SetupDataTables()
	BaseClass.SetupDataTables(self)

	self:NetworkVar("Bool", 0, "Rolling")
	self:NetworkVar("Int", 1, "MinBet")

	--SantosRP EDIT
	self:NetworkVar("Int", 0, "MaxBet")
	self:NetworkVar("Float", 0, "NextRoll")
end

ENT.ROUL_INNER_RAD = 0.1
ENT.ROUL_INNER_HEIGHT = 0.15

ENT.ROUL_MID_HEIGHT = 0.15

ENT.ROUL_OUTER_RAD = 0.32
ENT.ROUL_OUTER_HEIGHT = 0.05

ENT.ROUL_BORDER_HEIGHT = 0.116
ENT.ROUL_TOTAL_RAD = 0.43 -- ~27 inch

ENT.ROUL_BALL_RAD = 0.021 -- 21mm

ENT.ROUL_BALL_MASS = 0.00374
ENT.ROUL_BALL_ROLLFRICTION_COEFFICIENT = 0.001
ENT.ROUL_BALL_ROLLSLIDEFRICTION_COEFFICIENT = 0.014

local roulSeq = {
	6, 21, 33, 16, 4, 23, 35, 14, 2, 0, 28, 9, 26, 30, 11, 7, 20,
	32, 17, 5, 22, 34, 15, 3, 24, 36, 13, 1, "00", 27, 10, 25, 29, 12, 8, 19, 31, 18,
}
local radPerNumber = math.pi*2 / #roulSeq

ENT.NumberSequence = roulSeq
ENT.RedNumbers = {1, 3, 5, 7, 9, 12, 14, 16, 18, 19, 21, 23, 25, 27, 30, 32, 34, 36}

function ENT:GetNumberFromRad(rad)
	local index = math.floor((rad - radPerNumber/2) / radPerNumber)
	return self.NumberSequence[(index % #self.NumberSequence) + 1]
end

local wheelRotPerSec = 0.3
function ENT:WheelRotationAt(time)
	return time * wheelRotPerSec
end
function ENT:GetWheelAngle()
	return self:WheelRotationAt(CurTime())
end

function ENT:GetBallYFromRad(rad)
	return math.Remap(rad, self.ROUL_OUTER_RAD, self.ROUL_TOTAL_RAD, self.ROUL_OUTER_HEIGHT, self.ROUL_BORDER_HEIGHT - 0.03)
end

local acceleration = -0.6
function ENT:GetBallAngle(elapsed, strength)
	elapsed = self:ClampElapsed(elapsed, strength)
	local initialVelocity = strength
	local ballHorizDistance = initialVelocity*elapsed + 0.5*acceleration*elapsed^2
	return -(ballHorizDistance / self.ROUL_OUTER_RAD)
end

function ENT:GetBallStopTime(strength)
	return -strength / acceleration
end

function ENT:ClampElapsed(elapsed, strength)
	local ballHorizStopTime = self:GetBallStopTime(strength)
	local ballStopElapsed = 0
	if ballHorizStopTime < elapsed then
		return ballHorizStopTime, elapsed - ballHorizStopTime
	end
	return elapsed, 0
end

function ENT:GetBallNumber(start, strength)
	local elapsed, ballStopElapsed = self:ClampElapsed(CurTime() - start, strength)
	local ballHorizStopTime = -strength / acceleration
	local ballAng = -self:GetBallAngle(elapsed, strength)
	return self:GetNumberFromRad(self:WheelRotationAt(start + ballHorizStopTime) + -self:GetBallAngle(elapsed, strength))
end

function ENT:SimulateBall(start, strength)
	local elapsed, ballStopElapsed = self:ClampElapsed(CurTime() - start, strength)

	local initialVelocity = strength

	local ballAngle = self:GetBallAngle(elapsed, strength) % (math.pi*2)
	local ballHorizVelocity = initialVelocity + acceleration*elapsed

	-- convert to relative to wheel
	ballAngle = ballAngle + ballStopElapsed * wheelRotPerSec

	local ballRadius = self.ROUL_TOTAL_RAD - 0.02
	if ballHorizVelocity < 1 then
		local ballFrac = math.max(ballHorizVelocity, 0) ^ (1/1.5) -- note: normalize to 0-1 first if you edit

		ballRadius = math.Remap(ballFrac, 0, 1, self.ROUL_OUTER_RAD, self.ROUL_TOTAL_RAD - 0.02)
	end

	-- x flipped cuz texture is flipped. LAME but easieat hacky fix??
	return Vector(math.cos(ballAngle) * ballRadius, math.sin(ballAngle) * ballRadius, self:GetBallYFromRad(ballRadius) + 0.02)
end

--SantsRP EDIT
ENT.ROLL_EVERY = 30
function ENT:GetTimeToNextRoll()
	if self:GetNextRoll() > 0 then
		return self:GetNextRoll() -(CurTime() %self:GetNextRoll())
	else
		return self.ROLL_EVERY
	end
end

local function withinNumbers(num)
	num = tonumber(num)
	return num and num >= 1 and num <= 36
end
function ENT:IsValidBet(id, param)
	if id == "single" then
		return withinNumbers(param)
	end

	if id == "split" then
		local split0, split1 = param:match("(%d+)%-(%d+)")
		if not withinNumbers(split0) or not withinNumbers(split1) then return false end

		local n0, n1 = tonumber(split0), tonumber(split1)
		if n0-3 == n1 then return true end -- left split
		if n0+1 == n1 and (n0 % 3) ~= 0 then return true end -- bottom split
		return false
	end

	if id == "street" then
		return withinNumbers(param) and (tonumber(param) - 1) % 3 == 0
	end

	if id == "corner" then
		return withinNumbers(param) and (tonumber(param) - 1) % 3 ~= 0 and tonumber(param) > 2
	end

	if id == "1-12" or id == "13-24" or id == "25-36" or id == "1-18" or id == "even" or
	   id == "red" or id == "black" or id == "odd" or id == "19-36" or id == "0" or
	   id == "00" or id == "column-1" or id == "column-2" or id == "column-3" then
		return true
	end

	return false
end
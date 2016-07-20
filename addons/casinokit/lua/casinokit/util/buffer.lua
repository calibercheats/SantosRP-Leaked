
-----------------------------------------------------
local Buffer = CasinoKit.class("Buffer")

local lshift, rshift, band = bit.lshift, bit.rshift, bit.band

function Buffer:initialize(data)
	Buffer.super.initialize(self)

	self.data = data
	self.dataPointer = 1
end

function Buffer:get()
	local x = string.byte(self.data, self.dataPointer)
	self.dataPointer = self.dataPointer + 1
	return x
end
function Buffer:getInt()
	return lshift(self:get(), 24) + lshift(self:get(), 16) + lshift(self:get(), 8) + self:get()
end
function Buffer:getString()
	local length = self:getInt()
	local str = string.sub(self.data, self.dataPointer, self.dataPointer + length - 1)
	self.dataPointer = self.dataPointer + length
	return str
end
function Buffer:getCard()
	local suit, rank = CasinoKit.classes.Suit.valueList[self:get()], CasinoKit.classes.Rank.valueList[self:get()]
	if not suit or not rank then return nil end
	return CasinoKit.classes.Card(suit, rank)
end

function Buffer:getArray(fn)
	local length = self:getInt()
	local t = {}
	for i=1, length do
		t[i] = fn(self, i)
	end
	return t
end

local OutBuffer = CasinoKit.class("OutBuffer")

function OutBuffer:initialize()
	OutBuffer.super.initialize(self)

	self.dataParts = {}
end

function OutBuffer:put(byte)
	byte = byte or "\x00"
	self.dataParts[#self.dataParts+1] = string.char(byte)
end
function OutBuffer:putInt(num)
	self:put(band(rshift(num, 24), 0xFF))
	self:put(band(rshift(num, 16), 0xFF))
	self:put(band(rshift(num, 8), 0xFF))
	self:put(band(num, 0xFF))
end
function OutBuffer:putRawString(str)
	self.dataParts[#self.dataParts+1] = str
end
function OutBuffer:putString(str)
	self:putInt(#str)
	self:putRawString(str)
end
function OutBuffer:putCard(card)
	if card == "back" or not card then
		self:put(0)
		self:put(0)
		return
	end
	self:put(card:getSuit().ordinal)
	self:put(card:getRank().ordinal)
end

function OutBuffer:putArray(arr, fn, arrLength)
	self:putInt(arrLength or #arr)
	for i=1, arrLength or #arr do
		fn(self, arr[i])
	end
end

function OutBuffer:build()
	return table.concat(self.dataParts, "")
end

function OutBuffer:toBuffer()
	return Buffer(self:build())
end

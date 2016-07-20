
-----------------------------------------------------
local CardGameCl = CasinoKit.class("CardGameCl", "GameCl")
CardGameCl:prop("players")

local CardGamePlayerCl = CasinoKit.class("CardGamePlayerCl", "PlayerCl")
CardGamePlayerCl:prop("cards")
function CardGamePlayerCl:initialize()
	CardGamePlayerCl.super.initialize(self)
	self:setCards({})
end
function CardGamePlayerCl:addCard(cardObj)
	table.insert(self:getCards(), cardObj)
end

function CardGameCl:cleanupSeat(seatIndex)
	self:getPlayers()[seatIndex] = nil
end

function CardGameCl:createClPlayer()
	return CardGamePlayerCl()
end

function CardGameCl:getPlayerInSeat(seatIndex, dontCreate)
	local players = self:getPlayers()

	local player = players[seatIndex]
	if not player and not dontCreate then
		player = self:createClPlayer()
		players[seatIndex] = player
	end

	return player
end

function CardGameCl:handleGameMessage(id, buf)
	if id == "newcd" then
		local seatIndex = buf:get()
		local cardId = buf:get()
		local card = buf:getCard()

		local player = self:getPlayerInSeat(seatIndex)

		local cardObj = self:createCardObject(card)
		player:addCard(cardObj)

		self.cardIds = self.cardIds or {}
		self.cardIds[cardId] = cardObj
	elseif id == "revcd" then
		local cardId = buf:get()
		local card = buf:getCard()

		local cardObj = self.cardIds and self.cardIds[cardId]
		if cardObj then
			cardObj.card = card
		else
			print("[CasinoKit] could not find card by id " .. tostring(cardId))
		end
	else
		CardGameCl.super.handleGameMessage(self, id, buf)
	end
end

function CardGameCl:initialize()
	CardGameCl.super.initialize(self)

	self:setPlayers({})
end

function CardGameCl:createCardObject(card, endPos)
	local obj = {
		anim = {
			started = math.max(CurTime(), self.nextCardAnimStart or 0),
			duration = 0.4,

			startPos = Vector(25, 0, 0),
			endPos = endPos
		},
		card = card
	}

	self.nextCardAnimStart = obj.anim.started + 0.5

	return obj
end

function CardGameCl:getActivityPosition(ent, localOrigin)
	-- a hack to make npc follow card only for 0.5 sec AFTER it's done animating
	if self.curAnimCard and self.curAnimCard.t > CurTime() - 0.5 then
		return ent:LocalToWorld(self.curAnimCard.pos)
	end
end


local function inQ(t, b, c, d)
	return -c * math.cos(t / d * (math.pi / 2)) + c + b
end

local function InBox(pos, Min, Max)
	if(
		(pos.x >= Min.x and pos.x <= Max.x) and
		(pos.y >= Min.y and pos.y <= Max.y) and
		(pos.z >= Min.z and pos.z <= Max.z)
	) then
		return true
	end
	return false
end

local cvar_cardscale = CreateConVar("casinokit_cardscale", "1", FCVAR_ARCHIVE)
local cvar_stencilcards = CreateConVar("casinokit_drawstencilcards", "0", FCVAR_ARCHIVE)
function CardGameCl:drawCard(ent, localOrigin, cardObj)
	local deck = CasinoKit.getCardDeck("default")
	deck:fetch()

	local mat = deck.backMaterials[1] or Material("error")
	if cardObj.card then
		local suit, rank = cardObj.card:getSuit(), cardObj.card:getRank()
		if suit and rank then
			local suitTable = deck.frontMaterials[suit]
			if suitTable then
				mat = suitTable[rank] or mat
			end
		end
	end

	local frac

	local elapsed = CurTime() - cardObj.anim.started
	if elapsed < 0 then
		frac = 0
	else
		frac = math.Clamp(elapsed / cardObj.anim.duration, 0, 1)
	end

	local easedFrac = frac ^ (1/3)

	local pos, rotation

	if frac >= 1 then
		pos = cardObj.anim.endPos or cardObj.anim.startPos
		rotation = cardObj.anim.endYaw or 0
	elseif frac <= 0 then
		pos = cardObj.anim.startPos
		rotation = cardObj.anim.startYaw or 0
	else
		pos = LerpVector(easedFrac, cardObj.anim.startPos, cardObj.anim.endPos or cardObj.anim.startPos)
		rotation = LerpAngle(easedFrac, Angle(0, cardObj.anim.startYaw or 0, 0), Angle(0, cardObj.anim.endYaw or 0, 0)).y

		self.curAnimCard = self.curAnimCard or {}
		self.curAnimCard.pos = pos
		self.curAnimCard.t = CurTime()
	end

	render.SetMaterial(mat)

	local w, h = 4, 6
	local scale = cvar_cardscale:GetFloat()
	w = w * scale
	h = h * scale

	local hw, hh = w/2, h/2
	local midPos = ent:LocalToWorld(localOrigin + pos)

	local ang = ent:LocalToWorldAngles(Angle(90, rotation, 0))

	local v1, v2, v3, v4 =
		midPos - ang:Right()*hw + ang:Up()*hh,
		midPos + ang:Right()*hw + ang:Up()*hh,
		midPos + ang:Right()*hw - ang:Up()*hh,
		midPos - ang:Right()*hw - ang:Up()*hh

	local stencilCards = cvar_stencilcards:GetBool()

	if stencilCards then
		--[[render.ClearStencil()
		render.SetStencilEnable(true)
		render.SetStencilCompareFunction(STENCIL_ALWAYS)
		render.SetStencilPassOperation(STENCIL_KEEP)
		render.SetStencilFailOperation(STENCIL_KEEP)
		render.SetStencilZFailOperation(STENCIL_REPLACE)

		render.SetStencilWriteMask(1)
		render.SetStencilTestMask(1)
		render.SetStencilReferenceValue(1)

		render.DrawQuad(v1, v2, v3, v4)

		render.SetStencilCompareFunction(STENCIL_EQUAL)]]

		cam.IgnoreZ(true)
		render.DrawQuad(v1, v2, v3, v4)
		cam.IgnoreZ(false)

		--render.SetStencilEnable(false)
	else
		render.DrawQuad(v1, v2, v3, v4)
	end

	if cardObj.card == nil and cardObj.hiddenCard then
		local min = Vector(-0.5, -hw, -hh)
		local max = Vector(0.5, hw, hh)

		local intersection = util.IntersectRayWithOBB(EyePos(), EyeAngles():Forward()*1000, midPos, ang, min, max)

		if intersection then
			local id = cardObj.hiddenCard:getSuit().name .. "p" .. cardObj.hiddenCard:getRank().name
			render.SetMaterial(CasinoKit.cardMaterials[id])

			local v1, v2, v3, v4 =
				midPos - ang:Right()*hw + ang:Up()*hh - ang:Forward() * 0.1,
				midPos + ang:Right()*hw + ang:Up()*hh - ang:Forward() * 0.1,
				midPos + ang:Right()*hw - ang:Up()*hh - ang:Forward() * 0.1,
				midPos - ang:Right()*hw - ang:Up()*hh - ang:Forward() * 0.1
			render.DrawQuad(v1, v2, v3, v4)
		end
	end

	if not cardObj.slideSound and frac > 0 then
		cardObj.slideSound = true

		local soundu = table.Random(deck.slideSounds or {})
		if soundu then
			self:playTableSound(soundu, midPos)
		end
	end
end

function CardGameCl:onStateChanged(newState)
	CardGameCl.super.onStateChanged(self, newState)

	if newState == "gameover" then
		self:setPlayers({})
	end
end

function CardGameCl:getCardHorizOffset(idx)
	return (idx-1.5)*0.18
end
function CardGameCl:getCardVertOffset(idx)
	return 14 - idx*2
end

function CardGameCl:updateCardEndPos(ent, card, idx, ply, seatIndex)
	local _, lang = ent:SeatIndexOrientation(seatIndex)
	local lpos, _ = ent:SeatIndexOrientation(seatIndex + self:getCardHorizOffset(idx), self:getCardVertOffset(idx))
	card.anim.endPos = lpos
	card.anim.endPos.z = 0
	card.anim.endYaw = lang.y
end

function CardGameCl:drawTable(ent, localOrigin)
	for _,tpl in pairs(ent:GetCachedSeatindexPlyTuples()) do
		local seatIndex = tpl[1]
		local ply = tpl[2]

		if ply:IsValid() then
			local lpos, lang = ent:SeatIndexOrientation(seatIndex, 29.5)
			lpos = ent:LocalToWorld(localOrigin + lpos)
			lang = ent:LocalToWorldAngles(lang)
			CasinoKit.drawChipStack(ply:CKit_GetChips(), lpos, lang, true)
		end
	end

	for k,p in pairs(self:getPlayers()) do
		for cidx,c in pairs(p:getCards()) do
			if not c.anim.endPos then
				self:updateCardEndPos(ent, c, cidx, p, k)
			end
			self:drawCard(ent, localOrigin, c)
		end
	end
end

function CardGameCl:drawUI(ent, p)
	CardGameCl.super.drawUI(self, ent, p)
end

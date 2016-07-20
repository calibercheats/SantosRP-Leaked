
-----------------------------------------------------
local wsLoaded = false
CasinoKit.fetchFromWorkshop(662520760, function() wsLoaded = true end)

include("shared.lua")

ENT.RenderGroup = RENDERGROUP_BOTH

local ROUL_INNER_RAD = ENT.ROUL_INNER_RAD
local ROUL_INNER_HEIGHT = ENT.ROUL_INNER_HEIGHT

local ROUL_MID_HEIGHT = ENT.ROUL_MID_HEIGHT

local ROUL_OUTER_RAD = ENT.ROUL_OUTER_RAD
local ROUL_OUTER_HEIGHT = ENT.ROUL_OUTER_HEIGHT

local ROUL_BORDER_HEIGHT = ENT.ROUL_BORDER_HEIGHT
local ROUL_TOTAL_RAD = ENT.ROUL_TOTAL_RAD

local ROUL_BALL_RAD = ENT.ROUL_BALL_RAD

local ROUL_BALL_MASS = ENT.ROUL_BALL_MASS
local ROUL_BALL_ROLLFRICTION_COEFFICIENT = ENT.ROUL_BALL_ROLLFRICTION_COEFFICIENT
local ROUL_BALL_ROLLSLIDEFRICTION_COEFFICIENT = ENT.ROUL_BALL_ROLLSLIDEFRICTION_COEFFICIENT

local METRIC_TO_SOURCE_SCALE = 29.52756 -- assuming 1 unit = 0.75 inch (source: VDW)

local ROUL_TOTAL_RAD_SOURCE = ROUL_TOTAL_RAD * METRIC_TO_SOURCE_SCALE
local ROUL_OUTER_RAD_SOURCE = ROUL_OUTER_RAD * METRIC_TO_SOURCE_SCALE
local ROUL_OUTER_HEIGHT_SOURCE = ROUL_OUTER_HEIGHT * METRIC_TO_SOURCE_SCALE
local ROUL_INNER_RAD_SOURCE = ROUL_INNER_RAD * METRIC_TO_SOURCE_SCALE
local ROUL_INNER_HEIGHT_SOURCE = ROUL_INNER_HEIGHT * METRIC_TO_SOURCE_SCALE
local ROUL_MID_HEIGHT_SOURCE = ROUL_MID_HEIGHT * METRIC_TO_SOURCE_SCALE
local ROUL_BORDER_HEIGHT_SOURCE = ROUL_BORDER_HEIGHT * METRIC_TO_SOURCE_SCALE

local ROUL_INOUT_RATIO = ROUL_INNER_RAD / ROUL_OUTER_RAD

local CIRCLE_POINTS = 40
local RADS_PER_POINT = math.pi * 2 / CIRCLE_POINTS

local obj = Mesh()
local verts = {}

for i=1, CIRCLE_POINTS do
	-- Top plane
	local rad0, rad1 = RADS_PER_POINT * i, RADS_PER_POINT * (i + 1)
	local rad0x, rad0y = math.cos(rad0), math.sin(rad0)
	local rad1x, rad1y = math.cos(rad1), math.sin(rad1)

	local u0, v0 = rad0x * 0.5 + 0.5, rad0y * 0.5 + 0.5
	local u1, v1 = rad1x * 0.5 + 0.5, rad1y * 0.5 + 0.5

	local iu0, iv0 = rad0x * ROUL_INOUT_RATIO * 0.5 + 0.5, rad0y * ROUL_INOUT_RATIO * 0.5 + 0.5
	local iu1, iv1 = rad1x * ROUL_INOUT_RATIO * 0.5 + 0.5, rad1y * ROUL_INOUT_RATIO * 0.5 + 0.5

	table.insert(verts, { pos = Vector(rad0x*ROUL_OUTER_RAD_SOURCE, rad0y*ROUL_OUTER_RAD_SOURCE, ROUL_OUTER_HEIGHT_SOURCE), normal = Vector(0, 0, 1), u = 1-u0, v = v0 })
	table.insert(verts, { pos = Vector(rad1x*ROUL_INNER_RAD_SOURCE, rad1y*ROUL_INNER_RAD_SOURCE, ROUL_MID_HEIGHT_SOURCE), normal = Vector(0, 0, 1), u = 1-iu1, v = iv1 })
	table.insert(verts, { pos = Vector(rad1x*ROUL_OUTER_RAD_SOURCE, rad1y*ROUL_OUTER_RAD_SOURCE, ROUL_OUTER_HEIGHT_SOURCE), normal = Vector(0, 0, 1), u = 1-u1, v = v1 })

	table.insert(verts, { pos = Vector(rad0x*ROUL_OUTER_RAD_SOURCE, rad0y*ROUL_OUTER_RAD_SOURCE, ROUL_OUTER_HEIGHT_SOURCE), normal = Vector(0, 0, 1), u = 1-u0, v = v0 })
	table.insert(verts, { pos = Vector(rad0x*ROUL_INNER_RAD_SOURCE, rad0y*ROUL_INNER_RAD_SOURCE, ROUL_MID_HEIGHT_SOURCE), normal = Vector(0, 0, 1), u = 1-iu0, v = iv0 })
	table.insert(verts, { pos = Vector(rad1x*ROUL_INNER_RAD_SOURCE, rad1y*ROUL_INNER_RAD_SOURCE, ROUL_MID_HEIGHT_SOURCE), normal = Vector(0, 0, 1), u = 1-iu1, v = iv1 })

	table.insert(verts, { pos = Vector(rad0x*ROUL_INNER_RAD_SOURCE, rad0y*ROUL_INNER_RAD_SOURCE, ROUL_MID_HEIGHT_SOURCE), normal = Vector(0, 0, 1), u = 1-iu0, v = iv0 })
	table.insert(verts, { pos = Vector(0, 0, ROUL_INNER_HEIGHT_SOURCE), normal = Vector(0, 0, 1), u = 0.5, v = 0.5 })
	table.insert(verts, { pos = Vector(rad1x*ROUL_INNER_RAD_SOURCE, rad1y*ROUL_INNER_RAD_SOURCE, ROUL_MID_HEIGHT_SOURCE), normal = Vector(0, 0, 1), u = 1-iu1, v = iv1 })
end
obj:BuildFromTriangles(verts)

local out_obj = Mesh()
local out_verts = {}

local function map_out_u(u)
	return math.Remap(u, 0, 1, 0.6, 0.9)
end
local function map_out_v(v)
	return math.Remap(v, 0, 1, 0.8, 0.9)
end

local LOWER_BORDER_RAD_SOURCE = ROUL_TOTAL_RAD_SOURCE - 0.1
local LOWER_BORDER_HEIGHT_SOURCE = ROUL_BORDER_HEIGHT_SOURCE - 1

for i=1, CIRCLE_POINTS do
	-- Top plane
	local rad0, rad1 = RADS_PER_POINT * i, RADS_PER_POINT * (i + 1)
	local rad0x, rad0y = math.cos(rad0), math.sin(rad0)
	local rad1x, rad1y = math.cos(rad1), math.sin(rad1)

	local u0, v0 = rad0x * 0.5 + 0.5, rad0y * 0.5 + 0.5
	local u1, v1 = rad1x * 0.5 + 0.5, rad1y * 0.5 + 0.5

	local iu0, iv0 = rad0x * ROUL_INOUT_RATIO * 0.5 + 0.5, rad0y * ROUL_INOUT_RATIO * 0.5 + 0.5
	local iu1, iv1 = rad1x * ROUL_INOUT_RATIO * 0.5 + 0.5, rad1y * ROUL_INOUT_RATIO * 0.5 + 0.5

	table.insert(out_verts, { pos = Vector(rad0x*LOWER_BORDER_RAD_SOURCE, rad0y*LOWER_BORDER_RAD_SOURCE, LOWER_BORDER_HEIGHT_SOURCE), normal = Vector(0, 0, 1), u = map_out_u(u0), v = map_out_v(v0) })
	table.insert(out_verts, { pos = Vector(rad1x*ROUL_OUTER_RAD_SOURCE, rad1y*ROUL_OUTER_RAD_SOURCE, ROUL_OUTER_HEIGHT_SOURCE), normal = Vector(0, 0, 1), u = map_out_u(iu1), v = map_out_v(iv1) })
	table.insert(out_verts, { pos = Vector(rad1x*LOWER_BORDER_RAD_SOURCE, rad1y*LOWER_BORDER_RAD_SOURCE, LOWER_BORDER_HEIGHT_SOURCE), normal = Vector(0, 0, 1), u = map_out_u(u1), v = map_out_v(v1) })

	table.insert(out_verts, { pos = Vector(rad0x*LOWER_BORDER_RAD_SOURCE, rad0y*LOWER_BORDER_RAD_SOURCE, LOWER_BORDER_HEIGHT_SOURCE), normal = Vector(0, 0, 1), u = map_out_u(u0), v = map_out_v(v0) })
	table.insert(out_verts, { pos = Vector(rad0x*ROUL_OUTER_RAD_SOURCE, rad0y*ROUL_OUTER_RAD_SOURCE, ROUL_OUTER_HEIGHT_SOURCE), normal = Vector(0, 0, 1), u = map_out_u(iu0), v = map_out_v(iv1) })
	table.insert(out_verts, { pos = Vector(rad1x*ROUL_OUTER_RAD_SOURCE, rad1y*ROUL_OUTER_RAD_SOURCE, ROUL_OUTER_HEIGHT_SOURCE), normal = Vector(0, 0, 1), u = map_out_u(iu1), v = map_out_v(iv1) })
end
out_obj:BuildFromTriangles(out_verts)

local out2_obj = Mesh()
local out2_verts = {}

for i=1, CIRCLE_POINTS do
	-- Top plane
	local rad0, rad1 = RADS_PER_POINT * i, RADS_PER_POINT * (i + 1)
	local rad0x, rad0y = math.cos(rad0), math.sin(rad0)
	local rad1x, rad1y = math.cos(rad1), math.sin(rad1)

	local u0, v0 = rad0x * 0.5 + 0.5, rad0y * 0.5 + 0.5
	local u1, v1 = rad1x * 0.5 + 0.5, rad1y * 0.5 + 0.5

	local iu0, iv0 = rad0x * ROUL_INOUT_RATIO * 0.5 + 0.5, rad0y * ROUL_INOUT_RATIO * 0.5 + 0.5
	local iu1, iv1 = rad1x * ROUL_INOUT_RATIO * 0.5 + 0.5, rad1y * ROUL_INOUT_RATIO * 0.5 + 0.5

	table.insert(out2_verts, { pos = Vector(rad0x*ROUL_TOTAL_RAD_SOURCE, rad0y*ROUL_TOTAL_RAD_SOURCE, ROUL_BORDER_HEIGHT_SOURCE), normal = Vector(0, 0, 1), u = map_out_u(u0), v = map_out_v(v0) })
	table.insert(out2_verts, { pos = Vector(rad1x*LOWER_BORDER_RAD_SOURCE, rad1y*LOWER_BORDER_RAD_SOURCE, LOWER_BORDER_HEIGHT_SOURCE), normal = Vector(0, 0, 1), u = map_out_u(iu1), v = map_out_v(iv1) })
	table.insert(out2_verts, { pos = Vector(rad1x*ROUL_TOTAL_RAD_SOURCE, rad1y*ROUL_TOTAL_RAD_SOURCE, ROUL_BORDER_HEIGHT_SOURCE), normal = Vector(0, 0, 1), u = map_out_u(u1), v = map_out_v(v1) })

	table.insert(out2_verts, { pos = Vector(rad0x*ROUL_TOTAL_RAD_SOURCE, rad0y*ROUL_TOTAL_RAD_SOURCE, ROUL_BORDER_HEIGHT_SOURCE), normal = Vector(0, 0, 1), u = map_out_u(u0), v = map_out_v(v0) })
	table.insert(out2_verts, { pos = Vector(rad0x*LOWER_BORDER_RAD_SOURCE, rad0y*LOWER_BORDER_RAD_SOURCE, LOWER_BORDER_HEIGHT_SOURCE), normal = Vector(0, 0, 1), u = map_out_u(iu0), v = map_out_v(iv1) })
	table.insert(out2_verts, { pos = Vector(rad1x*LOWER_BORDER_RAD_SOURCE, rad1y*LOWER_BORDER_RAD_SOURCE, LOWER_BORDER_HEIGHT_SOURCE), normal = Vector(0, 0, 1), u = map_out_u(iu1), v = map_out_v(iv1) })
end
out2_obj:BuildFromTriangles(out2_verts)

local mater = CreateMaterial("CasinoKit_RouletteMat_" .. os.time(), "VertexLitGeneric", {})
CasinoKit.getRemoteMaterial("http://i.imgur.com/hdvEuIB.png", function(mat)
	mater:SetTexture("$basetexture", mat:GetTexture("$basetexture"))
end, true)

local out_mater = Material("error")
local omLoad = false

--[[
hook.Add("HUDPaint", "Lol", function()
	surface.SetDrawColor(255, 255, 255)
	surface.SetMaterial(mater)
	surface.DrawTexturedRect(0, 0, 512, 512)

	local ox, oy = 256, 256
	for i=1, 36 do
		local rad = CurTime()*0.03 + i * (math.pi*2/36)
		local x, y = ox + math.cos(rad)*230, oy + math.sin(rad)*230
		draw.SimpleText(ents.FindByClass("casinokit_roulette")[1]:GetNumberFromRad(rad), "DermaDefault", x, y, nil, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end)]]

local WHEEL_CENTER = Vector(6.3, -27.5, 15)

function ENT:Draw()
	self:DrawModel()

	if wsLoaded and not omLoad then
		out_mater = Material("models/casinokit/roulette/Table")
		omLoad = true
	end

	local mat = Matrix()
	mat:Translate(self:LocalToWorld(WHEEL_CENTER))
	mat:Rotate(self:LocalToWorldAngles(Angle(0, 175 + math.deg(self:GetWheelAngle()), 0)))

	cam.PushModelMatrix(mat)
	render.SetMaterial(mater)
	obj:Draw()
	cam.PopModelMatrix()

	local mat = Matrix()
	mat:Translate(self:LocalToWorld(WHEEL_CENTER))
	mat:Rotate(self:LocalToWorldAngles(Angle(0, 0, 0)))

	cam.PushModelMatrix(mat)
	render.SetMaterial(out_mater)
	out_obj:Draw()
	out2_obj:Draw()
	cam.PopModelMatrix()

	if not IsValid(self.WheelBallModel) then
		self.WheelBallModel = ClientsideModel("models/XQM/Rails/gumball_1.mdl")
	end

	if self.RollData then
		local ballpos = self:SimulateBall(self.RollData.start, self.RollData.strength)

		self.WheelBallModel:SetNoDraw(true)
		self.WheelBallModel:SetRenderOrigin(self:LocalToWorld(ballpos * METRIC_TO_SOURCE_SCALE + WHEEL_CENTER))
		self.WheelBallModel:SetModelScale(ROUL_BALL_RAD * 2, 0)
		self.WheelBallModel:SetupBones()

		self.WheelBallModel:DrawModel()


		if self.WheelBallSound ~= true and IsValid(self.WheelBallSound) then
			local elapsed = CurTime() - self.RollData.start
			local ballStopTime = self:GetBallStopTime(self.RollData.strength)

			local shouldPlay = elapsed < ballStopTime

			if shouldPlay and self.WheelBallSound:GetState() ~= STATE_PLAYING then
				self.WheelBallSound:Play()
			elseif not shouldPlay and self.WheelBallSound:GetState() ~= STATE_PAUSED then
				self.WheelBallSound:Pause()
			end
			self.WheelBallSound:SetPos(self:LocalToWorld(ballpos))
		end
	end

	if not self.WheelBallSound then
		self.WheelBallSound = true
		sound.PlayFile("sound/casinokit/roulette/roulette_loop1.ogg", "3d", function(chan, e, i)
			if not chan then
				MsgN("[CasinoKit] Failed to load roulette loop; ", e, i)
				return
			end
			chan:SetVolume(0.1)
			self.WheelBallSound = chan
		end)
	end
end

function ENT:SendBet(id, param)
	if not self.localBet or self.localBet <= 0 then
		LocalPlayer():ChatPrint("Please set bet")
		return
	end

	net.Start("ckit_roul_bet")
	net.WriteEntity(self)
	net.WriteString(id)
	net.WriteString(param or "")
	net.WriteUInt(self.localBet, 16)
	net.SendToServer()
end

local clr_red_no = Color(255, 20, 20, 220)
local clr_black_no = Color(20, 20, 20, 220)

local simple_bets = {
	{id = "00", x = -45, y = 0, w = 45, h = 80},
	{id = "0", x = -45, y = 80, w = 45, h = 80},

	{id = "1-12", text = "1st 12", x = 0, y = 158, w = 160, h = 37},
	{id = "13-24", text = "2nd 12", x = 160, y = 158, w = 160, h = 37},
	{id = "25-36", text = "3rd 12", x = 320, y = 158, w = 160, h = 37},

	{id = "1-18", text = "1 to 18", x = 0, y = 195, w = 80, h = 45},
	{id = "even", text = "EVEN", x = 80, y = 195, w = 80, h = 45},
	{id = "red", text = "RED", clr = clr_red_no, x = 160, y = 195, w = 80, h = 45},
	{id = "black", text = "BLACK", clr = clr_black_no, x = 240, y = 195, w = 80, h = 45},
	{id = "odd", text = "ODD", x = 320, y = 195, w = 80, h = 45},
	{id = "19-36", text = "19 to 36", x = 400, y = 195, w = 80, h = 45},

	{id = "column-3", x = 480, y = 0, w = 45, h = 50},
	{id = "column-2", x = 480, y = 50, w = 45, h = 50},
	{id = "column-1", x = 480, y = 100, w = 45, h = 50},
}

local tdui_off = Vector(-12, 15.2, 13.5)
local tdui_ang = Angle(90, 180, 0)
local tdui_scale = 0.081

function ENT:DrawTDUIChip(amount, x, y, oldChips)
	local vec = tdui_off + Vector(y * tdui_scale, x * tdui_scale, (oldChips or 0) * 0.135)
	return CasinoKit.drawChipSingleStack(amount, self:LocalToWorld(vec), Angle(0, 0, 0))
end

net.Receive("ckit_roul_bet", function()
	local ent = net.ReadEntity()

	local betId = net.ReadString()
	local betParam = net.ReadString()
	local betIdParam = betId .. "-" .. betParam

	local amount = net.ReadUInt(16)

	ent.ExistingBets = ent.ExistingBets or {}
	ent.ExistingBets[betIdParam] = ent.ExistingBets[betIdParam] or {}
	table.insert(ent.ExistingBets[betIdParam], {amount = amount})
end)
net.Receive("ckit_roul_clearbet", function()
	local ent = net.ReadEntity()
	ent.ExistingBets = {}
end)

function ENT:DrawTDUIBets(betId, betParam, x, y)
	local ebets = self.ExistingBets and self.ExistingBets[("%s-%s"):format(betId, betParam)]
	if not ebets then return end

	local da = 0
	for _,ebet in pairs(ebets) do
		da = da + self:DrawTDUIChip(ebet.amount, x, y, da)
	end
end

local MAX_DIST_SQ = math.pow(126, 2)

local betset_spots = {
	{pos = Vector(21, -9, 14.2), ang = Angle(90, 180, 0)},
	{pos = Vector(21, 20, 14.2), ang = Angle(90, 180, 0)},
	{pos = Vector(12, 40, 14.2), ang = Angle(90, -90, 0)},
	{pos = Vector(-11.5, 32, 14.2), ang = Angle(90, 0, 0)},
}

local expand_bounds_fn = function(self)
	self:_ExpandRenderBounds(-240, -160, 600, 500)
end

--SantosRP EDIT - some addon we have is overwriting Trebuchet24 to be additive... whyyyyyyyy
surface.CreateFont( "ckTrebuchet24", {
	font = "Trebuchet24",
	size = 24,
	weight = 500,
	additive = false,
} )

local tdui = CasinoKit.tdui
function ENT:DrawTranslucent()
	if LocalPlayer():EyePos():DistToSqr(self:GetPos()) > MAX_DIST_SQ then return end

	self:DrawModel() -- needed so that chips are shaded properly

	self.p = self.p or tdui.Create()
	local p = self.p

	local table_x, table_y = -240, 100

    for i=1,36 do
		local col = math.floor((i-1) / 3)
		local row = 2 - ((i-1) % 3)

		local x, y, w, h = table_x + col * 40, table_y + row * 51, 40, 51
		local inner_margin = 5
		local inner_x, inner_y, inner_w, inner_h = x+inner_margin, y+inner_margin, w-inner_margin*2, h-inner_margin*2

		do
			local pressed, _, hovered = p:TestAreaInput(inner_x, inner_y, inner_w, inner_h)

			local betId, betParam = "single", i
			local betIdParam = ("%s-%s"):format(betId, betParam)

			self:DrawTDUIBets(betId, betParam, x + w/2, y + h/2)
			if pressed then
				self:SendBet(betId, betParam)
			end
			if hovered then
				self:DrawTDUIChip(self.localBet or 0, x + w/2, y + h/2)
			end
		end

		-- top and right (no functionality)

		-- bottom (with "split")
		do
			local bottom_pressed, _, bottom_hovered = p:TestAreaInput(inner_x, y+h-inner_margin, inner_w, inner_margin*2)

			local betId = row == 2 and "street" or "split"
			local betParam = row == 2 and i or ((i-1) .. "-" .. i)

			self:DrawTDUIBets(betId, betParam, x + w/2, y + h)
			if bottom_pressed then
				self:SendBet(betId, betParam)
			end
			if bottom_hovered then
				self:DrawTDUIChip(self.localBet or 0, x + w/2, y + h)
			end
		end

		-- left (with "split")
		do

			local can_left_split = col > 0
			if can_left_split then
				local left_pressed, _, left_hovered = p:TestAreaInput(x-inner_margin, inner_y, inner_margin*2, inner_h)

				local betId = "split"
				local betParam = i .. "-" .. (i-3)

				self:DrawTDUIBets(betId, betParam, x, y + h/2)

				if left_pressed then
					self:SendBet(betId, betParam)
				end
				if left_hovered then
					self:DrawTDUIChip(self.localBet or 0, x, y + h/2)
				end
			end
		end

		-- bottom_left
		do
			local can_corner = row < 2 and col > 0
			if can_corner then
				local bottom_left_pressed, _, bottom_left_hovered = p:TestAreaInput(x-inner_margin, y+h-inner_margin, inner_margin*2, inner_margin*2)

				local betId = "corner"
				local betParam = i

				self:DrawTDUIBets(betId, betParam, x, y + h)

				if bottom_left_pressed then
					self:SendBet(betId, betParam)
				end
				if bottom_left_hovered then
					self:DrawTDUIChip(self.localBet or 0, x, y + h)
				end
			end
		end
	end

	for _,bet in pairs(simple_bets) do
		local pressed, _, hovered = p:TestAreaInput(table_x + bet.x, table_y + bet.y, bet.w, bet.h)
		if pressed then
			self:SendBet(bet.id)
		end

		local cx, cy = table_x + bet.x + bet.w / 2, table_y + bet.y + bet.h / 2

		self:DrawTDUIBets(bet.id, "", cx, cy)
		if hovered then
			self:DrawTDUIChip(self.localBet or 0, cx, cy)
		end
	end

	local num = "-"

	if self.RollData then
		num = self:GetBallNumber(self.RollData.start, self.RollData.strength)
	end

	if not self:GetRolling() then
		p:Text("Next roll in " .. math.floor(self:GetTimeToNextRoll()), "Trebuchet24", -100, 70, nil, TEXT_ALIGN_LEFT)
	end

	p:Text("Number:", "ckTrebuchet24", -240, 70, nil, TEXT_ALIGN_LEFT)
	p:Text(num, "ckTrebuchet24", -160, 70, table.HasValue(self.RedNumbers, num) and clr_red_no or clr_black_no, TEXT_ALIGN_LEFT)
	p:Text("Minimum bet: " .. self:GetMinBet(), "Trebuchet24", -240, 345, nil, TEXT_ALIGN_LEFT)

	p:Custom(expand_bounds_fn)
	p:Cursor()

    p:Render(self:LocalToWorld(tdui_off), self:LocalToWorldAngles(tdui_ang), tdui_scale)

	self.betp = self.betp or tdui.Create()
	local betp = self.betp

	local delta = (input.IsShiftDown() and (input.IsKeyDown(KEY_LALT) and 100 or 10) or 1)
	if betp:Button("<", "!Roboto@20", 0, 0, 30, 30) then
		self.localBet = math.max((self.localBet or 0) - delta, self:GetMinBet())
		self.localBet = math.min( self.localBet, self:GetMaxBet() )
	end
	betp:Rect(35, 0, 70, 30)
	betp:Text(self.localBet or 0, "!Roboto@22", 70, 4, Color(255, 255, 255))
	if betp:Button(">", "!Roboto@20", 110, 0, 30, 30) then
		self.localBet = math.max((self.localBet or 0) + delta, self:GetMinBet())
		self.localBet = math.min( self.localBet, self:GetMaxBet() )
	end

    betp:Cursor()

	local leyepos = self:WorldToLocal(LocalPlayer():EyePos())

	local thespot, thespotdist = nil, math.huge
	for _,spot in pairs(betset_spots) do
		local dist = leyepos:Distance(spot.pos)
		if dist < thespotdist then
			thespot = spot
			thespotdist = dist
		end
	end

	CasinoKit.drawChipStack(LocalPlayer():CKit_GetChips() or 0, self:LocalToWorld(thespot.pos + thespot.ang:Right()*-4 + thespot.ang:Up()*-1), self:LocalToWorldAngles(thespot.ang), true)

    betp:Render(self:LocalToWorld(thespot.pos), self:LocalToWorldAngles(thespot.ang), 0.1)


--[[
	cam.Start3D2D(self:LocalToWorld(Vector(0, 40, 23)), self:LocalToWorldAngles(Angle(0, 0, 0)), 0.1)

	draw.NoTexture()
	surface.SetDrawColor(255, 255, 255)

	for i=1, 36 do
		local rad = (CurTime()*0.05 + i * (math.pi*2/36)) % (math.pi*2)
		local x, y = math.cos(rad)*100, math.sin(rad)*100
		draw.SimpleText(("%s"):format(self:GetNumberFromRad(self:GetWheelAngle() + rad), rad), "DermaDefault", x, y, nil, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		surface.DrawRect(math.cos(rad)*110 - 1, math.sin(rad)*110 - 1, 2, 2)
	end

	cam.End3D2D()]]
end

function ENT:Roll(startTime, strength)
	self.RollData = {
		start = startTime,
		strength = strength
	}
	self:EmitSound("casinokit/roulette/roulette_start1.ogg")
end
net.Receive("ckit_roul_roll", function()
	net.ReadEntity():Roll(net.ReadDouble(), net.ReadDouble())
end)
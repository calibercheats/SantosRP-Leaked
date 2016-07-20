
-----------------------------------------------------
-- Extremely small OOP library
local function Class(name, parent)
	local t = {}

	local meta = {}
	meta.__call = function(_, ...)
		local inst = setmetatable({}, {__index = t})
		if inst.initialize then inst:initialize(...) end
		return inst
	end
	if parent then meta.__index = parent end

	setmetatable(t, meta)

	return t
end

-- access hack
local function AccessorFunc(panel, fieldname, name, forceType, default)
	local function getter(self)
		local val = self[fieldname]
		if val == nil then return default end
		return val
	end

	panel["Get" .. name] = getter

	-- If it's forced to boolean, we add additional getter prefixed with "Is"
	if forceType == FORCE_BOOL then
		panel["Is" .. name] = getter
	end

	panel["Set" .. name] = function(self, newval)
		self[fieldname] = newval

		return self -- for chaining
	end
end


local Unit = Class("Unit")
local FixedUnit = Class("FixedUnit", Unit)
function FixedUnit:initialize(size)
	self.size = size
end
function FixedUnit:getSize(containerSize)
	return self.size
end

local PercUnit = Class("PercUnit", Unit)
function PercUnit:initialize(perc)
	self.perc = perc
end
function FixedUnit:getSize(containerSize)
	return self.perc * containerSize
end

local GridDim = Class("GridDim")
AccessorFunc(GridDim, "_size", "Size")
AccessorFunc(GridDim, "_expanded", "Expanded")
function GridDim:Reset()
	self:SetSize(0)
	self:SetExpanded(false)
end

local Row = Class("Row", GridDim)
AccessorFunc(Row, "_marginTop", "MarginTop")
AccessorFunc(Row, "_marginBottom", "MarginBottom")
local Column = Class("Column", GridDim)

local A_TOP =    bit.lshift(1, 1)
local A_BOTTOM = bit.lshift(1, 2)
local A_LEFT =   bit.lshift(1, 3)
local A_RIGHT =  bit.lshift(1, 4)

local Cell = Class("Cell")
AccessorFunc(Cell, "_align", "Alignment")
AccessorFunc(Cell, "_expandedX", "ExpandedX")
AccessorFunc(Cell, "_expandedY", "ExpandedY")
AccessorFunc(Cell, "_filledX", "FilledX")
AccessorFunc(Cell, "_filledY", "FilledY")
AccessorFunc(Cell, "_width", "Width")
AccessorFunc(Cell, "_height", "Height")
AccessorFunc(Cell, "_paddingL", "PaddingLeft")
AccessorFunc(Cell, "_paddingT", "PaddingTop")
AccessorFunc(Cell, "_paddingR", "PaddingRight")
AccessorFunc(Cell, "_paddingB", "PaddingBottom")
AccessorFunc(Cell, "_colspan", "Colspan")
function Cell:initialize(comp)
	self.comp = comp
	self:Center()
end
function Cell:GetComponent() return self.comp end
--- Returns the size the cell wants to be. ((specifiedSize or comp.size) + margins + paddings)
function Cell:GetPreferredCellSize()
	local w, h = self:GetWidth() or self:GetComponent():GetWide(), self:GetHeight() or self:GetComponent():GetTall()
	w = w + (self:GetPaddingLeft() or 0) + (self:GetPaddingRight() or 0)
	h = h + (self:GetPaddingTop() or 0) + (self:GetPaddingBottom() or 0)
	return w, h
end
function Cell:SetPadding(x)
	self:SetPaddingLeft(x) self:SetPaddingTop(x) self:SetPaddingRight(x) self:SetPaddingBottom(x) return self
end
function Cell:Expand()
	self:SetExpandedX(true) self:SetExpandedY(true) return self
end
function Cell:Fill()
	self:SetFilledX(true) self:SetFilledY(true) return self
end
function Cell:_SetAlignment(x, contradicting)
	local a = self:GetAlignment()
	a = bit.bor(a, x)
	a = bit.band(a, bit.bnot(contradicting))
	self:SetAlignment(a)
	return self
end
function Cell:Top()
	return self:_SetAlignment(A_TOP, A_BOTTOM)
end
function Cell:Bottom()
	return self:_SetAlignment(A_BOTTOM, A_TOP)
end
function Cell:Right()
	return self:_SetAlignment(A_RIGHT, A_LEFT)
end
function Cell:Left()
	return self:_SetAlignment(A_LEFT, A_RIGHT)
end
function Cell:Center()
	-- Garry, add lua operators please
	self:SetAlignment(A_TOP + A_BOTTOM + A_LEFT + A_RIGHT) return self
end

function Cell:GetAlignmentFractions()
	local alignment = self:GetAlignment()

	local alignx, aligny = 0.5, 0.5

	if bit.band(alignment, A_LEFT) ~= 0 and bit.band(alignment, A_RIGHT) == 0 then
		alignx = 0
	end
	if bit.band(alignment, A_RIGHT) ~= 0 and bit.band(alignment, A_LEFT) == 0 then
		alignx = 1
	end

	if bit.band(alignment, A_TOP) ~= 0 and bit.band(alignment, A_BOTTOM) == 0 then
		aligny = 0
	end
	if bit.band(alignment, A_BOTTOM) ~= 0 and bit.band(alignment, A_TOP) == 0 then
		aligny = 1
	end

	return alignx, aligny
end

local PANEL = {}

AccessorFunc(PANEL, "_debugMode", "DebugMode", FORCE_BOOL)

function PANEL:Init()
	-- Internal cell is used for doing stuff with the logical table
	-- It should not be accessed directly, but through exposed methods
	self._internalCell = Cell(self)

	-- Grid[RowIndex][ColumnIndex] = Cell
	self._grid = {}

	self._rows = {}
	self._cols = {}

	self:Row() -- Start first row
end

function PANEL:Top()
	self._internalCell:Top() return self
end
function PANEL:Bottom()
	self._internalCell:Bottom() return self
end
function PANEL:Right()
	self._internalCell:Right() return self
end
function PANEL:Left()
	self._internalCell:Left() return self
end
function PANEL:Center()
	self._internalCell:Center() return self
end

function PANEL:SetPadding(x)
	self._internalCell:SetPadding(x) return self
end
-- TODO individual paddings

function PANEL:GetRow(i)
	return self._rows[i or self:RowId()]
end
function PANEL:GetCol(i)
	return self._cols[i]
end
function PANEL:GetColspannedColI(i, row)
	local rowCols = self._grid[row]

	local cursor = 0
	for k, rowcol in ipairs(rowCols) do
		cursor = cursor + (rowcol:GetColspan() or 1)

		-- Note, if colspan is eg. 10, the cursor can easily jump over i
		-- That's why we need a GTEQ check here instead of EQ
		if cursor >= i then return k end
	end
end
function PANEL:GetColspannedCol(i, row)
	return self._cols[self:GetColspannedColI(i, row)]
end

function PANEL:Row()
	local rowId = #self._rows + 1
	self._grid[rowId] = {}

	local row = Row()
	self._rows[rowId] = row

	return row
end
function PANEL:RowId()
	return #self._rows
end

function PANEL:RowCount()
	return #self._rows
end
function PANEL:ColCount()
	return #self._cols
end

function PANEL:GridRow()
	return self._grid[#self._grid]
end

function PANEL:Add(comp)
	-- Create null component
	if not comp then
		comp = vgui.Create("Panel")
	end

	local row = self:GridRow()

	local rowi, coli = self:RowId(), #row+1

	-- Create Column object if it does not exist
	if not self._cols[coli] then
		self._cols[coli] = Column()
	end

	local _cell = Cell(comp)
	comp:SetParent(self)

	_cell.rowi = rowi
	_cell.coli = coli

	_cell.row = self._rows[rowi]
	_cell.col = self._cols[coli]

	table.insert(row, _cell)

	return _cell
end

-- This computes each row and column object's size.
-- This method should be called if any components or the table changes size
function PANEL:ComputeSizes()
	-- First compute non-expanded sizes and store expanded statuses
	for c=1, self:ColCount() do
		local col = self._cols[c]
		col:Reset()
	end

	for r=1, self:RowCount() do
		local row = self:GetRow(r)
		row:Reset()

		local rowcols = self._grid[r]

		local spannedc = 1
		for c=1, #rowcols do
			local cell = rowcols[c]
			local colspan = cell:GetColspan() or 1

			if cell:GetExpandedY() then
				row:SetExpanded(true)
			end

			local cw, ch = cell:GetPreferredCellSize()

			row:SetSize(math.max(row:GetSize(), ch))

			-- If we need to use colspan, we shouldnt be the ones deciding column sizes and instead delegate
			-- that to other rows. TODO this might be incorrect behavior in some situations?
			if colspan > 1 then cw = 0 end

			-- Set size/expand status for each col independently
			for cs=0, colspan-1 do
				local col = self:GetCol(spannedc + cs)

				if col then
					if cell:GetExpandedX() then
						col:SetExpanded(true)
					end
					col:SetSize(math.max(col:GetSize(), cw))
				end
			end

			spannedc = spannedc + colspan
		end
	end

	-- Then compute equal shares for expanded cols/rows


	local ix1, iy1, ix2, iy2 = self:InternalBounds()
	local expandSpaceX, expandSpaceY = ix2-ix1, iy2-iy1 -- the space available for expanding
	local expandNumX, expandNumY = 0, 0 -- the number of expanders per dimension

	for c=1, self:ColCount() do
		local col = self._cols[c]

		if col:GetExpanded() then
			expandNumX = expandNumX + 1
		else
			expandSpaceX = expandSpaceX - col:GetSize()
		end
	end
	for r=1, self:RowCount() do
		local row = self._rows[r]

		if row:GetExpanded() then
			expandNumY = expandNumY + 1
		else
			expandSpaceY = expandSpaceY - row:GetSize()
		end
	end

	if expandNumX > 0 then
		local expandSpacePer = expandSpaceX / expandNumX

		for c=1, self:ColCount() do
			local col = self._cols[c]

			if col:GetExpanded() then
				col:SetSize(expandSpacePer)
			end
		end
	end
	if expandNumY > 0 then
		local expandSpacePer = expandSpaceY / expandNumY

		for r=1, self:RowCount() do
			local row = self._rows[r]

			if row:GetExpanded() then
				row:SetSize(expandSpacePer)
			end
		end
	end
end

-- Returns bounds decreased by paddings
function PANEL:InternalBounds()
	local x1, y1, x2, y2 = 0, 0, self:GetWide(), self:GetTall()

	x1 = x1 + (self._internalCell:GetPaddingLeft() or 0)
	y1 = y1 + (self._internalCell:GetPaddingTop() or 0)

	x2 = x2 - (self._internalCell:GetPaddingRight() or 0)
	y2 = y2 - (self._internalCell:GetPaddingBottom() or 0)

	return x1, y1, x2, y2
end

-- Compute the size of the logical table
function PANEL:ComputeLogicalSize()
	local logicalWidth, logicalHeight = 0, 0
	for c=1, self:ColCount() do
		logicalWidth = logicalWidth + self:GetCol(c):GetSize()
	end
	for r=1, self:RowCount() do
		logicalHeight = logicalHeight + self:GetRow(r):GetSize()
	end
	return logicalWidth, logicalHeight
end

function PANEL:ComputeLogicalXY()
	local ix, iy, ix2, iy2 = self:InternalBounds()
	local logicalWidth, logicalHeight = self:ComputeLogicalSize()

	local logicalAlignX, logicalAlignY = self._internalCell:GetAlignmentFractions()
	local logicalMidX, logicalMidY = Lerp(logicalAlignX, ix, ix2), Lerp(logicalAlignY, iy, iy2)
	local xStart, yStart = math.Clamp(logicalMidX-logicalWidth/2, ix, ix2-logicalWidth),
						   math.Clamp(logicalMidY-logicalHeight/2, iy, iy2-logicalHeight)

	return xStart, yStart
end

-- Note: colspanned cells are visited once no matter how large the colspan is
function PANEL:ForEachCell(eachCell, after)
	local param = {} -- save some memory

	local ix, iy, ix2, iy2 = self:InternalBounds()
	local logicalWidth, logicalHeight = self:ComputeLogicalSize()
	local xStart, yStart = self:ComputeLogicalXY()

	param.ix, param.iy, param.ix2, param.iy2 = ix, iy, ix2, iy2
	param.logicalWidth = logicalWidth
	param.logicalHeight = logicalHeight
	param.xStart = xStart
	param.yStart = yStart

	local y = 0
	for r=1, self:RowCount() do
		local row = self._rows[r]
		local rowSize = row:GetSize()

		param.row = row
		param.rowSize = rowSize

		y = y + (row:GetMarginTop() or 0)
		param.y = y

		local rowcols = self._grid[r]

		local x = 0

		-- c is the col index in CURRENT row only
		-- spannedc is c that accounts for colspans and can be used for global columns
		local spannedc = 1
		for c=1, #rowcols do
			param.x = x

			local cell = self._grid[r][c]
			local comp = cell:GetComponent()
			param.cell, param.comp = cell, comp

			local colspan = (cell:GetColspan() or 1)
			param.colspan = colspan

			local colSize = 0
			local cellCol = 0
			while cellCol < colspan do
				local col = self:GetCol(spannedc + cellCol)
				if col then
					colSize = colSize + col:GetSize()
				end

				cellCol = cellCol + 1
			end
			spannedc = spannedc + cellCol

			param.colSize = colSize

			-- The absolute cell corner values
			local cellx, celly, cellw, cellh = xStart + x, yStart + y, colSize, rowSize
			param.cellx, param.celly, param.cellw, param.cellh = cellx, celly, cellw, cellh

			-- The internal (affected by padding) cell values
			local icellx1, icelly1 = cellx + (cell:GetPaddingLeft() or 0), celly + (cell:GetPaddingTop() or 0)
			param.icellx1, param.icelly1 = icellx1, icelly1
			local icellx2, icelly2 = cellx + cellw - (cell:GetPaddingRight() or 0), celly + cellh - (cell:GetPaddingBottom() or 0)
			param.icellx2, param.icelly2 = icellx2, icelly2

			local compw, comph = comp:GetWide(), comp:GetTall()
			if cell:GetFilledX() then
				compw = (icellx2 - icellx1)
			end
			if cell:GetFilledY() then
				comph = (icelly2 - icelly1)
			end
			param.compW, param.compH = compw, comph

			-- Map normalized alignment values to internal cell's coordinates
			local alignx, aligny = cell:GetAlignmentFractions()
			local midX, midY = Lerp(alignx, icellx1, icellx2), Lerp(aligny, icelly1, icelly2)
			param.midX, param.midY = midX, midY

			-- Clamp mid values.
			-- If this part is skipped, components will "overflow" by 50%, because alignx/aligny
			-- are normalized scalar values for comp's middle position, not edge position
			local compx, compy = math.Clamp(midX-compw/2, icellx1, icellx2-compw), math.Clamp(midY-comph/2, icelly1, icelly2-comph)
			param.compX, param.compY = compx, compy

			if eachCell then
				eachCell(param)
			end

			x = x + colSize
		end

		y = y + rowSize + (row:GetMarginBottom() or 0)
	end

	if after then
		after(param)
	end
end

function PANEL:PerformLayout()
	self:ComputeSizes()

	self:ForEachCell(function(data)
		data.comp:SetPos(data.compX, data.compY)
		data.comp:SetSize(data.compW, data.compH)
	end)
end

function PANEL:PaintOver()
	if not self:GetDebugMode() then return end

	self:ForEachCell(function(data)
		-- Draw component
		surface.SetDrawColor(0, 255, 0)
		surface.DrawOutlinedRect(data.compX, data.compY, data.compW, data.compH)

		-- Draw inner cell
		surface.SetDrawColor(0, 0, 255)
		surface.DrawOutlinedRect(data.icellx1, data.icelly1, data.icellx2-data.icellx1, data.icelly2-data.icelly1)

		-- Draw cell
		surface.SetDrawColor(255, 0, 0)
		surface.DrawOutlinedRect(data.cellx, data.celly, data.cellw, data.cellh)
	end, function(data)
		-- Draw logical table
		surface.SetDrawColor(255, 127, 0)
		surface.DrawOutlinedRect(data.xStart, data.yStart, data.logicalWidth, data.logicalHeight)

		-- Draw internal cell
		surface.SetDrawColor(0, 127, 255)
		surface.DrawOutlinedRect(data.ix, data.iy, data.ix2-data.ix, data.iy2-data.iy)
	end)
end

vgui.Register("NSTable", PANEL, "Panel")


-----------------------------------------------------

local function BuildMesh()
	local obj = Mesh()

	local verts = {}

	local CHIP_WIDTH = 1
	local CHIP_HEIGHT = 0.13

	local CIRCLE_POINTS = 16
	local RADS_PER_POINT = math.pi * 2 / CIRCLE_POINTS

	for i=1, CIRCLE_POINTS do
		-- Top plane
		local rad0, rad1 = RADS_PER_POINT * i, RADS_PER_POINT * (i + 1)
		local rad0x, rad0y = math.cos(rad0), math.sin(rad0)
		local rad1x, rad1y = math.cos(rad1), math.sin(rad1)

		local u0, v0 = rad0x * 0.5 + 0.5, rad0y * 0.5 + 0.5
		local u1, v1 = rad1x * 0.5 + 0.5, rad1y * 0.5 + 0.5

		table.insert(verts, { pos = Vector(rad0x*CHIP_WIDTH, rad0y*CHIP_WIDTH, CHIP_HEIGHT), normal = Vector(0, 0, 1), u = u0, v = v0 })
		table.insert(verts, { pos = Vector(0, 0, CHIP_HEIGHT), 								 normal = Vector(0, 0, 1), u = 0.5, v = 0.5 })
		table.insert(verts, { pos = Vector(rad1x*CHIP_WIDTH, rad1y*CHIP_WIDTH, CHIP_HEIGHT), normal = Vector(0, 0, 1), u = u1, v = v1 })

		-- Side plane
		local pos00 = Vector(rad0x*CHIP_WIDTH, rad0y*CHIP_WIDTH, 0)
		local pos01 = Vector(rad0x*CHIP_WIDTH, rad0y*CHIP_WIDTH, CHIP_HEIGHT)
		local pos11 = Vector(rad1x*CHIP_WIDTH, rad1y*CHIP_WIDTH, CHIP_HEIGHT)
		local pos10 = Vector(rad1x*CHIP_WIDTH, rad1y*CHIP_WIDTH, 0)

		local normal0 = Vector(rad0x, rad0y, 0):GetNormalized()
		local normal1 = Vector(rad1x, rad1y, 0):GetNormalized()

		table.insert(verts, { pos = pos00, normal = normal0, u = u0, v = v0 })
		table.insert(verts, { pos = pos01, normal = normal0, u = u0, v = v0 })
		table.insert(verts, { pos = pos11, normal = normal1, u = u1, v = v1 })

		table.insert(verts, { pos = pos00, normal = normal0, u = u0, v = v0 })
		table.insert(verts, { pos = pos11, normal = normal1, u = u1, v = v1 })
		table.insert(verts, { pos = pos10, normal = normal1, u = u1, v = v1 })
	end

	obj:BuildFromTriangles(verts)

	return obj
end

-- Chip types in descending order
-- credits to jlewis8 in Stanford for initial textures.
local chip_types = {
	{ name = "brown", value = 5000, fg_color = Color(150, 75, 0) },
	{ name = "lightBlue", value = 2000, fg_color = Color(107, 185, 240) },
	{ name = "yellow", value = 1000, fg_color = Color(245, 171, 53) },
	{ name = "purple", value = 500, fg_color = Color(142, 68, 173) },
	{ name = "pink", value = 250, fg_color = Color(224, 130, 131) },
	{ name = "black", value = 100, fg_color = Color(30, 30, 30) },
	{ name = "green", value = 25, fg_color = Color(0, 128, 0) },
	{ name = "blue", value = 10, fg_color = Color(0, 0, 224) },
	{ name = "red", value = 5, fg_color = Color(192, 0, 0) },
	{ name = "white", value = 1, fg_color = Color(255, 255, 255), bg_color = Color(0, 0, 224) },
}

local chip_fg_texture
CasinoKit.getRemoteMaterial("http://i.imgur.com/HHVCh5P.png", function(mat)
	chip_fg_texture = mat:GetTexture("$basetexture")
end, true)

local cvar_altchipdrawmode = CreateConVar("casinokit_altchipdrawmode", "1", FCVAR_ARCHIVE)

local GOLDEN_RATIO = 1.618033988

local obj
local function DrawChipType(chip, pos, count)
	if count <= 0 then return end
	if not chip_fg_texture then return end

	if not chip.bg_mat then
		local bgColor = chip.bg_color or Color(255, 255, 255)
		chip.bg_mat = CreateMaterial("CasinoKit_ChipMat_bg_" .. chip.name .. "_" .. os.time(), "VertexLitGeneric", {
			["$basetexture"] = "color/white",
			["$color"] = "{" .. bgColor.r .. " " .. bgColor.g .. " " .. bgColor.b .. "}"
		})
	end
	if not chip.fg_mat then
		local fgColor = chip.fg_color
		chip.fg_mat = CreateMaterial("CasinoKit_ChipMat_fg_" .. chip.name .. "_" .. os.time(), "VertexLitGeneric", {
			["$translucent"] = "1",
			["$color"] = "{" .. fgColor.r .. " " .. fgColor.g .. " " .. fgColor.b .. "}"
		})
		chip.fg_mat:SetTexture("$basetexture", chip_fg_texture)
	end

	if not obj then obj = BuildMesh() end

	local mat = Matrix()
	mat:Translate(pos)

	if cvar_altchipdrawmode:GetBool() then
		for i=1, count do

			local niceValue = i * GOLDEN_RATIO

			mat:Translate(Vector(((niceValue % 1) - 0.5) * 0.15, (((niceValue + 0.2) % 1) - 0.5) * 0.15, 0.135))

			local yaw = (niceValue) % 1
			mat:Rotate(Angle(0, yaw*360, 0))

			cam.PushModelMatrix(mat)

			render.SetMaterial(chip.bg_mat)
			obj:Draw()

			render.SetMaterial(chip.fg_mat)
			obj:Draw()

			cam.PopModelMatrix()
		end
	else
		mat:Scale(Vector(1, 1, count))
		cam.PushModelMatrix(mat)

		render.SetMaterial(chip.bg_mat)
		obj:Draw()

		render.SetMaterial(chip.fg_mat)
		obj:Draw()

		cam.PopModelMatrix()
	end
end

local MAX_DISPLAYED_CHIPS = 1e5

local CHIP_OBB_SIZE = 2.5
local CHIP_OBB_MIN = Vector(-CHIP_OBB_SIZE, -CHIP_OBB_SIZE, -CHIP_OBB_SIZE)
local CHIP_OBB_MAX = Vector(CHIP_OBB_SIZE, CHIP_OBB_SIZE, CHIP_OBB_SIZE)

local L = CasinoKit.L

function CasinoKit.drawChipStack(chipCount, pos, ang, displayValueOnHover)
	displayValueOnHover = displayValueOnHover and not not util.IntersectRayWithOBB(LocalPlayer():EyePos(), gui.ScreenToVector(ScrW() / 2, ScrH() / 2) * 500, pos, ang, CHIP_OBB_MIN, CHIP_OBB_MAX)

	local chipsToDraw = math.min(chipCount, MAX_DISPLAYED_CHIPS)

	local chipRenderPos = pos + ang:Right() * -2
	local renderi = 0
	for i,chip in pairs(chip_types) do
		local chipCount = math.floor(chipsToDraw / chip.value)
		chipsToDraw = chipsToDraw - chipCount * chip.value

		if chipCount > 0 then
			local revi = renderi
			renderi = renderi + 1

			local x = revi % 3
			local y = math.floor(revi / 3)

			DrawChipType(chip, chipRenderPos + ang:Right() * x * 2.1 + ang:Forward() * y * 2, chipCount)
		end
	end

	if displayValueOnHover then
		local lang = Angle(0, (pos - LocalPlayer():EyePos()):Angle().y - 90, 0)
		lang:RotateAroundAxis(lang:Forward(), 20)

		cam.Start3D2D(pos + lang:Up() * 0.5, lang, 0.035)
		cam.IgnoreZ(true)
		draw.SimpleTextOutlined(L("#game_chipcount", chipCount), "DermaLarge", 0, -50, nil, TEXT_ALIGN_CENTER, nil, 2, Color(0, 0, 0))
		cam.IgnoreZ(false)
		cam.End3D2D()
	end
end

function CasinoKit.drawChipSingleStack(chipCount, pos, ang)
	local chipsToDraw = math.min(chipCount, MAX_DISPLAYED_CHIPS)

	local chipRenderPos = pos
	local renderi = 0

	local chipsDrawn = 0

	for i,chip in pairs(chip_types) do
		local chipCount = math.floor(chipsToDraw / chip.value)
		chipsToDraw = chipsToDraw - chipCount * chip.value

		if chipCount > 0 then
			local revi = renderi
			renderi = renderi + 1

			local x = revi % 3
			local y = math.floor(revi / 3)

			DrawChipType(chip, chipRenderPos, chipCount)
			chipRenderPos.z = chipRenderPos.z + chipCount * 0.135

			chipsDrawn = chipsDrawn + chipCount
		end
	end

	return chipsDrawn
end
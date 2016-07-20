
-----------------------------------------------------
local function BuildMesh()
	local obj = Mesh()

	local verts = {}

	local height = 1
	local s = 1

	local one_u = 1/6

	table.insert(verts, { pos = Vector(-s, -s, -height), normal = Vector(0.0, 0.0,  1.0), u = one_u*3, v = 0.0 })
	table.insert(verts, { pos = Vector( s, -s,  height), normal = Vector(0.0, 0.0,  1.0), u = one_u*4, v = 1.0 })
	table.insert(verts, { pos = Vector( s, -s, -height), normal = Vector(0.0, 0.0,  1.0), u = one_u*4, v = 0.0 })
	table.insert(verts, { pos = Vector( s, -s,  height), normal = Vector(0.0, 0.0,  1.0), u = one_u*4, v = 1.0 })
	table.insert(verts, { pos = Vector(-s, -s, -height), normal = Vector(0.0, 0.0,  1.0), u = one_u*3, v = 0.0 })
	table.insert(verts, { pos = Vector(-s, -s,  height), normal = Vector(0.0, 0.0,  1.0), u = one_u*3, v = 1.0 })

	table.insert(verts, { pos = Vector(-s,  s, -height), normal = Vector(0.0, 0.0, -1.0), u = one_u*2, v = 0.0 })
	table.insert(verts, { pos = Vector( s,  s, -height), normal = Vector(0.0, 0.0, -1.0), u = one_u*3, v = 0.0 })
	table.insert(verts, { pos = Vector( s,  s,  height), normal = Vector(0.0, 0.0, -1.0), u = one_u*3, v = 1.0 })
	table.insert(verts, { pos = Vector( s,  s,  height), normal = Vector(0.0, 0.0, -1.0), u = one_u*3, v = 1.0 })
	table.insert(verts, { pos = Vector(-s,  s,  height), normal = Vector(0.0, 0.0, -1.0), u = one_u*2, v = 1.0 })
	table.insert(verts, { pos = Vector(-s,  s, -height), normal = Vector(0.0, 0.0, -1.0), u = one_u*2, v = 0.0 })

	table.insert(verts, { pos = Vector(-s,  s,  height), normal = Vector(1.0, 0.0,  0.0), u = one_u*2, v = 0.0 })
	table.insert(verts, { pos = Vector(-s, -s,  height), normal = Vector(1.0, 0.0,  0.0), u = one_u*2, v = 1.0 })
	table.insert(verts, { pos = Vector(-s, -s, -height), normal = Vector(1.0, 0.0,  0.0), u = one_u*1, v = 1.0 })
	table.insert(verts, { pos = Vector(-s, -s, -height), normal = Vector(1.0, 0.0,  0.0), u = one_u*1, v = 1.0 })
	table.insert(verts, { pos = Vector(-s,  s, -height), normal = Vector(1.0, 0.0,  0.0), u = one_u*1, v = 0.0 })
	table.insert(verts, { pos = Vector(-s,  s,  height), normal = Vector(1.0, 0.0,  0.0), u = one_u*2, v = 0.0 })

	table.insert(verts, { pos = Vector( s,  s,  height), normal = Vector(1.0, 0.0,  0.0), u = one_u*5, v = 0.0 })
	table.insert(verts, { pos = Vector( s, -s, -height), normal = Vector(1.0, 0.0,  0.0), u = one_u*4, v = 1.0 })
	table.insert(verts, { pos = Vector( s, -s,  height), normal = Vector(1.0, 0.0,  0.0), u = one_u*5, v = 1.0 })
	table.insert(verts, { pos = Vector( s,  s, -height), normal = Vector(1.0, 0.0,  0.0), u = one_u*4, v = 0.0 })
	table.insert(verts, { pos = Vector( s, -s, -height), normal = Vector(1.0, 0.0,  0.0), u = one_u*4, v = 1.0 })
	table.insert(verts, { pos = Vector( s,  s,  height), normal = Vector(1.0, 0.0,  0.0), u = one_u*5, v = 0.0 })

	table.insert(verts, { pos = Vector(-s, -s, -height), normal = Vector(0.0, -1.0,  0.0), u = one_u*0, v = 1.0 })
	table.insert(verts, { pos = Vector( s, -s, -height), normal = Vector(0.0, -1.0,  0.0), u = one_u*1, v = 1.0 })
	table.insert(verts, { pos = Vector( s,  s, -height), normal = Vector(0.0, -1.0,  0.0), u = one_u*1, v = 0.0 })
	table.insert(verts, { pos = Vector( s,  s, -height), normal = Vector(0.0, -1.0,  0.0), u = one_u*1, v = 0.0 })
	table.insert(verts, { pos = Vector(-s,  s, -height), normal = Vector(0.0, -1.0,  0.0), u = one_u*0, v = 0.0 })
	table.insert(verts, { pos = Vector(-s, -s, -height), normal = Vector(0.0, -1.0,  0.0), u = one_u*0, v = 1.0 })

	table.insert(verts, { pos = Vector(-s, -s,  height), normal = Vector(0.0,  1.0,  0.0), u = one_u*5, v = 1.0 })
	table.insert(verts, { pos = Vector( s,  s,  height), normal = Vector(0.0,  1.0,  0.0), u = one_u*6, v = 0.0 })
	table.insert(verts, { pos = Vector( s, -s,  height), normal = Vector(0.0,  1.0,  0.0), u = one_u*6, v = 1.0 })
	table.insert(verts, { pos = Vector( s,  s,  height), normal = Vector(0.0,  1.0,  0.0), u = one_u*6, v = 0.0 })
	table.insert(verts, { pos = Vector(-s, -s,  height), normal = Vector(0.0,  1.0,  0.0), u = one_u*5, v = 1.0 })
	table.insert(verts, { pos = Vector(-s,  s,  height), normal = Vector(0.0,  1.0,  0.0), u = one_u*5, v = 0.0 })

	obj:BuildFromTriangles(verts)

	return obj
end

local obj = BuildMesh()

local die_mat
CasinoKit.getRemoteMaterial("http://i.imgur.com/WBPUiVg.png", function(mat)
	local die_tex = mat:GetTexture("$basetexture")
	die_mat = CreateMaterial("CasinoKit_DieMat_" .. os.time(), "UnlitGeneric", {})
	die_mat:SetTexture("$basetexture", die_tex)
end, true)

function CasinoKit.drawDie(pos, ang)
	local mat = Matrix()
	mat:Translate(pos)
	mat:Rotate(ang)
	mat:Scale(Vector(1, 1, 1))

	cam.PushModelMatrix(mat)

	render.SetMaterial(die_mat)
	obj:Draw()

	cam.PopModelMatrix()
end
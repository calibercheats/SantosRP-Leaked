
-----------------------------------------------------
AddCSLuaFile()

ENT.CasinoKitPersistable = true
ENT.Base 			= "casinokit_npc"
local BaseClass = baseclass.Get("casinokit_npc")

ENT.Spawnable = true
ENT.Category = "Casino Kit"
ENT.PrintName = "Chip Exchange Npc"

ENT.Model = "models/alyx.mdl"

function ENT:DrawTranslucent()
	local ang = LocalPlayer():EyeAngles()
	ang:RotateAroundAxis(ang:Right(), 90)
	ang:RotateAroundAxis(ang:Up(), -90)
	cam.Start3D2D(self:GetPos() + Vector(0, 0, 80), ang, 0.2)
	draw.SimpleText(CasinoKit.L("#chipdealer_exchangetab"), "DermaLarge", 0, 0, Color(255, 255, 255), TEXT_ALIGN_CENTER)
	cam.End3D2D()
end

if CLIENT then
	function ENT:Think()
		BaseClass.Think(self)
		self:LookAtClosestPlayer()
	end
end

function ENT:Use(ply)
	ply:ConCommand("casinokit_chipexchange_npc " .. self:EntIndex())
end

function ENT:RunBehaviour()
	self:StartActivity(ACT_IDLE)
	while true do
		coroutine.wait(1e7)
		coroutine.yield()
	end
end


-----------------------------------------------------
// Copyright © 2012-2016 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: steam - http://steamcommunity.com/id/freemmaann, email - freemmaann@gmail.com or skype - comman6.

include('shared.lua')

ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:Initialize() end

local Mat_Square = Material("vcmod/square")

function ENT:Draw()
	local NPC = self:GetNWEntity("VC_NPC")
	if IsValid(NPC) and VC then
	render.SetMaterial(Mat_Square) local mins = self:OBBMins() local maxs = self:OBBMaxs() local height = 100

		local p1,p2,p3,p4 = Vector(0,0,0),Vector(0,0,0),Vector(0,0,0),Vector(0,0,0)
		local right = self:GetRight()*maxs.y
		local forw = self:GetForward()*maxs.x
		p1 = self:GetPos()-right+forw
		p2 = self:GetPos()+right+forw
		p3 = self:GetPos()+right-forw
		p4 = self:GetPos()-right-forw
		render.DrawQuad(p1+self:GetRight()*20,p2,p3,p4+self:GetRight()*20, Color(0,30,100,255))
		render.DrawQuad(p1+self:GetRight()*20,p2-right*2,p3-right*2,p4+self:GetRight()*20, Color(30,100,100,255))

		render.SetMaterial(VC.Material.Beam) render.DrawBeam(self:GetPos()+self:GetUp(), NPC:GetPos()+NPC:GetUp()*50, 5, 1, 1, Color(0, 30, 100, 255))

	render.DrawWireframeBox(self:GetPos(), self:GetAngles(), mins+Vector(0,0,height), maxs+Vector(0,0,-1.75), VC.DM_Menu_Color_Blue, true)
	end
end
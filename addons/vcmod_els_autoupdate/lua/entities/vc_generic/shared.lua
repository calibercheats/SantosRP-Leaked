
-----------------------------------------------------
// Copyright © 2012-2016 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: email - freemmaann@gmail.com or skype - comman6.
AddCSLuaFile("shared.lua")

ENT.Base 		= "base_anim"
ENT.Type 		= "anim"
ENT.PrintName	= "VC Generic"
ENT.Author		= "freemmaann"

function ENT:Initialize() if SERVER then self:SetModel("models/combine_helicopter/helicopter_bomb01.mdl") self:DrawShadow(false) self:SetNoDraw(true) end end

if SERVER then function ENT:OnRemove() if self.VC_Sound then self.VC_Sound:Stop() end end end
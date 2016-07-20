
-----------------------------------------------------
--[[
	Name: weapon_shovel.lua
	For: SantosRP
	By: Ultra
]]--

if SERVER then
	AddCSLuaFile()
end

SWEP.PrintName		= "Shovel"
SWEP.Author			= "Ultra"
SWEP.Instructions	= "Left click on road debris to shovel them off the road."
SWEP.Base 			= "weapon_sck_base"
SWEP.ViewModel 		= "models/weapons/c_pistol.mdl"
SWEP.WorldModel 	= "models/weapons/w_pistol.mdl"
SWEP.ViewModelFOV	= 55

SWEP.Spawnable		= false
SWEP.Slot 			= 5
SWEP.UseHands 		= true

SWEP.HoldType 		= "slam"

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"
SWEP.ShowWorldModel 		= false
SWEP.ShowViewModel 			= false

SWEP.WElements = {
	["element_name"] = { type = "Model", model = "models/props_junk/shovel01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.652, 1.626, 0), angle = Angle(0, 0, 0), size = Vector(0.939, 0.939, 0.939), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/props_junk/shovel01a.mdl", bone = "ValveBiped.square", rel = "", pos = Vector(-0.222, 5.439, -1.846), angle = Angle(-49.628, -8.277, 76.766), size = Vector(0.577, 0.577, 0.577), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

function SWEP:PrimaryAttack()
	self:SetNextPrimaryFire( CurTime() +1 )

	if SERVER then
		local ent = util.TraceLine{
			start = self.Owner:GetShootPos(),
			endpos = self.Owner:GetShootPos() +self.Owner:GetAimVector() *100,
			filter = { self, self.Owner }
		}.Entity

		if not IsValid( ent ) or not ent.ShovelHit then return end
		ent:ShovelHit( self )
		self:SetNextPrimaryFire( CurTime() +1.75 )
	end
end

function SWEP:SecondaryAttack()
end

function SWEP:OnRoadDebrisClear( entDebris )
	--stuff
end

function SWEP:FireAnimationEvent( _, _, intEvent )
	if intEvent == 5001 or intEvent == 6001 then return true end
end

local box_w = 200
local box_h = 40
function SWEP:DrawHUD()
end
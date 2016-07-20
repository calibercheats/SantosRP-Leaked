
-----------------------------------------------------
AddCSLuaFile()

local radio_model = Model( "models/gspeak/funktronics.mdl" )
SWEP.Spawnable = false
SWEP.PrintName = "Government Radio"
SWEP.Author = "Thendon.exe & Kuro"
SWEP.Instructions = "Left Click - Turn ON/OFF"
SWEP.Purpose = "Talk!"
SWEP.ViewModel = Model( "models/gspeak/vfunktronics.mdl" )
SWEP.ViewModelFOV = 56
SWEP.WorldModel = radio_model
SWEP.BounceWeaponIcon = false
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

SWEP.Primary.Ammo = "none"
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.Secondary.Ammo	= "none"
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = true

SWEP.UseHands = false
SWEP.HoldType = "slam"

SWEP.Kind = WEAPON_EQUIP2
SWEP.AutoSpawnable = false
SWEP.CanBuy = { ROLE_DETECTIVE }
SWEP.InLoadoutFor = { ROLE_DETECTIVE }
SWEP.LimitedStock = false
SWEP.EquipMenuData = {
	type = "item_weapon",
	name = "Government Radio",
	desc = "Talk!"
}
SWEP.Icon = "VGUI/ttt/radio_d"

function SWEP:IsEquipment()
	return WEPS.IsEquipment(self)
end

function SWEP:DampenDrop()
   local phys = self:GetPhysicsObject()
   if IsValid(phys) then
      phys:SetVelocityInstantaneous(Vector(0,0,-75) + phys:GetVelocity() * 0.001)
      phys:AddAngleVelocity(phys:GetAngleVelocity() * -0.99)
   end
end

function SWEP:Initialize()
	//Own Changeable Variables
	self.online = false --Online when picked up (default = true)
	self.show_hearable = true --Show the list of connected Radio in HUD (default = true)
	self.freq = 1903 --Default freqeunz (devide 10 || default = 900)
	self.locked_freq = true --Should the frequency be locked? if true you don't have to put values into freq min and max
	self.freq_min = 800 --Min frequenz (default = 800)
	self.freq_max = 1200 --Max frequenz (default = 900)
	self.draw_model = false
	self.animate = true
	self.silent = false

	//Own Locked Variables
	self.last_think = 0
	self.connected_radios = {}
	self.deployed = false

	self:SetWeaponHoldType( self.HoldType )

	if SERVER then
		self.ent = ents.Create( "radio_ent" )
		self.ent:SetModel( radio_model )
		self.ent:SetPos( self:GetPos() )
		self.ent:SetParent( self )
		self.ent:SetFreq( self.freq )
		self.ent:Spawn()
		self.ent:SetOnline(self.online)
		self.ent:SetFreq(self.freq)
		self.ent:SetHearable(self.show_hearable)

		self:DeleteOnRemove( self.ent )
	end
end

include( "gspeak/sh_def_swep.lua" )


-----------------------------------------------------
AddCSLuaFile()

local radio_model = Model( "models/gspeak/funktronics.mdl" )
SWEP.Spawnable = false
SWEP.PrintName = "Traitor Radio"
SWEP.Author = "Thendon.exe & Kuro"
SWEP.Instructions = "Left Click - Turn ON/OFF\nRight Click - Open frequency UI"
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
SWEP.HoldType = "normal"

SWEP.Kind = WEAPON_ROLE
SWEP.AutoSpawnable = false
SWEP.CanBuy = { ROLE_TRAITOR }
SWEP.InLoadoutFor = { ROLE_TRAITOR }
SWEP.LimitedStock = false
SWEP.EquipMenuData = {
	type = "item_weapon",
	name = "Traitor Radio",
	desc = "Talk!"
}
SWEP.Icon = "VGUI/ttt/radio_t"

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
	self.online = true --Online when picked up (default = true)
	self.show_hearable = false --Show the list of connected Radio in HUD (default = true)
	self.freq = 275 --Default freqeunz (devide 10 || default = 900)
	self.locked_freq = true --Should the frequency be locked? if true you don't have to put values into freq min and max
	self.freq_min = 800 --Min frequenz (default = 800)
	self.freq_max = 1200 --Max frequenz (default = 900)
	self.draw_model = false
	self.animate = false
	self.silent = true

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

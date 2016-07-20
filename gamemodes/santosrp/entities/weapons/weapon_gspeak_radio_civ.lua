
-----------------------------------------------------
if SERVER then
	AddCSLuaFile()
end

local radio_model = Model( "models/gspeak/funktronics.mdl" )
SWEP.Spawnable = true
SWEP.PrintName = "Radio"
SWEP.Author = "Thendon.exe & Kuro"
SWEP.Instructions = "Left Click - Turn ON/OFF\nRight Click - Open frequency UI"
SWEP.Purpose = "Talk!"
SWEP.ViewModel = Model( "models/gspeak/vfunktronics.mdl" )
SWEP.ViewModelFOV = 56
SWEP.WorldModel = radio_model
SWEP.BounceWeaponIcon = false
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false
SWEP.Slot = 1
SWEP.SlotPos = 2
if CLIENT then
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/HUD/radio_ems")
end

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

function SWEP:Initialize()
	//Own Changeable Variables
	self.online = false --Online when picked up (default = true)
	self.show_hearable = true --Show the list of connected Radio in HUD (default = true)
	self.freq = 130 --Default freqeunz (devide 10 || default = 900)
	self.locked_freq = false --Should the frequency be locked? if true you don't have to put values into freq min and max
	self.freq_min = 130 --Min frequenz (default = 800)
	self.freq_max = 1300 --Max frequenz (default = 900)
	self.draw_model = true
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

--include( "gspeak/sh_def_swep.lua" )

function SWEP:OwnerChanged()
	if SERVER then
		self.ent:SetOwner( self:GetOwner() )
		self.ent:SetSpeaker( self:GetOwner() )
	end
	self:SetWeaponHoldType( self.HoldType )
end

function SWEP:Holster( wep )
	self.deployed = false
	if SERVER and gspeak.settings["use_radio_key"] == "false" then
		self.ent:SetSending( false )
		self.ent:EmitSound("radio_start_com")
	end
	return true
end

function SWEP:Deploy( wep )
	self.deployed = true
	if SERVER and gspeak.settings["use_radio_key"] == "false"  then
		self.ent:EmitSound("radio_start_com")
		self.ent:SetSending( true )
	end
	return true
end

function SWEP:DrawWorldModel()
	if !IsValid(self.Owner) then
		self:DrawModel()
		return
	end
	self.deployed = true
end

function SWEP:PostDrawViewModel(vm, weapon, ply)
	local vm_pos = vm:GetPos()
	local ang = vm:GetAngles()
	local x = 0
	local y = 0

	local offset = ang:Forward() * 6.44 + ang:Right() * 2.14 + ang:Up() * (-1.3)
	local white = Color(255,255,255,255)
	ang:RotateAroundAxis(ang:Forward(), 90)
	ang:RotateAroundAxis(ang:Right(), 90)
	ang:RotateAroundAxis(ang:Up(), 0)
	cam.Start3D2D(vm_pos + offset, ang+Angle(-0.5,0,0), 0.01)
	local alpha = 255
	if !self.online then alpha = 100 end
	surface.SetDrawColor(alpha,alpha,alpha,255)
	surface.SetMaterial(gspeak_radio_back)
	surface.DrawTexturedRect(x-15,y-37,170,170)
	if self.online then
		draw.DrawText( "Frequency", "BudgetLabel", x, y, white, TEXT_ALIGN_LEFT )
		draw.DrawText( tostring(self.freq/10), "BudgetLabel", x+140, y, white, TEXT_ALIGN_RIGHT )
		y = y + 7
		if self.show_hearable then
			draw.DrawText( "--------------------", "BudgetLabel", x, y, white, TEXT_ALIGN_LEFT)
			y = y + 7
			for k, v in pairs(self.connected_radios) do
				if k == 7 then break end
                    if IsValid(Entity(v)) and string.match(Entity(v):GetClass(), "radio_ent*") and IsValid(Entity(v):GetSpeaker()) and Entity(v):GetSpeaker():IsPlayer() then
					draw.DrawText( string.sub(Entity(v):GetSpeaker():GetName(),1,14), "BudgetLabel", x, y, white, TEXT_ALIGN_LEFT )
					local status = "idl"
					if Entity(v):GetSpeaker().talking then status = "inc" end
					draw.DrawText( "| "..status, "BudgetLabel", x+140, y, white, TEXT_ALIGN_RIGHT )
					y = y + 10
				end
			end
		end
	end
	cam.End3D2D()
end

function SWEP:PrimaryAttack()
	local now = CurTime()
	if self:checkThink(now) then return end
	if self.online then
		self.online = false
		if SERVER and !self.silent then self.ent:EmitSound("radio_turnoff_s") end
	else
		self.online = true
		if SERVER and !self.silent then self.ent:EmitSound("radio_booting_s") end
	end
	if SERVER then self.ent:SetOnline(self.online) end

	self:SetNextPrimaryFire( now + 0.1 )
end

function SWEP:SecondaryAttack()
	local now = CurTime()
	if self:checkThink(now) then return end
	if self.locked_freq == true then return end
	if CLIENT then self:open_settings() end

	self:SetNextSecondaryFire( now + 0.1 )
end

function SWEP:checkThink( now )
	if self.last_think < now - 0.2 then
		self.last_think = now
		return false
	end
	return true
end

function SWEP:ShouldDropOnDie()
	return true
end

function SWEP:OnDrop()
	self:OwnerChanged()
end

function SWEP:Equip()
	self:OwnerChanged()
end

function SWEP:open_settings()
	local DermaPanel = vgui.Create( "DFrame" )
	DermaPanel:Center()
	DermaPanel:SetSize( 500, 100 )
	DermaPanel:SetTitle( "Radio Config" )
	DermaPanel:SetDraggable( true )
	DermaPanel:MakePopup()
	DermaPanel.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 75, 75, 75, 255 ) )
	end

	local last_try = 0
	local last_val
	local DSlider = vgui.Create( "DNumSlider", DermaPanel )
	DSlider:SetPos( 10, 50 )
	DSlider:SetSize( 500, 25 )
	DSlider:SetText( "Frequenz" )
	DSlider:SetMin( self.freq_min/10 )
	DSlider:SetMax( self.freq_max/10 )
	DSlider:SetDecimals( 1 )
	DSlider:SetValue( self.freq/10 )
	DSlider.Think = function( panel )
		local panel_value = panel:GetValue()
		last_try = last_try or 0
		last_value = last_value or panel_value
		if last_value != panel_value then
			local now = CurTime()
			if last_try < now - 0.1 then
				local new_value = math.floor( (panel_value * 10) + 0.5 )
				net.Start("radio_freq_change")
					net.WriteEntity( self )
					net.WriteBool( true ) --SWEP true ENT false
					net.WriteInt( new_value , 12 )
				net.SendToServer()
				self.freq = new_value
				last_value = panel_value
				last_try = now
			end
		end
	end

	DermaPanel:SetPos( ScrW()/2 - 250, ScrH()/2 - 50/2)
end

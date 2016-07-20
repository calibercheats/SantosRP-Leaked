
-----------------------------------------------------
AddCSLuaFile()

ENT.Base = "base_entity"
ENT.Type = "anim"
ENT.Author = "Thendon.exe"
ENT.AutomaticFrameAdvance = true
ENT.RenderGroup = RENDERGROUP_OPAQUE

function ENT:Initialize()
	self:DrawShadow( false )
	self.connected_radios = {}
	self.last_sound = 0
end

function ENT:Draw()
	if (self.Owner == LocalPlayer() and !LocalPlayer():ShouldDrawLocalPlayer()) or !self:GetParent().draw_model then return end

	self:DrawModel()

	local vm_pos = self:GetPos()
	local ang = self:GetAngles()
	local x = 0
	local y = 0

	local offset = ang:Forward() * 0.87 + ang:Right() * 1.46 + ang:Up() * (-3)
	local white = Color(255,255,255,255)
	ang:RotateAroundAxis(ang:Forward(), 90)
	ang:RotateAroundAxis(ang:Right(), -90)
	ang:RotateAroundAxis(ang:Up(), 0)
	cam.Start3D2D(vm_pos+offset, ang, 0.02)
	local alpha = 255
	if !self.online then alpha = 100 end
	surface.SetDrawColor(alpha,alpha,alpha,255)
	surface.SetMaterial(gspeak_radio_back)
	surface.DrawTexturedRect(x-15,y-37,170,170)
	if self.online then
		draw.DrawText( "Frequency", "BudgetLabel", x, y, white, TEXT_ALIGN_LEFT )
		draw.DrawText( tostring(self.freq/10), "BudgetLabel", x+140, y, white, TEXT_ALIGN_RIGHT )
		y = y + 7
		if self:GetHearable() then
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

function ENT:UpdateUI()
	if !IsValid(self:GetParent()) then return end
	self:GetParent().connected_radios = self.connected_radios
end

function ENT:Secret()
	if self.freq != 1337 or !self.online then
		if !self.secret then return end
		self.secret = false
		self:StopSound("radio_1337")
		return
	end
	if !self.secret then
		self.secret = true
		self:EmitSound("radio_1337")
	end
end

function ENT:Think()
	local own_online = self:GetOnline()
	local own_sending = self:GetSending()
	local parent = self:GetParent()
	if IsValid(self.Owner) then
		if CLIENT then
			if gspeak.settings["use_radio_key"] == "true" and LocalPlayer() == self.Owner then
				if !LocalPlayer():IsTyping() and input.IsKeyDown( gspeak.cl_settings["radio_key"] ) and own_online then
					if !own_sending and self:checkTime(0.1) then
						net.Start("radio_sending_change")
							net.WriteEntity( self )
							net.WriteBool( true )
						net.SendToServer()
					end
				elseif own_sending and self:checkTime(0.1) then
					net.Start("radio_sending_change")
						net.WriteEntity( self )
						net.WriteBool( false )
					net.SendToServer()
				end
			end

			if parent.animate and self.Owner:IsPlayer() and own_sending and !self.Owner.ChatGesture then
				if self.Owner.ChatStation then self.Owner.ChatStation = false end
				self.Owner.ChatGesture = true
			end

			local Size = Vector(1,1,1)
			local mat = Matrix()
			mat:Scale(Size)
			self:EnableMatrix('RenderMultiply', mat)
		end

		local attachment, MAngle, MPos
		if parent.deployed == true then
			attachment = self.Owner:LookupBone("ValveBiped.Bip01_R_Hand")

			MAngle = Angle(170, 150, 30)
			MPos = Vector(5, 2, -2.597)
		else
			attachment = self.Owner:LookupBone("ValveBiped.Bip01_Pelvis")

			MAngle = Angle(-90, 0, 10)
			MPos = Vector(8, 0, 0)
		end

		if attachment then
			local pos, ang = self.Owner:GetBonePosition(attachment)
			pos = pos + (ang:Forward() * MPos.x) + (ang:Up() * MPos.z) + (ang:Right() * MPos.y)
			ang:RotateAroundAxis(ang:Forward(), MAngle.p)
			ang:RotateAroundAxis(ang:Up(), MAngle.y)
			ang:RotateAroundAxis(ang:Right(), MAngle.r)

			self:SetPos(pos)
			self:SetAngles(ang)
		end
	else
		if IsValid(parent) then
			self:SetPos(parent:GetPos())
			self:SetAngles(parent:GetAngles())
		end
	end

	if CLIENT then
		if IsValid(self.Owner) and self.Owner == LocalPlayer() then
			self:AddHearables(LocalPlayer():GetForward())
			self:Secret()
		elseif gspeak.settings["radio_hearable"] == "true" then
			local distance, distance_max, radio_pos = gspeak:get_distances(self, 1)
			if distance < distance_max and ( gspeak:player_alive(LocalPlayer()) or gspeak.settings["dead_alive"] == "true" ) then
				self:AddHearables(radio_pos)
				self:Secret()
			end
		end

		local own_freq = self:GetFreq()
		if !self.last_freq or self.last_freq != own_freq or self.last_online != own_online  or self.last_sending != own_sending then
			self:Rescan(own_freq, own_online, own_sending)
		end
		self.last_sending = own_sending
		self.last_freq = own_freq
		self.last_online = own_online
	end
end

include("gspeak/sh_def_ent.lua")

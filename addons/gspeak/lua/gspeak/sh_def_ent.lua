function ENT:SetupDataTables()
	self:NetworkVar( "Int", 0, "Freq" )
	self:NetworkVar( "Bool", 0, "Sending" )
	self:NetworkVar( "Bool", 1, "Online" )
	self:NetworkVar( "Bool", 2, "Hearable" )
	self:NetworkVar( "Entity", 0, "Speaker" )
end

function ENT:RemoveRadio( radio_id )
	for k, v in pairs(self.connected_radios) do
		if v == radio_id then
			self:RemoveID( radio_id, k )
			return
		end
	 end
end

function ENT:RemoveID( radio_id, id )
	if gspeak.TS.connected then
		tslib.delPos( radio_id, true, self:EntIndex() )
	end
	table.remove(self.connected_radios, id)
	self:UpdateUI()
end

function ENT:AddRadio( radio_id )
	if radio_id == self:EntIndex() then	return end
	for k, v in pairs(self.connected_radios) do
		if v == radio_id then	return end
	end
	table.insert(self.connected_radios, radio_id)
	self:UpdateUI()
end

function ENT:Rescan(own_freq, own_online, own_sending)
	self.freq = own_freq
	self.online = own_online
	self.sending = own_sending
	local radio_id = self:EntIndex()

	for k, v in pairs( gspeak.radios ) do
		if !IsValid(v) or !string.match(v:GetClass() ,"radio_ent*") then
			table.remove(gspeak.radios, k)
			continue
		end
		local v_id = v:EntIndex()
		local v_freq = v:GetFreq()
		if radio_id != v_id then
			if self.online and v:GetOnline() and self.freq == v_freq then
				if v:GetSending() then
					self:AddRadio(v_id)
				else
					self:RemoveRadio(v_id)
				end
				if self.sending then
					v:AddRadio(radio_id)
				else
					v:RemoveRadio(radio_id)
				end
			else
				self:RemoveRadio(v_id)
				v:RemoveRadio(radio_id)
			end
		end
	end
end

function ENT:checkTime(diff)
	local now = CurTime()
	self.last_try = self.last_try or 0
	if self.last_try < now - diff then
		self.last_try = now
		return true
	end
	return false
end

if SERVER then
function ENT:UpdateTransmitState()
return TRANSMIT_ALWAYS
end
end


function ENT:AddHearables(pos)
	for k, v in pairs( self.connected_radios ) do
		local remove_v = false
            if IsValid(Entity(v)) and string.match(Entity(v):GetClass(), "radio_ent*") and IsValid(Entity(v):GetSpeaker()) then
			local speaker = Entity(v):GetSpeaker()
			if speaker:IsPlayer() and gspeak:player_alive(speaker) and string.match(Entity(v):GetClass(), "radio_ent*") then
				local ts_id = gspeak:get_tsid(speaker)
				if gspeak.TS.connected and speaker != LocalPlayer() and ts_id >= 0 then
					tslib.sendPos(ts_id, 1, v, pos.x, pos.y, pos.z, true, self:EntIndex())
				end
			else
				remove_v = true
			end
		else
			remove_v = true
		end

		if remove_v then
			self:RemoveID( v, k )
		end
	end
end

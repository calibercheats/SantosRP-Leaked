
-----------------------------------------------------
AddCSLuaFile()

ENT.Base = "base_nextbot"
ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:Initialize()
	if self.Model then
		self:SetModel(self.Model)
	end

	if SERVER then
		self:SetUseType(SIMPLE_USE)

		self:SetHealth(1e7)
		self.BlockPhysGun = true
		self.IsMapProp = true
	end
end

function ENT:GetEyePos()
	return (self:GetPos() + Vector(5, 0, 68))
end

function ENT:LookAtAngRaw(ang)
    local yaw = math.NormalizeAngle(ang.y - self:GetAngles().y)

    self:SetPoseParameter("head_yaw", math.Clamp(yaw, -60, 60))

    local pitch = math.Clamp(math.NormalizeAngle(ang.p), -15, 15)
    self:SetPoseParameter("head_pitch", pitch)

	self:SetPoseParameter("head_roll", 0)

	self:InvalidateBoneCache()
end

function ENT:LookAtAngInstant(ang)
	self:LookAtAngRaw(ang)
    self:SetEyeTarget(self:GetEyePos() + ang:Forward() * 100)
end

function ENT:LookAt(pos)
    local ang = (pos - self:GetEyePos()):Angle()
	self._LookTargetAngle = ang
end

function ENT:LookAtClosestPlayer()
	local possible_ents = player.GetAll()
    table.sort(possible_ents, function(a, b)
		local mypos = self:GetPos()
		return mypos:Distance(a:GetPos()) < mypos:Distance(b:GetPos())
    end)

	local targetEnt = possible_ents[1]
	if IsValid(targetEnt) then
		self:LookAt(targetEnt:EyePos())
		return true
	end
	return false
end

if CLIENT then
	function ENT:Think()
		if self._LookTargetAngle then
			self._LookCurAngle = self._LookCurAngle or Angle(0, 0, 0)

			local approachSpeed = FrameTime() * 300

			self._LookCurAngle.p = math.ApproachAngle(self._LookCurAngle.p, self._LookTargetAngle.p, approachSpeed)
			self._LookCurAngle.y = math.ApproachAngle(self._LookCurAngle.y, self._LookTargetAngle.y, approachSpeed)
			self._LookCurAngle.r = math.ApproachAngle(self._LookCurAngle.r, self._LookTargetAngle.r, approachSpeed)

			self:LookAtAngRaw(self._LookCurAngle)
		    self:SetEyeTarget(self:GetEyePos() + self._LookTargetAngle:Forward() * 100)
		end

		if IsValid(self.VoiceChan) then
			if self.VoiceChan:GetState() ~= GMOD_CHANNEL_STOPPED then
				self.FFT = self.FFT or {}
				local freqBins = self.VoiceChan:FFT(self.FFT, FFT_256)

				local accum = 0
				for i=1,freqBins do accum = accum + self.FFT[i] end

				local finalWeight = accum / 3

				self:SetFlexWeight(43, finalWeight)
			else
				self:SetFlexWeight(43, 0)
				self.VoiceChan = nil
			end
		end
	end

	function ENT:SpeakFile(file)
		sound.PlayFile(file, "3d", function(chan)
			if IsValid(self.VoiceChan) then self.VoiceChan:Stop() end

			chan:SetPos(self:GetPos() + Vector(0, 0, 80))
			self.VoiceChan = chan
		end)
	end
	function ENT:SpeakUrl(url)
		sound.PlayURL(url, "3d", function(chan)
			if IsValid(self.VoiceChan) then self.VoiceChan:Stop() end

			chan:SetPos(self:GetPos() + Vector(0, 0, 80))
			self.VoiceChan = chan
		end)
	end

	net.Receive("casinokit_dealersound", function(len, cl)
		local dealer = net.ReadEntity()
		local sound = net.ReadString()
		local isFile = net.ReadBool()
		if IsValid(dealer) then
			if isFile then dealer:SpeakFile(sound) else dealer:SpeakUrl(sound) end
		end
	end)
end
if SERVER then
	util.AddNetworkString("casinokit_dealersound")
	function ENT:SpeakFile(sound)
		net.Start("casinokit_dealersound")
		net.WriteEntity(self)
		net.WriteString(sound)
		net.WriteBool(true)
		net.SendPAS(self:GetPos())
	end
	function ENT:SpeakUrl(sound)
		net.Start("casinokit_dealersound")
		net.WriteEntity(self)
		net.WriteString(sound)
		net.WriteBool(false)
		net.SendPAS(self:GetPos())
	end
end

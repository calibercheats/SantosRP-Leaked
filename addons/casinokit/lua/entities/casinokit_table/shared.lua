
-----------------------------------------------------
ENT.Type = "anim"
ENT.Editable = true

ENT.CasinoKitTable = true
ENT.SeatCount = 4

function ENT:SetupDataTables()
	self:NetworkVar("String", 0, "ClGameClass")
	self:NetworkVar("String", 1, "DealerId", { KeyName = "dealerid", Edit = { type = "Generic", category = "Casino Kit", order = 5 } })

	if SERVER then
		self:NetworkVarNotify("DealerId", self.OnDealerIdChanged)
	end
end

function ENT:Setowning_ent(ent)
	if ent:IsPlayer() then
		self.TableOwner = ent
	end
end

function ENT:CanConfigureTable(ply)
	return ply:IsSuperAdmin() or self:GetOwner() == ply
end

-- angle in radians of opposite of dealer
local startAng = math.rad(90)

-- angle per seat
local angPerSeat = math.rad(1)

function ENT:SeatIndexOrientation(i, offset)
	local seatCount = self.SeatCount
	local totalAng = angPerSeat * seatCount
	local startAng = startAng - totalAng/2

	offset = offset or 45
	local lpos = Vector(math.cos(startAng + (i-1)) * offset, math.sin(startAng + (i-1)) * offset)
	local lang = (-lpos):Angle()
	return lpos, lang
end

function ENT:GetTableSeats()
	return self._tableSeats or {}
end

function ENT:GetCachedSeatindexPlyTuples()
	if self._cachedSIPT and self._cachedSIPTExpire > CurTime() then
		return self._cachedSIPT
	end

	local r = {}
	for _,ts in pairs(self:GetTableSeats()) do
		for _,p in pairs(player.GetAll()) do
			if p:GetVehicle() == ts then
				table.insert(r, {ts:GetNWInt("SeatIndex", 0), p})
			end
		end
	end

	self._cachedSIPT = r
	self._cachedSIPTExpire = CurTime() + 1
	return r
end

hook.Add("OnEntityCreated", "CasinoKit_NewSeatListener", function(e)
	if e:GetClass() == "prop_vehicle_prisoner_pod" then
		timer.Simple(1, function()
			if not IsValid(e) then return end

			local par = e:GetParent()
			if not IsValid(par) or not par.CasinoKitTable then return end

			par._tableSeats = par._tableSeats or {}
			table.insert(par._tableSeats, e)
		end)
	end
end)

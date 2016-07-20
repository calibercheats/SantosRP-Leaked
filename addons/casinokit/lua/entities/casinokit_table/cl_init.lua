
-----------------------------------------------------
include("shared.lua")

local tblTexture = CreateMaterial("CasinoKit_table_green_" .. CurTime(), "VertexLitGeneric", {})
local tblBorderTexture = CreateMaterial("CasinoKit_table_border_" .. CurTime(), "VertexLitGeneric", {})
CasinoKit.getRemoteMaterial("http://i.imgur.com/O4Xw0tF.jpg", function(mat)
	tblTexture:SetTexture("$basetexture", mat:GetTexture("$basetexture"))
end, true)
CasinoKit.getRemoteMaterial("http://i.imgur.com/Kuy8cK8.jpg", function(mat)
	tblBorderTexture:SetTexture("$basetexture", mat:GetTexture("$basetexture"))
end, true)

ENT.TableLocalOrigin = Vector(0, 0, 32.8)

ENT.RenderGroup = RENDERGROUP_BOTH
function ENT:Draw()
	self:DrawModel()

	-- Create the green texture round thing
	if not IsValid(self.OverlayModel) then
		self.OverlayModel = ClientsideModel("models/props_phx/construct/plastic/plastic_angle_360.mdl")
	end

	self.OverlayModel:SetNoDraw(true)
	self.OverlayModel:SetRenderOrigin(self:LocalToWorld(Vector(0, 0, 30.5)))
	self.OverlayModel:SetModelScale(0.7, 0)
	self.OverlayModel:SetRenderAngles(self:GetAngles())
	self.OverlayModel:SetupBones()

	render.MaterialOverrideByIndex(0, tblBorderTexture)
	render.MaterialOverrideByIndex(1, tblTexture)
	self.OverlayModel:DrawModel()
	render.MaterialOverrideByIndex(0)
	render.MaterialOverrideByIndex(1)

	if self.Game then self.Game:drawTable(self, self.TableLocalOrigin) end
end
function ENT:DrawTranslucent()
	local veh = LocalPlayer():GetVehicle()
	if IsValid(veh) and veh:GetParent() == self then
		if not self.p then
			self.p = CasinoKit.tdui.Create()
			self.p:SetSkin("CasinoKit")
		end

		if self.Game then self.Game:drawUI(self, self.p) end

		self.p:Cursor()

		local uiPosOff, uiAngOff
		if self.Game and self.Game.getUIOffset then
			uiPosOff, uiAngOff = self.Game:getUIOffset(self)
		end
		
		self.p:Render(veh:LocalToWorld(Vector(0, 25, 45) + (uiPosOff or Vector())), veh:LocalToWorldAngles(Angle(10, 90, 0) + (uiAngOff or Angle())), 0.05)
	else
		local name = self.Game and self.Game:getGameFriendlyName()
		local subtext = self.Game and self.Game:getGameFriendlySubtext()

		local ang = LocalPlayer():EyeAngles()
		ang:RotateAroundAxis(ang:Right(), 90)
		ang:RotateAroundAxis(ang:Up(), -90)

		cam.Start3D2D(self:GetPos() + self:GetUp() * 100, ang, 0.2)
		surface.SetTextColor(255, 255, 255)
		draw.SimpleTextOutlined(name or "", "CasinoKitTableName", 0, 0, nil, TEXT_ALIGN_CENTER, nil, 2, Color(0, 0, 0))
		draw.SimpleTextOutlined(subtext or "", "CasinoKitTableSubtext", 0, 70, nil, TEXT_ALIGN_CENTER, nil, 1, Color(0, 0, 0))
		cam.End3D2D()
	end
end

surface.CreateFont("CasinoKitTableName", {
	font = "Roboto",
	size = 80,
	weight = 800
})
surface.CreateFont("CasinoKitTableSubtext", {
	font = "Roboto",
	size = 40
})

function ENT:GetMySeatIndex()
	local veh = LocalPlayer():GetVehicle()
	if IsValid(veh) and veh:GetParent() == self then
		return veh:GetNWInt("SeatIndex", -1) or -1
	end
	return -1
end

-- DEPRECATED
ENT.GetSeatIndex = ENT.GetMySeatIndex

function ENT:Think()
	if not self.Game or self.Game.class.name ~= (self:GetClGameClass()) then
		local cls = CasinoKit.classes[self:GetClGameClass()]
		if cls then
			self.Game = cls()
			self.Game:setTableEntity(self)

			for _,data in pairs(self._messageQueue or {}) do
				self.Game:handleGameMessage(data.id, data.buf)
			end
			self._messageQueue = nil
		end
	end
end

function ENT:HandleGameMessage(id, buf)
	if self.Game then
		self.Game:handleGameMessage(id, buf)
	else
		self._messageQueue = self._messageQueue or {}
		table.insert(self._messageQueue, {id=id, buf=buf})
	end
end

function ENT:OnRemove()
	if IsValid(self.OverlayModel) then self.OverlayModel:Remove() end
end

hook.Add("PreDrawPlayer", "CasinoKit_FadeObstructingPlayers")

hook.Add("CalcView", "CasinoKit_AboveView", function( pPlayer, vecOrigin, angAngs, intFOV )
	local veh = pPlayer:GetVehicle()

	if IsValid( veh ) and IsValid(veh:GetParent()) and veh:GetParent().CasinoKitTable and veh:GetThirdPersonMode() then
		local par = veh:GetParent()
		local lpos, lang = par:SeatIndexOrientation(veh:GetNWInt("SeatIndex", -1), 5)
		local lwpos, lwang = par:LocalToWorld(lpos), par:LocalToWorldAngles(lang)

		local pos = lwpos + lwang:Up() * 65
		local ang = (par:LocalToWorld(par.TableLocalOrigin) - pos):Angle()
		return {
			origin = pos,
			angles = ang,
			fov = 105
		}
	end
end)
hook.Add("ShouldDrawLocalPlayer", "CasinoKit_AboveView", function(ply)
	local veh = ply:GetVehicle()
	if IsValid(veh) and IsValid(veh:GetParent()) and veh:GetParent().CasinoKitTable and veh:GetThirdPersonMode() then
		return true
	end
end)

hook.Add("HUDPaint", "CasinoKit_3rdPersonInfo", function()
	local veh = LocalPlayer():GetVehicle()

	if not IsValid(veh) then return end

	if not (IsValid(veh:GetParent()) and veh:GetParent().CasinoKitTable) then
		return
	end

	local isThirdPerson = veh:GetThirdPersonMode()

	local text = isThirdPerson and "Press 'ctrl' to leave above-table view" or "Press 'ctrl' to enter above-table view"
	draw.SimpleText(text, "DermaLarge", ScrW()/2, ScrH() - 150, nil, TEXT_ALIGN_CENTER)
end)
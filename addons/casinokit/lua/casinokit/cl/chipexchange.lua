
-----------------------------------------------------
local L = CasinoKit.L

surface.CreateFont("CasinoKit_ChipXFont", {
	font = "Trebuchet",
	size = 13
})

local PANEL = {}

function PANEL:SetEntity(e)
	self.cent = e
end

function PANEL:Init()
	local scroll = self:Add("DScrollPanel")
	scroll:Dock(FILL)

	local tblContainer = vgui.Create("DPanel")
	tblContainer:SetPaintBackground(false)

	local tbl = tblContainer:Add("NSTable")
	function tblContainer:PerformLayout()
		self:SetWide(scroll.pnlCanvas:GetWide())

		-- This is kinda bad but kinda works
		local maxTall = 0
		tbl:ForEachCell(function(data)
			maxTall = math.max(maxTall, data.compY + data.compH)
		end)
		self:SetTall(maxTall)
	end
	scroll:AddItem(tblContainer)

	tbl:Dock(FILL)
	--tbl:SetDebugMode(true)

	tbl:SetPadding(4)
	tbl:Top()

	-- Utility funcs
	local function Label(text, w)
		local v = vgui.Create("DLabel")
		v:SetText(text)
		if w then  v:SetWide(w) else v:SizeToContents() end

		v.WithEnabled = function(self, b)
			self:SetEnabled(b)
			self:SetDisabled(not b)
			return self
		end

		return v
	end
	local function TextEntry(text, w)
		local v = vgui.Create("DTextEntry")
		v:SetText(text)
		if w then  v:SetWide(w) else v:SizeToContents() end

		v.WithEnabled = function(self, b)
			self:SetEnabled(b)
			self:SetDisabled(not b)
			return self
		end

		return v
	end
	local function Button(text)
		local v = vgui.Create("DButton")
		v:SetText(text)

		v.WithAction = function(self, fn)
			self.DoClick = fn
			return self
		end

		return v
	end

	tbl:Add((function()
		local v = vgui.Create("DLabel")
		v:SetFont("CasinoKit_ChipXFont")
		v.Think = function()
			v:SetText(L("#chipdealer_chipamount", LocalPlayer():CKit_GetChips()))
		end
		return v
	end)())
		:SetColspan(4)
		:SetFilledX(true)
	tbl:Row():SetMarginTop(5)

	local clri = 0
	for name,currency in pairs(CasinoKit.getCurrencies()) do
		if not currency:isEnabled() then continue end

		tbl:Add((function()
			local v = vgui.Create("DLabel")
			v:SetFont("CasinoKit_ChipXFont")

			-- because SetBGColor doesn't work smh
			local clr = HSVToColor(clri * 90, 0.4, 0.9)
			clri = clri + 1

			v.Paint = function(_, w, h)
				surface.SetDrawColor(clr)
				surface.DrawRect(0, 0, w, h)
			end

			v.Think = function()
				local s = string.format(" %s [1 %s → %.2f chips] [1 chip → %.2f %s]",
					currency.NiceName,
					currency.UnitName,
					currency:getExchangeRateFromCurrencyToChips(LocalPlayer()),
					currency:getExchangeRateFromChipsToCurrency(LocalPlayer()),
					currency.UnitPluralName)
				v:SetText(s)
			end
			v:SetWide(100)
			return v
		end)()):SetColspan(5):SetFilledX(true)
		tbl:Row():SetMarginTop(5)

		tbl:Add(Label("Buy")):Center():SetExpandedX(true)
		local buyChipField = TextEntry("0")
		tbl:Add(buyChipField):SetFilledX(true)
		tbl:Add(Label("chips for ")):SetExpandedX(true)

		local function GetBuyMoneyCount()
			return math.Round((tonumber(buyChipField:GetText()) or 0) * (1/currency:getExchangeRateFromCurrencyToChips(LocalPlayer())))
		end

		local buyMoneyField = TextEntry("0"):WithEnabled(false)
		buyMoneyField.Think = function(self)
			local money = GetBuyMoneyCount()
			self:SetText(money .. " " .. currency.UnitPluralName)
		end
		tbl:Add(buyMoneyField):SetExpandedX(true)
		tbl:Add(Button(L"#chipdealer_exchangeverb"):WithAction(function()
			net.Start("casinokit_chipexchange")
			net.WriteEntity(self.cent)
			net.WriteString(name)
			net.WriteBool(true)
			net.WriteUInt(GetBuyMoneyCount(), 32)
			net.SendToServer()
		end))

		tbl:Row():SetMarginTop(8)

		tbl:Add(Label("Sell")):Center():SetExpandedX(true)
		local sellChipField = TextEntry("0")
		tbl:Add(sellChipField):SetFilledX(true)
		tbl:Add(Label("chips for ")):SetExpandedX(true)

		local sellMoneyField = TextEntry("0"):WithEnabled(false)
		sellMoneyField.Think = function(self)
			local dough = math.floor((tonumber(sellChipField:GetText()) or 0) * currency:getExchangeRateFromChipsToCurrency(LocalPlayer()))
			self:SetText(dough .. " " .. currency.UnitPluralName)
		end
		tbl:Add(sellMoneyField):SetExpandedX(true)
		tbl:Add(Button(L"#chipdealer_exchangeverb"):WithAction(function()
			net.Start("casinokit_chipexchange")
			net.WriteEntity(self.cent)
			net.WriteString(name)
			net.WriteBool(false)
			net.WriteUInt(tonumber(sellChipField:GetText()) or 0, 32)
			net.SendToServer()
		end))

		tbl:Row():SetMarginTop(5)
	end

	tbl:Row():SetMarginTop(10)

	tbl:Add((function()
		local v = vgui.Create("DLabel")
		v:SetFont("CasinoKit_ChipXFont")

		v:SetText(L"#chipdealer_tip0")
		return v
	end)())
		:SetColspan(5)
		:SetFilledX(true)

	tbl:PerformLayout()
end

vgui.Register("CasinoKitChipExchange", PANEL, "Panel")

concommand.Add("casinokit_chipexchange_npc", function(ply, cmd, args)
	local ent = Entity(tonumber(args[1]))
	if not IsValid(ent) then return end

	local fr = vgui.Create("DFrame")
	fr:SetTitle("Chip Exchange")
	fr:SetSize(380, 270)
	fr:Center()

	local chipx = fr:Add("CasinoKitChipExchange")
	chipx:SetEntity(ent)
	chipx:Dock(FILL)

	fr:SetSkin("CasinoKit")
	fr:MakePopup()
end)

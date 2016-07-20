
-----------------------------------------------------
--SantosRP EDIT
--We want to save this in our database!
--We also turn the chips nw var into real chip items
local itemID = "Casino Chips"
local ply = FindMetaTable("Player")

function ply:CKit_GetChips()
	if SERVER then
		return GAMEMODE.Inv:GetPlayerItemAmount( self, itemID )
	else
		return GAMEMODE.Inv:GetPlayerItemAmount( itemID )
	end
end
function ply:CKit_CanAffordChips(n)
	return n >= 0 and self:CKit_GetChips() >= n
end

if SERVER then
	--SantosRP EDIT
	--We want to save this in our database!

	--hook.Add("PlayerInitialSpawn", "CasinoKit_RestorePChips", function(ply)
	--	local chips = tonumber(ply:GetPData("CK_Chips")) or 0
	--	ply:SetNWInt("CK_Chips", chips)
	--end)
	function ply:CKit_SetChips(chips)
		local curChips = self:CKit_GetChips()
		local amount = chips -curChips

		if amount > 0 then
			GAMEMODE.Inv:GivePlayerItem( self, itemID, amount )
		elseif amount < 0 then
			GAMEMODE.Inv:TakePlayerItem( self, itemID, math.abs(amount) )
		end
	end

	local chipSounds = {"chipsHandle1.ogg", "chipsHandle3.ogg", "chipsHandle4.ogg", "chipsHandle5.ogg", "chipsHandle6.ogg"}
	function ply:CKit_AddChips(chips, reason)
		self:CKit_SetChips(self:CKit_GetChips() + chips)

		if chips > 0 then
			local strength = math.Clamp(chips / 1000, 0, 1)
			self:EmitSound("casinokit/" .. table.Random(chipSounds), 35 + strength * 75)
		end
	end
end

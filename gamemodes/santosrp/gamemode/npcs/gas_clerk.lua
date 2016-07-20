
-----------------------------------------------------
--[[
	Name: gas_clerk.lua
	For: SantosRP
	By: Ultra
]]--

local NPCMeta = {}
NPCMeta.Name = "Store Clerk"
NPCMeta.UID = "gas_clerk"
NPCMeta.SubText = "Purchase items here"
NPCMeta.Model = "models/Humans/Group02/Female_02.mdl"
NPCMeta.Sounds = {
	StartDialog = {
		"vo/npc/female01/hi01.wav",
		"vo/npc/female01/hi02.wav",
		"vo/npc/female01/gordead_ques16.wav",
		"vo/npc/female01/answer30.wav",
	},
	EndDialog = {
		"vo/npc/female01/pardonme01.wav",
		"vo/npc/female01/pardonme02.wav",
		"vo/npc/female01/answer15.wav",
		"vo/npc/female01/excuseme02.wav",
		"vo/npc/female01/excuseme01.wav",
	}
}
--[itemID] = priceToBuy,
NPCMeta.ItemsForSale = {
	["Fuel Can"] = 65,
	["Beer"] = 15,
	["Cigarettes"] = 8,
	["Cigar Box"] = 15,

	--Foods
	["Jo Jo's Cola"] = 15,
	["Sprunk Cola"] = 15,
	["Doritos - Nacho Cheese"] = 8,
	["Fritos - Original"] = 8,
	["Fritos - BBQ"] = 9,
	["Fritos - BBQ Hoops"] = 9,
	["Lays - Classic"] = 8,
	["Lays - Salt & Vinegar"] = 9,
	["Lays - Barbecue"] = 9,
	["Lays - Sour Cream & Onion"] = 9,
	["Lays - Dill Pickle"] = 9,
	["Lays - Flamin' Hot"] = 9,
	["Toblerone"] = 8,
	["Kinder Surprise"] = 8,
	["Cookies"] = 11,
}
--[itemID] = priceToSell,
NPCMeta.ItemsCanBuy = {}
for k, v in pairs( NPCMeta.ItemsForSale ) do
	NPCMeta.ItemsCanBuy[k] = math.ceil( v *0.66 )
end

function NPCMeta:OnPlayerTalk( entNPC, pPlayer )
	GAMEMODE.Net:ShowNPCDialog( pPlayer, "gas_clerk" )
	
	if (entNPC.m_intLastSoundTime or 0) < CurTime() then
		local snd, _ = table.Random( self.Sounds.StartDialog )
		entNPC:EmitSound( snd, 60 )
		entNPC.m_intLastSoundTime = CurTime() +2
	end
end

function NPCMeta:OnPlayerEndDialog( pPlayer )
	if not pPlayer:WithinTalkingRange() then return end
	if pPlayer:GetTalkingNPC().UID ~= self.UID then return end

	if (pPlayer.m_entTalkingNPC.m_intLastSoundTime or 0) < CurTime() then
		local snd, _ = table.Random( self.Sounds.EndDialog )
		pPlayer.m_entTalkingNPC:EmitSound( snd, 60 )
		pPlayer.m_entTalkingNPC.m_intLastSoundTime = CurTime() +2
	end

	pPlayer.m_entTalkingNPC = nil
end

if SERVER then
	--RegisterDialogEvents is called when the npc is registered! This is before the gamemode loads so GAMEMODE is not valid yet.
	function NPCMeta:RegisterDialogEvents()
	end
elseif CLIENT then
	function NPCMeta:RegisterDialogEvents()
		GM.Dialog:RegisterDialog( "gas_clerk", self.StartDialog, self )
	end
	
	function NPCMeta:StartDialog()
		GAMEMODE.Dialog:ShowDialog()
		GAMEMODE.Dialog:SetModel( self.Model )
		GAMEMODE.Dialog:SetTitle( self.Name )
		GAMEMODE.Dialog:SetPrompt( "You gonna buy something pal?" )

		GAMEMODE.Dialog:AddOption( "Show me what you have for sale.", function()
			GAMEMODE.Gui:ShowNPCShopMenu( self.UID )
			GAMEMODE.Dialog:HideDialog()
		end )
		GAMEMODE.Dialog:AddOption( "I would like to return some items.", function()
			GAMEMODE.Gui:ShowNPCSellMenu( self.UID )
			GAMEMODE.Dialog:HideDialog()
		end )
		GAMEMODE.Dialog:AddOption( "Never mind, I have to go.", function()
			GAMEMODE.Net:SendNPCDialogEvent( self.UID.. "_end_dialog" )
			GAMEMODE.Dialog:HideDialog()
		end )
	end
end

GM.NPC:Register( NPCMeta )
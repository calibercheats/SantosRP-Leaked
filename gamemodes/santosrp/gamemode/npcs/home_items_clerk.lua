
-----------------------------------------------------
--[[
	Name: home_items_clerk.lua
	For: SantosRP
	By: Ultra
]]--

local NPCMeta = {}
NPCMeta.Name = "Store Clerk"
NPCMeta.UID = "home_items_clerk"
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
	--Furniture
	["Sofa 1"] = 40,
	["Sofa 2"] = 40,
	["Sofa 3"] = 40,
	["Chair 1"] = 20,
	["Chair 2"] = 20,
	["Chair 3"] = 20,
	["Chair 4"] = 20,
	["Chair 5"] = 20,
	["Desk Chair 1"] = 75,
	["Desk Chair 2"] = 20,
	["Round Table"] = 50,
	["Table"] = 65,
	["Coffee Table"] = 50,
	["Shelf Unit 1"] = 125,
	["Shelf Unit 2"] = 75,

	-- Storage
	["Desk"] = 75,
	["Fancy Desk"] = 115,
	["Drawer Set 1"] = 50,
	["Drawer Set 2"] = 50,
	["Dresser"] = 250,
	["Cupboard"] = 50,
	["File Cabinet"] = 50,
	["Large File Cabinet"] = 100,
	["Storage Chest"] = 750,

	--New Furniture
	["Elegant Dining Chair"] = 150,
	["Elegant Dining Table"] = 200,
	["Fancy Modern Chair"] = 100,
	["Fancy End Table"] = 100,
	["Leather Couch"] = 70,
	["Leather Chair"] = 50,
	["Leather Office Chair"] = 40,
	["Derelict Couch"] = 15,
	["Wooden Bar Stool"] = 10,
	["Large Wooden Bar"] = 160,
	["Metal Patio Chair"] = 35,
	["Metal Shelf"] = 50,
	["Patio Table with Umbrella"] = 75,
	["Sturdy Wooden Table"] = 60,
	["Wooden Display Table"] = 80,
	["Metal Office Desk"] = 90,

	--Decorative
	["Wall Clock"] = 5,
	["Flower Planter"] = 15,
	["Small Potted Plant"] = 10,
	["Large Potted Plant"] = 20,
	["Wild Monkey Flowers"] = 5,

	--Ents
	["Large Sign"] = 120,
}
--[itemID] = priceToSell,
NPCMeta.ItemsCanBuy = {}
for k, v in pairs( NPCMeta.ItemsForSale ) do
	NPCMeta.ItemsCanBuy[k] = math.ceil( v *0.66 )
end

function NPCMeta:OnPlayerTalk( entNPC, pPlayer )
	GAMEMODE.Net:ShowNPCDialog( pPlayer, "home_items_clerk" )

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
		GM.Dialog:RegisterDialog( "home_items_clerk", self.StartDialog, self )
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

-----------------------------------------------------
--[[
	Name: hardware_clerk.lua
	For: SantosRP
	By: Ultra
]]--

local NPCMeta = {}
NPCMeta.Name = "Store Clerk"
NPCMeta.UID = "hardware_clerk"
NPCMeta.SubText = "Purchase hardware here"
NPCMeta.Model = "models/odessa.mdl"
NPCMeta.Sounds = {
	StartDialog = {
		"vo/streetwar/sniper/ba_hearcat.wav",
		"vo/streetwar/rubble/ba_illbedamned.wav",
		"vo/k_lab/ba_hesback01.wav",
		"vo/k_lab/ba_thingaway01.wav",
	},
	EndDialog = {
		"vo/k_lab/ba_geethanks.wav",
		"vo/streetwar/nexus/ba_done.wav",
		"vo/k_lab/ba_itsworking04.wav",
	}
}
--[itemID] = priceToBuy,
NPCMeta.ItemsForSale = {
	--ents
	["First Aid Kit"] = 500,
	["Medical Supplies"] = 50,
	["Crafting Table"] = 1000,
	["Assembly Table"] = 1000,
	["Gun Smithing Table"] = 3000,
	["Road Flare"] = 20,
	["Terracotta Pot"] = 35,
	["Stove"] = 500,

	--fluids
	["Cleaning Solution"] = 40,
	["Bucket of Fertilizer"] = 20,
	["Potting Soil"] = 20,

	--crafting items
	["Wood Plank"] = 250,
	["Paint Bucket"] = 150,
	["Metal Bracket"] = 110,
	["Metal Bar"] = 145,
	["Metal Plate"] = 115,
	["Metal Pipe"] = 75,
	["Metal Hook"] = 80,
	["Metal Bucket"] = 70,
	["Plastic Bucket"] = 90,
	["Wrench"] = 75,
	["Pliers"] = 60,
	["Car Battery"] = 500,
	["Circular Saw"] = 280,
	["Cinder Block"] = 95,
	["Bleach"] = 60,
	["Radiator"] = 500,
	["Crowbar"] = 50,
	["Engine Block"] = 3500,
	["Large Cardboard Box"] = 50,
	["Plastic Crate"] = 50,
	["Chunk of Plastic"] = 75,
	["Cloth"] = 25,
	["Rubber Tire"] = 100,

	--misc building items
	["Concrete Barrier"] = 50,
	["Wire Fence 01"] = 75,
	["Wire Fence 02"] = 50,
	["Wire Fence 03"] = 100,
	["Large Blast Door"] = 400,
	["Blast Door"] = 250,
	["Large Wood Plank"] = 30,
	["Large Wood Fence"] = 80,
	["Wood Fence"] = 80,
}
--[itemID] = priceToSell,
NPCMeta.ItemsCanBuy = {}
for k, v in pairs( NPCMeta.ItemsForSale ) do
	NPCMeta.ItemsCanBuy[k] = math.ceil( v *0.66 )
end

function NPCMeta:OnPlayerTalk( entNPC, pPlayer )
	GAMEMODE.Net:ShowNPCDialog( pPlayer, "hardware_clerk" )
	
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
		GM.Dialog:RegisterDialog( "hardware_clerk", self.StartDialog, self )
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
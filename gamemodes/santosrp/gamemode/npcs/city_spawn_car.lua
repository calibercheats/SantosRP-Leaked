
-----------------------------------------------------
--[[
	Name: city_spawn_car.lua
	For: SantosRP
	By: Ultra
]]--

local NPCMeta = {}
NPCMeta.Name = "City Worker"
NPCMeta.UID = "city_spawn_car"
NPCMeta.SubText = "Spawn a government car here"
NPCMeta.Model = "models/odessa.mdl"
NPCMeta.Sounds = {
	StartDialog = {
		"vo/npc/male01/answer30.wav",
		"vo/npc/male01/gordead_ans01.wav",
		"vo/npc/male01/gordead_ques16.wav",
		"vo/npc/male01/hi01.wav",
		"vo/npc/male01/hi02.wav",
	},
	EndDialog = {
		"vo/npc/male01/finally.wav",
		"vo/npc/male01/pardonme01.wav",
		"vo/npc/male01/vanswer01.wav",
		"vo/npc/male01/vanswer13.wav",
	},
	JobQuit = {
		"vo/npc/male01/answer02.wav",
		"vo/npc/male01/answer03.wav",
		"vo/npc/male01/answer04.wav",
		"vo/npc/male01/answer24.wav",
		"vo/npc/male01/heretohelp01.wav",
		"vo/npc/male01/heretohelp02.wav",
		"vo/npc/male01/notthemanithought02.wav",
		"vo/npc/male01/notthemanithought01.wav",
	},
	JobJoin = {
		"vo/npc/male01/answer25.wav",
		"vo/npc/male01/answer24.wav",
		"vo/npc/male01/answer28.wav",
		"vo/npc/male01/answer35.wav",
	},
}

function NPCMeta:OnPlayerTalk( entNPC, pPlayer )
	if GAMEMODE.Jobs:PlayerIsJob( pPlayer, JOB_SSERVICE ) then
		GAMEMODE.Net:ShowNPCDialog( pPlayer, "city_spawn" )
	else
		if GAMEMODE.Jobs:PlayerIsJob( pPlayer, JOB_CITYWORKER ) then
			GAMEMODE.Net:ShowNPCDialog( pPlayer, "city_spawn_cw" )
		else
			GAMEMODE.Net:ShowNPCDialog( pPlayer, "city_spawn_notss" )
		end
	end

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


--[[ SS ]]--
function NPCMeta:ShowSpawnMenu( pPlayer, ... )
	if not pPlayer:WithinTalkingRange() then return end
	if pPlayer:GetTalkingNPC().UID ~= self.UID then return end
	if not GAMEMODE.Jobs:PlayerIsJob( pPlayer, JOB_SSERVICE ) then return end
	
	GAMEMODE.Net:ShowNWMenu( pPlayer, "city_car_spawn" )
end


--[[ City Worker ]]--
function NPCMeta:SpawnVan( pPlayer, ... )
	if not pPlayer:WithinTalkingRange() then return end
	if pPlayer:GetTalkingNPC().UID ~= self.UID then return end
	if not GAMEMODE.Jobs:PlayerIsJob( pPlayer, JOB_CITYWORKER ) then return end

	GAMEMODE.Jobs:GetJobByID( JOB_CITYWORKER ):PlayerSpawnVan( pPlayer )
	self:OnPlayerEndDialog( pPlayer )
end

function NPCMeta:StowVan( pPlayer, ... )
	if not pPlayer:WithinTalkingRange() then return end
	if pPlayer:GetTalkingNPC().UID ~= self.UID then return end
	if not GAMEMODE.Jobs:PlayerIsJob( pPlayer, JOB_CITYWORKER ) then return end

	GAMEMODE.Jobs:GetJobByID( JOB_CITYWORKER ):PlayerStowVan( pPlayer )
	self:OnPlayerEndDialog( pPlayer )
end

function NPCMeta:BecomeJob( pPlayer, ... )
	if not pPlayer:WithinTalkingRange() then return end
	if pPlayer:GetTalkingNPC().UID ~= self.UID then return end
	if GAMEMODE.Jobs:PlayerIsJob( pPlayer, JOB_CITYWORKER ) then return end

	local hasFastPass = GAMEMODE.Player:GetPlayerVIPFlag( pPlayer, "job_fast_pass" ) and true
	if GAMEMODE.Jobs:CalcJobPlayerCap( JOB_CITYWORKER ) <= GAMEMODE.Jobs:GetNumPlayers( JOB_CITYWORKER ) and not hasFastPass then
		GAMEMODE.Net:ShowNPCDialog( pPlayer, "city_atplayercap" )
		return
	end

	GAMEMODE.Jobs:SetPlayerJob( pPlayer, JOB_CITYWORKER )
	local snd, _ = table.Random( self.Sounds.JobJoin )
	pPlayer:GetTalkingNPC():EmitSound( snd, 60 )
end

function NPCMeta:QuitJob( pPlayer, ... )
	if not pPlayer:WithinTalkingRange() then return end
	if pPlayer:GetTalkingNPC().UID ~= self.UID then return end
	if not GAMEMODE.Jobs:PlayerIsJob( pPlayer, JOB_CITYWORKER ) then return end

	GAMEMODE.Jobs:SetPlayerJob( pPlayer, JOB_CIVILIAN )
	local snd, _ = table.Random( self.Sounds.JobQuit )
	pPlayer:GetTalkingNPC():EmitSound( snd, 60 )
end

if SERVER then
	--RegisterDialogEvents is called when the npc is registered! This is before the gamemode loads so GAMEMODE is not valid yet.
	function NPCMeta:RegisterDialogEvents()
		GM.Dialog:RegisterDialogEvent( "city_open_car_spawnmenu", self.ShowSpawnMenu, self )
		GM.Dialog:RegisterDialogEvent( "city_worker_become", self.ShowSpawnMenu, self )

		GM.Dialog:RegisterDialogEvent( "city_worker_spawn_van", self.SpawnVan, self )
		GM.Dialog:RegisterDialogEvent( "city_worker_stow_van", self.StowVan, self )
		GM.Dialog:RegisterDialogEvent( "city_worker_become", self.BecomeJob, self )
		GM.Dialog:RegisterDialogEvent( "city_worker_quit", self.QuitJob, self )
	end
elseif CLIENT then
	function NPCMeta:RegisterDialogEvents()
		GM.Dialog:RegisterDialog( "city_spawn_ss", self.StartDialog_Spawn_SS, self )
		GM.Dialog:RegisterDialog( "city_spawn_notss", self.StartDialog_NotSS, self )
		GM.Dialog:RegisterDialog( "city_spawn_cw", self.StartDialog_Spawn_CW, self )
		GM.Dialog:RegisterDialog( "city_atplayercap", self.StartDialog_AtJobCap, self )
	end
	
	function NPCMeta:StartDialog_Spawn_SS()
		GAMEMODE.Dialog:ShowDialog()
		GAMEMODE.Dialog:SetModel( self.Model )
		GAMEMODE.Dialog:SetTitle( self.Name )
		GAMEMODE.Dialog:SetPrompt( "How can I help you?" )

		GAMEMODE.Dialog:AddOption( "I would like to spawn a government vehicle.", function()
			GAMEMODE.Net:SendNPCDialogEvent( "city_open_car_spawnmenu" )
			GAMEMODE.Dialog:HideDialog()
		end )
		GAMEMODE.Dialog:AddOption( "Never mind, I have to go.", function()
			GAMEMODE.Net:SendNPCDialogEvent( self.UID.. "_end_dialog" )
			GAMEMODE.Dialog:HideDialog()
		end )
	end

	function NPCMeta:StartDialog_NotSS()
		GAMEMODE.Dialog:ShowDialog()
		GAMEMODE.Dialog:SetModel( self.Model )
		GAMEMODE.Dialog:SetTitle( self.Name )
		GAMEMODE.Dialog:SetPrompt( "How can I help you?" )

		GAMEMODE.Dialog:AddOption( "I would like to become a city worker.", function()
			GAMEMODE.Net:SendNPCDialogEvent( "city_worker_become" )
			GAMEMODE.Dialog:HideDialog()
		end )

		GAMEMODE.Dialog:AddOption( "Never mind, I have to go.", function()
			GAMEMODE.Net:SendNPCDialogEvent( self.UID.. "_end_dialog" )
			GAMEMODE.Dialog:HideDialog()
		end )
	end

	function NPCMeta:StartDialog_Spawn_CW()
		GAMEMODE.Dialog:ShowDialog()
		GAMEMODE.Dialog:SetModel( self.Model )
		GAMEMODE.Dialog:SetTitle( self.Name )
		GAMEMODE.Dialog:SetPrompt( "How can I help you?" )

		GAMEMODE.Dialog:AddOption( "I would like to spawn my city utility truck.", function()
			GAMEMODE.Net:SendNPCDialogEvent( "city_worker_spawn_van" )
			GAMEMODE.Dialog:HideDialog()
		end )
		GAMEMODE.Dialog:AddOption( "I would like to store my city utility truck.", function()
			GAMEMODE.Net:SendNPCDialogEvent( "city_worker_stow_van" )
			GAMEMODE.Dialog:HideDialog()
		end )
		GAMEMODE.Dialog:AddOption( "I would like to quit my job.", function()
			GAMEMODE.Net:SendNPCDialogEvent( "city_worker_quit" )
			GAMEMODE.Dialog:HideDialog()
		end )
		GAMEMODE.Dialog:AddOption( "Never mind, I have to go.", function()
			GAMEMODE.Net:SendNPCDialogEvent( self.UID.. "_end_dialog" )
			GAMEMODE.Dialog:HideDialog()
		end )
	end

	function NPCMeta:StartDialog_AtJobCap()
		GAMEMODE.Dialog:ShowDialog()
		GAMEMODE.Dialog:SetModel( self.Model )
		GAMEMODE.Dialog:SetTitle( self.Name )
		GAMEMODE.Dialog:SetPrompt( "Sorry, we are not currently hiring." )

		GAMEMODE.Dialog:AddOption( "Oh, alright then...", function()
			GAMEMODE.Net:SendNPCDialogEvent( self.UID.. "_end_dialog" )
			GAMEMODE.Dialog:HideDialog()
		end )
	end
end

GM.NPC:Register( NPCMeta )
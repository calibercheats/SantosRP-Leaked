
-----------------------------------------------------
--[[
	Name: firefighter.lua
	For: SantosRP
	By: Ultra
]]--

GM.ChatRadio:RegisterChannel( 3, "Fire", false )
GM.ChatRadio:RegisterChannel( 4, "Fire Encrypted", true )

local Job = {}
Job.ID = 4
Job.HasMasterKeys = true
Job.Receives911Messages = true
Job.Enum = "JOB_FIREFIGHTER"
Job.TeamColor = Color( 255, 100, 160, 255 )
Job.Name = "Firefighter"
Job.WhitelistName = "firefighter"
Job.PlayerModel = {
	Male_Fallback = "models/player/portal/male_07_fireman.mdl",
	Female_Fallback = "models/player/portal/male_07_fireman.mdl",
	
	Male = {
		["male_01"] = "models/player/portal/male_01_fireman.mdl",
		["male_02"] = "models/player/portal/male_02_fireman.mdl",
		["male_03"] = "models/player/portal/male_03_fireman.mdl",
		["male_04"] = "models/player/portal/male_04_fireman.mdl",
		["male_05"] = "models/player/portal/male_05_fireman.mdl",
		["male_06"] = "models/player/portal/male_06_fireman.mdl",
		["male_07"] = "models/player/portal/male_07_fireman.mdl",
		["male_08"] = "models/player/portal/male_08_fireman.mdl",
		["male_09"] = "models/player/portal/male_09_fireman.mdl",
	},
	Female = {
		["female_01"] = "models/player/portal/male_02_fireman.mdl",
		["female_02"] = "models/player/portal/male_02_fireman.mdl",
		["female_03"] = "models/player/portal/male_02_fireman.mdl",
		["female_04"] = "models/player/portal/male_04_fireman.mdl",
		["female_05"] = "models/player/portal/male_05_fireman.mdl",
		["female_06"] = "models/player/portal/male_06_fireman.mdl",
		["female_07"] = "models/player/portal/male_07_fireman.mdl",
		["female_08"] = "models/player/portal/male_08_fireman.mdl",
		["female_09"] = "models/player/portal/male_09_fireman.mdl",
	},
}
Job.Pay = {
	{ PlayTime = 0, Pay = 90 },
	{ PlayTime = 12 *(60 *60), Pay = 140 },
	{ PlayTime = 24 *(60 *60), Pay = 195 },
	{ PlayTime = 48 *(60 *60), Pay = 250 },
	{ PlayTime = 96 *(60 *60), Pay = 300 },
	{ PlayTime = 192 *(60 *60), Pay = 350 },
}
Job.PlayerCap = GM.Config.Job_Fire_PlayerCap or { Min = 2, MinStart = 8, Max = 6, MaxEnd = 60 }
Job.HasChatRadio = true
Job.DefaultChatRadioChannel = 3
Job.ChannelKeys = {
	[2] = true, --Police Encrypted
	[4] = true, --Fire Encrypted
	[6] = true, --EMS Encrypted
}
Job.ParkingGaragePos = GM.Config.FireParkingZone
Job.CarSpawns = GM.Config.FireCarSpawns
Job.FiretruckID = "fire_truck"
Job.FirstRespondID = "fire_first"

function Job:OnPlayerJoinJob( pPlayer )
end

function Job:OnPlayerQuitJob( pPlayer )
	pPlayer.m_intSelectedJobModelSkin = nil
	pPlayer.m_tblSelectedJobModelBGroups = nil

	local curCar = GAMEMODE.Cars:GetCurrentPlayerCar( pPlayer )
	if curCar and curCar.Job and curCar.Job == JOB_FIREFIGHTER then
		curCar:Remove()
	end
end

function Job:GetPlayerModel( pPlayer )
	local valid, mdl = GAMEMODE.Util:FaceMatchPlayerModel(
		GAMEMODE.Player:GetGameVar( "char_model_base", "" ),
		GAMEMODE.Player:GetSharedGameVar( pPlayer, "char_sex", GAMEMODE.Char.SEX_MALE ) == GAMEMODE.Char.SEX_MALE,
		self.PlayerModel
	)
	
	if valid then
		return mdl
	else
		if GAMEMODE.Player:GetSharedGameVar( pPlayer, "char_sex", GAMEMODE.Char.SEX_MALE ) == GAMEMODE.Char.SEX_MALE then
			return self.PlayerModel.Male_Fallback
		else
			return self.PlayerModel.Female_Fallback
		end
	end
end

GM.Jobs:Register( Job )
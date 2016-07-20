
-----------------------------------------------------
--[[
	Name: police.lua
	For: SantosRP
	By: Ultra
]]--

--Job protocols start at 50 to save space for other things in the gamemode
GM.Net:AddProtocol( "police", 51 )
GM.ChatRadio:RegisterChannel( 1, "Police", false )
GM.ChatRadio:RegisterChannel( 2, "Police Encrypted", true )

local Job = {}
Job.ID = 2
Job.Enum = "JOB_POLICE"
Job.Receives911Messages = true
Job.TeamColor = Color( 255, 0, 0, 255 )
Job.Name = "Police"
Job.WhitelistName = "police"
Job.PlayerModel = {
	Male_Fallback = "models/player/santosrp/Male_02_santosrp.mdl",
	Female_Fallback = "models/portal/player/female_police02.mdl",

	Male = {
		["male_01"] = "models/player/santosrp/male_01_santosrp.mdl",
		["male_02"] = "models/player/santosrp/Male_02_santosrp.mdl",
		["male_03"] = "models/player/santosrp/Male_03_santosrp.mdl",
		["male_04"] = "models/player/santosrp/Male_04_santosrp.mdl",
		["male_05"] = "models/player/santosrp/Male_05_santosrp.mdl",
		["male_06"] = "models/player/santosrp/Male_06_santosrp.mdl",
		["male_07"] = "models/player/santosrp/Male_07_santosrp.mdl",
		["male_08"] = "models/player/santosrp/Male_08_santosrp.mdl",
		["male_09"] = "models/player/santosrp/Male_09_santosrp.mdl",
	},
	Female = {
		["female_01"] = "models/portal/player/female_police02.mdl",
	},
}
Job.ClothingLockerExtraModels = {
	["pmc_swat"] = {
		Male_Fallback = "models/player/urban.mdl", --"models/player/pmc_4/pmc__11.mdl",
		Female_Fallback = "models/player/urban.mdl", --"models/player/pmc_4/pmc__11.mdl",

		Male = {},
		Female = {},
	},
}
Job.CanWearCivClothing = true
Job.Pay = {
	{ PlayTime = 0, Pay = 115 },
	{ PlayTime = 12 *(60 *60), Pay = 130 },
	{ PlayTime = 48 *(60 *60), Pay = 185 },
	{ PlayTime = 96 *(60 *60), Pay = 260 },
	{ PlayTime = 192 *(60 *60), Pay = 325 },
	{ PlayTime = 384 *(60 *60), Pay = 420 },
}
Job.PlayerCap = GM.Config.Job_Police_PlayerCap or { Min = 2, MinStart = 8, Max = 6, MaxEnd = 60 }
Job.HasChatRadio = true
Job.DefaultChatRadioChannel = 1
Job.ChannelKeys = {
--	[2] = true, --Police Encryptedx
	[4] = true, --Fire Encrypted
	[6] = true, --EMS Encrypted
}
Job.PoliceGaragePos = GM.Config.CopParkingZone
Job.CarSpawns = GM.Config.CopCarSpawns

function Job:OnPlayerJoinJob( pPlayer )
end

function Job:OnPlayerQuitJob( pPlayer )
end

function Job:GetPlayerModel( pPlayer, bUnModified )
	if pPlayer.m_bJobCivModelOverload and not bUnModified then
		return GAMEMODE.Jobs:GetJobByID( JOB_CIVILIAN ):GetPlayerModel( pPlayer )
	end

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

function GM.Net:RequestSpawnCopCar( strJobCarID, colColor, intSkin, tblBodygroups )
	self:NewEvent( "police", "sp_c" )
		net.WriteString( strJobCarID )
		net.WriteColor( colColor or Color(255, 255, 255, 255) )
		net.WriteUInt( intSkin or 0, 8 )
		net.WriteTable( tblBodygroups or {} )
	self:FireEvent()
end

function GM.Net:RequestStowCopCar()
	self:NewEvent( "police", "st" )
	self:FireEvent()
end

GM.Jobs:Register( Job )
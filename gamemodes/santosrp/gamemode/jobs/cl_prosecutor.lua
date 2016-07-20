
-----------------------------------------------------
--[[
	Name: prosecutor.lua
	For: SantosRP
	By: Ultra
]]--

local Job = {}
Job.ID = 11
Job.Enum = "JOB_PROSECUTOR"
Job.TeamColor = Color( 255, 100, 160, 255 )
Job.Name = "Prosecutor"
Job.WhitelistName = "Prosecutor"
Job.Pay = {
	{ PlayTime = 0, Pay = 180 },
	{ PlayTime = 12 *(60 *60), Pay = 220 },
	{ PlayTime = 24 *(60 *60), Pay = 240 },
	{ PlayTime = 48 *(60 *60), Pay = 280 },
	{ PlayTime = 96 *(60 *60), Pay = 320 },
}
Job.PlayerCap = GM.Config.Job_Prosecutor_PlayerCap or { Min = 2, MinStart = 8, Max = 6, MaxEnd = 60 }

function Job:OnPlayerJoinJob( pPlayer )
end

function Job:OnPlayerQuitJob( pPlayer )
end

GM.Jobs:Register( Job )
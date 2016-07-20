
-----------------------------------------------------
--[[
	Name: lawyer.lua
	For: SantosRP
	By: Ultra
]]--

local Job = {}
Job.ID = 10
Job.Enum = "JOB_LAWYER"
Job.TeamColor = Color( 255, 100, 160, 255 )
Job.Name = "Lawyer"
Job.WhitelistName = "lawyer"
Job.Pay = {
	{ PlayTime = 0, Pay = 180 },
	{ PlayTime = 12 *(60 *60), Pay = 280 },
	{ PlayTime = 24 *(60 *60), Pay = 375 },
	{ PlayTime = 48 *(60 *60), Pay = 450 },
	{ PlayTime = 96 *(60 *60), Pay = 550 },
}
Job.PlayerCap = GM.Config.Job_Lawyer_PlayerCap or { Min = 2, MinStart = 8, Max = 6, MaxEnd = 60 }

function Job:OnPlayerJoinJob( pPlayer )
end

function Job:OnPlayerQuitJob( pPlayer )
end

GM.Jobs:Register( Job )
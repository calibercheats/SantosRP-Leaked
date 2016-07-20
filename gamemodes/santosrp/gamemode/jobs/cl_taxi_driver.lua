
-----------------------------------------------------
--[[
	Name: taxi_driver.lua
	For: SantosRP
	By: Ultra
]]--

GM.ChatRadio:RegisterChannel( 8, "Taxi Services", false )

local Job = {}
Job.ID = 5
Job.Enum = "JOB_TAXI"
Job.TeamColor = Color( 255, 100, 160, 255 )
Job.Name = "Taxi Driver"
Job.ParkingGaragePos = GM.Config.TaxiParkingZone
Job.Pay = {
	{ PlayTime = 0, Pay = 30 },
	{ PlayTime = 4 *(60 *60), Pay = 45 },
	{ PlayTime = 12 *(60 *60), Pay = 75 },
	{ PlayTime = 24 *(60 *60), Pay = 90 },
}
Job.PlayerCap = GM.Config.Job_Taxi_PlayerCap or { Min = 2, MinStart = 8, Max = 6, MaxEnd = 60 }
Job.HasChatRadio = true
Job.DefaultChatRadioChannel = 8
Job.ChannelKeys = {}
Job.CarSpawns = GM.Config.TaxiCarSpawns
Job.TaxiID = "taxi_cab"
Job.TaxiChargeAmount = 10
Job.TaxiChargeInterval = 10

function Job:OnPlayerJoinJob( pPlayer )
end

function Job:OnPlayerQuitJob( pPlayer )
end

GM.Jobs:Register( Job )
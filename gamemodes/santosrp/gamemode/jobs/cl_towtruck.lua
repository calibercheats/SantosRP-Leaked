
-----------------------------------------------------
--[[
	Name: towtruck.lua
	For: SantosRP
	By: Ultra
]]--

GM.ChatRadio:RegisterChannel( 7, "Tow Services", false )

local Job = {}
Job.ID = 6
Job.Enum = "JOB_TOW"
Job.TeamColor = Color( 255, 100, 160, 255 )
Job.Name = "Tow Truck Driver"
Job.Pay = {
	{ PlayTime = 0, Pay = 35 },
	{ PlayTime = 4 *(60 *60), Pay = 45 },
	{ PlayTime = 12 *(60 *60), Pay = 60 },
	{ PlayTime = 24 *(60 *60), Pay = 85 },
}
Job.PlayerCap = GM.Config.Job_Tow_PlayerCap or { Min = 2, MinStart = 8, Max = 6, MaxEnd = 60 }
Job.HasChatRadio = true
Job.DefaultChatRadioChannel = 7
Job.ChannelKeys = {}
Job.ParkingLotPos = GM.Config.TowParkingZone
Job.TruckSpawns = GM.Config.TowCarSpawns
Job.TruckID = "tow_truck"
Job.FlatbedID = "tow_flatbed"

function Job:OnPlayerJoinJob( pPlayer )
end

function Job:OnPlayerQuitJob( pPlayer )
end

GM.Jobs:Register( Job )
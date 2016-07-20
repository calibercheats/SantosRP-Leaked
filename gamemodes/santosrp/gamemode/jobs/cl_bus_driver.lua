
-----------------------------------------------------
--[[
	Name: cl_bus_driver.lua
	For: SantosRP
	By: Ultra
]]--

GM.ChatRadio:RegisterChannel( 9, "City Bus Services", false )

local Job = {}
Job.ID = 9
Job.Enum = "JOB_BUS_DRIVER"
Job.TeamColor = Color( 255, 100, 160, 255 )
Job.Name = "Bus Driver"
Job.ParkingGaragePos = GM.Config.BusParkingZone
Job.Pay = {
	{ PlayTime = 0, Pay = 30 },
	{ PlayTime = 4 *(60 *60), Pay = 45 },
	{ PlayTime = 12 *(60 *60), Pay = 70 },
	{ PlayTime = 24 *(60 *60), Pay = 100 },
	{ PlayTime = 48 *(60 *60), Pay = 140 },
}
Job.PlayerCap = GM.Config.Job_BusDriver_PlayerCap or { Min = 2, MinStart = 8, Max = 6, MaxEnd = 60 }
Job.HasChatRadio = true
Job.DefaultChatRadioChannel = 9
Job.ChannelKeys = {}
Job.CarSpawns = GM.Config.BusCarSpawns
Job.BusID = "mtl_bus"
Job.BusChargeAmount = 50

function Job:OnPlayerJoinJob( pPlayer )
end

function Job:OnPlayerQuitJob( pPlayer )
	local curCar = GAMEMODE.Cars:GetCurrentPlayerCar( pPlayer )
	if curCar and curCar.Job and curCar.Job == JOB_BUS_DRIVER then
		curCar:Remove()
	end
end

GM.Jobs:Register( Job )
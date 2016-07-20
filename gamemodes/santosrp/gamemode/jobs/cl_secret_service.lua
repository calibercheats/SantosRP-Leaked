
-----------------------------------------------------
--[[
	Name: secret_service.lua
	For: SantosRP
	By: Ultra
]]--

local Job = {}
Job.ID = 13
Job.Enum = "JOB_SSERVICE"
Job.TeamColor = Color( 255, 100, 160, 255 )
Job.Name = "Secret Service"
Job.Pay = {
	{ PlayTime = 0, Pay = 100 },
	{ PlayTime = 4 *(60 *60), Pay = 125 },
	{ PlayTime = 12 *(60 *60), Pay = 185 },
	{ PlayTime = 24 *(60 *60), Pay = 250 },
	{ PlayTime = 48 *(60 *60), Pay = 300 },
}
Job.PlayerCap = GM.Config.Job_SService_PlayerCap or { Min = 2, MinStart = 8, Max = 6, MaxEnd = 60 }
Job.HasChatRadio = false
Job.DefaultChatRadioChannel = 10
Job.ChannelKeys = {
	[10] = false,
}
Job.PendingPlayerApps = {}
Job.SSGaragePos = GM.Config.SSParkingZone
Job.CarSpawns = GM.Config.SSCarSpawns

function Job:OnPlayerJoinJob( pPlayer )
end

function Job:OnPlayerQuitJob( pPlayer )
end

GM.Net:RegisterEventHandle( "mayor", "upd_ss_app", function( intMsgLen, pPlayer )
	local num = net.ReadUInt( 8 )
	local apps = {}

	if num > 0 then
		for i = 1, num do
			apps[net.ReadEntity()] = true
		end
	end

	GAMEMODE.m_tblSSApps = apps
	hook.Call( "GamemodeOnGetSSApps", GAMEMODE, apps )
end )

function GM.Net:RequestApproveSSApp( pPlayer )
	self:NewEvent( "mayor", "ss_apr" )
		net.WriteEntity( pPlayer )
	self:FireEvent()
end

function GM.Net:RequestDenySSApp( pPlayer )
	self:NewEvent( "mayor", "ss_dny" )
		net.WriteEntity( pPlayer )
	self:FireEvent()
end

function GM.Net:RequestFireSS( pPlayer )
	self:NewEvent( "mayor", "ss_fire" )
		net.WriteEntity( pPlayer )
	self:FireEvent()
end

function GM.Net:RequestSpawnSSCar( strJobCarID, colColor, intSkin, tblBodygroups )
	self:NewEvent( "mayor", "ss_sp_c" )
		net.WriteString( strJobCarID )
		net.WriteColor( colColor or Color(255, 255, 255, 255) )
		net.WriteUInt( intSkin or 0, 8 )
		net.WriteTable( tblBodygroups or {} )
	self:FireEvent()
end

function GM.Net:RequestStowSSCar()
	self:NewEvent( "mayor", "ss_st" )
	self:FireEvent()
end

GM.Jobs:Register( Job )
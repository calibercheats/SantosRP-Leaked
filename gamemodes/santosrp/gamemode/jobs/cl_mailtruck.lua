
-----------------------------------------------------
--[[
	Name: mailtruck.lua
	For: SantosRP
	By: Ultra
]]--

local Job = {}
Job.ID = 7
Job.Enum = "JOB_MAIL"
Job.TeamColor = Color( 255, 100, 160, 255 )
Job.Name = "Mail Truck Driver"
Job.Pay = {
	{ PlayTime = 0, Pay = 20 },
	{ PlayTime = 4 *(60 *60), Pay = 30 },
	{ PlayTime = 12 *(60 *60), Pay = 50 },
	{ PlayTime = 24 *(60 *60), Pay = 70 },
}
Job.PlayerCap = GM.Config.Job_MailTruck_PlayerCap or { Min = 2, MinStart = 8, Max = 6, MaxEnd = 60 }
Job.TruckID = "mail_truck"
Job.MAX_BOXES = 10
Job.m_vecMailDepot = GM.Config.MailDepotPos
Job.ParkingLotPos = GM.Config.MailParkingZone
Job.TruckSpawns = GM.Config.MailCarSpawns
Job.m_tblMailPoints = GM.Config.MailPoints

function Job:OnPlayerJoinJob( pPlayer )
end

function Job:OnPlayerQuitJob( pPlayer )
	local curCar = GAMEMODE.Cars:GetCurrentPlayerCar( pPlayer )
	if curCar and curCar.Job and curCar.Job == JOB_MAIL then
		curCar:Remove()
	end
end

hook.Add( "PostDrawTranslucentRenderables", "DrawMailJob", function()
	if GAMEMODE.Jobs:GetPlayerJobID( LocalPlayer() ) ~= JOB_MAIL then return end
	local veh = GAMEMODE.Cars:GetCurrentPlayerCar( LocalPlayer() )
	local eye = LocalPlayer():EyeAngles()
	local Ang = Angle( 0, EyeAngles().y -90, 90 )

	--Draw mail depot
	cam.Start3D2D( Job.m_vecMailDepot +Vector(0, 0, 128 +math.sin(CurTime()) *2), Ang, 0.25 )
		draw.WordBox(2, -60, 0, "Mail Depot", "handcuffTextSmall", Color(0, 140, 0, 150), Color(255,255,255,255))
		draw.SimpleText( "Drive here to load boxes onto your truck", "handcuffTextSmall", 0, 45, color_white, 1, 1 )
	cam.End3D2D()

	if not IsValid( veh ) then return end
	if veh:GetNWInt( "dest" ) == -1 then return end
	--Draw current destination
	
	local dest = Job.m_tblMailPoints[veh:GetNWInt("dest")]
	if not dest then return end
	cam.Start3D2D( dest.Pos +Vector(0, 0, 32 +math.sin(CurTime()) *2), Ang, 0.25 )
		draw.WordBox(2, -60, 0, "Delivery Point", "handcuffTextSmall", Color(0, 140, 0, 150), Color(255,255,255,255))
		draw.SimpleText( "Drop a package here to complete this delivery", "handcuffTextSmall", 0, 45, color_white, 1, 1 )
	cam.End3D2D()
end )

hook.Add( "HUDPaint", "DrawMailJob", function()
	if GAMEMODE.Jobs:GetPlayerJobID( LocalPlayer() ) ~= JOB_MAIL then return end
	local veh = GAMEMODE.Cars:GetCurrentPlayerCar( LocalPlayer() )
	if not IsValid( veh ) then return end
	local dest = Job.m_tblMailPoints[veh:GetNWInt("dest", -1)]
	
	draw.SimpleTextOutlined(
		"Packages Remaining: ".. veh:GetNWInt( "boxes" ),
		"handcuffTextSmall",
		5,
		5,
		color_white,
		TEXT_ALIGN_LEFT,
		TEXT_ALIGN_LEFT,
		1,
		Color( 0, 0, 0, 255 )
	)

	if dest then
		draw.SimpleTextOutlined(
			"Delivery Destination: ".. dest.Name,
			"handcuffTextSmall",
			5,
			30,
			color_white,
			TEXT_ALIGN_LEFT,
			TEXT_ALIGN_LEFT,
			1,
			Color( 0, 0, 0, 255 )
		)
	end
end )

GM.Jobs:Register( Job )
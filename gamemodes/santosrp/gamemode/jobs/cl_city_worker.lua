
-----------------------------------------------------
--[[
	Name: sv_city_worker.lua
	For: SantosRP
	By: Ultra
]]--

local Job = {}
Job.ID = 14
Job.Enum = "JOB_CITYWORKER"
Job.TeamColor = Color( 255, 100, 160, 255 )
Job.Name = "City Worker"
Job.Pay = {
	{ PlayTime = 0, Pay = 25 },
	{ PlayTime = 4 *(60 *60), Pay = 35 },
	{ PlayTime = 12 *(60 *60), Pay = 50 },
	{ PlayTime = 24 *(60 *60), Pay = 80 },
	{ PlayTime = 48 *(60 *60), Pay = 100 },
}
Job.PlayerCap = GM.Config.Job_CityWorker_PlayerCap or { Min = 2, MinStart = 8, Max = 6, MaxEnd = 60 }
Job.CarID = "city_van"
Job.ParkingLotPos = GM.Config.CityWorkerParkingZone
Job.CarSpawns = GM.Config.CityWorkerCarSpawns

Job.VanItems = {
	["Adjustable Wrench"] = 1,
	["Shovel"] = 1,
	["Lawn Mower"] = 1,
	["City Issue Traffic Cone"] = 10,
	["City Issue Traffic Barrel"] = 10,
}

function Job:OnPlayerJoinJob( pPlayer )
end

function Job:OnPlayerQuitJob( pPlayer )
end

hook.Add( "GamemodeDefineGameVars", "DefineCityWorkerVars", function( pPlayer )
	GAMEMODE.Player:DefineGameVar( "cwork_dest", "", "String", true )
	GAMEMODE.Player:DefineGameVar( "cwork_type", "", "String", true )
end )

local MAT_WORKICON = Material( "icon16/money.png", "" )
hook.Add( "HUDPaint", "DrawCityWorkerJob", function()
	if GAMEMODE.Jobs:GetPlayerJobID( LocalPlayer() ) ~= JOB_CITYWORKER then return end
	if GAMEMODE.Player:GetGameVar( "cwork_type", "" ) == "" then return end
	
	local type = GAMEMODE.Player:GetGameVar( "cwork_type", "" )
	if type == "broken_hydrant" then
		local pos = Vector( GAMEMODE.Player:GetGameVar("cwork_dest", "0 0 0") )
		if not pos then return end
		
		pos = (pos +Vector(0, 0, 8)):ToScreen()
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.SetMaterial( MAT_WORKICON )
		surface.DrawTexturedRect( pos.x, pos.y, 16, 16 )

		draw.SimpleTextOutlined(
			"Fix the leaking fire hydrant",
			"Trebuchet18",
			pos.x,
			pos.y +18,
			Color( 240, 240, 240, 255 ),
			TEXT_ALIGN_CENTER,
			TEXT_ALIGN_TOP,
			1,
			Color( 0, 0, 0, 255 )
		)			
	elseif type == "mow_grass" then
		local mowArea = GAMEMODE.Player:GetGameVar( "cwork_dest", "" )
		if mowArea == "" then return end
		
		local data
		for k, v in pairs( GAMEMODE.Config.MowableGrassZones ) do
			if v.Name == mowArea then data = v break end
		end
		if not data then return end
		
		--find nearest hint pos
		local cur
		for k, v in pairs( data.WorldHintPos ) do
			if not cur then cur = v continue end
			if cur:Distance( LocalPlayer():GetPos() ) > v:Distance( LocalPlayer():GetPos() ) then
				cur = v
			end
		end
		if not cur then return end
		
		local pos = cur:ToScreen()
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.SetMaterial( MAT_WORKICON )
		surface.DrawTexturedRect( pos.x, pos.y, 16, 16 )

		draw.SimpleTextOutlined(
			"Mow the grass at ".. mowArea,
			"Trebuchet18",
			pos.x,
			pos.y +18,
			Color( 240, 240, 240, 255 ),
			TEXT_ALIGN_CENTER,
			TEXT_ALIGN_TOP,
			1,
			Color( 0, 0, 0, 255 )
		)
	elseif type == "road_debris" then
		local pos = Vector( GAMEMODE.Player:GetGameVar("cwork_dest", "0 0 0") )
		if not pos then return end
		
		pos = (pos +Vector(0, 0, 8)):ToScreen()
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.SetMaterial( MAT_WORKICON )
		surface.DrawTexturedRect( pos.x, pos.y, 16, 16 )

		draw.SimpleTextOutlined(
			"Clear the road of debris",
			"Trebuchet18",
			pos.x,
			pos.y +18,
			Color( 240, 240, 240, 255 ),
			TEXT_ALIGN_CENTER,
			TEXT_ALIGN_TOP,
			1,
			Color( 0, 0, 0, 255 )
		)				
	end
end )

function GM.Net:CityWorker_RequestMoveJobItemFromVan( entVan, strItemID, intAmount )
	self:NewEvent( "ent", "cwork_van_take" )
		net.WriteEntity( entVan )
		net.WriteString( strItemID )
		net.WriteUInt( intAmount, 16 )
	self:FireEvent()
end

function GM.Net:CityWorker_RequestMoveJobItemToVan( entVan, strItemID, intAmount )
	self:NewEvent( "ent", "cwork_van_add" )
		net.WriteEntity( entVan )
		net.WriteString( strItemID )
		net.WriteUInt( intAmount, 16 )
	self:FireEvent()
end

GM.Net:RegisterEventHandle( "ent", "cwork_van_upd", function( intMsgLen, pPlayer )
	hook.Call( "GamemodeRefreshCityWorkVanMenu", GAMEMODE )
end )

GM.Jobs:Register( Job )
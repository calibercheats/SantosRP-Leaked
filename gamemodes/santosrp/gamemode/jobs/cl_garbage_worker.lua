
-----------------------------------------------------
--[[
	Name: garbage_worker.lua
	For: SantosRP
	By: Ultra

	Note: Lots of the code for this job is modified/fixed up code from the garbage truck addon itself
	note server copy of sw_garbagetruck
]]--

local Job = {}
Job.ID = 15
Job.Enum = "JOB_GARBWORKER"
Job.TeamColor = Color( 255, 100, 160, 255 )
Job.Name = "Sanitation Worker"
Job.Pay = {
	{ PlayTime = 0, Pay = 25 },
	{ PlayTime = 4 *(60 *60), Pay = 35 },
	{ PlayTime = 12 *(60 *60), Pay = 50 },
	{ PlayTime = 24 *(60 *60), Pay = 120 },
}
Job.PayPerLoad = 75
Job.PlayerCap = GM.Config.Job_GarbageWorker_PlayerCap or { Min = 2, MinStart = 8, Max = 6, MaxEnd = 60 }
Job.CarID = "garbage_truck"
Job.ParkingLotPos = GM.Config.GarbageWorkerParkingZone
Job.CarSpawns = GM.Config.GarbageWorkerCarSpawns
Job.TruckVolume = 5000 *4
Job.TruckFxPos = Vector( -5.698053, -154, 80.042198 )
Job.FxSounds = {
	"ambient/materials/cupdrop.wav",
	"ambient/materials/platedrop3.wav",
	"ambient/materials/platedrop2.wav",
	"ambient/materials/platedrop1.wav",
	"ambient/materials/cartrap_rope3.wav",
	"ambient/materials/cartrap_rope2.wav",
	"ambient/materials/cartrap_rope1.wav",
	"ambient/materials/rock1.wav",
	"ambient/materials/rock2.wav",
	"ambient/materials/rock3.wav",
	"physics/glass/glass_bottle_break1.wav",
	"physics/glass/glass_bottle_break2.wav",
	"physics/wood/wood_box_break1.wav",
	"physics/wood/wood_box_break2.wav",
	"physics/plastic/plastic_barrel_break2.wav",
	"physics/plastic/plastic_barrel_break1.wav",
	"physics/cardboard/cardboard_box_break1.wav",
	"physics/cardboard/cardboard_box_break2.wav",
}

function Job:OnPlayerJoinJob( pPlayer )
end

function Job:OnPlayerQuitJob( pPlayer )
end

local TEX_GRADIENT_LEFT	= surface.GetTextureID( "gui/gradient" )
local TEX_GRADIENT_DOWN = surface.GetTextureID( "gui/gradient_down" )
local MAT_INCIN_ICON = Material( "icon16/lorry_go.png", "" )
local colBg = Color( 40, 40, 40, 255 )
local colBar = Color( 100, 60, 60, 255 )
local hint

hook.Add( "HUDPaint", "GarbageJobHUD", function()
	if GAMEMODE.Jobs:GetPlayerJobID( LocalPlayer() ) ~= JOB_GARBWORKER then return end
	local truck = LocalPlayer():GetVehicle()
	if not IsValid( truck ) then return end

	local frac = math.Clamp( truck:GetNWInt("GarbVolume", 0) /Job.TruckVolume, 0, 1 )
	local wide, tall = 300, 20
	local x, y = ScrW() -325, ScrH() -280

	surface.SetDrawColor( colBg )
	surface.DrawRect( x +1, y +1, wide -2, tall -2 )

	if (wide -2) *frac > 0 then
		surface.SetDrawColor( colBar )
		surface.DrawRect( x +1, y +1, (wide -2) *frac, tall -2 )

		surface.SetTexture( TEX_GRADIENT_DOWN )
		surface.SetDrawColor(
			math.max( 0, colBar.r -100 ),
			math.max( 0, colBar.g -100 ),
			math.max( 0, colBar.b -100 ),
			255
		)

		local half = (tall -2) /2 -1
		surface.DrawTexturedRect( x +1, y +1, (wide -2) *frac, half )
		surface.DrawTexturedRectRotated( x +1 +((wide -1) *frac) /2, y +tall -(half /2), (wide -2) *frac, half, 180 )
	end

	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawRect( x, y, wide, 1 ) --top
	surface.DrawRect( x, y, 1, tall ) --left side

	surface.DrawRect( x +wide -1, y, 1, tall ) --right side
	surface.DrawRect( x, y +tall -1, wide, 1 ) --bottom

	draw.SimpleText(
		"Garbage Volume: ".. truck:GetNWInt("GarbVolume", 0).. "/".. Job.TruckVolume,
		"Trebuchet18",
		x +5,
		y +1,
		color_white,
		TEXT_ALIGN_LEFT,
		TEXT_ALIGN_TOP
	)

	if frac >= 1 then
		if not hint and GAMEMODE.Config.GarbageWorkerDumpPos:Distance( LocalPlayer():GetPos() ) <= 400 then
			hint = true
			GAMEMODE.HUD:AddNote( "Back up to the incinerator and hold right click to empty your tuck.", NOTIFY_HINT, 10 )
		end

		local pos = GAMEMODE.Config.GarbageWorkerDumpPos:ToScreen()
		local iconSize = 16
		surface.SetMaterial( MAT_INCIN_ICON )
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.DrawTexturedRect( pos.x -(iconSize /2), pos.y -iconSize, iconSize, iconSize )

		draw.SimpleText(
			"Return to the incinerator!",
			"Trebuchet24",
			pos.x,
			pos.y,
			color_white,
			TEXT_ALIGN_CENTER,
			TEXT_ALIGN_TOP
		)

		local num, unit = GAMEMODE.Util:ConvertUnitsToM( GAMEMODE.Config.GarbageWorkerDumpPos:Distance(LocalPlayer():GetPos()) )
		draw.SimpleText(
			num.. unit,
			"Trebuchet24",
			pos.x,
			pos.y +18,
			color_white,
			TEXT_ALIGN_CENTER,
			TEXT_ALIGN_TOP
		)
	else
		hint = false
	end
end )

GM.Jobs:Register( Job )
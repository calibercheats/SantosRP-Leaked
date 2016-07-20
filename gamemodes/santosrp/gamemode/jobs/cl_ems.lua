
-----------------------------------------------------
--[[
	Name: ems.lua
	For: SantosRP
	By: Ultra
]]--

--Job protocols start at 50 to save space for other things in the gamemode
GM.Net:AddProtocol( "ems", 53 )

GM.ChatRadio:RegisterChannel( 5, "EMS", false )
GM.ChatRadio:RegisterChannel( 6, "EMS Encrypted", true )

local Job = {}
Job.ID = 3
Job.HasMasterKeys = true
Job.Receives911Messages = true
Job.Enum = "JOB_EMS"
Job.TeamColor = Color( 255, 100, 160, 255 )
Job.Name = "Paramedic"
Job.WhitelistName = "paramedic"
Job.PlayerModel = {
	Male_Fallback = "models/player/portal/male_09_medic.mdl",
	Female_Fallback = "models/player/portal/male_09_medic.mdl",
	
	Male = {
		["male_01"] = "models/player/portal/male_01_medic.mdl",
		["male_02"] = "models/player/portal/male_02_medic.mdl",
		["male_03"] = "models/player/portal/male_03_medic.mdl",
		["male_04"] = "models/player/portal/male_04_medic.mdl",
		["male_05"] = "models/player/portal/male_05_medic.mdl",
		["male_06"] = "models/player/portal/male_06_medic.mdl",
		["male_07"] = "models/player/portal/male_07_medic.mdl",
		["male_08"] = "models/player/portal/male_08_medic.mdl",
		["male_09"] = "models/player/portal/male_09_medic.mdl",
	},
	Female = {
		["female_01"] = "models/player/portal/male_02_medic.mdl",
		["female_02"] = "models/player/portal/male_02_medic.mdl",
		["female_03"] = "models/player/portal/male_02_medic.mdl",
		["female_04"] = "models/player/portal/male_04_medic.mdl",
		["female_05"] = "models/player/portal/male_05_medic.mdl",
		["female_06"] = "models/player/portal/male_06_medic.mdl",
		["female_07"] = "models/player/portal/male_07_medic.mdl",
		["female_08"] = "models/player/portal/male_08_medic.mdl",
		["female_09"] = "models/player/portal/male_09_medic.mdl",
	},
}
Job.Pay = {
	{ PlayTime = 0, Pay = 130 },
	{ PlayTime = 4 *(60 *60), Pay = 140 },
	{ PlayTime = 12 *(60 *60), Pay = 150 },
	{ PlayTime = 24 *(60 *60), Pay = 175 },
	{ PlayTime = 48 *(60 *60), Pay = 190 },
	{ PlayTime = 96 *(60 *60), Pay = 220 },
	{ PlayTime = 192 *(60 *60), Pay = 290 },
}
Job.PlayerCap = GM.Config.Job_EMS_PlayerCap or { Min = 2, MinStart = 8, Max = 6, MaxEnd = 60 }
Job.HasChatRadio = true
Job.DefaultChatRadioChannel = 5
Job.ChannelKeys = {
	[2] = true, --Police Encrypted
	[4] = true, --Fire Encrypted
	[6] = true, --EMS Encrypted
}
Job.ParkingLotPos = GM.Config.EMSParkingZone
Job.CarSpawns = GM.Config.EMSCarSpawns
Job.FirstRespondID = "ems_firstrespond"
Job.FirstResponderID = "ford_explorer_2013_ems"
Job.AmbulanceID = "ems_ambulance"
Job.BedModel = "models/custommodels/stretcher.mdl" --"models/props_medicinalpractice/medic_stretcher_a.mdl"

function Job:OnPlayerJoinJob( pPlayer )
end

function Job:OnPlayerQuitJob( pPlayer )
	local curCar = GAMEMODE.Cars:GetCurrentPlayerCar( pPlayer )
	if curCar and curCar.Job and curCar.Job == JOB_EMS then
		curCar:Remove()
	end
end

local MAT_HEALTH_ICON = Material( "icon16/heart.png" )
hook.Add( "HUDPaint", "EMS_DrawDeadPlayers", function()
	if GAMEMODE.Jobs:GetPlayerJobID( LocalPlayer() ) ~= JOB_EMS then return end
	for k, v in pairs( player.GetAll() ) do
		if not (v:IsUncon() or not v:Alive()) or not IsValid( v:GetRagdoll() ) then continue end
		
		local pos = v:GetRagdoll():GetPos():ToScreen()
		local timeelapsed = CurTime() -(not v:Alive() and v:GetNWFloat("DeathStart") or v:GetNWFloat("StartDie"))
		draw.SimpleText(
			string.ToMinutesSeconds( (v:Alive() and 600 or 180) -timeelapsed ),
			"Trebuchet24",
			pos.x,
			pos.y,
			color_white,
			TEXT_ALIGN_CENTER,
			TEXT_ALIGN_TOP
		)
		local num, unit = GAMEMODE.Util:ConvertUnitsToM( v:GetPos():Distance(LocalPlayer():GetPos()) )
		draw.SimpleText(
			num.. unit,
			"Trebuchet24",
			pos.x,
			pos.y +18,
			color_white,
			TEXT_ALIGN_CENTER,
			TEXT_ALIGN_TOP
		)

		local iconSize = 16
		surface.SetMaterial( MAT_HEALTH_ICON )
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.DrawTexturedRect( pos.x -(iconSize /2), pos.y -iconSize, iconSize, iconSize )
	end
end )

GM.Net:RegisterEventHandle( "ems", "clip", function( intMsgLen, pPlayer )
	local about = net.ReadEntity()
	local health = net.ReadUInt( 8 )

	local limbs = {}
	for k, v in pairs( GAMEMODE.PlayerDamage:GetLimbs() ) do
		limbs[net.ReadUInt( 8 )] = {
			Health = net.ReadUInt( 8 ),
			Bleeding = net.ReadBool(),
			Broken = net.ReadBool(),
		}
	end

	local wep = LocalPlayer():GetActiveWeapon()
	if IsValid( wep ) and wep:GetClass() == "weapon_ems_clipboard" then
		wep.m_tblHealthData	= {
			Limbs = limbs,
			Health = health,
			Target = about,
		}
	end
end )

GM.Jobs:Register( Job )
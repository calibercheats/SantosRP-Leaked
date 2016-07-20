
-----------------------------------------------------
--[[
	Name: civilian.lua
	For: SantosRP
	By: Ultra
]]--

local Job = {}
Job.ID = 1
Job.Enum = "JOB_CIVILIAN"
Job.TeamColor = Color( 255, 255, 255, 255 )
Job.Name = "Civilian"
Job.Pay = {
	{ PlayTime = 0, Pay = 20 },
}

function Job:OnPlayerJoinJob( pPlayer )
end

function Job:OnPlayerQuitJob( pPlayer )
end

function Job:GetPlayerModel( pPlayer )
	local base = GAMEMODE.Player:GetGameVar( "char_model_base", nil )
	local overload = GAMEMODE.Player:GetGameVar( "char_model_overload", nil )
	
	if util.IsValidModel( overload or "" ) then
		return overload
	else
		return base
	end
end

function Job:PlayerLoadout( pPlayer )
end

GM.Jobs:Register( Job )

-----------------------------------------------------
--[[
	Name: mayor.lua
	For: SantosRP
	By: Ultra
]]--

GM.Net:AddProtocol( "mayor", 54 )
GM.ChatRadio:RegisterChannel( 10, "Secret Service", true )

local Job = {}
Job.ID = 12
Job.Enum = "JOB_MAYOR"
Job.TeamColor = Color( 255, 100, 160, 255 )
Job.Name = "Mayor"
Job.WhitelistName = "mayor"
Job.Pay = {
	{ PlayTime = 0, Pay = 180 },
	{ PlayTime = 4 *(60 *60), Pay = 250 },
	{ PlayTime = 12 *(60 *60), Pay = 300 },
	{ PlayTime = 24 *(60 *60), Pay = 390 },
}
Job.PlayerCap = { Min = 1, MinStart = 1, Max = 1, MaxEnd = 1 }
Job.HasChatRadio = true
Job.DefaultChatRadioChannel = 10
Job.ChannelKeys = {
	[10] = true,
}

function Job:OnPlayerJoinJob( pPlayer )
end

function Job:OnPlayerQuitJob( pPlayer )
end

function GM.Net:RequestUpdateTaxRate( strTaxID, intNewValue )
	self:NewEvent( "mayor", "updt" )
		net.WriteString( strTaxID )
		net.WriteFloat( intNewValue )
	self:FireEvent()
end

function GM.Net:RequestUpdateBatchedTaxRate( tblTaxes )
	self:NewEvent( "mayor", "updtb" )
		net.WriteUInt( table.Count(tblTaxes), 8 )

		for k, v in pairs( tblTaxes ) do
			net.WriteString( k )
			net.WriteFloat( v )
		end
	self:FireEvent()
end

GM.Jobs:Register( Job )
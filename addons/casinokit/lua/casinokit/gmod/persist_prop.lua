
-----------------------------------------------------
if not properties then return end

local function IsCKitPersistable(e)
	return e.CasinoKitTable or e.CasinoKitPersistable
end

properties.Add("casinokit_persist", {
	MenuLabel = "Casino Kit: Persist",
	Order = 600,
	MenuIcon = "icon16/money_add.png",

	Filter = function( self, ent, ply )
		if not IsCKitPersistable(ent) then return false end
		if ( !gamemode.Call( "CanProperty", ply, "persist", ent ) ) then return false end

		return not ent:GetNWBool("CasinoKit_Persistent")
	end,

	Action = function( self, ent )

		self:MsgStart()
			net.WriteEntity( ent )
		self:MsgEnd()

	end,

	Receive = function( self, length, player )
		local ent = net.ReadEntity()
		if ( !IsValid( ent ) ) then return end
		if ( !self:Filter( ent, player ) ) then return end

		ent:SetNWBool("CasinoKit_Persistent", true)
	end
})

properties.Add( "casinokit_persist_end", {
	MenuLabel = "Casino Kit: De-persist",
	Order = 600,
	MenuIcon = "icon16/money_delete.png",

	Filter = function( self, ent, ply )
		if not IsCKitPersistable(ent) then return false end
		if ( !gamemode.Call( "CanProperty", ply, "persist", ent ) ) then return false end

		return ent:GetNWBool("CasinoKit_Persistent")
	end,

	Action = function( self, ent )
		self:MsgStart()
			net.WriteEntity( ent )
		self:MsgEnd()
	end,

	Receive = function( self, length, player )
		local ent = net.ReadEntity()
		if ( !IsValid( ent ) ) then return end
		if ( !self:Filter( ent, player ) ) then return end

		ent:SetNWBool("CasinoKit_Persistent", false)
	end

} )

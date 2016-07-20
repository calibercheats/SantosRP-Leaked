
-----------------------------------------------------
local FixSounds = {
	["doors/wood_stop1.wav"] = true,
	["doors/door1_move.wav"] = true,
	["doors/wood_move1.wav"] = true,
}
hook.Add( "EntityEmitSound", "DoorSoundFix", function( tbl )
	if FixSounds[tbl.SoundName] then
		tbl.SoundLevel = 75
		return true
	end
end )

if SERVER then
	timer.Create( "DoorRefresh", 300, 0, function()
		for k, v in pairs( ents.GetAll() ) do
			if IsValid( v ) and v:GetClass() == "prop_door_rotating" then
				v:SetHealth( 999999999 )
			end
		end
	end )
end
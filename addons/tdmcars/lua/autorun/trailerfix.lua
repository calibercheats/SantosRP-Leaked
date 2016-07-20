
-----------------------------------------------------
hook.Add("PlayerSpawnedVehicle","BarackObama",function( ply, vehicle )
 
    if not vehicle:GetModel( ) == "models/tdmcars/trailers/*" then return end
	vehicle:Fire("HandbrakeOff", "", 0)
end)

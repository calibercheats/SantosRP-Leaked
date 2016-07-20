
-----------------------------------------------------
 if SERVER then
 hook.Add("Think", "TDMWheelBlur", function() for _, ent in pairs(ents.FindByClass("prop_vehicle_jeep*")) do
         ent: SetPoseParameter("tdm_wheel_blur", 0)
     if ent: GetVelocity(): Length() > 700 then ent: SetPoseParameter("tdm_wheel_blur", 1) end end end)
 end

if CLIENT then
surface.CreateFont( "M5SpeedoFont", {
	font = "Arial",
	size = 200,
	weight = 100,
	scanlines = 1,
	antialias = true,

} )
surface.CreateFont( "M5SpeedFont", {
	font = "Arial",
	size = 80,
	weight = 100,
	scanlines = 1,
	antialias = true,

} )
surface.CreateFont( "GhibliSpeedoFont", {
	font = "Trebuchet24",
	size = 200,
	weight = 600,
	scanlines = 1,
	antialias = true,

} )
surface.CreateFont( "LeafSpeed", {
	font = "ChatFont",
	size = 200,
	weight = 600,
	scanlines = 1,
	antialias = true,

} )
surface.CreateFont( "LeafUnit", {
	font = "DermaLarge",
	size = 30,
	weight = 600,
	scanlines = 1,
	antialias = true,

} )
end

if SERVER then return end -- this is clientsided only!
 
local lastRan = CurTime()
local speed = 0
hook.Add( "PostDrawOpaqueRenderables", "TDMDigitalSpeedo", function()
    local Vehicle = LocalPlayer():GetVehicle()
    if IsValid( Vehicle ) and Vehicle:GetClass() == "prop_vehicle_jeep" then
        if Vehicle:GetModel() == "models/tdmcars/nis_leaf.mdl" then
            if CurTime() - .4 > lastRan then
                speed = math.Round( Vehicle:GetVelocity():Length() / (63360/3600), 0 )
                lastRan = CurTime()
			end
            cam.Start3D2D(Vehicle:LocalToWorld(Vector(-15.58,44.2,50.5)),Vehicle:LocalToWorldAngles(Angle(0,0,30)),0.012)
                surface.SetDrawColor( 255, 255, 255 )
				draw.SimpleText( speed , "LeafSpeed", 50, -10, Color(255,255,255), TEXT_ALIGN_RIGHT, 0)
				draw.SimpleText( "MPH" , "LeafUnit",55, 10, Color(255,255,255), 0, 0)
            cam.End3D2D()
        end
		if Vehicle:GetModel() == "models/tdmcars/trucks/peterbilt_579.mdl" then
			local speed = math.Round(Vehicle:GetVelocity():Length() / (63360/3600),0)
			cam.Start3D2D(Vehicle:LocalToWorld(Vector(-23.3,96.7,100)),Vehicle:LocalToWorldAngles(Angle(0,0,65)),.005)
				surface.SetDrawColor(0,255,0)
				draw.SimpleText( speed , "GhibliSpeedoFont", -30, 30, Color(255,255,255), TEXT_ALIGN_RIGHT, 0)
				draw.SimpleText( "mph" , "GhibliSpeedoFont", 00, 30, Color(255,255,255), 0, 0)
			cam.End3D2D()
		end
		if Vehicle:GetModel() == "models/tdmcars/trucks/peterbilt_579_med.mdl" then
			local speed = math.Round(Vehicle:GetVelocity():Length() / (63360/3600),0)
			cam.Start3D2D(Vehicle:LocalToWorld(Vector(-23.3,96.7,106)),Vehicle:LocalToWorldAngles(Angle(0,0,65)),.005)
				surface.SetDrawColor(0,255,0)
				draw.SimpleText( speed , "GhibliSpeedoFont", -30, 30, Color(255,255,255), TEXT_ALIGN_RIGHT, 0)
				draw.SimpleText( "mph" , "GhibliSpeedoFont", 00, 30, Color(255,255,255), 0, 0)
			cam.End3D2D()
		end
		if Vehicle:GetModel() == "models/tdmcars/bmwm5e60.mdl" then
			local speed = math.Round(Vehicle:GetVelocity():Length() / (63360/3600),0)
			cam.Start3D2D(Vehicle:LocalToWorld(Vector(-19,35,56)),Vehicle:LocalToWorldAngles(Angle(0,0,90)),0.006)
				surface.SetDrawColor(0,255,0)
				draw.SimpleText( speed , "M5SpeedoFont", -50, -10, Color(255,190,0), TEXT_ALIGN_RIGHT, 0)
				draw.SimpleText( "mph" , "M5SpeedFont", 00, 30, Color(255,190,0), 0, 0)
			cam.End3D2D()
		end
		if Vehicle:GetModel() == "models/tdmcars/mas_ghibli.mdl" then
			local speed = math.Round(Vehicle:GetVelocity():Length() / (63360/3600),0)
			cam.Start3D2D(Vehicle:LocalToWorld(Vector(-17.58,26.15,48.55)),Vehicle:LocalToWorldAngles(Angle(0,0,76)),0.0095)
				surface.SetDrawColor(0,255,0)
				draw.SimpleText( speed , "GhibliSpeedoFont", -50, -10, Color(200,200,200), TEXT_ALIGN_CENTER, 0)
			cam.End3D2D()
		end
    end
end )
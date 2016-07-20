
-----------------------------------------------------
--[[
	Name: sh_car_starter.lua
	For: SantosRP
	By: Ultra
]]--

local Module = {}
Module.Name = "car_starter_sh"

sound.Add{
	name = "car_starter",
	channel = CHAN_STATIC,
	volume = 1,
	level = 68,
	pitch = 100,
	sound = "santosrp/car_starter.wav"
}

if CLIENT then
	local sendState = false
	function Module:Tick()
		if input.IsKeyDown( KEY_I ) then
			if IsValid( vgui.GetKeyboardFocus() ) then return end
			if not sendState then
				net.Start( "srp_carstarter" )
					net.WriteBit( true )
				net.SendToServer()
				sendState = true
			end
		else
			if sendState then
				net.Start( "srp_carstarter" )
					net.WriteBit( false )
				net.SendToServer()
				sendState = false
			end
		end 
	end
end

function Module:OnLoad()
	if CLIENT then
		self:RequireHook( "Tick" )
	end
end

return Module
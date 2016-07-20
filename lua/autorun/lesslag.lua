
-----------------------------------------------------

//Widgets are fucking useless. disable them and increase fps until we need them (we probably never will).
// ~bobblehead
hook.Add("Initialize","NoWidgets",function()
	hook.Remove("PlayerTick","TickWidgets") --don't use it unless we need it.
end)
hook.Add("OnEntityCreated","WidgetInit",function(ent)
	if ent:IsWidget() then
		hook.Add( "PlayerTick", "TickWidgets", function( pl, mv ) widgets.PlayerTick( pl, mv ) end ) --we need it.
		hook.Remove("OnEntityCreated","WidgetInit") --only once.
	end
end)
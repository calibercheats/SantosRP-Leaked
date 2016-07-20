
-----------------------------------------------------
local last_load = 0
function gspeak_players_create_list( DList )
	if last_load > CurTime() - 1 then return end
	last_load = CurTime()
	DList:Clear()
	--local players_hearable = tslib.getAllID()
	for k, v in pairs(gspeak.hearable) do
		local radio = v["radio_id"]
		local ent = v["ent_id"]
		local id = tonumber(k)
		local talking = false
		if v["radio"] and IsValid( Entity(v["radio_id"]):GetSpeaker() ) and Entity(v["radio_id"]):GetSpeaker():IsPlayer() then
			radio = Entity(v["radio_id"]):GetSpeaker():GetName()
		else
			radio = ""
		end
		if Entity(v["ent_id"]):IsPlayer() then
			ent = Entity(v["ent_id"])
		elseif IsValid( Entity(v["ent_id"]):GetSpeaker() ) and Entity(v["ent_id"]):GetSpeaker():IsPlayer() then
			ent = Entity(v["ent_id"]):GetSpeaker()
		end
		if id < 10 then
			id = tostring("0"..id)
		end
		DList:AddLine( id, ent:GetName(), v["radio"], radio, ent.talking )
	end
	DList:SortByColumn( 1 )
end

concommand.Add("gspeakwho", function()
	if gspeak.who == nil or gspeak.who == false then
		Gspeak_who_list = vgui.Create( "DListView" )
		Gspeak_who_list:SetSize( 450, 450 )
		Gspeak_who_list:SetPos( 25, 200 )
		Gspeak_who_list:AddColumn( "ID" ):SetFixedWidth( 25 )
		Gspeak_who_list:AddColumn( "Who?" )
		Gspeak_who_list:AddColumn( "Radio?..." ):SetFixedWidth( 50 )
		Gspeak_who_list:AddColumn( "...of" )
		Gspeak_who_list:AddColumn( "talking?" ):SetFixedWidth( 50 )
		Gspeak_who_list:SetSortable( false )
		Gspeak_who_list.Think = gspeak_players_create_list
		gspeak.who = true
	else
		Gspeak_who_list:Remove()
		gspeak.who = false
	end
end)

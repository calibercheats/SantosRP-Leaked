
-----------------------------------------------------
AddCSLuaFile()

local FAS_RS = {}

FAS_RS["FAS2_TOZ34.Close"] = "weapons/toz34/toz34_close.wav"
FAS_RS["FAS2_TOZ34.OpenStart"] = "weapons/toz34/toz34_open_start.wav"
FAS_RS["FAS2_TOZ34.OpenFinish"] = "weapons/toz34/toz34_open_finish.wav"
FAS_RS["FAS2_TOZ34.ShellIn"] = {"weapons/toz34/toz34_shell_in1.wav", "weapons/toz34/toz34_shell_in2.wav"}

local tbl = {channel = CHAN_STATIC,
	volume = 1,
	soundlevel = 50,
	pitchstart = 100,
	pitchend = 100}

for k, v in pairs(FAS_RS) do
	tbl.name = k
	tbl.sound = v
		
	sound.Add(tbl)
	
	if type(v) == "table" then
		for k2, v2 in pairs(v) do
			Sound(v2)
		end
	else
		Sound(v)
	end
end	

local FAS_FS = {}

FAS_FS["FAS2_AN94"] = {"weapons/an-94/an-94_fire.wav", "weapons/an-94/an-94_fire2.wav", "weapons/an-94/an-94_fire3.wav", "weapons/an-94/an-94_fire4.wav"}
FAS_FS["FAS2_AK12"] = {"weapons/ak-12/ak12-fire4.wav", "weapons/ak-12/ak12-fire5.wav", "weapons/ak-12/ak12-fire6.wav"}
FAS_FS["FAS2_GALIL"] = "weapons/galilar/galil_fire1.wav"

local tbl = {channel = CHAN_STATIC,
	volume = 1,
	soundlevel = 120,
	pitchstart = 92,
	pitchend = 112}

for k, v in pairs(FAS_FS) do
	tbl.name = k
	tbl.sound = v
		
	sound.Add(tbl)
	
	if type(v) == "table" then
		for k2, v2 in pairs(v) do
			Sound(v2)
		end
	else
		Sound(v)
	end
end	
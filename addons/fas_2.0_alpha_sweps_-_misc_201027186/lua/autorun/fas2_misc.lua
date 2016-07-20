
-----------------------------------------------------
AddCSLuaFile()

game.AddParticles("particles/fas_explosions.pcf")
PrecacheParticleSystem("grenade_final")
PrecacheParticleSystem("explosion_m79")
PrecacheParticleSystem("water_explosion")

local FAS_RS = {}

FAS_RS["FAS2_Bandage.Retrieve"] = "weapons/ifak/bandage_retrieve.wav"
FAS_RS["FAS2_Bandage.Open"] = "weapons/ifak/bandage_open.wav"
FAS_RS["FAS2_Hemostat.Retrieve"] = "weapons/ifak/hemostat_retrieve.wav"
FAS_RS["FAS2_Hemostat.Close"] = "weapons/ifak/hemostat_close.wav"
FAS_RS["FAS2_QuikClot.Loosen"] = "weapons/ifak/quikclot_loosen.wav"
FAS_RS["FAS2_QuikClot.Open"] = "weapons/ifak/quikclot_open.wav"
FAS_RS["FAS2_QuikClot.Retrieve"] = "weapons/ifak/quikclot_retrieve.wav"

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
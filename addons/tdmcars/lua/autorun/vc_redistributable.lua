
-----------------------------------------------------
// The following script is written by freemmaann, if you have any complaints or ideas contact me: steam - http://steamcommunity.com/id/freemmaann, email - freemmaann@gmail.com or skype - comman6.

local HSL = file.Find("Data/VehController/Vehicles/*.txt", "GAME") for i = 1, table.Count(HSL) do local VehTbl = util.JSONToTable(file.Read("Data/VehController/Vehicles/"..HSL[i], "GAME")) list.Set("Vehicles", VehTbl.Index, VehTbl) end
local HSL = file.Find("scripts/VehController/Vehicles/*.txt", "GAME") for i = 1, table.Count(HSL) do local VehTbl = util.JSONToTable(file.Read("scripts/VehController/Vehicles/"..HSL[i], "GAME")) list.Set("Vehicles", VehTbl.Index, VehTbl) end
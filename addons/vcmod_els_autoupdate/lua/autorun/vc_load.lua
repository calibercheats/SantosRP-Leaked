
-----------------------------------------------------
// Copyright © 2012-2016 VCMod (freemmaann). All Rights Reserved. If you have any complaints or ideas contact me: steam: freemmaann, email - freemmaann@gmail.com or skype - comman6.

if SERVER then resource.AddWorkshop("632470227") end AddCSLuaFile() AddCSLuaFile("vcmod/client/vc_load.lua") if !VC then VC = {} end if !VC.Versions then VC.Versions = {} end if !VC.AddonData then VC.AddonData = {} end VC.Copyright = "Copyright © 2012-2016 VCMod (freemmaann)." VC.Host = "http://vcmod.org/" if CLIENT then include("vcmod/client/vc_load.lua") else include("vcmod/server/vc_load.lua") end
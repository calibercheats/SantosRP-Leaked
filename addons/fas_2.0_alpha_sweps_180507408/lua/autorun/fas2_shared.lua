
-----------------------------------------------------
AddCSLuaFile("autorun/fas2_shared.lua")
AddCSLuaFile("autorun/client/fas2_clientmenu.lua")

game.AddParticles("particles/muzzleflashes_test.pcf")
game.AddParticles("particles/muzzleflashes_test_b.pcf")
game.AddParticles("particles/impact_fx_fas.pcf")

local ups = util.PrecacheSound

PrecacheParticleSystem("muzzleflash_g3")
PrecacheParticleSystem("muzzleflash_m14")
PrecacheParticleSystem("muzzleflash_ak47")
PrecacheParticleSystem("muzzleflash_ak74")
PrecacheParticleSystem("muzzleflash_6")
PrecacheParticleSystem("muzzleflash_pistol_rbull")
PrecacheParticleSystem("muzzleflash_pistol")
PrecacheParticleSystem("muzzleflash_suppressed")
PrecacheParticleSystem("muzzleflash_pistol_deagle")
PrecacheParticleSystem("muzzleflash_OTS")
PrecacheParticleSystem("muzzleflash_M3")
PrecacheParticleSystem("muzzleflash_smg")
PrecacheParticleSystem("muzzleflash_SR25")
PrecacheParticleSystem("muzzleflash_shotgun")
PrecacheParticleSystem("muzzle_center_M82")
PrecacheParticleSystem("muzzleflash_m79")

PrecacheParticleSystem("impact_dirt_d")

if SERVER then
	CreateConVar("fas2_profgain", "0.04", {FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY})
	CreateConVar("fas2_profgain_shotguns", "0.01", {FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY})
end

local sadd = sound.Add

local FAS_RS = {}

FAS_RS["MagPouch_Pistol"] = "weapons/handling/generic_magpouch_pistol1.wav"
FAS_RS["MagPouch_SMG"] = "weapons/handling/generic_magpouch_smg1.wav"
FAS_RS["MagPouch_Shotgun"] = "weapons/handling/generic_magpouch_shotgun1.wav"
FAS_RS["MagPouch_AR"] = "weapons/handling/generic_magpouch1.wav"
FAS_RS["MagPouch_MG"] = "weapons/handling/generic_magpouch_mg1.wav"
FAS_RS["Generic_Cloth"] = {"weapons/handling/generic_cloth_movement1.wav", "weapons/handling/generic_cloth_movement2.wav", "weapons/handling/generic_cloth_movement3.wav", "weapons/handling/generic_cloth_movement4.wav", "weapons/handling/generic_cloth_movement5.wav", "weapons/handling/generic_cloth_movement6.wav", "weapons/handling/generic_cloth_movement7.wav", "weapons/handling/generic_cloth_movement8.wav", "weapons/handling/generic_cloth_movement9.wav", "weapons/handling/generic_cloth_movement10.wav", "weapons/handling/generic_cloth_movement11.wav", "weapons/handling/generic_cloth_movement12.wav", "weapons/handling/generic_cloth_movement13.wav", "weapons/handling/generic_cloth_movement14.wav", "weapons/handling/generic_cloth_movement15.wav", "weapons/handling/generic_cloth_movement16.wav"}

FAS_RS["Bipod_Down"] = {"weapons/accessories/harrisbipod_down1.wav", "weapons/accessories/harrisbipod_down2.wav"}
FAS_RS["Bipod_Up"] = {"weapons/accessories/harrisbipod_up1.wav", "weapons/accessories/harrisbipod_up2.wav"}
FAS_RS["MagPouch_MG"] = "weapons/handling/generic_magpouch_mg1.wav"

FAS_RS["FAS2_Switch"] = {"weapons/switch1.wav", "weapons/switch2.wav", "weapons/switch3.wav", "weapons/switch4.wav", "weapons/switch5.wav", "weapons/switch6.wav"}

FAS_RS["Grip_Light"] = {"weapons/handling/generic_grip_light1.wav", "weapons/handling/generic_grip_light2.wav"}
FAS_RS["Grip_Medium"] = {"weapons/handling/generic_grip_medium1.wav", "weapons/handling/generic_grip_medium2.wav"}
FAS_RS["Grip_Heavy"] = {"weapons/handling/generic_grip_heavy1.wav", "weapons/handling/generic_grip_heavy2.wav"}

FAS_RS["Weapon_G3.BoltBack"] = "weapons/g3a3/g3_boltback.wav"
FAS_RS["Weapon_G3.BoltForward"] = "weapons/g3a3/g3_boltforward.wav"
FAS_RS["Weapon_G3.BoltPullNomen"] = "weapons/g3a3/g3_boltpull_nomen.wav"
FAS_RS["Weapon_G3.Handle"] = "weapons/g3a3/g3_handle.wav"
FAS_RS["Weapon_G3.MagOutEmpty"] = "weapons/g3a3/g3_magout_empty.wav"
FAS_RS["Weapon_G3.MagOut"] = "weapons/g3a3/g3_magout.wav"
FAS_RS["Weapon_G3.MagIn"] = "weapons/g3a3/g3_magin.wav"

FAS_RS["Weapon_p226.MagInPartial"] = "weapons/p226/p226_magin_partial.wav"
FAS_RS["Weapon_p226.MagIn"] = "weapons/p226/p226_magin.wav"
FAS_RS["Weapon_p226.MagOut"] = "weapons/p226/p226_magout.wav"
FAS_RS["Weapon_p226.MagOutEmpty"] = "weapons/p226/p226_magout_empty.wav"
FAS_RS["Weapon_p226.SlideBack"] = "weapons/p226/p226_slideback.wav"
FAS_RS["Weapon_p226.SlideForward"] = "weapons/p226/p226_slideforward.wav"
FAS_RS["Weapon_p226.SlideStop"] = "weapons/p226/p226_slidestop.wav"

FAS_RS["Weapon_M1911.MagInPartial"] = "weapons/1911/1911_magin_partial.wav"
FAS_RS["Weapon_M1911.MagIn"] = "weapons/1911/1911_magin.wav"
FAS_RS["Weapon_M1911.MagOut"] = "weapons/1911/1911_magout.wav"
FAS_RS["Weapon_M1911.MagOutEmpty"] = "weapons/1911/1911_magout_empty.wav"
FAS_RS["Weapon_M1911.SlideRelease"] = "weapons/1911/1911_sliderelease.wav"

FAS_RS["Weapon_M4A1.StockPull"] = "weapons/m4a1/m4_stock.wav"
FAS_RS["Weapon_M4A1.ChargeBack"] = "weapons/m4a1/m4_chargeback.wav"
FAS_RS["Weapon_M4A1.ReleaseHandle"] = "weapons/m4a1/m4_releasehandle.wav"
FAS_RS["Weapon_M4A1.Check"] = "weapons/m4a1/m4_check.wav"
FAS_RS["Weapon_M4A1.Forwardassist"] = "weapons/m4a1/m4_forwardassist.wav"
FAS_RS["Weapon_M4A1.DustCover"] = "weapons/m4a1/m4_dustcover.wav"
FAS_RS["Weapon_M4A1.Switch"] = "weapons/m4a1/m4_selector.wav"
FAS_RS["Weapon_M4A1.Magout"] = "weapons/m4a1/m4_magout.wav"
FAS_RS["Weapon_M4A1.MagoutEmpty"] = "weapons/m4a1/m4_magout_empty.wav"
FAS_RS["Weapon_M4A1.Magin"] = "weapons/m4a1/m4_magin.wav"
FAS_RS["Weapon_M4A1.Boltcatch"] = "weapons/m4a1/m4_boltcatch.wav"

FAS_RS["FAS2_SKS.BoltBack"] = "weapons/sks/sks_boltback.wav"
FAS_RS["FAS2_SKS.BoltForward"] = "weapons/sks/sks_boltforward.wav"
FAS_RS["FAS2_SKS.BoltRelease"] = "weapons/sks/sks_boltrelease.wav"
FAS_RS["FAS2_SKS.ClipIn"] = "weapons/sks/sks_clipin.wav"
FAS_RS["FAS2_SKS.InsertNomen"] = "weapons/sks/sks_insert_nomen.wav"
FAS_RS["FAS2_SKS.Insert1"] = "weapons/sks/sks_insert1.wav"
FAS_RS["FAS2_SKS.Insert2"] = "weapons/sks/sks_insert2.wav"
FAS_RS["FAS2_SKS.Insert3"] = "weapons/sks/sks_insertlast.wav"
FAS_RS["FAS2_SKS.LatchOpen"] = "weapons/sks/sks_latchopen.wav"
FAS_RS["FAS2_SKS.LatchClose"] = "weapons/sks/sks_latchclose.wav"
FAS_RS["FAS2_SKS.MagOut"] = "weapons/sks/sks_magout.wav"
FAS_RS["FAS2_SKS.MagOutEmpty"] = "weapons/sks/sks_magout_empty.wav"
FAS_RS["FAS2_SKS.MagIn"] = "weapons/sks/sks_magin.wav"
FAS_RS["FAS2_SKS.RemoveClip"] = "weapons/sks/sks_removeclip.wav"

FAS_RS["Weapon_ak74.BoltPull"] = "weapons/ak74/ak74_cock.wav"
FAS_RS["Weapon_ak74.MagOutEmpty"] = "weapons/ak74/ak74_magout_empty.wav"
FAS_RS["Weapon_ak74.MagOutEmptyNomen"] = "weapons/ak74/ak74_magout_empty_nomen.wav"
FAS_RS["Weapon_ak74.MagOut"] = "weapons/ak74/ak74_magout.wav"
FAS_RS["Weapon_ak74.MagIn"] = "weapons/ak74/ak74_magin.wav"

FAS_RS["Weapon_Sako95.BoltBack"] = "weapons/sako95/sako95_boltback.wav"
FAS_RS["Weapon_Sako95.BoltForward"] = "weapons/sako95/sako95_boltforward.wav"
FAS_RS["Weapon_Sako95.MagOutEmpty"] = "weapons/sako95/sako95_magout_empty.wav"
FAS_RS["Weapon_Sako95.MagOut"] = "weapons/sako95/sako95_magout.wav"
FAS_RS["Weapon_Sako95.MagIn"] = "weapons/sako95/sako95_magin.wav"

FAS_RS["Weapon_SG550.BoltBack"] = "weapons/sg55x/sg550_boltback.wav"
FAS_RS["Weapon_SG550.BoltForward"] = "weapons/sg55x/sg550_boltforward.wav"
FAS_RS["Weapon_SG550.MagOutEmpty"] = "weapons/sg55x/sg550_magout_empty.wav"
FAS_RS["Weapon_SG550.MagOut"] = "weapons/sg55x/sg550_magout.wav"
FAS_RS["Weapon_SG550.MagIn"] = "weapons/sg55x/sg550_magin.wav"

FAS_RS["Weapon_AK47.BoltPull"] = "weapons/ak47/ak47_cock.wav"
FAS_RS["Weapon_AK47.MagOutEmpty"] = "weapons/ak47/ak47_magout_empty.wav"
FAS_RS["Weapon_AK47.MagOutEmptyNomen"] = "weapons/ak47/ak47_magout_empty_nomen.wav"
FAS_RS["Weapon_AK47.MagOut"] = "weapons/ak47/ak47_magout.wav"
FAS_RS["Weapon_AK47.MagIn"] = "weapons/ak47/ak47_magin.wav"

FAS_RS["Weapon_RBULL.CylinderOpen"] = "weapons/ragingbull/ragingbull_open.wav"
FAS_RS["Weapon_RBULL.Remove"] = {"weapons/ragingbull/ragingbull_remove1.wav", "weapons/ragingbull/ragingbull_remove2.wav", "weapons/ragingbull/ragingbull_remove3.wav", "weapons/ragingbull/ragingbull_remove4.wav", "weapons/ragingbull/ragingbull_remove5.wav"}
FAS_RS["Weapon_RBULL.Insert"] = {"weapons/ragingbull/ragingbull_insert1.wav", "weapons/ragingbull/ragingbull_insert2.wav", "weapons/ragingbull/ragingbull_insert3.wav", "weapons/ragingbull/ragingbull_insert4.wav", "weapons/ragingbull/ragingbull_insert5.wav"}
FAS_RS["Weapon_RBULL.CylinderClose"] = "weapons/ragingbull/ragingbull_close.wav"
FAS_RS["Weapon_RBULL.Jiggle"] = {"weapons/ragingbull/ragingbull_jiggle1.wav", "weapons/ragingbull/ragingbull_jiggle2.wav", "weapons/ragingbull/ragingbull_jiggle3.wav", "weapons/ragingbull/ragingbull_jiggle4.wav"}
FAS_RS["Weapon_RBULL.Extractor"] = "weapons/ragingbull/ragingbull_extractor.wav"

FAS_RS["FAS2_GLOCK20.MagOut"] = "weapons/glock20/glock20_magout.wav"
FAS_RS["FAS2_GLOCK20.MagOutEmpty"] = "weapons/glock20/glock20_magout_empty.wav"
FAS_RS["FAS2_GLOCK20.MagIn"] = "weapons/glock20/glock20_magin.wav"
FAS_RS["FAS2_GLOCK20.SlideRelease"] = "weapons/glock20/glock20_sliderelease.wav"

FAS_RS["FAS2_M14.Charge"] = "weapons/m14/m14_charge.wav"
FAS_RS["FAS2_M14.BoltRelease"] = "weapons/m14/m14_boltrelease.wav"
FAS_RS["FAS2_M14.MagOutEmpty"] = "weapons/m14/m14_magout_empty.wav"
FAS_RS["FAS2_M14.MagOut"] = "weapons/m14/m14_magout.wav"
FAS_RS["FAS2_M14.MagIn"] = "weapons/m14/m14_magin.wav"
FAS_RS["FAS2_M14.Check"] = "weapons/m14/m14_check.wav"

FAS_RS["FAS2_M14.Charge"] = "weapons/m14/m14_charge.wav"
FAS_RS["FAS2_M14.BoltRelease"] = "weapons/m14/m14_boltrelease.wav"
FAS_RS["FAS2_M14.MagOutEmpty"] = "weapons/m14/m14_magout_empty.wav"
FAS_RS["FAS2_M14.MagOut"] = "weapons/m14/m14_magout.wav"
FAS_RS["FAS2_M14.MagIn"] = "weapons/m14/m14_magin.wav"
FAS_RS["FAS2_M14.Check"] = "weapons/m14/m14_check.wav"

FAS_RS["FAS2_M24.Back"] = "weapons/m24/m24_back.wav"
FAS_RS["FAS2_M24.BoltBack"] = "weapons/m24/m24_boltback.wav"
FAS_RS["FAS2_M24.BoltBackNomen"] = "weapons/m24/m24_boltback_nomen.wav"
FAS_RS["FAS2_M24.BoltDown"] = "weapons/m24/m24_boltdown.wav"
FAS_RS["FAS2_M24.BoltDownNomen"] = "weapons/m24/m24_boltdown_nomen.wav"
FAS_RS["FAS2_M24.BoltForward"] = "weapons/m24/m24_boltforward.wav"
FAS_RS["FAS2_M24.BoltForwardNomen"] = "weapons/m24/m24_boltforward_nomen.wav"
FAS_RS["FAS2_M24.BoltUp"] = "weapons/m24/m24_boltup.wav"
FAS_RS["FAS2_M24.BoltUpNomen"] = "weapons/m24/m24_boltup_nomen.wav"
FAS_RS["FAS2_M24.Butt"] = "weapons/m24/m24_butt.wav"
FAS_RS["FAS2_M24.Eject"] = "weapons/m24/m24_eject.wav"
FAS_RS["FAS2_M24.Forward"] = "weapons/m24/m24_forward.wav"
FAS_RS["FAS2_M24.Insert1"] = "weapons/m24/m24_insert1.wav"
FAS_RS["FAS2_M24.Insert2"] = "weapons/m24/m24_insert2.wav"
FAS_RS["FAS2_M24.Insert3"] = "weapons/m24/m24_insert3.wav"
FAS_RS["FAS2_M24.Insert4"] = "weapons/m24/m24_insert4.wav"
FAS_RS["FAS2_M24.Insert5"] = "weapons/m24/m24_insert5.wav"
FAS_RS["FAS2_M24.Insert5"] = "weapons/m24/m24_insert5.wav"

FAS_RS["FAS2_DEAGLE.MagOut"] = "weapons/deserteagle/de_magout.wav"
FAS_RS["FAS2_DEAGLE.MagOutEmpty"] = "weapons/deserteagle/de_magout_empty.wav"
FAS_RS["FAS2_DEAGLE.MagIn"] = "weapons/deserteagle/de_magin.wav"
FAS_RS["FAS2_DEAGLE.MagInPartial"] = "weapons/deserteagle/de_magin_partial.wav"
FAS_RS["FAS2_DEAGLE.MagInNomen"] = "weapons/deserteagle/de_magin_nomen.wav"
FAS_RS["FAS2_DEAGLE.SlideStop"] = "weapons/deserteagle/de_sliderelease.wav"

FAS_RS["FAS2_OTS33.MagOut"] = "weapons/ots33/ots33_magout.wav"
FAS_RS["FAS2_OTS33.MagOutEmpty"] = "weapons/ots33/ots33_magout_empty.wav"
FAS_RS["FAS2_OTS33.MagIn"] = "weapons/ots33/ots33_magin.wav"
FAS_RS["FAS2_OTS33.MagInPartial"] = "weapons/ots33/ots33_magin_partial.wav"
FAS_RS["FAS2_OTS33.SlideBack"] = "weapons/ots33/ots33_slideback.wav"
FAS_RS["FAS2_OTS33.SlideRelease"] = "weapons/ots33/ots33_sliderelease.wav"

FAS_RS["FAS2_M3S90.BoltCatch"] = "weapons/m3s90p/m3s90_Boltcatch.wav"
FAS_RS["FAS2_M3S90.GetAmmo"] = {"weapons/m3s90p/m3s90_getammo1.wav", "weapons/m3s90p/m3s90_getammo2.wav", "weapons/m3s90p/m3s90_getammo3.wav"}
FAS_RS["FAS2_M3S90.LoadEjectorPort"] = "weapons/m3s90p/m3s90_load_ejectorport.wav"
FAS_RS["FAS2_M3S90.Load"] = {"weapons/m3s90p/m3s90_load1.wav", "weapons/m3s90p/m3s90_load2.wav", "weapons/m3s90p/m3s90_load3.wav", "weapons/m3s90p/m3s90_load4.wav", "weapons/m3s90p/m3s90_load5.wav", "weapons/m3s90p/m3s90_load6.wav", "weapons/m3s90p/m3s90_load7.wav", "weapons/m3s90p/m3s90_load8.wav"}
FAS_RS["FAS2_M3S90.Restock"] = "weapons/m3s90p/m3s90_restock.wav"

FAS_RS["FAS2_REM870.Insert"] = {"weapons/rem870/rem870_insert1.wav", "weapons/rem870/rem870_insert2.wav", "weapons/rem870/rem870_insert3.wav"}
FAS_RS["FAS2_REM870.PumpBack"] = {"weapons/rem870/rem870_pump_back.wav", "weapons/rem870/rem870_pump_back1.wav", "weapons/rem870/rem870_pump_back2.wav"}
FAS_RS["FAS2_REM870.PumpForward"] = {"weapons/rem870/rem870_pump_forward.wav", "weapons/rem870/rem870_pump_forward1.wav", "weapons/rem870/rem870_pump_forward2.wav"}

FAS_RS["FAS2_KS23.InsertPort"] = "weapons/ks23/ks23_insert_port.wav"
FAS_RS["FAS2_KS23.Insert"] = {"weapons/ks23/ks23_insert1.wav", "weapons/ks23/ks23_insert2.wav", "weapons/ks23/ks23_insert3.wav"}
FAS_RS["FAS2_KS23.PumpBack"] = "weapons/ks23/ks23_pump_back.wav"
FAS_RS["FAS2_KS23.PumpForward"] = "weapons/ks23/ks23_pump_forward.wav"

FAS_RS["FAS2_MAC11.MagOut"] = "weapons/mac11/mac11_magout.wav"
FAS_RS["FAS2_MAC11.MagOutEmpty"] = "weapons/mac11/mac11_magout_empty.wav"
FAS_RS["FAS2_MAC11.MagIn"] = "weapons/mac11/mac11_magin.wav"
FAS_RS["FAS2_MAC11.BoltBack"] = "weapons/mac11/mac11_boltback.wav"
FAS_RS["FAS2_MAC11.BoltForward"] = "weapons/mac11/mac11_boltforward.wav"

FAS_RS["FAS2_PP19.MagOut"] = "weapons/bizon/bizon_magout.wav"
FAS_RS["FAS2_PP19.MagOutEmpty"] = "weapons/bizon/bizon_magout_empty.wav"
FAS_RS["FAS2_PP19.MagLatch"] = "weapons/bizon/bizon_maglatch.wav"
FAS_RS["FAS2_PP19.MagIn"] = "weapons/bizon/bizon_magin.wav"
FAS_RS["FAS2_PP19.BoltPull"] = "weapons/bizon/bizon_boltpull.wav"

FAS_RS["FAS2_MP5A5.BoltBack"] = "weapons/mp5/mp5_boltback.wav"
FAS_RS["FAS2_MP5A5.BoltCatch"] = "weapons/mp5/mp5_boltcatch.wav"
FAS_RS["FAS2_MP5A5.BoltForward"] = "weapons/mp5/mp5_boltforward.wav"
FAS_RS["FAS2_MP5A5.BoltPull"] = "weapons/mp5/mp5_boltpull.wav"
FAS_RS["FAS2_MP5A5.MagOut"] = "weapons/mp5/mp5_magout.wav"
FAS_RS["FAS2_MP5A5.MagOutEmpty"] = "weapons/mp5/mp5_magout_empty.wav"
FAS_RS["FAS2_MP5A5.MagIn"] = "weapons/mp5/mp5_magin.wav"
FAS_RS["FAS2_MP5A5.SelectorSwitch"] = "weapons/mp5/mp5_selectorswitch.wav"
FAS_RS["FAS2_MP5A5.Stock"] = "weapons/mp5/mp5_stock.wav"

FAS_RS["FAS2_UZI.BoltBack"] = "weapons/uzi/uzi_boltback.wav"
FAS_RS["FAS2_UZI.BoltForward"] = "weapons/uzi/uzi_boltforward.wav"
FAS_RS["FAS2_UZI.MagInPartial"] = "weapons/uzi/uzi_magin_partial.wav"
FAS_RS["FAS2_UZI.MagRelease"] = "weapons/uzi/uzi_magrelease.wav"
FAS_RS["FAS2_UZI.MagOut"] = "weapons/uzi/uzi_magout.wav"
FAS_RS["FAS2_UZI.MagOutEmpty"] = "weapons/uzi/uzi_magout_empty.wav"
FAS_RS["FAS2_UZI.MagIn"] = "weapons/uzi/uzi_magin.wav"
FAS_RS["FAS2_UZI.StockUnfold"] = "weapons/uzi/uzi_stockunfold.wav"

FAS_RS["FAS2_MP5K.BoltBack"] = "weapons/mp5/mp5k_boltback.wav"
FAS_RS["FAS2_MP5K.BoltForward"] = "weapons/mp5/mp5k_boltforward.wav"

FAS_RS["FAS2_M21.MagOut"] = "weapons/m21/m21_magout.wav"
FAS_RS["FAS2_M21.MagOutEmpty"] = "weapons/m21/m21_magout_empty.wav"
FAS_RS["FAS2_M21.MagIn"] = "weapons/m21/m21_magin.wav"

FAS_RS["FAS2_G36C.BoltBack"] = "weapons/g36c/g36c_boltback.wav"
FAS_RS["FAS2_G36C.BoltForward"] = "weapons/g36c/g36c_boltforward.wav"
FAS_RS["FAS2_G36C.MagOut"] = "weapons/g36c/g36c_magout.wav"
FAS_RS["FAS2_G36C.MagOutEmpty"] = "weapons/g36c/g36c_magout_empty.wav"
FAS_RS["FAS2_G36C.MagIn"] = "weapons/g36c/g36c_magin.wav"
FAS_RS["FAS2_G36C.Handle"] = "weapons/g36c/g36c_handle.wav"
FAS_RS["FAS2_G36C.Stock"] = "weapons/g36c/g36c_stock.wav"

FAS_RS["FAS2_RPK.BoltBack"] = "weapons/rpk47/rpk47_boltback.wav"
FAS_RS["FAS2_RPK.BoltForward"] = "weapons/rpk47/rpk47_boltforward.wav"
FAS_RS["FAS2_RPK.MagOut"] = "weapons/rpk47/rpk47_magout.wav"
FAS_RS["FAS2_RPK.MagOutEmpty"] = "weapons/rpk47/rpk47_magout_empty.wav"
FAS_RS["FAS2_RPK.MagOutEmptyNomen"] = "weapons/rpk47/rpk47_magout_empty_nomen.wav"
FAS_RS["FAS2_RPK.MagIn"] = "weapons/rpk47/rpk47_magin.wav"
FAS_RS["FAS2_RPK.MagInPartial"] = "weapons/rpk47/rpk47_magin_partial.wav"

FAS_RS["FAS2_SR25.BoltCatch"] = "weapons/sr25/sr25_boltcatch.wav"
FAS_RS["FAS2_SR25.BoltCatchSlap"] = "weapons/sr25/sr25_boltcatchslap.wav"
FAS_RS["FAS2_SR25.ChargingHandle_Back"] = "weapons/sr25/sr25_charginghandle_back.wav"
FAS_RS["FAS2_SR25.ChargingHandle_Forward"] = "weapons/sr25/sr25_charginghandle_forward.wav"
FAS_RS["FAS2_SR25.DustCover"] = "weapons/sr25/sr25_dustcover.wav"
FAS_RS["FAS2_SR25.MagIn"] = "weapons/sr25/sr25_magin.wav"
FAS_RS["FAS2_SR25.MagOut"] = "weapons/sr25/sr25_magout.wav"
FAS_RS["FAS2_SR25.MagOut_Empty"] = "weapons/sr25/sr25_magout_empty.wav"
FAS_RS["FAS2_SR25.MagSlap"] = "weapons/sr25/sr25_magslap.wav"
FAS_RS["FAS2_SR25.Safety"] = "weapons/sr25/sr25_safety.wav"
FAS_RS["FAS2_SR25.StockLock"] = "weapons/sr25/sr25_stocklock.wav"
FAS_RS["FAS2_SR25.StockPull"] = "weapons/sr25/sr25_stockpull.wav"
FAS_RS["FAS2_SR25.StockUnlock"] = "weapons/sr25/sr25_stockunlock.wav"
FAS_RS["FAS2_SR25.SuppressorUnlock"] = "weapons/sr25/sr25_supressorlock.wav"
FAS_RS["FAS2_SR25.SuppressorOn"] = "weapons/sr25/sr25_supressoron.wav"

FAS_RS["FAS2_FAMAS.Cock"] = "weapons/famas/famas_cock.wav"
FAS_RS["FAS2_FAMAS.MagIn"] = "weapons/famas/famas_magin.wav"
FAS_RS["FAS2_FAMAS.MagOut"] = "weapons/famas/famas_magout.wav"
FAS_RS["FAS2_FAMAS.MagOutEmpty"] = "weapons/famas/famas_magout_empty.wav"
FAS_RS["FAS2_FAMAS.Selector"] = "weapons/famas/famas_selector.wav"
FAS_RS["FAS2_FAMAS.SightFlip"] = "weapons/famas/famas_sight_flip.wav"

FAS_RS["FAS2_M82.BoltBack"] = "weapons/m82/m82_boltback.wav"
FAS_RS["FAS2_M82.BoltForward"] = "weapons/m82/m82_boltforward.wav"
FAS_RS["FAS2_M82.MagIn"] = "weapons/m82/m82_magin.wav"
FAS_RS["FAS2_M82.MagOut"] = "weapons/m82/m82_magout.wav"
FAS_RS["FAS2_M82.MagOutEmpty"] = "weapons/m82/m82_magout_empty.wav"
FAS_RS["FAS2_M82.MagRelease"] = "weapons/m82/m82_magrelease.wav"

FAS_RS["FAS2_M67.PinPull"] = "weapons/explosive_m67/m67_pinpull.wav"
FAS_RS["FAS2_M67.Spoon"] = "weapons/explosive_m67/m67_spoon1.wav"

FAS_RS["FAS2_M79.Open"] = "weapons/explosive_m79/m79_open.wav"
FAS_RS["FAS2_M79.Close"] = "weapons/explosive_m79/m79_close.wav"
FAS_RS["FAS2_M79.Remove"] = "weapons/explosive_m79/m79_remove.wav"
FAS_RS["FAS2_M79.Insert"] = "weapons/explosive_m79/m79_insert.wav"

FAS_RS["FAS2_M67.Ring"] = "weapons/explosive_m67/m67_pinpull.wav"
FAS_RS["FAS2_M67.Spoon"] = "weapons/explosive_m67/m67_spoon1.wav"
FAS_RS["FAS2_M67.Safety"] = "weapons/explosive_m67/m67_safety.wav"

FAS_RS["FAS2_M60.BeltInsert"] = "weapons/m60/m60_belt_insert.wav"
FAS_RS["FAS2_M60.BeltRemove"] = "weapons/m60/m60_belt_remove.wav"
FAS_RS["FAS2_M60.Belt"] = {"weapons/m60/m60_belt1.wav", "weapons/m60/m60_belt2.wav", "weapons/m60/m60_belt3.wav", "weapons/m60/m60_belt4.wav"}
FAS_RS["FAS2_M60.Bipod"] = "weapons/m60/m60_bipod.wav"
FAS_RS["FAS2_M60.CardboardInsert"] = "weapons/m60/m60_cardboard_insert.wav"
FAS_RS["FAS2_M60.CardboardRemove"] = "weapons/m60/m60_cardboard_remove.wav"
FAS_RS["FAS2_M60.CardboardRemove_Full"] = "weapons/m60/m60_cardboard_remove_full.wav"
FAS_RS["FAS2_M60.CardboardRip"] = {"weapons/m60/m60_cardboard_rip1.wav", "weapons/m60/m60_cardboard_rip2.wav"}
FAS_RS["FAS2_M60.CarryingHandle"] = "weapons/m60/m60_carryinghandle.wav"
FAS_RS["FAS2_M60.Charge"] = "weapons/m60/m60_charge.wav"
FAS_RS["FAS2_M60.Close"] = "weapons/m60/m60_close.wav"
FAS_RS["FAS2_M60.FeedingMechanism"] = "weapons/m60/m60_feeding_mechanism.wav"
FAS_RS["FAS2_M60.FeedingTray"] = "weapons/m60/m60_feeding_tray.wav"
FAS_RS["FAS2_M60.Flipsights"] = "weapons/m60/m60_flipsights.wav"
FAS_RS["FAS2_M60.Open"] = "weapons/m60/m60_open.wav"
FAS_RS["FAS2_M60.ShoulderRest"] = "weapons/m60/m60_shoulderrest.wav"
FAS_RS["FAS2_M60.StarterTab"] = "weapons/m60/m60_startertab.wav"
FAS_RS["FAS2_M60.VelcroClose"] = "weapons/m60/m60_velcro_close.wav"
FAS_RS["FAS2_M60.VelcroRip"] = {"weapons/m60/m60_velcro_rip1.wav", "weapons/m60/m60_velcro_rip2.wav"}

local tbl = {channel = CHAN_STATIC,
	volume = 1,
	level = 65,
	pitchstart = 100,
	pitchend = 100}

for k, v in pairs(FAS_RS) do
	tbl.name = k
	tbl.sound = v
		
	sadd(tbl)
	
	if type(v) == "table" then
		for k2, v2 in pairs(v) do
			ups(v2)
		end
	else
		ups(v)
	end
end	

local FAS_FS = {}

-- Rifles
FAS_FS["FAS2_SKS"] = "weapons/sks/sks_fire1.wav"
FAS_FS["FAS2_G3"] = "weapons/g3a3/g3_fire1.wav"
FAS_FS["FAS2_AK74"] = "weapons/ak74/ak74_fire1.wav"
FAS_FS["FAS2_AK47"] = "weapons/ak47/ak47_fire1.wav"
FAS_FS["FAS2_RK95"] = "weapons/sako95/sako95_fire1.wav"
FAS_FS["FAS2_M4A1"] = "weapons/m4a1/m4_fire1.wav"
FAS_FS["FAS2_SG550"] = "weapons/sg55x/sg550_fire1.wav"
FAS_FS["FAS2_SG552"] = "weapons/sg55x/sg552_fire1.wav"
FAS_FS["FAS2_M21"] = "weapons/m21/m21_fire1.wav"
FAS_FS["FAS2_M14"] = "weapons/m14/m14_fire1.wav"
FAS_FS["FAS2_M24"] = "weapons/m24/m24_fire1.wav"
FAS_FS["FAS2_G36C"] = "weapons/g36c/g36c_fire1.wav"
FAS_FS["FAS2_RPK"] = "weapons/rpk47/rpk47_fire1.wav"
FAS_FS["FAS2_SR25"] = "weapons/sr25/sr25_fire1.wav"
FAS_FS["FAS2_FAMAS"] = "weapons/famas/famas_fire1.wav"
FAS_FS["FAS2_M82"] = "weapons/m82/m82_fire1.wav"

-- LMGs
FAS_FS["FAS2_M60"] = "weapons/m60/m60_fire1.wav"

-- Shotguns
FAS_FS["FAS2_M3S90"] = "weapons/m3s90p/m3s90_fire1.wav"
FAS_FS["FAS2_REM870"] = "weapons/rem870/rem870_fire1.wav"
FAS_FS["FAS2_KS23"] = "weapons/ks23/ks23_fire1.wav"

-- Pistols
FAS_FS["FAS2_RAGINGBULL"] = "weapons/ragingbull/ragingbull_fire1.wav"
FAS_FS["FAS2_P226"] = "weapons/p226/p226_fire1.wav"
FAS_FS["FAS2_M1911"] = "weapons/1911/1911_fire1.wav"
FAS_FS["FAS2_GLOCK20"] = "weapons/glock20/glock20_fire1.wav"
FAS_FS["FAS2_DEAGLE"] = "weapons/deserteagle/de_fire1.wav"
FAS_FS["FAS2_OTS33"] = "weapons/ots33/ots33_fire1.wav"

-- Explosives/etc
FAS_FS["FAS2_M79"] = "weapons/explosive_m79/m79_fire1.wav"

-- Sub-machine guns
FAS_FS["FAS2_MAC11"] = "weapons/mac11/mac11_fire1.wav"
FAS_FS["FAS2_PP19"] = "weapons/bizon/bizon_fire1.wav"
FAS_FS["FAS2_MP5A5"] = "weapons/mp5/mp5_fire1.wav"
FAS_FS["FAS2_MP5K"] = "weapons/mp5/mp5k_fire1.wav"
FAS_FS["FAS2_UZI"] = "weapons/uzi/uzi_fire1.wav"

local FAS_FSS = {}

-- Suppressed rifles
FAS_FSS["FAS2_SKS_S"] = "weapons/sks/sks_suppressed_fire1.wav"
FAS_FSS["FAS2_G3_S"] = "weapons/g3a3/g3_suppressed_fire1.wav"
FAS_FSS["FAS2_AK74_S"] = "weapons/ak74/ak74_suppressed_fire1.wav"
FAS_FSS["FAS2_AK47_S"] = "weapons/ak47/ak47_suppressed_fire1.wav"
FAS_FSS["FAS2_RK95_S"] = "weapons/sako95/sako95_suppressed_fire1.wav"
FAS_FSS["FAS2_M4A1_S"] = "weapons/m4a1/m4_suppressed_fire1.wav"
FAS_FSS["FAS2_SG550_S"] = "weapons/sg55x/sg550_suppressed_fire1.wav"
FAS_FSS["FAS2_SG552_S"] = "weapons/sg55x/sg552_suppressed_fire1.wav"
FAS_FSS["FAS2_M21_S"] = "weapons/m21/m21_suppressed_fire1.wav"
FAS_FSS["FAS2_M14_S"] = "weapons/m14/m14_suppressed_fire1.wav"
FAS_FSS["FAS2_M24_S"] = "weapons/m24/m24_suppressed_fire1.wav"
FAS_FSS["FAS2_G36C_S"] = "weapons/g36c/g36c_suppressed_fire1.wav"
FAS_FSS["FAS2_RPK_S"] = "weapons/rpk47/rpk47_suppressed_fire1.wav"
FAS_FSS["FAS2_SR25_S"] = "weapons/sr25/sr25_suppressed_fire1.wav"
FAS_FSS["FAS2_FAMAS_S"] = "weapons/famas/famas_suppressed_fire1.wav"

-- Suppressed LMGs
FAS_FSS["FAS2_M60_S"] = "weapons/m60/m60_suppressed_fire1.wav"

-- Suppressed sub-machine guns
FAS_FSS["FAS2_MAC11_S"] = "weapons/mac11/mac11_suppressed_fire1.wav"
FAS_FSS["FAS2_PP19_S"] = "weapons/bizon/bizon_suppressed_fire1.wav"
FAS_FSS["FAS2_MP5A5_S"] = "weapons/mp5/mp5k_suppressed_fire1.wav"
FAS_FSS["FAS2_MP5K_S"] = "weapons/mp5/mp5k_suppressed_fire1.wav"
FAS_FSS["FAS2_UZI_S"] = "weapons/uzi/uzi_suppressed_fire1.wav"
FAS_FSS["FAS2_MP5SD6"] = "weapons/mp5/mp5sd_fire1.wav"

-- Suppressed pistols
FAS_FSS["FAS2_P226_S"] = "weapons/p226/p226_suppressed_fire1.wav"
FAS_FSS["FAS2_M1911_S"] = "weapons/1911/1911_suppressed_fire1.wav"
FAS_FSS["FAS2_GLOCK20_S"] = "weapons/glock20/glock20_suppressed_fire1.wav"

local tbl = {channel = CHAN_STATIC,
	volume = 1,
	level = 100,
	pitchstart = 92,
	pitchend = 112}

for k, v in pairs(FAS_FS) do
	tbl.name = k
	tbl.sound = v
		
	sadd(tbl)
	
	if type(v) == "table" then
		for k2, v2 in pairs(v) do
			ups(v2)
		end
	else
		ups(v)
	end
end	

local tbl = {channel = CHAN_STATIC,
	volume = 1,
	level = 70,
	pitchstart = 92,
	pitchend = 112}

for k, v in pairs(FAS_FSS) do
	tbl.name = k
	tbl.sound = v
		
	sadd(tbl)
	
	if type(v) == "table" then
		for k2, v2 in pairs(v) do
			ups(v2)
		end
	else
		ups(v)
	end
end	

FAS2AutoAtt = {}
FAS2_Attachments = {}

function FAS2_AddAttachment(t)
	FAS2_Attachments[t.key] = {key = t.key, nameshort = t.nameshort, namefull = t.namefull, namemenu = t.namemenu, aimpos = t.aimpos, aimang = t.aimang, attfunc = t.attfunc, deattfunc = t.deattfunc, displaytexture = t.displaytexture, desc = t.desc, clattfunc = t.clattfunc, cldeattfunc = t.cldeattfunc}
	
	if SERVER then
		CreateConVar("fas2_att_" .. t.key, "0",  {FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY})
		FAS2AutoAtt["fas2_att_" .. t.key] = t.key
	else
		CreateClientConVar("fas2_att_" .. t.key .. "_cl", "0", true, true)
	end
end

local tbl = {}

tbl.key = "compm4"
tbl.nameshort = "CompM4"
tbl.namefull = "Aimpoint CompM4"
tbl.aimpos = "CompM4Pos"
tbl.aimang = "CompM4Ang"
tbl.desc = {[1] = {t = "Provides a bright red reticle to ease aiming.", c = Color(202, 255, 163, 255)},
	[2] = {t = "Slightly increases aim zoom.", c = Color(202, 255, 163, 255)},
	[3] = {t = "Narrow scope might slightly reduce awareness.", c = Color(255, 137, 119, 255)}}

if CLIENT then
	tbl.displaytexture = surface.GetTextureID("VGUI/fas2atts/compm4")
end

tbl.clattfunc = function(ply, wep)
	wep.AimFOV = 10
	wep.TargetViewModelFOV = 40
end

tbl.cldeattfunc = function(ply, wep)
	wep.AimFOV = wep.AimFOV_Orig
	wep.TargetViewModelFOV = wep.TargetViewModelFOV_Orig and wep.TargetViewModelFOV_Orig or wep.ViewModelFOV_Orig
end

FAS2_AddAttachment(tbl)

tbl = {}

tbl.key = "eotech"
tbl.nameshort = "EoTech"
tbl.namefull = "EoTech 553"
tbl.aimpos = "EoTechPos"
tbl.aimang = "EoTechAng"
tbl.desc = {[1] = {t = "Provides a bright red sphere-like reticle to ease aiming.", c = Color(202, 255, 163, 255)}}

if CLIENT then
	tbl.displaytexture = surface.GetTextureID("VGUI/fas2atts/eotech553")
end

FAS2_AddAttachment(tbl)

tbl = {}

tbl.key = "tritiumsights"
tbl.nameshort = "Tritium"
tbl.namefull = "Tritium Ironsights"
tbl.desc = {[1] = {t = "Provides illuminating sights in the dark.", c = Color(202, 255, 163, 255)}}

if CLIENT then
	tbl.displaytexture = surface.GetTextureID("VGUI/fas2atts/tritiumsights")
end

FAS2_AddAttachment(tbl)

tbl = {}

tbl.key = "suppressor"
tbl.nameshort = "Suppress"
tbl.namefull = "Suppressor"
tbl.desc = {[1] = {t = "Decreases firing noise.", c = Color(202, 255, 163, 255)},
	[2] = {t = "Decreases recoil by 15%", c = Color(202, 255, 163, 255)},
	[3] = {t = "Decreases damage by 10%", c = Color(255, 137, 119, 255)}}

if CLIENT then
	tbl.displaytexture = surface.GetTextureID("VGUI/fas2atts/suppressor")
end

tbl.attfunc = function(ply, wep)
	wep.dt.Suppressed = true
	wep.Recoil = wep.Recoil * 0.85
	wep.ViewKick = wep.ViewKick * 0.85
	wep.Damage = math.Round(wep.Damage * 0.9, 0)
end

tbl.clattfunc = function(ply, wep)
	wep.Recoil = wep.Recoil * 0.85
	wep.ViewKick = wep.ViewKick * 0.85
	wep.Damage = math.Round(wep.Damage * 0.9, 0)
end

tbl.deattfunc = function(ply, wep)
	wep.dt.Suppressed = false
	wep.Recoil = wep.Recoil / 0.85
	wep.ViewKick = wep.ViewKick / 0.85
	wep.Damage = math.Round(wep.Damage / 0.9, 0)
end

tbl.cldeattfunc = function(ply, wep)
	wep.Recoil = wep.Recoil / 0.85
	wep.ViewKick = wep.ViewKick / 0.85
	wep.Damage = math.Round(wep.Damage / 0.9, 0)
end

FAS2_AddAttachment(tbl)

tbl = {}

tbl.key = "pso1"
tbl.nameshort = "PSO-1"
tbl.namefull = "PSO-1"
tbl.aimpos = "PSO1Pos"
tbl.aimang = "PSO1Ang"
tbl.desc = {[1] = {t = "Provides 4x magnification.", c = Color(202, 255, 163, 255)},
	[2] = {t = "Is disorienting when engaging targets at close range.", c = Color(255, 137, 119, 255)},
	[3] = {t = "Narrow scope greatly reduces awareness.", c = Color(255, 137, 119, 255)}}

if CLIENT then
	tbl.displaytexture = surface.GetTextureID("VGUI/fas2atts/pso1")
end

tbl.clattfunc = function(ply, wep)
	wep.ViewKick = wep.ViewKick * 0.85
	wep.TargetViewModelFOV = 50
	wep.CanPeek = true
end

tbl.cldeattfunc = function(ply, wep)
	wep.ViewKick = wep.ViewKick / 0.85
	wep.TargetViewModelFOV = wep.TargetViewModelFOV_Orig and wep.TargetViewModelFOV_Orig or wep.ViewModelFOV_Orig
	wep.CanPeek = false
end

FAS2_AddAttachment(tbl)

tbl = {}

tbl.key = "leupold"
tbl.nameshort = "MK4"
tbl.namefull = "Leupold MK4"
tbl.aimpos = "LeupoldPos"
tbl.aimang = "LeupoldAng"
tbl.desc = {[1] = {t = "Provides 8x magnification.", c = Color(202, 255, 163, 255)},
	[2] = {t = "Is very disorienting when engaging targets at close range.", c = Color(255, 137, 119, 255)},
	[3] = {t = "Narrow scope greatly reduces awareness.", c = Color(255, 137, 119, 255)}}

if CLIENT then
	tbl.displaytexture = surface.GetTextureID("VGUI/fas2atts/mk4")
end

tbl.clattfunc = function(ply, wep)
	wep.CanPeek = true
end

tbl.cldeattfunc = function(ply, wep)
	wep.CanPeek = false
end

FAS2_AddAttachment(tbl)

tbl = {}

tbl.key = "acog"
tbl.nameshort = "ACOG 4x"
tbl.namefull = "ACOG 4x"
tbl.aimpos = "ACOGPos"
tbl.aimang = "ACOGAng"
tbl.desc = {[1] = {t = "Provides 4x magnification.", c = Color(202, 255, 163, 255)},
	[2] = {t = "Is disorienting when engaging targets at close range.", c = Color(255, 137, 119, 255)},
	[3] = {t = "Narrow scope greatly reduces awareness.", c = Color(255, 137, 119, 255)}}

if CLIENT then
	tbl.displaytexture = surface.GetTextureID("VGUI/fas2atts/acog")
end

tbl.clattfunc = function(ply, wep)
	wep.CanPeek = true
end

tbl.cldeattfunc = function(ply, wep)
	wep.CanPeek = false
end

FAS2_AddAttachment(tbl)

tbl = {}

tbl.key = "c79"
tbl.nameshort = "C79"
tbl.namefull = "ELCAN C79"
tbl.aimpos = "ELCANPos"
tbl.aimang = "ELCANAng"
tbl.desc = {[1] = {t = "Provides 3.4x magnification.", c = Color(202, 255, 163, 255)},
	[2] = {t = "Is disorienting when engaging targets at close range.", c = Color(255, 137, 119, 255)},
	[3] = {t = "Narrow scope greatly reduces awareness.", c = Color(255, 137, 119, 255)}}
	
tbl.clattfunc = function(ply, wep)
	wep.TargetViewModelFOV = 40
	wep.CanPeek = true
end

tbl.cldeattfunc = function(ply, wep)
	wep.AimFOV = wep.AimFOV_Orig
	wep.TargetViewModelFOV = wep.TargetViewModelFOV_Orig and wep.TargetViewModelFOV_Orig or wep.ViewModelFOV_Orig
	wep.CanPeek = false
end

if CLIENT then
	tbl.displaytexture = surface.GetTextureID("VGUI/fas2atts/c79")
end

FAS2_AddAttachment(tbl)

tbl = {}

tbl.key = "sks20mag"
tbl.nameshort = "20RND"
tbl.namefull = "20 Round Magazine"
tbl.namemenu = "20 Round SKS Mag"
tbl.desc = {[1] = {t = "Increases magazine size to 20 rounds.", c = Color(202, 255, 163, 255)},
	[2] = {t = "Greatly increases certain reload durations.", c = Color(255, 137, 119, 255)},
	[3] = {t = "Can only reload every 10 rounds if not empty.", c = Color(255, 137, 119, 255)}}

if CLIENT then
	tbl.displaytexture = surface.GetTextureID("VGUI/fas2atts/sks20mag")
end

tbl.attfunc = function(ply, wep)
	local mag = wep:Clip1()
	ply:SetAmmo(ply:GetAmmoCount(wep.Primary.Ammo) + mag, wep.Primary.Ammo)
	wep:SetClip1(0)
		
	wep.Primary.ClipSize = 20
end

tbl.clattfunc = function(ply, wep)
	wep.Primary.ClipSize = 20
	FAS2_PlayAnim(wep, wep.Anims.Idle_Empty, 0, 0)
end

tbl.deattfunc = function(ply, wep)
	local mag = wep:Clip1()
	ply:SetAmmo(ply:GetAmmoCount(wep.Primary.Ammo) + mag, wep.Primary.Ammo)
	wep:SetClip1(0)
	
	wep.Primary.ClipSize = 10
end

tbl.cldeattfunc = function(ply, wep)
	wep.Primary.ClipSize = 10
	FAS2_PlayAnim(wep, wep.Anims.Idle_Empty, 0, 0)
end

FAS2_AddAttachment(tbl)

tbl = {}

tbl.key = "sks30mag"
tbl.nameshort = "30RND"
tbl.namefull = "30 Round Magazine"
tbl.namemenu = "30 Round SKS Mag"
tbl.desc = {[1] = {t = "Increases magazine size to 30 rounds.", c = Color(202, 255, 163, 255)}}

if CLIENT then
	tbl.displaytexture = surface.GetTextureID("VGUI/fas2atts/sks30mag")
end

tbl.attfunc = function(ply, wep)
	local mag = wep:Clip1()
	ply:GiveAmmo(mag, wep.Primary.Ammo)
	wep:SetClip1(0)
	
	wep.Primary.ClipSize = 30
end

tbl.clattfunc = function(ply, wep)
	wep.Primary.ClipSize = 30
	FAS2_PlayAnim(wep, wep.Anims.Idle_Empty, 0, 0)
end

tbl.deattfunc = function(ply, wep)
	local mag = wep:Clip1()
	ply:GiveAmmo(mag, wep.Primary.Ammo)
	wep:SetClip1(0)
	
	wep.Primary.ClipSize = 10
end

tbl.cldeattfunc = function(ply, wep)
	wep.Primary.ClipSize = 10
	FAS2_PlayAnim(wep, wep.Anims.Idle_Empty, 0, 0)
end

FAS2_AddAttachment(tbl)

tbl = {}

tbl.key = "mp5k30mag"
tbl.nameshort = "30RND"
tbl.namefull = "30 Round Magazine"
tbl.namemenu = "30 Round MP5K Mag"
tbl.desc = {[1] = {t = "Increases magazine size to 30 rounds.", c = Color(202, 255, 163, 255)}}

if CLIENT then
	tbl.displaytexture = surface.GetTextureID("VGUI/fas2atts/mp5k30rnd")
end

tbl.attfunc = function(ply, wep)
	local mag = wep:Clip1()
	ply:GiveAmmo(mag, wep.Primary.Ammo)
	wep:SetClip1(0)
	
	wep.Primary.ClipSize = 30
end

tbl.clattfunc = function(ply, wep)
	wep.Primary.ClipSize = 30
end

tbl.deattfunc = function(ply, wep)
	local mag = wep:Clip1()
	ply:GiveAmmo(mag, wep.Primary.Ammo)
	wep:SetClip1(0)
	
	wep.Primary.ClipSize = 15
end

tbl.cldeattfunc = function(ply, wep)
	wep.Primary.ClipSize = 15
end

FAS2_AddAttachment(tbl)

tbl = {}

tbl.key = "sg55x30mag"
tbl.nameshort = "30RND"
tbl.namefull = "30 Round Magazine"
tbl.namemenu = "30 Round SG55X Mag"
tbl.desc = {[1] = {t = "Increases magazine size to 30 rounds.", c = Color(202, 255, 163, 255)}}

if CLIENT then
	tbl.displaytexture = surface.GetTextureID("VGUI/fas2atts/sg55xmag")
end

tbl.attfunc = function(ply, wep)
	local mag = wep:Clip1()
	ply:SetAmmo(ply:GetAmmoCount(wep.Primary.Ammo) + mag, wep.Primary.Ammo)
	wep:SetClip1(0)
		
	wep.Primary.ClipSize = 30
end

tbl.clattfunc = function(ply, wep)
	wep.Primary.ClipSize = 30
end

tbl.deattfunc = function(ply, wep)
	local mag = wep:Clip1()
	ply:SetAmmo(ply:GetAmmoCount(wep.Primary.Ammo) + mag, wep.Primary.Ammo)
	wep:SetClip1(0)
	
	wep.Primary.ClipSize = 20
end

tbl.cldeattfunc = function(ply, wep)
	wep.Primary.ClipSize = 20
end

FAS2_AddAttachment(tbl)

tbl = {}

tbl.key = "m2120mag"
tbl.nameshort = "20RND"
tbl.namefull = "20 Round Magazine"
tbl.namemenu = "20 Round M21 Mag"
tbl.desc = {[1] = {t = "Increases magazine size to 20 rounds.", c = Color(202, 255, 163, 255)}}

if CLIENT then
	tbl.displaytexture = surface.GetTextureID("VGUI/fas2atts/m2120rndmag")
end

tbl.attfunc = function(ply, wep)
	local mag = wep:Clip1()
	ply:SetAmmo(ply:GetAmmoCount(wep.Primary.Ammo) + mag, wep.Primary.Ammo)
	wep:SetClip1(0)
		
	wep.Primary.ClipSize = 20
end

tbl.clattfunc = function(ply, wep)
	wep.Primary.ClipSize = 20
end

tbl.deattfunc = function(ply, wep)
	local mag = wep:Clip1()
	ply:SetAmmo(ply:GetAmmoCount(wep.Primary.Ammo) + mag, wep.Primary.Ammo)
	wep:SetClip1(0)
	
	wep.Primary.ClipSize = 10
end

tbl.cldeattfunc = function(ply, wep)
	wep.Primary.ClipSize = 10
end

FAS2_AddAttachment(tbl)

tbl = {}

tbl.key = "foregrip"
tbl.nameshort = "Grip"
tbl.namefull = "Foregrip"
tbl.desc = {[1] = {t = "Decreases recoil by 20%", c = Color(202, 255, 163, 255)}}

if CLIENT then
	tbl.displaytexture = surface.GetTextureID("VGUI/fas2atts/foregrip")
end

tbl.attfunc = function(ply, wep)
	wep.ViewKick = wep.ViewKick * 0.8
	wep.Recoil = wep.Recoil * 0.8
	wep.Grip = true
end

tbl.clattfunc = function(ply, wep)
	wep.ViewKick = wep.ViewKick * 0.8
	wep.Recoil = math.Round(wep.Recoil * 0.8, 2)
	wep.Grip = true
	FAS2_PlayAnim(wep, wep.Anims.Idle_Grip, 1, wep.Wep:GetCycle())
end

tbl.deattfunc = function(ply, wep)
	wep.ViewKick = wep.ViewKick / 0.8
	wep.Recoil = wep.Recoil / 0.8
	wep.Grip = false
end

tbl.cldeattfunc = function(ply, wep)
	wep.ViewKick = wep.ViewKick / 0.8
	wep.Recoil = math.Round(wep.Recoil / 0.8, 2)
	wep.Grip = false
	FAS2_PlayAnim(wep, wep.Anims.Idle, 1, wep.Wep:GetCycle())
end

FAS2_AddAttachment(tbl)

tbl = {}

tbl.key = "harrisbipod"
tbl.nameshort = "Bipod"
tbl.namefull = "Harris Bipod"
tbl.desc = {[1] = {t = "When deployed:", c = Color(255, 255, 255, 255)},
	[2] = {t = "Decreases recoil by 70%", c = Color(202, 255, 163, 255)},
	[3] = {t = "Decreases maximum spread from continuous fire by 70%", c = Color(202, 255, 163, 255)},
	[4] = {t = "Decreases mouse sensitivity by 30%", c = Color(202, 255, 163, 255)}}

if CLIENT then
	tbl.displaytexture = surface.GetTextureID("VGUI/fas2atts/harrisbipod")
end

tbl.attfunc = function(ply, wep)
	wep.InstalledBipod = true
end

tbl.clattfunc = function(ply, wep)
	wep.InstalledBipod = true
end

tbl.deattfunc = function(ply, wep)
	wep.InstalledBipod = false
end

tbl.cldeattfunc = function(ply, wep)
	wep.InstalledBipod = false
end

FAS2_AddAttachment(tbl)

tbl = {}

tbl.key = "uziwoodenstock"
tbl.nameshort = "Stock"
tbl.namefull = "Wooden stock"
tbl.desc = {[1] = {t = "Decreases recoil by 20%", c = Color(202, 255, 163, 255)}}

if CLIENT then
	tbl.displaytexture = surface.GetTextureID("VGUI/fas2atts/uzi_woodenstock")
end

tbl.attfunc = function(ply, wep)
	wep.ViewKick = wep.ViewKick * 0.8
	wep.Recoil = wep.Recoil * 0.8
end

tbl.clattfunc = function(ply, wep)
	wep.ViewKick = wep.ViewKick * 0.8
	wep.Recoil = wep.Recoil * 0.8
end

tbl.deattfunc = function(ply, wep)
	wep.ViewKick = wep.ViewKick / 0.8
	wep.Recoil = wep.Recoil / 0.8
end

tbl.cldeattfunc = function(ply, wep)
	wep.ViewKick = wep.ViewKick / 0.8
	wep.Recoil = wep.Recoil / 0.8
end

FAS2_AddAttachment(tbl)

tbl = {}

tbl.key = "slugrounds"
tbl.nameshort = "Slug"
tbl.namefull = "Slug rounds"
tbl.desc = {[1] = {t = "Greatly increases damage.", c = Color(202, 255, 163, 255)},
	[2] = {t = "Greatly increases effective range.", c = Color(202, 255, 163, 255)},
	[3] = {t = "Greatly increases accuracy.", c = Color(202, 255, 163, 255)},
	[4] = {t = "Only fires out 1 round.", c = Color(255, 137, 119, 255)}}

if CLIENT then
	tbl.displaytexture = surface.GetTextureID("VGUI/fas2atts/slugrounds")
end

tbl.attfunc = function(ply, wep)
	wep.Damage = wep.Damage * 9
	wep.Shots = 1
	wep.ClumpSpreadOld = wep.ClumpSpread
	wep.ClumpSpread = nil
	wep.CaseLengthOld = wep.CaseLength 
	wep.BulletLengthOld = wep.BulletLength 
	wep.CaseLength = 20
	wep.BulletLength = 2
	wep:UnloadWeapon()
	wep:CalculateEffectiveRange()
end

tbl.clattfunc = function(ply, wep)
	wep.Damage = wep.Damage * 9
	wep.Shots = 1
	wep.ClumpSpreadOld = wep.ClumpSpread
	wep.ClumpSpread = nil
	wep:UnloadWeapon()
end

tbl.deattfunc = function(ply, wep)
	wep.Damage = wep.Damage / 9
	wep.Shots = 12
	wep.ClumpSpread = wep.ClumpSpreadOld
	wep.ClumpSpreadOld = nil
	wep.CaseLength = wep.CaseLengthOld 
	wep.BulletLength = wep.BulletLengthOld 
	wep.CaseLengthOld = nil
	wep.BulletLengthOld = nil
	wep:UnloadWeapon()
	wep:CalculateEffectiveRange()
end

tbl.cldeattfunc = function(ply, wep)
	wep.Damage = wep.Damage / 9
	wep.Shots = 12
	wep.ClumpSpread = wep.ClumpSpreadOld
	wep.ClumpSpreadOld = nil
	wep:UnloadWeapon()
end

FAS2_AddAttachment(tbl)

local ply, vm

function FAS2_PlayAnim(wep, anim, speed, cyc, time)
	speed = speed and speed or 1
	cyc = cyc and cyc or 0
	time = time or 0
			
	if type(anim) == "table" then
		anim = table.Random(anim)
	end
	
	if game.SinglePlayer() then
		if SERVER then
			if wep.Sounds[anim] then
				wep.CurSoundTable = wep.Sounds[anim]
				wep.CurSoundEntry = 1
				wep.SoundSpeed = speed
				wep.SoundTime = CurTime() + time
			end
		end
			/*if wep.Sounds[anim] then
				for k, v in pairs(wep.Sounds[anim]) do
					timer.Simple(v.time, function()
						if IsValid(ply) and ply:Alive() and IsValid(wep) and wep == ply:GetActiveWeapon() then
							wep:EmitSound(v.sound, 70, 100)
						end
					end)
				end
			end
		end*/
	else
		if wep.Sounds[anim] then
			wep.CurSoundTable = wep.Sounds[anim]
			wep.CurSoundEntry = 1
			wep.SoundSpeed = speed
			wep.SoundTime = CurTime() + time
		end
		
		/*if wep.Sounds[anim] then
			for k, v in pairs(wep.Sounds[anim]) do
				timer.Simple(v.time, function()
					wep:EmitSound(v.sound, 70, 100)
				end)
			end
		end*/
	end
	
	if SERVER and game.SinglePlayer() then
		ply = Entity(1)
		
		umsg.Start("FAS2ANIM", ply)
			umsg.String(anim)
			umsg.Float(speed)
			umsg.Float(cyc)
		umsg.End()
	end
		
	if CLIENT then
		vm = wep.Wep
		
		wep.CurAnim = string.lower(anim)
		
		if IsValid( vm ) then
			vm:SetCycle(cyc)
			vm:SetSequence(anim)
			vm:SetPlaybackRate(speed)
		end
	end
end

function FAS2_Move(p, m)
	if p:Alive() then
		wep = p:GetActiveWeapon()
		
		if IsValid(wep) then
			if wep.IsFAS2Weapon then
				if not p:KeyDown(IN_SPEED) then
					if wep.dt.Status == FAS_STAT_ADS then
						if p:Crouching() then
							m:SetMaxSpeed(p:GetWalkSpeed() * p:GetCrouchedWalkSpeed())
						else
							m:SetMaxSpeed(p:GetWalkSpeed() * 0.7)
						end
					end
				end
			end
		end
	end
end

hook.Add("Move", "FAS2_Move", FAS2_Move)

if CLIENT then
	local s
	
	local function FAS2_GetAttachments(um)
		s = um:ReadString()
		--FAS2AttOnMe = {}
		
		--s = string.Explode(" ", s)
		
		--for k, v in pairs(s) do
		--	table.insert(FAS2AttOnMe, v)
		--end
	end

	usermessage.Hook("FAS2_GETATTS", FAS2_GetAttachments)

	local function FAS2_NoAttachments()
		--FAS2AttOnMe = {}
	end

	usermessage.Hook("FAS2_NOATTS", FAS2_NoAttachments)

	local function FAS2_PickUpAttachment(um)
		s = um:ReadString()
		
		--if not FAS2AttOnMe then
		--	FAS2AttOnMe = {}
		--end
		
		--table.insert(FAS2AttOnMe, s)
		--chat.AddText(Color(255, 255, 255), "Got new weapon attachment: ", Color(50, 150, 255), (FAS2_Attachments[s].namemenu and FAS2_Attachments[s].namemenu or FAS2_Attachments[s].namefull), Color(255, 255, 255), ".")
	end

	usermessage.Hook("FAS2_PICKUPATT", FAS2_PickUpAttachment)

	local function FAS2_PickUpAttachmentSilent(um)
		s = um:ReadString()
		--FAS2AttOnMe = FAS2AttOnMe or {}
		
		--table.insert(FAS2AttOnMe, s)
	end

	usermessage.Hook("FAS2_PICKUPATTSIL", FAS2_PickUpAttachmentSilent)
	
	net.Receive("FAS2_SENDATTACHMENTS", function(l, c)
		--FAS2AttOnMe = net.ReadTable()
	end)

	//local ADSR = {a = 0, d = 0, s = 0, r = 0, current = 0, target = 0, time = 0, state = 4} 
	local FAS2Recoil = {amt = 0, target = 0, rate = 0, delay = 0}
	CreateClientConVar("fas2_nohud", "0", true, true)
	CreateClientConVar("fas2_customhud", "1", true, true)
	CreateClientConVar("fas2_differentorigins", "0", true, true)
	CreateClientConVar("fas2_handrig", "0", true, true)
	CreateClientConVar("fas2_holdtoaim", "0", true, true)
	CreateClientConVar("fas2_alternatebipod", "1", true, true)
	CreateClientConVar("fas2_handskin", "1", true, true)
	CreateClientConVar("fas2_gloveskin", "1", true, true)
	CreateClientConVar("fas2_sleeveskin", "1", true, true)
	CreateClientConVar("fas2_headbob_intensity", "1", true, true)
	CreateClientConVar("fas2_textsize", "1", true, true)
	CreateClientConVar("fas2_blureffects", "0", true, true)
	CreateClientConVar("fas2_blureffects_depth", "0", true, true)
	CreateClientConVar("fas2_hitmarker", "0", true, true)
	
	NumberToTexture = {[1] = "models/weapons/view/hands/hand",
		[2] = "models/weapons/view/hands/hand_tan",
		[3] = "models/weapons/view/hands/hand_black",
		[4] = "models/weapons/view/hands/hand_camo"}
		
	NumberToGlove = {[1] = "models/weapons/view/hands/nomex",
		[2] = "models/weapons/view/hands/black",
		[3] = "models/weapons/view/hands/desertkhaki",
		[4] = "models/weapons/view/hands/multicam"}
		
	NumberToSleeve = {[1] = "models/weapons/view/hands/sleeve",
		[2] = "models/weapons/view/hands/sleeve2"}
	
	-- This is horrible, but fuck you
	
	FAS2Shells = {}
	FAS2Shells["10x25"] = {m = "models/shells/10x25mm.mdl", s = {"player/pl_shell1.wav", "player/pl_shell2.wav", "player/pl_shell3.wav"}}
	FAS2Shells["9x19"] = {m = "models/shells/9x19mm.mdl", s = {"player/pl_shell1.wav", "player/pl_shell2.wav", "player/pl_shell3.wav"}}
	FAS2Shells["9x18"] = {m = "models/shells/9x18mm.mdl", s = {"player/pl_shell1.wav", "player/pl_shell2.wav", "player/pl_shell3.wav"}}
	FAS2Shells["50bmg"] = {m = "models/shells/50bmg.mdl", s = {"player/pl_shell1.wav", "player/pl_shell2.wav", "player/pl_shell3.wav"}}
	FAS2Shells["50beowulf"] = {m = "models/shells/50beowulf.mdl", s = {"player/pl_shell1.wav", "player/pl_shell2.wav", "player/pl_shell3.wav"}}
	FAS2Shells["50ae"] = {m = "models/shells/50ae.mdl", s = {"player/pl_shell1.wav", "player/pl_shell2.wav", "player/pl_shell3.wav"}}
	FAS2Shells["44mag"] = {m = "models/shells/44mag.mdl", s = {"player/pl_shell1.wav", "player/pl_shell2.wav", "player/pl_shell3.wav"}}
	FAS2Shells["454casull"] = {m = "models/shells/454casull.mdl", s = {"player/pl_shell1.wav", "player/pl_shell2.wav", "player/pl_shell3.wav"}}
	FAS2Shells["45acp"] = {m = "models/shells/45acp.mdl", s = {"player/pl_shell1.wav", "player/pl_shell2.wav", "player/pl_shell3.wav"}}
	FAS2Shells["380acp"] = {m = "models/shells/380acp.mdl", s = {"player/pl_shell1.wav", "player/pl_shell2.wav", "player/pl_shell3.wav"}}
	FAS2Shells["357sig"] = {m = "models/shells/357sig.mdl", s = {"player/pl_shell1.wav", "player/pl_shell2.wav", "player/pl_shell3.wav"}}
	FAS2Shells["357mag"] = {m = "models/shells/357mag.mdl", s = {"player/pl_shell1.wav", "player/pl_shell2.wav", "player/pl_shell3.wav"}}
	FAS2Shells["12g_buck"] = {m = "models/shells/12g_buck.mdl", s = {"weapons/fx/tink/shotgun_shell1.wav", "weapons/fx/tink/shotgun_shell2.wav", "weapons/fx/tink/shotgun_shell3.wav"}}
	FAS2Shells["12g_slug"] = {m = "models/shells/12g_slug.mdl", s = {"weapons/fx/tink/shotgun_shell1.wav", "weapons/fx/tink/shotgun_shell2.wav", "weapons/fx/tink/shotgun_shell3.wav"}}
	FAS2Shells["7.62x39"] = {m = "models/shells/7_62x39mm.mdl", s = {"player/pl_shell1.wav", "player/pl_shell2.wav", "player/pl_shell3.wav"}}
	FAS2Shells["7.62x39_live"] = {m = "models/shells/7_62x39mm_live.mdl", s = {"player/pl_shell1.wav", "player/pl_shell2.wav", "player/pl_shell3.wav"}}
	FAS2Shells["5.56x45"] = {m = "models/shells/5_56x45mm.mdl", s = {"player/pl_shell1.wav", "player/pl_shell2.wav", "player/pl_shell3.wav"}}
	FAS2Shells["7.62x51"] = {m = "models/shells/7_62x51mm.mdl", s = {"player/pl_shell1.wav", "player/pl_shell2.wav", "player/pl_shell3.wav"}}
	FAS2Shells["5.45x39"] = {m = "models/shells/5_45x39mm.mdl", s = {"player/pl_shell1.wav", "player/pl_shell2.wav", "player/pl_shell3.wav"}}
	FAS2Shells["23x75"] = {m = "models/shells/23mm.mdl", s = {"weapons/fx/tink/shotgun_shell1.wav", "weapons/fx/tink/shotgun_shell2.wav", "weapons/fx/tink/shotgun_shell3.wav"}}
	FAS2Shells["stripper"] = {m = "models/shells/sks_clip.mdl"}
	
	function FAS2_MakeFakeShell(shell, pos, ang, vel, time, removetime)
		if not shell or not pos or not ang then
			return
		end
		
		local t = FAS2Shells[shell]
		
		if not t then
			return
		end
		
		vel = vel or Vector(0, 0, -100)
		vel = vel + VectorRand() * 5
		time = time or 0.5
		removetime = removetime or 5
		
		local ent = ClientsideModel(t.m, RENDERGROUP_BOTH) 
		ent:SetPos(pos)
		ent:PhysicsInitBox(Vector(-0.5, -0.15, -0.5), Vector(0.5, 0.15, 0.5))
		ent:SetAngles(ang)
		ent:SetMoveType(MOVETYPE_VPHYSICS) 
		ent:SetSolid(SOLID_VPHYSICS) 
		ent:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		
		local phys = ent:GetPhysicsObject()
		phys:SetMaterial("gmod_silent")
		phys:SetMass(10)
		phys:SetVelocity(vel)
		
		timer.Simple(time, function()
			if t.s then
				ent:EmitSound(table.Random(t.s), 35, 100)
			end
		end)
		
		SafeRemoveEntityDelayed(ent, removetime)
	end
	
	local function FAS2_InitPostEntity()
		ply = LocalPlayer()
		ply.FAS_FamiliarWeapons = {}
		
		for k, v in pairs(weapons.GetList()) do
			if v.VM then
				util.PrecacheModel(v.VM)
			end
		end
		
		for k, v in pairs(FAS2Shells) do
			util.PrecacheModel(v.m)
		end
	end
	
	hook.Add("InitPostEntity", "FAS2_InitPostEntity", FAS2_InitPostEntity)

	local function FAS2_HUDShouldDraw(n)
		if GetConVarNumber("fas2_customhud") > 0 then
			ply = LocalPlayer()
			
			if IsValid(ply) and ply:Alive() then
				wep = ply:GetActiveWeapon()
				
				if IsValid(wep) and wep.IsFAS2Weapon then
					if n == "CHudAmmo" or n == "CHudSecondaryAmmo" then
						return false
					end
				end
			end
		end
	end

	hook.Add("HUDShouldDraw", "FAS2_HUDShouldDraw", FAS2_HUDShouldDraw)
	
	local function FAS2_RenderScene()
		ply = LocalPlayer()
		wep = ply:GetActiveWeapon()
		
		if IsValid(wep) and wep.IsFAS2Weapon and wep.DrawRenderTarget then
			wep:DrawRenderTarget()
		end
	end
	
	hook.Add("RenderScene", "FAS2_RenderScene", FAS2_RenderScene)
	
	local EA, dif
	
	local function FAS2_CreateMove(c)
		ang = c:GetViewAngles()
		CT = CurTime()
		
		ply = LocalPlayer()
		wep = ply:GetActiveWeapon()
		
		if IsValid(wep) and wep.IsFAS2Weapon then
			if wep.dt.Bipod and wep.DeployAngle then
				EA = ply:EyeAngles()
				dif = math.AngleDifference(EA.y, wep.DeployAngle.y)
				
				if dif >= wep.BipodAngleLimitYaw then
					ang.y = wep.DeployAngle.y + wep.BipodAngleLimitYaw
				elseif dif <= -wep.BipodAngleLimitYaw then
					ang.y = wep.DeployAngle.y - wep.BipodAngleLimitYaw
				end
				
				dif = math.AngleDifference(EA.p, wep.DeployAngle.p)
				
				if dif >= wep.BipodAngleLimitPitch then
					ang.p = wep.DeployAngle.p + wep.BipodAngleLimitPitch
				elseif dif <= -wep.BipodAngleLimitPitch then
					ang.p = wep.DeployAngle.p - wep.BipodAngleLimitPitch
				end

				c:SetViewAngles(ang)
			end
	
			//if wep.dt.Status == FAS_STAT_ADS then
				//ang.p = ang.p + math.cos(CT * 1.5) * 0.001
				
				//c:SetViewAngles(ang)
			//end
		end
	end
	
	hook.Add("CreateMove", "FAS2_CreateMove", FAS2_CreateMove)
	
	/*local ang, ang2, CT
	
	local function FAS2_CreateMove(c)
		ang = c:GetViewAngles()
		CT = CurTime()
		
		if CT < FAS2Recoil.delay then
			FAS2Recoil.amt = Lerp(FrameTime() * 15, FAS2Recoil.amt, FAS2Recoil.target)
			
			print(FAS2Recoil.target, FAS2Recoil.amt, ang.p)
			ang.p = ang.p - (FAS2Recoil.target - FAS2Recoil.amt)
		else
			FAS2Recoil.rate = math.Clamp(FAS2Recoil.rate + 0.01, 0, 1)
			ang2 = Lerp(FrameTime() * 10 * FAS2Recoil.rate, FAS2Recoil.amt, 0)
			ang.p = ang.p + (FAS2Recoil.amt - ang2)
			
			FAS2Recoil.amt = ang2
		end
		
		c:SetViewAngles(ang)
		
		if CT > ADSR.time and ADSR.state < 5 then
			ADSR.time = CT + 0.15
			ADSR.state = ADSR.state + 1
		end
		
		if ADSR.state == 1 then -- A
			ang2 = Lerp(FrameTime() / ADSR.a, ADSR.current, ADSR.target)
			
			ang.p = ang.p + (ADSR.current - ang2)
			c:SetViewAngles(ang)
			
			ADSR.current = ang2
		elseif ADSR.state == 2 then -- D
			ang2 = Lerp(FrameTime() / ADSR.d, ADSR.current, ADSR.target * 0.5)
			
			ang.p = ang.p + (ADSR.current - ang2)
			c:SetViewAngles(ang)
			
			ADSR.current = ang2
		elseif ADSR.state == 4 then -- R (S = sustain, so no need to code it)
			ang2 = Lerp(FrameTime() / ADSR.r, ADSR.current, 0)
			
			ang.p = ang.p + (ADSR.current - ang2)
			c:SetViewAngles(ang)
			
			ADSR.current = ang2
		end
	end
	
	hook.Add("CreateMove", "FAS2_CreateMove", FAS2_CreateMove)
	
	function FAS2_StartRecoil(target, rate, delay)
		FAS2Recoil.target = target
		FAS2Recoil.amt = 0
		FAS2Recoil.rate = rate
		FAS2Recoil.delay = CurTime() + delay
	end*/
	
	//function FAS2_StartADSR(a, d, s, r, amt, target)
	//	ply = LocalPlayer()
		//ADSR = {a = a, d = d, s = s, r = r, current = amt, target = target + target, time = CurTime() + 0.1, state = 1}
	//end
	
	local cvar
	local HandMat = Material("models/weapons/view/hands/hand")
	local HandMat2 = Material("models/weapons/v_models/hands/hand")
	local GloveMat, GloveMat2 = Material("models/weapons/view/hands/nomex"), Material("models/weapons/v_models/hands/nomex")
	local SleeveMat, SleeveMat2 = Material("models/weapons/view/hands/sleeve"), Material("models/weapons/v_models/hands/sleeve")
	
	local function FAS2_ApplyRigNow(ply, com, args)
		cvar = GetConVarNumber("fas2_handrig")
		
		for k, v in pairs(LocalPlayer():GetWeapons()) do
			if v.IsFAS2Weapon and IsValid(v.Wep) then
				v.Wep:SetBodygroup(1, cvar)
				
				if IsValid(v.Nade) then
					v.Nade:SetBodygroup(1, cvar)
				end
			end
		end
		
		local t = NumberToTexture[GetConVarNumber("fas2_handskin")]

		HandMat:SetTexture("$basetexture", t and t or "models/weapons/view/hands/hand")
		HandMat2:SetTexture("$basetexture", t and t or "models/weapons/view/hands/hand")
		
		local t = NumberToSleeve[GetConVarNumber("fas2_sleeveskin")]

		SleeveMat:SetTexture("$basetexture", t and t or "models/weapons/view/hands/sleeve")
		SleeveMat2:SetTexture("$basetexture", t and t or "models/weapons/view/hands/sleeve")
		
		local t = NumberToGlove[GetConVarNumber("fas2_gloveskin")]

		GloveMat:SetTexture("$basetexture", t and t or "models/weapons/view/hands/nomex")
		GloveMat2:SetTexture("$basetexture", t and t or "models/weapons/view/hands/nomex")
	end
	
	concommand.Add("fas2_handrig_applynow", FAS2_ApplyRigNow)
	
	local PLY = debug.getregistry().Player
	local found
	
	function PLY:HasWeapon(s)
		found = false
		
		for k, v in pairs(self:GetWeapons()) do
			if v:GetClass() == s then
				found = true
				break
			end
		end
		
		return found
	end
	
	function FAS2_DrawGrenade()
		ply = LocalPlayer()
		wep = ply:GetActiveWeapon()
		
		if IsValid(wep) and wep.IsFAS2Weapon then
			wep.Nade:SetCycle(0)
			wep.Nade:SetPlaybackRate(1)
			wep.Nade:SetSequence("deploy")
			wep.Nade.LifeTime = CurTime() + 5
		end
	end
	
	function FAS2_PullGrenadePin()
		ply = LocalPlayer()
		wep = ply:GetActiveWeapon()
		
		if IsValid(wep) and wep.IsFAS2Weapon then
			wep.Nade:SetCycle(0)
			wep.Nade:SetPlaybackRate(1)
			wep.Nade:SetSequence("cook")
			wep.Nade.LifeTime = CurTime() + 5
			
			wep:AddEvent(0.2, function()
				wep:EmitSound("FAS2_M67.PinPull", 100, 100)
			end)

			wep:AddEvent(0.3, function()
				wep:EmitSound("FAS2_M67.Spoon", 100, 100)
			end)
		end
	end
	
	function FAS2_ThrowGrenade()
		ply = LocalPlayer()
		wep = ply:GetActiveWeapon()
		
		wep:EmitSound("weapons/handling/generic_cloth_fast" .. math.random(1, 2) .. ".wav", 100, math.random(95, 105))
		
		if IsValid(wep) and wep.IsFAS2Weapon then
			wep.Nade:SetCycle(0)
			wep.Nade:SetPlaybackRate(1)
			wep.Nade:SetSequence("throw")
			wep.Nade.LifeTime = CurTime() + 0.5
		end
	end
	
	--[[local function FAS2_PlayerTraceAttack(pl, dmginfo, dir, trace)
		if GetConVarNumber("fas2_hitmarker") > 0 then
			ply = LocalPlayer()
			
			if dmginfo:GetAttacker() == ply then
				wep = ply:GetActiveWeapon()
				
				if wep.IsFAS2Weapon then
					if wep.HitMarkerAlpha != 255 then
						wep.HitMarkerTime = CurTime() + 0.2
						wep.HitMarkerAlpha = 255
					end
				end
			end
		end
	end

	hook.Add("PlayerTraceAttack", "FAS2_PlayerTraceAttack", FAS2_PlayerTraceAttack)]]--
end

function AddAmmoType(name, text)
	game.AddAmmoType({name = name,
	dmgtype = DMG_BULLET})
	
	if CLIENT then
		language.Add(name .. "_ammo", text)
	end
end

AddAmmoType("9x19MM", "9x19MM Ammo")
AddAmmoType("9x18MM", "9x18MM Ammo")
AddAmmoType("10x25MM", "10x25MM Ammo")
AddAmmoType("7.62x51MM", "7.62x51MM Ammo")
AddAmmoType("5.56x45MM", "5.56x45MM Ammo")
AddAmmoType("5.45x39MM", "5.45x39MM Ammo")
AddAmmoType("7.62x39MM", "7.62x39MM Ammo")
AddAmmoType(".357 SIG", ".357 SIG Ammo")
AddAmmoType(".380 ACP", ".380 ACP Ammo")
AddAmmoType(".45 ACP", ".45 ACP Ammo")
AddAmmoType(".44 Magnum", ".44 Magnum Ammo")
AddAmmoType(".454 Casull", ".454 Casull Ammo")
AddAmmoType(".50 AE", ".50 AE Ammo")
AddAmmoType(".50 BMG", ".50 BMG Ammo")
AddAmmoType("12 Gauge", "12 Gauge Ammo")
AddAmmoType("23x75MMR", "23x75MMR Ammo")

AddAmmoType("40MM HE", "40MM HE Ammo")
AddAmmoType("40MM Smoke", "40MM Smoke Ammo")
AddAmmoType("M67 Grenades", "M67 Grenades")
AddAmmoType("Ammoboxes", "Ammoboxes")

AddAmmoType("Bandages", "Bandages")
AddAmmoType("Quikclots", "Quikclots")
AddAmmoType("Hemostats", "Hemostats")
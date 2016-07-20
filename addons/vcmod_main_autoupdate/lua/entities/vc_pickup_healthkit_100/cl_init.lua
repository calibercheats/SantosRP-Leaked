
-----------------------------------------------------
// Copyright © 2012-2016 VCMod (freemmaann). All Rights Reserved. if you have any complaints or ideas contact me: email - freemmaann@gmail.com or skype - comman6.

include('shared.lua')

ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:Initialize() self.VC_Color = Color(100, 255, 55, 255) self.VC_Length = 170 self.VC_Text = "Vehicle Repair 100%" self.VC_PVsb = util.GetPixelVisibleHandle() end

-----------------------------------------------------
--[[
	Name: cl_license.lua
	For: SantosRP
	By: Ultra
]]--

GM.License = (GAMEMODE or GM).License or {}
GM.License.m_tblActiveCars = (GAMEMODE or GM).License.m_tblActiveCars or {}

function GM.License:NetworkEntityCreated( eEnt )
	if eEnt:IsVehicle() and eEnt:GetClass() == "prop_vehicle_jeep" then
		self:RegisterNewCar( eEnt )
	end
end

function GM.License:PostDrawTranslucentRenderables()
	self:DrawCarPlates()
end

function GM.License:PlayerHasLicense( pPlayer )
	return GAMEMODE.Player:GetSharedGameVar( pPlayer, "driver_license", "" ) ~= ""
end

function GM.License:GetPlayerPlateNumber( pPlayer )
	if not GAMEMODE.Cars:PlayerHasCar( pPlayer ) then return "unknown" end
	return GAMEMODE.Cars:GetCurrentPlayerCar( pPlayer ):GetNWString( "plate_serial" )
end

function GM.License:GetPlayerFromPlateNumber( strPlateNumber )
	for k, v in pairs( player.GetAll() ) do
		if not GAMEMODE.Player:PlayerHasCar( v ) then continue end
		if GAMEMODE.Cars:GetCurrentPlayerCar( pPlayer ):GetNWString( "plate_serial" ):lower() == strPlateNumber:lower() then
			return v
		end
	end
end

--[[ License plate addon integrated and rewritten ]]--
function GM.License:RegisterNewCar( entCar )
	self.m_tblActiveCars[entCar] = true
end

function GM.License:DrawCarPlates()
	local pos = LocalPlayer():GetPos()
	local max = GAMEMODE.Config.RenderDist_Level3 ^2

	for car, _ in pairs( self.m_tblActiveCars ) do
		if not IsValid( car ) then self.m_tblActiveCars[car] = nil continue end
		if pos:DistToSqr( car:GetPos() ) > max then continue end
		self:DrawLPlate( car )
	end
end

--Draw func is pretty much the same for legacy support
surface.CreateFont( "PlateFontBig", {
	font = "Trebuchet",
	size = 128,
	antialias = true,
} )

GM.License.m_tblLPlateSize = { w = 512, h = 256 }
GM.License.m_matPlate = Material( "dan/plates.png", "" )
GM.License.m_bDrawPlateShadows = true
GM.License.m_colPlateShadow = Color( 170, 170, 170, 255 )
GM.License.m_colTextCol = Color( 20, 20, 20, 255 )
function GM.License:DrawLPlate( entCar )
	local data = GAMEMODE.Cars:GetCarByUID( entCar:GetNWString("UID", "") )
	if not data then data = GAMEMODE.Cars:GetJobCarByUID( entCar:GetNWString("UID", "") ) end
	if not data or not data.LPlates then return end

	local serial = entCar:GetNWString( "plate_serial", "" )
	if not serial or serial:len() < 1 then return end

	for _, data in pairs( data.LPlates ) do
		cam.Start3D2D( entCar:LocalToWorld(data.pos), entCar:LocalToWorldAngles(data.ang), data.scale )
			surface.SetMaterial( self.m_matPlate )
			surface.SetDrawColor( 255, 255, 255, 255 )
			surface.DrawTexturedRect(
				-self.m_tblLPlateSize.w /2 -6,
				-self.m_tblLPlateSize.h /2 -6,
				self.m_tblLPlateSize.w +12,
				self.m_tblLPlateSize.h +12
			)

			if self.m_bDrawPlateShadows then
				draw.SimpleText( 
					serial,
					"PlateFontBig",
					-2,
					2,
					self.m_colPlateShadow,
					TEXT_ALIGN_CENTER,
					TEXT_ALIGN_CENTER
				)
			end

			draw.SimpleText( 
				serial,
				"PlateFontBig",
				0,
				0, 
				self.m_colTextCol,
				TEXT_ALIGN_CENTER,
				TEXT_ALIGN_CENTER
			)
		cam.End3D2D()
	end
end

--[[ Game Vars ]]--
hook.Add( "GamemodeDefineGameVars", "DefineLicenseVars", function( pPlayer )
	GAMEMODE.Player:DefineSharedGameVar( "driver_license", "", "String", true )
end )
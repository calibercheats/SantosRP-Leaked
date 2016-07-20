
-----------------------------------------------------
--[[
	Name: salestruck.lua
	For: SantosRP
	By: Ultra
]]--

--Job protocols start at 50 to save space for other things in the gamemode
GM.Net:AddProtocol( "sales_truck", 52 )

local Job = {}
Job.ID = 8
Job.Enum = "JOB_SALES_TRUCK"
Job.TeamColor = Color( 255, 100, 160, 255 )
Job.Name = "Sales Truck Driver"
Job.Pay = {
	{ PlayTime = 0, Pay = 20 },
	{ PlayTime = 4 *(60 *60), Pay = 30 },
	{ PlayTime = 12 *(60 *60), Pay = 50 },
	{ PlayTime = 24 *(60 *60), Pay = 80 },
}
Job.PlayerCap = GM.Config.Job_SalesTruck_PlayerCap or { Min = 2, MinStart = 8, Max = 6, MaxEnd = 60 }
Job.ParkingLotPos = GM.Config.SalesParkingZone
Job.TruckSpawns = GM.Config.SalesCarSpawns
Job.TruckID = "sales_truck"
Job.m_tblTruckTypes = {
	[1] = { Name = "Mechanic", Skin = 4, Items = {
	["Crafting Table"] = 1200,
	["Assembly Table"] = 1200,
	["Gun Smithing Table"] = 3200,
	["Road Flare"] = 30,
	["Terracotta Pot"] = 45,
	["Stove"] = 570,

	--fluids
	["Cleaning Solution"] = 60,
	["Bucket of Fertilizer"] = 40,
	["Potting Soil"] = 30,

	--crafting items
	["Wood Plank"] = 350,
	["Paint Bucket"] = 190,
	["Metal Bracket"] = 140,
	["Metal Bar"] = 175,
	["Metal Plate"] = 145,
	["Metal Pipe"] = 85,
	["Metal Hook"] = 90,
	["Metal Bucket"] = 90,
	["Plastic Bucket"] = 100,
	["Wrench"] = 75,
	["Pliers"] = 70,
	["Car Battery"] = 500,
	["Circular Saw"] = 300,
	["Cinder Block"] = 115,
	["Bleach"] = 70,
	["Radiator"] = 540,
	["Crowbar"] = 60,
	["Engine Block"] = 3800,
	["Large Cardboard Box"] = 60,
	["Plastic Crate"] = 60,
	["Chunk of Plastic"] = 85,
	["Cloth"] = 35,
	["Rubber Tire"] = 120,

	--misc building items
	["Concrete Barrier"] = 70,
	["Wire Fence 01"] = 95,
	["Wire Fence 02"] = 70,
	["Wire Fence 03"] = 120,
	["Large Blast Door"] = 460,
	["Blast Door"] = 300,
	["Large Wood Plank"] = 40,
	["Large Wood Fence"] = 90,
	["Wood Fence"] = 90,
	} },
}

function Job:OnPlayerJoinJob( pPlayer )
end

function Job:OnPlayerQuitJob( pPlayer )
end

function GM.Net:PlayerBuySalesTruckItem( strItemID, intAmount )
	self:NewEvent( "sales_truck", "b" )
		net.WriteString( strItemID )
		net.WriteUInt( intAmount or 1, 8 )
	self:FireEvent()
end

GM.Net:RegisterEventHandle( "sales_truck", "open", function( intMsgLen, pPlayer )
	local truckEnt = net.ReadEntity()
	GAMEMODE.Gui:ShowSalesTruckMenu( truckEnt )
end )

GM.Jobs:Register( Job )
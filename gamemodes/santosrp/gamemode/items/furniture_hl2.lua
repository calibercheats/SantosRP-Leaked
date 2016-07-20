
-----------------------------------------------------
--[[
	Name: furniture_hl2.lua
	For: SantosRP
	By: Ultra
]]--

local Item = {}
Item.Name = "Round Table"
Item.Desc = "A round table."
Item.Type = "type_furniture"
Item.Model = "models/props_c17/FurnitureTable001a.mdl"
Item.Weight = 5
Item.Volume = 10
Item.HealthOverride = 1500
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Table"
Item.Desc = "A table."
Item.Type = "type_furniture"
Item.Model = "models/props_c17/FurnitureTable002a.mdl"
Item.Weight = 5
Item.Volume = 10
Item.HealthOverride = 3000
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Coffee Table"
Item.Desc = "A coffee table."
Item.Type = "type_furniture"
Item.Model = "models/props_c17/FurnitureTable003a.mdl"
Item.Weight = 5
Item.Volume = 10
Item.HealthOverride = 1500
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Shelf Unit 1"
Item.Desc = "A shelf unit."
Item.Type = "type_furniture"
Item.Model = "models/props_c17/shelfunit01a.mdl"
Item.Weight = 20
Item.Volume = 40
Item.HealthOverride = 3000
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Shelf Unit 2"
Item.Desc = "A shelf unit."
Item.Type = "type_furniture"
Item.Model = "models/props_interiors/Furniture_shelf01a.mdl"
Item.Weight = 20
Item.Volume = 40
Item.HealthOverride = 2250
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

--[[local Item = {}
Item.Name = "Washing Machine"
Item.Desc = "A washing machine."
Item.Type = "type_furniture"
Item.Model = "models/props_c17/FurnitureWashingmachine001a.mdl"
Item.Weight = 40
Item.Volume = 40
Item.HealthOverride = 1500
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )]]

local Item = {}
Item.Name = "Metal Shelf"
Item.Desc = "A metal shelf for displaying items."
Item.Type = "type_furniture"
Item.Model = "models/props/cs_office/shelves_metal.mdl"
Item.Weight = 5
Item.Volume = 10
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Large Wooden Bar"
Item.Desc = "A big old pub style bar."
Item.Type = "type_furniture"
Item.Model = "models/props/cs_militia/bar01.mdl"
Item.Weight = 20
Item.Volume = 40
Item.HealthOverride = 3000
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Patio Table with Umbrella"
Item.Desc = "A metal patio table covered by an umbrella."
Item.Type = "type_furniture"
Item.Model = "models/props/de_tides/patio_table2.mdl"
Item.Weight = 5
Item.Volume = 15
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Sturdy Wooden Table"
Item.Desc = "An old but sturdy wooden table."
Item.Type = "type_furniture"
Item.Model = "models/props/cs_italy/it_mkt_table2.mdl"
Item.Weight = 5
Item.Volume = 15
Item.CanDrop = true
Item.HealthOverride = 1500
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Wooden Display Table"
Item.Desc = "A tilted wooden display table."
Item.Type = "type_furniture"
Item.Model = "models/props/cs_italy/it_mkt_table1.mdl"
Item.Weight = 5
Item.Volume = 15
Item.CanDrop = true
Item.HealthOverride = 1500
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Metal Office Desk"
Item.Desc = "A nice metal office desk."
Item.Type = "type_furniture"
Item.Model = "models/props_office/desk_01.mdl"
Item.Weight = 10
Item.Volume = 15
Item.CanDrop = true
Item.HealthOverride = 1500
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Elegant Dining Table"
Item.Desc = "A very elegant wooden dining table."
Item.Type = "type_furniture"
Item.Model = "models/env/furniture/din_table/din_table_four.mdl"
Item.Weight = 5
Item.Volume = 10
Item.CanDrop = true
Item.HealthOverride = 1500
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Fancy End Table"
Item.Desc = "A well made wooden end table."
Item.Type = "type_furniture"
Item.Model = "models/env/furniture/deco_table/deco_table.mdl"
Item.Weight = 5
Item.Volume = 5
Item.CanDrop = true
Item.HealthOverride = 1500
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )


--Seating Props
local Item = {}
Item.Name = "Elegant Dining Chair"
Item.Desc = "A high-back elegant dining chair."
Item.Type = "type_furniture"
Item.Model = "models/env/furniture/din_chair/din_chair.mdl"
Item.Weight = 5
Item.Volume = 5
Item.HealthOverride = 1000
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Fancy Modern Chair"
Item.Desc = "A modern seat."
Item.Type = "type_furniture"
Item.Model = "models/env/furniture/decosofa_wood/decosofa_wood_sin.mdl"
Item.Weight = 5
Item.Volume = 10
Item.HealthOverride = 1000
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Leather Couch"
Item.Desc = "Medium quality leather couch."
Item.Type = "type_furniture"
Item.Model = "models/props/cs_office/sofa.mdl"
Item.Weight = 5
Item.Volume = 10
Item.HealthOverride = 1500
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Leather Chair"
Item.Desc = "Medium quality leather chair."
Item.Type = "type_furniture"
Item.Model = "models/props/cs_office/sofa_chair.mdl"
Item.Weight = 5
Item.Volume = 10
Item.HealthOverride = 1500
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Leather Office Chair"
Item.Desc = "Standard cheap leather office chair."
Item.Type = "type_furniture"
Item.Model = "models/props/cs_office/chair_office.mdl"
Item.Weight = 5
Item.Volume = 5
Item.HealthOverride = 1500
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Derelict Couch"
Item.Desc = "An old couch like found on the side of a road."
Item.Type = "type_furniture"
Item.Model = "models/props/cs_militia/couch.mdl"
Item.Weight = 5
Item.Volume = 8
Item.HealthOverride = 1500
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Wooden Bar Stool"
Item.Desc = "An old bar stool."
Item.Type = "type_furniture"
Item.Model = "models/props/cs_militia/barstool01.mdl"
Item.Weight = 2
Item.Volume = 4
Item.HealthOverride = 1500
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Metal Patio Chair"
Item.Desc = "A metal patio chair."
Item.Type = "type_furniture"
Item.Model = "models/props/de_tides/patio_chair2.mdl"
Item.Weight = 4
Item.Volume = 6
Item.HealthOverride = 1000
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Sofa 1"
Item.Desc = "Looks comfy."
Item.Type = "type_furniture"
Item.Model = "models/props_c17/FurnitureCouch001a.mdl"
Item.Weight = 10
Item.Volume = 15
Item.HealthOverride = 2000
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Sofa 2"
Item.Desc = "Looks comfy."
Item.Type = "type_furniture"
Item.Model = "models/props_c17/FurnitureCouch002a.mdl"
Item.Weight = 10
Item.Volume = 15
Item.HealthOverride = 2000
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Sofa 3"
Item.Desc = "Looks comfy."
Item.Type = "type_furniture"
Item.Model = "models/props_interiors/Furniture_Couch01a.mdl"
Item.Weight = 10
Item.Volume = 15
Item.HealthOverride = 2000
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Chair 1"
Item.Desc = "Looks comfy."
Item.Type = "type_furniture"
Item.Model = "models/props_interiors/Furniture_Couch02a.mdl"
Item.Weight = 5
Item.Volume = 10
Item.HealthOverride = 2000
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Chair 2"
Item.Desc = "Looks comfy."
Item.Type = "type_furniture"
Item.Model = "models/props_c17/FurnitureChair001a.mdl"
Item.Weight = 5
Item.Volume = 10
Item.HealthOverride = 2000
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Chair 3"
Item.Desc = "Looks comfy."
Item.Type = "type_furniture"
Item.Model = "models/props_c17/chair02a.mdl"
Item.Weight = 5
Item.Volume = 10
Item.HealthOverride = 2000
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Chair 4"
Item.Desc = "Looks comfy."
Item.Type = "type_furniture"
Item.Model = "models/props_interiors/Furniture_chair01a.mdl"
Item.Weight = 5
Item.Volume = 10
Item.HealthOverride = 2000
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Chair 5"
Item.Desc = "Looks comfy."
Item.Type = "type_furniture"
Item.Model = "models/props_interiors/Furniture_chair03a.mdl"
Item.Weight = 5
Item.Volume = 10
Item.HealthOverride = 2000
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Desk Chair 1"
Item.Desc = "Looks comfy."
Item.Type = "type_furniture"
Item.Model = "models/props_combine/breenchair.mdl"
Item.Weight = 10
Item.Volume = 20
Item.HealthOverride = 2000
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Desk Chair 2"
Item.Desc = "Looks comfy."
Item.Type = "type_furniture"
Item.Model = "models/props_c17/chair_office01a.mdl"
Item.Weight = 5
Item.Volume = 10
Item.HealthOverride = 2000
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

--Decorative

local Item = {}
Item.Name = "Wall Clock"
Item.Desc = "A wall clock."
Item.Type = "type_furniture"
Item.Model = "models/props_c17/clock01.mdl"
Item.Weight = 1
Item.Volume = 1
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Flower Planter"
Item.Desc = "Some flowers in a planter."
Item.Type = "type_furniture"
Item.Model = "models/props/de_tides/planter.mdl"
Item.Weight = 2
Item.Volume = 4
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Small Potted Plant"
Item.Desc = "A small pot with a tropical plant."
Item.Type = "type_furniture"
Item.Model = "models/env/decor/cheese_plant/cheese_plant.mdl"
Item.Weight = 2
Item.Volume = 4
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Large Potted Plant"
Item.Desc = "A large pot with a tropical plant."
Item.Type = "type_furniture"
Item.Model = "models/highrise/potted_plant_04.mdl"
Item.Weight = 5
Item.Volume = 10
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Wild Monkey Flowers"
Item.Desc = "Wild monkey flowers"
Item.Type = "type_furniture"
Item.Model = "models/plantlife/monkeyflower/jn_monkeyflower_group.mdl"
Item.Weight = 1
Item.Volume = 2
Item.CanDrop = true
Item.DropClass = "prop_physics_multiplayer"
GM.Inv:RegisterItem( Item )

--Storage containers

local Item = {}
Item.Name = "Storage Chest"
Item.Desc = "A large chest for storing items temporarily."
Item.Model = "models/Items/ammocrate_smg1.mdl"
Item.Weight = 50
Item.Volume = 100
Item.HealthOverride = 10000
Item.CanDrop = true
Item.LimitID = "storage chest"
Item.DropClass = "ent_storage_chest"
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 2, { ["vip_t1"] = 1, ["vip_t2"] = 1, ["vip_t3"] = 1, ["vip_t4"] = 1 } )

local Item = {}
Item.Name = "Dresser"
Item.Desc = "A dresser."
Item.Type = "type_furniture"
Item.Model = "models/props_c17/FurnitureDrawer001a.mdl"
Item.Weight = 20
Item.Volume = 30
Item.HealthOverride = 3000
Item.CanDrop = true
Item.LimitID = "dresser"
Item.DropClass = "ent_storage_chest"
Item.SetupEntity = function( tblItem, eEnt )
	eEnt:Setup( tblItem.Model, 300, 2 )
end
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 2, { ["vip_t1"] = 1, ["vip_t2"] = 1, ["vip_t3"] = 1, ["vip_t4"] = 1 } )

local Item = {}
Item.Name = "Cupboard"
Item.Desc = "A cupboard."
Item.Type = "type_furniture"
Item.Model = "models/props_c17/FurnitureCupboard001a.mdl"
Item.Weight = 75
Item.Volume = 100
Item.HealthOverride = 1500
Item.CanDrop = true
Item.LimitID = "cupboard"
Item.DropClass = "ent_storage_chest"
Item.SetupEntity = function( tblItem, eEnt )
	eEnt:Setup( tblItem.Model, 75, 2 )
end
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 2, { ["vip_t1"] = 1, ["vip_t2"] = 1, ["vip_t3"] = 1, ["vip_t4"] = 1 } )

local Item = {}
Item.Name = "Drawer Set 1"
Item.Desc = "An end table with drawers."
Item.Type = "type_furniture"
Item.Model = "models/props_c17/FurnitureDrawer002a.mdl"
Item.Weight = 25
Item.Volume = 50
Item.HealthOverride = 750
Item.CanDrop = true
Item.LimitID = "drawer set"
Item.DropClass = "ent_storage_chest"
Item.SetupEntity = function( tblItem, eEnt )
	eEnt:Setup( tblItem.Model, 50, 2 )
end
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 2, { ["vip_t1"] = 1, ["vip_t2"] = 1, ["vip_t3"] = 1, ["vip_t4"] = 1 } )

local Item = {}
Item.Name = "Drawer Set 2"
Item.Desc = "A cupboard."
Item.Type = "type_furniture"
Item.Model = "models/props_c17/FurnitureDrawer003a.mdl"
Item.Weight = 25
Item.Volume = 50
Item.HealthOverride = 1500
Item.CanDrop = true
Item.LimitID = "drawer set"
Item.DropClass = "ent_storage_chest"
Item.SetupEntity = function( tblItem, eEnt )
	eEnt:Setup( tblItem.Model, 50, 2 )
end
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 2, { ["vip_t1"] = 1, ["vip_t2"] = 1, ["vip_t3"] = 1, ["vip_t4"] = 1 } )

local Item = {}
Item.Name = "Desk"
Item.Desc = "A desk."
Item.Type = "type_furniture"
Item.Model = "models/props_interiors/Furniture_Desk01a.mdl"
Item.Weight = 40
Item.Volume = 50
Item.HealthOverride = 2000
Item.CanDrop = true
Item.LimitID = "desk"
Item.DropClass = "ent_storage_chest"
Item.SetupEntity = function( tblItem, eEnt )
	eEnt:Setup( tblItem.Model, 100, 2 )
end
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 2, { ["vip_t1"] = 1, ["vip_t2"] = 1, ["vip_t3"] = 1, ["vip_t4"] = 1 } )

local Item = {}
Item.Name = "Fancy Desk"
Item.Desc = "A fancy desk."
Item.Type = "type_furniture"
Item.Model = "models/props_combine/breendesk.mdl"
Item.Weight = 125
Item.Volume = 75
Item.HealthOverride = 3000
Item.CanDrop = true
Item.LimitID = "desk"
Item.DropClass = "ent_storage_chest"
Item.SetupEntity = function( tblItem, eEnt )
	eEnt:Setup( tblItem.Model, 125, 2 )
end
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 2, { ["vip_t1"] = 1, ["vip_t2"] = 1, ["vip_t3"] = 1, ["vip_t4"] = 1 } )

--[[local Item = {}
Item.Name = "Vanity Set"
Item.Desc = "A vanity set."
Item.Type = "type_furniture"
Item.Model = "models/props_interiors/Furniture_Vanity01a.mdl"
Item.Weight = 20
Item.Volume = 65
Item.HealthOverride = 1250
Item.CanDrop = true
Item.LimitID = "vanity set"
Item.DropClass = "ent_storage_chest"
Item.SetupEntity = function( tblItem, eEnt )
	eEnt:Setup( tblItem.Model, 25, 2 )
end
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 2, { ["vip"] = 1 } )]]

local Item = {}
Item.Name = "File Cabinet"
Item.Desc = "A file cabinet."
Item.Type = "type_furniture"
Item.Model = "models/props_lab/filecabinet02.mdl"
Item.Weight = 35
Item.Volume = 15
Item.HealthOverride = 750
Item.CanDrop = true
Item.LimitID = "file cabinet"
Item.DropClass = "ent_storage_chest"
Item.SetupEntity = function( tblItem, eEnt )
	eEnt:Setup( tblItem.Model, 50 )
end
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 2, { ["vip_t1"] = 1, ["vip_t2"] = 1, ["vip_t3"] = 1, ["vip_t4"] = 1 } )

local Item = {}
Item.Name = "Large File Cabinet"
Item.Desc = "A large file cabinet."
Item.Type = "type_furniture"
Item.Model = "models/props_wasteland/controlroom_filecabinet002a.mdl"
Item.Weight = 55
Item.Volume = 40
Item.HealthOverride = 1000
Item.CanDrop = true
Item.LimitID = "file cabinet"
Item.DropClass = "ent_storage_chest"
Item.SetupEntity = function( tblItem, eEnt )
	eEnt:Setup( tblItem.Model, 100 )
end
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 2, { ["vip_t1"] = 1, ["vip_t2"] = 1, ["vip_t3"] = 1, ["vip_t4"] = 1 } )

--[[Chairs & Other Seats

local Item = {}
Item.Name = "Sofa 1"
Item.Desc = "Looks comfy."
Item.Type = "type_furniture"
Item.Model = "models/props_c17/FurnitureCouch001a.mdl"
Item.Weight = 250
Item.Volume = 50
Item.HealthOverride = 3000
Item.CanDrop = true
Item.DropClass = "ent_base_seat"
Item.SetupEntity = function( tblItem, eEnt )
	eEnt:Setup( tblItem.Model, {
		{ mdl = 'models/nova/jeep_seat.mdl', pos = Vector('1.278320 13.268799 -8.068119'), ang = Angle('-0.000 -90.000 0.000') },
		{ mdl = 'models/nova/jeep_seat.mdl', pos = Vector('0.689941 -14.466309 -8.384876'), ang = Angle('-0.000 -89.995 0.000') },
	} )
end
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Sofa 2"
Item.Desc = "Looks comfy."
Item.Type = "type_furniture"
Item.Model = "models/props_c17/FurnitureCouch002a.mdl"
Item.Weight = 250
Item.Volume = 50
Item.HealthOverride = 3000
Item.CanDrop = true
Item.DropClass = "ent_base_seat"
Item.SetupEntity = function( tblItem, eEnt )
	eEnt:Setup( tblItem.Model, {
		{ mdl = 'models/nova/jeep_seat.mdl', pos = Vector('-0.472656 11.187744 -11.931358'), ang = Angle('-0.000 -90.000 0.000') },
		{ mdl = 'models/nova/jeep_seat.mdl', pos = Vector('-0.307129 -11.648926 -11.713718'), ang = Angle('-0.000 -90.000 0.000') },
	} )
end
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Sofa 3"
Item.Desc = "Looks comfy."
Item.Type = "type_furniture"
Item.Model = "models/props_interiors/Furniture_Couch01a.mdl"
Item.Weight = 250
Item.Volume = 50
Item.HealthOverride = 3000
Item.CanDrop = true
Item.DropClass = "ent_base_seat"
Item.SetupEntity = function( tblItem, eEnt )
	eEnt:Setup( tblItem.Model, {
		{ mdl = 'models/nova/jeep_seat.mdl', pos = Vector('1.036133 -17.386230 -13.733255'), ang = Angle('-0.000 -90.000 0.000') },
		{ mdl = 'models/nova/jeep_seat.mdl', pos = Vector('0.187012 15.602539 -13.326269'), ang = Angle('-0.000 -89.995 0.000') },
	} )
end
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Chair 1"
Item.Desc = "Looks comfy."
Item.Type = "type_furniture"
Item.Model = "models/props_interiors/Furniture_Couch02a.mdl"
Item.Weight = 175
Item.Volume = 40
Item.HealthOverride = 2500
Item.CanDrop = true
Item.DropClass = "ent_base_seat"
Item.SetupEntity = function( tblItem, eEnt )
	eEnt:Setup( tblItem.Model, {
		{ mdl = 'models/nova/jeep_seat.mdl', pos = Vector('1.360809 -1.729867 -13.827532'), ang = Angle('-0.000 -90.005 -0.006') },
	} )
end
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Chair 2"
Item.Desc = "Looks comfy."
Item.Type = "type_furniture"
Item.Model = "models/props_c17/FurnitureChair001a.mdl"
Item.Weight = 20
Item.Volume = 40
Item.HealthOverride = 500
Item.CanDrop = true
Item.DropClass = "ent_base_seat"
Item.SetupEntity = function( tblItem, eEnt )
	eEnt:Setup( tblItem.Model, {
		{ mdl = 'models/nova/jeep_seat.mdl', pos = Vector('-4.826149 -0.268556 -11.374269'), ang = Angle('0.054 -90.110 -0.368') },
	} )
end
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Chair 3"
Item.Desc = "Looks comfy."
Item.Type = "type_furniture"
Item.Model = "models/props_c17/chair02a.mdl"
Item.Weight = 20
Item.Volume = 40
Item.HealthOverride = 500
Item.CanDrop = true
Item.DropClass = "ent_base_seat"
Item.SetupEntity = function( tblItem, eEnt )
	eEnt:Setup( tblItem.Model, {
		{ mdl = 'models/nova/jeep_seat.mdl', pos = Vector('12.797648 4.653186 -5.378874'), ang = Angle('-0.000 -90.115 -0.066') },
	} )
end
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Chair 4"
Item.Desc = "Looks comfy."
Item.Type = "type_furniture"
Item.Model = "models/props_interiors/Furniture_chair01a.mdl"
Item.Weight = 20
Item.Volume = 40
Item.HealthOverride = 500
Item.CanDrop = true
Item.DropClass = "ent_base_seat"
Item.SetupEntity = function( tblItem, eEnt )
	eEnt:Setup( tblItem.Model, {
		{ mdl = 'models/nova/jeep_seat.mdl', pos = Vector('-4.164030 0.233224 -10.051991'), ang = Angle('0.006 -90.538 0.005') },
	} )
end
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Chair 5"
Item.Desc = "Looks comfy."
Item.Type = "type_furniture"
Item.Model = "models/props_interiors/Furniture_chair03a.mdl"
Item.Weight = 20
Item.Volume = 40
Item.HealthOverride = 500
Item.CanDrop = true
Item.DropClass = "ent_base_seat"
Item.SetupEntity = function( tblItem, eEnt )
	eEnt:Setup( tblItem.Model, {
		{ mdl = 'models/nova/jeep_seat.mdl', pos = Vector('-1.609858 -0.659344 -10.128227'), ang = Angle('-0.033 -89.698 -0.000') },
	} )
end
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Desk Chair 1"
Item.Desc = "Looks comfy."
Item.Type = "type_furniture"
Item.Model = "models/props_combine/breenchair.mdl"
Item.Weight = 50
Item.Volume = 40
Item.HealthOverride = 1500
Item.CanDrop = true
Item.DropClass = "ent_base_seat"
Item.SetupEntity = function( tblItem, eEnt )
	eEnt:Setup( tblItem.Model, {
		{ mdl = 'models/nova/jeep_seat.mdl', pos = Vector('2.310547 0.008301 9.170171'), ang = Angle('-0.000 -89.995 0.000') },
	} )
end
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Desk Chair 2"
Item.Desc = "Looks comfy."
Item.Type = "type_furniture"
Item.Model = "models/props_c17/chair_office01a.mdl"
Item.Weight = 20
Item.Volume = 40
Item.HealthOverride = 750
Item.CanDrop = true
Item.DropClass = "ent_base_seat"
Item.SetupEntity = function( tblItem, eEnt )
	eEnt:Setup( tblItem.Model, {
		{ mdl = 'models/nova/jeep_seat.mdl', pos = Vector('0.243652 -2.147461 14.285817'), ang = Angle('-0.000 0.005 0.000') },
	} )
end
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Stool"
Item.Desc = "Looks comfy."
Item.Type = "type_furniture"
Item.Model = "models/props_c17/chair_stool01a.mdl"
Item.Weight = 20
Item.Volume = 25
Item.HealthOverride = 500
Item.CanDrop = true
Item.DropClass = "ent_base_seat"
Item.SetupEntity = function( tblItem, eEnt )
	eEnt:Setup( tblItem.Model, {
		{ mdl = 'models/nova/jeep_seat.mdl', pos = Vector('-6.434827 -1.241156 25.893631'), ang = Angle('-0.049 -90.714 0.017') },
	} )
end
GM.Inv:RegisterItem( Item )
]]
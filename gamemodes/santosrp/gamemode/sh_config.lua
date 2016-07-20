
-----------------------------------------------------
--[[
	Name: sh_config.lua
	For: SantosRP
	By: Ultra
]]--

DEV_SERVER = false

GM.Config = {}
GM.Config.GAMEMODE_PATH = "santosrp/gamemode/"
GM.Config.DeathWaitTime = 3 *60 --Time to wait for insta-death countdown

--[[ ConVars ]]--
if CLIENT then
	GM.Config.HasDataCap = CreateClientConVar( "srp_datacap_mode", "0", true, false )
	GM.Config.LightSensitiveMode = CreateClientConVar( "srp_lightsensitive_mode", "0", true, false )
end

--[[ User Group Settings ]]--
GM.Config.UserGroupConfig = {
	["founder"] = { Name = "Owner", Color = Color(230, 60, 60, 255) },
	["superadmin"] = { Name = "Super Admin", Color = Color(255, 50, 50, 255) },
	["community_manager"] = { Name = "Community Manager", Color = Color(6, 48, 110, 255) },
	["sysadmin"] = { Name = "SysAdmin", Color = Color(98, 161, 255) },
	["admin"] = { Name = "Administrator", Color = Color(0, 154, 255, 255) },
	["senior admin"] = { Name = "Senior Admin", Color = Color(222, 5, 229, 255) },
	["moderator"] = { Name = "Moderator", Color = Color(21, 239, 28, 255) },
	["developer"] = { Name = "Developer", Color = Color(255, 140, 0, 255) },
	["headadmin"] = { Name = "Head Admin", Color = Color(222, 5, 229, 255) },
	["user"] = { Name = "Player", Color = Color(255, 255, 255, 255) },
	["headofdev"] = { Name = "Head of Development", Color = Color(255, 135, 0, 255) },
	["ultra"] = { Name = "Ultra", Color(255, 255, 255, 255) },
	["vip_t1"] = { Name = "VIP - Tier 1", Color = Color(216, 195, 56, 255) },
	["vip_t2"] = { Name = "VIP - Tier 2", Color = Color(216, 195, 56, 255) },
	["vip_t3"] = { Name = "VIP - Tier 3", Color = Color(216, 195, 56, 255) },
	["vip_t4"] = { Name = "VIP - Tier 4", Color = Color(216, 195, 56, 255) },
}
GM.Config.VIPGroups = {
	[1] = {
		["developer"] = true,
	},
	[2] = {
		["moderator"] = true,
	},
	[3] = {
		["admin"] = true,
	},
	[4] = {
		["senior admin"] = true,
		["headadmin"] = true,
		["founder"] = true,
		["community_manager"] = true,
		["ultra"] = true,
		["headofdev"] = true,
		["sysadmin"] = true,
		["superadmin"] = true,
	},
}

GM.Config.BuildVIPFlags = function()
	GM.Player:RegisterVIPFlag( "bank_storage", "vip_t1", { ExtraItems = 10, ExtraUnique = 20 } )
	GM.Player:RegisterVIPFlag( "bank_storage", "vip_t2", { ExtraItems = 20, ExtraUnique = 35 } )
	GM.Player:RegisterVIPFlag( "bank_storage", "vip_t3", { ExtraItems = 30, ExtraUnique = 50 } )
	GM.Player:RegisterVIPFlag( "bank_storage", "vip_t4", { ExtraItems = 40, ExtraUnique = 60 } )

	GM.Player:RegisterVIPFlag( "pay_boost", "vip_t1", { PrecentBoost = 0.15 } )
	GM.Player:RegisterVIPFlag( "pay_boost", "vip_t2", { PrecentBoost = 0.25 } )
	GM.Player:RegisterVIPFlag( "pay_boost", "vip_t3", { PrecentBoost = 0.50 } )
	GM.Player:RegisterVIPFlag( "pay_boost", "vip_t4", {}, "vip_t3" )

	GM.Player:RegisterVIPFlag( "prop_limit", "vip_t1", { ExtraProps = 20 } )
	GM.Player:RegisterVIPFlag( "prop_limit", "vip_t2", { ExtraProps = 30 } )
	GM.Player:RegisterVIPFlag( "prop_limit", "vip_t3", { ExtraProps = 50 } )
	GM.Player:RegisterVIPFlag( "prop_limit", "vip_t4", { ExtraProps = 60 } )

	GM.Player:RegisterVIPFlag( "custom_plates", "vip_t2", { true } )
	GM.Player:RegisterVIPFlag( "custom_plates", "vip_t3", {}, "vip_t2" )
	GM.Player:RegisterVIPFlag( "custom_plates", "vip_t4", {}, "vip_t3" )

	GM.Player:RegisterVIPFlag( "custom_radio", "vip_t2", { true } )
	GM.Player:RegisterVIPFlag( "custom_radio", "vip_t3", {}, "vip_t2" )
	GM.Player:RegisterVIPFlag( "custom_radio", "vip_t4", {}, "vip_t3" )

	GM.Player:RegisterVIPFlag( "car_sell_boost", "vip_t2", { PercentBoost = 0.20 } )
	GM.Player:RegisterVIPFlag( "car_sell_boost", "vip_t3", {}, "vip_t2" )
	GM.Player:RegisterVIPFlag( "car_sell_boost", "vip_t4", {}, "vip_t3" )

	GM.Player:RegisterVIPFlag( "santos_customs_skins", "vip_t2", { true } )
	GM.Player:RegisterVIPFlag( "santos_customs_skins", "vip_t3", {}, "vip_t2" )
	GM.Player:RegisterVIPFlag( "santos_customs_skins", "vip_t4", {}, "vip_t3" )

	GM.Player:RegisterVIPFlag( "santos_customs_bgroups", "vip_t2", { true } )
	GM.Player:RegisterVIPFlag( "santos_customs_bgroups", "vip_t3", {}, "vip_t2" )
	GM.Player:RegisterVIPFlag( "santos_customs_bgroups", "vip_t4", {}, "vip_t3" )

	GM.Player:RegisterVIPFlag( "santos_customs_perf", "vip_t2", { true } )
	GM.Player:RegisterVIPFlag( "santos_customs_perf", "vip_t3", {}, "vip_t2" )
	GM.Player:RegisterVIPFlag( "santos_customs_perf", "vip_t4", {}, "vip_t3" )

	GM.Player:RegisterVIPFlag( "santos_customs_underglow", "vip_t2", { true } )
	GM.Player:RegisterVIPFlag( "santos_customs_underglow", "vip_t3", {}, "vip_t2" )
	GM.Player:RegisterVIPFlag( "santos_customs_underglow", "vip_t4", {}, "vip_t3" )

	GM.Player:RegisterVIPFlag( "vip_cars", "vip_t3", { true } )
	GM.Player:RegisterVIPFlag( "vip_cars", "vip_t4", {}, "vip_t3" )

	GM.Player:RegisterVIPFlag( "job_fast_pass", "vip_t3", { true } )
	GM.Player:RegisterVIPFlag( "job_fast_pass", "vip_t4", {}, "vip_t3" )

	GM.Player:RegisterVIPFlag( "vip_stamina_boost", "vip_t4", { DecayPercentBoost = 0.225, RegenPercentBoost = 0.225 } )
end

--[[ Item Limits ]]--
GM.Config.MaxItemLimit = 48

--[[ Character Settings ]]--
GM.Config.MaxCharacters = DEV_SERVER and 3 or 1
GM.Config.NameLength = { First = 15, Last = 15 }
GM.Config.StartingMoney = { Wallet = 10000, Bank = 10000 }
GM.Config.MaxCarryWeight = 600
GM.Config.MaxCarryVolume = 1000
--Player models allowed in character creation
GM.Config.PlayerModels = {
	Female = {
		["models/humans/modern/female_01.mdl"] = true,
		["models/humans/modern/female_02.mdl"] = true,
		["models/humans/modern/female_03.mdl"] = true,
		["models/humans/modern/female_04.mdl"] = true,
		["models/humans/modern/female_06.mdl"] = true,
		["models/humans/modern/female_07.mdl"] = true,
	},
	Male = {
		["models/humans/modern/male_01_01.mdl"] = true,
		["models/humans/modern/male_01_02.mdl"] = true,
		["models/humans/modern/male_01_03.mdl"] = true,
		["models/humans/modern/male_02_01.mdl"] = true,
		["models/humans/modern/male_02_02.mdl"] = true,
		["models/humans/modern/male_02_03.mdl"] = true,
		["models/humans/modern/male_03_01.mdl"] = true,
		["models/humans/modern/male_03_02.mdl"] = true,
		["models/humans/modern/male_03_03.mdl"] = true,
		["models/humans/modern/male_03_04.mdl"] = true,
		["models/humans/modern/male_03_05.mdl"] = true,
		["models/humans/modern/male_03_06.mdl"] = true,
		["models/humans/modern/male_03_07.mdl"] = true,
		["models/humans/modern/male_04_01.mdl"] = true,
		["models/humans/modern/male_04_02.mdl"] = true,
		["models/humans/modern/male_04_03.mdl"] = true,
		["models/humans/modern/male_04_04.mdl"] = true,
		["models/humans/modern/male_05_01.mdl"] = true,
		["models/humans/modern/male_05_02.mdl"] = true,
		["models/humans/modern/male_05_03.mdl"] = true,
		["models/humans/modern/male_05_04.mdl"] = true,
		["models/humans/modern/male_05_05.mdl"] = true,
		["models/humans/modern/male_06_01.mdl"] = true,
		["models/humans/modern/male_06_02.mdl"] = true,
		["models/humans/modern/male_06_03.mdl"] = true,
		["models/humans/modern/male_06_04.mdl"] = true,
		["models/humans/modern/male_06_05.mdl"] = true,
		["models/humans/modern/male_07_01.mdl"] = true,
		["models/humans/modern/male_07_02.mdl"] = true,
		["models/humans/modern/male_07_03.mdl"] = true,
		["models/humans/modern/male_07_04.mdl"] = true,
		["models/humans/modern/male_07_05.mdl"] = true,
		["models/humans/modern/male_07_06.mdl"] = true,
		["models/humans/modern/male_08_01.mdl"] = true,
		["models/humans/modern/male_08_02.mdl"] = true,
		["models/humans/modern/male_08_03.mdl"] = true,
		["models/humans/modern/male_08_04.mdl"] = true,
		["models/humans/modern/male_09_01.mdl"] = true,
		["models/humans/modern/male_09_02.mdl"] = true,
		["models/humans/modern/male_09_03.mdl"] = true,
		["models/humans/modern/male_09_04.mdl"] = true,
	},
}
--List of player models a player can switch to, if the face type matches
--Used in the clothing shop
GM.Config.PlayerModelOverloads = {
	Male = {
		["male_01"] = {
			"models/player/suits/male_01_closed_coat_tie.mdl",
			"models/player/suits/male_01_closed_tie.mdl",
			"models/player/suits/male_01_open.mdl",
			"models/player/suits/male_01_open_tie.mdl",
			"models/player/suits/male_01_open_waistcoat.mdl",
			"models/player/suits/male_01_shirt.mdl",
			"models/player/suits/male_01_shirt_tie.mdl",
		},
		["male_02"] = {
			"models/player/suits/male_02_closed_coat_tie.mdl",
			"models/player/suits/male_02_closed_tie.mdl",
			"models/player/suits/male_02_open.mdl",
			"models/player/suits/male_02_open_tie.mdl",
			"models/player/suits/male_02_open_waistcoat.mdl",
			"models/player/suits/male_02_shirt.mdl",
			"models/player/suits/male_02_shirt_tie.mdl",
		},
		["male_03"] = {
			"models/player/suits/male_03_closed_coat_tie.mdl",
			"models/player/suits/male_03_closed_tie.mdl",
			"models/player/suits/male_03_open.mdl",
			"models/player/suits/male_03_open_tie.mdl",
			"models/player/suits/male_03_open_waistcoat.mdl",
			"models/player/suits/male_03_shirt.mdl",
			"models/player/suits/male_03_shirt_tie.mdl",
		},
		["male_04"] = {
			"models/player/suits/male_04_closed_coat_tie.mdl",
			"models/player/suits/male_04_closed_tie.mdl",
			"models/player/suits/male_04_open.mdl",
			"models/player/suits/male_04_open_tie.mdl",
			"models/player/suits/male_04_open_waistcoat.mdl",
			"models/player/suits/male_04_shirt.mdl",
			"models/player/suits/male_04_shirt_tie.mdl",
		},
		["male_05"] = {
			"models/player/suits/male_05_closed_coat_tie.mdl",
			"models/player/suits/male_05_closed_tie.mdl",
			"models/player/suits/male_05_open.mdl",
			"models/player/suits/male_05_open_tie.mdl",
			"models/player/suits/male_05_open_waistcoat.mdl",
			"models/player/suits/male_05_shirt.mdl",
			"models/player/suits/male_05_shirt_tie.mdl",
		},
		["male_06"] = {
			"models/player/suits/male_06_closed_coat_tie.mdl",
			"models/player/suits/male_06_closed_tie.mdl",
			"models/player/suits/male_06_open.mdl",
			"models/player/suits/male_06_open_tie.mdl",
			"models/player/suits/male_06_open_waistcoat.mdl",
			"models/player/suits/male_06_shirt.mdl",
			"models/player/suits/male_06_shirt_tie.mdl",
		},
		["male_07"] = {
			"models/player/suits/male_07_closed_coat_tie.mdl",
			"models/player/suits/male_07_closed_tie.mdl",
			"models/player/suits/male_07_open.mdl",
			"models/player/suits/male_07_open_tie.mdl",
			"models/player/suits/male_07_open_waistcoat.mdl",
			"models/player/suits/male_07_shirt.mdl",
			"models/player/suits/male_07_shirt_tie.mdl",
		},
		["male_08"] = {
			"models/player/suits/male_08_closed_coat_tie.mdl",
			"models/player/suits/male_08_closed_tie.mdl",
			"models/player/suits/male_08_open.mdl",
			"models/player/suits/male_08_open_tie.mdl",
			"models/player/suits/male_08_open_waistcoat.mdl",
			"models/player/suits/male_08_shirt.mdl",
			"models/player/suits/male_08_shirt_tie.mdl",
		},
		["male_09"] = {
			"models/player/suits/male_09_closed_coat_tie.mdl",
			"models/player/suits/male_09_closed_tie.mdl",
			"models/player/suits/male_09_open.mdl",
			"models/player/suits/male_09_open_tie.mdl",
			"models/player/suits/male_09_open_waistcoat.mdl",
			"models/player/suits/male_09_shirt.mdl",
			"models/player/suits/male_09_shirt_tie.mdl",
		},
	},
	Female = {},
}

--Skin indexes to block in character creation / clothing store
GM.Config.BlockedModelSkins = {
	["models/humans/modern/female_01.mdl"] = { 6, 21 },
	["models/humans/modern/female_02.mdl"] = { 6, 21 },
	["models/humans/modern/female_03.mdl"] = { 6, 21 },
	["models/humans/modern/female_04.mdl"] = { 6, 21 },
	["models/humans/modern/female_06.mdl"] = { 6, 21 },
	["models/humans/modern/female_07.mdl"] = { 6, 21 },
	
	["models/humans/modern/male_01_01.mdl"] = { 1 },
	["models/humans/modern/male_01_02.mdl"] = { 1 },
	["models/humans/modern/male_01_03.mdl"] = { 1 },
	["models/humans/modern/male_02_01.mdl"] = { 1 },
	["models/humans/modern/male_02_02.mdl"] = { 1 },
	["models/humans/modern/male_02_03.mdl"] = { 1 },
	["models/humans/modern/male_03_01.mdl"] = { 1 },
	["models/humans/modern/male_03_02.mdl"] = { 1 },
	["models/humans/modern/male_03_03.mdl"] = { 1 },
	["models/humans/modern/male_03_04.mdl"] = { 1 },
	["models/humans/modern/male_03_05.mdl"] = { 1 },
	["models/humans/modern/male_03_06.mdl"] = { 1 },
	["models/humans/modern/male_03_07.mdl"] = { 1 },
	["models/humans/modern/male_04_01.mdl"] = { 1 },
	["models/humans/modern/male_04_02.mdl"] = { 1 },
	["models/humans/modern/male_04_03.mdl"] = { 1 },
	["models/humans/modern/male_04_04.mdl"] = { 1 },
	["models/humans/modern/male_05_01.mdl"] = { 1 },
	["models/humans/modern/male_05_02.mdl"] = { 1 },
	["models/humans/modern/male_06_01.mdl"] = { 1 },
	["models/humans/modern/male_06_02.mdl"] = { 1 },
	["models/humans/modern/male_06_03.mdl"] = { 1 },
	["models/humans/modern/male_06_04.mdl"] = { 1 },
	["models/humans/modern/male_06_05.mdl"] = { 1 },
	["models/humans/modern/male_07_01.mdl"] = { 1 },
	["models/humans/modern/male_07_02.mdl"] = { 1 },
	["models/humans/modern/male_07_03.mdl"] = { 1 },
	["models/humans/modern/male_07_04.mdl"] = { 1 },
	["models/humans/modern/male_07_05.mdl"] = { 1 },
	["models/humans/modern/male_07_06.mdl"] = { 1 },
	["models/humans/modern/male_08_01.mdl"] = { 1 },
	["models/humans/modern/male_08_02.mdl"] = { 1 },
	["models/humans/modern/male_08_03.mdl"] = { 1 },
	["models/humans/modern/male_08_04.mdl"] = { 1 },
	["models/humans/modern/male_09_01.mdl"] = { 1 },
	["models/humans/modern/male_09_02.mdl"] = { 1 },
	["models/humans/modern/male_09_03.mdl"] = { 1 },
	["models/humans/modern/male_09_04.mdl"] = { 1 },
}

--[[ Car Settings ]]--
--Stock colors a player may pick from when buying a new car
GM.Config.StockCarColors = {
	["White"] = Color( 255, 255, 255, 255 ),
	["Silver"] = Color( 182, 182, 182, 255 ),
	["Black"] = Color( 36, 36, 36, 255 ),
	["Red"] = Color( 255, 0, 0, 255 ),
	["Blue"] = Color( 0, 63, 255, 255 ),
	["Green"] = Color( 0, 127, 31, 255 ),
	["Yellow"] = Color( 255, 250, 0, 255 ),
}
GM.Config.LPlateCost = 7500 --Cost to buy custom license plates
GM.Config.BaseFuelCost = 4 --Cost per unit of fuel for the gas pumps
GM.Config.MaxCarHealth = 100
GM.Config.CarInsuranceTaxInterval = 60 *60 *12 --Time in seconds of continuous play time to wait before billing a player for the cars they own
GM.Config.CarInsuranceBillTime = 86400 *7 --Time in seconds a car insurance bill should last for before default
GM.Config.CarInsuranceBillScale = 0.625 --How much to scale the full repair cost +tax of a vehicle by for setting the price of a car insurance bill
GM.Config.UseCustomVehicleDamage = true

--NOTES FOR JAIL/LICENSE/TICKET SETTINGS
--Keep string lengths and history counts small, or it could end up saving a large amount of data
--IF the data exceeds ~63kb the net messages for the police computer will start to FAIL!
--Saving a large amount of data may also cause a small amount of lag during the save

--[[ Jail Settings ]]--
GM.Config.MinJailTime = 1 *60 --Min time a player can be jailed for in seconds
GM.Config.MaxJailTime = 60 *60 *24 --Max time a player can be jailed for in seconds
GM.Config.MaxJailReasonLen = 64 --Max string length for jail reason
GM.Config.MaxJailFreeReasonLen = 64 --Max string length for early release reason
GM.Config.MaxArrestHistory = 10 --Max number of past arrests to keep track of
GM.Config.MaxWarrantReasonLength = 64 --Max string length for warrant reason

--[[ License/Ticket Settings ]]--
GM.Config.MaxTicketReasonLength = 64 --Max string length for a ticket reason
GM.Config.MinTicketPrice = 10 --Min price a player may set for a ticket
GM.Config.MaxTicketPrice = 125000 --Max price a player may set for a ticket
GM.Config.MaxOutstandingTickets = 10 --Max number of unpaid tickets a player can have, if at max a cop may not write any more tickets for that player
GM.Config.MaxTicketHistory = 10 --Max number of paid tickets to keep track of
GM.Config.MaxLicenseDotHistory = 10 --Max number of past license dots to keep track of
GM.Config.MaxLicenseDotReasonLength = 64 --Max string length for a license dot reason
GM.Config.MinLicenseRevokeTime = 1 *60 --Min time a player may revoke another player's license for in seconds
GM.Config.MaxLicenseRevokeTime = 48 *60 *60 --Max time a player may revoke another player's license for in seconds

--[[ Dispatch Settings ]]--
GM.Config.Text911CoolDown = 30

--[[ Job Lockers ]]--
GM.Config.JobLockerItems = {
	[2] = { --Police locker
		["Pole Cam"] = 1,
		["Night Stick"] = 1,
		["Radar Gun"] = 1,
		["Spike Strip"] = 1,
		["Battering Ram"] = 1,
		["Taser"] = 1,
		["Police Shield"] = 1,
		["Police Badge"] = 1,
		["Police Issue Glock-20 Undercover"] = 1,
		
		["Police Issue M4A1"] = 1,
		["Police Issue MP5A5"] = 1,
		["Police Issue M24"] = 1,
		--["Police Issue M3 Super 90"] = 1,
		["Police Issue Glock-20"] = 1,
		["Police Issue P226"] = 1,
		["Police Issue Flash Grenade"] = 2,
		["Police Issue G36C"] = 1,
		["Police Issue SG 552"] = 1,
		["The Chief's Raging Bull"] = 1,

		["Police Issue 5.56x45MM 60 Rounds"] = 4,
		["Police Issue .357 SIG 30 Rounds"] = 2,
		["Police Issue 10x25MM 60 Rounds"] = 2,
		["Police Issue 12 Gauge 16 Rounds"] = 2,
		["Police Issue 7.62x51MM 40 Rounds"] = 2,
		["Police Issue 9x19MM 60 Rounds"] = 2,
		["Police Issue .454 Casull 10 Rounds"] = 3,
		
		["Police Issued Suppressor"] = 1,
		["Police Issued EoTech 553"] = 1,
		["Police Issued CompM4"] = 1,
		["Police Issued Foregrip"] = 1,
		["Police Issued ELCAN C79"] = 1,
		["Police Issued SG 552 30rnd Mag"] = 1,

		["Police Issue Traffic Cone"] = 10,
		["Police Issue Traffic Board"] = 1,
		["Police Issue Spare Tire Kit"] = 2,
		["Police Issue Traffic Barrel"] = 10,
		["Police Issue Checkpoint"] = 1,
		["Police Issue Roadside Quick-Fix Kit"] = 2,
		["Police Issue Engine Overhaul"] = 1,
	},
	[3] = { --EMS locker
		["Government Issue First Aid Kit"] = 1,
		["Government Issue Medical Supplies"] = 32,
		["Morphine Applicator"] = 1,
		["Blood Draw Syringe"] = 1,
		["Patient Clipboard"] = 1,
	},
	[4] = { --Fire locker
		["FD Issue 10ft. Ladder"] = 4,
		["FD Issue 50ft. Ladder"] = 1,
		["FD Issue Traffic Barrel"] = 10,
		["FD Issue Traffic Cone"] = 10,
		["FD Issue Concrete Barrier"] = 10,
		["Fire Extinguisher"] = 1,
		["FD Issue Medical Supplies"] = 18,
		["FD Issue First Aid Kit"] = 1,
		["Fire Axe"] = 1,
	},
	[13] = { --Secret service locker
		["Government Issue Glock-20"] = 1,
		["Government Issue 10x25MM 60 Rounds"] = 2,
		["Government Issue Zip Tie"] = 1,
		["Secret Service Badge"] = 1,
	    ["Government Issue Barrier"] = 6,
		["Government Issue Traffic Barrel"] = 10,
		["Goverment Issued Taser"] = 1,
		["Goverment Issued Earpiece"] = 1,
	},
}

--[[ Job Player Caps ]]--
GM.Config.Job_Taxi_PlayerCap = {
	Min = 2, --The smallest number of players that may become this job
	Max = 4, --The largest number of players that may become this job
	MinStart = 4, --At or below this number of total players, only Min amount of players may become this job 
	MaxEnd = 60 --At or above this number of total players, the job cap will be at the Max set value
}
GM.Config.Job_Tow_PlayerCap = {
	Min = 2, --The smallest number of players that may become this job
	Max = 3, --The largest number of players that may become this job
	MinStart = 4, --At or below this number of total players, only Min amount of players may become this job 
	MaxEnd = 60 --At or above this number of total players, the job cap will be at the Max set value
}
GM.Config.Job_BusDriver_PlayerCap = {
	Min = 1, --The smallest number of players that may become this job
	Max = 2, --The largest number of players that may become this job
	MinStart = 4, --At or below this number of total players, only Min amount of players may become this job 
	MaxEnd = 60 --At or above this number of total players, the job cap will be at the Max set value
}
GM.Config.Job_SalesTruck_PlayerCap = {
	Min = 1, --The smallest number of players that may become this job
	Max = 3, --The largest number of players that may become this job
	MinStart = 1, --At or below this number of total players, only Min amount of players may become this job 
	MaxEnd = 50 --At or above this number of total players, the job cap will be at the Max set value
}
GM.Config.Job_MailTruck_PlayerCap = {
	Min = 2, --The smallest number of players that may become this job
	Max = 4, --The largest number of players that may become this job
	MinStart = 8, --At or below this number of total players, only Min amount of players may become this job 
	MaxEnd = 60 --At or above this number of total players, the job cap will be at the Max set value
}
GM.Config.Job_Police_PlayerCap = {
	Min = 4, --The smallest number of players that may become this job
	Max = 16, --The largest number of players that may become this job
	MinStart = 8, --At or below this number of total players, only Min amount of players may become this job 
	MaxEnd = 60 --At or above this number of total players, the job cap will be at the Max set value
}
GM.Config.Job_EMS_PlayerCap = {
	Min = 4, --The smallest number of players that may become this job
	Max = 7, --The largest number of players that may become this job
	MinStart = 8, --At or below this number of total players, only Min amount of players may become this job 
	MaxEnd = 60 --At or above this number of total players, the job cap will be at the Max set value
}
GM.Config.Job_Fire_PlayerCap = {
	Min = 4, --The smallest number of players that may become this job
	Max = 12, --The largest number of players that may become this job
	MinStart = 8, --At or below this number of total players, only Min amount of players may become this job 
	MaxEnd = 60 --At or above this number of total players, the job cap will be at the Max set value
}
GM.Config.Job_Lawyer_PlayerCap = {
	Min = 4, --The smallest number of players that may become this job
	Max = 8, --The largest number of players that may become this job
	MinStart = 8, --At or below this number of total players, only Min amount of players may become this job 
	MaxEnd = 60 --At or above this number of total players, the job cap will be at the Max set value
}
GM.Config.Job_Prosecutor_PlayerCap = {
	Min = 4, --The smallest number of players that may become this job
	Max = 8, --The largest number of players that may become this job
	MinStart = 8, --At or below this number of total players, only Min amount of players may become this job 
	MaxEnd = 60 --At or above this number of total players, the job cap will be at the Max set value
}
GM.Config.SSApplyInterval = 2 *60
GM.Config.Job_SService_PlayerCap = {
	Min = 4, --The smallest number of players that may become this job
	Max = 12, --The largest number of players that may become this job
	MinStart = 8, --At or below this number of total players, only Min amount of players may become this job 
	MaxEnd = 60 --At or above this number of total players, the job cap will be at the Max set value
}
GM.Config.MinDmgEventTime = 4 *60 --min amount of time between random damage events spawning for city workers
GM.Config.MaxDmgEventTime = 8 *60 --max amount of time between random damage events spawning for city workers
GM.Config.Job_CityWorker_PlayerCap = {
	Min = 4, --The smallest number of players that may become this job
	Max = 12, --The largest number of players that may become this job
	MinStart = 8, --At or below this number of total players, only Min amount of players may become this job 
	MaxEnd = 60 --At or above this number of total players, the job cap will be at the Max set value
}
GM.Config.Job_GarbageWorker_PlayerCap = {
	Min = 2, --The smallest number of players that may become this job
	Max = 4, --The largest number of players that may become this job
	MinStart = 4, --At or below this number of total players, only Min amount of players may become this job 
	MaxEnd = 60 --At or above this number of total players, the job cap will be at the Max set value
}

--[[ Property Settings ]]--
GM.Config.PropertyEvictTime = 45 *60 --Time in seconds after being billed for a property to evict the owner
GM.Config.PropertyTaxInterval = 60 *60 *2 --How often (in seconds) should we bill players for a property they own?
GM.Config.PropertyTaxScale = 0.525 --How much to scale the cost of a property + tax for setting the price of a property tax bill
GM.Config.PropertyCats = {
	"Stores",
	"Apartments",
	"Warehouse",
	"House",
}

--[[ Performance Settings ]]--
GM.Config.RenderDist_Level0 = 300 --Most expensive render operations
GM.Config.RenderDist_Level1 = 768
GM.Config.RenderDist_Level2 = 1500
GM.Config.RenderDist_Level3 = 2000

--[[ Driving Test Questions ]]--
GM.Config.DrivingTestQuestions = {
	{ Question = "What do you do when its a green light?", Options = { ["You begin to move"] = true, ["You stop"] = true, ["You turn off your engine"] = true } },
	{ Question = "What do you do if you see someone thats just crashed.", Options = { ["Continue driving"] = true, ["Call your friends"] = true, ["Investigate the scene"] = true } },
	{ Question = "Someone has just crashed into you and damaged your car.", Options = { ["Pull a weapon on him"] = true, ["Exchange insurance information"] = true, ["Talk shit to him while ramming his car"] = true } },
	{ Question = "Your car seems to be not functioning properly, what do you do?", Options = { ["Call the cops"] = true, ["Stand on the road to get someones attention"] = true, ["Phone up mechanical services"] = true } },
	{ Question = "You encounter a police road block and the officer tells you to turn around, do you", Options = { ["Ignore the officer and continue driving"] = true, ["Sit in your car and do nothing"] = true, ["Carefully turn around and drive"] = true } },
	{ Question = "You see a another driver driving recklessly, what do you do?", Options = { ["Inform the police"] = true, ["Drive recklessly yourself"] = true, ["Message your friend"] = true } },
	{ Question = "You have just accidentally crashed into a pole and you have injured yourself, what do you do?", Options = { ["Lie on the road and wait for someone to help"] = true, ["Follow someone until they help you"] = true, ["Call EMS"] = true } },
}

--[[ NPC Healer Settings ]]--
GM.Config.NPCHealerCost = 250 --Cost a player must pay to be healed
GM.Config.MinEMSToDisable = 2 --Minimum number of players with ems jobs to disable the healer npc

--[[ NPC Clothing Shop Settings ]]--
GM.Config.ClothingPrice = 200

--[[ Phone Settings ]]--
GM.Config.MaxTextMsgLen = 256

--[[ Skills ]]--
GM.Config.Skills = {
	["Crafting"] = { MaxLevel = 25, Const = 0.25, ReductionRatio = 0.75 /25 }, --Used for crafting table
	["Assembly"] = { MaxLevel = 25, Const = 0.25, ReductionRatio = 0.75 /25 }, --Used for assembly table
	["Botany"] = { MaxLevel = 25, Const = 0.25 }, --Used for growing weed/coco
	["Chemistry"] = { MaxLevel = 25, Const = 0.25 }, --Used for making meth
	["Cooking"] = { MaxLevel = 25, Const = 0.25, ReductionRatio = 0.75 /25 }, --Used for cooking food
	["Stamina"] = { MaxLevel = 25, Const = 0.25 }, --Used for sprint duration/regen speed
	["Gun Smithing"] = { MaxLevel = 25, Const = 0.25, ReductionRatio = 0.75 /25 }, --Used for crafting gun parts
}

--[[ Crafting ]]--
GM.Config.CraftingSounds = {
	Sound( "santosrp/ui_repairweapon_01.mp3" ),
	Sound( "santosrp/ui_repairweapon_02.mp3" ),
	Sound( "santosrp/ui_repairweapon_03.mp3" ),
	Sound( "santosrp/ui_repairweapon_04.mp3" ),
	Sound( "santosrp/ui_repairweapon_05.mp3" ),
	Sound( "santosrp/ui_repairweapon_06.mp3" ),
	Sound( "santosrp/ui_repairweapon_07.mp3" ),
}

--[[ Chop Shop ]]--
GM.Config.ChopShop_CarStealDuration = 60 *60 *2 --Time before a player can spawn a stolen car again
GM.Config.ChopShop_CarStealCooldown = 60 *60 *14 --Time before a player can chop another car
GM.Config.ChopShop_CarChopDuration = 60 *5 --Time to chop a car
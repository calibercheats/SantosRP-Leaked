
-----------------------------------------------------
--[[
	Name: job_weapons_gov.lua
	For: SantosRP
	By: Ultra
]]--

local Item = {}
Item.Name = "Goverment Issued Earpiece"
Item.Desc = "A government earpiece."
Item.Type = "type_weapon"
Item.Model = "models/devonjones/earpiece/earpiece.mdl"
Item.Weight = 1
Item.Volume = 1
Item.CanDrop = false
Item.CanEquip = true
Item.JobItem = "JOB_SSERVICE" --This item can only be possessed by by players with this job
Item.LimitID = "earpiece"
Item.EquipSlot = "Neck"
Item.EquipGiveClass = "earpiece"
Item.DropClass = "earpiece"
Item.PacOutfit = "earpiece"

GM.PacModels:Register( Item.PacOutfit, {
[1] = {
	["children"] = {
		[1] = {
			["children"] = {
			},
			["self"] = {
				["Model"] = "models/devonjones/earpiece/earpiece.mdl",
				["Angles"] = Angle(9.8686418533325, -80.252212524414, -85.378318786621),
				["UniqueID"] = "1302604166",
				["PositionOffset"] = Vector(0, 0, -2.4000000953674),
				["Size"] = 0.15,
				["Position"] = Vector(2.80126953125, -0.01171875, 3.4140625),
				["Brightness"] = 0.9,
				["ClassName"] = "model",
			},
		},
	},
	["self"] = {
		["EditorExpand"] = true,
		["UniqueID"] = "840752439",
		["ClassName"] = "group",
		["Name"] = "my outfit",
		["Description"] = "add parts to me!",
	},
},
} )
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 1 )

local Item = {}
Item.Name = "Goverment Issued Taser"
Item.Desc = "A government taser."
Item.Type = "type_weapon"
Item.Model = "models/weapons/w_pistol.mdl"
Item.Weight = 2
Item.Volume = 4
Item.CanDrop = false
Item.CanEquip = true
Item.JobItem = "JOB_SSERVICE" --This item can only be possessed by by players with this job
Item.LimitID = "taserss"
Item.EquipSlot = "AltWeapon"
Item.EquipGiveClass = "weapon_taser"
Item.DropClass = "weapon_taser"
Item.PacOutfit = "taser_belt"

GM.PacModels:Register( Item.PacOutfit, {
	[1] = {
		["children"] = {
			[1] = {
				["children"] = {
					[1] = {
						["children"] = {
							[1] = {
								["children"] = {
								},
								["self"] = {
									["Angles"] = Angle(-0.00036541512235999, -90, -0.00027235379093327),
									["ClassName"] = "clip",
									["UniqueID"] = "4162125740",
									["Position"] = Vector(-2.06103515625, 3.232421875, 0.734375),
								},
							},
							[2] = {
								["children"] = {
								},
								["self"] = {
									["Event"] = "weapon_class",
									["UniqueID"] = "1467435601",
									["Operator"] = "equal",
									["ClassName"] = "event",
									["Arguments"] = "weapon_taser@@1",
								},
							},
						},
						["self"] = {
							["UniqueID"] = "2086877014",
							["Scale"] = Vector(1, 0.89999997615814, 1),
							["Angles"] = Angle(-4.3115571315866e-005, -90, -86.656455993652),
							["Size"] = 0.775,
							["ClassName"] = "model",
							["Position"] = Vector(-0.9697265625, 0.0517578125, 2.33056640625),
							["Bone"] = "spine",
							["Model"] = "models/sal/stungun.mdl",
							["EditorExpand"] = true,
						},
					},
				},
				["self"] = {
					["UniqueID"] = "2403179842",
					["Model"] = "models/weapons/w_eq_eholster.mdl",
					["Scale"] = Vector(1, 1.3999999761581, 1),
					["EditorExpand"] = true,
					["Angles"] = Angle(-57.896198272705, -37.184963226318, -132.74348449707),
					["Size"] = 0.575,
					["Position"] = Vector(-2.6552734375, 7.5830078125, 4.28369140625),
					["Color"] = Vector(136, 136, 136),
					["Bone"] = "spine",
					["Brightness"] = 0.9,
					["ClassName"] = "model",
				},
			},
		},
		["self"] = {
			["EditorExpand"] = true,
			["UniqueID"] = "464675880",
			["ClassName"] = "group",
			["Name"] = "my outfit",
			["Description"] = "add parts to me!",
		},
	},
} )
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 1 )

local Item = {}
Item.Name = "Government Issue Glock-20"
Item.Desc = "A Glock-20 pistol."
Item.Type = "type_weapon"
Item.Model = "models/weapons/w_pist_glock18.mdl"
Item.Weight = 2
Item.Volume = 4
Item.CanDrop = false
Item.CanEquip = true
Item.JobItem = "JOB_SSERVICE" --This item can only be possessed by by players with this job
Item.LimitID = "government issue Glock-20"
Item.EquipSlot = "SecondaryWeapon"
Item.EquipGiveClass = "fas2_glock20"
Item.DropClass = "fas2_glock20"
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 1 )

local Item = {}
Item.Name = "Government Issue Zip Tie"
Item.Desc = "A zip tie. Can restrain other players."
Item.Type = "type_weapon"
Item.Model = "models/katharsmodels/handcuffs/handcuffs-1.mdl"
Item.Weight = 1
Item.Volume = 1
Item.CanDrop = true
Item.CanEquip = true
Item.JobItem = "JOB_SSERVICE" --This item can only be possessed by by players with this job
Item.EquipSlot = "AltWeapon"
Item.EquipGiveClass = "weapon_ziptie"
Item.DropClass = "weapon_ziptie"
GM.Inv:RegisterItem( Item )


local Item = {}
Item.Name = "Government Issue 10x25MM 60 Rounds"
Item.Desc = "60 rounds of 10x25MM ammunition."
Item.Type = "type_ammo"
Item.Model = "models/Items/BoxMRounds.mdl"
Item.Weight = 2
Item.Volume = 4
Item.CanDrop = false
Item.CanUse = true
Item.LimitID = "police issue 10x25MM rounds"
Item.JobItem = "JOB_SSERVICE" --This item can only be possessed by by players with this job
Item.DropClass = "fas2_ammo_10x25"

Item.PlayerCanUse = function( _, pPlayer )
	if pPlayer:GetAmmoCount( "10x25MM" ) > 60 then
		pPlayer:AddNote( "You can't equip that much ammo!" )
		return false
	end

	return true
end
Item.OnUse = function( _, pPlayer )
	pPlayer:GiveAmmo( 60, "10x25MM" )
end
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 1 )

local Item = {}
Item.Name = "Government Issue Traffic Barrel"
Item.Desc = "A traffic trailer barrel."
Item.Model = "models/noble/trafficbarrel/traffic_barrel.mdl"
Item.Weight = 2
Item.Volume = 8
Item.CanDrop = true
Item.RemoveDropOnDeath = true
Item.HealthOverride = 3000
Item.JobItem = "JOB_SSERVICE" --This item can only be possessed by by players with this job
Item.LimitID = "trafficbarellss"
Item.SetupEntity = function( _, eEnt )
	eEnt.CanPlayerPickup = function( eEnt, pPlayer, bCanUse )
		return eEnt:GetPlayerOwner() == pPlayer
	end
end
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 10 )
Item.CollidesWithCars = true

local Item = {}
Item.Name = "Government Issue Barrier"
Item.Desc = "A government barrier"
Item.Model = "models/props_fortifications/police_barrier001_128_reference.mdl"
Item.Weight = 1
Item.Volume = 1
Item.CanDrop = true
Item.RemoveDropOnDeath = true
Item.HealthOverride = 3000
Item.JobItem = "JOB_SSERVICE" --This item can only be possessed by by players with this job
Item.LimitID = "checkbarrierss"
Item.SetupEntity = function( _, eEnt )
	eEnt.CanPlayerPickup = function( eEnt, pPlayer, bCanUse )
		return eEnt:GetPlayerOwner() == pPlayer
	end
end
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 6 )
Item.CollidesWithCars = true


local Item = {}
Item.Name = "Secret Service Badge"
Item.Desc = "A SS badge."
Item.Type = "type_weapon"
Item.Model = "models/freeman/policebadge.mdl"
Item.Weight = 1
Item.Volume = 2
Item.CanDrop = false
Item.CanEquip = true
Item.JobItem = "JOB_SSERVICE" --This item can only be possessed by by players with this job
Item.LimitID = "ssbadge"
Item.EquipSlot = "PrimaryWeapon"
Item.EquipGiveClass = "policebadge"
Item.DropClass = "policebadge"
Item.PacOutfit = "badge_swep"

GM.PacModels:Register( Item.PacOutfit, {
[1] = {
	["children"] = {
		[1] = {
			["children"] = {
				[1] = {
					["children"] = {
					},
					["self"] = {
						["Event"] = "weapon_class",
						["UniqueID"] = "2504900514",
						["Operator"] = "equal",
						["ClassName"] = "event",
						["Arguments"] = "policebadge@@1",
					},
				},
			},
			["self"] = {
				["Position"] = Vector(-0.935546875, 7.64453125, -2.5904235839844),
				["Angles"] = Angle(19.057590484619, 100.15154266357, 91.137382507324),
				["UniqueID"] = "1311205654",
				["Size"] = 0.775,
				["EditorExpand"] = true,
				["Bone"] = "spine",
				["Model"] = "models/freeman/policebadge.mdl",
				["ClassName"] = "model",
			},
		},
	},
	["self"] = {
		["EditorExpand"] = true,
		["UniqueID"] = "1469844187",
		["ClassName"] = "group",
		["Name"] = "my outfit",
		["Description"] = "add parts to me!",
	},
},
} )
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 1 )

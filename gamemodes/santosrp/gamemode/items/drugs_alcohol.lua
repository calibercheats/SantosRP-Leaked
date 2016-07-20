
-----------------------------------------------------
--[[
	Name: drugs_alcohol.lua
	For: SantosRP
	By: Ultra
]]--

local function PlayerDrinkItem( tblItem, pPlayer )
	if tblItem.GiveThirst >= 0 then
		GAMEMODE.Needs:AddPlayerNeed( pPlayer, "Thirst", tblItem.GiveThirst )
	else
		GAMEMODE.Needs:TakePlayerNeed( pPlayer, "Thirst", math.abs(tblItem.GiveThirst) )
	end
	pPlayer:EmitSound( "npc/barnacle/barnacle_gulp".. math.random(1, 2).. ".wav", 60, math.random(70, 130) )
end

local function PlayerCanDrinkItem( tblItem, pPlayer )
	if GAMEMODE.Needs:GetPlayerNeed( pPlayer, "Thirst" ) >= GAMEMODE.Needs:GetNeedData( "Thirst" ).Max then
		return tblItem.GiveThirst <= 0
	end
end

local Item = {}
Item.Name = "Beer"
Item.Desc = "A bottle of beer."
Item.Type = "type_drugs"
Item.Model = "models/props_junk/garbage_glassbottle001a.mdl"
Item.Weight = 2
Item.Volume = 1
Item.CanDrop = true
Item.CanUse = true
Item.LimitID = "alcohol"
Item.DropClass = "ent_fluid_beer"
Item.GiveThirst = 10
Item.PlayerCanUse = PlayerCanDrinkItem
Item.OnUse = function( tblItem, pPlayer )
	PlayerDrinkItem( tblItem, pPlayer )
	GAMEMODE.Drugs:PlayerApplyEffect( pPlayer, "drunk", 2 *60, 1 )
end

Item.StillVars = {
	FluidAmountPerItem = 500, --amount of processed fluid needed to give the player an item
	FluidStillRate = 3, --amount of fluid to process each interval
	FluidStillInterval = 0.5, --Time until the next fluid processing

	GiveItem = "Moonshine", --item to give when fluidamount is reached
	GiveAmount = 1, --amount of the item to give each time
}
GM.Inv:RegisterItem( Item )
GM.Inv:RegisterItemLimit( Item.LimitID, 8, { ["vip_t1"] = 2, ["vip_t2"] = 3, ["vip_t3"] = 4, ["vip_t4"] = 6 } )


local Item = {}
Item.Name = "Red Wine"
Item.Desc = "A bottle of red wine."
Item.Type = "type_drugs"
Item.Model = "models/foodnhouseholditems/wine_red1.mdl"
Item.Weight = 3
Item.Volume = 3
Item.CanDrop = true
Item.CanUse = true
Item.LimitID = "alcohol"
Item.DropClass = "ent_fluid_redwine"
Item.GiveThirst = 25
Item.PlayerCanUse = PlayerCanDrinkItem
Item.OnUse = function( tblItem, pPlayer )
	PlayerDrinkItem( tblItem, pPlayer )
	GAMEMODE.Drugs:PlayerApplyEffect( pPlayer, "drunk", 2 *60, 2 )
end

Item.StillVars = {
	FluidAmountPerItem = 500, --amount of processed fluid needed to give the player an item
	FluidStillRate = 3, --amount of fluid to process each interval
	FluidStillInterval = 0.5, --Time until the next fluid processing

	GiveItem = "Moonshine", --item to give when fluidamount is reached
	GiveAmount = 1, --amount of the item to give each time
}

Item.CanEquip = true
Item.EquipSlot = "PrimaryWeapon"
Item.EquipGiveClass = "weapon_item_redwine"
GM.Inv:RegisterItem( Item )


local Item = {}
Item.Name = "White Wine"
Item.Desc = "A bottle of white wine."
Item.Type = "type_drugs"
Item.Model = "models/foodnhouseholditems/wine_white3.mdl"
Item.Weight = 3
Item.Volume = 3
Item.CanDrop = true
Item.CanUse = true
Item.LimitID = "alcohol"
Item.DropClass = "ent_fluid_whitewine"
Item.GiveThirst = 25
Item.PlayerCanUse = PlayerCanDrinkItem
Item.OnUse = function( tblItem, pPlayer )
	PlayerDrinkItem( tblItem, pPlayer )
	GAMEMODE.Drugs:PlayerApplyEffect( pPlayer, "drunk", 2 *60, 2 )
end

Item.StillVars = {
	FluidAmountPerItem = 500, --amount of processed fluid needed to give the player an item
	FluidStillRate = 3, --amount of fluid to process each interval
	FluidStillInterval = 0.5, --Time until the next fluid processing

	GiveItem = "Moonshine", --item to give when fluidamount is reached
	GiveAmount = 1, --amount of the item to give each time
}

Item.CanEquip = true
Item.EquipSlot = "PrimaryWeapon"
Item.EquipGiveClass = "weapon_item_whitewine"
GM.Inv:RegisterItem( Item )


local Item = {}
Item.Name = "Champagne"
Item.Desc = "A bottle of champagne."
Item.Type = "type_drugs"
Item.Model = "models/foodnhouseholditems/champagne.mdl"
Item.Weight = 4
Item.Volume = 3
Item.CanDrop = true
Item.CanUse = true
Item.LimitID = "alcohol"
Item.DropClass = "ent_fluid_champagne"
Item.GiveThirst = 25
Item.PlayerCanUse = PlayerCanDrinkItem
Item.OnUse = function( tblItem, pPlayer )
	PlayerDrinkItem( tblItem, pPlayer )
	GAMEMODE.Drugs:PlayerApplyEffect( pPlayer, "drunk", 3 *60, 2 )
end

Item.StillVars = {
	FluidAmountPerItem = 500, --amount of processed fluid needed to give the player an item
	FluidStillRate = 3, --amount of fluid to process each interval
	FluidStillInterval = 0.5, --Time until the next fluid processing

	GiveItem = "Moonshine", --item to give when fluidamount is reached
	GiveAmount = 1, --amount of the item to give each time
}

Item.CanEquip = true
Item.EquipSlot = "PrimaryWeapon"
Item.EquipGiveClass = "weapon_item_champagne"
GM.Inv:RegisterItem( Item )


local Item = {}
Item.Name = "Moonshine"
Item.Desc = "A bottle of moonshine."
Item.Type = "type_drugs"
Item.Model = "models/props_junk/garbage_glassbottle002a.mdl"
Item.Weight = 2
Item.Volume = 1
Item.CanDrop = true
Item.CanUse = true
Item.Illegal = true
Item.LimitID = "alcohol"
Item.DropClass = "ent_fluid_moonshine"
Item.GiveThirst = 10
Item.PlayerCanUse = PlayerCanDrinkItem
Item.OnUse = function( tblItem, pPlayer )
	PlayerDrinkItem( tblItem, pPlayer )
	GAMEMODE.Drugs:PlayerApplyEffect( pPlayer, "drunk", 4 *60, 6 )
end
Item.SetupEntity = function( _, eEnt )
	eEnt.CanPlayerPickup = Item.CanPlayerPickup
end
Item.CanPlayerPickup = function( eEnt, pPlayer, bCanUse )
	return true --Anyone can take drugs!
end
Item.StillVars = {
	FluidAmountPerItem = 500, --amount of processed fluid needed to give the player an item
	FluidStillRate = 5, --amount of fluid to process each interval
	FluidStillInterval = 0.5, --Time until the next fluid processing

	GiveItem = "Methanol", --item to give when fluidamount is reached
	GiveAmount = 1, --amount of the item to give each time
}
GM.Inv:RegisterItem( Item )


local Item = {}
Item.Name = "Whiskey"
Item.Desc = "A bottle of whiskey."
Item.Type = "type_drugs"
Item.Model = "models/props_junk/garbage_glassbottle003a.mdl"
Item.Weight = 2
Item.Volume = 2
Item.CanDrop = true
Item.CanUse = true
Item.LimitID = "alcohol"
Item.DropClass = "ent_fluid_whiskey"
Item.GiveThirst = 25
Item.PlayerCanUse = PlayerCanDrinkItem
Item.OnUse = function( tblItem, pPlayer )
	PlayerDrinkItem( tblItem, pPlayer )
	GAMEMODE.Drugs:PlayerApplyEffect( pPlayer, "drunk", 3 *60, 4 )
end
Item.StillVars = {
	FluidAmountPerItem = 500, --amount of processed fluid needed to give the player an item
	FluidStillRate = 3, --amount of fluid to process each interval
	FluidStillInterval = 0.5, --Time until the next fluid processing

	GiveItem = "Moonshine", --item to give when fluidamount is reached
	GiveAmount = 1, --amount of the item to give each time
}

Item.CanEquip = true
Item.EquipSlot = "PrimaryWeapon"
Item.EquipGiveClass = "weapon_item_whiskey"
GM.Inv:RegisterItem( Item )

local Item = {}
Item.Name = "Vodka"
Item.Desc = "A bottle of vodka."
Item.Type = "type_drugs"
Item.Model = "models/props_junk/glassjug01.mdl"
Item.Weight = 2
Item.Volume = 2
Item.CanDrop = true
Item.CanUse = true
Item.LimitID = "alcohol"
Item.DropClass = "ent_fluid_vodka"
Item.GiveThirst = 25
Item.PlayerCanUse = PlayerCanDrinkItem
Item.OnUse = function( tblItem, pPlayer )
	PlayerDrinkItem( tblItem, pPlayer )
	GAMEMODE.Drugs:PlayerApplyEffect( pPlayer, "drunk", 3 *60, 4 )
end
Item.StillVars = {
	FluidAmountPerItem = 500, --amount of processed fluid needed to give the player an item
	FluidStillRate = 3, --amount of fluid to process each interval
	FluidStillInterval = 0.5, --Time until the next fluid processing

	GiveItem = "Moonshine", --item to give when fluidamount is reached
	GiveAmount = 1, --amount of the item to give each time
}
GM.Inv:RegisterItem( Item )


local Item = {}
Item.Name = "Bourbon"
Item.Desc = "A bottle of bourbon."
Item.Type = "type_drugs"
Item.Model = "models/props_junk/garbage_glassbottle003a.mdl"
Item.Weight = 2
Item.Volume = 2
Item.CanDrop = true
Item.CanUse = true
Item.LimitID = "alcohol"
Item.DropClass = "ent_fluid_bourbon"
Item.GiveThirst = 25
Item.PlayerCanUse = PlayerCanDrinkItem
Item.OnUse = function( tblItem, pPlayer )
	PlayerDrinkItem( tblItem, pPlayer )
	GAMEMODE.Drugs:PlayerApplyEffect( pPlayer, "drunk", 3 *60, 4 )
end
Item.StillVars = {
	FluidAmountPerItem = 500, --amount of processed fluid needed to give the player an item
	FluidStillRate = 3, --amount of fluid to process each interval
	FluidStillInterval = 0.5, --Time until the next fluid processing

	GiveItem = "Moonshine", --item to give when fluidamount is reached
	GiveAmount = 1, --amount of the item to give each time
}

Item.CanEquip = true
Item.EquipSlot = "PrimaryWeapon"
Item.EquipGiveClass = "weapon_item_bourbon"
GM.Inv:RegisterItem( Item )


local Item = {}
Item.Name = "Brandy"
Item.Desc = "A bottle of brandy."
Item.Type = "type_drugs"
Item.Model = "models/props_junk/garbage_glassbottle003a.mdl"
Item.Weight = 2
Item.Volume = 2
Item.CanDrop = true
Item.CanUse = true
Item.LimitID = "alcohol"
Item.DropClass = "ent_fluid_brandy"
Item.GiveThirst = 25
Item.PlayerCanUse = PlayerCanDrinkItem
Item.OnUse = function( tblItem, pPlayer )
	PlayerDrinkItem( tblItem, pPlayer )
	GAMEMODE.Drugs:PlayerApplyEffect( pPlayer, "drunk", 3 *60, 4 )
end
Item.StillVars = {
	FluidAmountPerItem = 500, --amount of processed fluid needed to give the player an item
	FluidStillRate = 3, --amount of fluid to process each interval
	FluidStillInterval = 0.5, --Time until the next fluid processing

	GiveItem = "Moonshine", --item to give when fluidamount is reached
	GiveAmount = 1, --amount of the item to give each time
}

Item.CanEquip = true
Item.EquipSlot = "PrimaryWeapon"
Item.EquipGiveClass = "weapon_item_brandy"
GM.Inv:RegisterItem( Item )


local Item = {}
Item.Name = "Scotch"
Item.Desc = "A bottle of scotch."
Item.Type = "type_drugs"
Item.Model = "models/props_junk/garbage_glassbottle003a.mdl"
Item.Weight = 2
Item.Volume = 2
Item.CanDrop = true
Item.CanUse = true
Item.LimitID = "alcohol"
Item.DropClass = "ent_fluid_scotch"
Item.GiveThirst = 25
Item.PlayerCanUse = PlayerCanDrinkItem
Item.OnUse = function( tblItem, pPlayer )
	PlayerDrinkItem( tblItem, pPlayer )
	GAMEMODE.Drugs:PlayerApplyEffect( pPlayer, "drunk", 3 *60, 4 )
end
Item.StillVars = {
	FluidAmountPerItem = 500, --amount of processed fluid needed to give the player an item
	FluidStillRate = 3, --amount of fluid to process each interval
	FluidStillInterval = 0.5, --Time until the next fluid processing

	GiveItem = "Moonshine", --item to give when fluidamount is reached
	GiveAmount = 1, --amount of the item to give each time
}

Item.CanEquip = true
Item.EquipSlot = "PrimaryWeapon"
Item.EquipGiveClass = "weapon_item_scotch"
GM.Inv:RegisterItem( Item )



--[[ Drunk Effect ]]--
local drunkEffect = {}
drunkEffect.Name = "drunk"
drunkEffect.NiceName = "Alcohol"
drunkEffect.MaxPower = 50

function drunkEffect:OnStart( pPlayer )
	if SERVER then
		pPlayer:EmitSound( "npc/barnacle/barnacle_gulp".. math.random(1, 2).. ".wav", 60, math.random(70, 130) )
		pPlayer:ViewPunch( Angle(-math.random(6, 12), 0, 0) )

		if GAMEMODE.Drugs:GetPlayerEffectPower( pPlayer, self.Name ) > self.MaxPower *0.25 then
			if math.random( 1, 2 ) == 1 then
				self:MakePlayerVomit( pPlayer )
			end
		end

		if GAMEMODE.Drugs:GetPlayerEffectPower( pPlayer, self.Name ) >= self.MaxPower then
			if not pPlayer:IsUncon() then
				pPlayer:GoUncon()
			end
		end
	end
end

function drunkEffect:Think( pPlayer )
	if CLIENT then return end

	if GAMEMODE.Drugs:GetPlayerEffectPower( pPlayer, self.Name ) > self.MaxPower *0.25 then
		if not pPlayer.m_intLastRandomVomit then
			pPlayer.m_intLastRandomVomit = CurTime() +math.random( 5, 10 )
		end

		if CurTime() > pPlayer.m_intLastRandomVomit then
			local offset = self.MaxPower *0.25
			local scalar = Lerp( (GAMEMODE.Drugs:GetPlayerEffectPower(pPlayer, self.Name) -offset) /(self.MaxPower -offset), 1, 0.33 )
			pPlayer.m_intLastRandomVomit = CurTime() +math.random( 60 *scalar, 120 *scalar )
			self:MakePlayerVomit( pPlayer )
		end
	end
end

function drunkEffect:OnStop( pPlayer )
	if CLIENT then return end
	
	if GAMEMODE.Drugs:GetPlayerEffectPower( pPlayer, self.Name ) <= self.MaxPower *0.25 then
		pPlayer.m_intLastRandomVomit = nil
	end
end

local randomSounds = {
	Sound( "npc/zombie/zombie_pain1.wav" ),
	Sound( "npc/zombie/zombie_pain3.wav" ),
	Sound( "npc/barnacle/barnacle_die1.wav" ),
}
function drunkEffect:MakePlayerVomit( pPlayer )
	if not pPlayer:Alive() or pPlayer:IsRagdolled() then return end
	
	local snd = table.Random( randomSounds )
	pPlayer:EmitSound( snd )

	timer.Create( ("effect_vomit_%p"):format(pPlayer), 0.1, 10, function()
		if not IsValid( pPlayer ) or not pPlayer:Alive() then return end
		
		local effectData = EffectData()
		effectData:SetOrigin( pPlayer:GetShootPos() +(pPlayer:EyeAngles():Forward() *8) )
		effectData:SetNormal( pPlayer:GetAimVector() )
		util.Effect( "vomitSpray", effectData )
		pPlayer:ViewPunch( Angle(10, 0, 0) )
	end )
end

if CLIENT then
	local drunkColor = {
		["$pp_colour_addr"] = 0,
		["$pp_colour_addg"] = 0,
		["$pp_colour_addb"] = 0,
		["$pp_colour_brightness"] = 0,
		["$pp_colour_contrast"] = 1,
		["$pp_colour_colour"] = 1,
		["$pp_colour_mulr"] = 0,
		["$pp_colour_mulg"] = 0,
		["$pp_colour_mulb"] = 0
	}

	function drunkEffect:RenderScreenspaceEffects()
		local pow = math.min( GAMEMODE.Drugs:GetEffectPower(self.Name), self.MaxPower )
		local darkenMin = 0.5
		local darkenMax = 0.33
		local darken = Lerp( pow /self.MaxPower, darkenMin, darkenMax )

		drunkColor["$pp_colour_colour"] = Lerp( pow /self.MaxPower *2 -1, 1, 0.25 )
		DrawColorModify( drunkColor )
		DrawToyTown( Lerp(pow /self.MaxPower, 1, 5), ScrH() *Lerp(pow /self.MaxPower, 0.5, 1) )
	end

	function drunkEffect:GetMotionBlurValues( intW, intH, intForward, intRot )
		local pow = math.min( GAMEMODE.Drugs:GetEffectPower(self.Name), self.MaxPower )
		local speed = Lerp( pow /self.MaxPower, 1, 3 )
		local strength = Lerp( pow /self.MaxPower, 0.01, 0.1 )
		intRot = intRot +math.sin( CurTime() *speed ) *strength

		return intW, intH, intForward, intRot
	end
end
GM.Drugs:RegisterEffect( drunkEffect )

-----------------------------------------------------
if SERVER then
	AddCSLuaFile()
end

if CLIENT then
	SWEP.PrintName = "Battering Ram"
	SWEP.Slot = 5
	SWEP.SlotPos = 5
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end

SWEP.Author = "RayChamp"
SWEP.Instructions = ""
SWEP.Contact = ""
SWEP.Purpose = "Use to force open doors owned by players with active warrants."

SWEP.ViewModel = Model("models/weapons/custom/v_batram.mdl")
SWEP.WorldModel = Model("models/weapons/custom/w_batram.mdl")

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.AnimPrefix = "rpg"

SWEP.Spawnable = false
SWEP.AdminSpawnable = true

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

function SWEP:Initialize()
	self:SetHoldType( "normal" )
end

function SWEP:PrimaryAttack()
	self:SetNextPrimaryFire( CurTime() +1.5 )

	if CLIENT then return end
	local tr = self.Owner:GetEyeTrace()
	local ent = tr.Entity

	if not IsValid( ent ) or not GAMEMODE.Util:IsDoor( ent ) then return end
	if ent:GetPos():Distance( self.Owner:GetPos() ) > 150 then return end
	
	--HACK: rp_rockford bank door
	if tr.Entity:MapCreationID() == 3733 then return end

	--local data = GAMEMODE.Property:GetPropertyByDoor( ent )
	--if not data or not IsValid( data.Owner ) then
	--	self.Owner:AddNote( "Nobody owns this door." )
	--	return
	--end
	
	--[[if not GAMEMODE.Jail:PlayerHasWarrant( data.Owner ) then
		self.Owner:AddNote( "The owner is not warranted." ) 
		return
	end]]--
	
	self.Owner:ViewPunch( Angle(-10, 0, 0) )
	self:EmitSound( "physics/wood/wood_panel_impact_hard1.wav", 75, math.random(90, 110) )

	if math.random( 1, 3 ) == 1 then
		ent:Fire( "unlock", "", 1 )
		ent:Fire( "open", "", 1 )
	end
end
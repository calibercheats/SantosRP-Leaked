
-----------------------------------------------------
if (SERVER) then

	AddCSLuaFile("sw_dumpster_spawner_player.lua")
	
	SWEP.Weight				= 5
	SWEP.AutoSwitchTo		= false
	SWEP.AutoSwitchFrom		= false

end

if ( CLIENT ) then

	SWEP.DrawAmmo			= false
	SWEP.DrawCrosshair		= false
	SWEP.ViewModelFlip		= false
	SWEP.Slot				= 1	
	SWEP.SlotPos			= 4	

end

SWEP.PrintName 				= "Dumpster"
SWEP.Author 				= "SligWolf"
SWEP.Base					= "weapon_base"
SWEP.Category 				= "SligWolf's Garbagetruck"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions			= ""

SWEP.UseHands 				= true
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater    	= false

SWEP.HoldType 				= "slam"
SWEP.ViewModelFlip 			= false
SWEP.ViewModel 				= "models/sligwolf/weapons/c_sw_dumpsterswep.mdl"
SWEP.WorldModel 			= "models/sligwolf/weapons/w_sw_dumpsterswep.mdl"
SWEP.ShowViewModel 			= true
SWEP.ShowWorldModel 		= true
SWEP.DrawCrosshair			= true

SWEP.Primary.Damage			= 0
SWEP.Primary.NumShots		= 0
SWEP.Primary.Cone			= 0
SWEP.Primary.Delay			= 0

SWEP.Primary.ClipSize		= 2
SWEP.Primary.DefaultClip 	= 2
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo 			= "none"
SWEP.Primary.TakeAmmo       = 0
SWEP.Primary.Tracer			= 0
SWEP.Primary.TracerName		= "none"
SWEP.Secondary.Ammo 		= "none"

function SWEP:Initialize()

    self:SetWeaponHoldType( self.HoldType )
	
end

local function MakeEnt(name, ply)
    if !IsValid(ply) then return end
    local ent = ents.Create(name)

    if !IsValid(ent) then return end
    if !ent.CPPISetOwner then return ent end

    ent:CPPISetOwner(ply)
    return ent
end

function SWEP:PrimaryAttack() 

	if ( !self:CanPrimaryAttack() ) then return end
	if (!SERVER) then return end

	local prop = MakeEnt("prop_physics", self.Owner)
	prop:SetModel("models/sligwolf/garbagetruck/sw_dumpster.mdl")
	prop:SetPos(self.Owner:GetPos() + self.Owner:GetAngles():Forward()*60 + self.Owner:GetAngles():Up()*100)
	prop:SetAngles(Angle(0,-90+self.Owner:EyeAngles().y,0))
	prop:Spawn()
	
	timer.Simple(1.8,function() 
		if ( !prop:IsValid()) then return end
		local phys = prop:GetPhysicsObject()
		if phys:IsValid() then
			phys:EnableMotion(false)
		end		
	end)

	self.Weapon:SetNextPrimaryFire( CurTime() + 2.0 )
	self:EmitSound("garrysmod/ui_click.wav")
	self:ShootEffects( self )
	self:TakePrimaryAmmo( 1 )
	
	undo.Create( "Dumpster" )
	undo.AddEntity( prop )
	undo.SetPlayer( self.Owner )
	undo.Finish()
	
	if self:Clip1() == 1 then
		self.Owner:StripWeapon( "sw_dumpster_spawner_player" )
	end
	
end

function SWEP:SecondaryAttack() return end

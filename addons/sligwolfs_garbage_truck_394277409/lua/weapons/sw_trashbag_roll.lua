
-----------------------------------------------------
if (SERVER) then

	AddCSLuaFile("sw_trashbag_roll.lua")
	
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

local CheckTheProtection 	= 0

SWEP.PrintName 				= "Trashbag-Admin"
SWEP.Author 				= "SligWolf"
SWEP.Base					= "weapon_base"
SWEP.Category 				= "SligWolf's Garbagetruck"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions			= ""

SWEP.UseHands 				= true
SWEP.Spawnable				= true
SWEP.AdminOnly				= true
SWEP.FiresUnderwater    	= false

SWEP.HoldType 				= "slam"
SWEP.ViewModelFlip 			= false
SWEP.ViewModel 				= "models/sligwolf/weapons/c_sw_trashbagswep.mdl"
SWEP.WorldModel 			= "models/sligwolf/weapons/w_sw_trashbagswep.mdl"
SWEP.ShowViewModel 			= true
SWEP.ShowWorldModel 		= true
SWEP.DrawCrosshair			= true

SWEP.Primary.Damage			= 0
SWEP.Primary.NumShots		= 0
SWEP.Primary.Cone			= 0
SWEP.Primary.Delay			= 0

SWEP.Primary.ClipSize		= 4
SWEP.Primary.DefaultClip 	= 4
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
	
	local Prop_to_Trashbag = util.TraceLine( {
		start = self.Owner:EyePos() + self.Owner:EyeAngles():Forward() * 30, 
		endpos = self.Owner:EyePos() + self.Owner:EyeAngles():Forward() * 100, 
		filter = function( ent ) if ( ent:GetClass() == "prop_physics" or ent:GetClass() == "prop_ragdoll" ) then return true end end
	} )
	
	if !IsValid(Prop_to_Trashbag.Entity) then return end

	if Prop_to_Trashbag.Entity.CPPIGetOwner then
		CheckTheProtection = 0
	end
	
	if !Prop_to_Trashbag.Entity.CPPIGetOwner then
		CheckTheProtection = 1
	end
	
	if CheckTheProtection == 0 then
	
		Owner = Prop_to_Trashbag.Entity:CPPIGetOwner()
				
			local Pos = Prop_to_Trashbag.Entity:GetPos()
			local Ang = Prop_to_Trashbag.Entity:GetAngles()
					
			Prop_to_Trashbag.Entity:Remove()
							
			local prop = MakeEnt("prop_physics", self.Owner)
			prop:SetModel("models/sligwolf/garbagetruck/sw_trashbag.mdl")
			prop:SetPos(Pos)
			prop:SetAngles(Ang)
			prop:Spawn()

			self.Weapon:SetNextPrimaryFire( CurTime() + 0.5 )
			self:EmitSound("garrysmod/ui_click.wav")
			self:ShootEffects( self )
							
			undo.Create( "Trashbag" )
			undo.AddEntity( prop )
			undo.SetPlayer( self.Owner )
			undo.Finish()
	end

	if CheckTheProtection == 1 then
		
		local Pos = Prop_to_Trashbag.Entity:GetPos()
		local Ang = Prop_to_Trashbag.Entity:GetAngles()
		
			Prop_to_Trashbag.Entity:Remove()
					
			local prop = MakeEnt("prop_physics", self.Owner)
			prop:SetModel("models/sligwolf/garbagetruck/sw_trashbag.mdl")
			prop:SetPos(Pos)
			prop:SetAngles(Ang)
			prop:Spawn()

			self.Weapon:SetNextPrimaryFire( CurTime() + 0.5 )
			self:EmitSound("garrysmod/ui_click.wav")
			self:ShootEffects( self )
					
			undo.Create( "Trashbag" )
			undo.AddEntity( prop )
			undo.SetPlayer( self.Owner )
			undo.Finish()	
	end
	
end

function SWEP:SecondaryAttack() return end

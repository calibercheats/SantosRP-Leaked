
-----------------------------------------------------
local PrVeh = "prop_vehicle_jeep"
local Cat = "TDM Emergency"

local V = {
			Name = "Dodge Charger SRT8 2012 Police", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable Dodge Charger SRT8 2012 Police by TheDanishMaster",
				Model = "models/tdmcars/emergency/dod_charger12.mdl",
							KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/charger2012.txt",
							EnableGun 		=  '0' -- Change this to 1 to turn spotlights. A Taucannon will also be enabled so you will be able to shoot it.
							}
			}
list.Set("Vehicles", "charger12poltdm", V)

local V = {
			Name = "Ford Crown Victoria", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable Ford Crown Victoria Police by TheDanishMaster",
			Model = "models/tdmcars/emergency/for_crownvic.mdl",
							KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/for_crownvic.txt",
							EnableGun 		=  '0' -- Change this to 1 to turn spotlights. A Taucannon will also be enabled so you will be able to shoot it.
							}
			}
list.Set("Vehicles", "forcrownvicpoltdm", V)

local V = {
			Name = "Ford Taurus 2013", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable Ford Taurus 2013 by TheDanishMaster",
			Model = "models/tdmcars/emergency/for_taurus_13.mdl",
							KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/for_taurus_13.txt",
							skin = "2"
							}
			}
list.Set("Vehicles", "fortauruspoltdm", V)

local V = {
			Name = "Holden HSV W427 Police", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable Holden HSV W427 Police by TheDanishMaster",
				Model = "models/tdmcars/hsvw427_pol.mdl",
							KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/hsvw427.txt"
							}
			}
list.Set("Vehicles", "hsvw427poltdm", V)

local V = {
			Name = "Lexus IS300 Rozzers Car", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Turn 10, Top Gear",
			Information = "A drivable Lexus IS300 Rozzers Car by TheDanishMaster",
				Model = "models/tdmcars/emergency/lex_is300_jamesmay.mdl",
							KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/lex_is300.txt"
							}
			}
list.Set("Vehicles", "lex_is300poltdm", V)

local V = {
			Name = "Mercedes E350 Police", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster",
			Information = "A drivable Mercedes E350 Police by TheDanishMaster",
				Model = "models/tdmcars/emergency/mer_eclass.mdl",
							KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/mer_eclass.txt"
							}
			}
list.Set("Vehicles", "mereclasspoltdm", V)

local V = {
			Name = "Mitsubishi Evo X Police", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Turn 10",
			Information = "A drivable Mitsubishi Evo X Police by TheDanishMaster",
				Model = "models/tdmcars/emergency/mitsu_evox.mdl",
							KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/mitsu_evox.txt"
							}
			}
list.Set("Vehicles", "mitsuevoxpoltdm", V)

local V = {
			Name = "Scania Firetruck", 
			Class = PrVeh,
			Category = Cat,
			Author = "TheDanishMaster, Evermotion",
			Information = "A drivable Scania Firetruck by TheDanishMaster",
				Model = "models/tdmcars/trucks/scania_firetruck.mdl",
							KeyValues = {
							vehiclescript	=	"scripts/vehicles/TDMCars/scaniafire.txt"
							}
			}
list.Set("Vehicles", "scaniafiretdm", V)

if !TaurusAddProps_List then TaurusAddProps_List = {} end
hook.Add("PlayerSpawnedVehicle","TaurusAddProps", function( ply, vehicle )
    if vehicle:GetModel( ) == "models/tdmcars/emergency/for_taurus_13.mdl" then
        // Create the actual prop
        local prop1 = ents.Create( "prop_dynamic_ornament" )
        if ( !IsValid( prop1 ) ) then return end
        prop1:SetModel( "models/tdmcars/emergency/for_taurus_13_extra.mdl" )
        prop1:SetPos( vehicle:LocalToWorld(Vector(0,0,0) ))
        prop1:SetAngles( vehicle:LocalToWorldAngles(Angle(0,0,0)) )
        prop1:SetParent( vehicle )
        prop1:SetOwner( ply )
        prop1:Spawn()
        prop1:SetNoDraw(false)
        prop1:DrawShadow(true)
        prop1:Fire("DisableCollision")

        table.insert(TaurusAddProps_List, {vehicle, prop1})
        // Ensure that things are removed
        vehicle:CallOnRemove( "RemoveProps", function( vehicle, prop1 )
            if IsValid(prop1) then
                prop1:Remove()
            end
        end, prop1 )
        prop1:CallOnRemove( "RemoveParent", function( prop1, vehicle )
            if IsValid(vehicle) then
            vehicle:Remove()
            end
        end, vehicle)
    end
end)
// Yes, freemmaann did code this 
hook.Add("Think", "TaurusSyncChanges", function()
	if TaurusAddProps_List and (!TaurusSyncChanges_Timer or CurTime() >= TaurusSyncChanges_Timer) then
		for k, v in pairs(TaurusAddProps_List) do
			if IsValid(v[2]) then
				v[2]:SetMaterial(v[1]:GetMaterial()) v[2]:SetColor(v[1]:GetColor()) v[2]:SetSkin(v[1]:GetSkin())
				local bgroupstring = "0" for k2,v2 in pairs(v[1]:GetBodyGroups()) do bgroupstring = bgroupstring..v[1]:GetBodygroup(k2) end
				v[2]:SetBodyGroups(bgroupstring)
			else
				TaurusAddProps_List[k] = nil
			end
		end
		TaurusSyncChanges_Timer = CurTime()+0.5
	end
end)



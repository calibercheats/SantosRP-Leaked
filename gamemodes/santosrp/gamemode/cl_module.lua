
-----------------------------------------------------
--[[
	Name: sv_modules.lua
	For: SantosRP
	By: Ultra
]]--

GM.Module = {}
GM.Module.m_tblRegister = {}
GM.Module.m_tblHooks = { Handles = {}, Modules = {} }

function GM.Module:Load()
	GM:PrintDebug( 0, "->LOADING MODULES" )

	local foundFiles, foundFolders = file.Find( GM.Config.GAMEMODE_PATH.. "modules/*.lua", "LUA" )
	GM:PrintDebug( 0, "\tFound ".. #foundFiles.. " files." )

	for k, v in pairs( foundFiles ) do
		GM:PrintDebug( 0, "\tLoading ".. v )
		if DEV_SERVER and v:sub(1, 3) == "sv_" then
			continue
		end

		self:Register( include(GM.Config.GAMEMODE_PATH.. "modules/".. v) )
	end

	GM:PrintDebug( 0, "->MODULES LOADED" )
end

function GM.Module:Register( tblModule )
	if not tblModule then return end
	self.m_tblRegister[tblModule.Name] = tblModule
	self:InstallModuleCore( tblModule )

	self:FireEvent( tblModule.Name, "OnLoad" )
end

function GM.Module:GetModule( strName )
	return self.m_tblRegister[strName]
end

function GM.Module:GetAll()
	return self.m_tblRegister
end

function GM.Module:InstallModuleCore( tblModule )
	tblModule.RequireHook = self.ModuleRequestHook
end

function GM.Module:FireEvent( strModule, strEvent, ... )
	if not self.m_tblRegister[strModule] then error( "module ".. strModule.. " does not exist!" ) return end
	if not self.m_tblRegister[strModule][strEvent] then return end

	local b, r1, r2, r3, r4, r5, r6 = pcall( self.m_tblRegister[strModule][strEvent], self.m_tblRegister[strModule], ... )
	if not b then
		ErrorNoHalt( "GM.Module:FireEvent::".. r1.. "\n" )
		return
	else
		return r1, r2, r3, r4, r5, r6
	end
end

function GM.Module.ModuleRequestHook( tblModule, strHook )
	local us = (GAMEMODE or GM).Module

	if not us.m_tblHooks.Modules[tblModule.Name] then
		us.m_tblHooks.Modules[tblModule.Name] = {}
	end
	
	us.m_tblHooks.Modules[tblModule.Name][strHook] = true

	if not us.m_tblHooks.Handles[strHook] then
		hook.Add( strHook, "GAMEMODE.Module:HookHandle", function( ... )
			for name, hooks in pairs( us.m_tblHooks.Modules ) do
				if not hooks[strHook] then continue end
			
				local r1, r2, r3, r4, r5, r6 = us:FireEvent( name, strHook, ... )
				if r1 ~= nil then
					return r1, r2, r3, r4, r5, r6
				end
			end
		end )
	end
end
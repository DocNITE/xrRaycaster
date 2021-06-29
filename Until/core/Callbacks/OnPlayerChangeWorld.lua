--[[
	
	Module: OnPlayerChangeWorld.lua
	Autor: Bimbol
	
	OnPlayerChangeWorld
	
]]--

function OnPlayerChangeWorld(playerid, world)
	SetWorld(playerid, world);
	callEvent("OnPlayerChangeWorld", playerid, world)
	-- BE Callback --
	BE_OnPlayerChangeWorld(playerid, world);
end

function BE_OnPlayerChangeWorld(playerid, world)
end

-- Loaded
print(debug.getinfo(1).source.." has been loaded.");
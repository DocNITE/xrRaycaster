--[[
	
	Module: OnPlayerDisconnect.lua
	Autor: Bimbol
	
	OnPlayerDisconnect
	
]]--

function OnPlayerDisconnect(playerid, reason)
	-- BE Callback --
	BE_OnPlayerDisconnect(playerid, reason);
	-----------------
	restart_Player(playerid, true);
	callEvent("OnPlayerDisconnect", playerid, reason)
end

function BE_OnPlayerDisconnect(playerid, reason)
end

function ExitAccount(playerid, reason)
end

-- Loaded
print(debug.getinfo(1).source.." has been loaded.");
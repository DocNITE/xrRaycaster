--[[
	
	Module: OnPlayerFocus.lua
	Autor: Bimbol
	
	OnPlayerFocus
	
]]--

local Focus = {};

for i = 0, MAX_PLAYERS - 1 do
	Focus[i] = -1;
end
	
function restartFocus(playerid)
	Focus[playerid] = -1;
end

function OnPlayerFocus(playerid, focusid)
	callEvent("OnPlayerFocus", playerid, focusid)
	-- BE Callbacks --
	BE_OnPlayerFocus(playerid, focusid);
end

function BE_OnPlayerFocus(playerid, focusid)
end

-- Loaded
print(debug.getinfo(1).source.." has been loaded.");
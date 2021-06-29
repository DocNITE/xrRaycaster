--[[
	
	Module: OnPlayerKey.lua
	Autor: Bimbol
	
	OnPlayerKey
	
]]--

function OnPlayerKey(playerid, keyDown, keyUp)
	callEvent("OnPlayerKey", playerid, keyDown, keyUp)
	-- BE_Callback --
end

-- Loaded
print(debug.getinfo(1).source.." has been loaded.");
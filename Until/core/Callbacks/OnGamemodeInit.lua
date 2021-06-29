--[[
	
	Module: OnPlayerHit.lua
	Autor: Bimbol
	
	OnPlayerHit
	
]]--

function OnGamemodeInit()
	-- BE Callback --
	callEvent("OnGamemodeInit")
	BE_OnGamemodeInit();
end

function BE_OnGamemodeInit()
end

-- Loaded
print(debug.getinfo(1).source.." has been loaded.");
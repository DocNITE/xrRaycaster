--[[
	
	Module: OnPlayerConnect.lua
	Autor: Bimbol
	
	OnPlayerConnect
	
]]--

function OnPlayerConnect(playerid)
    --ConnectMessage(playerid) --true - the script works. false - doesn't work
	callEvent("OnPlayerConnect", playerid)
	-- BE Callback --
	BE_OnPlayerConnect(playerid);
end

function BE_OnPlayerConnect(playerid)
end

function AccountInit(playerid)
end

-- Loaded
print(debug.getinfo(1).source.." has been loaded.");
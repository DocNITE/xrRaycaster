--[[
	
	Module: OnPlayerUseItem.lua
	Autor: Bimbol
	
	OnPlayerUseItem
	
]]--

function OnPlayerUseItem(playerid, itemInstance, amount, hand)
	removeDisposableItem(playerid, itemInstance, amount);
	callEvent("OnPlayerUseItem", playerid, itemInstance, amount, hand)
	-- BE Callbacks --
	BE_OnPlayerUseItem(playerid, itemInstance, amount, hand);
end

function BE_OnPlayerUseItem(playerid, itemInstance, amount, hand)
end

-- Loaded
print(debug.getinfo(1).source.." has been loaded.");
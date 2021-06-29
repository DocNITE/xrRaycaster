function OnPlayerTriggerMob(playerid, scheme, objectName, trigger)
	callEvent("OnPlayerTriggerMob", playerid, scheme, objectName, trigger)
end

print(debug.getinfo(1).source.." has been loaded.");
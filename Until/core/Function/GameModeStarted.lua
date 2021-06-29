--[[
	
	Module: GameModeStarted.lua
	Autor: DocNight
	
	Sending a message when connecting to a server
	
]]--

local name = {}
local Show_Connecting_Script = false

function Connect_Init(con_en)
    if type(con_en) == "boolean" then
	Show_Connecting_Script = true
    end
end

function ConnectMessage(playerid)
local m = 1
local name = GetPlayerName(playerid)
--SendPlayerMessage (playerid, 0,136,130, "Поговаривают в Хоринисе, кур доят...")
if IsNPC(playerid) == 0 then
    repeat
    SendPlayerMessage(playerid, 0, 255, 0, " ");
	m = m + 1
    until m >= 30
	--SendPlayerMessage(playerid, 225, 35, 135, "BE 0.3a and GMP 1.1.1 started.");
	SendPlayerMessage(playerid, 245, 55, 175, "Gothic Multiplayer R-1-1-1 started.");
	CheckPlayerInit(playerid)
    ReadLn()
	CheckServerAddres(playerid)
	--SendPlayerMessage(playerid, 225, 35, 135, "Game Mode '"..resultStr.."' has been loaded.");
	if name == "Doc" then
	   SendPlayerMessage(playerid, 245, 55, 175, "You do not have access to the server.");
	   Kick(playerid)
	end
	ReadLnHost()
	SendPlayerMessage(playerid, 245, 55, 175, "Connected to "..resultStrl..". Joining the game...");
	end
end

function CheckPlayerInit(playerid)
print("{")
print("Check player "..GetPlayerName(playerid))
print("IP:"..GetPlayerIP(playerid))
print("MAC:"..GetMacAddress(playerid))
print("}")
end

function CheckServerAddres(playerid)
local amount, addr = GetListeningAddresses()
local name = GetPlayerName(playerid)
amount = 1;
        if amount ~= nil --[[and name == "Doc"]] then
            for i = 0,amount - 1 do
			ReadLnPort()
        SendPlayerMessage(playerid, 245, 55, 175, "Connecting to "..addr[i]..":"..resultStrll.."...")
            end
        else
        SendPlayerMessage(playerid, 245, 55, 175, "Server is not listening.")
		Kick(playerid)
    end
end

function ReadLn()
local fileRead = io.open("server.cfg","r");
for i = 0, 20 , 1 do
tempvar = fileRead:read("*l");
end
resultStr = string.sub(tempvar,10,50)
fileRead:close();
end

function ReadLnHost()
local fileRead = io.open("server.cfg","r");
tempvar = fileRead:read("*l");
tempvar = fileRead:read("*l");
resultStrl = string.sub(tempvar,10,50)
fileRead:close();
end

function ReadLnPort()
local fileRead = io.open("server.cfg","r");
tempvar = fileRead:read("*l");
resultStrll = string.sub(tempvar,0,0) .. string.sub(tempvar,6,11)
fileRead:close();
end

print(debug.getinfo(1).source.." has been loaded.");
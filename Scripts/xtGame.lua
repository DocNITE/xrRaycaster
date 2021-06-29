

xrGame
={
	player
	={
	
		texture = "player",
		position = {x = 3, y = 3},
		rotation = {vector = {dirX , dirY}, camera = {planeX, planeY}}
	
	 },
	 
	windowResolution = {x = 160, y = 140},
	worldMap = {},
	worldSize = {},

	startWorld = "intro",
	
	timers = {Renderer},
	keyPressed = {},
	
	moveSpeed = {walk = 2, run = 4},
	moveMode = 2;

 }
 
local function vievPortInint(mode)

	local start;
	local ender;

	if mode == OPTIMAL then

		start 
		={
			position = xrScreen.screen.pixel_X/2-((xrScreen.screen.pixel_X/2)/2),
			size = xrScreen.screen.pixel_X/2+((xrScreen.screen.pixel_X/2)/2)
		 };
		ender
		={
			position = xrScreen.screen.pixel_Y/2-((xrScreen.screen.pixel_Y/2)/2),
			size = xrScreen.screen.pixel_Y/2+((xrScreen.screen.pixel_Y/2)/2)-10
		 };
		
		
	elseif mode == FULLSCREEN then
	
		start 
		={
			position = 0,
			size = xrScreen.screen.pixel_X
		 };
		ender
		={
			position = 1,
			size = xrScreen.screen.pixel_Y
		 };
		
	end
	return start, ender;
end
 
function g_showWindow(pID)

	SetPlayerWorld(pID, "xray.zen")
	SetPlayerFatness(pID, -1000000);
	ShowChat(pID, 0);
	EnableChat(0);
	FreezeCamera(pID, 1);
	FreezePlayer(pID, 1);
	xrScreen:initWindow(xrGame.windowResolution.x, xrGame.windowResolution.y)
	
	for i = 1, 256 do
		table.insert(xrGame.keyPressed, false)
	end
	
	local start, ender = vievPortInint(FULLSCREEN);
	
	xrScreen:createViewPort(start, ender);
	g_loadWorld(xrGame.startWorld);
	renderTick(true);
end
addEvent("OnPlayerConnect", g_showWindow)

function g_loadWorld(world)
	local map = g_map:read(world)
	xrGame.worldMap = map[3];
	xrGame.worldSize = map[1];

	xrGame.player.position = {x = map[2].x, y = map[2].y}   -- dirX = -1, dirY = 0, planeX = 0, planeY = 0.66
	xrGame.player.rotation = {vector = {dirX = -1, dirY = 0}, camera = {planeX = 0, planeY = 0.66}} 
end

function g_keyPressed(pID, pKeyDown, pKeyUp)

	if pKeyDown == KEY_DOWN then
		xrGame.keyPressed[KEY_DOWN+1] = true;
	elseif pKeyDown == KEY_UP then
		xrGame.keyPressed[KEY_UP+1] = true;
	elseif pKeyDown == KEY_LEFT then
		xrGame.keyPressed[KEY_LEFT+1] = true;
	elseif pKeyDown == KEY_RIGHT then
		xrGame.keyPressed[KEY_RIGHT+1] = true;
	elseif pKeyUp == KEY_DOWN then
		xrGame.keyPressed[KEY_DOWN+1] = false;
	elseif pKeyUp == KEY_UP then
		xrGame.keyPressed[KEY_UP+1] = false;
	elseif pKeyUp == KEY_LEFT then
		xrGame.keyPressed[KEY_LEFT+1] = false;
	elseif pKeyUp == KEY_RIGHT then
		xrGame.keyPressed[KEY_RIGHT+1] = false;
		
	elseif pKeyDown == KEY_LSHIFT then
		xrGame.moveMode = xrGame.moveSpeed.run;
	elseif pKeyUp == KEY_LSHIFT then
		xrGame.moveMode = xrGame.moveSpeed.walk;
	end
	
end
addEvent("OnPlayerKey", g_keyPressed)

function g_keyDown(key)

	return xrGame.keyPressed[key+1];

end
 
--[[local reycaster = {x = xrGame.player.position.x, y = xrGame.player.position.y}; keyPressed
local function g_goDown() 
	xrScreen:screenDraw(reycaster.x, reycaster.y, BLACK)
	reycaster.x = reycaster.x;  
	if xrGame.mapSize.y >= (reycaster.y + 1) then
		reycaster.y = reycaster.y + 1;
	end
	xrScreen:screenDraw(reycaster.x, reycaster.y, WHITE)
end

local function g_goUp() 
	xrScreen:screenDraw(reycaster.x, reycaster.y, BLACK)
	reycaster.x = reycaster.x;
	if 0 <= (reycaster.y - 1) then
		reycaster.y = reycaster.y - 1;
	end
	xrScreen:screenDraw(reycaster.x, reycaster.y, WHITE)
end

local function g_goLeft() 
	xrScreen:screenDraw(reycaster.x, reycaster.y, BLACK)
	if 0 <= (reycaster.x - 1) then
		reycaster.x = reycaster.x - 1;
	end
	reycaster.y = reycaster.y;
	xrScreen:screenDraw(reycaster.x, reycaster.y, WHITE)
end

local function g_goRight() 
	xrScreen:screenDraw(reycaster.x, reycaster.y, BLACK)
	if xrGame.mapSize.x >= (reycaster.x + 1) then
		reycaster.x = reycaster.x + 1;
	end
	reycaster.y = reycaster.y;
	xrScreen:screenDraw(reycaster.x, reycaster.y, WHITE)
end
]]

--addEvent("OnGamemodeInit", g_initWindow)
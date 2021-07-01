xrBuffer
={
	
	firstFrame = {},
	endFrame = {}
	
 }
 
local r_oldFrameTime = 0.0;
local r_frameTime = 0.0;

local r_time = 0;
local r_oldTime = 0;
local r_frameTick = 10; 
local r_renderFrame = true;
 
local counter = nil;
local x_counter = nil;

local function Render()
	
	if r_renderFrame == true then
	
		if counter == nil then
			counter = xrScreen.viewPort.pixel_X.position;
		end

		while counter <= xrScreen.viewPort.pixel_X.size do
		
			if x_counter == nil then
				x_counter = xrScreen.viewPort.pixel_Y.position;
			end
			
			while x_counter <= xrScreen.viewPort.pixel_Y.size do
				
				--print(xrBuffer.endFrame[counter+1][x_counter+1], xrBuffer.firstFrame[counter+1][x_counter+1])
				xrScreen:screenDraw(counter+1, x_counter+1, xrBuffer.endFrame[counter+1][x_counter+1])
				
				x_counter = x_counter + 1;
			end

			counter = counter + 1;
			x_counter = nil;
		end
		coroutine.yield()
		
	end
		
end

local function RenderPainter()

	--local coun = xrScreen.viewPort.pixel_X.position;
	local x_coun = xrScreen.viewPort.pixel_X.size;
	local h_coun = xrScreen.viewPort.pixel_Y.size;
	
	local dirX = xrGame.player.rotation.vector.dirX;
	local dirY = xrGame.player.rotation.vector.dirY;
	
	local planeX = xrGame.player.rotation.camera.planeX;
	local planeY = xrGame.player.rotation.camera.planeY;
	
	local posX = xrGame.player.position.x;
	local posY = xrGame.player.position.y;

	for x = 0, x_coun, 1 do
        local cameraX = 2 * x / x_coun - 1
        local rayPosX = posX
        local rayPosY = posY
        local rayDirX = dirX + planeX * cameraX
        local rayDirY = dirY + planeY * cameraX

        local mapX = math.floor(rayPosX) 
        local mapY = math.floor(rayPosY)

        local sideDistX
        local sideDistY

        local deltaDistX = math.sqrt(1 + (rayDirY ^ 2) / (rayDirX ^ 2)) 
        local deltaDistY = math.sqrt(1 + (rayDirX ^ 2) / (rayDirY ^ 2))
        local perWallDist

        local stepX
        local stepY

        local hit = 0
        local side = 0

        if (rayDirX < 0) then
            stepX = -1
            sideDistX = (rayPosX - mapX) * deltaDistX
        else
            stepX = 1
            sideDistX = (mapX + 1.0 - rayPosX) * deltaDistX
        end

        if (rayDirY < 0) then
            stepY = -1
            sideDistY = (rayPosY - mapY) * deltaDistY
        else
            stepY = 1
            sideDistY = (mapY + 1.0 - rayPosY) * deltaDistY
        end

        while (hit == 0) do
            if (sideDistX < sideDistY) then
                sideDistX = sideDistX + deltaDistX
                mapX = mapX + stepX
                side = 0
            else
                sideDistY = sideDistY + deltaDistY
                mapY = mapY + stepY
                side = 1
            end
            if (xrGame.worldMap[mapX][mapY] > 0) then
                hit = 1
            end
        end

        if (side == 0) then
            perpWallDist = math.abs((mapX - rayPosX + (1 - stepX) / 2) / rayDirX)
        else
            perpWallDist = math.abs((mapY - rayPosY + (1 - stepY) / 2) / rayDirY)
        end

        lineHeight = math.abs(math.floor(x_coun / perpWallDist))

        drawStart = -lineHeight / 2 + x_coun / 2
        if (drawStart < 0) then drawStart = 0 end
        drawEnd = lineHeight / 2 + x_coun / 2
        if (drawEnd >= x_coun) then drawEnd = x_coun - 1 end

		local color = xrGame.worldMap[mapX][mapY];

        if (side == 1) then
			color = color - 7;
        end

        xrBuffer:writeEndBuffer(x, drawStart, drawEnd, color);
    end
	
	r_oldTime = r_time;
	r_time = GetTickCount();
	local frameTime = (r_time - r_oldTime) / 1000;

	
	local moveSpeed = frameTime * (xrGame.moveMode + 0.0);
    local rotSpeed = frameTime * (3.0);
	
	if(g_keyDown(KEY_UP) == true) then
        if (xrGame.worldMap[math.floor(posX + dirX * moveSpeed)][math.floor(posY)] == 0) then
            xrGame.player.position.x = posX + dirX * moveSpeed
        end

        if (xrGame.worldMap[math.floor(posX)][math.floor(posY + dirY * moveSpeed)] == 0) then
            xrGame.player.position.y = posY + dirY * moveSpeed
        end
    end

    if(g_keyDown(KEY_DOWN) == true) then
        if (xrGame.worldMap[math.floor(posX - dirX * moveSpeed)][math.floor(posY)] == 0) then
            xrGame.player.position.x = posX - dirX * moveSpeed
        end

        if (xrGame.worldMap[math.floor(posX)][math.floor(posY - dirY * moveSpeed)] == 0) then
            xrGame.player.position.y = posY - dirY * moveSpeed
        end
    end
    
    if(g_keyDown(KEY_LEFT) == true) then
        oldDirX = dirX
        xrGame.player.rotation.vector.dirX = dirX * math.cos(rotSpeed) - dirY * math.sin(rotSpeed)
        xrGame.player.rotation.vector.dirY = oldDirX * math.sin(rotSpeed) + dirY * math.cos(rotSpeed)
        oldPlaneX = planeX
        xrGame.player.rotation.camera.planeX = planeX * math.cos(rotSpeed) - planeY * math.sin(rotSpeed)
        xrGame.player.rotation.camera.planeY = oldPlaneX * math.sin(rotSpeed) + planeY * math.cos(rotSpeed)
    end

    if(g_keyDown(KEY_RIGHT) == true) then
        oldDirX = dirX
        xrGame.player.rotation.vector.dirX = dirX * math.cos(-rotSpeed) - dirY * math.sin(-rotSpeed)
        xrGame.player.rotation.vector.dirY = oldDirX * math.sin(-rotSpeed) + dirY * math.cos(-rotSpeed)
        oldPlaneX = planeX
        xrGame.player.rotation.camera.planeX = planeX * math.cos(-rotSpeed) - planeY * math.sin(-rotSpeed)
        xrGame.player.rotation.camera.planeY = oldPlaneX * math.sin(-rotSpeed) + planeY * math.cos(-rotSpeed)
    end
	
end

function xrBuffer:writeEndBuffer(pX, pFirst, pEnd, pColor)
	
	pX = xrScreen.viewPort.pixel_X.position + pX;

	pFirst=pFirst-(pFirst%1);
	pEnd=pEnd-(pEnd%1);
	
	for i = xrScreen.viewPort.pixel_Y.position, xrScreen.viewPort.pixel_Y.size do
	
		xrBuffer.endFrame[pX+1][i+1] = BLACK;
	
	end
	
	for i = pFirst, pEnd do
		
		local protect = xrBuffer.firstFrame[pX+1][i+1];
		
		xrBuffer.endFrame[pX+1][i+1] = pColor;
		if protect ~= xrBuffer.firstFrame[pX+1][i+1] then
			xrBuffer.firstFrame[pX+1][i+1] = protect;
		end
		
	end
	
	-- Render player map
	--RenderMap();
	r_oldFrameTime = r_oldFrameTime + 1;
	callEvent("OnRender");
	
end

function RenderMap()

	local mapX = xrGame.player.position.x;
	local mapY = xrGame.player.position.y;
	mapX=mapX-(mapX%1);
	mapY=mapY-(mapY%1);
	
	for y = 1, xrGame.worldSize.y do
		for x = 1, xrGame.worldSize.y do
			xrBuffer.endFrame[x][y] = BLACK;
		end
	end

	for x = 1, xrGame.worldSize.y do
	
		if x == 1 then

			for i = 1, xrGame.worldSize.x do
				xrBuffer.endFrame[i][2] = WHITE;
			end
			
		elseif x == xrGame.worldSize.x then
		
			for i = 1, xrGame.worldSize.x do
				xrBuffer.endFrame[i][xrGame.worldSize.y] = WHITE;
			end
			--xrBuffer.endFrame[pX+1][i+1]
		else
			
			xrBuffer.endFrame[1][x] = WHITE;
			xrBuffer.endFrame[xrGame.worldSize.x][x] = WHITE;
			
		end
		
	end
	xrBuffer.endFrame[mapX][mapY] = YELLOW;

end

local function onUpdateFrameTime()

	r_frameTime = r_oldFrameTime;
	r_oldFrameTime = 0.0;
	--print(r_frameTime)

end

local co_render = nil;

local function coroutineRender()
	if co_render == nil then
		co_render = coroutine.create(Render)
	end
	
	if coroutine.status(co_render) == "dead" then
		co_render = nil;
		r_renderFrame = false;
	end
	
	if co_render ~= nil then
		coroutine.resume(co_render)
	end
	
	if r_renderFrame == false then
		counter = nil;
		x_counter = nil;
		
		RenderPainter();
		
		r_renderFrame = true;
	end
	
end

function renderTick(toggle) --FrameTime
	if toggle == true then
		xrGame.timers.Renderer = SetTimer(coroutineRender, r_frameTick, 1);
		xrGame.timers.FrameTime = SetTimer(onUpdateFrameTime, 1000, 1);
	elseif toggle == false then
		KillTimer(xrGame.timers.Renderer);
		KillTimer(xrGame.timers.FrameTime);
	end
end

function xrBuffer:initBuffer(pX, pY)

	local counter = 0;
	
	while counter <= pX do
  
		local x_counter = 0;
		local array = {};
		local array2 = {};
		
		while x_counter <= pY do
  
			table.insert(array, BLACK)
			table.insert(array2, WHITE)

			x_counter = x_counter + 1;
		end
		table.insert(xrBuffer.firstFrame, array2)
		table.insert(xrBuffer.endFrame, array)
		
		counter = counter + 1;
	end
	
	local pFirst = 23;
	local pEnd = 26;
	
	for i = pFirst, pEnd do
		
		local protect = xrBuffer.firstFrame[pX+1][i+1];
		
		xrBuffer.endFrame[pX+1][i+1] = pColor;
		if protect ~= xrBuffer.firstFrame[pX+1][i+1] then
			xrBuffer.firstFrame[pX+1][i+1] = protect;
		end
		
	end
	
	for i = pFirst, pEnd do
		
		local protect = xrBuffer.firstFrame[pX+1][i+1];
		
		xrBuffer.endFrame[pX+1][i+1] = pColor;
		if protect ~= xrBuffer.firstFrame[pX+1][i+1] then
			xrBuffer.firstFrame[pX+1][i+1] = protect;
		end
		
	end
	
	for i = pFirst, pEnd do
		
		local protect = xrBuffer.firstFrame[pX+1][i+1];
		
		xrBuffer.endFrame[pX+1][i+1] = pColor;
		if protect ~= xrBuffer.firstFrame[pX+1][i+1] then
			xrBuffer.firstFrame[pX+1][i+1] = protect;
		end
		
	end
	
	for i = pFirst, pEnd do
		
		local protect = xrBuffer.firstFrame[pX+1][i+1];
		
		xrBuffer.endFrame[pX+1][i+1] = pColor;
		if protect ~= xrBuffer.firstFrame[pX+1][i+1] then
			xrBuffer.firstFrame[pX+1][i+1] = protect;
		end
		
	end
	
	for i = pFirst, pEnd do
		
		local protect = xrBuffer.firstFrame[pX+1][i+1];
		
		xrBuffer.endFrame[pX+1][i+1] = pColor;
		if protect ~= xrBuffer.firstFrame[pX+1][i+1] then
			xrBuffer.firstFrame[pX+1][i+1] = protect;
		end
		
	end
	
end
 
function xrBuffer:writeBuffer(pX, pY, pColor)
	
	pX = pX + 1;
	pY = pY + 1;
	
	xrBuffer.firstFrame[pX][pY] = pColor;
	
end

function xrBuffer:readBuffer(pX, pY)
	
	pX = pX + 1;
	pY = pY + 1;

	if xrBuffer.firstFrame ~= nil then
	
		if xrBuffer.firstFrame[pX][pY] == xrBuffer.endFrame[pX][pY] then
			return true;
		end

		return false;
		
	end
	
end
 
 
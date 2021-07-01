

xrScreen 
={
	VIEW_MAX = 8192,
	pixel_Visible = false,
	
	screen
	={
	
		pixel_X,
		pixel_Y,
		
		pixel = {},
	
	 },
	
	viewPort
	={
	
		pixel_X,
		pixel_Y
		
	 },
	
	color
	={
	
		"BLACK",
		"WHITE_DARK",
		"RED_DARK",
		"BLUE_DARK",
		"GREEN_DARK",
		"BROWN_DARK",
		"YELLOW_DARK",
		"BLACK",
		"WHITE",
		"RED",
		"BLUE",
		"GREEN",
		"BROWN",
		"YELLOW"
		
	 }
 }
 
function xrScreen:createWindow(pX, pY)

	if xrScreen.pixel_Visible == true then return end;--CreateTexture(666, 666, 666, 666, "RUSH B")
	
	local counter = 0;
	
	xrScreen.screen.pixel_X = pX;
	xrScreen.screen.pixel_Y = pY;
	
	xrBuffer:initBuffer(pX, pY);
	
	xrScreen.pixel_Visible = true;
	
	while counter <= xrScreen.screen.pixel_X do
  
		local x_counter = 0;
		local array = {};
		
		while x_counter <= xrScreen.screen.pixel_Y do
  
			table.insert(array, CreateTexture(xrScreen:anx(counter), xrScreen:any(x_counter), xrScreen:anx(counter+1), xrScreen:any(x_counter+1), "red"))

			x_counter = x_counter + 1;
		end
		table.insert(xrScreen.screen.pixel, array)
		
		counter = counter + 1;
	end
	
end

function xrScreen:createViewPort(start, ender)

	xrScreen.viewPort.pixel_X
	={
		position = start.position,
		size = start.size
	 };
	xrScreen.viewPort.pixel_Y
	={
		position = ender.position,
		size = ender.size
	 };
	 
end

function xrScreen:visibleWindow()

	if xrScreen.pixel_Visible == true then

		local counter = 0;
		
		while counter <= xrScreen.screen.pixel_X do
	  
			local x_counter = 0;
			
			while x_counter <= xrScreen.screen.pixel_Y do

				ShowTexture(0, xrScreen.screen.pixel[counter+1][x_counter+1]);
				UpdateTexture(xrScreen.screen.pixel[counter+1][x_counter+1], xrScreen:anx(counter), xrScreen:any(x_counter), xrScreen:anx(counter+2), xrScreen:any(x_counter+2), "black")
				
				x_counter = x_counter + 1;
			end
			
			counter = counter + 1;
		end
	
	else
	
		local counter = 0;
		
		while counter <= xrScreen.screen.pixel_X do
	  
			local x_counter = 0;
			
			while x_counter <= xrScreen.screen.pixel_Y do

				HideTexture(0, xrScreen.screen.pixel[counter+1][x_counter+1]);
				--UpdateTexture(xrScreen.viewPort.pixel[counter+1][x_counter+1], xrScreen:anx(counter), xrScreen:any(x_counter), xrScreen:anx(counter+1), xrScreen:any(x_counter+1), "red")

				x_counter = x_counter + 1;
			end
			
			counter = counter + 1;
		end
		
	end

end

function xrScreen:initWindow(pX, pY)

	xrScreen:createWindow(pX, pY);
	xrScreen:visibleWindow();

end

function xrScreen:screenDraw(pX, pY, pColor)

	if xrScreen.pixel_Visible == true then

		if xrBuffer:readBuffer(pX-1, pY-1) == false then
			UpdateTexture(xrScreen.screen.pixel[pX][pY], xrScreen:anx(pX), xrScreen:any(pY), xrScreen:anx(pX+2), xrScreen:any(pY+2), xrScreen.color[pColor])
			xrBuffer:writeBuffer(pX-1, pY-1, pColor);
		end
	
	end

end

function xrScreen:rnd(val)

	if val > 0 then 
		return val + 0.5 
	else 
		return val - 0.5 
	end
	
end

function xrScreen:anx(val)

	return xrScreen:rnd((val * xrScreen.VIEW_MAX) / xrScreen.screen.pixel_X)
	
end

function xrScreen:any(val)

	return xrScreen:rnd((val * xrScreen.VIEW_MAX) / xrScreen.screen.pixel_Y)
	
end

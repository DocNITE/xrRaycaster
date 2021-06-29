g_map
={

 };
 
function g_map:add(map, name)
	table.insert(g_map, {map, name})
end

function g_map:read(mID)
	
	local size = {x = 0, y = 0};
	local start = {x = 0, y = 0};
	local map;
	
	for j, k in ipairs(g_map) do
		if k[2] == mID then
			local jid = k[1];
			
			size.x = jid.mapSize.x;
			size.y = jid.mapSize.y;
				
			start.x = jid.start.x;
			start.y = jid.start.y;
			
			map = jid.worldMap;
				
		end
		
	end

	return {size, start, map}
	
end


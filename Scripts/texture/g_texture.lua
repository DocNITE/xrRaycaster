g_texture
={

 }
 
function g_texture:add(texture, name)
	table.insert(g_texture, {texture, name})
end
 
function g_texture:read(tID)
	
	local pointer = {};
	
	for j, k in ipairs(g_texture) do

		if k[2] == tID then
				
		table.insert(pointer, k[1])
			
		end
		
	end

	return pointer;
	
end
 
 --[[ EXAMPLE
 
	##O##    # - empty pixel brickWall
	#O#O#	 O - existing pixel
	#O#O#
	##O##
 --]]
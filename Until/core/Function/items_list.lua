local Items = {};

function AddInstanceName(instance, name)
	Items[string.upper(instance)] = name;
end

local NamedItems = {};

function AddNameInstance(name, instance)
	--print(name)
	NamedItems[string.upper(name)] = string.upper(instance);
end

function GetInstanceName(instance)
	if Items[string.upper(instance)] ~= nil then
		return Items[string.upper(instance)];
	else
		return instance;
	end
end


function GetNameInstance(name)
	if NamedItems[string.upper(name)] ~= nil then
		return NamedItems[string.upper(name)];
	else
		return "NULL";
	end
end


function InitItemList()
	LoadItemList();
end

function PrintFullInstanceList()
	for k, v in pairs(Items) do
		print(k.." "..v);
	end
end


function LoadItemList()
	local iFile = io.open("Doc Engine/core/Function/it_translate.me", "r+");
	local filestream = iFile:read();
	for line in iFile:lines() do
		local result, instance, name = sscanf(filestream,"ss");
		if result == 1 then
		for i = 0, 5000 - 1 do
		end
			AddInstanceName(string.upper(instance), name);
			AddNameInstance(string.upper(name), string.upper(instance));
		end
		filestream = iFile:read("*l");
	end
	iFile:close();
end
LoadItemList()
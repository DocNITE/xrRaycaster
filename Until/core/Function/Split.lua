--[[
	
	Author: Bimbol
	Module: Split.lua
	
	Split string
	
]]--

function Split(str, pat)
	local str_split = {};
	pat = "(.-)" .. pat;
	for value in string.gmatch(str, pat) do
		table.insert(str_split, value);
	end
	return str_split;
end

function TranslateString(str)
 local str_trans;
 str_trans = str;
 
 str_trans = string.gsub(str_trans, "й", "y", 50)
 str_trans = string.gsub(str_trans, "ц", "c", 50)
 str_trans = string.gsub(str_trans, "у", "u", 50)
 str_trans = string.gsub(str_trans, "к", "k", 50)
 str_trans = string.gsub(str_trans, "е", "e", 50)
 str_trans = string.gsub(str_trans, "н", "n", 50)
 str_trans = string.gsub(str_trans, "г", "g", 50)
 str_trans = string.gsub(str_trans, "ш", "sh", 50)
 str_trans = string.gsub(str_trans, "щ", "sh", 50)
 str_trans = string.gsub(str_trans, "з", "z", 50)
 str_trans = string.gsub(str_trans, "х", "h", 50)
 str_trans = string.gsub(str_trans, "ъ", "$", 50)
 str_trans = string.gsub(str_trans, "ф", "f", 50)
 str_trans = string.gsub(str_trans, "ы", "+", 50)
 str_trans = string.gsub(str_trans, "в", "v", 50)
 str_trans = string.gsub(str_trans, "а", "a", 50)
 str_trans = string.gsub(str_trans, "п", "p", 50)
 str_trans = string.gsub(str_trans, "р", "r", 50)
 str_trans = string.gsub(str_trans, "о", "o", 50)
 str_trans = string.gsub(str_trans, "л", "l", 50)
 str_trans = string.gsub(str_trans, "д", "d", 50)
 str_trans = string.gsub(str_trans, "ж", "zh", 50)
 str_trans = string.gsub(str_trans, "э", "e", 50)
 str_trans = string.gsub(str_trans, "я", "ja", 50)
 str_trans = string.gsub(str_trans, "ч", "ch", 50)
 str_trans = string.gsub(str_trans, "с", "s", 50)
 str_trans = string.gsub(str_trans, "м", "m", 50)
 str_trans = string.gsub(str_trans, "и", "i", 50)
 str_trans = string.gsub(str_trans, "т", "t", 50)
 str_trans = string.gsub(str_trans, "ь", "@", 50)
 str_trans = string.gsub(str_trans, "б", "b", 50)
 str_trans = string.gsub(str_trans, "ю", "yu", 50)
 
 str_trans = string.gsub(str_trans, "Й", "Y", 50)
 str_trans = string.gsub(str_trans, "Ц", "C", 50)
 str_trans = string.gsub(str_trans, "У", "U", 50)
 str_trans = string.gsub(str_trans, "К", "K", 50)
 str_trans = string.gsub(str_trans, "Е", "E", 50)
 str_trans = string.gsub(str_trans, "Н", "N", 50)
 str_trans = string.gsub(str_trans, "Г", "G", 50)
 str_trans = string.gsub(str_trans, "Ш", "Sh", 50)
 str_trans = string.gsub(str_trans, "Щ", "Sh", 50)
 str_trans = string.gsub(str_trans, "З", "Z", 50)
 str_trans = string.gsub(str_trans, "Ч", "H", 50)
 str_trans = string.gsub(str_trans, "Ъ", "$", 50)
 str_trans = string.gsub(str_trans, "Ф", "F", 50)
 str_trans = string.gsub(str_trans, "Ы", "+", 50)
 str_trans = string.gsub(str_trans, "В", "V", 50)
 str_trans = string.gsub(str_trans, "А", "A", 50)
 str_trans = string.gsub(str_trans, "П", "P", 50)
 str_trans = string.gsub(str_trans, "Р", "R", 50)
 str_trans = string.gsub(str_trans, "О", "O", 50)
 str_trans = string.gsub(str_trans, "Л", "L", 50)
 str_trans = string.gsub(str_trans, "Д", "D", 50)
 str_trans = string.gsub(str_trans, "Ж", "Zh", 50)
 str_trans = string.gsub(str_trans, "Э", "E", 50)
 str_trans = string.gsub(str_trans, "Я", "Ja", 50)
 str_trans = string.gsub(str_trans, "Ч", "Ch", 50)
 str_trans = string.gsub(str_trans, "С", "S", 50)
 str_trans = string.gsub(str_trans, "М", "M", 50)
 str_trans = string.gsub(str_trans, "И", "I", 50)
 str_trans = string.gsub(str_trans, "Т", "T", 50)
 str_trans = string.gsub(str_trans, "Ь", "@", 50)
 str_trans = string.gsub(str_trans, "Б", "B", 50)
 str_trans = string.gsub(str_trans, "Ю", "Yu", 50)
 
 return str_trans;
end

-- Loaded
print(debug.getinfo(1).source.." has been loaded.");
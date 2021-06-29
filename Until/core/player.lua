--[[
	
	Module: player.lua
	Autor: Bimbol
	
	Player System
	
]]--

local ENABLE_SAVE_PLAYER_AFTER_DEATH = false;
Player = {};

for i = 0, GetMaxPlayers() do
	
	Player[i] = {};
	
	-- Account
	
	
	-- Items
	Player[i].Items = {};
	Player[i].UseItem = { "NULL", 0 };
	
	-- Statistic
	Player[i].Acrobatic = 0
	Player[i].AdditionalVisual = { "Hum_Body_Naked0", 9, "Hum_Head_Pony", 18 };
	Player[i].Position = {x = 0, y = 0, z = 0, angle = 0}
	Player[i].Color = { 255, 250, 200 };
	Player[i].Strength = 15;
	Player[i].Dexterity = 10;
	Player[i].ExperienceNextLevel = 500;
	Player[i].Experience = 0;
	Player[i].Fatness = 0.0;
	Player[i].Guild = 0;
	Player[i].Instance = "PC_HERO";
	Player[i].LearnPoints = 0;
	Player[i].Level = 0;
	Player[i].MagicLevel = 0;
	Player[i].MaxHealth = 100;
	Player[i].MaxMana = 0;
	Player[i].Health = 100;
	Player[i].Mana = 0;
	Player[i].Stamina = 1000;
	Player[i].MaxStamina = 1000;
	Player[i].Science = {};
	for j = 0, 6 do
		Player[i].Science[j] = 0;
	end
	Player[i].SkillWeapon = {};
	for j = 0, 3 do
		Player[i].SkillWeapon[j] = 10;
	end
	Player[i].World = "NEWWORLD\\NEWWORLD.ZEN";
	Player[i].Walk = "NULL";
	Player[i].WeaponMode = WEAPON_NONE;
	Player[i].Draw = {};
	Player[i].Connect = false;
	
	Player[i].GameResolution = {x = 640, y = 480};
end

function restart_Player(playerid, disconnect)
	removeAllItem(playerid);
	Player[playerid].UseItem = { "NULL", 0 };
	-- Statistic
	Player[playerid].Acrobatic = 0
	Player[playerid].AdditionalVisual = { "Hum_Body_Naked0", 9, "Hum_Head_Pony", 18 };
	Player[playerid].Position = {x = 0, y = 0, z = 0, angle = 0}
	Player[playerid].Color = { 255, 250, 200 };
	Player[playerid].Strength = 15;
	Player[playerid].Dexterity = 10;
	Player[playerid].ExperienceNextLevel = 500;
	Player[playerid].Experience = 0;
	Player[playerid].Fatness = 0.0;
	Player[playerid].Guild = 0;
	Player[playerid].Instance = "PC_HERO";
	Player[playerid].LearnPoints = 0;
	Player[playerid].Level = 0;
	Player[playerid].MagicLevel = 0;
	Player[playerid].MaxHealth = 100;
	Player[playerid].MaxMana = 0;
	Player[playerid].Health = 100;
	Player[playerid].Mana = 0;
	Player[playerid].Stamina = 1000;
	Player[playerid].MaxStamina = 1000;
	Player[playerid].Science = {};
	for j = 0, 6 do
		Player[playerid].Science[j] = 0;
	end
	Player[playerid].SkillWeapon = {};
	for j = 0, 3 do
		Player[playerid].SkillWeapon[j] = 10;
	end
	Player[playerid].Strength = 10;
	if disconnect then
		Player[playerid].World = "NEWWORLD\\NEWWORLD.ZEN";
	end
	Player[playerid].Walk = "NULL";
	Player[playerid].WeaponMode = WEAPON_NONE;
end

function ResolutionChange(playerid)
	local xs, ys = GetPlayerResolution(playerid)
	Player[playerid].GameResolution = {x = xs, y = ys};
end
addEvent("OnPlayerConnect", ResolutionChange);

function getResolution(playerid)
	return Player[playerid].GameResolution.x, Player[playerid].GameResolution.y;
end

function GetDraw(playerid)
	return Player[playerid].Draw;
end

function SetWorld(playerid, world)
	Player[playerid].World = world;
end

function RestartConnectControl(playerid)
	Player[playerid].Connect = false;
end

-- Set Functions
function setPlayerAcrobatic(playerid, mode)
	--SetCheatControlAC(playerid, "acrobatic");
	_SetPlayerAcrobatic(playerid, mode);
	Player[playerid].Acrobatic = mode;
end

function setPlayerAdditionalVisual(playerid, bodyModel, bodyTextureID, headModel, headTextureID)
	_SetPlayerAdditionalVisual(playerid, bodyModel, bodyTextureID, headModel, headTextureID);
	Player[playerid].AdditionalVisual = { bodyModel, bodyTextureID, headModel, headTextureID };
end

function setPlayerAngle(playerid, angle)
	_SetPlayerAngle(playerid, angle);
end

function setPlayerColor(playerid, r, g, b)
	_SetPlayerColor(playerid, r, g, b);
	Player[playerid].Color = { r, g, b };
end

function setPlayerDexterity(playerid, dexterity)
	_SetPlayerDexterity(playerid, dexterity);
	Player[playerid].Dexterity = dexterity;
end

function setPlayerExperienceNextLevel(playerid, experience)
	--SetCheatControlAC(playerid, "experience");
	_SetPlayerExperienceNextLevel(playerid, experience);
	Player[playerid].ExperienceNextLevel = experience;
end

function setPlayerExperience(playerid, experience)
	--SetCheatControlAC(playerid, "next_experience");
	_SetPlayerExperience(playerid, experience);
	Player[playerid].Experience = experience;
end

function setPlayerFatness(playerid, fatness)
	_SetPlayerFatness(playerid, fatness);
	Player[playerid].Fatness = fatness;
end

function setPlayerHealth(playerid, health)
	_SetPlayerHealth(playerid, health);
	--SetCheatControlAC(playerid,health);
	Player[playerid].Health = health;
end

function setPlayerInstance(playerid, instance)
	--SetCheatControlAC(playerid, "instance");
	_SetPlayerInstance(playerid, instance);
	Player[playerid].Instance = instance;
end

function setPlayerLearnPoints(playerid, learn_point)
	--SetCheatControlAC(playerid, "learn_point");
	_SetPlayerLearnPoints(playerid, learn_point);
	Player[playerid].LearnPoints = learn_point;
end

function setPlayerLevel(playerid, level)
	--SetCheatControlAC(playerid, "level");
	_SetPlayerLevel(playerid, level);
	Player[playerid].Level = level;
end

function setPlayerMagicLevel(playerid, magic_lvl)
	--SetCheatControlAC(playerid, "magic_lvl");
	_SetPlayerMagicLevel(playerid, magic_lvl);
	Player[playerid].MagicLevel = magic_lvl;
end

function setPlayerMana(playerid, mana)
	_SetPlayerMana(playerid, mana);
	Player[playerid].Mana = mana;
end

function setPlayerMaxHealth(playerid, max_hp)
	--SetCheatControlAC(playerid, "max_hp");
	_SetPlayerMaxHealth(playerid, max_hp);
	Player[playerid].MaxHealth = max_hp;
end

function setPlayerMaxMana(playerid, max_mp)
	--SetCheatControlAC(playerid, "max_mp");
	_SetPlayerMaxMana(playerid, max_mp);
	Player[playerid].MaxMana = max_mp;
end

function setPlayerPos(playerid, x, y, z)
	_SetPlayerPos(playerid, x, y, z);
	Player[playerid].Position.x = x;
	Player[playerid].Position.y = y;
	Player[playerid].Position.z = z;
end

function setPlayerScience(playerid, science_id, value)
	--SetCheatControlAC(playerid, "science");
	_SetPlayerScience(playerid, science_id, value);
	Player[playerid].Science[science_id] = value;
end

function setPlayerSkillWeapon(playerid, skill_id, value)
	--SetCheatControlAC(playerid, "skill");
	_SetPlayerSkillWeapon(playerid, skill_id, value);
	Player[playerid].SkillWeapon[skill_id] = value;
end

function setPlayerStrength(playerid, str)
	SetCheatControlAC(playerid, "strength");
	_SetPlayerStrength(playerid, str);
	Player[playerid].Strength = str;
end

function setPlayerWalk(playerid, walk)
	_SetPlayerWalk(playerid, walk);
	Player[playerid].Walk = walk;
end

function setPlayerWeaponMode(playerid, weaponmode)
	_SetPlayerWeaponMode(playerid, weaponmode);
	Player[playerid].WeaponMode = weaponmode;
end

function setPlayerWorld(playerid, world, checkpoint)
	--SetCheatControlAC(playerid, "world");	
	_SetPlayerWorld(playerid, world, checkpoint);
	Player[playerid].World = world;
end

function setPlayerGold(playerid, gold)
	--SetCheatControlAC(playerid, "gold");
	_SetPlayerGold(playerid, gold);
end

-- Get Functions
function getPlayerAcrobatic(playerid)
	return Player[playerid].Acrobatic;
end

function getPlayerAdditionalVisual(playerid)
	return Player[playerid].AdditionalVisual[1], Player[playerid].AdditionalVisual[2], Player[playerid].AdditionalVisual[3], Player[playerid].AdditionalVisual[4];
end

function getPlayerAngle(playerid)
	return _GetPlayerAngle(playerid);
end

function getPlayerColor(playerid)
	return Player[playerid].Color[1], Player[playerid].Color[2], Player[playerid].Color[3];
end

function getPlayerDexterity(playerid)
	return Player[playerid].Dexterity;
end

function getPlayerExperienceNextLevel(playerid)
	return Player[playerid].ExperienceNextLevel;
end

function getPlayerExperience(playerid)
	return Player[playerid].Experience;
end

function getPlayerFatness(playerid)
	return Player[playerid].Fatness;
end

function getPlayerHealth(playerid)
	return Player[playerid].Health;
end

function getPlayerInstance(playerid)
	return Player[playerid].Instance;
end

function getPlayerLearnPoints(playerid)
	return Player[playerid].LearnPoints;
end

function getPlayerLevel(playerid)
	return Player[playerid].Level;
end

function getPlayerMagicLevel(playerid)
	return Player[playerid].MagicLevel;
end

function getPlayerMana(playerid)
	return Player[playerid].Mana;
end

function getPlayerMaxHealth(playerid)
	return Player[playerid].MaxHealth;
end

function getPlayerMaxMana(playerid)
	return Player[playerid].MaxMana;
end

function getPlayerPos(playerid)
	return _GetPlayerPos(playerid);
end

function getPlayerScience(playerid, science_id)
	return Player[playerid].Science[science_id];
end

function getPlayerSkillWeapon(playerid, skill_id)
	return Player[playerid].SkillWeapon[skill_id];
end

function getPlayerStrength(playerid)
	return Player[playerid].Strength;
end

function getPlayerWalk(playerid)
	return Player[playerid].Walk;
end

function getPlayerWeaponMode(playerid)
	return Player[playerid].WeaponMode;
end

function getPlayerWorld(playerid)
	return Player[playerid].World;
end

function getPlayerGold(playerid)
	local slot, amount = checkPlayerItem(playerid, "ITMI_GOLD");
	if slot then
		return amount;
	end
		return 0;
end

-- Another Function
function GiveItem(playerid, instance, amount)
	_GiveItem(playerid, instance, amount);
	giveItem(playerid, instance, amount);
end

function RemoveItem(playerid, instance, amount)
	_RemoveItem(playerid, instance, amount);
	removeItem(playerid, instance, amount);
	--LogString("drop",string.format("%s %s %s %d","Remove(function):",item_instance, ", amount:", amount))
end

function EquipItem(playerid, instance_item)
	_EquipItem(playerid, instance_item);
	giveItem(playerid, instance_item, 1);
end

function EquipMeleeWeapon(playerid, instance_meleeweapon)
	_EquipMeleeWeapon(playerid, instance_meleeweapon);
	giveItem(playerid, instance_meleeweapon, 1);
end

function EquipRangedWeapon(playerid, instance_rangedweapon)
	_EquipRangedWeapon(playerid, instance_rangedweapon);
	giveItem(playerid, instance_rangedweapon, 1);
end

function EquipArmor(playerid, instance_armor)
	_EquipArmor(playerid, instance_armor);
	giveItem(playerid, instance_armor, 1);
end

function EquipHelmet(playerid, instance_armor)
	_EquipArmor(playerid, instance_armor);
	giveItem(playerid, instance_armor, 1);
end

function ClearInventory(playerid)
	_ClearInventory(playerid);
	removeAllItem(playerid);
end

function DropItem(playerid, item_instance, amount)
	_DropItem(playerid, item_instance, amount);
	--removeItem(playerid, item_instance, amount);
	LogString("drop",string.format("%s %s %s %d","Drop(function):",item_instance, ", amount:", amount))
end

function DropItemBySlot(playerid, slot)
	_DropItemBySlot(playerid, slot);
	for i,k in ipairs(Player[playerid].Items) do
		if i == slot + 1 then
			table.remove(Player[playerid].Items, i);
			return;
		end
	end
end

-- Engine func
--[[function setPlayerWeaponMode(playerid, weaponmode)
	if weaponmode == WEAPON_NONE
	and (Player[playerid].WeaponMode == WEAPON_BOW
	or Player[playerid].WeaponMode == WEAPON_CBOW)
	then
		--removeBoltandArrow(playerid);
	end
	Player[playerid].WeaponMode = weaponmode;
end]]

-- Items
function enableSavePlayerAfterDeath(value)
	if type(value) == "boolean" then
		ENABLE_SAVE_PLAYER_AFTER_DEATH = value;
	end
end

function checkPlayerItem(playerid, instance)
	if playerid and instance then
		instance = string.upper(instance);
		for i, k in ipairs(Player[playerid].Items) do
			if k.instance == instance then
				return i, k.amount;
			end
		end
	end
		return false;
end

--COMBAT,POTION,FOOD,ARMOR,MAGIC,RUNE,DOCS,OTHER,NONE
function getItemTexture(playerid, slot)
	if checkPlayerSlot(playerid, slot) == false then
		return false
	else
		return "button";
	end
end

function checkPlayerSlot(playerid, slot)
	if playerid and slot then
		for i,k in ipairs(Player[playerid].Items) do
			if i == slot then
				return k.instance, k.amount;
			end
		end
	end
		return false;
end

function getPlayerItems(playerid)
	if #Player[playerid].Items > 0 then
		return Player[playerid].Items;
	end
		return false;
end

function givePlayerAllItems(playerid)
	if ENABLE_SAVE_PLAYER_AFTER_DEATH then
		_SetPlayerInstance(playerid, Player[playerid].Instance);
		_ClearInventory(playerid);
		_SetPlayerAcrobatic(playerid, Player[playerid].Acrobatic);
		_SetPlayerAdditionalVisual(playerid, Player[playerid].AdditionalVisual[1], Player[playerid].AdditionalVisual[2], Player[playerid].AdditionalVisual[3], Player[playerid].AdditionalVisual[4]);
		_SetPlayerDexterity(playerid, Player[playerid].Dexterity);
		_SetPlayerExperienceNextLevel(playerid, Player[playerid].ExperienceNextLevel);
		_SetPlayerExperience(playerid, Player[playerid].Experience);
		_SetPlayerFatness(playerid, Player[playerid].Fatness);
		_SetPlayerLearnPoints(playerid, Player[playerid].LearnPoints);
		_SetPlayerLevel(playerid, Player[playerid].Level);
		_SetPlayerMagicLevel(playerid, Player[playerid].MagicLevel);
		_SetPlayerMaxHealth(playerid, Player[playerid].MaxHealth);
		_SetPlayerHealth(playerid, Player[playerid].MaxHealth);
		_SetPlayerMaxMana(playerid, Player[playerid].MaxMana);
		_SetPlayerMana(playerid, Player[playerid].MaxMana);
		for j = 0, 6 do
			_SetPlayerScience(playerid, j, Player[playerid].Science[j]);
		end
		for j = 0, 3 do
			_SetPlayerSkillWeapon(playerid, j, Player[playerid].SkillWeapon[j]);
		end
		_SetPlayerStrength(playerid, Player[playerid].Strength);
		_SetPlayerWalk(playerid, Player[playerid].Walk);
		for i in pairs(Player[playerid].Items) do
			_GiveItem(playerid, Player[playerid].Items[i].instance, Player[playerid].Items[i].amount);
		end	
	else
		if Player[playerid].Connect then
			restart_Player(playerid);
		end
		Player[playerid].Connect = true;
	end
	Player[playerid].WeaponMode = WEAPON_NONE;
end

function giveItem(playerid, instance, amount)
	local slot = checkPlayerItem(playerid, instance);
	if slot then
		Player[playerid].Items[slot].amount = Player[playerid].Items[slot].amount + amount;
	else
		table.insert(Player[playerid].Items, { instance = string.upper(instance), amount = amount });
	end
end

function removeItem(playerid, instance, amount)
	local slot = checkPlayerItem(playerid, instance);
	if slot then
		Player[playerid].Items[slot].amount = Player[playerid].Items[slot].amount - amount;
		if Player[playerid].Items[slot].amount <= 0 then
			table.remove(Player[playerid].Items, slot);
		end
	end
end

function removeAllItem(playerid)
	for i = 1, #Player[playerid].Items do
		table.remove(Player[playerid].Items, 1);
	end
end

function removeDisposableItem(playerid, instance, amount)
	if instance ~= "NULL" then
		Player[playerid].UseItem = { instance, amount };
	else
		local anim = GetPlayerAnimationID(playerid);
		if anim == 994 or
		   anim == 999 or
		   anim == 764 or
		   anim == 768 or
		   anim == 968
		then
			removeItem(playerid, Player[playerid].UseItem[1], Player[playerid].UseItem[2]);
			OnPlayerConsumed(playerid, Player[playerid].UseItem[1], Player[playerid].UseItem[2]);
		end
	end
end

function removeBoltandArrow(playerid)
	if Player[playerid].WeaponMode == WEAPON_BOW then
		removeItem(playerid, "ITRW_ARROW", 1);
	elseif Player[playerid].WeaponMode == WEAPON_CBOW then
		removeItem(playerid, "ITRW_BOLT", 1);
	end
end

-- Callback
function OnPlayerConsumed(playerid, item_instance, amount)
end

-- Loaded
print(debug.getinfo(1).source.." has been loaded.");
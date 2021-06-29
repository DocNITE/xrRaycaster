--[[
	
	Module: require.lua
	Autor: Bimbol
	
	Requires
	
]]--

MAX_PLAYERS = GetMaxPlayers();
MAX_SLOTS = GetMaxSlots();

-- Hooks
require "Until/core/hooks"
-- Function
require "Until/core/Function/event-handler"

require "Until/core/Callbacks/OnPlayerSpawn"
require "Until/core/Callbacks/OnPlayerDeath"
require "Until/core/Callbacks/OnPlayerUnconsciouns"
require "Until/core/Callbacks/OnPlayerHit"
require "Until/core/Callbacks/OnPlayerConnect"
require "Until/core/Callbacks/OnPlayerDisconnect"
require "Until/core/Callbacks/OnGamemodeInit"
require "Until/core/Callbacks/OnPlayerChangeStrength"
require "Until/core/Callbacks/OnPlayerChangeDexterity"
require "Until/core/Callbacks/OnPlayerChangeHealth"
require "Until/core/Callbacks/OnPlayerChangeMana"
require "Until/core/Callbacks/OnPlayerChangeLearnPoints"
require "Until/core/Callbacks/OnPlayerChangeGold"
require "Until/core/Callbacks/OnPlayerDropItem"
require "Until/core/Callbacks/OnPlayerTakeItem"
require "Until/core/Callbacks/OnPlayerUseItem"
require "Until/core/Callbacks/OnPlayerText"
require "Until/core/Callbacks/OnPlayerChangeWorld"
require "Until/core/Callbacks/OnPlayerKey"
require "Until/core/Callbacks/OnPlayerCommandText"
require "Until/core/Callbacks/OnPlayerFocus"
require "Until/core/Callbacks/OnPlayerSpellCast"
require "Until/core/Callbacks/OnPlayerWeaponMode"
require "Until/core/Callbacks/OnPlayerTriggerMob"
require "Until/core/Callbacks/OnPlayerResponseItem"
require "Until/core/Callbacks/OnPlayerHasItem"
require "Until/core/Callbacks/OnPlayerInventory"

--require "Doc Engine/core/mmorpg-npc/events"
-- Player
require "Until/core/player"

-- Checking command								


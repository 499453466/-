-- **g****************************************s***
-- ********© Grumbo'z Guild Warz System™ ©********	
-- **** Brought to you by Grumbo of BloodyWoW *l**
-- **r*************** slp13at420 ****p************
-- ***Foereaper***  Ty Eluna guyz  ****Rochet2****
-- *************** Ty Emudevs.com  *********1*****
-- **u******************♠*********3***************
-- *********************♠*************************
-- ********** This is NOT a C++ SCRIPT **a********
-- ***m***********  This is For  *****************
-- ************* TRINITY/ELUNA ONLY *t************
-- *♠*******************4***********************♠*
-- *b* Please Do Not Remove any of the credits ***
-- **** and/or attempt to release as your own **2*
-- ***o******************©*************0**********
-- **************** First Public *****************
-- *********** release date 03-10-2013 ***********
-- ***********************************************

print("\n-----------------------------------")
print("Grumbo'z Guild Warz System Loading:\n")
print("For TC2 Ace WotLK 3.3.5a\n")

local start = os.clock()

if(GetLuaEngine()~="ElunaEngine")then
		print("err: "..GetLuaEngine().." Detected.\n")
		print("!!..LOAD HALTED..?!!")
		return false;
	else
		print("Approved: Eluna Detected.\n")
	end

local Guard_Died_Drop = 20558 -- wsg's
local table_version = 2.20
local core_version = 6.40
local pigpayz_version = 2.50
local tele_version = 1.50
local pvp_version = 4.60

local Server = "SERVER"
local guild_warz_DB = "guild_warz_335a" -- Must match unique name if running on multiple cores i.e. guild_warz_3.3.5a_1 

GWCOMM = {};
GWARZ = {};
GWHELP = {};
GGW = {};

local function LoadGWtable()

local Ghsql =  WorldDBQuery("SELECT * FROM "..guild_warz_DB..".help;");

	if(Ghsql)then
		repeat
			GWHELP[Ghsql:GetUInt32(0)] = {
				entry = Ghsql:GetUInt32(0),
				command = Ghsql:GetString(1),
				description = Ghsql:GetString(2),
				example = Ghsql:GetString(3),
				command_level = Ghsql:GetUInt32(4),
			};
		until not Ghsql:NextRow()
	end

local Gcsql =  WorldDBQuery("SELECT * FROM "..guild_warz_DB..".commands;");

	if(Gcsql)then
		repeat
			GWCOMM[Gcsql:GetString(0)] = {
				guild = Gcsql:GetString(0),
				commands = Gcsql:GetString(1),
				info_loc = Gcsql:GetString(2),
				list_loc = Gcsql:GetString(3),
				tele = Gcsql:GetString(4),
				version = Gcsql:GetString(5),
				loc = Gcsql:GetString(6),
				farm = Gcsql:GetString(7),
				barrack = Gcsql:GetString(8),
				hall = Gcsql:GetString(9),
				pig = Gcsql:GetString(10),
				guard = Gcsql:GetString(11),
				GLD_lvlb = Gcsql:GetUInt32(12),
				GLD_lvls = Gcsql:GetUInt32(13),
				respawn_flag = Gcsql:GetString(14),
				details_loc = Gcsql:GetString(15),
				table = Gcsql:GetString(16),
				GM_admin = Gcsql:GetUInt32(17),
				GM_minimum = Gcsql:GetUInt32(18),
				currency = Gcsql:GetUInt32(19),
				loc_cost = Gcsql:GetUInt32(20),
				farm_cost = Gcsql:GetUInt32(21),
				barrack_cost = Gcsql:GetUInt32(22),
				hall_cost = Gcsql:GetUInt32(23),
				pig_cost = Gcsql:GetUInt32(24),
				guard_cost = Gcsql:GetUInt32(25),
				farm_L = Gcsql:GetUInt32(26),
				barrack_L = Gcsql:GetUInt32(27),
				hall_L = Gcsql:GetUInt32(28),
				pig_L = Gcsql:GetUInt32(29),
				guard_L = Gcsql:GetUInt32(30),
				pig_payz = Gcsql:GetUInt32(31),
				pig_payz_timer = Gcsql:GetUInt32(32),
				gift_count = Gcsql:GetUInt32(33),
				flag_require = Gcsql:GetUInt32(34),
				Server = Gcsql:GetString(35),
				flag_id = Gcsql:GetUInt32(36),
				farm_id = Gcsql:GetUInt32(37),
				barrack_id = Gcsql:GetUInt32(38),
				hall_id = Gcsql:GetUInt32(39),
				pig_id = Gcsql:GetUInt32(40),
				guard_id = Gcsql:GetUInt32(41),
				x1 = Gcsql:GetUInt32(42),
				x2 = Gcsql:GetUInt32(43),
				x3 = Gcsql:GetUInt32(44),
				command_set = Gcsql:GetString(45),
				anarchy = Gcsql:GetUInt32(46),			
				flag_timer = Gcsql:GetUInt32(47),
				spawn_timer = Gcsql:GetUInt32(48),
				guild_id = Gcsql:GetUInt32(49),
				guild_invite = Gcsql:GetUInt32(50),
			};
		until not Gcsql:NextRow()
	end

	local Gwsql =  WorldDBQuery("SELECT * FROM "..guild_warz_DB..".zones;");

	if(Gwsql)then
		repeat
			GWARZ[Gwsql:GetUInt32(0)] = {
				entry = Gwsql:GetUInt32(0),
				map_id = Gwsql:GetUInt32(1),
				area_id = Gwsql:GetUInt32(2),
				zone_id = Gwsql:GetUInt32(3),
				guild_name = Gwsql:GetString(4),
				team = Gwsql:GetUInt32(5),
				x = Gwsql:GetFloat(6),
				y = Gwsql:GetFloat(7),
				z = Gwsql:GetFloat(8),
				farm_count = Gwsql:GetUInt32(9),
				barrack_count = Gwsql:GetUInt32(10),
				hall_count = Gwsql:GetUInt32(11),
				pig_count = Gwsql:GetUInt32(12),
				guard_count = Gwsql:GetUInt32(13),
				flag_id = Gwsql:GetUInt32(14),
				spawn_time = Gwsql:GetUInt32(15),
				guild_id = Gwsql:GetUInt32(16),
			};
		until not Gwsql:NextRow()
	end
end

LoadGWtable()

print("Guild Warz tables version: "..table_version.."")

local Currencyname = GetItemLink(GWCOMM["SERVER"].currency)

-- ******************************************************
-- ************** CORE : custom functions ***************
-- ******************************************************

local function GetLocationId(player)
	for i = 1, #GWARZ do
		if(GWARZ[i].map_id == player:GetMapId() and GWARZ[i].area_id == player:GetAreaId() and GWARZ[i].zone_id == player:GetZoneId()) then
			return i;
		end
	end
end

local function PreparedStatements(key, ...)
	local Query = {
		[1] = "UPDATE "..guild_warz_DB..".zones SET `%s` = '%s' WHERE `entry` = '%s';",
		[2] = "DELETE FROM %s WHERE `guid` = '%s';",
		[3] = "UPDATE "..guild_warz_DB..".commands SET `%s` = '%s' WHERE `guild` = '%s';"
	}
	
	if(key == 1) then
		local subtable, value, loc = ...
		local qs = string.format(Query[key], ...)
		WorldDBQuery(qs)
		GWARZ[loc][subtable] = value;
	end
	
	if(key == 2) then
		local qs = string.format(Query[key], ...)
		WorldDBQuery(qs)
		LoadGWtable()
	end
	
	if(key == 3) then
		local qs = string.format(Query[key], ...)
		WorldDBQuery(qs)
		LoadGWtable()
	end
end

function CreateLocation(map, area, zone)
	local CLentry = (#GWARZ+1)
	WorldDBQuery("INSERT INTO "..guild_warz_DB..".zones SET `entry` = '"..CLentry.."';");
	LoadGWtable()
	print("Location: "..CLentry.." : created.")	
	
	-- Push values to Table Update after creation
	PreparedStatements(1, "map_id", map, CLentry)
	PreparedStatements(1, "area_id", area, CLentry)
	PreparedStatements(1, "zone_id", zone, CLentry)
	PreparedStatements(1, "guild_name", Server, CLentry)
	PreparedStatements(1, "team", 2, CLentry)
	PreparedStatements(1, "x", 0, CLentry)
	PreparedStatements(1, "y", 0, CLentry)
	PreparedStatements(1, "z", 0, CLentry)
	PreparedStatements(1, "farm_count", 0, CLentry)
	PreparedStatements(1, "pig_count", 0, CLentry)
	PreparedStatements(1, "guard_count", 0, CLentry)
	PreparedStatements(1, "flag_id", 0, CLentry)
	return CLentry;
end

function CreateGcommands(guild, name)
	local gid = guild:GetId()
	local CLentry = (#GWCOMM+1) -- should create varchar entry of guild name
	WorldDBQuery("INSERT INTO "..guild_warz_DB..".commands SET `guild` = '"..name.."';");
	PreparedStatements(3, "guild_id", gid, name)
	print("commands for: "..guild.." : created.")	
	LoadGWtable()
	return guild;
end

local GW_version =  ((table_version+core_version+pigpayz_version+tele_version+pvp_version)/4)

function Newguildgift(eventId, guild, leader, name) -- idea provided by creativextent . wrote by BlackWolf
	CreateGcommands(guild, name)
	leader:AddItem(GWCOMM["SERVER"].currency, GWCOMM["SERVER"].gift_count)
	SendWorldMessage("|cffFF0000The Guild "..name.." lead by "..leader:GetName().." has entered exsistance..!! NOW Prepair to hold your lands!!|r")
end

RegisterGuildEvent(5, Newguildgift)

function PlrFaction(eventId, player)

	local xFaction = player:GetFaction()
	
	GGW[player:GetAccountId()] = {
			faction = xFaction,
			team = player:GetTeam(),
				};
			
	if(player:GetGuildName())then
		
		local Guildname = ""..player:GetGuildName()..""

			if(GWCOMM[Guildname])then
				player:SendBroadcastMessage("|cff00cc00Use '/guild "..GWCOMM[Guildname].commands.." for a list of GGW commands.")	
			end
	end
end
								
RegisterPlayerEvent(3, PlrFaction)

-- ****************************************************
-- ******************* CORE ENGINE ********************
-- ****************************************************

function GWcommands(event, player, msg, type, language)
local k = 0
local ChatCache = {}

	for word in string.gmatch(msg, "[%w_]+") do
	        k = k+1
	        ChatCache[k] = word
	end

math.randomseed(tonumber(os.time()*os.time()))

local guild_id = player:GetGuildId()
local LocId = GetLocationId(player)
	
	if(LocId == nil)then
		LocId = CreateLocation(player:GetMapId(), player:GetAreaId(), player:GetZoneId())
	end
	
local Guildname = ""..player:GetGuildName()..""

	if(GWCOMM[Guildname]==nil)then
		Gcommands = CreateGcommands(player:GetGuild(), player:GetGuildName())
	end
	
	if(GWCOMM[Guildname]==nil)then
		Gcommands = CreateGcommands(player:GetGuildName())
	end
			
	local Zoneprice=(GWCOMM["SERVER"].loc_cost)+(GWCOMM["SERVER"].farm_cost*GWARZ[LocId].farm_count)+(GWCOMM["SERVER"].barrack_cost*GWARZ[LocId].barrack_count)+(GWCOMM["SERVER"].hall_cost*GWARZ[LocId].hall_count)+(GWCOMM["SERVER"].pig_cost*GWARZ[LocId].pig_count)
	local yentry = 0
	local ypigcnt = 0
	local yvalue = 0
	
-- ****************************************************
-- ************** CORE : Guild Commands ***************
-- ****************************************************

	if(player:IsInGuild()==true)then
		
		if(ChatCache[1]==GWCOMM[player:GetGuildName()].commands)then
			player:SendBroadcastMessage("*************************************")
			player:SendBroadcastMessage("(Name: "..player:GetName()..") (Guild Rank: "..player:GetGuildRank()..") (Game Rank: "..player:GetGMRank()..")")
			player:SendBroadcastMessage("*************************************")
			player:SendBroadcastMessage("Guild Member Commands:")
			player:SendBroadcastMessage("|cff00cc00"..GWCOMM[Guildname].commands.."          list guild commands.|r")
			player:SendBroadcastMessage("|cff00cc00"..GWCOMM[Guildname].info_loc.."              lists area info.|r")
			player:SendBroadcastMessage("|cff00cc00"..GWCOMM[Guildname].list_loc.."             lists areas owned.|r")
			player:SendBroadcastMessage("|cff00cc00                    by your guild.|r")
			player:SendBroadcastMessage("|cff00cc00"..GWCOMM[Guildname].tele.." `location`   teleport to area|r")
			player:SendBroadcastMessage("|cff00cc00                    by location id.|r")
			player:SendBroadcastMessage("|cff00cc00"..GWCOMM[Guildname].version.."              -displays Core versions.|r")
			player:SendBroadcastMessage("*************************************")

			if(player:GetGuildRank() <= GWCOMM[player:GetGuildName()].GLD_lvlb)then
				player:SendBroadcastMessage("(buy) Guild Master level Commands:Rank: "..GWCOMM[player:GetGuildName()].GLD_lvlb.." access.")
				player:SendBroadcastMessage("|cff00cc00buy "..GWCOMM[Guildname].loc.."         -purchase area.|r")
				player:SendBroadcastMessage("|cff00cc00buy "..GWCOMM[Guildname].farm.."       -purchase a guild farm.|r")
				player:SendBroadcastMessage("|cff00cc00buy "..GWCOMM[Guildname].barrack.."       -purchase a barracks for guards.|r")
				player:SendBroadcastMessage("|cff00cc00buy "..GWCOMM[Guildname].hall.."       -purchase a guild hall.|r")
				player:SendBroadcastMessage("|cff00cc00buy "..GWCOMM[Guildname].pig.."           -purchase a pig.|r")
				player:SendBroadcastMessage("|cff00cc00buy "..GWCOMM[Guildname].guard.."       -purchase a disposable guard.")
				player:SendBroadcastMessage("*************************************")
			end
			
			if(player:GetGuildRank()<=GWCOMM[player:GetGuildName()].GLD_lvls)then
				player:SendBroadcastMessage("(sell) Guild Master level Commands:Rank: "..GWCOMM[player:GetGuildName()].GLD_lvls.." access.")
				player:SendBroadcastMessage("|cff00cc00sell "..GWCOMM[Guildname].loc.."         -sell area for its TOTAL value.|r")
				player:SendBroadcastMessage("|cff00cc00sell "..GWCOMM[Guildname].farm.."       -sell farm.|r")		
				player:SendBroadcastMessage("|cff00cc00sell "..GWCOMM[Guildname].barrack.."       -sell barracks.|r")		
				player:SendBroadcastMessage("|cff00cc00sell "..GWCOMM[Guildname].hall.."       -sell hall.|r")		
				player:SendBroadcastMessage("|cff00cc00sell "..GWCOMM[Guildname].pig.."           -sell a pig to market.|r")		
				player:SendBroadcastMessage("|cff00cc00sell "..GWCOMM[Guildname].guard.."  -removes a selected guard.|r")
				player:SendBroadcastMessage("|cff00cc00                             guards are disposable.|r")
				player:SendBroadcastMessage("|cff00cc00                             no chash back.|r")
				player:SendBroadcastMessage("*************************************")
			end
			
			if(player:GetGuildRank()==0)then
				player:SendBroadcastMessage("Guild Master settings:")
				player:SendBroadcastMessage("|cff00cc00Guild Buy. minimum required guild rank:|r "..GWCOMM[player:GetGuildName()].GLD_lvlb.."")
				player:SendBroadcastMessage("|cff00cc00Guild Sell. minimum required guild rank:|r "..GWCOMM[player:GetGuildName()].GLD_lvls.."")
				player:SendBroadcastMessage("|cff00cc00guild invite system: |r"..GWCOMM[Guildname].guild_invite..".         |cff00cc00 0 = off 1 = on.|r")
				player:SendBroadcastMessage("*************************************")
			end

			if(player:GetGuildRank()==0)or(player:GetGMRank()==GWCOMM["SERVER"].GM_admin)then
				player:SendBroadcastMessage("Guild Master/Game Master/Admin special Commands:")
				player:SendBroadcastMessage("|cff00cc00"..GWCOMM["SERVER"].command_set.."      used to modify commands and settings.|r")
				player:SendBroadcastMessage("|cff00cc00help "..GWCOMM["SERVER"].command_set.."    lists commands and settings you may change.|r")
				player:SendBroadcastMessage("*************************************")
			end
			
			if(player:GetGuildRank()<=GWCOMM[player:GetGuildName()].GLD_lvlb)or(player:GetGMRank()>=GWCOMM["SERVER"].GM_minimum)then
				player:SendBroadcastMessage("Prices in "..Currencyname.."'s")
				player:SendBroadcastMessage("|cff00cc00Zone price:|r "..GWCOMM["SERVER"].loc_cost.."|cff00cc00 base location price.|r")
				player:SendBroadcastMessage("|cff00cc00Farm price:|r "..GWCOMM["SERVER"].farm_cost.."")
				player:SendBroadcastMessage("|cff00cc00Barracks price:|r "..GWCOMM["SERVER"].barrack_cost.."")
				player:SendBroadcastMessage("|cff00cc00Hall price:|r "..GWCOMM["SERVER"].hall_cost.."")
				player:SendBroadcastMessage("|cff00cc00Pig price:|r "..GWCOMM["SERVER"].pig_cost.."")
				player:SendBroadcastMessage("|cff00cc00Guard price:|r "..GWCOMM["SERVER"].guard_cost.."|cff00cc00 disposable.|r")
				player:SendBroadcastMessage("*************************************")
				player:SendBroadcastMessage("Limits")
				player:SendBroadcastMessage("|cff00cc00Farm limit:|r "..GWCOMM["SERVER"].farm_L.."|cff00cc00 per location.|r")
				player:SendBroadcastMessage("|cff00cc00Pig limit:|r "..GWCOMM["SERVER"].pig_L.."|cff00cc00 per farm.|r")
				player:SendBroadcastMessage("|cff00cc00Barrack limit:|r "..GWCOMM["SERVER"].barrack_L.."|cff00cc00 per farm.|r")
				player:SendBroadcastMessage("|cff00cc00Guard limit:|r "..GWCOMM["SERVER"].guard_L.."|cff00cc00 per barrack.|r")
				player:SendBroadcastMessage("|cff00cc00Hall limit:|r "..GWCOMM["SERVER"].hall_L.."|cff00cc00 per location.|r")
				player:SendBroadcastMessage("*************************************")
			end
			
			if(player:GetGMRank()>=GWCOMM["SERVER"].GM_minimum)then
				player:SendBroadcastMessage("Game Master Commands:")
				player:SendBroadcastMessage("|cff00cc00"..GWCOMM["SERVER"].details_loc.."         -location info.|r")
				player:SendBroadcastMessage("|cff00cc00reset "..GWCOMM["SERVER"].loc.."           -Resets location to server.|r")
				player:SendBroadcastMessage("|cff00cc00reload "..GWCOMM["SERVER"].table.."          -Reloads GW tables.|r")
				player:SendBroadcastMessage("|cff00cc00reset "..GWCOMM["SERVER"].farm.."          -Resets location farm count to 0.|r")
				player:SendBroadcastMessage("|cff00cc00reset "..GWCOMM["SERVER"].barrack.."          -Resets location barrack count to 0.|r")
				player:SendBroadcastMessage("|cff00cc00reset "..GWCOMM["SERVER"].hall.."          -Resets location hall count to 0.|r")
				player:SendBroadcastMessage("|cff00cc00reset "..GWCOMM["SERVER"].pig.."          -Resets location pig count to 0.|r")
				player:SendBroadcastMessage("|cff00cc00reset "..GWCOMM["SERVER"].guard.."          -Resets location guard count to 0.|r")
				player:SendBroadcastMessage("|cff00cc00spawn "..GWCOMM["SERVER"].respawn_flag.."         -Spawns new flag if current|r")
				player:SendBroadcastMessage("|cff00cc00                         flag is missing.|r") 
				player:SendBroadcastMessage("|cff00cc00lock "..GWCOMM["SERVER"].loc.."         -locks a location from purchase.|r")
				player:SendBroadcastMessage("*************************************")
				player:SendBroadcastMessage("ADMIN settings")
				player:SendBroadcastMessage("|cff00cc00ADMIN Level Access:|r "..GWCOMM["SERVER"].GM_admin.."")
				player:SendBroadcastMessage("|cff00cc00Minimum GM Level Access:|r "..GWCOMM["SERVER"].GM_minimum.."")
				player:SendBroadcastMessage("|cff00cc00Pig Payz:|r "..GWCOMM["SERVER"].pig_payz.."|cff00cc00 copper.|r")
				player:SendBroadcastMessage("|cff00cc00New Guild Gift amount:|r "..GWCOMM["SERVER"].gift_count.."")
				player:SendBroadcastMessage("|cff00cc00Flag require:|r "..GWCOMM["SERVER"].flag_require.."")
				player:SendBroadcastMessage("|cff00cc00Anarchy:|r "..GWCOMM["SERVER"].anarchy.."")
				player:SendBroadcastMessage("|cff00cc00No-Tag-Flag:|r "..GWCOMM["SERVER"].flag_timer.."")
				player:SendBroadcastMessage("|cff00cc00No-Tag-Flag-Timer:|r "..GWCOMM["SERVER"].spawn_timer.."")
				player:SendBroadcastMessage("*************************************")
			end
		return false;
		end
		
		if(ChatCache[1]==GWCOMM[Guildname].info_loc)then
			player:SendBroadcastMessage("*************************************")
			player:SendBroadcastMessage("|cff00cc00Loc ID:|r "..GWARZ[LocId].entry.."")
			player:SendBroadcastMessage("|cff00cc00Owner:|r "..GWARZ[LocId].guild_name.."")
			player:SendBroadcastMessage("|cff00cc00Farms:|r "..GWARZ[LocId].farm_count.."")
			player:SendBroadcastMessage("|cff00cc00Hall:|r "..GWARZ[LocId].hall_count.."")
			player:SendBroadcastMessage("|cff00cc00pigs:|r "..GWARZ[LocId].pig_count.."")
			player:SendBroadcastMessage("|cff00cc00Value:|r "..Zoneprice.."|cff00cc00 "..Currencyname.."'s.|r")
			
			if(GWARZ[LocId].team==0)then
				player:SendBroadcastMessage("|cff00cc00Faction: Alliance.|r")
				player:SendBroadcastMessage("*************************************")
			end
			
			if(GWARZ[LocId].team==1)then
				player:SendBroadcastMessage("|cff00cc00Faction: Horde.|r")
				player:SendBroadcastMessage("*************************************")
			end
			
			if(GWARZ[LocId].team==2)then
				player:SendBroadcastMessage("|cff00cc00Faction: For Sale.|r")
				player:SendBroadcastMessage("*************************************")
			end

			if(GWARZ[LocId].team==3)then
				player:SendBroadcastMessage("|cff00cc00Faction:|r |cffFF0000LOCKED|r")
				player:SendBroadcastMessage("*************************************")
			end
			return false;
		end
		
		if(ChatCache[1]==GWCOMM[Guildname].list_loc)then
			local Glocdb = WorldDBQuery("SELECT `entry` FROM "..guild_warz_DB..".zones WHERE `guild_name` = '"..player:GetGuildName().."';");
			
			if(Glocdb==nil)then
				player:SendBroadcastMessage("Your guild does not own any land")
			end
			
			if(Glocdb~=nil)then
				player:SendBroadcastMessage("**********************************************************************")
				player:SendBroadcastMessage("|cff00cc00Loc ID:     farm:     barracks:     Hall:     Guards:     Pigs:          Zone value:|r")
				
				repeat
					local Gloc = Glocdb:GetUInt32(0)
					local Xzoneprice=(GWCOMM["SERVER"].loc_cost)+(GWCOMM["SERVER"].farm_cost*GWARZ[Gloc].farm_count)+(GWCOMM["SERVER"].barrack_cost*GWARZ[Gloc].barrack_count)+(GWCOMM["SERVER"].hall_cost*GWARZ[Gloc].hall_count)+(GWCOMM["SERVER"].pig_cost*GWARZ[Gloc].pig_count)
					player:SendBroadcastMessage("|cff00cc00 "..Gloc.."             "..GWARZ[Gloc].farm_count.."             "..GWARZ[Gloc].barrack_count.."             "..GWARZ[Gloc].hall_count.."             "..GWARZ[Gloc].guard_count.."             "..GWARZ[Gloc].pig_count.."                  "..Xzoneprice.."|r")
					yentry = yentry+1
					ypigcnt = ypigcnt+GWARZ[Gloc].pig_count
					yvalue = yvalue+Xzoneprice
				until Glocdb:NextRow()~=true;
				
				player:SendBroadcastMessage("**********************************************************************")
				player:SendBroadcastMessage("|cff00cc00total locations: "..yentry.."      total pigs: "..ypigcnt.."      Total value: "..yvalue.." "..Currencyname.."'s.|r")
				player:SendBroadcastMessage("**********************************************************************")
			end
			return false;
		end
		
		if(ChatCache[1]==GWCOMM[Guildname].version)then
			player:SendBroadcastMessage("*******************************")
			player:SendBroadcastMessage("|cff00cc00Grumbo'z Guild Warz. VER : "..GW_version.."|r")
			player:SendBroadcastMessage("|cff00cc00Core :: "..core_version..".|r")
			player:SendBroadcastMessage("|cff00cc00PigPayz :: "..pigpayz_version..".|r")
			player:SendBroadcastMessage("|cff00cc00Teleport :: "..tele_version..".|r")
			player:SendBroadcastMessage("|cff00cc00PvP :: "..pvp_version..".|r")
			player:SendBroadcastMessage("*******************************")
			return false;
		end
	
		if (ChatCache[1] == GWCOMM["SERVER"].command_set) then
	
			for i = 1, #GWHELP do
	
				if(ChatCache[2]==tostring(GWHELP[i].command))then
	
					if(GWHELP[i].command_level<=4)and(player:GetGuildRank()==0)then
						PreparedStatements(3, ChatCache[2], ChatCache[3], player:GetGuildName())
						player:SendBroadcastMessage("guild cmd "..ChatCache[2].." set to "..ChatCache[3]..".")
					return false;
					end
		
					if(GWHELP[i].command_level<=6)and(GWHELP[i].command_level>=5)and(player:GetGMRank()==GWCOMM["SERVER"].GM_admin)then
						PreparedStatements(3, ChatCache[2], ChatCache[3], "SERVER")
						player:SendBroadcastMessage("GM cmd "..ChatCache[2].." set to "..ChatCache[3]..".")
					return false;
					end
				end
			end	
		player:SendBroadcastMessage("err...")
		return false;
		end
	
		if (ChatCache[1] == "help")then
		
			for i = 1, #GWHELP do
				
				if(ChatCache[2] == GWCOMM["SERVER"].command_set)and(ChatCache[3]==nil)then
					player:SendBroadcastMessage("command id      -     description")
						
						for b = 1, #GWHELP do

							if((player:GetGuildRank()==0)and(GWHELP[b].command_level<=4))then
								player:SendBroadcastMessage(GWHELP[b].command.."     -     |cff00cc00"..GWHELP[b].description.."|r")
							end
							
							if(player:GetGMRank()==GWCOMM["SERVER"].GM_admin)and(GWHELP[b].command_level>=5)and(GWHELP[b].command_level<=6)then
	                        	player:SendBroadcastMessage(GWHELP[b].command.."     -     |cff00cc00"..GWHELP[b].description.."|r")
	                        end
						end
				return false;
				end
				
				if(ChatCache[3] == tostring(GWHELP[i].command))then
				
					if(player:GetGuildRank()==0)and(GWHELP[i].command_level<=4)then
						player:SendBroadcastMessage(GWHELP[i].command.."      -      |cff00cc00"..GWHELP[i].description.."|r")
						player:SendBroadcastMessage("|cff00cc00Example:|r /g "..GWHELP[i].example.."")
						player:SendBroadcastMessage("|cff00cc00Current:|r "..GWCOMM[Guildname][GWHELP[i].command].."")
						return false;
					end
					
					if(player:GetGMRank()==GWCOMM["SERVER"].GM_admin)and(GWHELP[i].command_level>=5)and(GWHELP[i].command_level<=6)then
						player:SendBroadcastMessage(GWHELP[i].command.."      -      |cff00cc00"..GWHELP[i].description.."|r")
						player:SendBroadcastMessage("|cff00cc00Example:|r /g "..GWHELP[i].example.."")
						player:SendBroadcastMessage("|cff00cc00Current:|r "..GWCOMM[Guildname][GWHELP[i].command].."")
						return false;
					end
				end
			end
		player:SendBroadcastMessage("err...")
		return false;
		end

-- ****************************************************
-- ************ CORE: Guild Master Commands ***********
-- ****************************************************

		if(player:GetGuildRank() <= GWCOMM[Guildname].GLD_lvlb and ChatCache[1] == "buy")then

-- ******************* Buy commands *******************

			if(ChatCache[2] == GWCOMM[Guildname].loc)then
		
				if(GWARZ[LocId].guild_name ~= Server)then
					player:SendBroadcastMessage("You cannot purchase this area.")
					player:SendBroadcastMessage(""..GWARZ[LocId].guild_name.." owns this area.")
				else
					if(player:GetItemCount(GWCOMM["SERVER"].currency) < Zoneprice)then
						player:SendBroadcastMessage("You do not have enough "..Currencyname.."'s.")
					else
						if(GWARZ[LocId].team==3)then
							player:SendBroadcastMessage("THIS AREA IS OFF LIMITS")
						else
							Gflag = PerformIngameSpawn(2, GWCOMM["SERVER"].flag_id+(player:GetTeam()), player:GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 1, 0, 1):GetGUIDLow()
							PreparedStatements(1, "guild_name", player:GetGuildName(), LocId)
							PreparedStatements(1, "team", player:GetTeam(), LocId)
							PreparedStatements(1, "x", player:GetX(), LocId)
							PreparedStatements(1, "y", player:GetY(), LocId)
							PreparedStatements(1, "z", player:GetZ(), LocId)
							PreparedStatements(1, "flag_id", Gflag, LocId)
							PreparedStatements(1, "fs_time", GetGameTime(), LocId)							
							PreparedStatements(1, "guild_id", guild_id, LocId)
							player:RemoveItem(GWCOMM["SERVER"].currency, Zoneprice)
						
							if(player:GetGender()==0)then
								player:SendBroadcastMessage("|cff00cc00Congratulations King "..player:GetName()..". you have expanded "..player:GetGuildName().."'s land.|r")
							else
								player:SendBroadcastMessage("|cff00cc00Congratulations Queen "..player:GetName()..". you have expanded "..player:GetGuildName().."'s land.|r")
							end
						end
					end
				end
			return false;
			end
	
			if(ChatCache[2] == GWCOMM[Guildname].farm)then

				if(GWARZ[LocId].guild_name ~= player:GetGuildName())then
					player:SendBroadcastMessage("Your Guild does not own this land.")
				else
					if(player:GetItemCount(GWCOMM["SERVER"].currency) < GWCOMM["SERVER"].farm_cost)then
						player:SendBroadcastMessage("You require more "..Currencyname.."'s.")
					else
						if(GWARZ[LocId].farm_count >= GWCOMM["SERVER"].farm_L)then
							player:SendBroadcastMessage("You have  "..GWARZ[LocId].farm_count.." farm\'s at this location.")
							player:SendBroadcastMessage("You can only purchase "..GWCOMM["SERVER"].farm_L.." farm\'s per location.")
						else
							if(GWARZ[LocId].pig_count < (GWARZ[LocId].farm_count * GWCOMM["SERVER"].pig_L))then
								player:SendBroadcastMessage("you still need to finish populating your other farm.")
							else
								PerformIngameSpawn(2, GWCOMM["SERVER"].farm_id+GWARZ[LocId].team, player:GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 1, 0, 1)
								PreparedStatements(1, "farm_count", GWARZ[LocId].farm_count+1, LocId)
								player:RemoveItem(GWCOMM["SERVER"].currency, GWCOMM["SERVER"].farm_cost)
								player:SendBroadcastMessage("|cff00cc00Congratulations Grunt "..player:GetName()..".|r")
								player:SendBroadcastMessage("|cff00cc00"..player:GetGuildName().." has added a farm at location: "..LocId..".|r")
							end
						end
					end
				end
			return false;
			end
			
			if(ChatCache[2] == GWCOMM[Guildname].barrack)then
			
				if(GWARZ[LocId].guild_name ~= player:GetGuildName())then
					player:SendBroadcastMessage("Your Guild does not own this land.")
				else
					if(player:GetItemCount(GWCOMM["SERVER"].currency) < GWCOMM["SERVER"].barrack_cost)then
						player:SendBroadcastMessage("You require more "..Currencyname.."'s.")
					else
						if(GWARZ[LocId].barrack_count >= GWCOMM["SERVER"].farm_L)then
							player:SendBroadcastMessage("You have  "..GWARZ[LocId].barrack_count.." barrack\'s at this location.")
							player:SendBroadcastMessage("You can only purchase "..GWCOMM["SERVER"].barrack_L.." barrack\'s per location.")
						else
							if(GWARZ[LocId].barrack_count >= GWARZ[LocId].farm_count)then
								player:SendBroadcastMessage("You need at least 1 farm to support a single barracks.")
							else
								PerformIngameSpawn(2, GWCOMM["SERVER"].barrack_id+GWARZ[LocId].team, player:GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 1, 0, 1)
								PreparedStatements(1, "barrack_count", GWARZ[LocId].barrack_count+1, LocId)
								player:RemoveItem(GWCOMM["SERVER"].currency, GWCOMM["SERVER"].barrack_cost)
								player:SendBroadcastMessage("|cff00cc00Congratulations Commander "..player:GetName()..".|r")
								player:SendBroadcastMessage("|cff00cc00"..player:GetGuildName().." has added a barracks at location: "..LocId..".|r")
							end
						end
					end
				end
			return false;
			end
			
			if(ChatCache[2] == GWCOMM[Guildname].hall)then
				if(player:GetGuildName() ~= GWARZ[LocId].guild_name)then
					player:SendBroadcastMessage("Your Guild does not own this land.")
				else
					if(player:GetItemCount(GWCOMM["SERVER"].currency) < GWCOMM["SERVER"].hall_cost)then
						player:SendBroadcastMessage("Each hall costs "..GWCOMM["SERVER"].hall_cost.." "..Currencyname..".")
					else
						if(GWARZ[LocId].hall_count >= GWCOMM["SERVER"].hall_L)then
							player:SendBroadcastMessage("You have "..GWARZ[LocId].hall_count.." hall at this location.")				
							player:SendBroadcastMessage("You can only have "..GWCOMM["SERVER"].hall_L.." hall per area.")	
						else
							if(GWARZ[LocId].hall_count == GWARZ[LocId].barrack_count)then
								player:SendBroadcastMessage("Each Hall require's 1 barracks per Hall to provide guards for defensive support.")
								player:SendBroadcastMessage("Gotta protect your HQ.")
							else
								PerformIngameSpawn(2, GWCOMM["SERVER"].hall_id+GWARZ[LocId].team, player:GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 1, 0, 1)
								PreparedStatements(1, "hall_count", GWARZ[LocId].hall_count+1, LocId)
								player:RemoveItem(GWCOMM["SERVER"].currency, GWCOMM["SERVER"].hall_cost)
								player:SendBroadcastMessage("|cff00cc00Congradulations!.|r")
								player:SendBroadcastMessage("|cff00cc00Commandant "..player:GetName()..".|r")
							end
						end
					end
				end
			return false;
			end
			
			if(ChatCache[2] == GWCOMM[Guildname].pig)then
				if(GWARZ[LocId].guild_name ~= player:GetGuildName())then
					player:SendBroadcastMessage("Your Guild does not own this land.")
				else
					if(player:GetItemCount(GWCOMM["SERVER"].currency) < GWCOMM["SERVER"].pig_cost)then
						player:SendBroadcastMessage("Each pig costs "..GWCOMM["SERVER"].pig_cost.." "..Currencyname..".")
					else
						if(GWARZ[LocId].pig_count >= (GWCOMM["SERVER"].pig_L * GWCOMM["SERVER"].farm_L))then
							player:SendBroadcastMessage("You have "..(GWARZ[LocId].pig_count*GWCOMM["SERVER"].farm_L).." pigs at this location.")				
							player:SendBroadcastMessage("You can only have "..GWCOMM["SERVER"].pig_L.." pig's per farm and "..GWCOMM["SERVER"].farm_L.." farm's per location.")	
						else
							if(GWARZ[LocId].pig_count < GWCOMM["SERVER"].pig_L)and(GWARZ[LocId].farm_count==0)then
								player:SendBroadcastMessage("You must first have a farm here before you can add pigs.")
								player:SendBroadcastMessage("Piggies gotta live somewhere...")
							else
								if(GWARZ[LocId].pig_count >= (GWARZ[LocId].farm_count * GWCOMM["SERVER"].pig_L))then
									player:SendBroadcastMessage("You require another farm before you can add any more pigs.")
								else								
									PerformIngameSpawn(1, GWCOMM["SERVER"].pig_id+GWARZ[LocId].team, player:GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 1, 0, 1)
									PreparedStatements(1, "pig_count", GWARZ[LocId].pig_count+1, LocId)
									player:RemoveItem(GWCOMM["SERVER"].currency, GWCOMM["SERVER"].pig_cost)
									player:SendBroadcastMessage("|cff00cc00Congradulations!.|r")
									player:SendBroadcastMessage("|cff00cc00Farmer "..player:GetName()..".|r")
								end
							end
						end
					end
				end
			return false;
			end
			
			if(ChatCache[2] == GWCOMM[Guildname].guard)then
				if(GWARZ[LocId].guild_name ~= player:GetGuildName())then
					player:SendBroadcastMessage("Your Guild does not own this land.")
				else
					if(player:GetItemCount(GWCOMM["SERVER"].currency) < GWCOMM["SERVER"].guard_cost)then
						player:SendBroadcastMessage("Each guard costs "..GWCOMM["SERVER"].guard_cost.." "..Currencyname..".")
					else
						if(GWARZ[LocId].guard_count >= (GWCOMM["SERVER"].guard_L * (GWCOMM["SERVER"].barrack_L * GWCOMM["SERVER"].farm_L)))then
							player:SendBroadcastMessage("You have "..GWARZ[LocId].guard_count.." guards at this location.")
							player:SendBroadcastMessage("You can only have "..(GWCOMM["SERVER"].guard_L*GWCOMM["SERVER"].farm_L).." per location.")
						else
							if(GWARZ[LocId].guard_count >= (GWARZ[LocId].barrack_count * GWCOMM["SERVER"].guard_L))then
								player:SendBroadcastMessage("You must add another barracks to produce more guards.")
							else
								PerformIngameSpawn(1, GWCOMM["SERVER"].guard_id+GWARZ[LocId].team, player:GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 1, 0, 1)
								PreparedStatements(1, "guard_count", GWARZ[LocId].guard_count+1, LocId)
								player:RemoveItem(GWCOMM["SERVER"].currency, GWCOMM["SERVER"].guard_cost)
								player:SendBroadcastMessage("|cff00cc00Guard added by Commander "..player:GetName()..".|r")
							end
						end
					end
				end
			return false;
			end
		end

-- ******************* Sell commands ******************

		if(player:GetGuildRank() <= GWCOMM[Guildname].GLD_lvls)and(ChatCache[1] == "sell")then
		
			if(ChatCache[2]==GWCOMM[Guildname].loc)then
			
				if(GWARZ[LocId].guild_name~=player:GetGuildName())then
					player:SendBroadcastMessage("Your guild does not own this land.")
				else
					if(player:GetNearestGameObject(1, GWCOMM["SERVER"].flag_id+GWARZ[LocId].team)==nil)then
						player:SendBroadcastMessage("You must be next to your guild flag.")
						player:SendBroadcastMessage("move closer and try again.")
					else
						local flagid = player:GetNearestGameObject(1, (GWCOMM["SERVER"].flag_id+GWARZ[LocId].team)):GetGUIDLow()
						player:GetNearestGameObject(2, (GWCOMM["SERVER"].flag_id+GWARZ[LocId].team)):Despawn()
						PreparedStatements(1, "guild_name", Server, LocId)
						PreparedStatements(1, "team", 2, LocId)
						PreparedStatements(1, "flag_id", 0, LocId)
						PreparedStatements(1, "fs_time", 0, LocId)
						PreparedStatements(1, "guild_id", 0, LocId)
						player:AddItem(GWCOMM["SERVER"].currency, Zoneprice)
						player:SendBroadcastMessage("|cff00cc00!Congratulations! Realtor "..player:GetName().." has sold this land. For "..Zoneprice.." "..Currencyname.."'s.|r")
					end
				end
			return false;
			end
			
			if(ChatCache[2] == GWCOMM[Guildname].farm)then
				if(player:GetGuildName() ~= GWARZ[LocId].guild_name)then
					player:SendBroadcastMessage("Your guild does not own this land.")
				end
				if(player:GetGuildName() == GWARZ[LocId].guild_name)then
					if(GWARZ[LocId].farm_count == 0)then
						player:SendBroadcastMessage("Your guild does not own a house at this location.")
					else
						if(GWARZ[LocId].pig_count > ((GWCOMM["SERVER"].pig_L) * (GWARZ[LocId].farm_count-1)))then
							player:SendBroadcastMessage("You must sell off all the pigs first before removing there housing.")
						else	
							if(player:GetNearestGameObject(10, GWCOMM["SERVER"].farm_id+GWARZ[LocId].team) == nil)then
								player:SendBroadcastMessage("You must be closer.")
							else
								local farmspawnid = player:GetNearestGameObject(10, GWCOMM["SERVER"].farm_id+GWARZ[LocId].team):GetGUIDLow() -- use this to avoid ghost respawns						
								player:GetNearestGameObject(10, (GWCOMM["SERVER"].farm_id+GWARZ[LocId].team)):Despawn()
								PreparedStatements(2, "gameobject", farmspawnid)
								PreparedStatements(1, "farm_count", GWARZ[LocId].farm_count-1, LocId)
								player:AddItem(GWCOMM["SERVER"].currency, GWCOMM["SERVER"].farm_cost)
								player:SendBroadcastMessage("|cff00cc00!Congratulations!"..player:GetGuildName().." has sold a guild farm. For "..GWCOMM["SERVER"].farm_cost.." "..Currencyname.."'s.|r")
							end
						end
					end
				end
			return false;
			end
			
			if(ChatCache[2] == GWCOMM[Guildname].barrack)then
				if(player:GetGuildName() ~= GWARZ[LocId].guild_name)then
					player:SendBroadcastMessage("Your guild does not own this land.")
				end
				if(player:GetGuildName() == GWARZ[LocId].guild_name)then
					if(GWARZ[LocId].barrack_count == 0)then
						player:SendBroadcastMessage("Your guild does not own a barracks at this location.")
					else
						if(GWARZ[LocId].guard_count > ((GWCOMM["SERVER"].guard_L) * (GWARZ[LocId].barrack_count-1)))then
							player:SendBroadcastMessage("You must remove more guards before removing there housing.")
						else	
							if(player:GetNearestGameObject(10, GWCOMM["SERVER"].barrack_id+GWARZ[LocId].team) == nil)then
								player:SendBroadcastMessage("You must be closer.")
							else
								local barrackspawnid = player:GetNearestGameObject(10, GWCOMM["SERVER"].barrack_id+GWARZ[LocId].team):GetGUIDLow() -- use this to avoid ghost respawns						
								player:GetNearestGameObject(10, GWCOMM["SERVER"].barrack_id+GWARZ[LocId].team):Despawn()
								PreparedStatements(2, "gameobject", barrackspawnid)
								PreparedStatements(1, "barrack_count", GWARZ[LocId].barrack_count-1, LocId)
								player:AddItem(GWCOMM["SERVER"].currency, GWCOMM["SERVER"].barrack_cost)
								player:SendBroadcastMessage("|cff00cc00!Congratulations! Builder "..player:GetGuildName().." has sold a garrison. For "..GWCOMM["SERVER"].barrack_cost.." "..Currencyname.."'s.|r")
							end
						end
					end
				end
			return false;
			end
			
			if(ChatCache[2] == GWCOMM[Guildname].hall)then
				if(player:GetGuildName() ~= GWARZ[LocId].guild_name)then
					player:SendBroadcastMessage("Your guild does not own this land.")
				end
				if(player:GetGuildName() == GWARZ[LocId].guild_name)then
					if(GWARZ[LocId].hall_count <= 0)then
						player:SendBroadcastMessage("Your guild does not own a hall at this location.")
					else
						if(player:GetNearestGameObject(45, GWCOMM["SERVER"].hall_id+GWARZ[LocId].team) == nil)then
							player:SendBroadcastMessage("You must be near to your hall to sell it.")
						else
							local hallspawnid = player:GetNearestGameObject(45, GWCOMM["SERVER"].hall_id+GWARZ[LocId].team):GetGUIDLow() -- use this to avoid ghost respawns						
							player:GetNearestGameObject(45, GWCOMM["SERVER"].hall_id+GWARZ[LocId].team):RemoveFromWorld() -- :Despawn()
							PreparedStatements(2, "gameobject", hallspawnid)
							PreparedStatements(1, "hall_count", GWARZ[LocId].hall_count-1, LocId)
							player:AddItem(GWCOMM["SERVER"].currency, GWCOMM["SERVER"].hall_cost)
							player:SendBroadcastMessage("|cff00cc00!Congratulations!"..player:GetGuildName().." has sold a Hall. For "..GWCOMM["SERVER"].hall_cost.." "..Currencyname.."'s.|r")
						end
					end
				end
			return false;
			end
			
			if(ChatCache[2] == GWCOMM[Guildname].pig)then
				if(player:GetGuildName() ~= GWARZ[LocId].guild_name)then
					player:SendBroadcastMessage("Your guild does not own this land.")
				else
					if(GWARZ[LocId].pig_count == 0)then
						player:SendBroadcastMessage("You DONT have any pigs in this area.")
					else
						if(player:GetSelection() == nil)then
							player:SendBroadcastMessage("You must select a pig.")
						else
							if(player:GetSelection():GetEntry() ~= GWCOMM["SERVER"].pig_id+GWARZ[LocId].team)then
								player:SendBroadcastMessage("you must select a guild pig.")
							else
								local pigspawnid = player:GetSelection():GetGUIDLow()
								player:GetSelection():DespawnOrUnsummon()
								PreparedStatements(2, "creature", pigspawnid)
								PreparedStatements(1, "pig_count", GWARZ[LocId].pig_count-1, LocId)
								player:AddItem(GWCOMM["SERVER"].currency, GWCOMM["SERVER"].pig_cost)
								player:SendBroadcastMessage("|cff00cc00Butcher "..player:GetName().." sold 1 pig to the market.|r")
							end
						end
					end
				end
			return false;
			end
			
			if(ChatCache[2] == GWCOMM[Guildname].guard)then

				if(player:GetGuildName()~=GWARZ[LocId].guild_name)then
					player:SendBroadcastMessage("Your guild does not own this land.")
				else
					if(GWARZ[LocId].guard_count == 0)then
						player:SendBroadcastMessage("You DONT have any guards in this area.")
					else
						if(player:GetSelection() == nil)then
							player:SendBroadcastMessage("You must select a guard.")

						else
							if(player:GetSelection():GetEntry()~=GWCOMM["SERVER"].guard_id+GWARZ[LocId].team)then
								player:SendBroadcastMessage("You must select a guild guard.")

							else
								local guardspawnid = player:GetSelection():GetGUIDLow()
								player:GetSelection():DespawnOrUnsummon()
								PreparedStatements(2, "creature", guardspawnid)
								PreparedStatements(1, "guard_count", GWARZ[LocId].guard_count-1, LocId)
								player:SendBroadcastMessage("|cff00cc00Guard removed.|r")
							end
						end
					end
				end
			end	
		return false;
		end
		
-- ****************************************************
-- **************** Game Master Commands **************
-- ****************************************************
		
		if(player:GetGMRank() >= GWCOMM["SERVER"].GM_minimum)then
		
			if(ChatCache[1] == "lock")and(ChatCache[2] == GWCOMM["SERVER"].loc)then
				PreparedStatements(1, "guild_name", Server, LocId)
				PreparedStatements(1, "team", 3, LocId)
				PreparedStatements(1, "flag_id", 0, LocId)
				PreparedStatements(1, "fs_time", 0, LocId)
				player:SendBroadcastMessage("|cff00cc00Area: "..GWARZ[LocId].entry.." succesfully |r|cffcc0000LOCKED.|r")
			return false;
			end
		
			if(ChatCache[1] == "reset")and(ChatCache[2] == GWCOMM["SERVER"].loc)then
				PreparedStatements(1, "guild_name", Server, LocId)
				PreparedStatements(1, "team", 2, LocId)
				PreparedStatements(1, "flag_id", 0, LocId)
				PreparedStatements(1, "fs_time", 0, LocId)
				player:SendBroadcastMessage("|cff00cc00Area: "..GWARZ[LocId].entry.." succesfully reset.|r")
			return false;
			end
			
			if(ChatCache[1] == "reset")and(ChatCache[2] == GWCOMM["SERVER"].farm)then
				PreparedStatements(1, "farm_count", 0, LocId)
				player:SendBroadcastMessage("|cff00cc00Area: "..GWARZ[LocId].entry.." house count reset.|r")
			return false;
			end
			
			if(ChatCache[1] == "reset")and(ChatCache[2] == GWCOMM["SERVER"].barrack)then
				PreparedStatements(1, "barrack_count", 0, LocId)
				player:SendBroadcastMessage("|cff00cc00Area: "..GWARZ[LocId].entry.." barrack count reset.|r")
			return false;
			end
			
			if(ChatCache[1] == "reset")and(ChatCache[2] == GWCOMM["SERVER"].hall)then
				PreparedStatements(1, "hall_count", 0, LocId)
				player:SendBroadcastMessage("|cff00cc00Area: "..GWARZ[LocId].entry.." hall count reset.|r")
			return false;
			end
			
			if(ChatCache[1] == "reset")and(ChatCache[2] == GWCOMM["SERVER"].pig)then
				PreparedStatements(1, "pig_count", 0, LocId)
				player:SendBroadcastMessage("|cff00cc00Area: "..GWARZ[LocId].entry.." pig count reset.|r")
			return false;
			end
			
			if(ChatCache[1] == "reset")and(ChatCache[2] == GWCOMM["SERVER"].guard)then
				PreparedStatements(1, "guard_count", 0, LocId)
				player:SendBroadcastMessage("|cff00cc00Area: "..GWARZ[LocId].entry.." guard count reset.|r")
			return false;
			end

			if(ChatCache[1] == "reload")and(ChatCache[2] == GWCOMM["SERVER"].table)then
				GWtable = {}
				LoadGWtable()
				player:SendBroadcastMessage("|cff00cc00Grumbo\'z Guild Warz Tables Reloaded.|r")
			return false;
			end

			if((ChatCache[1]=="spawn")and(ChatCache[2]=="flag"))then
				if(GWARZ[LocId].team >= 2)then
					player:SendBroadcastMessage("|cffFF0000The Server controls This Land. !! NO NEW FLAG SPAWNED !!|r")
				else
					GMFlagid = PerformIngameSpawn(2, GWCOMM["SERVER"].flag_id+GWARZ[LocId].team, player:GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 1, 0, 1):GetGUIDLow() -- no flag spawns +GWARZ[LocId].Team
					PreparedStatements(1, "flag_id", GMFlagid, LocId)
					PreparedStatements(1, "fs_time", GMFlagid, LocId)
					player:SendBroadcastMessage("|cff00cc00New flag spawned for Guild Warz location: "..GWARZ[LocId].entry.."|r")
				end
			return false;
			end
			
			if(ChatCache[1] == GWCOMM["SERVER"].details_loc)then
				player:SendBroadcastMessage("*************************************")
				player:SendBroadcastMessage("|cff00cc00Location ID: "..GWARZ[LocId].entry..".|r")
				player:SendBroadcastMessage("|cff00cc00Guild Name: "..GWARZ[LocId].guild_name..".|r")
				player:SendBroadcastMessage("|cff00cc00Team: "..GWARZ[LocId].team..".|r")
				player:SendBroadcastMessage("|cff00cc00Farm count: "..GWARZ[LocId].farm_count..".|r")
				player:SendBroadcastMessage("|cff00cc00Barrack count: "..GWARZ[LocId].barrack_count..".|r")
				player:SendBroadcastMessage("|cff00cc00Hall count: "..GWARZ[LocId].hall_count..".|r")
				player:SendBroadcastMessage("|cff00cc00Pig count: "..GWARZ[LocId].pig_count..".")
				player:SendBroadcastMessage("|cff00cc00guard count: "..GWARZ[LocId].guard_count..".|r")
				player:SendBroadcastMessage("|cff00cc00flag spawn id: "..GWARZ[LocId].flag_id..".|r")
				player:SendBroadcastMessage("|cff00cc00flag spawn time: "..GWARZ[LocId].spawn_time..".|r")
				player:SendBroadcastMessage("|cff00cc00Guild ID: "..GWARZ[LocId].guild_id..".|r")
				player:SendBroadcastMessage("|cff00cc00Game Time: "..GetGameTime()..".|r")
				player:SendBroadcastMessage("*************************************")
			return false;
			end
		end
	end
end
	
RegisterPlayerEvent(21, GWcommands)

print ("Guild Warz core version: "..core_version.."")

-- ****************************************************
-- Pig Payz System -- Ty rochet2 of EmuDevs.com
-- ****************************************************

local function pig_payz(eventid, timer, cycles, player)

	if(player:IsInGuild() == true)then
		
		local pig = 0
		local Glocdb = WorldDBQuery("SELECT `entry` FROM "..guild_warz_DB..".zones WHERE `guild_name` = '"..player:GetGuildName().."' AND `pig_count` > '0';");

		if(Glocdb==nil)then
			player:SendBroadcastMessage("PigPayz: 0 gold.", 0)
			player:SendBroadcastMessage("Zorkster says:Your guild does not own any pigs.", 0)
			player:SendBroadcastMessage("Zorkster says:Inform Your guild master to start some farms.", 0)
		else
			repeat
				local Gloc = Glocdb:GetUInt32(0)
				local Pigcnt = GWARZ[Gloc].pig_count
				pig = (pig+Pigcnt)

			until Glocdb:NextRow()~=true;

			Pigpayz=(GWCOMM["SERVER"].pig_payz*pig)
			player:ModifyMoney(Pigpayz)
			player:SendBroadcastMessage("DemiiGods says:|cff00cc00Your Guild\'s hard work pays off.|r")
			player:SendBroadcastMessage("|cff00cc00PigPayz: "..Pigpayz / '10000'.." gold.|r")
		end
		return false;
	else
		player:SendBroadcastMessage("Requin shouts:|cffff0000Join a guild to earn hourly rewards from Grumbo\'z Guild Warz.|r")
	end
end

local function pig_payz_timer(eventid, player)

	player:RegisterEvent(pig_payz, GWCOMM["SERVER"].pig_payz_timer, 0) 

end

RegisterPlayerEvent(3, pig_payz_timer)

print ("Pig Payz version: "..pigpayz_version.."")

-- ****************************************************
-- ********** Guild Warz teleporter system ************
-- ** a mild mutation of Grandelf1's guild teleporter *
-- ****************************************************

function Guildteleport(event, player, message, type, language)

local ChatMsg = GWCOMM[player:GetGuildName()].tele
local startpos, endpos = string.find(message, ChatMsg)

	if(startpos == 1) then
		local text = message:gsub(ChatMsg, "")
		if(player:IsInGuild()==true)then
			local Loc = tonumber(text)
			if(GWARZ[Loc]==nil)then
				player:SendBroadcastMessage("Grumbo says:|cffcc0000error.... teleport entry doesn't exsist.|r")
			else
				if(GWARZ[Loc].guild_name~=player:GetGuildName())then
					player:SendBroadcastMessage("Raider says:Your guild doesn't own that area.")
					player:SendBroadcastMessage("Raider says:You cannot teleport there.")
				else
					player:Teleport(GWARZ[Loc].map_id, GWARZ[Loc].x, GWARZ[Loc].y, GWARZ[Loc].z, 1.0)
					player:SendBroadcastMessage("DeadByDawn says:|cff00cc00Teleport complete.|r")
				end
			end
		end
	return false;
	end
end

RegisterPlayerEvent(21, Guildteleport)

print("Teleporter version: "..tele_version.."")

-- ****************************************************
-- *************** GUILD WARZ PvP System **************
-- ****************************************************

-- ************* Guild Warz Flag actions **************

function TransferFlag(player, locid, go)
	if(go:GetGUIDLow()~=GWARZ[locid].flag_id)then
		go:Despawn()
		player:SendBroadcastMessage("|cffcc0000error.... Phantom flag removed.|r")
		PreparedStatements(2, "gameobject", go:GetGUIDLow())
		return false;
	end
	
	if(player:IsInGuild()==false)then
		
		if(GWCOMM[GWARZ[locid].guild_name].guild_invite == 1)then
			player:SendBroadcastMessage("|cff00cc00Grumbo\'z Guild Warz System:|r")
			player:SendBroadcastMessage("|cff00cc00"..GWARZ[locid].guild_name.." own\'s this location "..player:GetName()..".|r")
			player:SendBroadcastMessage("|cff00cc00Join a Guild to participate in Grumbo\'z Guild Warz System.|r")
			player:SendBroadcastMessage("|cff00cc00Brought to you by Grumbo of BloodyWow.|r")
			Gwarz_Guild_Flag_Hello(1, player, go)
			return false;
		else
			player:SendBroadcastMessage("|cff00cc00Grumbo\'z Guild Warz System:|r")
			player:SendBroadcastMessage("|cff00cc00"..GWARZ[locid].guild_name.." own\'s this location "..player:GetName()..".|r")
			player:SendBroadcastMessage("|cff00cc00Join a Guild to participate in Grumbo\'z Guild Warz System.|r")
			player:SendBroadcastMessage("|cff00cc00Brought to you by Grumbo of BloodyWow.|r")
			player:SendBroadcastMessage("|cff00cc00This Guild Master has disabled the guild\'s invite system.|r")
			return false;
		end
	end
	
	if((player:GetGuildName()==GWARZ[locid].guild_name)or((GWCOMM["SERVER"].anarchy==0)and(player:GetTeam()==GWARZ[locid].team)))then
		player:SendBroadcastMessage("|cff00cc00"..GWARZ[locid].guild_name.." own\'s this location.|r")
		player:SendBroadcastMessage("|cff00cc00Grumbo\'z Guild Warz System.|r")
		return false;
	end
	
	if((player:GetTeam()~=GWARZ[locid].team)and(player:IsInGuild()==true))or((player:GetTeam()==GWARZ[locid].team)and(player:IsInGuild()==true)and(GWCOMM["SERVER"].anarchy==1))then

		if((GWARZ[locid].spawn_time+GWCOMM["SERVER"].spawn_timer < GetGameTime())and(GWCOMM["SERVER"].flag_timer==1))then
			player:SendBroadcastMessage("|cffff0000!!..Cooldown Timer in Affect..!!|r")
			
		else
			if(GWARZ[locid].guard_count~=0)and(GWCOMM["SERVER"].flag_require==1)then  -- this lil check added to make it tougher to take the land. idea by renatokeys
				player:SendBroadcastMessage("!!..You must clear ALL guards..!!")
	
			else
				if(((GWARZ[locid].guard_count==0)and(GWCOMM["SERVER"].flag_require==1))or(GWCOMM["SERVER"].flag_require==0))then
					player:GetNearestGameObject(2, (GWCOMM["SERVER"].flag_id+GWARZ[locid].team)):Despawn()
					Nflag = (PerformIngameSpawn(2, (GWCOMM["SERVER"].flag_id)+(player:GetTeam()), player:GetMapId(), 0, player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 1, 0, 1):GetGUIDLow())
					PreparedStatements(2, "gameobject", go:GetGUIDLow())
					SendWorldMessage("|cffff0000!! "..player:GetGuildName().." takes location:"..GWARZ[locid].entry.." from "..GWARZ[locid].guild_name.." !!|r", 1)
					PreparedStatements(1, "guild_name", player:GetGuildName(), locid)
					PreparedStatements(1, "team", player:GetTeam(), locid)
					PreparedStatements(1, "x", player:GetX(), locid)
					PreparedStatements(1, "y", player:GetY(), locid)
					PreparedStatements(1, "z", player:GetZ(), locid)
					PreparedStatements(1, "flag_id", Nflag, locid)
					PreparedStatements(1, "flag_id", Nflag, locid)
					PreparedStatements(1, "fs_time", GetGameTime(), locid)
					PreparedStatements(1, "guild_id", player:GetGuildId(), locid)
				end
			end
		end
	end
	return false;
end

function Tagflag(event, player, go)
	if(player ~= nil)then
		local LocId = GetLocationId(player)
		TransferFlag(player, LocId, go)
	end
end

RegisterGameObjectGossipEvent(GWCOMM["SERVER"].flag_id, 1, Tagflag)
RegisterGameObjectGossipEvent(GWCOMM["SERVER"].flag_id+1, 1, Tagflag)

-- *********** Guild Invite Flag Action ***********

function Gwarz_Guild_Flag_Hello(eventid, player, object)
	local locid = GetLocationId(player)
	player:GossipClearMenu()
	player:GossipMenuAddItem(1,"Join "..GWARZ[locid].guild_name..".",0,10)
	player:GossipMenuAddItem(1,"Nevermind.",0,11)
	player:GossipSendMenu(1, object)
end

function Gwarz_Guild_Flag_Select(eventid, player, object, sender, intid, code)
local locid = GetLocationId(player)
	if (intid == 10) then
		GetGuildByName(GWARZ[locid].guild_name):AddMember(player, 255) -- attempts to add the new member at lowest(255) guild level.
	end
	if (intid == 11) then
	end
player:GossipComplete()
end

RegisterGameObjectGossipEvent(GWCOMM["SERVER"].flag_id, 2, Gwarz_Guild_Flag_Select)
RegisterGameObjectGossipEvent(GWCOMM["SERVER"].flag_id+1, 2, Gwarz_Guild_Flag_Select)

-- *********** Guild Guard combat actions *************
-- these are just basic scripts for the guards. if some one can script a good guard script with the idea in mind to keep them from the flag. I would love to add it.

local function FactionReset(event, timer, cycle, player)
	
	player:SetFaction(GGW[player:GetAccountId()].faction)
end


local function PigWatch(eventid, creature, player)

local LocId = GetLocationId(player)

	if(player:GetObjectType()=="Player")then
	
	local Pteam = GGW[player:GetAccountId()].team
	local LocId = GetLocationId(player)
	
		if(LocId == nil)then
			LocId = CreateLocation(player:GetMapId(), player:GetAreaId(), player:GetZoneId())
		end
	
		if(player:IsInGuild()==true)then

			if((Pteam~=GWARZ[LocId].team)and(player:GetGuildName()~=GWARZ[LocId].guild_name))or((GWCOMM["SERVER"].anarchy==1)and(Pteam==GWARZ[LocId].team)and(player:GetGuildName()~=GWARZ[LocId].guild_name))then
	
				if(GWARZ[LocId].team < 2)then

					if(creature:IsWithinDistInMap(player, 40))then
						
						if(GWARZ[LocId].team==0)then -- ally faction 84 team 0 ::  horde faction 83 team 1
							player:SetFaction(2) -- 83
							local faction_reset = player:RegisterEvent(FactionReset, 10000, 1)
						else
							player:SetFaction(1) -- 84
							local faction_reset = player:RegisterEvent(FactionReset, 10000, 1)
						end
					end
				else
				end
			else
			end
		else
		end
	else
	end
end

RegisterCreatureEvent(GWCOMM["SERVER"].pig_id, 27, PigWatch)
RegisterCreatureEvent(GWCOMM["SERVER"].pig_id+1, 27, PigWatch)

function Guardffa(eventid, creature, player)

	if(player:GetObjectType()=="Player")then
	
	local Pteam = GGW[player:GetAccountId()].team
	local LocId = GetLocationId(player)
	
		if(LocId == nil)then
			LocId = CreateLocation(player:GetMapId(), player:GetAreaId(), player:GetZoneId())
		end
	
		if(player:IsInGuild()==true)then
		
			if((Pteam~=GWARZ[LocId].team)and(player:GetGuildName()~=GWARZ[LocId].guild_name))or((GWCOMM["SERVER"].anarchy==1)and(Pteam==GWARZ[LocId].team)and(player:GetGuildName()~=GWARZ[LocId].guild_name))then
		
				if(GWARZ[LocId].team < 2)then
		
					if(creature:IsWithinDistInMap(player, 40))then
						
						if(GWARZ[LocId].team==0)then -- ally faction 84 team 0 ::  horde faction 83 team 1
							player:SetFaction(2) -- 83
							local faction_reset = player:RegisterEvent(FactionReset, 10000, 1)
							creature:AttackStart(player)
						else
							player:SetFaction(1) -- 84
							local faction_reset = player:RegisterEvent(FactionReset, 10000, 1)
							creature:AttackStart(player)
						end
					end
				else
				end
			else
			end
		else
		end
	else
	end
end

RegisterCreatureEvent(GWCOMM["SERVER"].guard_id, 27, Guardffa)
RegisterCreatureEvent(GWCOMM["SERVER"].guard_id+1, 27, Guardffa)

function Guardcombat(eventid, creature, player)

	if(player:GetObjectType()=="Player")then

		local LocId = GetLocationId(creature)
		
		if(LocId == nil)then
			LocId = CreateLocation(creature:GetMapId(), creature:GetAreaId(), creature:GetZoneId())
		end
		
		for _, v in ipairs(GetPlayersInWorld()) do
	
			if(v and v:GetGuildName()==GWARZ[LocId].guild_name) then
				v:SendBroadcastMessage("|cffff0000!!LOCATION "..GWARZ[LocId].entry.." IS UNDER ATTACK!!|r")
			end
		end
	end
end

RegisterCreatureEvent(GWCOMM["SERVER"].guard_id, 1, Guardcombat)
RegisterCreatureEvent(GWCOMM["SERVER"].guard_id+1, 1, Guardcombat)

function Guarddied(eventid, creature, player)
	
	local LocId = GetLocationId(creature)
	
	PreparedStatements(2, "creature", creature:GetGUIDLow())
	PreparedStatements(1, "guard_count", GWARZ[LocId].guard_count-1, LocId)
	
	local Drop = (math.random(1, 4))
	
	for _, v in ipairs(GetPlayersInWorld()) do
		
		if(v and v:GetGuildName()==GWARZ[LocId].guild_name) then
			v:SendBroadcastMessage("|cffcc0000!! I HAVE FAILED AT DEFENDING LOCATION "..LocId.." !!|r")
		end
	end
	
	if(Drop==4)then
		player:AddItem(Guard_Died_Drop, math.random(1, 4))
	end
	
	creature:DespawnOrUnsummon()
end

RegisterCreatureEvent(GWCOMM["SERVER"].guard_id, 4, Guarddied)
RegisterCreatureEvent(GWCOMM["SERVER"].guard_id+1, 4, Guarddied)

function Guardhit(eventid, creature, attacker, damage)

	if(attacker:GetObjectType()=="Player")then

		local LocId = GetLocationId(creature)
	
		if(LocId == nil)then
			LocId = CreateLocation(creature:GetMapId(), creature:GetAreaId(), creature:GetZoneId())
		end
	
		if(attacker:GetObjectType()=="Player")then
			local a = (math.random(1, 4))
			
			if(a==4)then
				
				for _, v in ipairs(GetPlayersInWorld()) do
					
					if(v and v:GetGuildName()==GWARZ[LocId].guild_name) then
						v:SendBroadcastMessage("|cffff0000!!HURRY!! I NEED ASSISTANCE AT LOCATION "..LocId.."...!!HURRY!!|r")
					end
				end
			end
		end
	end
end

RegisterCreatureEvent(GWCOMM["SERVER"].guard_id, 9, Guardhit)
RegisterCreatureEvent(GWCOMM["SERVER"].guard_id+1, 9, Guardhit)

function Guardkill(eventid, creature, victim)
	
	local LocId = GetLocationId(creature)
	
	for _, v in ipairs(GetPlayersInWorld()) do
		
		if(v and v:GetGuildName()==GWARZ[LocId].guild_name) then
			
			v:SendBroadcastMessage("|cff00cc00!! I HAVE KILLED A "..victim:GetObjectType().." INTRUDEING AT LOCATION "..GWARZ[LocId].entry.." !!|r")
			v:SendBroadcastMessage("|cff00cc00I found some gold on him.|r")
			v:ModifyMoney(math.random(100000, 1000000))
		end
	end
end

RegisterCreatureEvent(GWCOMM["SERVER"].guard_id, 3, Guardkill)
RegisterCreatureEvent(GWCOMM["SERVER"].guard_id+1, 3, Guardkill)

-- ****************************************************
-- ******************** End OF Line ******************* 
-- ****************************************************

print ("PVP core: "..pvp_version.."")
print ("GUILD WARZ ver: "..GW_version.." Loaded.")
local duration = (string.format("Load Time: %0.03f seconds.", os.clock() - start));
print(duration)
print("-----------------------------------\n") 

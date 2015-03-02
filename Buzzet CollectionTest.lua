--[[
This script is made by _NiP_ aka Buzzet. Buzzet isn't my LoL Char name. For any Support, send me a message on the BoL Forum or add me on Skype: Buzzet13
--]] 
--[[
Changelog

-V1.1  Uses only 1 Potion at the time
-V1.1.1 Now on ScriptStatus

--]]

assert(load(Base64Decode("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"), nil, "bt", _ENV))() ScriptStatus("UHKILIKJJHN") 

local version = "1.11"

local DaPipexAsheUpdate = true
local UPDATE_HOST = "raw.github.com"
local UPDATE_PATH = "/DaPipex/BoL_Scripts/master/PippyAshe.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = SCRIPT_PATH..GetCurrentEnv().FILE_NAME
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH

function OnLoad()
	
	PrintChat ("Buzzet's Collection 1.1.1 (1.03.15) loaded")
	
	
	--Menu
	Config = scriptConfig("AutoExhaust", "bheal")
	Config:addParam("exhaust", "Auto Exhaust", SCRIPT_PARAM_ONOFF, true)
	Config:addParam("se", "HP when Exhaust will be used (%)", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
	HPHeal = scriptConfig("AutoHeal", "bheal")
	HPHeal:addParam("heal", "Auto Heal", SCRIPT_PARAM_ONOFF, true)
	HPHeal:addParam("hp", "Hp when AutoHeal will be used (%)", SCRIPT_PARAM_SLICE, 15, 0, 100, 0)
	PotConfig = scriptConfig("AutoPot", "apot")
	PotConfig:addParam("healpot", "Health Potion Use", SCRIPT_PARAM_ONOFF, true)
	PotConfig:addParam("hphealpot", "HP for Health Potion (%)", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
	ManaConfig = scriptConfig("AutoMana", "apot")
	ManaConfig:addParam("manapot", "Health Potion Use", SCRIPT_PARAM_ONOFF, true)
	ManaConfig:addParam("mmanapot", "HP for Health Potion (%)", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
	
	ts = TargetSelector(TARGET_MOST_AD, 650)
	
end
 
 
myHero = GetMyHero()




function OnTick() 
	
	-- Mana Potion
	if not TargetHaveBuff( "FlaskOfCrystalWater" , myHero) then
		
		if (ManaConfig.manapot) then
			
			if (myHero.mana/myHero.maxMana < ManaConfig.mmanapot/100) then
				
				CastSpell(ITEM_2)
			
			end
				
		end
			
	end
	
	
	--HP Potion
	if not TargetHaveBuff( "RegenerationPotion" , myHero) then
		if (PotConfig.healpot) then
			if (myHero.health/myHero.maxHealth < PotConfig.hphealpot/100) then
			
				
				--CastItem(2003)
				CastSpell(ITEM_1)
					
			
			end
			
		end
	
	end
	--Summoner Heal
	if (HPHeal.heal) then
		
		if (myHero.health/myHero.maxHealth < HPHeal.hp/100) then
		
			if (myHero:CanUseSpell(SUMMONER_2) == READY) then
			
				CastSpell(SUMMONER_2)
				
					
			end
			
		end
		
	end
	-- Summoner Exhaust
	ts:update()
	
	if (ts.target ~= nil) then
		
		if (ts.target.health/ts.target.maxHealth < Config.se/100) then
		
			if (Config.exhaust) then
		
				if (myHero:CanUseSpell(SUMMONER_1) == READY) then
			
					CastSpell(SUMMONER_1, ts.target)
				
				end
				
			end
		
		end	
		
	end

end
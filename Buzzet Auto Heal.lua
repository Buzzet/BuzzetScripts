--[[
This script is made by _NiP_ aka Buzzet. Buzzet isn't my LoL Char name. For any Support, send me a message on the BoL Forum or add me on Skype: Buzzet13
--]]
function OnLoad()
	
	PrintChat ("Buzzet's AutoHeal Version 1.0 (24.02.15) loaded")
	
	
	--Menu
	Config = scriptConfig("AutoHeal", "bheal")
	Config:addParam("heal", "Auto Heal", SCRIPT_PARAM_ONOFF, true)
	Config:addParam("hp", "Hp when AutoHeal will be used (%)", SCRIPT_PARAM_SLICE, 15, 0, 100, 0)
	
	
end
 
 
myHero = GetMyHero()



function OnTick() --HP for SUMMONER_2
	
	
	if (Config.heal) then
		
		if (myHero.health/myHero.maxHealth < Config.hp/100) then
		
			if (myHero:CanUseSpell(SUMMONER_2) == READY) then
			
				CastSpell(SUMMONER_2)
				
					
			end
			
		end
		
	end
	
end
	
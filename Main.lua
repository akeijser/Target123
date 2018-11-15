-- This file is loaded from "target123.toc"

SLASH_TEST1 = "/t123"
SlashCmdList["TEST"] = function(msg)
  if IsAddOnLoaded("target123") == false then
    print("Waiting for saved variables to load")
    return
  end  
  BuildMainFrameTarget123()
end 

local MacroBuilder = MacroBuilder:new()
local f = CreateFrame("Frame")
f:SetScript("OnEvent",function(self,event, ...)

  if event=="PLAYER_REGEN_ENABLED" then
    self:UnregisterEvent("PLAYER_REGEN_ENABLED")
  elseif InCombatLockdown() then
    self:RegisterEvent("PLAYER_REGEN_ENABLED")
    return -- in combat, come back when combat ends
  end

  --create savedConfig in case of first load
  if savedConfig == nil or savedConfig == '' then 
    savedConfig = {}
  end  
 
  local _,instanceType = GetInstanceInfo()
  local pvp = instanceType == "arena" or instanceType =="pvp"
  if pvp then
    pvp = instanceType
  else 
    pvp = "pve"
  end  

  local currentSpec = GetSpecialization()
  local currentSpecName = currentSpec and select(2, GetSpecializationInfo(currentSpec)) or "None"

  MacroBuilder:EditMacrosForInstanceType(pvp, currentSpecName)

end)
f:RegisterEvent("PLAYER_ENTERING_WORLD")


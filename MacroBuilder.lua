--This file is dedicated to Making / Editing the Macros

--Create macro if it does not exist
local function CreateIfNil(macroName, isMacroInCharacterSheet)

	if GetMacroIndexByName(macroName) == 0 then
		-- set icon and general/character_flag
		local iconName = defaultTargetMacroIconMap[macroName] or "INV_MISC_QUESTIONMARK"
		if isMacroInCharacterSheet == true then 
			characterMacro = 1
		else
			characterMacro = nil
		end	
		CreateMacro(macroName, iconName, "" , characterMacro)
	end	
end

--Macro builder class
MacroBuilder = {};
MacroBuilder.__index = MacroBuilder;    -- Set the __index parameter to reference MacroBuilder

--This class is super specific for the purpose of this addon
--bad practice, lazy coding, but fuck it
function MacroBuilder:new()
  local self = {};         -- Create a blank table
  setmetatable(self, MacroBuilder); -- Set the metatable so we used MacroBuilder's __index
  return self;             -- Return the instance
end
 
--find all default config for instance type, and replace it when there is savedConfig for the button
--if button name == "spell", make/edit macros for all spells in spec list
function MacroBuilder:EditMacrosForInstanceType(instanceType, spec)

	local newTable = defaultConfig[instanceType]
	if savedConfig[instanceType] == nil then
		savedConfig[instanceType] = {}
	end
		
	for k, v in pairs (savedConfig[instanceType]) do
		newTable[k] = v
	end	

	--Create/Edit target macros on account level
	for buttonName, macro in pairs(newTable) do
		local macroString = ""

		--Create/Edit Spell macros (on character level)
		if buttonName == "spell" then
			for _,spellName in pairs(crowdControlSpells[spec]) do
				macroString = string.gsub(macro, "spell", spellName)
				CreateIfNil(spellName, true)
				EditMacro(GetMacroIndexByName(spellName),nil,nil,macroString)
			end	
		else
			CreateIfNil(buttonName, false)
			EditMacro(GetMacroIndexByName(buttonName),nil,nil,macro)
		end	
	end	
end	





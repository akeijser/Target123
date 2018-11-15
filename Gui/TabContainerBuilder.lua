local AceGUI = LibStub("AceGUI-3.0")

--build EditBoxes that display the macros and allow the user to change them
local function buildEditBox(instanceType, buttonName, macro, container)
  local macro = macro

  --prevent NVE when looking up savedConfig
  if savedConfig[instanceType] == nil then
    savedConfig[instanceType] = {}
  end
 
  if savedConfig[instanceType][buttonName] then
    macro = savedConfig[instanceType][buttonName]
  end
      
  local editBox = AceGUI:Create("MultiLineEditBox")
  editBox:SetLabel(buttonName)
  editBox:SetWidth(500)
  editBox:SetNumLines(4)
  editBox:SetMaxLetters(255)
  editBox:SetText(macro)
  editBox:SetCallback("OnEnterPressed", function(widget, event, text) 
    savedConfig[instanceType][buttonName] = text 
    end)
  return editBox
end  

--TabContainerBuilder class
TabContainerBuilder = {};
TabContainerBuilder.__index = TabContainerBuilder;    -- Set the __index parameter to reference TabContainerBuilder

function TabContainerBuilder:new(container)
  local self = {};         -- Create a blank table
  self.container = container
  setmetatable(self, TabContainerBuilder); -- Set the metatable so we used TabContainerBuilder's __index
  return self;             -- Return the instance
end

function TabContainerBuilder:DrawTab(instanceType)

  --empty table for sorting
  a = {}
  -- add keys that need to be sorted
  for k in pairs(defaultConfig[instanceType]) do
    table.insert(a, k)
  end
  
  --sort keys
  table.sort( a )

  --for keys(buttonName) create an edditBox
  for _,buttonName in pairs(a) do
    self.container:AddChild(buildEditBox(instanceType, buttonName, defaultConfig[instanceType][buttonName], container))
  end    
end 


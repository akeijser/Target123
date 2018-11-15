local AceGUI = LibStub("AceGUI-3.0")
local TabContainer

-- Callback function for OnGroupSelected
local function SelectGroup(container, event, group)
    container:ReleaseChildren()
    TabContainer:DrawTab(group)
end

function BuildMainFrameTarget123()
	-- Create the frame container
	local frame = AceGUI:Create("Frame")
	frame:SetTitle("Target 123")
	frame:SetStatusText("Target123.. all your targeting needs")
	frame:SetCallback("OnClose", function(widget) AceGUI:Release(widget) end)
	-- Fill Layout - the TabGroup widget will fill the whole frame
	frame:SetLayout("Fill")
  	frame:SetHeight(600)

	-- Create the TabGroup
	local tab =  AceGUI:Create("TabGroup")
	tab:SetLayout("Flow")
	-- Setup which tabs to show
	tab:SetTabs({{text="Arena", value="arena"}, {text="BattleGrounds", value="pvp"}, {text="Pve", value="pve"}})
	-- SetUp TabcontainerBuilder
	TabContainer = TabContainerBuilder:new(tab)
	-- Register callback
	tab:SetCallback("OnGroupSelected", SelectGroup)
	-- Set initial Tab (this will fire the OnGroupSelected callback)
	tab:SelectTab("arena")
	-- add to the frame container
	frame:AddChild(tab)
end






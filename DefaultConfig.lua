defaultConfig = {
    ["arena"] = {
		["target1"] = [[/target [nomod] arena1
/focus [mod] arena1]], 
      	["target2"] = [[/target [nomod] arena2
/focus [mod] arena2]],
      	["target3"] = [[/target [nomod] arena3
/focus [mod] arena1]],
		["spell"] = [[#showtooptip
/use [mod, @focus, exists, harm, nodead][nomod, @target] spell]] --arena
    },
    ["pvp"] = {
      ["target1"] = [[/focus [mod, @mouseover, exists, nodead]
/targetenemyplayer]],
      ["target2"] = [[/focus [mod, @mouseover, exists, nodead]
/targetenemyplayer direction true]],
      ["target3"] = [[/focus [mod, @mouseover, exists, nodead]
/targetlastenemy]],
		["spell"] = [[#showtooptip
/use [mod, @mouseover, exists, harm, nodead][mod, @focus, exists, harm, nodead][nomod, @target] spell]]
    },
    ["pve"] = {
      	["target1"] = [[/focus [mod, @mouseover, exists, nodead]
/targetenemy]],
      	["target2"] = [[/focus [mod, @mouseover, exists, nodead]
/targetenemy direction true]],
      	["target3"] = [[/focus [mod,@mouseover, exists, nodead]
/targetlastenemy]],
	  	["spell"] = [[#showtooptip
/use [mod, @mouseover, exists, harm, nodead][mod, @focus, exists, harm, nodead][nomod, @target] spell]] 
    }
}

function defaultConfigSorted()

	local defaultConfig = defaultConfig
	table.sort(defaultConfig, function(a,b) return a < b end)
	for k,_ in pairs(defaultConfig) do
		table.sort( defaultConfig[k], function(a,b) return a < b end ) 
		for k,_ in pairs(defaultConfig[k]) do
			print(k)
		end	
	end	

end

--map icons to target macros
defaultTargetMacroIconMap = {
	["target1"] = "2178518" ,
	["target2"] = "2178519",
	["target3"] = "2178520"
}


--change this so it takes boolean for possible friendly spells
crowdControlSpells = {
	["Outlaw"] = {
		"blind", 
		"gouge",
		"between the eyes",
		"sap",
		"kick",
		"cheap shot"
	},
	["Assassination"] = {
		"blind",
		"kidney shot",
		"sap",
		"kick",
		"cheap shot",
		"garrote"
	},
	["Assassination"] = {
		"blind",
		"kidney shot",
		"sap",
		"kick",
		"cheap shot",
	},
	["Unholy"] = {
		"mind freeze",
		"death grip",
		"asphyxiate",
		"leap",
		"gnaw",
		"chains of ice",
		"dark simulacrum"
	}

}


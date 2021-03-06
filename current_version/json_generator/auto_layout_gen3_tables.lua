--file for large tables; used by rng v2.0

--these 32-value tables are for fast indexing of RNG values
--the RNG is a linear congruential generator with modulus 2^32
--x<-0x41C64E6D*x+0x6073
--because the modulus is a power of two
--it is very easy to find the index
--only takes O(log n) time (where n is the number of possible RNG states)
--in general, it is unreasonable to calculate the index of an RNG without lookup tables
--one can use lookup tables to find indices in O(1) time
--however for this RNG, it takes up way too much space (16GB)

multspa={
 0x41C64E6D, 0xC2A29A69, 0xEE067F11, 0xCFDDDF21,
 0x5F748241, 0x8B2E1481, 0x76006901, 0x1711D201,
 0xBE67A401, 0xDDDF4801, 0x3FFE9001, 0x90FD2001,
 0x65FA4001, 0xDBF48001, 0xF7E90001, 0xEFD20001,
 0xDFA40001, 0xBF480001, 0x7E900001, 0xFD200001,
 0xFA400001, 0xF4800001, 0xE9000001, 0xD2000001,
 0xA4000001, 0x48000001, 0x90000001, 0x20000001,
 0x40000001, 0x80000001, 0x00000001, 0x00000001}

multspb={
 0x00006073, 0xE97E7B6A, 0x31B0DDE4, 0x67DBB608,
 0xCBA72510, 0x1D29AE20, 0xBA84EC40, 0x79F01880,
 0x08793100, 0x6B566200, 0x803CC400, 0xA6B98800,
 0xE6731000, 0x30E62000, 0xF1CC4000, 0x23988000,
 0x47310000, 0x8E620000, 0x1CC40000, 0x39880000,
 0x73100000, 0xE6200000, 0xCC400000, 0x98800000,
 0x31000000, 0x62000000, 0xC4000000, 0x88000000,
 0x10000000, 0x20000000, 0x40000000, 0x80000000}

multspc={
 0x00003039, 0xD3DC167E, 0xD6651C2C, 0xCD1DCF18,
 0x65136930, 0x642B7E60, 0x1935ACC0, 0xB6461980,
 0x1EF73300, 0x1F9A6600, 0x85E4CC00, 0x26899800,
 0xB8133000, 0x1C266000, 0xE84CC000, 0x90998000,
 0x21330000, 0x42660000, 0x84CC0000, 0x09980000,
 0x13300000, 0x26600000, 0x4CC00000, 0x99800000,
 0x33000000, 0x66000000, 0xCC000000, 0x98000000,
 0x30000000, 0x60000000, 0xC0000000, 0x80000000}

--for data sorting (GAEM)
growthtbl={1,1,1,1,1,1, 2,2,3,4,3,4, 2,2,3,4,3,4, 2,2,3,4,3,4}
attacktbl={2,2,3,4,3,4, 1,1,1,1,1,1, 3,4,2,2,4,3, 3,4,2,2,4,3}
efforttbl={3,4,2,2,4,3, 3,4,2,2,4,3, 1,1,1,1,1,1, 4,3,4,3,2,2}
misctbl  ={4,3,4,3,2,2, 4,3,4,3,2,2, 4,3,4,3,2,2, 1,1,1,1,1,1}

-- Pokemon list

pokemontbl={"Bulbasaur", "Ivysaur", "Venusaur", "Charmander", "Charmeleon", "Charizard", 						--   6
			"Squirtle", "Wartortle", "Blastoise", "Caterpie", "Metapod", "Butterfree", 							--  12	
			"Weedle", "Kakuna", "Beedrill", "Pidgey", "Pidgeotto", "Pidgeot", "Rattata", "Raticate",			--  20
			"Spearow", "Fearow", "Ekans", "Arbok", "Pikachu", "Raichu", "Sandshrew", "Sandslash",				--  28
			"Nidoran???", "Nidorina", "Nidoqueen", "Nidoran???", "Nidorino", "Nidoking",							--  34
			"Clefairy", "Clefable", "Vulpix", "Ninetales", "Jigglypuff", "Wigglytuff",							--  40
			"Zubat", "Golbat", "Oddish", "Gloom", "Vileplume", "Paras", "Parasect", "Venonat", "Venomoth",		--  49
			"Diglett", "Dugtrio", "Meowth", "Persian", "Psyduck", "Golduck", "Mankey", "Primeape",				--  57
			"Growlithe", "Arcanine", "Poliwag", "Poliwhirl", "Poliwrath", "Abra", "Kadabra", "Alakazam",		--  65
			"Machop", "Machoke", "Machamp", "Bellsprout", "Weepinbell", "Victreebel", "Tentacool", "Tentacruel",--  73
			"Geodude", "Graveler", "Golem", "Ponyta", "Rapidash", "Slowpoke", "Slowbro",						--  80
			"Magnemite", "Magneton", "Farfetch'd", "Doduo", "Dodrio", "Seel", "Dewgong", "Grimer", "Muk",		--  89
			"Shellder", "Cloyster", "Gastly", "Haunter", "Gengar", "Onix", "Drowzee", "Hypno",					--  97
			"Krabby", "Kingler", "Voltorb", "Electrode", "Exeggcute", "Exeggutor", "Cubone", "Marowak",			-- 105
			"Hitmonlee", "Hitmonchan", "Lickitung", "Koffing", "Weezing", "Rhyhorn", "Rhydon", "Chansey",		-- 113
			"Tangela", "Kangaskhan", "Horsea", "Seadra", "Goldeen", "Seaking", "Staryu", "Starmie",				-- 121
			"Mr. Mime", "Scyther", "Jynx", "Electabuzz", "Magmar", "Pinsir", "Tauros", "Magikarp", "Gyarados",	-- 130
			"Lapras", "Ditto", "Eevee", "Vaporeon", "Jolteon", "Flareon", "Porygon", "Omanyte", "Omastar",		-- 139
			"Kabuto", "Kabutops", "Aerodactyl", "Snorlax", "Articuno", "Zapdos", "Moltres",						-- 146
			"Dratini", "Dragonair", "Dragonite", "Mewtwo", "Mew",												-- 151

			"Chikorita", "Bayleef", "Meganium", "Cyndaquil", "Quilava", "Typhlosion",							-- 157
			"Totodile", "Croconaw", "Feraligatr", "Sentret", "Furret", "Hoothoot", "Noctowl",					-- 164
			"Ledyba", "Ledian", "Spinarak", "Ariados", "Crobat", "Chinchou", "Lanturn", "Pichu", "Cleffa",		-- 173
			"Igglybuff", "Togepi", "Togetic", "Natu", "Xatu", "Mareep", "Flaaffy", "Ampharos", "Bellossom",		-- 182
			"Marill", "Azumarill", "Sudowoodo", "Politoed", "Hoppip", "Skiploom", "Jumpluff", "Aipom",			-- 190
			"Sunkern", "Sunflora", "Yanma", "Wooper", "Quagsire", "Espeon", "Umbreon", "Murkrow", "Slowking",	-- 199
			"Misdreavus", "Unown", "Wobbuffet", "Girafarig", "Pineco", "Forretress", "Dunsparce", "Gligar",		-- 207
			"Steelix", "Snubbull", "Granbull", "Qwilfish", "Scizor", "Shuckle", "Heracross", "Sneasel",			-- 215
			"Teddiursa", "Ursaring", "Slugma", "Magcargo", "Swinub", "Piloswine", "Corsola", "Remoraid", 		-- 223
			"Octillery", "Delibird", "Mantine", "Skarmory", "Houndour", "Houndoom", "Kingdra", "Phanpy", 		-- 231
			"Donphan", "Porygon2", "Stantler", "Smeargle", "Tyrogue", "Hitmontop", "Smoochum", "Elekid", 		-- 239
			"Magby", "Miltank", "Blissey", "Raikou", "Entei", "Suicune", "Larvitar", "Pupitar", "Tyranitar", 	-- 248
			"Lugia", "Ho-Oh", "Celebi",																			-- 251
			
			"none","none","none","none","none",
			"none","none","none","none","none",
			"none","none","none","none","none",
			"none","none","none","none","none",
			"none","none","none","none","none",																	-- 276
			
			"Treecko", "Grovyle", "Sceptile", "Torchic", "Combusken", "Blaziken", "Mudkip", "Marshtomp",		-- 284
			"Swampert", "Poochyena", "Mightyena", "Zigzagoon", "Linoone", "Wurmple", "Silcoon", "Beautifly", 	-- 292
			"Cascoon", "Dustox", "Lotad", "Lombre", "Ludicolo", "Seedot", "Nuzleaf", "Shiftry", "Nincada", 		-- 301
			"Ninjask", "Shedinja", "Taillow", "Swellow", "Shroomish", "Breloom", "Spinda", "Wingull", 			-- 309
			"Pelipper", "Surskit", "Masquerain", "Wailmer", "Wailord", "Skitty", "Delcatty", "Kecleon", 		-- 317
			"Baltoy", "Claydol", "Nosepass", "Torkoal", "Sableye", "Barboach", "Whiscash", "Luvdisc", 			-- 325
			"Corphish", "Crawdaunt", "Feebas", "Milotic", "Carvanha", "Sharpedo", "Trapinch", "Vibrava", 		-- 333
			"Flygon", "Makuhita", "Hariyama", "Electrike", "Manectric", "Numel", "Camerupt", "Spheal", "Sealeo",-- 342
			"Walrein", "Cacnea", "Cacturne", "Snorunt", "Glalie", "Lunatone", "Solrock", "Azurill", "Spoink", 	-- 351
			"Grumpig", "Plusle", "Minun", "Mawile", "Meditite", "Medicham", "Swablu", "Altaria", "Wynaut", 		-- 360
			"Duskull", "Dusclops", "Roselia", "Slakoth", "Vigoroth", "Slaking", "Gulpin", "Swalot", "Tropius", 	-- 369
			"Whismur", "Loudred", "Exploud", "Clamperl", "Huntail", "Gorebyss", "Absol", "Shuppet", "Banette", 	-- 378
			"Seviper", "Zangoose", "Relicanth", "Aron", "Lairon", "Aggron", "Castform", "Volbeat", "Illumise", 	-- 387
			"Lileep", "Cradily", "Anorith", "Armaldo", "Ralts", "Kirlia", "Gardevoir", "Bagon", "Shelgon", 		-- 396
			"Salamence", "Beldum", "Metang", "Metagross", "Regirock", "Regice", "Registeel", "Kyogre", 			-- 404
			"Groudon", "Rayquaza", "Latias", "Latios", "Jirachi", "Deoxys", "Chimecho",							-- 411
			
			"Unown","Unown","Unown","Unown","Unown",
			"Unown","Unown","Unown","Unown","Unown",
			"Unown","Unown","Unown","Unown","Unown",
			"Unown","Unown","Unown","Unown","Unown",
			"Unown","Unown","Unown","Unown","Unown",
			"Unown","Unown"}
			
--Move list

movetbl={   "Pound", "Karate Chop", "DoubleSlap", "Comet Punch", "Mega Punch", "Pay Day",
			"Fire Punch", "Ice Punch", "ThunderPunch", "Scratch", "ViceGrip", "Guillotine",
			"Razor Wind", "Swords Dance", "Cut", "Gust", "Wing Attack", "Whirlwind", "Fly",
			"Bind", "Slam", "Vine Whip", "Stomp", "Double Kick", "Mega Kick", "Jump Kick",
			"Rolling Kick", "Sand-Attack", "Headbutt", "Horn Attack", "Fury Attack",
			"Horn Drill", "Tackle", "Body Slam", "Wrap", "Take Down", "Thrash", "Double-Edge",
			"Tail Whip", "Poison Sting", "Twineedle", "Pin Missile", "Leer", "Bite", "Growl",
			"Roar", "Sing", "Supersonic", "SonicBoom", "Disable", "Acid", "Ember",
			"Flamethrower", "Mist", "Water Gun", "Hydro Pump", "Surf", "Ice Beam", "Blizzard",
			"Psybeam", "BubbleBeam", "Aurora Beam", "Hyper Beam", "Peck", "Drill Peck",
			"Submission", "Low Kick", "Counter", "Seismic Toss", "Strength", "Absorb",
			"Mega Drain", "Leech Seed", "Growth", "Razor Leaf", "SolarBeam", "PoisonPowder",
			"Stun Spore", "Sleep Powder", "Petal Dance", "String Shot", "Dragon Rage",
			"Fire Spin", "ThunderShock", "Thunderbolt", "Thunder Wave", "Thunder", "Rock Throw",
			"Earthquake", "Fissure", "Dig", "Toxic", "Confusion", "Psychic", "Hypnosis",
			"Meditate", "Agility", "Quick Attack", "Rage", "Teleport", "Night Shade", "Mimic",
			"Screech", "Double Team", "Recover", "Harden", "Minimize", "SmokeScreen",
			"Confuse Ray", "Withdraw", "Defense Curl", "Barrier", "Light Screen", "Haze",
			"Reflect", "Focus Energy", "Bide", "Metronome", "Mirror Move", "Selfdestruct",
			"Egg Bomb", "Lick", "Smog", "Sludge", "Bone Club", "Fire Blast", "Waterfall",
			"Clamp", "Swift", "Skull Bash", "Spike Cannon", "Constrict", "Amnesia", "Kinesis",
			"Softboiled", "Hi Jump Kick", "Glare", "Dream Eater", "Poison Gas", "Barrage",
			"Leech Life", "Lovely Kiss", "Sky Attack", "Transform", "Bubble", "Dizzy Punch",
			"Spore", "Flash", "Psywave", "Splash", "Acid Armor", "Crabhammer", "Explosion",
			"Fury Swipes", "Bonemerang", "Rest", "Rock Slide", "Hyper Fang", "Sharpen", 
			"Conversion", "Tri Attack", "Super Fang", "Slash", "Substitute", "Struggle",
			"Sketch", "Triple Kick", "Thief", "Spider Web", "Mind Reader", "Nightmare",
			"Flame Wheel", "Snore", "Curse", "Flail", "Conversion 2", "Aeroblast",
			"Cotton Spore", "Reversal", "Spite", "Powder Snow", "Protect", "Mach Punch",
			"Scary Face", "Faint Attack", "Sweet Kiss", "Belly Drum", "Sludge Bomb",
			"Mud-Slap", "Octazooka", "Spikes", "Zap Cannon", "Foresight", "Destiny Bond",
			"Perish Song", "Icy Wind", "Detect", "Bone Rush", "Lock-On", "Outrage", "Sandstorm",
			"Giga Drain", "Endure", "Charm", "Rollout", "False Swipe", "Swagger", "Milk Drink",
			"Spark", "Fury Cutter", "Steel Wing", "Mean Look", "Attract", "Sleep Talk",
			"Heal Bell", "Return", "Present", "Frustration", "Safeguard", "Pain Split",
			"Sacred Fire", "Magnitude", "DynamicPunch", "Megahorn", "DragonBreath",
			"Baton Pass", "Encore", "Pursuit", "Rapid Spin", "Sweet Scent", "Iron Tail",
			"Metal Claw", "Vital Throw", "Morning Sun", "Synthesis", "Moonlight", "Hidden Power",
			"Cross Chop", "Twister", "Rain Dance", "Sunny Day", "Crunch", "Mirror Coat",
			"Psych Up", "ExtremeSpeed", "AncientPower", "Shadow Ball", "Future Sight",
			"Rock Smash", "Whirlpool", "Beat Up", "Fake Out", "Uproar", "Stockpile", "Spit Up",
			"Swallow", "Heat Wave", "Hail", "Torment", "Flatter", "Will-O-Wisp", "Memento",
			"Facade", "Focus Punch", "SmellingSalt", "Follow Me", "Nature Power", "Charge",
			"Taunt", "Helping Hand", "Trick", "Role Play", "Wish", "Assist", "Ingrain",
			"Superpower", "Magic Coat", "Recycle", "Revenge", "Brick Break", "Yawn", "Knock Off",
			"Endeavor", "Eruption", "Skill Swap", "Imprison", "Refresh", "Grudge", "Snatch",
			"Secret Power", "Dive", "Arm Thrust", "Camouflage", "Tail Glow", "Luster Purge",
			"Mist Ball", "FeatherDance", "Teeter Dance", "Blaze Kick", "Mud Sport", "Ice Ball",
			"Needle Arm", "Slack Off", "Hyper Voice", "Poison Fang", "Crush Claw", "Blast Burn",
			"Hydro Cannon", "Meteor Mash", "Astonish", "Weather Ball", "Aromatherapy",
			"Fake Tears", "Air Cutter", "Overheat", "Odor Sleuth", "Rock Tomb", "Silver Wind",
			"Metal Sound", "GrassWhistle", "Tickle", "Cosmic Power", "Water Spout",
			"Signal Beam", "Shadow Punch", "Extrasensory", "Sky Uppercut", "Sand Tomb",
			"Sheer Cold", "Muddy Water", "Bullet Seed", "Aerial Ace", "Icicle Spear",
			"Iron Defense", "Block", "Howl", "Dragon Claw", "Frenzy Plant", "Bulk Up",
			"Bounce", "Mud Shot", "Poison Tail", "Covet", "Volt Tackle", "Magical Leaf",
			"Water Sport", "Calm Mind", "Leaf Blade", "Dragon Dance", "Rock Blast",
			"Shock Wave", "Water Pulse", "Doom Desire", "Psycho Boost"}
				
characterTable = {}

-- numbers
for i = 161, 171 do
	characterTable[i] = string.char(i - 161 + 48)
end

-- capital letters
for i = 187, 212 do
	characterTable[i] = string.char(i - 187 + 65)
end

-- lowercase letters
for i = 213, 239 do
	characterTable[i] = string.char(i - 213 + 97)
end

characterTable[0] = " "
characterTable[171] = "!"
characterTable[172] = "?"
characterTable[173] = "."
characterTable[174] = "-"
characterTable[175] = "???"
characterTable[176] = ".."
characterTable[177] = "???"
characterTable[178] = "???"
characterTable[179] = "???"
characterTable[180] = "???"
characterTable[181] = "???"
characterTable[182] = "???"
characterTable[184] = ","
characterTable[185] = "??"
characterTable[186] = "/"
characterTable[240] = ":"
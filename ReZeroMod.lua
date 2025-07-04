
----------------------------------------------
------------MOD CODE -------------------------
ReZeroMod = {}

ReZeroMod.config = SMODS.current_mod.config

assert(SMODS.load_file("Config_tab.lua"))()

SMODS.Atlas({
	key = "modicon",
	path = "icon.png",
	px = 32,
	py = 32
})

Filename = "ReZero_Tarot-Balatro_v12.png"

if ReZeroMod.config.enable_tarot_skin then
	SMODS.Atlas{
		key = "Tarot",
		path = Filename,
		px = 71,
		py = 95,
		atlas_table = 'ASSET_ATLAS',
		prefix_config = { key = false }
	}
end

if ReZeroMod.config.enable_planet_skin then
	SMODS.Atlas{
		key = "Planet",
		path = Filename,
		px = 71,
		py = 95,
		atlas_table = 'ASSET_ATLAS',
		prefix_config = { key = false }
	}
end

if ReZeroMod.config.enable_spectral_skin then
	SMODS.Atlas{
		key = "Spectral",
		path = Filename,
		px = 71,
		py = 95,
		atlas_table = 'ASSET_ATLAS',
		prefix_config = { key = false }
	}
end

if ReZeroMod.config.enable_sound_effect then
	SMODS.Sound{

		path = {
		default= 'Witches_call.ogg'
		},
	key="call",
	replace = "whoosh1",
	pitch = 1,
	volume = 1
	}
end

if ReZeroMod.config.enable_joker_skin then
	SMODS.Atlas{
		key = "Joker",
		path = "Jokers_Subaru_v3.png",
		px = 71,
		py = 95,
		atlas_table = 'ASSET_ATLAS',
		prefix_config = { key = false }
	}
end



----------------------------------------------
------------MOD CODE END----------------------
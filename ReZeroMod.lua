
----------------------------------------------
------------MOD CODE -------------------------
ReZeroMod = {}

ReZeroMod.config = SMODS.current_mod.config

assert(SMODS.load_file("Config_tab.lua"))()

-- Colors and stuff like that
local color_change = SMODS.Gradient({
    key="change",
    colours = {
        HEX("232329"),
        HEX("dd9237")
    },
	cycle = 5,
	interpolation = 'trig'
})


G.C.CLRS = {
	RBDJKR = HEX("967bb6")
}

-- https://github.com/nh6574/JoyousSpring/blob/main/src/globals.lua#L71
local loc_colour_ref = loc_colour 
---@diagnostic disable-next-line: lowercase-global
function loc_colour(_c, _default)
    if not G.ARGS.LOC_COLOURS then
        loc_colour_ref()
    end
    G.ARGS.LOC_COLOURS.clr_rbd = G.C.CLRS.RBDJKR

    return loc_colour_ref(_c, _default)
end

-- Mod Badge color change
SMODS.current_mod.badge_colour = color_change

-- Mr. Bones saves counter
local cie_ref = SMODS.calculate_individual_effect
SMODS.calculate_individual_effect = function(effect, scored_card, key, amount, from_edition)
  if key == 'saved' then
    G.GAME.deaths = (G.GAME.deaths or 0) + 1
  end
  return cie_ref(effect, scored_card, key, amount, from_edition)
end

-- Atlas
SMODS.Atlas {
	key = "jokers",
	path = "RBD-redo-x2.png",
	px = 71,
	py = 95
}

SMODS.Atlas({
	key = "modicon",
	path = "icon.png",
	px = 32,
	py = 32
})

-- Textures/Sounds changes
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

if ReZeroMod.config.enable_decks_skin then
	SMODS.Atlas{
		key = "centers",
		path = "ReZero_Enhancers-Sins_v5.png",
		px = 71,
		py = 95,
		atlas_table = 'ASSET_ATLAS',
		prefix_config = { key = false }
	}
end

-- Jokers
SMODS.Joker {
    key = 'rbdj',
    loc_txt = {
        name = '{C:clr_rbd}Return By Death{}',
        text = {
			{
			"Creates {C:attention}Mr. Bones{} when",
			"{C:attention}Boss Blind{} is selected.",
			"{C:inactive}(Must have room){}",
			},
			{
			"Gain {X:mult,C:white} X#1# {} Mult everytime",
			"{C:attention}Mr. Bones{} is used.",
			"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
			},
        }
    },
    blueprint_compat = true,
    rarity = 4,
    cost = 20,
	atlas = 'jokers',
    pos = { x = 0, y = 0 },
    config = { extra = { xmult = 1, xmult_gain = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult_gain,1 + (G.GAME.deaths or 0) } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then 
			return { xmult = 1 + (G.GAME.deaths or 0) }
		end
		if context.setting_blind and context.blind.boss then
			if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then 
				SMODS.add_card({key = "j_mr_bones"})
			end
        end
    end,
}

----------------------------------------------
------------MOD CODE END----------------------
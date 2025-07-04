SMODS.current_mod.config_tab = function()
    return {
        n = G.UIT.ROOT,
        config = { r = 0.1, minw = 8, align = "tm", padding = 0.2, colour = G.C.BLACK },
        nodes = {
            {
                n = G.UIT.R,
                config = { padding = 0.2 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { align = "cm" },
                        nodes = {
                            {
                                n = G.UIT.R,
                                config = { align = "cm", padding = 0.01 },
                                nodes = {
                                    create_toggle({
                                        label = 'Enable ReZero Tarot card skin',
                                        ref_table = ReZeroMod.config,
                                        ref_value = 'enable_tarot_skin',
                                    })
                                }
                            },
                            {
                                n = G.UIT.R,
                                config = { align = "cm", padding = 0.01 },
                                nodes = {
                                    create_toggle({
                                        label = 'Enable ReZero Planet card skin',
                                        ref_table = ReZeroMod.config,
                                        ref_value = 'enable_planet_skin'
                                    })
                                }
                            },
                            {
                                n = G.UIT.R,
                                config = { align = "cm", padding = 0.01 },
                                nodes = {
                                    create_toggle({
                                        label = 'Enable ReZero Spectral card skin',
                                        ref_table = ReZeroMod.config,
                                        ref_value = 'enable_spectral_skin'
                                    })
                                }
                            },
							                            {
                                n = G.UIT.R,
                                config = { align = "cm", padding = 0.01 },
                                nodes = {
                                    create_toggle({
                                        label = 'Enable ReZero Joker skins',
                                        ref_table = ReZeroMod.config,
                                        ref_value = 'enable_joker_skin'
                                    })
                                }
                            },
                            {
                                n = G.UIT.R,
                                config = { align = "cm", padding = 0.01 },
                                nodes = {
                                    create_toggle({
                                        label = 'Enable ReZero Sound effect',
                                        ref_table = ReZeroMod.config,
                                        ref_value = 'enable_sound_effect'
                                    })
                                }
                            },
                        }
                    },
                }
            },
        }
    }
end
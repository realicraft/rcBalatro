-- borrowed (and modified) from Paperback (specifically https://github.com/Balatro-Paperback/paperback/blob/main/content/joker/rock_candy.lua )
SMODS.Joker {
    key = 'frayed_wires',
    config = {
        extra = {
            mult = 8,
            odds = 4,
            suit = "rcb_thunders"
        }
    },
    rarity = 1,
    pos = { x = 0, y = 3 },
    atlas = 'rc_jokers',
    cost = 6,
    order = 20,
    blueprint_compat = true,
    eternal_compat = false,
    yes_pool_flag = "frayed_wires_can_spawn",
    pools = {
        Food = true
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                G.GAME.probabilities.normal,
                card.ability.extra.odds,
                localize(card.ability.extra.suit, 'suits_plural')
            }
        }
    end,
    calculate = function(self, card, context)
        -- Give the mult during play if card is a [Thunder]
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit(card.ability.extra.suit) then
                return {
                    mult = card.ability.extra.mult,
                    card = card
                }
            end
        end
        -- Check if the Joker needs to be eaten
        if context.end_of_round and not context.blueprint and context.main_eval then
            if pseudorandom("frayed_wres") < G.GAME.probabilities.normal / card.ability.extra.odds then
                PB_UTIL.destroy_joker(card, function()
                    -- Remove [Frayed Wires] from the pool
                    G.GAME.pool_flags.frayed_wires_can_spawn = false

                    -- Create [Empty Insulation]
                    SMODS.add_card {
                        key = 'j_rcb_wire_stick',
                        edition = card.edition
                    }
                end)
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.MULT
                }
            else
                return {
                    message = localize('k_safe_ex'),
                    colour = G.C.CHIPS
                }
            end
        end
    end,
    in_pool = function(self, args)
        return rcBalatro.vars.special_suits, {allow_duplicates = false}
    end
}
-- borrowed (and modified) from Paperback (specifically https://github.com/Balatro-Paperback/paperback/blob/main/content/joker/rockin_stick.lua )
SMODS.Joker {
    key = 'wire_stick',
    config = {
        extra = {
            xMult = 1.25
        }
    },
    rarity = 1,
    pos = { x = 2, y = 3 },
    atlas = 'rc_jokers',
    cost = 7,
    order = 22,
    blueprint_compat = true,
    eternal_compat = true,
    yes_pool_flag = "sticks_can_spawn",
    loc_vars = function(self, info_queue, card)
        local xMult = PB_UTIL.calculate_stick_xMult(card)

        return {
            vars = {
                card.ability.extra.xMult,
                xMult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local xMult = PB_UTIL.calculate_stick_xMult(card)

            if xMult ~= 1 then
                return {
                    x_mult = xMult,
                    card = card
                }
            end
        end
    end
}
-- borrowed (and modified) from Paperback (specifically https://github.com/Balatro-Paperback/paperback/blob/main/content/joker/rock_candy.lua )
SMODS.Joker {
    key = 'yogurt_tube',
    config = {
        extra = {
            mult = 8,
            odds = 4,
            suit = "rcb_waters"
        }
    },
    rarity = 1,
    pos = { x = 1, y = 3 },
    atlas = 'rc_jokers',
    cost = 6,
    order = 21,
    blueprint_compat = true,
    eternal_compat = false,
    yes_pool_flag = "yogurt_tube_can_spawn",
    pools = {
        Food = true
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                G.GAME.probabilities.normal,
                card.ability.extra.odds,
                localize(card.ability.extra.suit, 'suits_plural')
            }
        }
    end,
    calculate = function(self, card, context)
        -- Give the mult during play if card is a [Water]
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit(card.ability.extra.suit) then
                return {
                    mult = card.ability.extra.mult,
                    card = card
                }
            end
        end
        -- Check if the Joker needs to be eaten
        if context.end_of_round and not context.blueprint and context.main_eval then
            if pseudorandom("yogurt_tube") < G.GAME.probabilities.normal / card.ability.extra.odds then
                PB_UTIL.destroy_joker(card, function()
                    -- Remove [Yogurt Tube] from the pool
                    G.GAME.pool_flags.yogurt_tube_can_spawn = false

                    -- Create [Empty Tube]
                    SMODS.add_card {
                        key = 'j_rcb_yogurt_stick',
                        edition = card.edition
                    }
                end)
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.MULT
                }
            else
                return {
                    message = localize('k_safe_ex'),
                    colour = G.C.CHIPS
                }
            end
        end
    end,
    in_pool = function(self, args)
        return rcBalatro.vars.special_suits, {allow_duplicates = false}
    end
}
-- borrowed (and modified) from Paperback (specifically https://github.com/Balatro-Paperback/paperback/blob/main/content/joker/rockin_stick.lua )
SMODS.Joker {
    key = 'yogurt_stick',
    config = {
        extra = {
            xMult = 1.25
        }
    },
    rarity = 1,
    pos = { x = 3, y = 3 },
    atlas = 'rc_jokers',
    cost = 7,
    order = 23,
    blueprint_compat = true,
    eternal_compat = true,
    yes_pool_flag = "sticks_can_spawn",
    loc_vars = function(self, info_queue, card)
        local xMult = PB_UTIL.calculate_stick_xMult(card)

        return {
            vars = {
                card.ability.extra.xMult,
                xMult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local xMult = PB_UTIL.calculate_stick_xMult(card)

            if xMult ~= 1 then
                return {
                    x_mult = xMult,
                    card = card
                }
            end
        end
    end
}
-- borrowed (and modified) from Paperback (specifically https://github.com/Balatro-Paperback/paperback/blob/main/content/joker/autumn_leaves.lua )
SMODS.Joker {
    key = "sunflower_plain",
    config = {
        extra = {
            xMult = 1.06,
            xMult_gain = 0.06,
            xMult_base = 1.06,
            suit = "rcb_thunders",
        }
    },
    rarity = 1,
    pos = { x = 4, y = 3 },
    atlas = "rc_jokers",
    cost = 6,
    order = 24,
    blueprint_compat = true,
    eternal_compat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xMult_base,
                card.ability.extra.xMult_gain,
                localize(card.ability.extra.suit, 'suits_plural')
            }
        }
    end,
    calculate = function(self, card, context)
        return PB_UTIL.panorama_logic(card, context)
    end,
    in_pool = function(self, args)
        return rcBalatro.vars.special_suits, {allow_duplicates = false}
    end
}
-- borrowed (and modified) from Paperback (specifically https://github.com/Balatro-Paperback/paperback/blob/main/content/joker/autumn_leaves.lua )
SMODS.Joker {
    key = "hidden_pond",
    config = {
        extra = {
            xMult = 1.06,
            xMult_gain = 0.06,
            xMult_base = 1.06,
            suit = "rcb_waters",
        }
    },
    rarity = 1,
    pos = { x = 5, y = 3 },
    atlas = "rc_jokers",
    cost = 6,
    order = 25,
    blueprint_compat = true,
    eternal_compat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xMult_base,
                card.ability.extra.xMult_gain,
                localize(card.ability.extra.suit, 'suits_plural')
            }
        }
    end,
    calculate = function(self, card, context)
        return PB_UTIL.panorama_logic(card, context)
    end,
    in_pool = function(self, args)
        return rcBalatro.vars.special_suits, {allow_duplicates = false}
    end
}
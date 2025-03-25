-- reference to https://www.tumblr.com/negativepeanuthoarder/764643121324769280/love-is-what-makes-us-human-actually-its
SMODS.Joker {
    key = 'select_all',
    config = { extra = { chips = 250 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    rarity = 2,
    atlas = 'rc_jokers',
    pos = { x = 0, y = 1 },
    cost = 6,
    order = 7,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and rcBalatro.isAce(context.other_card) and BalatroSim.has_alignment("", context.other_card, "bs_rc_align_water") then
            return {
                chips = card.ability.extra.chips,
                message_card = context.other_card
            }
        end
    end
}
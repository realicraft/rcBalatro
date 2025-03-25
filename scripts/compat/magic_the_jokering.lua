SMODS.Joker {
    key = 'moss_clump',
    config = { extra = { count = 2, suit = "mtg_Clovers", hands = 4 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.count, localize(card.ability.extra.suit, 'suits_plural'), card.ability.extra.hands } }
    end,
    rarity = 3,
    atlas = 'rc_jokers',
    pos = { x = 2, y = 4 },
    cost = 8,
    order = 28,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.before then
            local cards = {}
            local card_indexes = {}
            while ((#cards < card.ability.extra.count) and (#cards < #context.scoring_hand)) do
                local index = math.floor(pseudorandom("moss_clump_index")*(#context.scoring_hand)) + 1
                local valid = true
                for _,v in pairs(card_indexes) do
                    if v == index then
                        valid = false
                    end
                end
                if valid then
                    table.insert(card_indexes, index)
                    table.insert(cards, context.scoring_hand[index])
                end
            end
            for _,v in pairs(cards) do
                SMODS.change_base(v, card.ability.extra.suit)
                SMODS.calculate_effect({
                    message = localize('rcb_notice_mossed'),
                    colour = G.C.GREEN
                }, v)
            end
        end
        if context.after and not context.blueprint then
            card.ability.extra.hands = card.ability.extra.hands - 1
            if (card.ability.extra.hands <= 0) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                            func = function()
                                G.jokers:remove_card(card)
                                card:remove()
                                card = nil
                            return true; end}))
                        return true
                    end
                }))
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.FILTER
                }
            end
        end
    end,
}
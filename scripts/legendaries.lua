SMODS.Joker {
    key = 'stingy',
    config = { extra = { base = 2, per = 3, current = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.base, card.ability.extra.per, card.ability.extra.current } }
    end,
    rarity = 4,
    atlas = 'rc_legendaries',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 0, y = 1 },
    cost = 20,
    order = 12,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers and not context.blueprint then
            local has = {mailbox = false, sign = false, balloon = false, june = false}
            for _,v in pairs(G.jokers.cards) do
                if v.config.center.key == "j_rcb_mailbox" then
                    has.mailbox = true
                end
                if v.config.center.key == "j_rcb_triagonal_sign" then
                    has.sign = true
                end
                if v.config.center.key == "j_rcb_blue_balloon" then
                    has.balloon = true
                end
                if v.config.center.key == "j_rcb_june" then
                    has.june = true
                end
            end
            card.ability.extra.current = card.ability.extra.base
            for _,v in pairs(has) do
                if v then
                    card.ability.extra.current = card.ability.extra.current + card.ability.extra.per
                end
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.current
            }
        end
    end
}
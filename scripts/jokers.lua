SMODS.Joker {
    key = 'ace_joker',
    config = { extra = { mult = 8 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    rarity = 2,
    atlas = 'rc_jokers',
    pos = { x = 0, y = 0 },
    cost = 5,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and rcBalatro.isAce(context.other_card) then
            return {
                mult = card.ability.extra.mult,
                message_card = context.other_card
            }
        end
    end
}

SMODS.Joker {
    key = 'world_wide',
    config = { extra = { mult = 4, current = 16 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.current } }
    end,
    rarity = 3,
    atlas = 'rc_jokers',
    pos = { x = 1, y = 0 },
    cost = 7,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.joker_main then -- only update ace count when needed - reduces lag
            local aces = 0;
            for _,v in pairs(G.play.cards) do -- at this point, the 'full deck' is split into four different cardareas
                if rcBalatro.isAce(v) then
                    aces = aces + 1
                end
            end
            for _,v in pairs(G.hand.cards) do
                if rcBalatro.isAce(v) then
                    aces = aces + 1
                end
            end
            for _,v in pairs(G.discard.cards) do
                if rcBalatro.isAce(v) then
                    aces = aces + 1
                end
            end
            for _,v in pairs(G.deck.cards) do
                if rcBalatro.isAce(v) then
                    aces = aces + 1
                end
            end
            card.ability.extra.current = card.ability.extra.mult * aces
            return {
                mult = card.ability.extra.current
            }
        end
    end
}

SMODS.Joker {
    key = 'garlic_bread',
    config = { extra = { hands = 4 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.hands } }
    end,
    rarity = 2,
    atlas = 'rc_jokers',
    pos = { x = 2, y = 0 },
    cost = 4,
    blueprint_compat = true,
    eternal_compat = false,
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers and not context.blueprint then
            local valid = {}
            for _,v in pairs(context.scoring_hand) do
                if not rcBalatro.isAce(v) then
                    valid[#valid+1] = v
                end
            end
            if #valid > 0 then
                local target = pseudorandom_element(valid, pseudoseed("garlic_bread"))
                --[[G.E_MANAGER:add_event(Event({
                    func = function()
                        target:flip()
                        SMODS.change_base(target, nil, 'Ace')
                        target:flip()
                        return true
                    end
                }))--]]
                SMODS.change_base(target, nil, 'Ace')
                SMODS.calculate_effect({message = localize("rcb_notice_aced")}, target)
            end
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
    end
}

SMODS.Joker {
    key = 'identity_quiz',
    config = { extra = { chance = 1, rate = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME and G.GAME.probabilities.normal*card.ability.extra.chance or card.ability.extra.chance, card.ability.extra.rate } }
    end,
    rarity = 3,
    atlas = 'rc_jokers',
    pos = { x = 3, y = 0 },
    cost = 8,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers then
            for _,v in pairs(context.scoring_hand) do
                if not rcBalatro.isAce(v) and v:is_face() then
                    if pseudorandom('identity_quiz') < ((G.GAME and G.GAME.probabilities.normal*card.ability.extra.chance or card.ability.extra.chance) / card.ability.extra.rate) then
                        local target = v
                        --[[G.E_MANAGER:add_event(Event({
                            func = function()
                                target:flip()
                                SMODS.change_base(target, nil, 'Ace')
                                target:flip()
                                return true
                            end
                        }))--]]
                        SMODS.change_base(target, nil, 'Ace')
                        SMODS.calculate_effect({message = localize("rcb_notice_aced")}, target)
                    end
                end
            end
        end
    end
}

SMODS.Joker {
    key = 'ace_ring',
    config = { extra = { chips = 50 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    rarity = 2,
    atlas = 'rc_jokers',
    pos = { x = 4, y = 0 },
    cost = 5,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and rcBalatro.isAce(context.other_card) then
            return {
                chips = card.ability.extra.chips,
                message_card = context.other_card
            }
        end
    end
}

SMODS.Joker {
    key = 'zucchini',
    config = { extra = { chips = 15, hands = 3, count = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.hands } }
    end,
    rarity = 2,
    atlas = 'rc_jokers',
    pos = { x = 5, y = 0 },
    cost = 5,
    blueprint_compat = true,
    eternal_compat = false,
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers then
            card.ability.extra.count = 0
            for _,v in pairs(context.scoring_hand) do
                if rcBalatro.isAce(v) then
                    card.ability.extra.count = card.ability.extra.count + 1
                end
            end
        end
        if context.individual and context.cardarea == G.play and rcBalatro.isAce(context.other_card) then
            return {
                chips = card.ability.extra.chips * (card.ability.extra.count - 1), -- scored card doesn't count
                message_card = context.other_card
            }
        end
        if context.after and context.cardarea == G.jokers then
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
    end
}

SMODS.Joker {
    key = 'mailbox',
    config = { extra = { money = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.current_round.rcb_mailbox.rank, card.ability.extra.money } }
    end,
    rarity = 2,
    atlas = 'rc_jokers',
    pos = { x = 2, y = 1 },
    cost = 5,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card and context.other_card.base.value == G.GAME.current_round.rcb_mailbox.rank then
            return {
                dollars = card.ability.extra.money,
                message_card = context.other_card
            }
        end
    end
}

local igo = Game.init_game_object
function Game:init_game_object()
	local ret = igo(self)
	ret.current_round.rcb_mailbox = { rank = 'Ace' }
	return ret
end

SMODS.Joker {
    key = 'triagonal_sign',
    config = { extra = { Xmult = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult } }
    end,
    rarity = 3,
    atlas = 'rc_jokers',
    pos = { x = 3, y = 1 },
    cost = 7,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.joker_main then
            if (#context.full_hand == 3) then
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}

SMODS.Joker {
    key = 'blue_balloon',
    config = { extra = { chips = 10, hands = 5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.hands } }
    end,
    rarity = 1,
    atlas = 'rc_jokers',
    pos = { x = 4, y = 1 },
    cost = 4,
    blueprint_compat = true,
    eternal_compat = false,
    calculate = function(self, card, context)
        -- borrowed from the SMODS wiki (specifically https://github.com/Steamodded/Wiki/blob/master/Perma-bonuses.md?plain=1#L28C9-L35C12 )
        if context.individual and context.cardarea == G.play then
            context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
            context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + card.ability.extra.chips
            return {
                extra = { message = localize('k_upgrade_ex'), colour = G.C.CHIPS },
                card = card
            }
        end
        if context.after and context.cardarea == G.jokers then
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
                    message = localize('rcb_notice_popped'),
                    colour = G.C.CHIPS
                }
            end
        end
    end
}

SMODS.Joker {
    key = 'june',
    config = { extra = { mult = 6 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult * (((os.date("*t", os.time()))["month"] == 6) and 2 or 1) } }
    end,
    rarity = 2,
    atlas = 'rc_jokers',
    pos = { x = 5, y = 1 },
    cost = 6,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 6 then
            return {
                mult = card.ability.extra.mult * (((os.date("*t", os.time()))["month"] == 6) and 2 or 1), -- gives double mult in june
                message_card = context.other_card
            }
        end
    end
}

SMODS.Joker {
    key = 'fortune_cookie',
    config = { extra = { cards = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards } }
    end,
    rarity = 2,
    atlas = 'rc_jokers',
    pos = { x = 1, y = 1 },
    cost = 5,
    blueprint_compat = false,
    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.ability.set == "Tarot" and not context.consumeable.beginning_end and not context.repetition and not context.blueprint then
            local hand = nil
            -- borrowed from Cryptid (specifically https://github.com/MathIsFun0/Cryptid/blob/main/Items/Planets.lua#L830C1-L853C4 )
            local chosen_hand
            while (hand == nil) do
                chosen_hand = pseudorandom_element(G.handlist, pseudoseed("fortunecookie"))
                if G.GAME.hands[chosen_hand].visible then
                    hand = chosen_hand
                end
            end
            -- also borrowed from Cryptid (specifically https://github.com/MathIsFun0/Cryptid/blob/main/Items/Planets.lua#L811C1-L829C4 )
            update_hand_text(
                { sound = "button", volume = 0.7, pitch = 0.8, delay = 0.3 },
                {
                    handname = localize(hand, "poker_hands"),
                    chips = G.GAME.hands[hand].chips,
                    mult = G.GAME.hands[hand].mult,
                    level = G.GAME.hands[hand].level,
                }
            )
            level_up_hand(card, hand, nil, 1)
            update_hand_text(
                { sound = "button", volume = 0.7, pitch = 1.1, delay = 0 },
                { mult = 0, chips = 0, handname = "", level = "" }
            )
            card.ability.extra.cards = card.ability.extra.cards - 1
            if (card.ability.extra.cards <= 0) then
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
    end
}
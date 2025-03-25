SMODS.Consumable {
	set = "Tarot",
	key = "lightning",
	pos = { x = 0, y = 0 },
	config = { max_highlighted = 3, suit_conv = "rcb_thunders" },
	atlas = "rc_consumables",
	loc_vars = function(self, info_queue)
		return { vars = { self.config.max_highlighted, localize(self.config.suit_conv, 'suits_plural')} }
	end,
    can_use = function(self, card)
        if G.hand and (#G.hand.highlighted >= 1) and (#G.hand.highlighted <= self.config.max_highlighted) then
            return true
        end
	end,
    cost = 3,
    use = function(self, card, area, copier)
        rcBalatro.vars.special_suits = true
        -- borrowed from Bunco (specifically https://github.com/Firch/Bunco/blob/main/Bunco.lua#L4686C9-L4707C19 )
        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.15, func = function()
                G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);
            return true end }))
        end
        delay(0.2)
        for i=1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function()
                G.hand.highlighted[i]:change_suit(self.config.suit_conv);
            return true end }))
        end
        for i=1, #G.hand.highlighted do
            local percent = 0.85 + ( i - 0.999 ) / ( #G.hand.highlighted - 0.998 ) * 0.3
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.15, func = function()
                G.hand.highlighted[i]:flip(); play_sound('tarot2', percent, 0.6); G.hand.highlighted[i]:juice_up(0.3, 0.3);
            return true end }))
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
            G.hand:unhighlight_all();
        return true end }))
        delay(0.5)
	end,
}

SMODS.Consumable {
	set = "Tarot",
	key = "flood",
	pos = { x = 1, y = 0 },
	config = { max_highlighted = 3, suit_conv = "rcb_waters" },
	atlas = "rc_consumables",
	loc_vars = function(self, info_queue)
		return { vars = { self.config.max_highlighted, localize(self.config.suit_conv, 'suits_plural')} }
	end,
    can_use = function(self, card)
        if G.hand and (#G.hand.highlighted >= 1) and (#G.hand.highlighted <= self.config.max_highlighted) then
            return true
        end
	end,
    cost = 3,
    use = function(self, card, area, copier)
        rcBalatro.vars.special_suits = true
        -- borrowed from Bunco (specifically https://github.com/Firch/Bunco/blob/main/Bunco.lua#L4686C9-L4707C19 )
        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.15, func = function()
                G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);
            return true end }))
        end
        delay(0.2)
        for i=1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function()
                G.hand.highlighted[i]:change_suit(self.config.suit_conv);
            return true end }))
        end
        for i=1, #G.hand.highlighted do
            local percent = 0.85 + ( i - 0.999 ) / ( #G.hand.highlighted - 0.998 ) * 0.3
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.15, func = function()
                G.hand.highlighted[i]:flip(); play_sound('tarot2', percent, 0.6); G.hand.highlighted[i]:juice_up(0.3, 0.3);
            return true end }))
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
            G.hand:unhighlight_all();
        return true end }))
        delay(0.5)
	end,
}
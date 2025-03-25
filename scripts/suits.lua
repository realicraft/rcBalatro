SMODS.Suit {
    key = "thunders",
    card_key = "TH",
    pos = {y = 0},
    ui_pos = {x = 0, y = 0},
    lc_atlas = 'rc_suits',
    hc_atlas = 'rc_suits_hc',
    lc_ui_atlas = 'rc_suits_ui',
    hc_ui_atlas = 'rc_suits_ui_hc',
    lc_colour = HEX("d19a19"),
    hc_colour = HEX("e3980e"),
    in_pool = function(self, args)
        if args and args.initial_deck then
            return false
        end
        return rcBalatro.vars.special_suits
    end
}

SMODS.Suit {
    key = "waters",
    card_key = "WT",
    pos = {y = 1},
    ui_pos = {x = 1, y = 0},
    lc_atlas = 'rc_suits',
    hc_atlas = 'rc_suits_hc',
    lc_ui_atlas = 'rc_suits_ui',
    hc_ui_atlas = 'rc_suits_ui_hc',
    lc_colour = HEX("3f4bb0"),
    hc_colour = HEX("3a6ecf"),
    in_pool = function(self, args)
        if args and args.initial_deck then
            return false
        end
        return rcBalatro.vars.special_suits
    end
}
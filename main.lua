-- GENERAL --

rcBalatro = SMODS.current_mod

rcBalatro.vars = {
    special_suits = false
}

-- ATLASES --

-- logo
SMODS.Atlas {
    key = "modicon",
	path = "logo.png",
	px = 32,
	py = 32
}

-- joker atlas
SMODS.Atlas {
    key = "rc_jokers",
    path = "jokers.png",
    px = 71,
    py = 95
}
-- legendary atlas
SMODS.Atlas {
    key = "rc_legendaries",
    path = "legendaries.png",
    px = 71,
    py = 95
}
-- suits atlases
SMODS.Atlas {
    key = "rc_suits",
    path = "suits.png",
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = "rc_suits_hc",
    path = "suits_hc.png",
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = "rc_suits_ui",
    path = "suits_ui.png",
    px = 18,
    py = 18
}
SMODS.Atlas {
    key = "rc_suits_ui_hc",
    path = "suits_ui_hc.png",
    px = 18,
    py = 18
}
-- consumables atlas
SMODS.Atlas {
    key = "rc_consumables",
    path = "consumables.png",
    px = 71,
    py = 95
}
-- decks atlas
SMODS.Atlas {
    key = "rc_decks",
    path = "decks.png",
    px = 71,
    py = 95
}

-- COLORS --
G.C.SUITS.Thunders = HEX("d19a19")
G.C.SUITS.Waters = HEX("3f4bb0")
-- borrowed from Pokermon (specifically https://github.com/InertSteak/Pokermon/blob/main/pokesprites.lua#L268C1-L290C4 )
local old_colors = loc_colour
function loc_colour(_c, _default)
    if not G.ARGS.LOC_COLOURS then
        old_colors()
    end
    G.ARGS.LOC_COLOURS["rcb_thunders"] = G.C.SUITS.Thunders
    G.ARGS.LOC_COLOURS["rcb_waters"] = G.C.SUITS.Waters
    return old_colors(_c, _default)
end

-- FUNCTIONS --

rcBalatro.isAce = function(card)
    if card:get_id() == 14 then
        return true
    end
    return false
end

function SMODS.current_mod.reset_game_globals(run_start)
    if run_start then
        rcBalatro.vars.special_suits = false
    end
    -- borrowed from SMODS' example mods (specifically https://github.com/Steamodded/examples/blob/master/Mods/ExampleJokersMod/ModdedVanilla.lua#L554C1-L567C4 )
	G.GAME.current_round.rcb_mailbox = { rank = 'Ace' }
	local valid_mb_cards = {}
	for _, v in ipairs(G.playing_cards) do
		if not SMODS.has_no_rank(v) then
			valid_mb_cards[#valid_mb_cards + 1] = v
		end
	end
	if valid_mb_cards[1] then
		local mailbox_card = pseudorandom_element(valid_mb_cards, pseudoseed('mailbox' .. G.GAME.round_resets.ante))
		G.GAME.current_round.rcb_mailbox.rank = mailbox_card.base.value
	end
end

-- SUITS --
assert(SMODS.load_file('scripts/suits.lua'))()
rcBLib.SuitPairs:add_pair("rcb_thunders", "rcb_waters")

-- JOKERS --
assert(SMODS.load_file('scripts/jokers.lua'))()
assert(SMODS.load_file('scripts/legendaries.lua'))()

-- CONSUMABLES --
assert(SMODS.load_file('scripts/consumables/tarots.lua'))()

-- COMPAT --
if (SMODS.Mods["balatrosim"] or {}).can_load then
    assert(SMODS.load_file('scripts/compat/balatrosim.lua'))()
end
if (SMODS.Mods["paperback"] or {}).can_load then
    assert(SMODS.load_file('scripts/compat/paperback.lua'))()
end
if (SMODS.Mods["magic_the_jokering"] or {}).can_load then
    assert(SMODS.load_file('scripts/compat/magic_the_jokering.lua'))()
end
if (SMODS.Mods["Cryptid"] or {}).can_load then
    assert(SMODS.load_file('scripts/compat/cryptid.lua'))()
end
if (SMODS.Mods["malverk"] or {}).can_load then
    assert(SMODS.load_file('scripts/compat/malverk.lua'))()
end
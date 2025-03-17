-- GENERAL --

rcBalatro = SMODS.current_mod

rcBalatro.vars = {}

-- ATLASES --

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

-- FUNCTIONS --

rcBalatro.isAce = function(card)
    if card:get_id() == 14 then
        return true
    end
    return false
end

function SMODS.current_mod.reset_game_globals(run_start)
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

-- JOKERS --
assert(SMODS.load_file('scripts/jokers.lua'))()
assert(SMODS.load_file('scripts/legendaries.lua'))()

-- COMPAT --
if (SMODS.Mods["balatrosim"] or {}).can_load then
    assert(SMODS.load_file('scripts/compat/balatrosim.lua'))()
end
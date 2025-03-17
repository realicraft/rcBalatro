return {
    descriptions = {
        --Back={},
        Blind={},
        --Edition={},
        Enhanced={},
        Joker={
            j_rcb_ace_joker = {
                name = "Ace Joker",
                text = {
                    "Played {C:attention}Aces{} give",
                    "{C:mult}+#1#{} Mult"
                }
            },
            j_rcb_world_wide = {
                name = "World Wide Ace",
                text = {
                    "{C:mult}+#1#{} Mult per {C:attention}Ace",
                    "in your {C:attention}full deck",
                    "{C:inactve}(Currently {C:mult}+#2#{C:inactive} Mult)",
                }
            },
            j_rcb_garlic_bread = {
                name = "Garlic Bread",
                text = {
                    "Each hand, converts one",
                    "scored card into an {C:attention}Ace{}",
                    "{C:inactive}({C:attention}#1#{C:inactive} hands remaining)"
                }
            },
            j_rcb_identity_quiz = {
                name = "Identity Quiz",
                text = {
                    "{C:green}#1# in #2#{} chance to convert scored",
                    "face cards into {C:attention}Ace{}s"
                }
            },
            j_rcb_ace_ring = {
                name = "Ace Ring",
                text = {
                    "Played {C:attention}Aces{} give",
                    "{C:chips}+#1#{} Chips"
                }
            },
            j_rcb_zucchini = {
                name = "Zucchini",
                text = {
                    "{C:attention}Ace{}s give {C:chips}+#1#{} Chips per",
                    "each other scored {C:attention}Ace{}",
                    "{C:inactive}({C:attention}#2#{C:inactive} hands remaining)"
                }
            },
            j_rcb_select_all = {
                name = "Select all images with boat",
                text = {
                    "{X:align_water,C:white}Water-Aligned{} {C:attention}Aces{} give an",
                    "extra {C:chips}+#1#{} Chips"
                }
            },
            j_rcb_mailbox = {
                name = "Mailbox",
                text = {
                    "Played {C:attention}#1#{}s give {C:money}$#2#{},",
                    "rank changes each round",
                    "",
                    "{C:inactive,s:0.8}\"This mailbox is mine...\""
                }
            },
            j_rcb_triagonal_sign = {
                name = "Triagonal Sign",
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played hand",
                    "contains exactly {C:attention}3{} cards",
                    "",
                    "{C:inactive,s:0.8}\"And this triagonal sign...\""
                }
            },
            j_rcb_blue_balloon = {
                name = "Blue Balloon",
                text = {
                    "Played cards gain {C:chips}+#1#{} Chips",
                    "Pops after {C:attention}#2#{} rounds",
                    "",
                    "{C:inactive,s:0.8}\"This blue balloon...\""
                }
            },
            j_rcb_june = {
                name = "Month of June",
                text = {
                    "{C:attention}6{}s, either played or in hand,",
                    "give {C:mult}+#1#{} Mult",
                    "",
                    "{C:inactive,s:0.8}\"The month of June...\""
                }
            },
            j_rcb_stingy = {
                name = "Stingy",
                text = {
                    "{X:mult,C:white}X#1#{} Mult, increases by {X:mult,C:white}+X#2#{} for",
                    "each of {C:attention}his{} Jokers you own",
                    "{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)",
                    "",
                    "{C:inactive,s:0.9}\"They're mine mine mine mine, mine!\""
                },
                unlock = {
					"Find this Joker from",
					"the {C:spectral}Soul{} card",
				},
            },
            j_rcb_fortune_cookie = {
                name = "Fortune Cookie",
                text = {
                    "The next {C:attention}#1# Tarot{} cards used will",
                    "level up one random hand"
                }
            },
        },
        Other={},
        --Planet={},
        Spectral={},
        --Stake={},
        --Tag={},
        --Tarot={},
        --Voucher={},
    },
    misc = {
        --achievement_descriptions={},
        --achievement_names={},
        --blind_states={},
        --challenge_names={},
        --collabs={},
        dictionary={
            rcb_notice_aced = "Aced!",
            rcb_notice_popped = "Popped!",
        },
        --high_scores={},
        labels={},
        --poker_hand_descriptions={},
        --poker_hands={},
        --quips={},
        --ranks={},
        --suits_plural={},
        --suits_singular={},
        --tutorial={},
        --v_dictionary={},
        --v_text={},
    },
}
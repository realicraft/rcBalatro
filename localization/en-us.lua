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
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
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
            j_rcb_static_joker = {
                name = "Static Joker",
                text = {
                    "Played cards with",
                    "{C:rcb_thunders}#2#{} suit give",
                    "{C:mult}+#1#{} Mult when scored",
                }
            },
            j_rcb_soaked_joker = {
                name = "Soaked Joker",
                text = {
                    "Played cards with",
                    "{C:rcb_waters}#2#{} suit give",
                    "{C:mult}+#1#{} Mult when scored",
                }
            },
            j_rcb_amber = {
                name = "Amber",
                text = {
                    "Played cards with",
                    "{C:rcb_thunders}#2#{} suit gain",
                    "{C:mult}+#1#{} Mult when scored",
                }
            },
            j_rcb_sapphire = {
                name = "Sapphire",
                text = {
                    "Played cards with",
                    "{C:rcb_waters}#2#{} suit gain",
                    "{C:chips}+#1#{} Chips when scored",
                }
            },
            j_rcb_lemon = {
                name = "Lemon",
                text = {
                    "Played cards with {C:rcb_thunders}#3#{}",
                    "suit give {C:chips}#1#{} Chips ",
                    "and {X:mult,C:white}X#2#{} Mult when scored",
                    "{C:inactive}({C:attention}#4#{C:inactive} hands remaining)"
                }
            },
            j_rcb_blueberries = {
                name = "Blueberries",
                text = {
                    "Played cards with {C:rcb_waters}#3#{}",
                    "suit give {C:chips}+#1#{} Chips ",
                    "and {C:mult}+#2#{} Mult when scored",
                    "{C:inactive}({C:attention}#4#{C:inactive} hands remaining)"
                }
            },
            j_rcb_frayed_wires = {
                name = "Frayed Wires",
                text = {
                    "Scored {C:rcb_thunders}#4#{} give {C:mult}+#1#{} Mult",
                    "{C:green}#2# in #3#{} chance this card is",
                    "eaten at end of round",
                }
            },
            j_rcb_yogurt_tube = {
                name = "Yogurt Tube",
                text = {
                    "Scored {C:rcb_waters}#4#{} give {C:mult}+#1#{} Mult",
                    "{C:green}#2# in #3#{} chance this card is",
                    "eaten at end of round",
                }
            },
            j_rcb_wire_stick = {
                name = "Empty Insulation",
                text = {
                    "Gives {X:mult,C:white}X#1#{} Mult for every",
                    "other {C:attention}\"Stick\"{} Joker you have...",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                }
            },
            j_rcb_yogurt_stick = {
                name = "Empty Tube",
                text = {
                    "Gives {X:mult,C:white}X#1#{} Mult for every",
                    "other {C:attention}\"Stick\"{} Joker you have...",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                }
            },
            j_rcb_sunflower_plain = {
                name = "Sunflower Plain",
                text = {
                    "{C:rcb_thunders}#3#{} give {X:mult,C:white}X#1#{} Mult when scored.",
                    "Increases by {X:mult,C:white}X#2#{} Mult for each ",
                    "consecutively scored {C:rcb_thunders}#3#{}",
                    "{C:inactive}(Resets after each hand played)",
                }
            },
            j_rcb_hidden_pond = {
                name = "Hidden Pond",
                text = {
                    "{C:rcb_waters}#3#{} give {X:mult,C:white}X#1#{} Mult when scored.",
                    "Increases by {X:mult,C:white}X#2#{} Mult for each ",
                    "consecutively scored {C:rcb_waters}#3#{}",
                    "{C:inactive}(Resets after each hand played)",
                }
            },
            j_rcb_suit_swap = {
                name = "Suit Swap",
                text = {
                    "Scored cards {C:attention}swap suits{}",
                    "after being scored",
                    "{C:inactive,s:0.8}({C:hearts,s:0.8}#1#{C:inactive,s:0.8} <-> {C:diamonds,s:0.8}#2#{C:inactive,s:0.8}){}",
                    "{C:inactive,s:0.8}({C:spades,s:0.8}#3#{C:inactive,s:0.8} <-> {C:clubs,s:0.8}#4#{C:inactive,s:0.8}){}",
                    "{C:inactive,s:0.8}({C:rcb_thunders,s:0.8}#5#{C:inactive,s:0.8} <-> {C:rcb_waters,s:0.8}#6#{C:inactive,s:0.8}){}",
                }
            },
            j_rcb_thunderstorm = {
                name = "Thunderstorm",
                text = {
                    "#1# random cards in the",
                    "{C:attention}first hand{} of the round",
                    "are converted into either",
                    "{C:rcb_thunders}#2#{} or {C:rcb_waters}#3#{}"
                }
            },
            j_rcb_moss_clump = {
                name = "Moss Clump",
                text = {
                    "Converts up to #1# random",
                    "scored cards into {C:clover}#2#{}",
                    "{C:inactive}({C:attention}#3#{C:inactive} hands remaining)"
                }
            },
        },
        Other={},
        --Planet={},
        Spectral={},
        --Stake={},
        --Tag={},
        Tarot={
            c_rcb_lightning = {
                name = "Lightning",
                text = {
                    "Converts up to",
                    "{C:attention}#1#{} selected cards",
                    "to {C:rcb_thunders}#2#{}",
                }
            },
            c_rcb_flood = {
                name = "Flood",
                text = {
                    "Converts up to",
                    "{C:attention}#1#{} selected cards",
                    "to {C:rcb_waters}#2#{}",
                }
            },
        },
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
            rcb_notice_suitswap = "Swapped!",
            rcb_notice_suited = "Suited!",
            rcb_notice_mossed = "Mossed!",
        },
        --high_scores={},
        labels={},
        --poker_hand_descriptions={},
        --poker_hands={},
        --quips={},
        --ranks={},
        suits_plural={
            rcb_thunders = "Thunders",
            rcb_waters = "Waters",
        },
        suits_singular={
            rcb_thunders = "Thunder",
            rcb_waters = "Water",
        },
        --tutorial={},
        --v_dictionary={},
        --v_text={},
    },
}